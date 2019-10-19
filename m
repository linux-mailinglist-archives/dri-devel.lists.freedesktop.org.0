Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E20DD6CB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 07:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5296E0A6;
	Sat, 19 Oct 2019 05:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E42B36E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 05:49:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E10C9720E2; Sat, 19 Oct 2019 05:49:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 19 Oct 2019 05:49:50 +0000
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
Message-ID: <bug-111481-502-4fFYthwYaU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0135244514=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0135244514==
Content-Type: multipart/alternative; boundary="157146419010.7BBA4.22288"
Content-Transfer-Encoding: 7bit


--157146419010.7BBA4.22288
Date: Sat, 19 Oct 2019 05:49:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #110 from Sebastian Meyer <mail@bastimeyer.de> ---
Created attachment 145773
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145773&action=3Dedit
umr output after sdma0 timeout

Another random sdma0 timeout while using kernel
drm.fixes.5.4.2019.10.16.r0.gd12c50857c6e-1 with all mentioned patches appl=
ied
(one of them already included on the drm-fixes branch). This time I didn't
forget about the umr debug output, but I'm not sure if it's even relevant
anymore considering the number of already submitted reports.

The system freeze happened after working with WebStorm and SmartGit for rou=
ghly
10 minutes on KDE Plasma while scrolling in one of the application's window=
s.

[39816.999159] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[39816.999298] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[39821.905604] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D3360854, emitted seq=3D3360856
[39821.905718] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 717 thread Xorg:cs0 pid 718
[39821.905720] [drm] GPU recovery disabled.

I would really appreciate it if AMD and the AMDGPU devs could focus on fixi=
ng
these major stability issues of their now almost 4 months old mainstream
consumer GPUs. I'm sorry if this sounds harsh, but the hardware has been
advertised with Linux support and it's clearly unusable. This needs to be f=
ixed
as soon as possible. Thank you!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157146419010.7BBA4.22288
Date: Sat, 19 Oct 2019 05:49:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c110">Comm=
ent # 110</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145773=
" name=3D"attach_145773" title=3D"umr output after sdma0 timeout">attachmen=
t 145773</a> <a href=3D"attachment.cgi?id=3D145773&amp;action=3Dedit" title=
=3D"umr output after sdma0 timeout">[details]</a></span>
umr output after sdma0 timeout

Another random sdma0 timeout while using kernel
drm.fixes.5.4.2019.10.16.r0.gd12c50857c6e-1 with all mentioned patches appl=
ied
(one of them already included on the drm-fixes branch). This time I didn't
forget about the umr debug output, but I'm not sure if it's even relevant
anymore considering the number of already submitted reports.

The system freeze happened after working with WebStorm and SmartGit for rou=
ghly
10 minutes on KDE Plasma while scrolling in one of the application's window=
s.

[39816.999159] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[39816.999298] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[39821.905604] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D3360854, emitted seq=3D3360856
[39821.905718] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 717 thread Xorg:cs0 pid 718
[39821.905720] [drm] GPU recovery disabled.

I would really appreciate it if AMD and the AMDGPU devs could focus on fixi=
ng
these major stability issues of their now almost 4 months old mainstream
consumer GPUs. I'm sorry if this sounds harsh, but the hardware has been
advertised with Linux support and it's clearly unusable. This needs to be f=
ixed
as soon as possible. Thank you!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157146419010.7BBA4.22288--

--===============0135244514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0135244514==--
