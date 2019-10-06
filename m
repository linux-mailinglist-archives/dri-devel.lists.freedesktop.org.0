Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1894DCD8DE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 21:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E2689E8C;
	Sun,  6 Oct 2019 19:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8913A6E43C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 19:20:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 728007296E; Sun,  6 Oct 2019 19:20:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 06 Oct 2019 19:20:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mail@bastimeyer.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111481-502-COwukG3zT3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0474398484=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0474398484==
Content-Type: multipart/alternative; boundary="15703896192.Ee9F5.30117"
Content-Transfer-Encoding: 7bit


--15703896192.Ee9F5.30117
Date: Sun, 6 Oct 2019 19:20:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #76 from Sebastian Meyer <mail@bastimeyer.de> ---
Created attachment 145668
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145668&action=3Dedit
dump of the sdma0 ring after a timeout error

Just had another ring sdma0 timeout while being on the desktop and working.
Quite infuriating.

[14191.862674] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[14191.862745] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[14196.982476] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D5420633, emitted seq=3D5420635
[14196.982590] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 716 thread Xorg:cs0 pid 717
[14196.982592] [drm] GPU recovery disabled.

Kernel is built from the `drm-fixes-5.4-2019-10-02` tag (basically 5.4-rc1 +
amdgpu commits which will be included in rc2) with the WIP patch of this th=
read
(drm/amdgpu: do not execute 0-sized IBs). All other libs on my system are
up2date (Arch, using the mesa-git repo).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703896192.Ee9F5.30117
Date: Sun, 6 Oct 2019 19:20:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c76">Comme=
nt # 76</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;bastimeyer.de" title=3D"Sebastian Meyer &lt;mail&#64;bastimeyer.de=
&gt;"> <span class=3D"fn">Sebastian Meyer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145668=
" name=3D"attach_145668" title=3D"dump of the sdma0 ring after a timeout er=
ror">attachment 145668</a> <a href=3D"attachment.cgi?id=3D145668&amp;action=
=3Dedit" title=3D"dump of the sdma0 ring after a timeout error">[details]</=
a></span>
dump of the sdma0 ring after a timeout error

Just had another ring sdma0 timeout while being on the desktop and working.
Quite infuriating.

[14191.862674] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[14191.862745] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[14196.982476] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D5420633, emitted seq=3D5420635
[14196.982590] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 716 thread Xorg:cs0 pid 717
[14196.982592] [drm] GPU recovery disabled.

Kernel is built from the `drm-fixes-5.4-2019-10-02` tag (basically 5.4-rc1 +
amdgpu commits which will be included in rc2) with the WIP patch of this th=
read
(drm/amdgpu: do not execute 0-sized IBs). All other libs on my system are
up2date (Arch, using the mesa-git repo).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703896192.Ee9F5.30117--

--===============0474398484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0474398484==--
