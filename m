Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154371180B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB3886A4;
	Thu, 25 May 2023 20:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C581B886A4;
 Thu, 25 May 2023 20:23:54 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-bacfcc7d1b2so136489276.2; 
 Thu, 25 May 2023 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685046233; x=1687638233;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HviupHnR7WlIt0Rt/kfjmoXdYBgnsdUIrSRqZRmkzYw=;
 b=lNFm/w/1b46/vCzqygOMNyN8KxAD1Hq5Yu06ACSJXS2BdYGwUuP1CwA5j7sveLbIC+
 6GiwCNlFi2EyaLrk6nFFa3i5DRQgA+hEZzpTLBqwi6bKgsehNOnpO29AMnHgbeLJWQb8
 7BZXX0ehDq8rzTU7AJSRqNbFvQME1RcnPg+M3MtznaGfQEpiPBMEx9DBOZ21ZMpUTJ/M
 RMEe6kCwVO7eYqApftzIeSK9rtoktLNqJxMLAUKG5HVB5NL7O1Tihfta/c8qgraopf19
 X/vpEkLYG4jpYskSaPsHFHZy9s6QwtTl20OzmkvRyT9r3/yHeFLL0Xf4ZnVUBaMKV+G0
 XACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685046233; x=1687638233;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HviupHnR7WlIt0Rt/kfjmoXdYBgnsdUIrSRqZRmkzYw=;
 b=fDO1hn+EtKF65ligDEXfoLPWhBdMf/P5YG6oYglzXw36Ne9f3OdIpeubeNrAHynbzz
 baJ6ehnuYpS/PsssuNwi1udfJqKa/i8PJg49GrQb/XHvOqlGKuvrO9lqc1Q4P6I85JEZ
 bB5cv8pSbFocNTM3PT0OGtjgM8ttC5b1lASE3kL5YSMUBn56RXp85hcIIr45jWk4Kln2
 YqAQuXzmujsjh54nHQxKbZ5mDTO8wOMKP9Z25bYVyG4PNuW9Ch+slDnWL5EHC8+1o0uv
 1J3UmqCiszMf4Jb9ZIjbMEQMdjiiIJC0ACd0E0/L8NZq2vKDsxcVxZI+dujgSrXDR0Z2
 nROg==
X-Gm-Message-State: AC+VfDzUoBmF18xfoZmV60kfyvQFfgUYggPse1MzdLzrrhFe51raIZM3
 e4VWPk1VsuHW2dNbw2KdkrqdZNnzljXgjSYpIbz6Ifm45Jn1sw==
X-Google-Smtp-Source: ACHHUZ6LtDSyP4LmayO+3/MeczcrtcnLu6NqOBuL3r0I3dP+pvxLbNatro8BhKZCH5MhErC1x/gZZFJi1TXtD2POT4s=
X-Received: by 2002:a81:8303:0:b0:561:b584:180f with SMTP id
 t3-20020a818303000000b00561b584180fmr779198ywf.30.1685046232802; Thu, 25 May
 2023 13:23:52 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 25 May 2023 22:23:16 +0200
Message-ID: <CA+1FSigK20ApfNTbJokd_uKfwueyk7wEYPg2QOLpHJ=0gK_bXw@mail.gmail.com>
Subject: libGL error: glx: failed to create dri2 screen libGL / error: failed
 to load driver: nouveau
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000022ec1e05fc8a66bd"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000022ec1e05fc8a66bd
Content-Type: text/plain; charset="UTF-8"

Hello.

I wrote this tutorial some time ago because I wanted that Blender was able
to recognize CUDA and the Nvidia driver directly within the linuxulator :

https://www.reddit.com/r/freebsd/comments/1118eae/how_to_install_the_nvidia_driver_5257801_cuda_12/

I was inspired by this tutorial :
https://gist.github.com/Mostly-BSD/4d3cacc0ee2f045ed8505005fd664c6e

someone found my tutorial and created this github :

https://github.com/spfcraze/Nvidia-Drivers-linux

He says that he created a Python script for updating Nvidia drivers on
CentOS 7 and Ubuntu. That's nice,but it can't work. Why ? please give a
look to an old post created by me some time ago and you will see :

https://www.reddit.com/r/freebsd/comments/11431bi/how_to_blacklist_the_nouveau_driver_within_the/

since the nouveau driver can't be blacklisted within the Linuxulator
because it's impossible to run "sudo update-initramfs -u" inside of it. For
this reason,I would ask if in your opinion the nouveau driver can be
blacklisted directly in FreeBSD or in some other way.

FreeBSD does not contain the nouveau kernel module so there is nothing to
blacklist.

>
https://www.reddit.com/r/freebsd/comments/11431bi/how_to_blacklist_the_nouveau_driver_within_the/

These libGL errors are from Mesa libGL, which is trying to use the
userspace part of nouveau (which is part of the Mesa project),
presumably based on Nvidia GPU's PCI ID being known to Mesa, despite there
being no nouveau kernel interface available.

Since I'm trying to use Nvidia's binary driver (the only one which works on
FreeBSD), Blender should have never loaded Mesa's libGL in the
first place - there is most likely a configuration problem here with
libglvnd, the component responsible for choosing the correct libGL
implementation.

When Blender fails to detect CUDA this has nothing to do with libGL and
absolutely nothing to do with nouveau.

Smplayer behaves the same as blender. I think this is a general behavior.
Check below what happens when I run it within the linuxulator :

root@marietto:/mnt/zroot2/zroot2 # chroot /compat/ubuntulunar /bin/bash

root@marietto:/# smplayer

QStandardPaths: error creating runtime directory '/var/run/user/1001' (No
such file or directory)
This is SMPlayer v. 22.7.0 (revision 10091) running on Linux
libGL error: glx: failed to create dri2 screen
*libGL error: failed to load driver: nouveau*


Can you figure out a method to do what I want to do ? If we are able to
"connect" the nVidia driver to the CG / graphic tool instead of the nouveau
one,a lot of cool features will be unfrozen on FreeBSD. For example we
could try to run Unreal Engine 5 within the linuxulator,Davinci
Resolve,Maya 3D,a lot of cool stuff will use the nVidia driver + CUDA and
it will work great. That's because unfortunately Nouveau does not support
CUDA.


Thanks.

-- 
Mario.

--00000000000022ec1e05fc8a66bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello. <br></div><div><br></div><div>I wrote this tut=
orial some=20
time ago because I wanted that Blender was able to recognize CUDA and=20
the Nvidia driver directly within the linuxulator :<br></div><div><br></div=
><div><a href=3D"https://www.reddit.com/r/freebsd/comments/1118eae/how_to_i=
nstall_the_nvidia_driver_5257801_cuda_12/" target=3D"_blank">https://www.re=
ddit.com/r/freebsd/comments/1118eae/how_to_install_the_nvidia_driver_525780=
1_cuda_12/</a></div><div><br></div><div>I was inspired by this tutorial : <=
a href=3D"https://gist.github.com/Mostly-BSD/4d3cacc0ee2f045ed8505005fd664c=
6e" target=3D"_blank">https://gist.github.com/Mostly-BSD/4d3cacc0ee2f045ed8=
505005fd664c6e</a></div><div><br></div><div>someone found my tutorial and c=
reated this github :</div><div><br></div><div><a href=3D"https://github.com=
/spfcraze/Nvidia-Drivers-linux" target=3D"_blank">https://github.com/spfcra=
ze/Nvidia-Drivers-linux</a></div><div><br></div><div>He
 says that he created a Python script for updating Nvidia drivers=20
on CentOS 7 and Ubuntu. That&#39;s nice,but it can&#39;t work. Why ? please=
 give a look
 to an old post created by me some time ago and you will see :<br></div><di=
v><br></div><div><a href=3D"https://www.reddit.com/r/freebsd/comments/11431=
bi/how_to_blacklist_the_nouveau_driver_within_the/" target=3D"_blank">https=
://www.reddit.com/r/freebsd/comments/11431bi/how_to_blacklist_the_nouveau_d=
river_within_the/</a></div><div><br></div><div>since the nouveau driver can=
&#39;t be blacklisted within the Linuxulator because it&#39;s impossible to=
 run &quot;sudo=20
update-initramfs -u&quot; inside of it. For this reason,I would ask if in y=
our opinion the nouveau
 driver can be blacklisted directly in FreeBSD or in some other way.</div><=
div><font color=3D"#888888"><br></font></div><div><span class=3D"gmail-im">=
</span>
FreeBSD does not contain the nouveau kernel module so there is nothing to b=
lacklist.<span class=3D"gmail-im"><br>
<br>
&gt; <a href=3D"https://www.reddit.com/r/freebsd/comments/11431bi/how_to_bl=
acklist_the_nouveau_driver_within_the/" rel=3D"noreferrer" target=3D"_blank=
">https://www.reddit.com/r/freebsd/comments/11431bi/how_to_blacklist_the_no=
uveau_driver_within_the/</a><br><br></span>
These libGL errors are from Mesa libGL, which is trying to use the userspac=
e part of nouveau (which is part of the Mesa project), <br>
presumably based on Nvidia GPU&#39;s PCI ID being known to Mesa, despite th=
ere being no nouveau kernel interface available.<br>
<br>
Since I&#39;m trying to use Nvidia&#39;s binary driver (the only one which =
works on FreeBSD), Blender should have never loaded Mesa&#39;s libGL in the=
 <br>
first place - there is most likely a configuration problem here with=20
libglvnd, the component responsible for choosing the correct libGL <br>
implementation.<br>
<br>
When Blender fails to detect CUDA this has nothing to do with libGL and abs=
olutely nothing to do with nouveau.<font color=3D"#888888"><br></font></div=
><div><font color=3D"#888888"><br></font></div><div><div>Smplayer behaves t=
he same as blender. I think this is a general=20
behavior. Check below what happens when I run it within the linuxulator :<b=
r></div><div><br></div><div><span style=3D"font-family:times new roman,seri=
f"></span></div><div><span style=3D"color:rgb(0,0,0);background-color:rgb(2=
55,255,255);font-family:times new roman,serif">root@marietto:/mnt/zroot2/zr=
oot2 # chroot /compat/ubuntulunar /bin/bash</span></div><div><span style=3D=
"font-family:times new roman,serif"><br></span></div><div><span style=3D"fo=
nt-family:times new roman,serif">root@marietto:/# smplayer=C2=A0</span></di=
v><div><span style=3D"font-family:times new roman,serif"><br></span></div><=
div><span style=3D"font-family:times new roman,serif">QStandardPaths: error=
 creating runtime directory &#39;/var/run/user/1001&#39; (No such file or d=
irectory)
<br>This is SMPlayer v. 22.7.0 (revision 10091) running on Linux
<br>libGL error: glx: failed to create dri2 screen
<br><b>libGL error: failed to load driver: nouveau</b><br></span></div><div=
><span style=3D"font-family:times new roman,serif"><br></span></div><div><s=
pan style=3D"font-family:monospace"><br></span></div></div>Can you figure o=
ut a method to do what I want to do ? If we are able to=20
&quot;connect&quot; the nVidia driver to the CG / graphic tool instead of t=
he=20
nouveau one,a lot of cool features will be unfrozen on FreeBSD. For example=
 we=20
could try to run Unreal Engine 5 within the linuxulator,Davinci=20
Resolve,Maya 3D,a lot of cool stuff will use the nVidia driver + CUDA and i=
t=20
will work great. That&#39;s because unfortunately Nouveau does not support =
CUDA.<br><div><span class=3D"gmail_signature_prefix"><br></span></div><div>=
<span class=3D"gmail_signature_prefix"><br></span></div><div><span class=3D=
"gmail_signature_prefix">Thanks.</span></div><div><span class=3D"gmail_sign=
ature_prefix"><br></span></div><div><span class=3D"gmail_signature_prefix">=
-- </span></div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Mario.<br></div></div>

--00000000000022ec1e05fc8a66bd--
