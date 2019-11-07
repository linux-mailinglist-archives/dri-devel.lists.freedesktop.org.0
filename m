Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E4F26C5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 06:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ECC6E0E3;
	Thu,  7 Nov 2019 05:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C94996EE90
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 05:12:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C6633720E2; Thu,  7 Nov 2019 05:12:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 07 Nov 2019 05:12:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: lptech1024@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-9WJOVrt9Au@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1288295050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1288295050==
Content-Type: multipart/alternative; boundary="157310354712.a9Ad7FA22.15846"
Content-Transfer-Encoding: 7bit


--157310354712.a9Ad7FA22.15846
Date: Thu, 7 Nov 2019 05:12:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #216 from lptech1024@gmail.com ---
GPU: PowerColor Red Devil Radeon RX 5700 XT using OC BIOS (default)

Stock Fedora 31: Kernel 5.3.8, GNOME 3.34, Mesa 19.2.2, linux-firmware
20190923, LLVM 9.0.0

I experienced frequent hangs using X.org Gnome (Kernel 5.3.7, > Mesa 19.2.0=
),
especially interacting with graphical file manager-related operations .

Wayland Gnome is much more stable, although I experienced a hang today after
being powered on for almost two hours (45 minutes idle, 75 minutes with high
GPU load). Hang occurred during a gaming cutscene.

All messages contained an identical timestamp:

Nov 06 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process ShadowOfTheTomb pid 16893 thread WebViewRenderer pid 1=
6939
Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0=
.0.0
timeout, signaled seq=3D2827901, emitted seq=3D2827903
Nov 06 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157310354712.a9Ad7FA22.15846
Date: Thu, 7 Nov 2019 05:12:27 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c216">Comm=
ent # 216</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lptech1024&#64;gmail.com" title=3D"lptech1024&#64;gmail.com">lptech1024&#64=
;gmail.com</a>
</span></b>
        <pre>GPU: PowerColor Red Devil Radeon RX 5700 XT using OC BIOS (def=
ault)

Stock Fedora 31: Kernel 5.3.8, GNOME 3.34, Mesa 19.2.2, linux-firmware
20190923, LLVM 9.0.0

I experienced frequent hangs using X.org Gnome (Kernel 5.3.7, &gt; Mesa 19.=
2.0),
especially interacting with graphical file manager-related operations .

Wayland Gnome is much more stable, although I experienced a hang today after
being powered on for almost two hours (45 minutes idle, 75 minutes with high
GPU load). Hang occurred during a gaming cutscene.

All messages contained an identical timestamp:

Nov 06 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process ShadowOfTheTomb pid 16893 thread WebViewRenderer pid 1=
6939
Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0=
.0.0
timeout, signaled seq=3D2827901, emitted seq=3D2827903
Nov 06 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157310354712.a9Ad7FA22.15846--

--===============1288295050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1288295050==--
