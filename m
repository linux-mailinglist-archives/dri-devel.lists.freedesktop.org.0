Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3EECEB4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 13:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8C76E448;
	Sat,  2 Nov 2019 12:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE3BB6E46B
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 12:35:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB1DF720E2; Sat,  2 Nov 2019 12:35:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sat, 02 Nov 2019 12:35:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-MwTfRb9E0Z@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0550110936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0550110936==
Content-Type: multipart/alternative; boundary="15726981538.8b3Fe4.4297"
Content-Transfer-Encoding: 7bit


--15726981538.8b3Fe4.4297
Date: Sat, 2 Nov 2019 12:35:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #18 from wychuchol <wychuchol7777@gmail.com> ---
It happened again. This time without a game or anything running, barely log=
ged
in and opened a program and boom.

Nov  2 12:42:07 pop-os kernel: [ 1675.883513]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Nov  2 12:42:07 pop-os kernel: [ 1680.747513] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2714, emitted seq=
=3D2716
Nov  2 12:42:07 pop-os kernel: [ 1680.747549] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process Xorg pid 2293 thread Xorg:cs0
pid 2294
Nov  2 12:42:07 pop-os kernel: [ 1680.747551] [drm] GPU recovery disabled.

Only cursor moved, no clicks registered, restart achieved with REISUB.
I tried registering at https://gitlab.freedesktop.org/mesa/mesa/issues but =
I'm
getting no account confirmation mail so can't post it there.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726981538.8b3Fe4.4297
Date: Sat, 2 Nov 2019 12:35:53 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>It happened again. This time without a game or anything runnin=
g, barely logged
in and opened a program and boom.

Nov  2 12:42:07 pop-os kernel: [ 1675.883513]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Nov  2 12:42:07 pop-os kernel: [ 1680.747513] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2714, emitted seq=
=3D2716
Nov  2 12:42:07 pop-os kernel: [ 1680.747549] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process Xorg pid 2293 thread Xorg:cs0
pid 2294
Nov  2 12:42:07 pop-os kernel: [ 1680.747551] [drm] GPU recovery disabled.

Only cursor moved, no clicks registered, restart achieved with REISUB.
I tried registering at <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/=
issues">https://gitlab.freedesktop.org/mesa/mesa/issues</a> but I'm
getting no account confirmation mail so can't post it there.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726981538.8b3Fe4.4297--

--===============0550110936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0550110936==--
