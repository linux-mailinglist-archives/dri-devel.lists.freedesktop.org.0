Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21513970
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 13:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E8893D0;
	Sat,  4 May 2019 11:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 949CC893D0
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 11:07:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 915D17215A; Sat,  4 May 2019 11:07:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Sat, 04 May 2019 11:07:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.m.mcmahon@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-dkIMEF0H6w@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1601528198=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1601528198==
Content-Type: multipart/alternative; boundary="15569680692.EdA1349c5.12890"
Content-Transfer-Encoding: 7bit


--15569680692.EdA1349c5.12890
Date: Sat, 4 May 2019 11:07:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #14 from andrew.m.mcmahon@gmail.com ---
(In reply to supercoolemail from comment #13)
> You are lucky. I have this:
> https://imgur.com/a/YTDyAXv
Yes that is horrible :(
Your Ryzen + RX580 should blow my old Phenom II + R9 285 out of the water.

The only way I'm able to intentionally destroy the performance of Gothic 2 =
is
to do the following:
export LIBGL_ALWAYS_SOFTWARE=3D1
export GALLIUM_DRIVER=3Dllvmpipe
WINEDEBUG=3D+fps  WINEPREFIX=3D~/.wineprefix/gothic2gold/ wine
~/.wineprefix/gothic2gold/drive_c/Gothic2Gold/system/Gothic2.exe=20
https://imgur.com/a/rldthLI

Or I can use softpipe which is even worse plus I get the laggy main menu:
https://imgur.com/a/JwCnegN

I'm sure you've already enabled 32 bit support in your distro:
https://wiki.debian.org/Multiarch/HOWTO
https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib

And installed all x64 and x86 Mesa related packages and firmware i.e:
https://www.archlinux.org/packages/multilib/x86_64/lib32-mesa/
https://packages.debian.org/buster/firmware-amd-graphics

Maybe you've exported some funny settings that you might have forgotten abo=
ut?
Here's my /etc/environment file:
https://pastebin.com/vqMfCTVm

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569680692.EdA1349c5.12890
Date: Sat, 4 May 2019 11:07:49 +0000
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
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrew.m.mcmahon&#64;gmail.com" title=3D"andrew.m.mcmahon&#64;gmail.com">an=
drew.m.mcmahon&#64;gmail.com</a>
</span></b>
        <pre>(In reply to supercoolemail from <a href=3D"show_bug.cgi?id=3D=
108893#c13">comment #13</a>)
<span class=3D"quote">&gt; You are lucky. I have this:
&gt; <a href=3D"https://imgur.com/a/YTDyAXv">https://imgur.com/a/YTDyAXv</a=
></span >
Yes that is horrible :(
Your Ryzen + RX580 should blow my old Phenom II + R9 285 out of the water.

The only way I'm able to intentionally destroy the performance of Gothic 2 =
is
to do the following:
export LIBGL_ALWAYS_SOFTWARE=3D1
export GALLIUM_DRIVER=3Dllvmpipe
WINEDEBUG=3D+fps  WINEPREFIX=3D~/.wineprefix/gothic2gold/ wine
~/.wineprefix/gothic2gold/drive_c/Gothic2Gold/system/Gothic2.exe=20
<a href=3D"https://imgur.com/a/rldthLI">https://imgur.com/a/rldthLI</a>

Or I can use softpipe which is even worse plus I get the laggy main menu:
<a href=3D"https://imgur.com/a/JwCnegN">https://imgur.com/a/JwCnegN</a>

I'm sure you've already enabled 32 bit support in your distro:
<a href=3D"https://wiki.debian.org/Multiarch/HOWTO">https://wiki.debian.org=
/Multiarch/HOWTO</a>
<a href=3D"https://wiki.archlinux.org/index.php/Official_repositories#Enabl=
ing_multilib">https://wiki.archlinux.org/index.php/Official_repositories#En=
abling_multilib</a>

And installed all x64 and x86 Mesa related packages and firmware i.e:
<a href=3D"https://www.archlinux.org/packages/multilib/x86_64/lib32-mesa/">=
https://www.archlinux.org/packages/multilib/x86_64/lib32-mesa/</a>
<a href=3D"https://packages.debian.org/buster/firmware-amd-graphics">https:=
//packages.debian.org/buster/firmware-amd-graphics</a>

Maybe you've exported some funny settings that you might have forgotten abo=
ut?
Here's my /etc/environment file:
<a href=3D"https://pastebin.com/vqMfCTVm">https://pastebin.com/vqMfCTVm</a>=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569680692.EdA1349c5.12890--

--===============1601528198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1601528198==--
