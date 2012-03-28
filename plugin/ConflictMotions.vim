" ConflictMotions.vim: Motions to and inside SCM conflict markers.
"
" DEPENDENCIES:
"   - CountJump/Motion.vim autoload script
"   - CountJump/TextObject.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.002	28-Mar-2012	Make mappings configurable.
"				Change ix text object to iz.
"	001	12-Mar-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_ConflictMotions') || (v:version < 700)
    finish
endif
let g:loaded_ConflictMotions = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:ConflictMotions_ConflictBeginMapping')
    let g:ConflictMotions_ConflictBeginMapping = 'x'
endif
if ! exists('g:ConflictMotions_ConflictEndMapping')
    let g:ConflictMotions_ConflictEndMapping = 'X'
endif
if ! exists('g:ConflictMotions_MarkerMapping')
    let g:ConflictMotions_MarkerMapping = 'z'
endif

if ! exists('g:ConflictMotions_ConflictMapping')
    let g:ConflictMotions_ConflictMapping = 'x'
endif
if ! exists('g:ConflictMotions_SectionMapping')
    let g:ConflictMotions_SectionMapping = 'z'
endif


"- mappings --------------------------------------------------------------------

call CountJump#Motion#MakeBracketMotion('', g:ConflictMotions_ConflictBeginMapping, g:ConflictMotions_ConflictEndMapping, '^<\{7}<\@!', '^>\{7}>\@!', 0)
call CountJump#Motion#MakeBracketMotion('', g:ConflictMotions_MarkerMapping, '', '^\([<=>|]\)\{7}\1\@!', '', 0)

call CountJump#TextObject#MakeWithCountSearch('', g:ConflictMotions_ConflictMapping, 'a', 'V', '^<\{7}<\@!', '^>\{7}>\@!')
call CountJump#TextObject#MakeWithCountSearch('', g:ConflictMotions_SectionMapping, 'i', 'V', '^\([<=|]\)\{7}\1\@!', '^\([=>|]\)\{7}\1\@!')
call CountJump#TextObject#MakeWithCountSearch('', g:ConflictMotions_SectionMapping, 'a', 'V', '^\([<=|]\)\{7}\1\@!', '\ze\n\([=|]\)\{7}\1\@!\|^>\{7}>\@!')

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
