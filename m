Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77EEEE39
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 23:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113B06E8A5;
	Mon,  4 Nov 2019 22:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEB566E8A9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 22:13:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ABBAB720E2; Mon,  4 Nov 2019 22:13:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Mon, 04 Nov 2019 22:13:38 +0000
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
Message-ID: <bug-111763-502-lqvSVTupGJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0981336252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0981336252==
Content-Type: multipart/alternative; boundary="15729056184.13dbA90F1.13633"
Content-Transfer-Encoding: 7bit


--15729056184.13dbA90F1.13633
Date: Mon, 4 Nov 2019 22:13:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #22 from wychuchol <wychuchol7777@gmail.com> ---
(In reply to Marko Popovic from comment #21)
> What kernel/MESA combo are you using?

DRM 3.35.0, 5.4.0-050400rc5-generic, LLVM 9.0.0
Mesa 19.3.0-devel (git-ff6e148 2019-10-29 eoan-oibaf-ppa

Or at least that's what I got from glxinfo | grep OpenGL

Stalker hanged again just after few minutes of playtime so I don't know if =
any
of the fixes actually fixed anything or has it held stuff together a bit mo=
re
securely.

Nov  4 23:04:16 pop-os kernel: [100672.998576]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Nov  4 23:04:16 pop-os kernel: [100677.862509] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D23742723, emitted
seq=3D23742725
Nov  4 23:04:16 pop-os kernel: [100677.862545] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 3904 thr=
ead
AnomalyDX11.exe pid 3904
Nov  4 23:04:16 pop-os kernel: [100677.862547] [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729056184.13dbA90F1.13633
Date: Mon, 4 Nov 2019 22:13:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11763#c21">comment #21</a>)
<span class=3D"quote">&gt; What kernel/MESA combo are you using?</span >

DRM 3.35.0, 5.4.0-050400rc5-generic, LLVM 9.0.0
Mesa 19.3.0-devel (git-ff6e148 2019-10-29 eoan-oibaf-ppa

Or at least that's what I got from glxinfo | grep OpenGL

Stalker hanged again just after few minutes of playtime so I don't know if =
any
of the fixes actually fixed anything or has it held stuff together a bit mo=
re
securely.

Nov  4 23:04:16 pop-os kernel: [100672.998576]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Nov  4 23:04:16 pop-os kernel: [100677.862509] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D23742723, emitted
seq=3D23742725
Nov  4 23:04:16 pop-os kernel: [100677.862545] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 3904 thr=
ead
AnomalyDX11.exe pid 3904
Nov  4 23:04:16 pop-os kernel: [100677.862547] [drm] GPU recovery disabled.=
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

--15729056184.13dbA90F1.13633--

--===============0981336252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0981336252==--
