Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90509BA27D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED46E8D6;
	Sun, 22 Sep 2019 12:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC08089DBC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 12:01:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E213D72162; Sun, 22 Sep 2019 12:01:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sun, 22 Sep 2019 12:01:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0709336775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0709336775==
Content-Type: multipart/alternative; boundary="15691536680.cbdD9.14208"
Content-Transfer-Encoding: 7bit


--15691536680.cbdD9.14208
Date: Sun, 22 Sep 2019 12:01:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

            Bug ID: 111763
           Summary: ring_gfx hangs/freezes on Navi gpus
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: popovic.marko@protonmail.com

I'm making this topic as a separate tracking of ring_gfx related bugs since=
 we
should keep https://bugs.freedesktop.org/show_bug.cgi?id=3D111481 related to
sdma0/1 type freezes since those are ones that seem to cause random "Out of=
 the
blue" hangs on the desktop.

There is another type of freeze/hang happening when playing Starcraft II via
D9VK. This one doesn't seem to be related to either ngg or dma because I ha=
ve
them both disabled by AMD_DEBUG=3Dnodma and AMD_DEBUG=3Dnongg and the hangs=
 occur
anyway, on exactly the same place every time.

Error logs:
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D2361623, emitted seq=3D2361625
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process SC2_x64.exe pid 20236 thread SC2_x64.exe pid 2=
0236

I will try and provide trace files by using renderdoc for described issues.
They also happen in native games like Rise of the Tomb Raider and Vulkan et=
c.
Will provide as much info as possible.

Using Kernel 5.3, MESA 19.2 and llvm9.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15691536680.cbdD9.14208
Date: Sun, 22 Sep 2019 12:01:08 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">111763</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>ring_gfx hangs/freezes on Navi gpus
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
          <td>popovic.marko&#64;protonmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm making this topic as a separate tracking of ring_gfx relat=
ed bugs since we
should keep <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111481</a> related to
sdma0/1 type freezes since those are ones that seem to cause random &quot;O=
ut of the
blue&quot; hangs on the desktop.

There is another type of freeze/hang happening when playing Starcraft II via
D9VK. This one doesn't seem to be related to either ngg or dma because I ha=
ve
them both disabled by AMD_DEBUG=3Dnodma and AMD_DEBUG=3Dnongg and the hangs=
 occur
anyway, on exactly the same place every time.

Error logs:
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D2361623, emitted seq=3D2361625
sep 17 11:48:24 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process SC2_x64.exe pid 20236 thread SC2_x64.exe pid 2=
0236

I will try and provide trace files by using renderdoc for described issues.
They also happen in native games like Rise of the Tomb Raider and Vulkan et=
c.
Will provide as much info as possible.

Using Kernel 5.3, MESA 19.2 and llvm9.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15691536680.cbdD9.14208--

--===============0709336775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0709336775==--
