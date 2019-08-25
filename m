Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A79C125
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 02:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADAA6E0EE;
	Sun, 25 Aug 2019 00:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B43736E0EE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 00:50:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ABB97721AA; Sun, 25 Aug 2019 00:50:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 25 Aug 2019 00:50:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0355147945=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0355147945==
Content-Type: multipart/alternative; boundary="15666942431.Fded7.3066"
Content-Transfer-Encoding: 7bit


--15666942431.Fded7.3066
Date: Sun, 25 Aug 2019 00:50:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

            Bug ID: 111481
           Summary: AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
                    with kernel 5.3 and mesa 19.2 -git/llvm9
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: popovic.marko@protonmail.com

I've tried my AMD Radeon RX 5700 XT on both ubuntu (llvm 9 / mesa 19.3 - Oi=
baf
PPA) and Manjaro (llvm 10 git / mesa-git).
On both I've been using Gnome shell and in both cases I had frequent lockups
and freezes. Once my GPU disconnected to Monitor and remained so until I
rebooted, other times desktop would just freeze and crash the whole system.

Software tried: LLVM 10 git / MESA 19.3 - git on Manjaro
                LLVM 9 / MESA 19.3 git from Oibaf PPA
Kernels tried: Manjaro 5.3 RC4, Ubuntu 5.3 RC5 generic, Ubuntu drm-tip 5.3
daily

Error log:
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] ERROR Waiting for fences timed out or interrupted!
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] ERROR r=
ing
gfx_0.0.0 timeout, signaled seq=3D94235, emitted seq=3D94237
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] ERROR
Process information: process citra-qt pid 27356 thread citra-qt:cs0 pid 273=
66

Happened on all setups, bug was pretty much the same, lockups weren't extre=
mely
frequent but frequent enough that they were very noticable (5-6 freezes per=
 day
on average)

Faulty hardware is probably out of options since I never had a hiccup or
anything even close to crash or freeze on my Windows desktop.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15666942431.Fded7.3066
Date: Sun, 25 Aug 2019 00:50:43 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">111481</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with ker=
nel 5.3 and mesa 19.2 -git/llvm9
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>critical
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
          <td>popovic.marko&#64;protonmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I've tried my AMD Radeon RX 5700 XT on both ubuntu (llvm 9 / m=
esa 19.3 - Oibaf
PPA) and Manjaro (llvm 10 git / mesa-git).
On both I've been using Gnome shell and in both cases I had frequent lockups
and freezes. Once my GPU disconnected to Monitor and remained so until I
rebooted, other times desktop would just freeze and crash the whole system.

Software tried: LLVM 10 git / MESA 19.3 - git on Manjaro
                LLVM 9 / MESA 19.3 git from Oibaf PPA
Kernels tried: Manjaro 5.3 RC4, Ubuntu 5.3 RC5 generic, Ubuntu drm-tip 5.3
daily

Error log:
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] ERROR Waiting for fences timed out or interrupted!
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] ERROR r=
ing
gfx_0.0.0 timeout, signaled seq=3D94235, emitted seq=3D94237
avg 24 22:53:58 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] ERROR
Process information: process citra-qt pid 27356 thread citra-qt:cs0 pid 273=
66

Happened on all setups, bug was pretty much the same, lockups weren't extre=
mely
frequent but frequent enough that they were very noticable (5-6 freezes per=
 day
on average)

Faulty hardware is probably out of options since I never had a hiccup or
anything even close to crash or freeze on my Windows desktop.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15666942431.Fded7.3066--

--===============0355147945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0355147945==--
