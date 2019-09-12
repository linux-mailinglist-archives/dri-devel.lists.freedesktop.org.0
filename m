Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BBB09F6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 10:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90A16EC3A;
	Thu, 12 Sep 2019 08:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACF116EC3A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:11:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A52A372167; Thu, 12 Sep 2019 08:11:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111669] Navi GPU hang in Minecraft
Date: Thu, 12 Sep 2019 08:11:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: git@dougty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111669-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1803532441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1803532441==
Content-Type: multipart/alternative; boundary="15682759030.91ac96f.30649"
Content-Transfer-Encoding: 7bit


--15682759030.91ac96f.30649
Date: Thu, 12 Sep 2019 08:11:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111669

            Bug ID: 111669
           Summary: Navi GPU hang in Minecraft
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: git@dougty.com
        QA Contact: dri-devel@lists.freedesktop.org

When playing Minecraft, being in a certain area of my world at night causes=
 my
GPU to hang. I'm using Optifine and Sildur's shaders.

Sep 12 01:38:42 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx_0.0.0 timeout, signaled seq=3D19965, emitted seq=3D19967
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Proc=
ess
information: process java pid 1375 thread java:cs0 pid 1433


CPU: 3700X
GPU: Sapphire 5700XT (reference)
Motherboard: Gigabyte X570-I (BIOS F4)
Kernel: 5.3.0-rc8-mainline
Mesa: 19.3.0_devel.115190.f83f9d7daa0
LLVM: 10.0.0_r326348.d7d8bb937ad
OpenGL string (as seen ingame): 4.5 (Compatibility Profile) Mesa 19.3.0-dev=
el
(git-f83f9d7daa), X.Org, AMD NAVI10 (DRM 3.33.0, 5.3.0-rc8-mainline, LLVM
10.0.0)

I get the hang extremely reliably when in this specific spot at night, but =
only
this one apitrace recreates the hang when I replay it. Apologies for the
filesize.

https://drive.google.com/open?id=3D16wAmCa27o2xxv3bFXnR6rGXAum0Wci_5

When the hangs occur, my screen freezes but everything is still running in =
the
background, and I need to use REISUB hotkeys in order to reboot. Occurs with
both PCIe 4.0 and 3.0 set in the BIOS.

Please let me know if any more info is needed.
Thank you.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682759030.91ac96f.30649
Date: Thu, 12 Sep 2019 08:11:43 +0000
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
   title=3D"NEW - Navi GPU hang in Minecraft"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111669">111669</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Navi GPU hang in Minecraft
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>git&#64;dougty.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When playing Minecraft, being in a certain area of my world at=
 night causes my
GPU to hang. I'm using Optifine and Sildur's shaders.

Sep 12 01:38:42 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ER=
ROR*
Waiting for fences timed out or interrupted!
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx_0.0.0 timeout, signaled seq=3D19965, emitted seq=3D19967
Sep 12 01:38:47 xxx kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Proc=
ess
information: process java pid 1375 thread java:cs0 pid 1433


CPU: 3700X
GPU: Sapphire 5700XT (reference)
Motherboard: Gigabyte X570-I (BIOS F4)
Kernel: 5.3.0-rc8-mainline
Mesa: 19.3.0_devel.115190.f83f9d7daa0
LLVM: 10.0.0_r326348.d7d8bb937ad
OpenGL string (as seen ingame): 4.5 (Compatibility Profile) Mesa 19.3.0-dev=
el
(git-f83f9d7daa), X.Org, AMD NAVI10 (DRM 3.33.0, 5.3.0-rc8-mainline, LLVM
10.0.0)

I get the hang extremely reliably when in this specific spot at night, but =
only
this one apitrace recreates the hang when I replay it. Apologies for the
filesize.

<a href=3D"https://drive.google.com/open?id=3D16wAmCa27o2xxv3bFXnR6rGXAum0W=
ci_5">https://drive.google.com/open?id=3D16wAmCa27o2xxv3bFXnR6rGXAum0Wci_5<=
/a>

When the hangs occur, my screen freezes but everything is still running in =
the
background, and I need to use REISUB hotkeys in order to reboot. Occurs with
both PCIe 4.0 and 3.0 set in the BIOS.

Please let me know if any more info is needed.
Thank you.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682759030.91ac96f.30649--

--===============1803532441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1803532441==--
