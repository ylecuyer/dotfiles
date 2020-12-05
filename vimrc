if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('kien/ctrlp.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('bogado/file-line')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')

  call dein#end()
  call dein#save_state()
endif

syntax on
filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

let mapleader = "ù"

" Echoes the fully qualified key of the current line in a YAML locale file.
" Credits to: airblade/vim-localorie
function! I18n_expand_key() abort
  let parts = []
  call add(parts, matchstr(getline('.'), '\v[^: ]+'))
  let indent = indent(line('.'))
  while indent > 0
    let indent -= 2
    let dedent = search('\v^\s{'. indent .'}\w', 'bnW')
    call add(parts, matchstr(getline(dedent), '\v[^: ]+'))
  endwhile
  if !empty(parts)
    echo join(reverse(parts), '.')
  endif
endfunction
nnoremap <silent> <leader>ek :call I18n_expand_key()<CR>
