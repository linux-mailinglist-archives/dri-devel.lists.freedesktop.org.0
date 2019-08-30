Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA2A2FAD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD96E26D;
	Fri, 30 Aug 2019 06:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 772446E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:21:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 73F9B72161; Fri, 30 Aug 2019 06:21:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111524] GPU doesn't work after resume
Date: Fri, 30 Aug 2019 06:21:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: samuel@sieb.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0799689284=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0799689284==
Content-Type: multipart/alternative; boundary="15671460810.DF1EcaF.31342"
Content-Transfer-Encoding: 7bit


--15671460810.DF1EcaF.31342
Date: Fri, 30 Aug 2019 06:21:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111524

            Bug ID: 111524
           Summary: GPU doesn't work after resume
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: samuel@sieb.net

CPU is AMD A9-9420 RADEON R5
GPU is: 00:01.0 0300: 1002:98e4 (rev da)
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Stoney [Radeon R2/R3/R4/R5 Graphics] (rev da) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device 8330
        Flags: bus master, fast devsel, latency 0, IRQ 35
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0800000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at 4000 [size=3D256]
        Memory at f0400000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Complex Integrated Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [270] Secondary PCI Express <?>
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

If I suspend the laptop then on resume the GPU does not work.  I've tried w=
ith
a 5.0 and a 5.2 kernel, same issue.  dc=3D0 or dc=3D1 doesn't make any obvi=
ous
difference.  I have gpu recovery enabled, otherwise it really hangs.  With
Xorg, the screen looks the same as when suspended.  With Wayland, there is
bunch of garbage around.  In both cases, the mouse moves around, but there =
are
no screen updates.  The following output shows up in dmesg with the last li=
ne
repeating endlessly, probably correlated with screen update attempts:

[   48.337053] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D73, emitted seq=3D75
[   48.337202] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process gnome-shell pid 977 thread gnome-shel:cs0 pid 1005
[   48.337206] [drm] IP block:gfx_v8_0 is hung!
[   48.337319] amdgpu 0000:00:01.0: GPU reset begin!
[   48.337761] amdgpu 0000:00:01.0: GRBM_SOFT_RESET=3D0x000F0001
[   48.337817] amdgpu 0000:00:01.0: SRBM_SOFT_RESET=3D0x00000100
[   48.468854] [drm] recover vram bo from shadow start
[   48.468855] [drm] recover vram bo from shadow done
[   48.468857] [drm] Skip scheduling IBs!
[   48.500792] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   48.502030] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   48.503933] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   49.144048] amdgpu 0000:00:01.0: GPU reset(2) succeeded!
[   49.147491] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   53.186659] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   56.651026] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671460810.DF1EcaF.31342
Date: Fri, 30 Aug 2019 06:21:21 +0000
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
   title=3D"NEW - GPU doesn't work after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111524">111524</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU doesn't work after resume
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
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
          <td>samuel&#64;sieb.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>CPU is AMD A9-9420 RADEON R5
GPU is: 00:01.0 0300: 1002:98e4 (rev da)
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Stoney [Radeon R2/R3/R4/R5 Graphics] (rev da) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device 8330
        Flags: bus master, fast devsel, latency 0, IRQ 35
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0800000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at 4000 [size=3D256]
        Memory at f0400000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 &lt;?&gt;
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Complex Integrated Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
&lt;?&gt;
        Capabilities: [270] Secondary PCI Express &lt;?&gt;
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

If I suspend the laptop then on resume the GPU does not work.  I've tried w=
ith
a 5.0 and a 5.2 kernel, same issue.  dc=3D0 or dc=3D1 doesn't make any obvi=
ous
difference.  I have gpu recovery enabled, otherwise it really hangs.  With
Xorg, the screen looks the same as when suspended.  With Wayland, there is
bunch of garbage around.  In both cases, the mouse moves around, but there =
are
no screen updates.  The following output shows up in dmesg with the last li=
ne
repeating endlessly, probably correlated with screen update attempts:

[   48.337053] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D73, emitted seq=3D75
[   48.337202] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process gnome-shell pid 977 thread gnome-shel:cs0 pid 1005
[   48.337206] [drm] IP block:gfx_v8_0 is hung!
[   48.337319] amdgpu 0000:00:01.0: GPU reset begin!
[   48.337761] amdgpu 0000:00:01.0: GRBM_SOFT_RESET=3D0x000F0001
[   48.337817] amdgpu 0000:00:01.0: SRBM_SOFT_RESET=3D0x00000100
[   48.468854] [drm] recover vram bo from shadow start
[   48.468855] [drm] recover vram bo from shadow done
[   48.468857] [drm] Skip scheduling IBs!
[   48.500792] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   48.502030] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   48.503933] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   49.144048] amdgpu 0000:00:01.0: GPU reset(2) succeeded!
[   49.147491] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   53.186659] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[   56.651026] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671460810.DF1EcaF.31342--

--===============0799689284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0799689284==--
