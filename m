Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6116D86
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 00:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91A189DC5;
	Tue,  7 May 2019 22:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DEAC89DC5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 22:30:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5A7C27215A; Tue,  7 May 2019 22:30:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110637] Enabling OpenCL in Libreoffice kills Vega 64
Date: Tue, 07 May 2019 22:30:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110637-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0559655991=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0559655991==
Content-Type: multipart/alternative; boundary="15572682411.C9BEfAff4.26611"
Content-Transfer-Encoding: 7bit


--15572682411.C9BEfAff4.26611
Date: Tue, 7 May 2019 22:30:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110637

            Bug ID: 110637
           Summary: Enabling OpenCL in Libreoffice kills Vega 64
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mezin.alexander@gmail.com

Created attachment 144191
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144191&action=3Dedit
kernel log

Open LibreOffice, enable OpenCL in settings, restart it.
Result:

[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled seq=
=3D698,
emitted seq=3D700
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
soffice.bin pid 2517 thread soffice.bi:cs0 pid 2545
amdgpu 0000:67:00.0: GPU reset begin!
amdgpu 0000:67:00.0: GPU BACO reset
amdgpu: [powerplay] Failed message: 0x5, input parameter: 0x2000000, error
code: 0xffffffff
amdgpu 0000:67:00.0: GPU reset succeeded, trying to resume
[drm] PCIE GART of 512M enabled (table at 0x000000F400900000).
[drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is lost!
[drm] PSP is resuming...
[drm] reserve 0x400000 from 0xf400d00000 for PSP TMR SIZE
[drm] UVD and UVD ENC initialized successfully.
[drm] VCE initialized successfully.
[drm] recover vram bo from shadow start
[drm] recover vram bo from shadow done
[drm] Skip scheduling IBs!
[drm] Skip scheduling IBs!
amdgpu 0000:67:00.0: GPU reset(2) succeeded!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
...

Also the same problem with multiple games, so probably not OpenCL-related, =
just
the easiest way to trigger it.

linux 5.1.arch1-1 (same results with 5.0.13, will also retest with 4.9)
linux-firmware 20190502.92e17d0-1 (same results with 20190424.4b6cf2b-1)
opencl-mesa 19.0.3-1
libdrm 2.4.98-1
libreoffice-fresh 6.2.3-2

GNOME on X.org with modesetting driver

Sapphire Vega 64 Nitro+, no overclocking

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572682411.C9BEfAff4.26611
Date: Tue, 7 May 2019 22:30:41 +0000
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
   title=3D"NEW - Enabling OpenCL in Libreoffice kills Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637">110637</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Enabling OpenCL in Libreoffice kills Vega 64
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>mezin.alexander&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144191=
" name=3D"attach_144191" title=3D"kernel log">attachment 144191</a> <a href=
=3D"attachment.cgi?id=3D144191&amp;action=3Dedit" title=3D"kernel log">[det=
ails]</a></span>
kernel log

Open LibreOffice, enable OpenCL in settings, restart it.
Result:

[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled seq=
=3D698,
emitted seq=3D700
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
soffice.bin pid 2517 thread soffice.bi:cs0 pid 2545
amdgpu 0000:67:00.0: GPU reset begin!
amdgpu 0000:67:00.0: GPU BACO reset
amdgpu: [powerplay] Failed message: 0x5, input parameter: 0x2000000, error
code: 0xffffffff
amdgpu 0000:67:00.0: GPU reset succeeded, trying to resume
[drm] PCIE GART of 512M enabled (table at 0x000000F400900000).
[drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is lost!
[drm] PSP is resuming...
[drm] reserve 0x400000 from 0xf400d00000 for PSP TMR SIZE
[drm] UVD and UVD ENC initialized successfully.
[drm] VCE initialized successfully.
[drm] recover vram bo from shadow start
[drm] recover vram bo from shadow done
[drm] Skip scheduling IBs!
[drm] Skip scheduling IBs!
amdgpu 0000:67:00.0: GPU reset(2) succeeded!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
...

Also the same problem with multiple games, so probably not OpenCL-related, =
just
the easiest way to trigger it.

linux 5.1.arch1-1 (same results with 5.0.13, will also retest with 4.9)
linux-firmware 20190502.92e17d0-1 (same results with 20190424.4b6cf2b-1)
opencl-mesa 19.0.3-1
libdrm 2.4.98-1
libreoffice-fresh 6.2.3-2

GNOME on X.org with modesetting driver

Sapphire Vega 64 Nitro+, no overclocking</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572682411.C9BEfAff4.26611--

--===============0559655991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0559655991==--
