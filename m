Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB3E9775
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 08:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9376EC9B;
	Wed, 30 Oct 2019 07:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 073326EC9B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 07:57:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 043BA720E2; Wed, 30 Oct 2019 07:57:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112174] AMD Radeon 5700 / Navi: amdgpu.gpu_recovery not working
Date: Wed, 30 Oct 2019 07:57:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: temp201602@kaffeeschluerfer.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112174-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1121012134=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1121012134==
Content-Type: multipart/alternative; boundary="15724222601.6Bde9bDa3.3893"
Content-Transfer-Encoding: 7bit


--15724222601.6Bde9bDa3.3893
Date: Wed, 30 Oct 2019 07:57:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112174

            Bug ID: 112174
           Summary: AMD Radeon 5700 / Navi: amdgpu.gpu_recovery not
                    working
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: temp201602@kaffeeschluerfer.com

I have set "amdgpu.gpu_recovery=3D1" in my kernel boot params. When my GPU =
is
crashing, recovery does not work.

Syslog:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1935, emitted seq=3D1937
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process Xorg
pid 1861 thread Xorg:cs0 pid 1864
 amdgpu 0000:45:00.0: GPU reset begin!
[drm] ring test on 10 succeeded in 22 usecs
[drm] ring test on 10 succeeded in 29 usecs
amdgpu 0000:45:00.0: GPU reset succeeded, trying to resume
[drm] PCIE GART of 512M enabled (table at 0x00000080001E8000).
[drm] PSP is resuming...
[drm] reserve 0x7200000 from 0x81f7c00000 for PSP TMR
amdgpu: [powerplay] SMU is resuming...
amdgpu: [powerplay] SMU is resumed successfully!
[drm] kiq ring mec 2 pipe 1 q 0
[drm] ring test on 10 succeeded in 33 usecs
[drm] ring test on 10 succeeded in 8 usecs
[drm] gfx 0 ring me 0 pipe 0 q 0
[drm:gfx_v10_0_ring_test_ring [amdgpu]] *ERROR* amdgpu: ring 0 test failed
(scratch(0xC040)=3D0xCAFEDEAD)
[drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP block
<gfx_v10_0> failed -22
amdgpu 0000:45:00.0: GPU reset(1) failed
amdgpu 0000:45:00.0: GPU reset end with ret =3D -22
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1937, emitted seq=3D1937
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process Xorg
pid 1861 thread Xorg:cs0 pid 1864
amdgpu 0000:45:00.0: GPU reset begin!


GPU recovery is really important, especially at the moment with the current
state of navi stability issues.
Please fix and enable recovery as default.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15724222601.6Bde9bDa3.3893
Date: Wed, 30 Oct 2019 07:57:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Radeon 5700 / Navi: amdgpu.gpu_recovery not working"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112174">112174</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD Radeon 5700 / Navi: amdgpu.gpu_recovery not working
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>temp201602&#64;kaffeeschluerfer.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have set &quot;amdgpu.gpu_recovery=3D1&quot; in my kernel bo=
ot params. When my GPU is
crashing, recovery does not work.

Syslog:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1935, emitted seq=3D1937
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process Xorg
pid 1861 thread Xorg:cs0 pid 1864
 amdgpu 0000:45:00.0: GPU reset begin!
[drm] ring test on 10 succeeded in 22 usecs
[drm] ring test on 10 succeeded in 29 usecs
amdgpu 0000:45:00.0: GPU reset succeeded, trying to resume
[drm] PCIE GART of 512M enabled (table at 0x00000080001E8000).
[drm] PSP is resuming...
[drm] reserve 0x7200000 from 0x81f7c00000 for PSP TMR
amdgpu: [powerplay] SMU is resuming...
amdgpu: [powerplay] SMU is resumed successfully!
[drm] kiq ring mec 2 pipe 1 q 0
[drm] ring test on 10 succeeded in 33 usecs
[drm] ring test on 10 succeeded in 8 usecs
[drm] gfx 0 ring me 0 pipe 0 q 0
[drm:gfx_v10_0_ring_test_ring [amdgpu]] *ERROR* amdgpu: ring 0 test failed
(scratch(0xC040)=3D0xCAFEDEAD)
[drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP block
&lt;gfx_v10_0&gt; failed -22
amdgpu 0000:45:00.0: GPU reset(1) failed
amdgpu 0000:45:00.0: GPU reset end with ret =3D -22
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D1937, emitted seq=3D1937
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process Xorg
pid 1861 thread Xorg:cs0 pid 1864
amdgpu 0000:45:00.0: GPU reset begin!


GPU recovery is really important, especially at the moment with the current
state of navi stability issues.
Please fix and enable recovery as default.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15724222601.6Bde9bDa3.3893--

--===============1121012134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1121012134==--
