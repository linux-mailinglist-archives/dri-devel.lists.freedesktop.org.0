Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E94AF0FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 20:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA176E113;
	Tue, 10 Sep 2019 18:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 188E96E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 18:25:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1287D72168; Tue, 10 Sep 2019 18:25:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 10 Sep 2019 18:25:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: alexandr.kara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111481-502-BZvd8ew4vZ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1220777390=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1220777390==
Content-Type: multipart/alternative; boundary="15681399070.adD1C.11298"
Content-Transfer-Encoding: 7bit


--15681399070.adD1C.11298
Date: Tue, 10 Sep 2019 18:25:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #35 from Alexandr K=C3=A1ra <alexandr.kara@gmail.com> ---
Created attachment 145324
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145324&action=3Dedit
UMR dump of registers on a GPU lockup

Sending dmesg output + UMR registers dump of both sdma0 and sdma1 for a loc=
kup
in Rise of the Tomb Raider.

[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled
seq=3D104586, emitted seq=3D104588
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
RiseOfTheTombRa pid 8457 thread RiseOfTheT:cs0 pid 8463
[drm] GPU recovery disabled.

The lockup is reproducible and only affects the GPU - it's still fine to ss=
h to
the machine and it's otherwise working fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681399070.adD1C.11298
Date: Tue, 10 Sep 2019 18:25:07 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexandr.kara&#64;gmail.com" title=3D"Alexandr K=C3=A1ra &lt;alexandr.kara&=
#64;gmail.com&gt;"> <span class=3D"fn">Alexandr K=C3=A1ra</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145324=
" name=3D"attach_145324" title=3D"UMR dump of registers on a GPU lockup">at=
tachment 145324</a> <a href=3D"attachment.cgi?id=3D145324&amp;action=3Dedit=
" title=3D"UMR dump of registers on a GPU lockup">[details]</a></span>
UMR dump of registers on a GPU lockup

Sending dmesg output + UMR registers dump of both sdma0 and sdma1 for a loc=
kup
in Rise of the Tomb Raider.

[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled
seq=3D104586, emitted seq=3D104588
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
RiseOfTheTombRa pid 8457 thread RiseOfTheT:cs0 pid 8463
[drm] GPU recovery disabled.

The lockup is reproducible and only affects the GPU - it's still fine to ss=
h to
the machine and it's otherwise working fine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681399070.adD1C.11298--

--===============1220777390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1220777390==--
