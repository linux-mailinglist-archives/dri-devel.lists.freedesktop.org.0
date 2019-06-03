Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D632D0C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 11:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE17891FD;
	Mon,  3 Jun 2019 09:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05C32891FD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 09:42:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 02A3D72167; Mon,  3 Jun 2019 09:42:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Mon, 03 Jun 2019 09:42:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-y0NMxO1SJO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1075961007=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1075961007==
Content-Type: multipart/alternative; boundary="15595549221.4ac59.25311"
Content-Transfer-Encoding: 7bit


--15595549221.4ac59.25311
Date: Mon, 3 Jun 2019 09:42:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #1 from Gobinda Joy <gobinda.joy@gmail.com> ---
I've tested kernel version from 5.1.0 to the latest git all shows similar
problems.

For the 5.2 git versions when using amdgpu.dpm=3D0 command line the followi=
ng
error occurs:
kernel: [drm] amdgpu kernel modesetting enabled.
kernel: CRAT table not found
kernel: Virtual CRAT table created for CPU
kernel: Parsing CRAT table with 1 nodes
kernel: Creating topology SYSFS entries
kernel: Topology: Add CPU node
kernel: Finished initializing topology
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 0:
0xe0000000 -> 0xefffffff
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 2:
0xf0000000 -> 0xf01fffff
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 5:
0xf7800000 -> 0xf783ffff
kernel: checking generic (e0000000 300000) vs hw (e0000000 10000000)
kernel: fb0: switching to amdgpudrmfb from EFI VGA
kernel: Console: switching to colour dummy device 80x25
kernel: amdgpu 0000:04:00.0: vgaarb: deactivate vga console
kernel: [drm] initializing kernel modesetting (POLARIS10 0x1002:0x67DF
0x1DA2:0xE387 0xE7).
kernel: [drm] register mmio base: 0xF7800000
kernel: [drm] register mmio size: 262144
kernel: [drm] add ip block number 0 <vi_common>
kernel: [drm] add ip block number 1 <gmc_v8_0>
kernel: [drm] add ip block number 2 <tonga_ih>
kernel: [drm] add ip block number 3 <gfx_v8_0>
kernel: [drm] add ip block number 4 <sdma_v3_0>
kernel: [drm] add ip block number 5 <powerplay>
kernel: [drm] add ip block number 6 <dm>
kernel: [drm] add ip block number 7 <uvd_v6_0>
kernel: [drm] add ip block number 8 <vce_v3_0>
kernel: kfd kfd: skipped device 1002:67df, PCI rejects atomics
kernel: [drm] UVD is enabled in VM mode
kernel: [drm] UVD ENC is enabled in VM mode
kernel: [drm] VCE enabled in VM mode
kernel: resource sanity check: requesting [mem 0x000c0000-0x000dffff], which
spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000d3fff window]
kernel: caller pci_map_rom+0x6a/0x17d mapping multiple BARs
kernel: amdgpu 0000:04:00.0: No more image in the PCI ROM
kernel: ATOM BIOS: 113-1E3870U-O45
kernel: [drm] RAS INFO: ras initialized successfully, hardware ability[0]
ras_mask[0]
kernel: [drm] vm size is 128 GB, 2 levels, block size is 10-bit, fragment s=
ize
is 9-bit
kernel: amdgpu 0000:04:00.0: VRAM: 8192M 0x000000F400000000 -
0x000000F5FFFFFFFF (8192M used)
kernel: amdgpu 0000:04:00.0: GART: 256M 0x000000FF00000000 - 0x000000FF0FFF=
FFFF
kernel: [drm] Detected VRAM RAM=3D8192M, BAR=3D256M
kernel: [drm] RAM width 256bits GDDR5
kernel: [TTM] Zone  kernel: Available graphics memory: 12350340 KiB
kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: [drm] amdgpu: 8192M of VRAM memory ready
kernel: [drm] amdgpu: 8192M of GTT memory ready.
kernel: [drm] GART: num cpu pages 65536, num gpu pages 65536
kernel: [drm] PCIE GART of 256M enabled (table at 0x000000F400300000).
kernel: [drm] Chained IB support enabled!
kernel: [drm] Found UVD firmware Version: 1.130 Family ID: 16
kernel: [drm] Found VCE firmware Version: 53.26 Binary ID: 3
kernel: BUG: unable to handle page fault for address: ffffa5bd8394f650
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: PGD 606549067 P4D 606549067 PUD 0=20
kernel: Oops: 0000 [#1] SMP PTI
kernel: CPU: 6 PID: 461 Comm: systemd-udevd Not tainted
5.2.0-0.rc1.git1.1.vanilla.knurd.1.fc30.x86_64 #1
kernel: Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./G1.Sniper 3, BIOS F8k 04/29/2013
kernel: RIP: 0010:bw_calcs_data_update_from_pplib.isra.0+0x378/0x4d0 [amdgp=
u]
kernel: Code: 00 00 5b 5d 41 5c 41 5d 41 5e c3 48 8b 7d 00 4c 89 f2 be 02 0=
0 00
00 e8 26 bf f9 ff 8b 04 24 4c 8b 23 be e8 03 00 00 83 e8 01 <8b> 7c 84 04 e=
8 6f
4d fb ff be e8 03 00 00 49 89 44 24 60 8b 04 24
kernel: RSP: 0018:ffffa5b98394f650 EFLAGS: 00010297
kernel: RAX: 00000000ffffffff RBX: ffff928b34cb92d8 RCX: 0000000000000000
kernel: RDX: ffffa5b98394f58c RSI: 00000000000003e8 RDI: ffff928b39c12800
kernel: RBP: ffff928b34cb9208 R08: 0000000000000020 R09: 000000032a000000
kernel: R10: 00000003ce000000 R11: 0000001770000000 R12: ffff928b3ac0b300
kernel: R13: ffffa5b98394f76c R14: ffffa5b98394f650 R15: ffffffffc0839d60
kernel: FS:  00007f1133ad1940(0000) GS:ffff928b46b80000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: ffffa5bd8394f650 CR3: 00000005faf54004 CR4: 00000000001606e0
kernel: Call Trace:
kernel:  dce112_create_resource_pool+0x6de/0x700 [amdgpu]
kernel:  dc_create_resource_pool+0x16c/0x220 [amdgpu]
kernel:  ? dal_gpio_service_create+0x92/0x110 [amdgpu]
kernel:  dc_create+0x219/0x620 [amdgpu]
kernel:  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
kernel:  amdgpu_dm_init+0xeb/0x160 [amdgpu]
kernel:  dm_hw_init+0xe/0x20 [amdgpu]
kernel:  amdgpu_device_init.cold+0x128d/0x161f [amdgpu]
kernel:  ? kmalloc_order+0x14/0x30
kernel:  amdgpu_driver_load_kms+0x88/0x270 [amdgpu]
kernel:  drm_dev_register+0x111/0x150 [drm]
kernel:  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
kernel:  ? __pm_runtime_resume+0x58/0x80
kernel:  local_pci_probe+0x42/0x80
kernel:  pci_device_probe+0x115/0x190
kernel:  really_probe+0xf0/0x390
kernel:  driver_probe_device+0xb6/0x100
kernel:  device_driver_attach+0x53/0x60
kernel:  __driver_attach+0x8a/0x150
kernel:  ? device_driver_attach+0x60/0x60
kernel:  bus_for_each_dev+0x78/0xc0
kernel:  bus_add_driver+0x14a/0x1e0
kernel:  driver_register+0x6c/0xb0
kernel:  ? 0xffffffffc09b9000
kernel:  do_one_initcall+0x46/0x1f4
kernel:  ? _cond_resched+0x15/0x30
kernel:  ? kmem_cache_alloc_trace+0x154/0x1c0
kernel:  ? do_init_module+0x23/0x230
kernel:  do_init_module+0x5c/0x230
kernel:  load_module+0x22eb/0x28e0
kernel:  ? __do_sys_init_module+0x16e/0x1a0
kernel:  __do_sys_init_module+0x16e/0x1a0
kernel:  do_syscall_64+0x5b/0x180
kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: RIP: 0033:0x7f1134ad1bae
kernel: Code: 48 8b 0d dd 42 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1=
f 84
00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 f=
f ff
73 01 c3 48 8b 0d aa 42 0c 00 f7 d8 64 89 01 48
kernel: RSP: 002b:00007ffe9cb83118 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
0af
kernel: RAX: ffffffffffffffda RBX: 0000563b364ce650 RCX: 00007f1134ad1bae
kernel: RDX: 0000563b364b50a0 RSI: 00000000006dfa2e RDI: 0000563b36d998b0
kernel: RBP: 0000563b36d998b0 R08: 0000563b364ba730 R09: 0000000000000001
kernel: R10: 0000000000000002 R11: 0000000000000246 R12: 0000563b364b50a0
kernel: R13: 0000000000000006 R14: 0000563b364c9fa0 R15: 0000000000000000
kernel: Modules linked in: amdgpu(+) amd_iommu_v2 gpu_sched i2c_algo_bit ttm
drm_kms_helper crc32c_intel serio_raw drm e1000e(+) alx mdio video wmi vfio=
_pci
irqbypass vfio_virqfd vfio_iommu_type1 vfio
kernel: CR2: ffffa5bd8394f650
kernel: ---[ end trace e14f412d43dd70ae ]---
kernel: RIP: 0010:bw_calcs_data_update_from_pplib.isra.0+0x378/0x4d0 [amdgp=
u]
kernel: Code: 00 00 5b 5d 41 5c 41 5d 41 5e c3 48 8b 7d 00 4c 89 f2 be 02 0=
0 00
00 e8 26 bf f9 ff 8b 04 24 4c 8b 23 be e8 03 00 00 83 e8 01 <8b> 7c 84 04 e=
8 6f
4d fb ff be e8 03 00 00 49 89 44 24 60 8b 04 24
kernel: RSP: 0018:ffffa5b98394f650 EFLAGS: 00010297
kernel: RAX: 00000000ffffffff RBX: ffff928b34cb92d8 RCX: 0000000000000000
kernel: RDX: ffffa5b98394f58c RSI: 00000000000003e8 RDI: ffff928b39c12800
kernel: RBP: ffff928b34cb9208 R08: 0000000000000020 R09: 000000032a000000
kernel: R10: 00000003ce000000 R11: 0000001770000000 R12: ffff928b3ac0b300
kernel: R13: ffffa5b98394f76c R14: ffffa5b98394f650 R15: ffffffffc0839d60
kernel: FS:  00007f1133ad1940(0000) GS:ffff928b46b80000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: ffffa5bd8394f650 CR3: 00000005faf54004 CR4: 00000000001606e0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595549221.4ac59.25311
Date: Mon, 3 Jun 2019 09:42:02 +0000
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
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>I've tested kernel version from 5.1.0 to the latest git all sh=
ows similar
problems.

For the 5.2 git versions when using amdgpu.dpm=3D0 command line the followi=
ng
error occurs:
kernel: [drm] amdgpu kernel modesetting enabled.
kernel: CRAT table not found
kernel: Virtual CRAT table created for CPU
kernel: Parsing CRAT table with 1 nodes
kernel: Creating topology SYSFS entries
kernel: Topology: Add CPU node
kernel: Finished initializing topology
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 0:
0xe0000000 -&gt; 0xefffffff
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 2:
0xf0000000 -&gt; 0xf01fffff
kernel: amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 5:
0xf7800000 -&gt; 0xf783ffff
kernel: checking generic (e0000000 300000) vs hw (e0000000 10000000)
kernel: fb0: switching to amdgpudrmfb from EFI VGA
kernel: Console: switching to colour dummy device 80x25
kernel: amdgpu 0000:04:00.0: vgaarb: deactivate vga console
kernel: [drm] initializing kernel modesetting (POLARIS10 0x1002:0x67DF
0x1DA2:0xE387 0xE7).
kernel: [drm] register mmio base: 0xF7800000
kernel: [drm] register mmio size: 262144
kernel: [drm] add ip block number 0 &lt;vi_common&gt;
kernel: [drm] add ip block number 1 &lt;gmc_v8_0&gt;
kernel: [drm] add ip block number 2 &lt;tonga_ih&gt;
kernel: [drm] add ip block number 3 &lt;gfx_v8_0&gt;
kernel: [drm] add ip block number 4 &lt;sdma_v3_0&gt;
kernel: [drm] add ip block number 5 &lt;powerplay&gt;
kernel: [drm] add ip block number 6 &lt;dm&gt;
kernel: [drm] add ip block number 7 &lt;uvd_v6_0&gt;
kernel: [drm] add ip block number 8 &lt;vce_v3_0&gt;
kernel: kfd kfd: skipped device 1002:67df, PCI rejects atomics
kernel: [drm] UVD is enabled in VM mode
kernel: [drm] UVD ENC is enabled in VM mode
kernel: [drm] VCE enabled in VM mode
kernel: resource sanity check: requesting [mem 0x000c0000-0x000dffff], which
spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000d3fff window]
kernel: caller pci_map_rom+0x6a/0x17d mapping multiple BARs
kernel: amdgpu 0000:04:00.0: No more image in the PCI ROM
kernel: ATOM BIOS: 113-1E3870U-O45
kernel: [drm] RAS INFO: ras initialized successfully, hardware ability[0]
ras_mask[0]
kernel: [drm] vm size is 128 GB, 2 levels, block size is 10-bit, fragment s=
ize
is 9-bit
kernel: amdgpu 0000:04:00.0: VRAM: 8192M 0x000000F400000000 -
0x000000F5FFFFFFFF (8192M used)
kernel: amdgpu 0000:04:00.0: GART: 256M 0x000000FF00000000 - 0x000000FF0FFF=
FFFF
kernel: [drm] Detected VRAM RAM=3D8192M, BAR=3D256M
kernel: [drm] RAM width 256bits GDDR5
kernel: [TTM] Zone  kernel: Available graphics memory: 12350340 KiB
kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: [drm] amdgpu: 8192M of VRAM memory ready
kernel: [drm] amdgpu: 8192M of GTT memory ready.
kernel: [drm] GART: num cpu pages 65536, num gpu pages 65536
kernel: [drm] PCIE GART of 256M enabled (table at 0x000000F400300000).
kernel: [drm] Chained IB support enabled!
kernel: [drm] Found UVD firmware Version: 1.130 Family ID: 16
kernel: [drm] Found VCE firmware Version: 53.26 Binary ID: 3
kernel: BUG: unable to handle page fault for address: ffffa5bd8394f650
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: PGD 606549067 P4D 606549067 PUD 0=20
kernel: Oops: 0000 [#1] SMP PTI
kernel: CPU: 6 PID: 461 Comm: systemd-udevd Not tainted
5.2.0-0.rc1.git1.1.vanilla.knurd.1.fc30.x86_64 #1
kernel: Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./G1.Sniper 3, BIOS F8k 04/29/2013
kernel: RIP: 0010:bw_calcs_data_update_from_pplib.isra.0+0x378/0x4d0 [amdgp=
u]
kernel: Code: 00 00 5b 5d 41 5c 41 5d 41 5e c3 48 8b 7d 00 4c 89 f2 be 02 0=
0 00
00 e8 26 bf f9 ff 8b 04 24 4c 8b 23 be e8 03 00 00 83 e8 01 &lt;8b&gt; 7c 8=
4 04 e8 6f
4d fb ff be e8 03 00 00 49 89 44 24 60 8b 04 24
kernel: RSP: 0018:ffffa5b98394f650 EFLAGS: 00010297
kernel: RAX: 00000000ffffffff RBX: ffff928b34cb92d8 RCX: 0000000000000000
kernel: RDX: ffffa5b98394f58c RSI: 00000000000003e8 RDI: ffff928b39c12800
kernel: RBP: ffff928b34cb9208 R08: 0000000000000020 R09: 000000032a000000
kernel: R10: 00000003ce000000 R11: 0000001770000000 R12: ffff928b3ac0b300
kernel: R13: ffffa5b98394f76c R14: ffffa5b98394f650 R15: ffffffffc0839d60
kernel: FS:  00007f1133ad1940(0000) GS:ffff928b46b80000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: ffffa5bd8394f650 CR3: 00000005faf54004 CR4: 00000000001606e0
kernel: Call Trace:
kernel:  dce112_create_resource_pool+0x6de/0x700 [amdgpu]
kernel:  dc_create_resource_pool+0x16c/0x220 [amdgpu]
kernel:  ? dal_gpio_service_create+0x92/0x110 [amdgpu]
kernel:  dc_create+0x219/0x620 [amdgpu]
kernel:  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
kernel:  amdgpu_dm_init+0xeb/0x160 [amdgpu]
kernel:  dm_hw_init+0xe/0x20 [amdgpu]
kernel:  amdgpu_device_init.cold+0x128d/0x161f [amdgpu]
kernel:  ? kmalloc_order+0x14/0x30
kernel:  amdgpu_driver_load_kms+0x88/0x270 [amdgpu]
kernel:  drm_dev_register+0x111/0x150 [drm]
kernel:  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
kernel:  ? __pm_runtime_resume+0x58/0x80
kernel:  local_pci_probe+0x42/0x80
kernel:  pci_device_probe+0x115/0x190
kernel:  really_probe+0xf0/0x390
kernel:  driver_probe_device+0xb6/0x100
kernel:  device_driver_attach+0x53/0x60
kernel:  __driver_attach+0x8a/0x150
kernel:  ? device_driver_attach+0x60/0x60
kernel:  bus_for_each_dev+0x78/0xc0
kernel:  bus_add_driver+0x14a/0x1e0
kernel:  driver_register+0x6c/0xb0
kernel:  ? 0xffffffffc09b9000
kernel:  do_one_initcall+0x46/0x1f4
kernel:  ? _cond_resched+0x15/0x30
kernel:  ? kmem_cache_alloc_trace+0x154/0x1c0
kernel:  ? do_init_module+0x23/0x230
kernel:  do_init_module+0x5c/0x230
kernel:  load_module+0x22eb/0x28e0
kernel:  ? __do_sys_init_module+0x16e/0x1a0
kernel:  __do_sys_init_module+0x16e/0x1a0
kernel:  do_syscall_64+0x5b/0x180
kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: RIP: 0033:0x7f1134ad1bae
kernel: Code: 48 8b 0d dd 42 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1=
f 84
00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 &lt;48&gt; 3d 0=
1 f0 ff ff
73 01 c3 48 8b 0d aa 42 0c 00 f7 d8 64 89 01 48
kernel: RSP: 002b:00007ffe9cb83118 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
0af
kernel: RAX: ffffffffffffffda RBX: 0000563b364ce650 RCX: 00007f1134ad1bae
kernel: RDX: 0000563b364b50a0 RSI: 00000000006dfa2e RDI: 0000563b36d998b0
kernel: RBP: 0000563b36d998b0 R08: 0000563b364ba730 R09: 0000000000000001
kernel: R10: 0000000000000002 R11: 0000000000000246 R12: 0000563b364b50a0
kernel: R13: 0000000000000006 R14: 0000563b364c9fa0 R15: 0000000000000000
kernel: Modules linked in: amdgpu(+) amd_iommu_v2 gpu_sched i2c_algo_bit ttm
drm_kms_helper crc32c_intel serio_raw drm e1000e(+) alx mdio video wmi vfio=
_pci
irqbypass vfio_virqfd vfio_iommu_type1 vfio
kernel: CR2: ffffa5bd8394f650
kernel: ---[ end trace e14f412d43dd70ae ]---
kernel: RIP: 0010:bw_calcs_data_update_from_pplib.isra.0+0x378/0x4d0 [amdgp=
u]
kernel: Code: 00 00 5b 5d 41 5c 41 5d 41 5e c3 48 8b 7d 00 4c 89 f2 be 02 0=
0 00
00 e8 26 bf f9 ff 8b 04 24 4c 8b 23 be e8 03 00 00 83 e8 01 &lt;8b&gt; 7c 8=
4 04 e8 6f
4d fb ff be e8 03 00 00 49 89 44 24 60 8b 04 24
kernel: RSP: 0018:ffffa5b98394f650 EFLAGS: 00010297
kernel: RAX: 00000000ffffffff RBX: ffff928b34cb92d8 RCX: 0000000000000000
kernel: RDX: ffffa5b98394f58c RSI: 00000000000003e8 RDI: ffff928b39c12800
kernel: RBP: ffff928b34cb9208 R08: 0000000000000020 R09: 000000032a000000
kernel: R10: 00000003ce000000 R11: 0000001770000000 R12: ffff928b3ac0b300
kernel: R13: ffffa5b98394f76c R14: ffffa5b98394f650 R15: ffffffffc0839d60
kernel: FS:  00007f1133ad1940(0000) GS:ffff928b46b80000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: ffffa5bd8394f650 CR3: 00000005faf54004 CR4: 00000000001606e0</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595549221.4ac59.25311--

--===============1075961007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1075961007==--
