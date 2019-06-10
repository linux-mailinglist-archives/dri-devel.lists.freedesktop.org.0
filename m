Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9853B5AC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20F89135;
	Mon, 10 Jun 2019 13:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF389135
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:02:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5489B72167; Mon, 10 Jun 2019 13:02:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110883] [Regression linux 5.2-rc4][bisected] hang on boot
Date: Mon, 10 Jun 2019 13:02:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: freedesktop@sibrenvasse.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110883-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0259155470=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0259155470==
Content-Type: multipart/alternative; boundary="15601717550.E74f4C7.6124"
Content-Transfer-Encoding: 7bit


--15601717550.E74f4C7.6124
Date: Mon, 10 Jun 2019 13:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110883

            Bug ID: 110883
           Summary: [Regression linux 5.2-rc4][bisected] hang on boot
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@sibrenvasse.nl

Created attachment 144491
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144491&action=3Dedit
bisect log

Laptop Hardware:
Model: HP EliteBook 8570w
GPU: Chelsea XT GL [FirePro M4000]

relevant kernel command line:
amdgpu.si_support=3D1 amdgpu.dc=3D1 radeon.si_support=3D0

After upgrading from 5.2-rc3 to 5.2-rc4 laptop hangs during boot. (Xorg does
not start and I'm unable to switch to a TTY)

---
Jun 10 12:36:32 hostname kernel: amdgpu 0000:01:00.0: amdgpu_device_ip_init
failed
Jun 10 12:36:32 hostname kernel: amdgpu 0000:01:00.0: Fatal error during GPU
init
Jun 10 12:36:32 hostname kernel: [drm] amdgpu: finishing device.
Jun 10 12:36:32 hostname kernel: [drm] amdgpu atom LVDS backlight unloaded
Jun 10 12:36:32 hostname kernel: ------------[ cut here ]------------
Jun 10 12:36:32 hostname kernel: Memory manager not clean during takedown.
Jun 10 12:36:32 hostname kernel: WARNING: CPU: 1 PID: 226 at
drivers/gpu/drm/drm_mm.c:939 drm_mm_takedown+0x1f/0x30 [drm]
Jun 10 12:36:32 hostname kernel: Modules linked in: amdgpu(+) amd_iommu_v2
gpu_sched i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm agpgart
Jun 10 12:36:32 hostname kernel: CPU: 1 PID: 226 Comm: modprobe Not tainted
5.2.0-rc4-mainline #6
Jun 10 12:36:32 hostname kernel: Hardware name: Hewlett-Packard HP EliteBook
8570w/176B, BIOS 68IAV Ver. F.70 07/30/2018
Jun 10 12:36:32 hostname kernel: RIP: 0010:drm_mm_takedown+0x1f/0x30 [drm]
Jun 10 12:36:32 hostname kernel: Code: c4 ce d1 0f 1f 84 00 00 00 00 00 0f =
1f
44 00 00 48 8b 47 38 48 83 c7 38 48 39 c7 75 01 c3 48 c7 c7 48 ad 1d c0 e8 =
9b
c7 ce d1 <0f> 0b c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00
Jun 10 12:36:32 hostname kernel: RSP: 0018:ffffb846c1cc7990 EFLAGS: 00010286
Jun 10 12:36:32 hostname kernel: RAX: 0000000000000000 RBX: ffff92bb29eb4060
RCX: 0000000000000000
Jun 10 12:36:32 hostname kernel: RDX: 0000000000000000 RSI: 0000000000000082
RDI: 00000000ffffffff
Jun 10 12:36:32 hostname kernel: RBP: ffff92bb29eb41f0 R08: 00000000000002ae
R09: 0000000000000001
Jun 10 12:36:32 hostname kernel: R10: 0000000000000000 R11: 0000000000000001
R12: ffff92bb2b104f00
Jun 10 12:36:32 hostname kernel: R13: ffff92bb2b104fe8 R14: 0000000000000170
R15: ffff92bb29ce1020
Jun 10 12:36:32 hostname kernel: FS:  00007f6a1ec00740(0000)
GS:ffff92bb2da40000(0000) knlGS:0000000000000000
Jun 10 12:36:32 hostname kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 10 12:36:32 hostname kernel: CR2: 00007ffe870f1fc0 CR3: 0000000429ec6003
CR4: 00000000001606e0
Jun 10 12:36:32 hostname kernel: Call Trace:
Jun 10 12:36:32 hostname kernel:  amdgpu_vram_mgr_fini+0x2d/0xa0 [amdgpu]
Jun 10 12:36:32 hostname kernel:  ttm_bo_clean_mm+0xa9/0xb0 [ttm]
Jun 10 12:36:32 hostname kernel:  amdgpu_ttm_fini+0x71/0xd0 [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_bo_fini+0xe/0x30 [amdgpu]
Jun 10 12:36:32 hostname kernel:  gmc_v6_0_sw_fini+0x26/0x50 [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_device_fini+0x257/0x43d [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_driver_unload_kms+0xb2/0x150 [amdg=
pu]
Jun 10 12:36:32 hostname kernel:  amdgpu_driver_load_kms.cold.2+0x5a/0xc4
[amdgpu]
Jun 10 12:36:32 hostname kernel:  drm_dev_register+0x10d/0x150 [drm]
Jun 10 12:36:32 hostname kernel:  amdgpu_pci_probe+0xcb/0x130 [amdgpu]
Jun 10 12:36:32 hostname kernel:  ? _raw_spin_unlock_irqrestore+0x20/0x40
Jun 10 12:36:32 hostname kernel:  local_pci_probe+0x42/0x80
Jun 10 12:36:32 hostname kernel:  ? pci_match_device+0xc5/0x100
Jun 10 12:36:32 hostname kernel:  pci_device_probe+0x112/0x190
Jun 10 12:36:32 hostname kernel:  really_probe+0xef/0x390
Jun 10 12:36:32 hostname kernel:  driver_probe_device+0xb4/0x100
Jun 10 12:36:32 hostname kernel:  device_driver_attach+0x4f/0x60
Jun 10 12:36:32 hostname kernel:  __driver_attach+0x86/0x140
Jun 10 12:36:32 hostname kernel:  ? device_driver_attach+0x60/0x60
Jun 10 12:36:32 hostname kernel:  ? device_driver_attach+0x60/0x60
Jun 10 12:36:32 hostname kernel:  bus_for_each_dev+0x77/0xc0
Jun 10 12:36:32 hostname kernel:  bus_add_driver+0x14a/0x1e0
Jun 10 12:36:32 hostname kernel:  ? 0xffffffffc0694000
Jun 10 12:36:32 hostname kernel:  driver_register+0x6b/0xb0
Jun 10 12:36:32 hostname kernel:  ? 0xffffffffc0694000
Jun 10 12:36:32 hostname kernel:  do_one_initcall+0x46/0x224
Jun 10 12:36:32 hostname kernel:  ? kmem_cache_alloc_trace+0x33/0x1c0
Jun 10 12:36:32 hostname kernel:  ? do_init_module+0x22/0x220
Jun 10 12:36:32 hostname kernel:  do_init_module+0x5a/0x220
Jun 10 12:36:32 hostname kernel:  load_module+0x2049/0x2300
Jun 10 12:36:32 hostname kernel:  ? vfs_read+0x116/0x140
Jun 10 12:36:32 hostname kernel:  ? __se_sys_finit_module+0x97/0xf0
Jun 10 12:36:32 hostname kernel:  __se_sys_finit_module+0x97/0xf0
Jun 10 12:36:32 hostname kernel:  do_syscall_64+0x5b/0x1a0
Jun 10 12:36:32 hostname kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jun 10 12:36:32 hostname kernel: RIP: 0033:0x7f6a1ed2097d
Jun 10 12:36:32 hostname kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 =
90
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 94 0c 00 f7 d8 64 89 01 48
Jun 10 12:36:32 hostname kernel: RSP: 002b:00007ffc58e63b78 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jun 10 12:36:32 hostname kernel: RAX: ffffffffffffffda RBX: 000056130b231da0
RCX: 00007f6a1ed2097d
Jun 10 12:36:32 hostname kernel: RDX: 0000000000000000 RSI: 000056130b234250
RDI: 000000000000000e
Jun 10 12:36:32 hostname kernel: RBP: 000056130b234250 R08: 0000000000000000
R09: 0000000000000000
Jun 10 12:36:32 hostname kernel: R10: 000000000000000e R11: 0000000000000246
R12: 0000000000000000
Jun 10 12:36:32 hostname kernel: R13: 000056130b231c60 R14: 0000000000060000
R15: 000056130b231da0
Jun 10 12:36:32 hostname kernel: ---[ end trace eaa2ccb642b1fac6 ]---
Jun 10 12:36:32 hostname kernel: [TTM] Finalizing pool allocator
Jun 10 12:36:32 hostname kernel: [TTM] Finalizing DMA pool allocator
Jun 10 12:36:32 hostname kernel: [TTM] Zone  kernel: Used memory at exit: 50
KiB
Jun 10 12:36:32 hostname kernel: [TTM] Zone   dma32: Used memory at exit: 0=
 KiB
Jun 10 12:36:32 hostname kernel: [drm] amdgpu: ttm finalized
Jun 10 12:36:32 hostname kernel: amdgpu: probe of 0000:01:00.0 failed with
error -22
----

I've bisected the issue between tags v5.2-rc3 and v5.2-rc4.
1929059893022a3bbed43934c7313e66aad7346b is the first bad commit. The issue=
 is
not present on v5.2-rc4 with this commit reverted. Bisect log attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15601717550.E74f4C7.6124
Date: Mon, 10 Jun 2019 13:02:35 +0000
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
   title=3D"NEW - [Regression linux 5.2-rc4][bisected] hang on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883">110883</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Regression linux 5.2-rc4][bisected] hang on boot
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
          <td>freedesktop&#64;sibrenvasse.nl
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144491=
" name=3D"attach_144491" title=3D"bisect log">attachment 144491</a> <a href=
=3D"attachment.cgi?id=3D144491&amp;action=3Dedit" title=3D"bisect log">[det=
ails]</a></span>
bisect log

Laptop Hardware:
Model: HP EliteBook 8570w
GPU: Chelsea XT GL [FirePro M4000]

relevant kernel command line:
amdgpu.si_support=3D1 amdgpu.dc=3D1 radeon.si_support=3D0

After upgrading from 5.2-rc3 to 5.2-rc4 laptop hangs during boot. (Xorg does
not start and I'm unable to switch to a TTY)

---
Jun 10 12:36:32 hostname kernel: amdgpu 0000:01:00.0: amdgpu_device_ip_init
failed
Jun 10 12:36:32 hostname kernel: amdgpu 0000:01:00.0: Fatal error during GPU
init
Jun 10 12:36:32 hostname kernel: [drm] amdgpu: finishing device.
Jun 10 12:36:32 hostname kernel: [drm] amdgpu atom LVDS backlight unloaded
Jun 10 12:36:32 hostname kernel: ------------[ cut here ]------------
Jun 10 12:36:32 hostname kernel: Memory manager not clean during takedown.
Jun 10 12:36:32 hostname kernel: WARNING: CPU: 1 PID: 226 at
drivers/gpu/drm/drm_mm.c:939 drm_mm_takedown+0x1f/0x30 [drm]
Jun 10 12:36:32 hostname kernel: Modules linked in: amdgpu(+) amd_iommu_v2
gpu_sched i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm agpgart
Jun 10 12:36:32 hostname kernel: CPU: 1 PID: 226 Comm: modprobe Not tainted
5.2.0-rc4-mainline #6
Jun 10 12:36:32 hostname kernel: Hardware name: Hewlett-Packard HP EliteBook
8570w/176B, BIOS 68IAV Ver. F.70 07/30/2018
Jun 10 12:36:32 hostname kernel: RIP: 0010:drm_mm_takedown+0x1f/0x30 [drm]
Jun 10 12:36:32 hostname kernel: Code: c4 ce d1 0f 1f 84 00 00 00 00 00 0f =
1f
44 00 00 48 8b 47 38 48 83 c7 38 48 39 c7 75 01 c3 48 c7 c7 48 ad 1d c0 e8 =
9b
c7 ce d1 &lt;0f&gt; 0b c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 4=
4 00 00
Jun 10 12:36:32 hostname kernel: RSP: 0018:ffffb846c1cc7990 EFLAGS: 00010286
Jun 10 12:36:32 hostname kernel: RAX: 0000000000000000 RBX: ffff92bb29eb4060
RCX: 0000000000000000
Jun 10 12:36:32 hostname kernel: RDX: 0000000000000000 RSI: 0000000000000082
RDI: 00000000ffffffff
Jun 10 12:36:32 hostname kernel: RBP: ffff92bb29eb41f0 R08: 00000000000002ae
R09: 0000000000000001
Jun 10 12:36:32 hostname kernel: R10: 0000000000000000 R11: 0000000000000001
R12: ffff92bb2b104f00
Jun 10 12:36:32 hostname kernel: R13: ffff92bb2b104fe8 R14: 0000000000000170
R15: ffff92bb29ce1020
Jun 10 12:36:32 hostname kernel: FS:  00007f6a1ec00740(0000)
GS:ffff92bb2da40000(0000) knlGS:0000000000000000
Jun 10 12:36:32 hostname kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 10 12:36:32 hostname kernel: CR2: 00007ffe870f1fc0 CR3: 0000000429ec6003
CR4: 00000000001606e0
Jun 10 12:36:32 hostname kernel: Call Trace:
Jun 10 12:36:32 hostname kernel:  amdgpu_vram_mgr_fini+0x2d/0xa0 [amdgpu]
Jun 10 12:36:32 hostname kernel:  ttm_bo_clean_mm+0xa9/0xb0 [ttm]
Jun 10 12:36:32 hostname kernel:  amdgpu_ttm_fini+0x71/0xd0 [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_bo_fini+0xe/0x30 [amdgpu]
Jun 10 12:36:32 hostname kernel:  gmc_v6_0_sw_fini+0x26/0x50 [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_device_fini+0x257/0x43d [amdgpu]
Jun 10 12:36:32 hostname kernel:  amdgpu_driver_unload_kms+0xb2/0x150 [amdg=
pu]
Jun 10 12:36:32 hostname kernel:  amdgpu_driver_load_kms.cold.2+0x5a/0xc4
[amdgpu]
Jun 10 12:36:32 hostname kernel:  drm_dev_register+0x10d/0x150 [drm]
Jun 10 12:36:32 hostname kernel:  amdgpu_pci_probe+0xcb/0x130 [amdgpu]
Jun 10 12:36:32 hostname kernel:  ? _raw_spin_unlock_irqrestore+0x20/0x40
Jun 10 12:36:32 hostname kernel:  local_pci_probe+0x42/0x80
Jun 10 12:36:32 hostname kernel:  ? pci_match_device+0xc5/0x100
Jun 10 12:36:32 hostname kernel:  pci_device_probe+0x112/0x190
Jun 10 12:36:32 hostname kernel:  really_probe+0xef/0x390
Jun 10 12:36:32 hostname kernel:  driver_probe_device+0xb4/0x100
Jun 10 12:36:32 hostname kernel:  device_driver_attach+0x4f/0x60
Jun 10 12:36:32 hostname kernel:  __driver_attach+0x86/0x140
Jun 10 12:36:32 hostname kernel:  ? device_driver_attach+0x60/0x60
Jun 10 12:36:32 hostname kernel:  ? device_driver_attach+0x60/0x60
Jun 10 12:36:32 hostname kernel:  bus_for_each_dev+0x77/0xc0
Jun 10 12:36:32 hostname kernel:  bus_add_driver+0x14a/0x1e0
Jun 10 12:36:32 hostname kernel:  ? 0xffffffffc0694000
Jun 10 12:36:32 hostname kernel:  driver_register+0x6b/0xb0
Jun 10 12:36:32 hostname kernel:  ? 0xffffffffc0694000
Jun 10 12:36:32 hostname kernel:  do_one_initcall+0x46/0x224
Jun 10 12:36:32 hostname kernel:  ? kmem_cache_alloc_trace+0x33/0x1c0
Jun 10 12:36:32 hostname kernel:  ? do_init_module+0x22/0x220
Jun 10 12:36:32 hostname kernel:  do_init_module+0x5a/0x220
Jun 10 12:36:32 hostname kernel:  load_module+0x2049/0x2300
Jun 10 12:36:32 hostname kernel:  ? vfs_read+0x116/0x140
Jun 10 12:36:32 hostname kernel:  ? __se_sys_finit_module+0x97/0xf0
Jun 10 12:36:32 hostname kernel:  __se_sys_finit_module+0x97/0xf0
Jun 10 12:36:32 hostname kernel:  do_syscall_64+0x5b/0x1a0
Jun 10 12:36:32 hostname kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jun 10 12:36:32 hostname kernel: RIP: 0033:0x7f6a1ed2097d
Jun 10 12:36:32 hostname kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 =
90
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24
08 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 94 0c 00 f7 d8 64 8=
9 01 48
Jun 10 12:36:32 hostname kernel: RSP: 002b:00007ffc58e63b78 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jun 10 12:36:32 hostname kernel: RAX: ffffffffffffffda RBX: 000056130b231da0
RCX: 00007f6a1ed2097d
Jun 10 12:36:32 hostname kernel: RDX: 0000000000000000 RSI: 000056130b234250
RDI: 000000000000000e
Jun 10 12:36:32 hostname kernel: RBP: 000056130b234250 R08: 0000000000000000
R09: 0000000000000000
Jun 10 12:36:32 hostname kernel: R10: 000000000000000e R11: 0000000000000246
R12: 0000000000000000
Jun 10 12:36:32 hostname kernel: R13: 000056130b231c60 R14: 0000000000060000
R15: 000056130b231da0
Jun 10 12:36:32 hostname kernel: ---[ end trace eaa2ccb642b1fac6 ]---
Jun 10 12:36:32 hostname kernel: [TTM] Finalizing pool allocator
Jun 10 12:36:32 hostname kernel: [TTM] Finalizing DMA pool allocator
Jun 10 12:36:32 hostname kernel: [TTM] Zone  kernel: Used memory at exit: 50
KiB
Jun 10 12:36:32 hostname kernel: [TTM] Zone   dma32: Used memory at exit: 0=
 KiB
Jun 10 12:36:32 hostname kernel: [drm] amdgpu: ttm finalized
Jun 10 12:36:32 hostname kernel: amdgpu: probe of 0000:01:00.0 failed with
error -22
----

I've bisected the issue between tags v5.2-rc3 and v5.2-rc4.
1929059893022a3bbed43934c7313e66aad7346b is the first bad commit. The issue=
 is
not present on v5.2-rc4 with this commit reverted. Bisect log attached.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15601717550.E74f4C7.6124--

--===============0259155470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0259155470==--
