Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AA24C617
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 21:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CA26EA15;
	Thu, 20 Aug 2020 19:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6EB6EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 19:04:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208981] New: trace with B550I AORUS PRO AX and AMD Ryzen 5 PRO
 4650G
Date: Thu, 20 Aug 2020 19:03:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian.laroche@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208981-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208981

            Bug ID: 208981
           Summary: trace with B550I AORUS PRO AX and AMD Ryzen 5 PRO
                    4650G
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: florian.laroche@gmail.com
        Regression: No

Dear Maintainer,

compiling the current Debian source with a linux-5.8.2 kernel gives the
following trace on a B550I AORUS PRO AX with an AMD Ryzen 5 PRO 4650G:



[    3.974191] ------------[ cut here ]------------
[    3.974265] WARNING: CPU: 9 PID: 175 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:654
rn_clk_mgr_constru
ct+0x11e/0x390 [amdgpu]
[    3.974268] Modules linked in: hid_generic(E) usbhid(E) hid(E) amdgpu(E+)
gpu_sched(E) i2c_algo_bit(E) ttm(E) drm_kms_helper(E) ce
c(E) ahci(E) libahci(E) nvme(E) xhci_pci(E) nvme_core(E) crc32_pclmul(E)
xhci_hcd(E) r8169(E) t10_pi(E) crc32c_intel(E) realtek(E) li
bata(E) crc_t10dif(E) drm(E) i2c_piix4(E) crct10dif_generic(E) mfd_core(E)
crct10dif_pclmul(E) libphy(E) usbcore(E) crct10dif_common(
E) scsi_mod(E) usb_common(E) wmi(E) video(E) gpio_amdpt(E) gpio_generic(E)
button(E)
[    3.974284] CPU: 9 PID: 175 Comm: systemd-udevd Tainted: G            E    
5.8.0-trunk-amd64 #1 Debian 5.8.2-1
[    3.974285] Hardware name: Gigabyte Technology Co., Ltd. B550I AORUS PRO
AX/B550I AORUS PRO AX, BIOS F2a 06/16/2020
[    3.974348] RIP: 0010:rn_clk_mgr_construct+0x11e/0x390 [amdgpu]
[    3.974351] Code: 00 00 00 41 8b 8c c4 80 00 00 00 41 89 c1 89 c7 85 c9 74
10 41 8b 94 c4 84 00 00 00 85 d2 0f 85 87 01 00 00 48 8
3 e8 01 73 d9 <0f> 0b 83 7b 20 01 74 0c 81 bd e8 00 00 00 ff 14 37 00 7f 27 48
8b
[    3.974353] RSP: 0018:ffffa98a8068f850 EFLAGS: 00010297
[    3.974355] RAX: ffffffffffffffff RBX: ffff9a36d7eb2540 RCX:
0000000000000640
[    3.974356] RDX: 0000000000000000 RSI: ffffa98a8068f878 RDI:
0000000000000000
[    3.974357] RBP: ffff9a3625cf9800 R08: 0000000000000000 R09:
0000000000000000
[    3.974358] R10: 7fc9117fffffffff R11: ffff9a36d7d51000 R12:
ffffa98a8068f878
[    3.974359] R13: ffff9a36d7eb2cc0 R14: ffff9a36bccc0000 R15:
ffff9a36d7eb2540
[    3.974361] FS:  00007f53ebac18c0(0000) GS:ffff9a371f240000(0000)
knlGS:0000000000000000
[    3.974362] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.974363] CR2: 00007f53ebaaaee0 CR3: 00000003d7f38000 CR4:
0000000000340ee0
[    3.974365] Call Trace:
[    3.974427]  dc_clk_mgr_create+0x179/0x1a0 [amdgpu]
[    3.974488]  dc_create+0x238/0x700 [amdgpu]
[    3.974493]  ? _cond_resched+0x16/0x40
[    3.974554]  amdgpu_dm_init.isra.0+0x15b/0x1c0 [amdgpu]
[    3.974614]  dm_hw_init+0xe/0x20 [amdgpu]
[    3.974676]  amdgpu_device_init.cold+0x17a7/0x192b [amdgpu]
[    3.974722]  amdgpu_driver_load_kms+0x5c/0x220 [amdgpu]
[    3.974766]  amdgpu_pci_probe+0x15f/0x1f0 [amdgpu]
[    3.974770]  local_pci_probe+0x42/0x80
[    3.974772]  ? _cond_resched+0x16/0x40
[    3.974773]  pci_device_probe+0xfa/0x1b0
[    3.974776]  really_probe+0x160/0x400
[    3.974777]  driver_probe_device+0xe1/0x150
[    3.974779]  device_driver_attach+0xa1/0xb0
[    3.974780]  __driver_attach+0x8a/0x150
[    3.974781]  ? device_driver_attach+0xb0/0xb0
[    3.974782]  ? device_driver_attach+0xb0/0xb0
[    3.974784]  bus_for_each_dev+0x78/0xc0
[    3.974786]  bus_add_driver+0x12b/0x1e0
[    3.974787]  driver_register+0x8b/0xe0
[    3.974789]  ? 0xffffffffc0a6b000
[    3.974791]  do_one_initcall+0x46/0x200
[    3.974792]  ? _cond_resched+0x16/0x40
[    3.974794]  ? kmem_cache_alloc_trace+0x192/0x220
[    3.974796]  ? do_init_module+0x23/0x250
[    3.974798]  do_init_module+0x5c/0x250
[    3.974799]  __do_sys_finit_module+0xac/0x110
[    3.974802]  do_syscall_64+0x4d/0xc0
[    3.974804]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.974805] RIP: 0033:0x7f53ebf6ba79
[    3.974807] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e7 53 0c 00 f7 d8 64 89 01 48
[    3.974809] RSP: 002b:00007ffde26b8228 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    3.974811] RAX: ffffffffffffffda RBX: 000055c5cb205da0 RCX:
00007f53ebf6ba79
[    3.974812] RDX: 0000000000000000 RSI: 00007f53ec0f6e4d RDI:
0000000000000012
[    3.974813] RBP: 0000000000020000 R08: 0000000000000000 R09:
000055c5cb205fb8
[    3.974814] R10: 0000000000000012 R11: 0000000000000246 R12:
00007f53ec0f6e4d
[    3.974815] R13: 0000000000000000 R14: 000055c5cb206e20 R15:
000055c5cb205da0
[    3.974817] ---[ end trace 071eac41bffe7f9b ]---


best regards,

Florian La Roche

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
