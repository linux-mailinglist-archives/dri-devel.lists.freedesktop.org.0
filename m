Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE5B0CF6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A786ECC3;
	Thu, 12 Sep 2019 10:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A42AB6ECBC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:33:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A09FE72167; Thu, 12 Sep 2019 10:33:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Thu, 12 Sep 2019 10:33:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: woodruff@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107296-502-lI2ELQux00@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107296-502@http.bugs.freedesktop.org/>
References: <bug-107296-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1440649793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1440649793==
Content-Type: multipart/alternative; boundary="15682844032.2e8717.23398"
Content-Transfer-Encoding: 7bit


--15682844032.2e8717.23398
Date: Thu, 12 Sep 2019 10:33:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

--- Comment #18 from woodruff@posteo.de ---
Similar here on a Asrock B450M Pro4 with Athlon 200GE (Raven Ridge):
Screen blanks on boot a few seconds, aswell on wakeups.

[    0.849231] Linux agpgart interface v0.103
[    0.927246] [drm] amdgpu kernel modesetting enabled.
[    0.927385] Parsing CRAT table with 1 nodes
[    0.927395] Creating topology SYSFS entries
[    0.927433] Topology: Add APU node [0x0:0x0]
[    0.927434] Finished initializing topology
[    0.927497] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -> 0xefffffff
[    0.927498] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -> 0xf01fffff
[    0.927499] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfcb00000 -> 0xfcb7ffff
[    0.927501] amdgpu 0000:07:00.0: vgaarb: deactivate vga console
[    0.928793] Console: switching to colour dummy device 80x25
[    0.929058] [drm] initializing kernel modesetting (RAVEN 0x1002:0x15DD
0x1002:0x15DD 0xCB).
[    0.929072] [drm] register mmio base: 0xFCB00000
[    0.929072] [drm] register mmio size: 524288
[    0.929130] [drm] add ip block number 0 <soc15_common>
[    0.929131] [drm] add ip block number 1 <gmc_v9_0>
[    0.929131] [drm] add ip block number 2 <vega10_ih>
[    0.929132] [drm] add ip block number 3 <psp>
[    0.929132] [drm] add ip block number 4 <gfx_v9_0>
[    0.929133] [drm] add ip block number 5 <sdma_v4_0>
[    0.929133] [drm] add ip block number 6 <powerplay>
[    0.929134] [drm] add ip block number 7 <dm>
[    0.929135] [drm] add ip block number 8 <vcn_v1_0>
[    0.929186] [drm] VCN decode is enabled in VM mode
[    0.929187] [drm] VCN encode is enabled in VM mode
[    0.929187] [drm] VCN jpeg decode is enabled in VM mode
[    0.952670] [drm] BIOS signature incorrect 20 7
[    0.952690] ATOM BIOS: 113-RAVEN-113
[    0.952723] [drm] RAS INFO: ras initialized successfully, hardware
ability[0] ras_mask[0]
[    0.952725] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[    0.952737] amdgpu 0000:07:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[    0.952738] amdgpu 0000:07:00.0: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[    0.952739] amdgpu 0000:07:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    0.952743] [drm] Detected VRAM RAM=3D2048M, BAR=3D2048M
[    0.952744] [drm] RAM width 128bits DDR4
[    0.952804] [TTM] Zone  kernel: Available graphics memory: 7173824 KiB
[    0.952804] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    0.952805] [TTM] Initializing pool allocator
[    0.952808] [TTM] Initializing DMA pool allocator
[    0.952865] [drm] amdgpu: 2048M of VRAM memory ready
[    0.952873] [drm] amdgpu: 3072M of GTT memory ready.
[    0.952884] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    0.953019] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[    0.954302] [drm] use_doorbell being set to: [true]
[    0.954418] [drm] Found VCN firmware Version ENC: 1.9 DEC: 1 VEP: 0
Revision: 28
[    0.954428] [drm] PSP loading VCN firmware
[    0.975073] [drm] reserve 0x400000 from 0xf400c00000 for PSP TMR SIZE
[    1.140184] [drm] DM_PPLIB: values for F clock
[    1.140185] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   1333000 in kHz
[    1.140187] ------------[ cut here ]------------
[    1.140280] WARNING: CPU: 2 PID: 199 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1401
dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.140281] Modules linked in: amdgpu(+) gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[    1.140287] CPU: 2 PID: 199 Comm: modprobe Not tainted 5.2.14-arch1-1-AR=
CH
#1
[    1.140288] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./B450M Pro4, BIOS P3.50 07/18/2019
[    1.140364] RIP: 0010:dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.140366] Code: 48 8b 93 e0 02 00 00 db 42 78 83 f9 02 77 37 b8 02 00 =
00
00 8d 71 ff e9 ca 2b f7 ff 48 c7 c7 98 03 3e c0 31 c0 e8 6b 67 9b e1 <0f> 0=
b e9
44 2c f7 ff 48 c7 c7 98 03 3e c0 31 c0 e8 56 67 9b e1 0f
[    1.140367] RSP: 0018:ffff9bbc81d2f668 EFLAGS: 00010246
[    1.140369] RAX: 0000000000000024 RBX: ffff8addc5723000 RCX:
0000000000000000
[    1.140369] RDX: 0000000000000000 RSI: 0000000000000092 RDI:
00000000ffffffff
[    1.140370] RBP: ffff8addc620c980 R08: 00000000000002b3 R09:
0000000000000004
[    1.140370] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9bbc81d2f708
[    1.140371] R13: 0000000000000001 R14: 000000000000000a R15:
0000000000000000
[    1.140372] FS:  00007fb896a9e740(0000) GS:ffff8addd0680000(0000)
knlGS:0000000000000000
[    1.140373] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.140373] CR2: 0000565204d50058 CR3: 00000004060c8000 CR4:
00000000003406e0
[    1.140374] Call Trace:
[    1.140458]  dcn10_create_resource_pool+0x983/0xa50 [amdgpu]
[    1.140462]  ? _raw_spin_lock_irqsave+0x26/0x50
[    1.140537]  dc_create_resource_pool+0x1c0/0x270 [amdgpu]
[    1.140612]  dc_create+0x229/0x630 [amdgpu]
[    1.140615]  ? kmem_cache_alloc_trace+0x34/0x1c0
[    1.140687]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[    1.140763]  amdgpu_dm_init+0xeb/0x160 [amdgpu]
[    1.140839]  dm_hw_init+0xe/0x20 [amdgpu]
[    1.140915]  amdgpu_device_init.cold+0x1000/0x15e3 [amdgpu]
[    1.140975]  amdgpu_driver_load_kms+0x88/0x270 [amdgpu]
[    1.140987]  drm_dev_register+0x111/0x150 [drm]
[    1.141046]  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
[    1.141049]  ? __pm_runtime_resume+0x49/0x60
[    1.141051]  local_pci_probe+0x42/0x80
[    1.141053]  ? pci_match_device+0xc5/0x100
[    1.141054]  pci_device_probe+0xfa/0x190
[    1.141057]  really_probe+0xf0/0x380
[    1.141058]  driver_probe_device+0xb6/0x100
[    1.141060]  device_driver_attach+0x53/0x60
[    1.141061]  __driver_attach+0x8a/0x150
[    1.141063]  ? device_driver_attach+0x60/0x60
[    1.141064]  ? device_driver_attach+0x60/0x60
[    1.141065]  bus_for_each_dev+0x89/0xd0
[    1.141066]  bus_add_driver+0x14a/0x1e0
[    1.141068]  driver_register+0x6c/0xb0
[    1.141070]  ? 0xffffffffc052b000
[    1.141072]  do_one_initcall+0x59/0x234
[    1.141076]  do_init_module+0x5c/0x230
[    1.141078]  load_module+0x2122/0x23a0
[    1.141082]  ? __se_sys_finit_module+0xa8/0x100
[    1.141083]  __se_sys_finit_module+0xa8/0x100
[    1.141086]  do_syscall_64+0x5f/0x1d0
[    1.141089]  ? page_fault+0x8/0x30
[    1.141091]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    1.141092] RIP: 0033:0x7fb896bbfe3d
[    1.141094] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 23 50 0c 00 f7 d8 64 89 01 48
[    1.141095] RSP: 002b:00007ffdaf7dd488 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    1.141096] RAX: ffffffffffffffda RBX: 0000557476d8caf0 RCX:
00007fb896bbfe3d
[    1.141097] RDX: 0000000000000000 RSI: 0000557475ac0400 RDI:
000000000000000d
[    1.141097] RBP: 0000557475ac0400 R08: 0000000000000000 R09:
0000000000000000
[    1.141098] R10: 000000000000000d R11: 0000000000000246 R12:
0000000000000000
[    1.141098] R13: 0000557476d8cb70 R14: 0000000000060000 R15:
0000557476d8caf0
[    1.141100] ---[ end trace e8ff844124760292 ]---
[    1.141102] [drm] DM_PPLIB: values for DCF clock
[    1.141102] [drm] DM_PPLIB:   300000 in kHz
[    1.141103] [drm] DM_PPLIB:   600000 in kHz
[    1.141103] [drm] DM_PPLIB:   626000 in kHz
[    1.141103] [drm] DM_PPLIB:   654000 in kHz
[    1.141368] [drm:construct [amdgpu]] *ERROR* construct: Invalid Connector
ObjectID from Adapter Service for connector index:2! type 0 expected 3
[    1.144192] [drm] Display Core initialized with v3.2.27!
[    1.157042] [drm] SADs count is: -2, don't need to read it
[    1.157380] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.157380] [drm] Driver supports precise vblank timestamp query.
[    1.170880] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    1.171884] kfd kfd: Allocated 3969056 bytes on gart
[    1.171899] Topology: Add APU node [0x15dd:0x1002]
[    1.172085] kfd kfd: added device 1002:15dd
[    1.173162] [drm] fb mappable at 0x61000000
[    1.173162] [drm] vram apper at 0x60000000
[    1.173163] [drm] size 8294400
[    1.173163] [drm] fb depth is 24
[    1.173164] [drm]    pitch is 7680
[    1.173214] fbcon: amdgpudrmfb (fb0) is primary device
[    1.195455] Console: switching to colour frame buffer device 240x67
[    1.217430] amdgpu 0000:07:00.0: fb0: amdgpudrmfb frame buffer device
[    1.260159] amdgpu 0000:07:00.0: ring gfx uses VM inv eng 0 on hub 0
[    1.260163] amdgpu 0000:07:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    1.260165] amdgpu 0000:07:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    1.260167] amdgpu 0000:07:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    1.260169] amdgpu 0000:07:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    1.260171] amdgpu 0000:07:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    1.260172] amdgpu 0000:07:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    1.260174] amdgpu 0000:07:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    1.260176] amdgpu 0000:07:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    1.260178] amdgpu 0000:07:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    1.260180] amdgpu 0000:07:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    1.260182] amdgpu 0000:07:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[    1.260184] amdgpu 0000:07:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[    1.260186] amdgpu 0000:07:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[    1.260187] amdgpu 0000:07:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[    1.263555] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:07:00.0 on
minor 0
[    1.353427] SCSI subsystem initialized
[    1.355923] xhci_hcd 0000:01:00.0: xHCI Host Controller

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682844032.2e8717.23398
Date: Thu, 12 Sep 2019 10:33:23 +0000
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
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
woodruff&#64;posteo.de" title=3D"woodruff&#64;posteo.de">woodruff&#64;poste=
o.de</a>
</span></b>
        <pre>Similar here on a Asrock B450M Pro4 with Athlon 200GE (Raven R=
idge):
Screen blanks on boot a few seconds, aswell on wakeups.

[    0.849231] Linux agpgart interface v0.103
[    0.927246] [drm] amdgpu kernel modesetting enabled.
[    0.927385] Parsing CRAT table with 1 nodes
[    0.927395] Creating topology SYSFS entries
[    0.927433] Topology: Add APU node [0x0:0x0]
[    0.927434] Finished initializing topology
[    0.927497] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -&gt; 0xefffffff
[    0.927498] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -&gt; 0xf01fffff
[    0.927499] amdgpu 0000:07:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfcb00000 -&gt; 0xfcb7ffff
[    0.927501] amdgpu 0000:07:00.0: vgaarb: deactivate vga console
[    0.928793] Console: switching to colour dummy device 80x25
[    0.929058] [drm] initializing kernel modesetting (RAVEN 0x1002:0x15DD
0x1002:0x15DD 0xCB).
[    0.929072] [drm] register mmio base: 0xFCB00000
[    0.929072] [drm] register mmio size: 524288
[    0.929130] [drm] add ip block number 0 &lt;soc15_common&gt;
[    0.929131] [drm] add ip block number 1 &lt;gmc_v9_0&gt;
[    0.929131] [drm] add ip block number 2 &lt;vega10_ih&gt;
[    0.929132] [drm] add ip block number 3 &lt;psp&gt;
[    0.929132] [drm] add ip block number 4 &lt;gfx_v9_0&gt;
[    0.929133] [drm] add ip block number 5 &lt;sdma_v4_0&gt;
[    0.929133] [drm] add ip block number 6 &lt;powerplay&gt;
[    0.929134] [drm] add ip block number 7 &lt;dm&gt;
[    0.929135] [drm] add ip block number 8 &lt;vcn_v1_0&gt;
[    0.929186] [drm] VCN decode is enabled in VM mode
[    0.929187] [drm] VCN encode is enabled in VM mode
[    0.929187] [drm] VCN jpeg decode is enabled in VM mode
[    0.952670] [drm] BIOS signature incorrect 20 7
[    0.952690] ATOM BIOS: 113-RAVEN-113
[    0.952723] [drm] RAS INFO: ras initialized successfully, hardware
ability[0] ras_mask[0]
[    0.952725] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[    0.952737] amdgpu 0000:07:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[    0.952738] amdgpu 0000:07:00.0: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[    0.952739] amdgpu 0000:07:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    0.952743] [drm] Detected VRAM RAM=3D2048M, BAR=3D2048M
[    0.952744] [drm] RAM width 128bits DDR4
[    0.952804] [TTM] Zone  kernel: Available graphics memory: 7173824 KiB
[    0.952804] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    0.952805] [TTM] Initializing pool allocator
[    0.952808] [TTM] Initializing DMA pool allocator
[    0.952865] [drm] amdgpu: 2048M of VRAM memory ready
[    0.952873] [drm] amdgpu: 3072M of GTT memory ready.
[    0.952884] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    0.953019] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[    0.954302] [drm] use_doorbell being set to: [true]
[    0.954418] [drm] Found VCN firmware Version ENC: 1.9 DEC: 1 VEP: 0
Revision: 28
[    0.954428] [drm] PSP loading VCN firmware
[    0.975073] [drm] reserve 0x400000 from 0xf400c00000 for PSP TMR SIZE
[    1.140184] [drm] DM_PPLIB: values for F clock
[    1.140185] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   0 in kHz
[    1.140186] [drm] DM_PPLIB:   1333000 in kHz
[    1.140187] ------------[ cut here ]------------
[    1.140280] WARNING: CPU: 2 PID: 199 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1401
dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.140281] Modules linked in: amdgpu(+) gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[    1.140287] CPU: 2 PID: 199 Comm: modprobe Not tainted 5.2.14-arch1-1-AR=
CH
#1
[    1.140288] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./B450M Pro4, BIOS P3.50 07/18/2019
[    1.140364] RIP: 0010:dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.140366] Code: 48 8b 93 e0 02 00 00 db 42 78 83 f9 02 77 37 b8 02 00 =
00
00 8d 71 ff e9 ca 2b f7 ff 48 c7 c7 98 03 3e c0 31 c0 e8 6b 67 9b e1 &lt;0f=
&gt; 0b e9
44 2c f7 ff 48 c7 c7 98 03 3e c0 31 c0 e8 56 67 9b e1 0f
[    1.140367] RSP: 0018:ffff9bbc81d2f668 EFLAGS: 00010246
[    1.140369] RAX: 0000000000000024 RBX: ffff8addc5723000 RCX:
0000000000000000
[    1.140369] RDX: 0000000000000000 RSI: 0000000000000092 RDI:
00000000ffffffff
[    1.140370] RBP: ffff8addc620c980 R08: 00000000000002b3 R09:
0000000000000004
[    1.140370] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9bbc81d2f708
[    1.140371] R13: 0000000000000001 R14: 000000000000000a R15:
0000000000000000
[    1.140372] FS:  00007fb896a9e740(0000) GS:ffff8addd0680000(0000)
knlGS:0000000000000000
[    1.140373] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.140373] CR2: 0000565204d50058 CR3: 00000004060c8000 CR4:
00000000003406e0
[    1.140374] Call Trace:
[    1.140458]  dcn10_create_resource_pool+0x983/0xa50 [amdgpu]
[    1.140462]  ? _raw_spin_lock_irqsave+0x26/0x50
[    1.140537]  dc_create_resource_pool+0x1c0/0x270 [amdgpu]
[    1.140612]  dc_create+0x229/0x630 [amdgpu]
[    1.140615]  ? kmem_cache_alloc_trace+0x34/0x1c0
[    1.140687]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[    1.140763]  amdgpu_dm_init+0xeb/0x160 [amdgpu]
[    1.140839]  dm_hw_init+0xe/0x20 [amdgpu]
[    1.140915]  amdgpu_device_init.cold+0x1000/0x15e3 [amdgpu]
[    1.140975]  amdgpu_driver_load_kms+0x88/0x270 [amdgpu]
[    1.140987]  drm_dev_register+0x111/0x150 [drm]
[    1.141046]  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
[    1.141049]  ? __pm_runtime_resume+0x49/0x60
[    1.141051]  local_pci_probe+0x42/0x80
[    1.141053]  ? pci_match_device+0xc5/0x100
[    1.141054]  pci_device_probe+0xfa/0x190
[    1.141057]  really_probe+0xf0/0x380
[    1.141058]  driver_probe_device+0xb6/0x100
[    1.141060]  device_driver_attach+0x53/0x60
[    1.141061]  __driver_attach+0x8a/0x150
[    1.141063]  ? device_driver_attach+0x60/0x60
[    1.141064]  ? device_driver_attach+0x60/0x60
[    1.141065]  bus_for_each_dev+0x89/0xd0
[    1.141066]  bus_add_driver+0x14a/0x1e0
[    1.141068]  driver_register+0x6c/0xb0
[    1.141070]  ? 0xffffffffc052b000
[    1.141072]  do_one_initcall+0x59/0x234
[    1.141076]  do_init_module+0x5c/0x230
[    1.141078]  load_module+0x2122/0x23a0
[    1.141082]  ? __se_sys_finit_module+0xa8/0x100
[    1.141083]  __se_sys_finit_module+0xa8/0x100
[    1.141086]  do_syscall_64+0x5f/0x1d0
[    1.141089]  ? page_fault+0x8/0x30
[    1.141091]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    1.141092] RIP: 0033:0x7fb896bbfe3d
[    1.141094] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 50 0c 00 f7 d8 64 89 01 48
[    1.141095] RSP: 002b:00007ffdaf7dd488 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    1.141096] RAX: ffffffffffffffda RBX: 0000557476d8caf0 RCX:
00007fb896bbfe3d
[    1.141097] RDX: 0000000000000000 RSI: 0000557475ac0400 RDI:
000000000000000d
[    1.141097] RBP: 0000557475ac0400 R08: 0000000000000000 R09:
0000000000000000
[    1.141098] R10: 000000000000000d R11: 0000000000000246 R12:
0000000000000000
[    1.141098] R13: 0000557476d8cb70 R14: 0000000000060000 R15:
0000557476d8caf0
[    1.141100] ---[ end trace e8ff844124760292 ]---
[    1.141102] [drm] DM_PPLIB: values for DCF clock
[    1.141102] [drm] DM_PPLIB:   300000 in kHz
[    1.141103] [drm] DM_PPLIB:   600000 in kHz
[    1.141103] [drm] DM_PPLIB:   626000 in kHz
[    1.141103] [drm] DM_PPLIB:   654000 in kHz
[    1.141368] [drm:construct [amdgpu]] *ERROR* construct: Invalid Connector
ObjectID from Adapter Service for connector index:2! type 0 expected 3
[    1.144192] [drm] Display Core initialized with v3.2.27!
[    1.157042] [drm] SADs count is: -2, don't need to read it
[    1.157380] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.157380] [drm] Driver supports precise vblank timestamp query.
[    1.170880] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    1.171884] kfd kfd: Allocated 3969056 bytes on gart
[    1.171899] Topology: Add APU node [0x15dd:0x1002]
[    1.172085] kfd kfd: added device 1002:15dd
[    1.173162] [drm] fb mappable at 0x61000000
[    1.173162] [drm] vram apper at 0x60000000
[    1.173163] [drm] size 8294400
[    1.173163] [drm] fb depth is 24
[    1.173164] [drm]    pitch is 7680
[    1.173214] fbcon: amdgpudrmfb (fb0) is primary device
[    1.195455] Console: switching to colour frame buffer device 240x67
[    1.217430] amdgpu 0000:07:00.0: fb0: amdgpudrmfb frame buffer device
[    1.260159] amdgpu 0000:07:00.0: ring gfx uses VM inv eng 0 on hub 0
[    1.260163] amdgpu 0000:07:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    1.260165] amdgpu 0000:07:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    1.260167] amdgpu 0000:07:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    1.260169] amdgpu 0000:07:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    1.260171] amdgpu 0000:07:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    1.260172] amdgpu 0000:07:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    1.260174] amdgpu 0000:07:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    1.260176] amdgpu 0000:07:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    1.260178] amdgpu 0000:07:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    1.260180] amdgpu 0000:07:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    1.260182] amdgpu 0000:07:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[    1.260184] amdgpu 0000:07:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[    1.260186] amdgpu 0000:07:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[    1.260187] amdgpu 0000:07:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[    1.263555] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:07:00.0 on
minor 0
[    1.353427] SCSI subsystem initialized
[    1.355923] xhci_hcd 0000:01:00.0: xHCI Host Controller</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682844032.2e8717.23398--

--===============1440649793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1440649793==--
