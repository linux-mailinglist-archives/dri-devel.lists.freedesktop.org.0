Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE4E3BE9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADAC6E60C;
	Thu, 24 Oct 2019 19:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57E876E626
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 19:15:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 54B5A720E2; Thu, 24 Oct 2019 19:15:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 19:15:42 +0000
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
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-QM75X44bCF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1154229624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1154229624==
Content-Type: multipart/alternative; boundary="15719445434.Cc7f627C9.9314"
Content-Transfer-Encoding: 7bit


--15719445434.Cc7f627C9.9314
Date: Thu, 24 Oct 2019 19:15:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #157 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Michael de Lang from comment #156)
> Just had a hang using 5.4.0-rc3, mesa 19.3~git1910171930.4b458b~oibaf~d,
> AMD_DEBUG=3D"nodma nongg" while using firefox:
>=20
> Oct 24 16:31:26 oipo-X570-AORUS-ELITE kernel: [27386.467009] broken atomic
> modeset userspace detected, disabling atomic
> Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43796.470041]
> [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences ti=
med
> out!
> Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773602]
> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
> seq=3D1756792, emitted seq=3D1756794
> Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773683]
> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process G=
PU
> Process pid 17048 thread firefox:cs0 pid 17134
> Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773685] [drm] GPU
> recovery disabled.

Ok this doesn't sound right, how can you get an SDMA hang if you disable DMA
completely. command should be:
AMD_DEBUG=3Dnodma
not
AMD_DEBUG=3D"nodma"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719445434.Cc7f627C9.9314
Date: Thu, 24 Oct 2019 19:15:43 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c157">Comm=
ent # 157</a>
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
        <pre>(In reply to Michael de Lang from <a href=3D"show_bug.cgi?id=
=3D111481#c156">comment #156</a>)
<span class=3D"quote">&gt; Just had a hang using 5.4.0-rc3, mesa 19.3~git19=
10171930.4b458b~oibaf~d,
&gt; AMD_DEBUG=3D&quot;nodma nongg&quot; while using firefox:
&gt;=20
&gt; Oct 24 16:31:26 oipo-X570-AORUS-ELITE kernel: [27386.467009] broken at=
omic
&gt; modeset userspace detected, disabling atomic
&gt; Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43796.470041]
&gt; [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences=
 timed
&gt; out!
&gt; Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773602]
&gt; [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
&gt; seq=3D1756792, emitted seq=3D1756794
&gt; Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773683]
&gt; [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: proces=
s GPU
&gt; Process pid 17048 thread firefox:cs0 pid 17134
&gt; Oct 24 21:04:58 oipo-X570-AORUS-ELITE kernel: [43798.773685] [drm] GPU
&gt; recovery disabled.</span >

Ok this doesn't sound right, how can you get an SDMA hang if you disable DMA
completely. command should be:
AMD_DEBUG=3Dnodma
not
AMD_DEBUG=3D&quot;nodma&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719445434.Cc7f627C9.9314--

--===============1154229624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1154229624==--
