Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E353F5FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 08:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDBE11A714;
	Tue,  7 Jun 2022 06:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7A311A714
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 06:19:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74F8961563
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 06:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D865AC385A5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654582767;
 bh=QYlInU7W677MhvIOmN84Fym0hoRuQQIQtUZ2sll/VCo=;
 h=From:To:Subject:Date:From;
 b=IMn0ZRlSkPWvqF2gEyxnT2YjBe6hgSniiW6e8FJdDY5euS0OdwDz56YW9rdfaQMoV
 RjdznjdOQcwP1IYbT5KsA7ZoTkSMizhlo3LE+GKFEmfJbK2vqYJ1zOp+QZW+1BRawx
 qUD2P3WCNctcn1pfel2nvLGxcz2hzrlVmb+x+XkZAdiyuYkY7nJnCs1FaqLsj80U+L
 J/GY/duguef6vJVNCM2pOYw5bW8UgTW+G8Noh8ZrJxOZVWNBNi+A7U/4cnyRNPl6Tk
 CLgXwO59V4ZcTdIbkKFXDqzLU9vLXlcnMy/y6/RNuLo5q3PE8g50LWytTonpD05LdV
 djdreSQgHOx/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE872C05FD6; Tue,  7 Jun 2022 06:19:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] New: rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Tue, 07 Jun 2022 06:19:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216092-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

            Bug ID: 216092
           Summary: rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.0-rc1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

I build today 5.19.0-rc1 and i notice this issue:

Git:=20

Merge tag 'dma-mapping-5.19-2022-06-06' of
git://git.infradead.org/users/hch/dma-mapping HEAD master
Pull dma-mapping fixes from Christoph Hellwig:

 - fix a regressin in setting swiotlb ->force_bounce (me)

 - make dma-debug less chatty (Rob Clark)

* tag 'dma-mapping-5.19-2022-06-06' of
git://git.infradead.org/users/hch/dma-mapping:
  swiotlb: fix setting ->force_bounce
  dma-debug: make things less spammy under memory pressure

Error/Warning:

[    2.491290] ------------[ cut here ]------------
[    2.491291] WARNING: CPU: 15 PID: 272 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.c:98
rn_vbios_smu_send_msg_with_param+0xf9/0x100 [amdgpu]
[    2.491554] Modules linked in: hid_asus asus_wmi sparse_keymap
platform_profile usbhid amdgpu(+) iommu_v2 gpu_sched drm_buddy i2c_algo_bit
drm_ttm_helper ttm drm_display_helper cec rc_core drm_kms_helper syscopyarea
sysfillrect sysimgblt nvme hid_generic fb_sys_fops crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd drm nvme_co=
re
xhci_pci i2c_piix4 xhci_pci_renesas wmi i2c_hid_acpi i2c_hid video hid
[    2.491574] CPU: 15 PID: 272 Comm: systemd-udevd Not tainted
5.19.0-rc1-lowlatency #1
[    2.491577] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus G14
GA401QM_GA401QM/GA401QM, BIOS GA401QM.410 12/13/2021
[    2.491578] RIP: 0010:rn_vbios_smu_send_msg_with_param+0xf9/0x100 [amdgp=
u]
[    2.491809] Code: 1e 49 8b 3c 24 48 c7 c2 e0 8c a2 c0 be 93 62 01 00 e8 =
5b
cc e8 ff 5b 41 5c 41 5d 41 5e 5d c3 3d fe 00 00 00 74 db 0f 0b eb d7 <0f> 0=
b e9
55 ff ff ff 0f 1f 44 00 00 55 31 d2 be 02 00 00 00 48 89
[    2.491811] RSP: 0018:ffffb259409973d8 EFLAGS: 00010202
[    2.491813] RAX: 00000000000000fe RBX: 0000000000030d41 RCX:
000000000000000b
[    2.491815] RDX: 0000000000000000 RSI: 000000000001629b RDI:
ffff890d5d9c0000
[    2.491816] RBP: ffffb259409973f8 R08: ffffffffc0c84a60 R09:
0000000000000002
[    2.491817] R10: 0000000000000002 R11: 0000000000000001 R12:
ffff890d58c43e00
[    2.491818] R13: 000000000000000d R14: 0000000000000001 R15:
0000000000000003
[    2.491819] FS:  00007f9aeb0dd8c0(0000) GS:ffff89140e9c0000(0000)
knlGS:0000000000000000
[    2.491820] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.491821] CR2: 00007f9aeb77b800 CR3: 00000001199e4000 CR4:
0000000000750ee0
[    2.491823] PKRU: 55555554
[    2.491824] Call Trace:
[    2.491825]  <TASK>
[    2.491827]  rn_vbios_smu_enable_48mhz_tmdp_refclk_pwrdwn+0x17/0x20 [amd=
gpu]
[    2.492098]  rn_clk_mgr_construct+0x13c/0xe40 [amdgpu]
[    2.492296]  dc_clk_mgr_create+0x408/0x590 [amdgpu]
[    2.492487]  dc_create+0x24e/0x640 [amdgpu]
[    2.492701]  amdgpu_dm_init.isra.0+0x222/0x300 [amdgpu]
[    2.492901]  ? dev_vprintk_emit+0x171/0x195
[    2.492904]  ? dev_printk_emit+0x4e/0x65
[    2.492906]  dm_hw_init+0x13/0x30 [amdgpu]
[    2.493096]  amdgpu_device_init.cold+0x1a06/0x1ed9 [amdgpu]
[    2.493284]  ? pci_read_config_word+0x27/0x40
[    2.493286]  ? do_pci_enable_device+0xd7/0x100
[    2.493288]  amdgpu_driver_load_kms+0x1c/0x160 [amdgpu]
[    2.493366]  amdgpu_pci_probe+0x16f/0x3b0 [amdgpu]
[    2.493442]  local_pci_probe+0x4b/0x90
[    2.493444]  ? pci_match_device+0xde/0x130
[    2.493445]  pci_device_probe+0xc8/0x270
[    2.493447]  really_probe+0x1d2/0x3b0
[    2.493449]  __driver_probe_device+0x115/0x190
[    2.493450]  driver_probe_device+0x23/0xc0
[    2.493451]  __driver_attach+0xbd/0x1e0
[    2.493452]  ? __device_attach_driver+0x110/0x110
[    2.493453]  bus_for_each_dev+0x7f/0xc0
[    2.493454]  driver_attach+0x1e/0x20
[    2.493454]  bus_add_driver+0x170/0x210
[    2.493455]  driver_register+0x95/0xf0
[    2.493456]  __pci_register_driver+0x68/0x70
[    2.493457]  amdgpu_init+0x6e/0x1000 [amdgpu]
[    2.493542]  ? 0xffffffffc0e08000
[    2.493543]  do_one_initcall+0x49/0x210
[    2.493545]  ? kmem_cache_alloc_trace+0x1a6/0x320
[    2.493548]  do_init_module+0x52/0x210
[    2.493550]  load_module+0x1ec6/0x2350
[    2.493552]  __do_sys_finit_module+0xc5/0x130
[    2.493553]  ? __do_sys_finit_module+0xc5/0x130
[    2.493555]  __x64_sys_finit_module+0x18/0x20
[    2.493556]  do_syscall_64+0x5c/0x80
[    2.493558]  ? ksys_mmap_pgoff+0x10c/0x250
[    2.493559]  ? do_syscall_64+0x69/0x80
[    2.493560]  ? exit_to_user_mode_prepare+0x35/0x170
[    2.493561]  ? syscall_exit_to_user_mode+0x26/0x40
[    2.493563]  ? __x64_sys_mmap+0x33/0x40
[    2.493565]  ? do_syscall_64+0x69/0x80
[    2.493565]  ? sysvec_call_function+0x4e/0x90
[    2.493566]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[    2.493568] RIP: 0033:0x7f9aeb7d5a3d
[    2.493570] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d c3 a3 0f 00 f7 d8 64 89 01 48
[    2.493571] RSP: 002b:00007fff950f45f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    2.493572] RAX: ffffffffffffffda RBX: 0000561e0e3360a0 RCX:
00007f9aeb7d5a3d
[    2.493573] RDX: 0000000000000000 RSI: 00007f9aeb96c441 RDI:
000000000000001a
[    2.493573] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000000000000002
[    2.493574] R10: 000000000000001a R11: 0000000000000246 R12:
00007f9aeb96c441
[    2.493574] R13: 0000561e0e32f820 R14: 0000561e0e32bd60 R15:
0000561e0e32e6d0
[    2.493575]  </TASK>
[    2.493576] ---[ end trace 0000000000000000 ]---
[    2.494098] [drm] Display Core initialized with v3.2.186!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
