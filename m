Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DACCD5352
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 01:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52226E0DB;
	Sat, 12 Oct 2019 23:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D14C06E0E2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 23:34:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CE3317296E; Sat, 12 Oct 2019 23:34:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 12 Oct 2019 23:34:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: g@rgoyle.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-bpPcoVdFXX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1352762270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1352762270==
Content-Type: multipart/alternative; boundary="157092325910.c7ff3A1.30731"
Content-Transfer-Encoding: 7bit


--157092325910.c7ff3A1.30731
Date: Sat, 12 Oct 2019 23:34:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #161 from Gargoyle <g@rgoyle.com> ---
Hi there. I've been trying to solve some lockups and pauses with my system =
and
have just read this entire thread.=20

The good news is that I am another Radeon VII owner having the same problems
and I am willing to do whatever I can to help.

My current situation is:-

- I'm running dual 2560x1440@60Hz via display port.

- I am running the beta of ubuntu 19:10 (Linux ryzen1910 5.3.0-18-generic
#19-Ubuntu SMP Tue Oct 8 20:14:06 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux).

- I don't push the R:VII at all under Linux. I boot into Windows 10 to play
games.

- I have disabled IOMMU in BIOS/EFI. With IOMMU enabled things are MUCH wor=
se.

- My system is mostly stable. If the displays blank, sometimes after waking
them I get the 15-30 second freeze. Then the "amdgpu [powerplay] Failed..."
messages and then everything continues ok. I can semi-reliably recreate thi=
s by
using the "xset dpms force off" command someone posted earlier. I've not
managed to find any kind of pattern yet, but 8 out of 10 times running that
command and then waking the system with a keypress/mouse click will cause t=
he
freeze.

- I use X11 and not wayland. Not sure that is significant, but with Ubuntu
19:10 it seems wayland is started temporarily and then stopped during boot /
starting gdm. If I enable IOMMU my GDM login screen will be completely corr=
upt.
However, if I press enter (to select my user) and enter my password, my X11
gnome session starts. Although there are LOTS of pauses and warnings and er=
rors
all over the place in "journalctl -f".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157092325910.c7ff3A1.30731
Date: Sat, 12 Oct 2019 23:34:19 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c161">Comm=
ent # 161</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
g&#64;rgoyle.com" title=3D"Gargoyle &lt;g&#64;rgoyle.com&gt;"> <span class=
=3D"fn">Gargoyle</span></a>
</span></b>
        <pre>Hi there. I've been trying to solve some lockups and pauses wi=
th my system and
have just read this entire thread.=20

The good news is that I am another Radeon VII owner having the same problems
and I am willing to do whatever I can to help.

My current situation is:-

- I'm running dual 2560x1440&#64;60Hz via display port.

- I am running the beta of ubuntu 19:10 (Linux ryzen1910 5.3.0-18-generic
#19-Ubuntu SMP Tue Oct 8 20:14:06 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux).

- I don't push the R:VII at all under Linux. I boot into Windows 10 to play
games.

- I have disabled IOMMU in BIOS/EFI. With IOMMU enabled things are MUCH wor=
se.

- My system is mostly stable. If the displays blank, sometimes after waking
them I get the 15-30 second freeze. Then the &quot;amdgpu [powerplay] Faile=
d...&quot;
messages and then everything continues ok. I can semi-reliably recreate thi=
s by
using the &quot;xset dpms force off&quot; command someone posted earlier. I=
've not
managed to find any kind of pattern yet, but 8 out of 10 times running that
command and then waking the system with a keypress/mouse click will cause t=
he
freeze.

- I use X11 and not wayland. Not sure that is significant, but with Ubuntu
19:10 it seems wayland is started temporarily and then stopped during boot /
starting gdm. If I enable IOMMU my GDM login screen will be completely corr=
upt.
However, if I press enter (to select my user) and enter my password, my X11
gnome session starts. Although there are LOTS of pauses and warnings and er=
rors
all over the place in &quot;journalctl -f&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157092325910.c7ff3A1.30731--

--===============1352762270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1352762270==--
