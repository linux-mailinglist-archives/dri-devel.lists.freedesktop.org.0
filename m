Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19BE3BD4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9C6E621;
	Thu, 24 Oct 2019 19:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 679ED6E60E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 19:12:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5E3ED720E2; Thu, 24 Oct 2019 19:12:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 19:12:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: kingoipo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-eBaOBoCdac@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1680477822=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1680477822==
Content-Type: multipart/alternative; boundary="15719443560.ce06Af.8336"
Content-Transfer-Encoding: 7bit


--15719443560.ce06Af.8336
Date: Thu, 24 Oct 2019 19:12:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #156 from Michael de Lang <kingoipo@gmail.com> ---
Just had a hang using 5.4.0-rc3, mesa 19.3~git1910171930.4b458b~oibaf~d,
AMD_DEBUG=3D"nodma nongg" while using firefox:

Oct 24 16:31:26 oipo-X570-AORUS-ELITE kernel: [27386.467009] broken atomic
modeset userspace detected, disabling atomic
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43796.470041]
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out!
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773602]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1756792, emitted seq=3D1756794
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773683]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process GPU
Process pid 17048 thread firefox:cs0 pid 17134
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773685] [drm] GPU reco=
very
disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719443560.ce06Af.8336
Date: Thu, 24 Oct 2019 19:12:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c156">Comm=
ent # 156</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kingoipo&#64;gmail.com" title=3D"Michael de Lang &lt;kingoipo&#64;gmail.com=
&gt;"> <span class=3D"fn">Michael de Lang</span></a>
</span></b>
        <pre>Just had a hang using 5.4.0-rc3, mesa 19.3~git1910171930.4b458=
b~oibaf~d,
AMD_DEBUG=3D&quot;nodma nongg&quot; while using firefox:

Oct 24 16:31:26 oipo-X570-AORUS-ELITE kernel: [27386.467009] broken atomic
modeset userspace detected, disabling atomic
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43796.470041]
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out!
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773602]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1756792, emitted seq=3D1756794
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773683]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process GPU
Process pid 17048 thread firefox:cs0 pid 17134
Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773685] [drm] GPU reco=
very
disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719443560.ce06Af.8336--

--===============1680477822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1680477822==--
