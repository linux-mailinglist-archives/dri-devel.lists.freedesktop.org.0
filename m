Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72580B4BDF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 12:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5141F6EBB2;
	Tue, 17 Sep 2019 10:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92C9C6EBB2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 10:23:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8EB3472168; Tue, 17 Sep 2019 10:23:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 17 Sep 2019 10:23:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-Up8JAHh2yl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1506167459=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1506167459==
Content-Type: multipart/alternative; boundary="15687158032.78626eDf.20949"
Content-Transfer-Encoding: 7bit


--15687158032.78626eDf.20949
Date: Tue, 17 Sep 2019 10:23:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #48 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #15)
> (In reply to Marko Popovic from comment #14)
> >=20
> > Yes, always happens at the same place with Citra emulator
>=20
> Could you capture a trace of the problem (using Apitrace or Renderdoc)?
>=20
> This would be very helpful to fix it.

There is another type of freeze/hang happening when playing Starcraft II via
D9VK. This one doesn't seem to be related to either ngg or dma because I ha=
ve
them both disabled and the hang occurs anyway.

sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D2361623, emitted seq=3D2361625
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process SC2_x64.exe pid 20236 thread SC2_x64.exe pid 2=
0236

Is there any way to apitrace the Vulkan API?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687158032.78626eDf.20949
Date: Tue, 17 Sep 2019 10:23:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c48">Comme=
nt # 48</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111481#c15">comment #15</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111481#c14">comment #14</a>)
&gt; &gt;=20
&gt; &gt; Yes, always happens at the same place with Citra emulator
&gt;=20
&gt; Could you capture a trace of the problem (using Apitrace or Renderdoc)?
&gt;=20
&gt; This would be very helpful to fix it.</span >

There is another type of freeze/hang happening when playing Starcraft II via
D9VK. This one doesn't seem to be related to either ngg or dma because I ha=
ve
them both disabled and the hang occurs anyway.

sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D2361623, emitted seq=3D2361625
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process SC2_x64.exe pid 20236 thread SC2_x64.exe pid 2=
0236

Is there any way to apitrace the Vulkan API?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687158032.78626eDf.20949--

--===============1506167459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1506167459==--
