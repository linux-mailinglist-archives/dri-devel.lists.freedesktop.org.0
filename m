Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177897A3F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 15:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873366E32E;
	Wed, 21 Aug 2019 13:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F76E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 13:03:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1B80372161; Wed, 21 Aug 2019 13:03:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111456] amdgpu numerous failures on resume from suspend
Date: Wed, 21 Aug 2019 13:03:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop-bugs@fermulator.fastmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111456-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0065614960=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0065614960==
Content-Type: multipart/alternative; boundary="15663925950.9aFfb6dF.30735"
Content-Transfer-Encoding: 7bit


--15663925950.9aFfb6dF.30735
Date: Wed, 21 Aug 2019 13:03:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111456

            Bug ID: 111456
           Summary: amdgpu numerous failures on resume from suspend
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop-bugs@fermulator.fastmail.org

Created attachment 145113
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145113&action=3Dedit
Aug21 fermmy resume syslog full (after resume)

This morning, ~8:40AM EST Aug21 2019, resumed my system from suspend.
Normally it just comes back AOK, but today it hung. The screens were all wo=
nky
(mostly grey with a speckle of colour), disk was going bonkers, couldn't SSH
into it;  sometimes this happens and I just walk away for 10 mins and come
back, sometimes it fixes itself, sometimes not.  Today I was not patient and
just reset it after ~3mins of waiting.

Took a look at the previous boot system log and there were numerous AMDGPU
related failures.

snippets include:
{{{
Aug 21 08:42:21 fermmy kernel: [drm:amdgpu_suspend [amdgpu]] *ERROR* suspen=
d of
IP block <uvd_v6_0> failed -12

Aug 21 08:42:24 fermmy kernel: do_IRQ: 0.34 No irq handler for vector

Aug 21 08:42:25 fermmy kernel: [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERRO=
R*
amdgpu: ring 0 test failed (scratch(0xC040)=3D0xCAFEDEAD)
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_resume_phase2 [amdgpu]] *ERROR*
resume of IP block <gfx_v8_0> failed -22
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_resume failed (-22).
Aug 21 08:42:25 fermmy kernel: dpm_run_callback(): pci_pm_resume+0x0/0xb0
returns -22
Aug 21 08:42:25 fermmy kernel: PM: Device 0000:07:00.0 failed to resume asy=
nc:
error -22

Aug 21 08:42:25 fermmy kernel: amdgpu 0000:07:00.0: couldn't schedule ib on
ring <sdma0>
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
scheduling IBs (-22)
Aug 21 08:42:25 fermmy kernel: [drm:amd_sched_main [amdgpu]] *ERROR* Failed=
 to
run job!

}}}


Linux fermmy 4.15.0-58-generic #64-Ubuntu SMP Tue Aug 6 11:12:41 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

Ubuntu 18.04.3 LTS \n \l

 dpkg --list | egrep -i "amd|dri-|xorg|mesa" | grep -v amd64
ii  libdrm-amdgpu1:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
2.4.97-1ubuntu1~18.04.1                             i386         Userspace
interface to amdgpu-specific kernel DRM services -- runtime
ii  libegl-mesa0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the EGL API -- Mesa vendor library
ii  libgl1-mesa-dri:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the OpenGL API -- DRI modules
rc  libgl1-mesa-dri-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the OpenGL API -- DRI modules
rc  libgl1-mesa-dri-lts-utopic:i386                                  3:13=
=20=20=20=20=20=20
                                         i386         Transitional package =
for
libgl1-mesa-dri-lts-utopic
ii  libgl1-mesa-glx:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
19.1.2-0~b~padoka0                                  i386         transition=
al
dummy package
rc  libgl1-mesa-glx-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the OpenGL API -- GLX runtime
ii  libglapi-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the GL API -- shared library
rc  libglapi-mesa-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the GL API -- shared library
ii  libglu1-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
9.0.0-2.1build1                                     i386         Mesa OpenGL
utility library (GLU)
ii  libglx-mesa0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the OpenGL API -- GLX vendor library
ii  libosmesa6:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
19.1.2-0~b~padoka0                                  i386         Mesa
Off-screen rendering extension
rc  libtxc-dxtn-s2tc0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
0~git20131104-1.1                                   i386         Texture
compression library for Mesa
ii  libwayland-egl1-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
19.1.2-0~b~padoka0                                  i386         transition=
al
dummy package
ii  python3-xkit=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
0.5.0ubuntu2                                        all          library for
the manipulation of xorg.conf files (Python 3)
ii  xorg-docs-core=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
1:1.7.1-1.1                                         all          Core
documentation for the X.org X Window System
ii  xorg-sgml-doctools                                               1:1.11=
-1=20=20
                                         all          Common tools for buil=
ding
X.Org SGML documentation

$ sudo lshw -C video
  *-display=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       description: VGA compatible controller
       product: Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
       vendor: Advanced Micro Devices, Inc. [AMD/ATI]
       physical id: 0
       bus info: pci@0000:07:00.0
       version: ef
       width: 64 bits
       clock: 33MHz
       capabilities: pm pciexpress msi vga_controller bus_master cap_list r=
om
       configuration: driver=3Damdgpu latency=3D0
       resources: irq:63 memory:c0000000-cfffffff memory:d0000000-d01fffff
ioport:c000(size=3D256) memory:fe600000-fe63ffff memory:c0000-dffff


My monitors are 3-fold atm (normally only run with 2x)
2xDVI + 1xDP

$ xrandr | grep normal
DisplayPort-0 connected 1680x1050+3840+25 (normal left inverted right x axi=
s y
axis) 474mm x 296mm
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
DVI-D-0 connected 1920x1080+1920+25 (normal left inverted right x axis y ax=
is)
521mm x 293mm
DVI-D-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 521mm x 293mm

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663925950.9aFfb6dF.30735
Date: Wed, 21 Aug 2019 13:03:15 +0000
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
   title=3D"NEW - amdgpu numerous failures on resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111456">111456</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu numerous failures on resume from suspend
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
          <td>freedesktop-bugs&#64;fermulator.fastmail.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145113=
" name=3D"attach_145113" title=3D"Aug21 fermmy resume syslog full (after re=
sume)">attachment 145113</a> <a href=3D"attachment.cgi?id=3D145113&amp;acti=
on=3Dedit" title=3D"Aug21 fermmy resume syslog full (after resume)">[detail=
s]</a></span>
Aug21 fermmy resume syslog full (after resume)

This morning, ~8:40AM EST Aug21 2019, resumed my system from suspend.
Normally it just comes back AOK, but today it hung. The screens were all wo=
nky
(mostly grey with a speckle of colour), disk was going bonkers, couldn't SSH
into it;  sometimes this happens and I just walk away for 10 mins and come
back, sometimes it fixes itself, sometimes not.  Today I was not patient and
just reset it after ~3mins of waiting.

Took a look at the previous boot system log and there were numerous AMDGPU
related failures.

snippets include:
{{{
Aug 21 08:42:21 fermmy kernel: [drm:amdgpu_suspend [amdgpu]] *ERROR* suspen=
d of
IP block &lt;uvd_v6_0&gt; failed -12

Aug 21 08:42:24 fermmy kernel: do_IRQ: 0.34 No irq handler for vector

Aug 21 08:42:25 fermmy kernel: [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERRO=
R*
amdgpu: ring 0 test failed (scratch(0xC040)=3D0xCAFEDEAD)
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_resume_phase2 [amdgpu]] *ERROR*
resume of IP block &lt;gfx_v8_0&gt; failed -22
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_resume failed (-22).
Aug 21 08:42:25 fermmy kernel: dpm_run_callback(): pci_pm_resume+0x0/0xb0
returns -22
Aug 21 08:42:25 fermmy kernel: PM: Device 0000:07:00.0 failed to resume asy=
nc:
error -22

Aug 21 08:42:25 fermmy kernel: amdgpu 0000:07:00.0: couldn't schedule ib on
ring &lt;sdma0&gt;
Aug 21 08:42:25 fermmy kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
scheduling IBs (-22)
Aug 21 08:42:25 fermmy kernel: [drm:amd_sched_main [amdgpu]] *ERROR* Failed=
 to
run job!

}}}


Linux fermmy 4.15.0-58-generic #64-Ubuntu SMP Tue Aug 6 11:12:41 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

Ubuntu 18.04.3 LTS \n \l

 dpkg --list | egrep -i &quot;amd|dri-|xorg|mesa&quot; | grep -v amd64
ii  libdrm-amdgpu1:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
2.4.97-1ubuntu1~18.04.1                             i386         Userspace
interface to amdgpu-specific kernel DRM services -- runtime
ii  libegl-mesa0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the EGL API -- Mesa vendor library
ii  libgl1-mesa-dri:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the OpenGL API -- DRI modules
rc  libgl1-mesa-dri-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the OpenGL API -- DRI modules
rc  libgl1-mesa-dri-lts-utopic:i386                                  3:13=
=20=20=20=20=20=20
                                         i386         Transitional package =
for
libgl1-mesa-dri-lts-utopic
ii  libgl1-mesa-glx:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
19.1.2-0~b~padoka0                                  i386         transition=
al
dummy package
rc  libgl1-mesa-glx-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the OpenGL API -- GLX runtime
ii  libglapi-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the GL API -- shared library
rc  libglapi-mesa-lts-quantal:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
9.0.3-0ubuntu0.4~precise1                           i386         free
implementation of the GL API -- shared library
ii  libglu1-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
9.0.0-2.1build1                                     i386         Mesa OpenGL
utility library (GLU)
ii  libglx-mesa0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
19.1.2-0~b~padoka0                                  i386         free
implementation of the OpenGL API -- GLX vendor library
ii  libosmesa6:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
19.1.2-0~b~padoka0                                  i386         Mesa
Off-screen rendering extension
rc  libtxc-dxtn-s2tc0:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
0~git20131104-1.1                                   i386         Texture
compression library for Mesa
ii  libwayland-egl1-mesa:i386=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
19.1.2-0~b~padoka0                                  i386         transition=
al
dummy package
ii  python3-xkit=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
0.5.0ubuntu2                                        all          library for
the manipulation of xorg.conf files (Python 3)
ii  xorg-docs-core=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
1:1.7.1-1.1                                         all          Core
documentation for the X.org X Window System
ii  xorg-sgml-doctools                                               1:1.11=
-1=20=20
                                         all          Common tools for buil=
ding
X.Org SGML documentation

$ sudo lshw -C video
  *-display=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       description: VGA compatible controller
       product: Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
       vendor: Advanced Micro Devices, Inc. [AMD/ATI]
       physical id: 0
       bus info: pci&#64;0000:07:00.0
       version: ef
       width: 64 bits
       clock: 33MHz
       capabilities: pm pciexpress msi vga_controller bus_master cap_list r=
om
       configuration: driver=3Damdgpu latency=3D0
       resources: irq:63 memory:c0000000-cfffffff memory:d0000000-d01fffff
ioport:c000(size=3D256) memory:fe600000-fe63ffff memory:c0000-dffff


My monitors are 3-fold atm (normally only run with 2x)
2xDVI + 1xDP

$ xrandr | grep normal
DisplayPort-0 connected 1680x1050+3840+25 (normal left inverted right x axi=
s y
axis) 474mm x 296mm
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
DVI-D-0 connected 1920x1080+1920+25 (normal left inverted right x axis y ax=
is)
521mm x 293mm
DVI-D-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 521mm x 293mm</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663925950.9aFfb6dF.30735--

--===============0065614960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0065614960==--
