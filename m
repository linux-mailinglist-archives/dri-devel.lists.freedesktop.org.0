Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F53B949
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 18:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462E890EB;
	Mon, 10 Jun 2019 16:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11A9B890EB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 16:22:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0E48572167; Mon, 10 Jun 2019 16:22:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Mon, 10 Jun 2019 16:22:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-MFjgPg4VZ4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1671635269=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1671635269==
Content-Type: multipart/alternative; boundary="15601837200.be5C2d2B.20762"
Content-Transfer-Encoding: 7bit


--15601837200.be5C2d2B.20762
Date: Mon, 10 Jun 2019 16:22:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #16 from Gobinda Joy <gobinda.joy@gmail.com> ---
(In reply to b6khqjqov4 from comment #14)
> (In reply to b6khqjqov4 from comment #13)
> > Your bug sounds like mine which came after I bought and added a used RX=
580
> > to my system. Since then had random full system freezes (I think only w=
hen I
> > was using Firefox or the internal Steam Chromium browser) and desktop h=
angs
> > where Cinnamon would crash and nothing except the mouse pointer would be
> > movable. No error in logs at first, but then I found this after the sys=
tem
> > hanged instead of a hard freeze:
> >=20
> > $ journalctl -p3:
> >=20
> > <pre>
> > ...
> > Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1332:
> >                                              #0  0x00007f04ecd3ed36 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> >                                              #1  0x0000000000000000 n/a=
 (n/a)
> > Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefox.real=
) of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1124:
> >                                              #0  0x00007fd89155036f rai=
se
> > (libpthread.so.0)
> >                                              #1  0x00007fd88b6b3a5f n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> > Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1164:
> >                                              #0  0x00007ffb32c6ad36 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> >                                              #1  0x0000000000000000 n/a=
 (n/a)
> > Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1241:
> >                                              #0  0x00007f9aa7f3ed36 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> >                                              #1  0x0000000000000000 n/a=
 (n/a)
> > Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1536:
> >                                              #0  0x00007f830d3ee3e7 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> > Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1606:
> >                                              #0  0x00007f8f129ebd36 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> >                                              #1  0x0000000000000000 n/a=
 (n/a)
> > Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefox.real=
) of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1410:
> >                                              #0  0x00007fe94ed5f36f rai=
se
> > (libpthread.so.0)
> >                                              #1  0x00007fe948ec2a5f n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> > Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Content)=
 of
> > user 1000 dumped core.
> >=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> >                                              Stack trace of thread 1469:
> >                                              #0  0x00007fb2790c2d36 n/a
> > (/home/test/tor-browser_en-US/Browser/libxul.so)
> >                                              #1  0x0000000000000000 n/a=
 (n/a)
> > ...
> > </pre>
> >=20
> > My system:
> > - MSI B450 Tomahawk
> > - Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 one of c=
ourse
> > ;))
> > - RX 580 4G Nitro+
> > - G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C16D-16=
GISB)
> >=20
> > My fix: 2 things I can remember I did which are maybe the fix:
> > 1.) I disabled integrated graphics in the BIOS.
> > 2.) I installed amd-ucode.
> >=20
> > No hangs/freezes or anything since my fix. I'll report back here should=
 I
> > encounter a crash/freeze/hang again.
>=20
> Addition:
> Arch (through Antergos) with all latest updates:
> - $ uname: 5.1.7-arch1-1-ARCH
> - $ glxinfo | grep version:
> server glx version string: 1.4
> client glx version string: 1.4
> GLX version: 1.4
>     Max core profile version: 4.5
>     Max compat profile version: 4.5
>     Max GLES1 profile version: 1.1
>     Max GLES[23] profile version: 3.2
> OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.6
> OpenGL core profile shading language version string: 4.50
> OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.6
> OpenGL shading language version string: 4.50
> OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.6
> OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
>     GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix,

This doesn't seems like the same bug. For instance, in my case the whole bo=
ot
process hangs check the attached log files. In your case you can boot the
system but problem arise when you load the GPU maybe. Not the same bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15601837200.be5C2d2B.20762
Date: Mon, 10 Jun 2019 16:22:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>(In reply to b6khqjqov4 from <a href=3D"show_bug.cgi?id=3D1108=
22#c14">comment #14</a>)
<span class=3D"quote">&gt; (In reply to b6khqjqov4 from <a href=3D"show_bug=
.cgi?id=3D110822#c13">comment #13</a>)
&gt; &gt; Your bug sounds like mine which came after I bought and added a u=
sed RX580
&gt; &gt; to my system. Since then had random full system freezes (I think =
only when I
&gt; &gt; was using Firefox or the internal Steam Chromium browser) and des=
ktop hangs
&gt; &gt; where Cinnamon would crash and nothing except the mouse pointer w=
ould be
&gt; &gt; movable. No error in logs at first, but then I found this after t=
he system
&gt; &gt; hanged instead of a hard freeze:
&gt; &gt;=20
&gt; &gt; $ journalctl -p3:
&gt; &gt;=20
&gt; &gt; &lt;pre&gt;
&gt; &gt; ...
&gt; &gt; Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1332:
&gt; &gt;                                              #0  0x00007f04ecd3ed=
36 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt;                                              #1  0x00000000000000=
00 n/a (n/a)
&gt; &gt; Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefo=
x.real) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1124:
&gt; &gt;                                              #0  0x00007fd8915503=
6f raise
&gt; &gt; (libpthread.so.0)
&gt; &gt;                                              #1  0x00007fd88b6b3a=
5f n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt; Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1164:
&gt; &gt;                                              #0  0x00007ffb32c6ad=
36 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt;                                              #1  0x00000000000000=
00 n/a (n/a)
&gt; &gt; Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1241:
&gt; &gt;                                              #0  0x00007f9aa7f3ed=
36 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt;                                              #1  0x00000000000000=
00 n/a (n/a)
&gt; &gt; Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1536:
&gt; &gt;                                              #0  0x00007f830d3ee3=
e7 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt; Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1606:
&gt; &gt;                                              #0  0x00007f8f129ebd=
36 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt;                                              #1  0x00000000000000=
00 n/a (n/a)
&gt; &gt; Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefo=
x.real) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1410:
&gt; &gt;                                              #0  0x00007fe94ed5f3=
6f raise
&gt; &gt; (libpthread.so.0)
&gt; &gt;                                              #1  0x00007fe948ec2a=
5f n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt; Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Co=
ntent) of
&gt; &gt; user 1000 dumped core.
&gt; &gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; &gt;                                              Stack trace of threa=
d 1469:
&gt; &gt;                                              #0  0x00007fb2790c2d=
36 n/a
&gt; &gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; &gt;                                              #1  0x00000000000000=
00 n/a (n/a)
&gt; &gt; ...
&gt; &gt; &lt;/pre&gt;
&gt; &gt;=20
&gt; &gt; My system:
&gt; &gt; - MSI B450 Tomahawk
&gt; &gt; - Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 on=
e of course
&gt; &gt; ;))
&gt; &gt; - RX 580 4G Nitro+
&gt; &gt; - G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C=
16D-16GISB)
&gt; &gt;=20
&gt; &gt; My fix: 2 things I can remember I did which are maybe the fix:
&gt; &gt; 1.) I disabled integrated graphics in the BIOS.
&gt; &gt; 2.) I installed amd-ucode.
&gt; &gt;=20
&gt; &gt; No hangs/freezes or anything since my fix. I'll report back here =
should I
&gt; &gt; encounter a crash/freeze/hang again.
&gt;=20
&gt; Addition:
&gt; Arch (through Antergos) with all latest updates:
&gt; - $ uname: 5.1.7-arch1-1-ARCH
&gt; - $ glxinfo | grep version:
&gt; server glx version string: 1.4
&gt; client glx version string: 1.4
&gt; GLX version: 1.4
&gt;     Max core profile version: 4.5
&gt;     Max compat profile version: 4.5
&gt;     Max GLES1 profile version: 1.1
&gt;     Max GLES[23] profile version: 3.2
&gt; OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.6
&gt; OpenGL core profile shading language version string: 4.50
&gt; OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.6
&gt; OpenGL shading language version string: 4.50
&gt; OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.6
&gt; OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3=
.20
&gt;     GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix,</sp=
an >

This doesn't seems like the same bug. For instance, in my case the whole bo=
ot
process hangs check the attached log files. In your case you can boot the
system but problem arise when you load the GPU maybe. Not the same bug.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15601837200.be5C2d2B.20762--

--===============1671635269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1671635269==--
