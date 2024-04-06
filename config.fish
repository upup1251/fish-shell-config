# fish的问候语句,此处设空
function fish_greeting
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function yy  # change the dir when exit yazi
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function cd 
    builtin cd $argv
    echo $(pwd) > /home/upupup/.config/fish/last_dir
end

if test -f /home/upupup/.config/fish/last_dir
    cd (cat /home/upupup/.config/fish/last_dir)
end

#开启vi模式
fish_vi_key_bindings
#fish_defalut_key_bindings回到默认
#vi-mode下的样式展示
function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
#           echo [N]
        case insert
            set_color --bold green
            #            echo [I]
        case replace_one
            set_color --bold green
            #            echo [R]
        case visual
            set_color --bold brmagenta
            #echo [V]
        case '*'
            set_color --bold red
            #echo '?'
    end
    set_color normal
end
bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'
bind q 'exit'


#=======================================这里是别名
abbr blue bluetuith
abbr audio alsamixer
abbr ll "ls -al"
abbr jc javac
abbr j java

