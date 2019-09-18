Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B701B594C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 03:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963F289EAE;
	Wed, 18 Sep 2019 01:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4C436EDB4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:34:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A8B7472167; Wed, 18 Sep 2019 01:34:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111727] [Panfrost] Kernel panic in weston running glmark2
Date: Wed, 18 Sep 2019 01:34:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ixn@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111727-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1149544161=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1149544161==
Content-Type: multipart/alternative; boundary="15687704790.D0853BB.13136"
Content-Transfer-Encoding: 7bit


--15687704790.D0853BB.13136
Date: Wed, 18 Sep 2019 01:34:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111727

            Bug ID: 111727
           Summary: [Panfrost] Kernel panic in weston running glmark2
           Product: DRI
           Version: unspecified
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/other
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ixn@disroot.org

The Linux kernel panics for me between the second ([build] use-vbo=3Dtrue) =
and
third ([texture] texture-filter=3Dnearest) benches of glmark2{,-es2}-waylan=
d with
Panfrost.

Other programs I've tried such as es2gears and supertuxkart don't trigger t=
his
bug.

Reproducing:
1) Launch weston with the Panfrost driver.
2) Start glmark2-wayland or glmark2-es2-wayland
3) Wait 20 seconds

Actual results:
 Kernel panic.

Expected Results:
 glmark2 displaying a textured cube.

Build Date & Hardware:

Kernel: 5.3.0
Distro: Arch Linux ARM
Mesa: git master (built 2019-09-16)
Weston: 6.0.1
glmark2: git master
libdrm: 2.4.99
SOC: RK3288
GPU: Mali t760

Kernel log:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 000000b8
pgd =3D 87de9609
[000000b8] *pgd=3D00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in: uas hci_uart btqca btbcm btintel serdev cros_ec_lightbar
cros_ec_sysfs cros_ec_debugfs panfrost cros_ec_dev rockchip_rga gpu_sched
v4l2_mem2mem rk_crypto videobuf2_dma_sg dw_hdmi_cec cros_ec_spi
CPU: 1 PID: 2936 Comm: weston Not tainted 5.3.0 #4
Hardware name: Rockchip (Device Tree)
PC is at drm_gem_shmem_create+0x40/0x108
LR is at 0xeb438c00
pc : [<c08b8244>]    lr : [<eb438c00>]    psr: a00f0013
sp : e1c6ddb8  ip : 00253699  fp : e1c6de7c
r10: ea0393f4  r9 : e1c6de7c  r8 : e1c6de7c
r7 : e570e840  r6 : ea039000  r5 : ffffffe4  r4 : 001d5000
r3 : edfc65fc  r2 : edfc65f8  r1 : 600f0013  r0 : ffffffe4
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 1c84406a  DAC: 00000051
Process weston (pid: 2936, stack limit =3D 0xe176b393)
Stack: (0xe1c6ddb8 to 0xe1c6e000)
dda0:                                                       001d5000 e570e0=
40
ddc0: e570e840 c08b8958 e570e040 e570e040 ea039000 e570e840 e1c6de7c bf0391=
b4
dde0: e570e040 ebb9f240 ea039000 c08a0034 ebb9f240 ea039000 e52c8c00 e52c8d=
04
de00: e1c6de7c c08a022c ea039000 e52c8c00 00000000 00000031 c08a0368 e1c6de=
7c
de20: 0000002e c08924b0 bea7bb00 00000000 c00c642e ebcb1f00 e52c8c00 c00c64=
2e
de40: bea7b6e8 c1097db0 0000000c c0892898 00000000 c12c8c68 bea7bb00 c0c320=
20
de60: 200f0093 0000000c e1c6de7c 0000000c c08a0368 00000051 00000000 000000=
00
de80: 00000000 00000031 ea7d0f20 c016e540 00000000 e1c6de9c ed96d700 000000=
00
dea0: 00000000 00000000 e1c6dea8 e1c6dea8 00000000 ea7d0f00 ea7d0f50 e1c6de=
e0
dec0: ea7d0f58 00000000 00000000 ea7d0f00 00000000 c0f33794 00000000 c02bb6=
cc
dee0: e1c6dee0 e1c6dee0 00000020 00000020 ea7d0f20 bea7bc10 00000020 b1e40e=
00
df00: 00000001 bea7b6e8 ea037c20 00000000 c00c642e ebcb1f00 00000011 000000=
36
df20: bea7b78c c0285430 e1ea5600 b1e40e00 00000000 bea7bad4 40000040 dd37d4=
00
df40: 00000129 c0101204 e1c6c000 00000129 020a5a30 c0c332d8 00000000 bea7bc=
10
df60: 00000000 00000070 ebcb1f00 ebcb1f00 00000000 c00c642e bea7b6e8 000000=
11
df80: 00000036 c0285ca0 b6fbd8c8 bea7b6e8 c00c642e 00000036 c0101204 e1c6c0=
00
dfa0: 00000036 c0101000 b6fbd8c8 bea7b6e8 00000011 c00c642e bea7b6e8 fb4c94=
00
dfc0: b6fbd8c8 bea7b6e8 c00c642e 00000036 01c68fc0 b6fbd8c8 b61e22c8 bea7b7=
8c
dfe0: b68c2efc bea7b6cc b68a9eac b6db4f4c 800f0010 00000011 00000000 000000=
00
[<c08b8244>] (drm_gem_shmem_create) from [<c08b8958>]
(drm_gem_shmem_prime_import_sg_table+0x28/0xc8)
[<c08b8958>] (drm_gem_shmem_prime_import_sg_table) from [<bf0391b4>]
(panfrost_gem_prime_import_sg_table+0xc/0x30 [panfrost])
[<bf0391b4>] (panfrost_gem_prime_import_sg_table [panfrost]) from [<c08a003=
4>]
(drm_gem_prime_import_dev+0xa0/0x104)
[<c08a0034>] (drm_gem_prime_import_dev) from [<c08a022c>]
(drm_gem_prime_fd_to_handle+0x18c/0x1a8)
[<c08a022c>] (drm_gem_prime_fd_to_handle) from [<c08924b0>]
(drm_ioctl_kernel+0x90/0xd0)
[<c08924b0>] (drm_ioctl_kernel) from [<c0892898>] (drm_ioctl+0x208/0x3c8)
[<c0892898>] (drm_ioctl) from [<c0285430>] (do_vfs_ioctl+0x9c/0x8b0)
[<c0285430>] (do_vfs_ioctl) from [<c0285ca0>] (ksys_ioctl+0x5c/0x80)
[<c0285ca0>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xe1c6dfa8 to 0xe1c6dff0)
dfa0:                   b6fbd8c8 bea7b6e8 00000011 c00c642e bea7b6e8 fb4c94=
00
dfc0: b6fbd8c8 bea7b6e8 c00c642e 00000036 01c68fc0 b6fbd8c8 b61e22c8 bea7b7=
8c
dfe0: b68c2efc bea7b6cc b68a9eac b6db4f4c
Code: e1a05000 e3550000 03e0500b 0a00000d (e59530d4)
---[ end trace cfbdeb1d1679c306 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687704790.D0853BB.13136
Date: Wed, 18 Sep 2019 01:34:39 +0000
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
   title=3D"NEW - [Panfrost] Kernel panic in weston running glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111727">111727</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Panfrost] Kernel panic in weston running glmark2
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
          <td>ARM
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
          <td>DRM/other
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ixn&#64;disroot.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The Linux kernel panics for me between the second ([build] use=
-vbo=3Dtrue) and
third ([texture] texture-filter=3Dnearest) benches of glmark2{,-es2}-waylan=
d with
Panfrost.

Other programs I've tried such as es2gears and supertuxkart don't trigger t=
his
bug.

Reproducing:
1) Launch weston with the Panfrost driver.
2) Start glmark2-wayland or glmark2-es2-wayland
3) Wait 20 seconds

Actual results:
 Kernel panic.

Expected Results:
 glmark2 displaying a textured cube.

Build Date &amp; Hardware:

Kernel: 5.3.0
Distro: Arch Linux ARM
Mesa: git master (built 2019-09-16)
Weston: 6.0.1
glmark2: git master
libdrm: 2.4.99
SOC: RK3288
GPU: Mali t760

Kernel log:

8&lt;--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 000000b8
pgd =3D 87de9609
[000000b8] *pgd=3D00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in: uas hci_uart btqca btbcm btintel serdev cros_ec_lightbar
cros_ec_sysfs cros_ec_debugfs panfrost cros_ec_dev rockchip_rga gpu_sched
v4l2_mem2mem rk_crypto videobuf2_dma_sg dw_hdmi_cec cros_ec_spi
CPU: 1 PID: 2936 Comm: weston Not tainted 5.3.0 #4
Hardware name: Rockchip (Device Tree)
PC is at drm_gem_shmem_create+0x40/0x108
LR is at 0xeb438c00
pc : [&lt;c08b8244&gt;]    lr : [&lt;eb438c00&gt;]    psr: a00f0013
sp : e1c6ddb8  ip : 00253699  fp : e1c6de7c
r10: ea0393f4  r9 : e1c6de7c  r8 : e1c6de7c
r7 : e570e840  r6 : ea039000  r5 : ffffffe4  r4 : 001d5000
r3 : edfc65fc  r2 : edfc65f8  r1 : 600f0013  r0 : ffffffe4
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 1c84406a  DAC: 00000051
Process weston (pid: 2936, stack limit =3D 0xe176b393)
Stack: (0xe1c6ddb8 to 0xe1c6e000)
dda0:                                                       001d5000 e570e0=
40
ddc0: e570e840 c08b8958 e570e040 e570e040 ea039000 e570e840 e1c6de7c bf0391=
b4
dde0: e570e040 ebb9f240 ea039000 c08a0034 ebb9f240 ea039000 e52c8c00 e52c8d=
04
de00: e1c6de7c c08a022c ea039000 e52c8c00 00000000 00000031 c08a0368 e1c6de=
7c
de20: 0000002e c08924b0 bea7bb00 00000000 c00c642e ebcb1f00 e52c8c00 c00c64=
2e
de40: bea7b6e8 c1097db0 0000000c c0892898 00000000 c12c8c68 bea7bb00 c0c320=
20
de60: 200f0093 0000000c e1c6de7c 0000000c c08a0368 00000051 00000000 000000=
00
de80: 00000000 00000031 ea7d0f20 c016e540 00000000 e1c6de9c ed96d700 000000=
00
dea0: 00000000 00000000 e1c6dea8 e1c6dea8 00000000 ea7d0f00 ea7d0f50 e1c6de=
e0
dec0: ea7d0f58 00000000 00000000 ea7d0f00 00000000 c0f33794 00000000 c02bb6=
cc
dee0: e1c6dee0 e1c6dee0 00000020 00000020 ea7d0f20 bea7bc10 00000020 b1e40e=
00
df00: 00000001 bea7b6e8 ea037c20 00000000 c00c642e ebcb1f00 00000011 000000=
36
df20: bea7b78c c0285430 e1ea5600 b1e40e00 00000000 bea7bad4 40000040 dd37d4=
00
df40: 00000129 c0101204 e1c6c000 00000129 020a5a30 c0c332d8 00000000 bea7bc=
10
df60: 00000000 00000070 ebcb1f00 ebcb1f00 00000000 c00c642e bea7b6e8 000000=
11
df80: 00000036 c0285ca0 b6fbd8c8 bea7b6e8 c00c642e 00000036 c0101204 e1c6c0=
00
dfa0: 00000036 c0101000 b6fbd8c8 bea7b6e8 00000011 c00c642e bea7b6e8 fb4c94=
00
dfc0: b6fbd8c8 bea7b6e8 c00c642e 00000036 01c68fc0 b6fbd8c8 b61e22c8 bea7b7=
8c
dfe0: b68c2efc bea7b6cc b68a9eac b6db4f4c 800f0010 00000011 00000000 000000=
00
[&lt;c08b8244&gt;] (drm_gem_shmem_create) from [&lt;c08b8958&gt;]
(drm_gem_shmem_prime_import_sg_table+0x28/0xc8)
[&lt;c08b8958&gt;] (drm_gem_shmem_prime_import_sg_table) from [&lt;bf0391b4=
&gt;]
(panfrost_gem_prime_import_sg_table+0xc/0x30 [panfrost])
[&lt;bf0391b4&gt;] (panfrost_gem_prime_import_sg_table [panfrost]) from [&l=
t;c08a0034&gt;]
(drm_gem_prime_import_dev+0xa0/0x104)
[&lt;c08a0034&gt;] (drm_gem_prime_import_dev) from [&lt;c08a022c&gt;]
(drm_gem_prime_fd_to_handle+0x18c/0x1a8)
[&lt;c08a022c&gt;] (drm_gem_prime_fd_to_handle) from [&lt;c08924b0&gt;]
(drm_ioctl_kernel+0x90/0xd0)
[&lt;c08924b0&gt;] (drm_ioctl_kernel) from [&lt;c0892898&gt;] (drm_ioctl+0x=
208/0x3c8)
[&lt;c0892898&gt;] (drm_ioctl) from [&lt;c0285430&gt;] (do_vfs_ioctl+0x9c/0=
x8b0)
[&lt;c0285430&gt;] (do_vfs_ioctl) from [&lt;c0285ca0&gt;] (ksys_ioctl+0x5c/=
0x80)
[&lt;c0285ca0&gt;] (ksys_ioctl) from [&lt;c0101000&gt;] (ret_fast_syscall+0=
x0/0x54)
Exception stack(0xe1c6dfa8 to 0xe1c6dff0)
dfa0:                   b6fbd8c8 bea7b6e8 00000011 c00c642e bea7b6e8 fb4c94=
00
dfc0: b6fbd8c8 bea7b6e8 c00c642e 00000036 01c68fc0 b6fbd8c8 b61e22c8 bea7b7=
8c
dfe0: b68c2efc bea7b6cc b68a9eac b6db4f4c
Code: e1a05000 e3550000 03e0500b 0a00000d (e59530d4)
---[ end trace cfbdeb1d1679c306 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687704790.D0853BB.13136--

--===============1149544161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1149544161==--
