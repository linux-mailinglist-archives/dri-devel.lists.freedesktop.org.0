Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE09B62E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 17:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C288913E;
	Sun, 28 Apr 2019 15:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88E778913E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 15:42:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D19B7215F; Sun, 28 Apr 2019 15:42:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Sun, 28 Apr 2019 15:42:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110509-502-UI82wGyyiR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1378171630=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1378171630==
Content-Type: multipart/alternative; boundary="15564661270.5D61afE.27929"
Content-Transfer-Encoding: 7bit


--15564661270.5D61afE.27929
Date: Sun, 28 Apr 2019 15:42:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #5 from James.Dutton@gmail.com ---
This is a result of trying to play games in wine and dxvk.
It used to work, but the latest mesa git fails.
Games that fails are:
Assassin's creed odyssey
Devil May Cry 5

Both these games get through the title sequences, but fail when you reach t=
he
actual game play. The GPU hangs and tries to reset, but fails to reset.

So, there are two problems:
1) Why does it hang in the first place
2) Why does it fail to recover and reset itself.

I can ssh into the PC.
poweroff   <-  Attempts to power off but never actually reaches off state.
echo b > /proc/sysrq-trigger    <-  reboots the box, and everything is then=
 ok
again, so long as one does not try to play a game.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15564661270.5D61afE.27929
Date: Sun, 28 Apr 2019 15:42:07 +0000
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
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
James.Dutton&#64;gmail.com" title=3D"James.Dutton&#64;gmail.com">James.Dutt=
on&#64;gmail.com</a>
</span></b>
        <pre>This is a result of trying to play games in wine and dxvk.
It used to work, but the latest mesa git fails.
Games that fails are:
Assassin's creed odyssey
Devil May Cry 5

Both these games get through the title sequences, but fail when you reach t=
he
actual game play. The GPU hangs and tries to reset, but fails to reset.

So, there are two problems:
1) Why does it hang in the first place
2) Why does it fail to recover and reset itself.

I can ssh into the PC.
poweroff   &lt;-  Attempts to power off but never actually reaches off stat=
e.
echo b &gt; /proc/sysrq-trigger    &lt;-  reboots the box, and everything i=
s then ok
again, so long as one does not try to play a game.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15564661270.5D61afE.27929--

--===============1378171630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1378171630==--
