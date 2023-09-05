Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C2E79232C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 15:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56310E519;
	Tue,  5 Sep 2023 13:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A734210E516
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 13:55:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33C77B8108E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 13:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03D62C433C9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693922123;
 bh=dUcpZphRV3FBpg3+XtJWiOVkIdaM60e7XNtPFc8DvVk=;
 h=From:To:Subject:Date:From;
 b=Dvt7MRs2rgBbOQKDI6xMcDyBptMyXNPEz0XV655HCQ0CCMUPyhPTrKSNRof//KP9y
 quszph3B8dPfpX+UrL/TGxgcYonRzBe7PcWvOvYd3AWRckRNCeXxRdtISSX2ZYOtJl
 2V/39uAk8VdNagH00u4zVWBB4gsiz3IZVAddZOW75FsYr4uCz+I4CnUX1pFSTKXR7b
 q+ISb0X+1k9XSLF8V9WgCoKj2/UunNwQs6j63sfiQ6v4q6gUoMgU+aCZkmIxa69ncu
 5PH2cYYfWyTwdjle2JsJN6tjGypHgC7Qt/CbHZ/rZSGZ8IkxYJ90gffKtVMfXGhxeC
 Z7H8xy9iPJggQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E560FC53BD0; Tue,  5 Sep 2023 13:55:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217872] New: RIP: 0010:amdgpu_vm_pde_update [amdgpu]
Date: Tue, 05 Sep 2023 13:55:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jrch2k10@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217872-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217872

            Bug ID: 217872
           Summary: RIP: 0010:amdgpu_vm_pde_update [amdgpu]
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jrch2k10@gmail.com
        Regression: No

[ 2164.137975] ------------[ cut here ]------------
[ 2164.137985] list_del corruption, ffff88d17d048738->next is LIST_POISON1
(dead000000000100)
[ 2164.138004] WARNING: CPU: 8 PID: 10745 at lib/list_debug.c:55
__list_del_entry_valid+0x89/0xd0
[ 2164.138014] Modules linked in: xt_nat xt_tcpudp veth xt_conntrack
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype nft_compat nf_tables nfnetlink
br_netfilter bridge stp llc tun rfcomm cmac algif_hash algif_skcipher af_alg
bnep snd_seq_dummy snd_hrtimer snd_seq overlay nct6775 nct6775_core hwmon_v=
id
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pc=
lmul
joydev polyval_clmulni polyval_generic gf128mul ghash_clmulni_intel
snd_hda_codec_realtek sha512_ssse3 iTCO_wdt ath3k aesni_intel btusb
snd_hda_codec_generic crypto_simd intel_pmc_bxt cryptd iTCO_vendor_support
btintel ledtrig_audio btbcm btrtl rapl snd_hda_codec_hdmi btmtk intel_cstate
r8169 snd_hda_intel realtek snd_intel_dspcfg snd_intel_sdw_acpi mdio_devres
bluetooth snd_usb_audio psmouse intel_uncore mxm_wmi snd_hda_codec snd_ump
pcspkr i2c_i801 ecdh_generic snd_usbmidi_lib rfkill snd_rawmidi i2c_smbus
[ 2164.138092]  crc16 intel_pch_thermal snd_hda_core libphy lpc_ich
snd_seq_device snd_hwdep ioatdma dca mousedev mac_hid dm_multipath snd_aloop
snd_pcm snd_timer snd soundcore v4l2loopback_dc(OE) videodev mc fuse
crypto_user dm_mod loop ip_tables x_tables usbhid serio_raw atkbd libps2
vivaldi_fmap nvme nvme_core xhci_pci xhci_pci_renesas nvme_common i8042 ser=
io
eeprom amdgpu drm_buddy drm_suballoc_helper video wmi drm_ttm_helper ttm
i2c_algo_bit gpu_sched amdxcp drm_display_helper cec xfs libcrc32c
crc32c_generic crc32c_intel
[ 2164.138145] CPU: 8 PID: 10745 Comm: kworker/8:0H Tainted: G      D W  OE=
=20=20=20=20
 6.5.1-1-cachyos-lto #1 165231ec090ac1fb173574db6e4d823c96776a31
[ 2164.138150] Hardware name: ATERMITER ZX-99EV3/ZX-99EV3, BIOS X99AT011
10/15/2020
[ 2164.138153] Workqueue: ttm ttm_bo_delayed_delete [ttm]
[ 2164.138172] RIP: 0010:__list_del_entry_valid+0x89/0xd0
[ 2164.138177] Code: 31 c0 c3 cc cc cc cc cc 48 c7 c7 3f 3f 64 9b e8 fd 4d =
9f
ff 0f 0b 31 c0 c3 cc cc cc cc cc 48 c7 c7 5d 3c 6e 9b e8 e7 4d 9f ff <0f> 0=
b 31
c0 c3 cc cc cc cc cc 48 c7 c7 7a 80 65 9b e8 d1 4d 9f ff
[ 2164.138180] RSP: 0000:ffffa1ebca067db8 EFLAGS: 00010246
[ 2164.138183] RAX: a2c219e743f99b00 RBX: ffff88d17d048720 RCX:
0000000000000027
[ 2164.138185] RDX: ffffa1ebca067c98 RSI: 0000000000000002 RDI:
ffff88d35fc21708
[ 2164.138188] RBP: 0000000000000000 R08: 0000000000001fff R09:
ffff88d37ff7c680
[ 2164.138190] R10: 0000000000005ffd R11: 0000000000000004 R12:
ffff88d17d048000
[ 2164.138192] R13: ffff88cc1130eed0 R14: ffff88d17d048738 R15:
ffff88d176136000
[ 2164.138194] FS:  0000000000000000(0000) GS:ffff88d35fc00000(0000)
knlGS:0000000000000000
[ 2164.138196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2164.138199] CR2: 0000256100fce000 CR3: 0000000349ca8005 CR4:
00000000001706e0
[ 2164.138202] Call Trace:
[ 2164.138206]  <TASK>
[ 2164.138210]  ? __warn+0xcf/0x1c0
[ 2164.138216]  ? __list_del_entry_valid+0x89/0xd0
[ 2164.138221]  ? report_bug+0x15f/0x200
[ 2164.138228]  ? handle_bug+0x42/0x70
[ 2164.138232]  ? exc_invalid_op+0x1a/0x50
[ 2164.138235]  ? asm_exc_invalid_op+0x1a/0x20
[ 2164.138243]  ? __list_del_entry_valid+0x89/0xd0
[ 2164.138247]  ? __list_del_entry_valid+0x89/0xd0
[ 2164.138251]  amdgpu_vm_bo_relocated+0x35/0xf0 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.138816]  amdgpu_vm_bo_invalidate+0xb7/0x160 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.139297]  amdgpu_bo_move_notify+0x6b/0x120 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.139789]  ttm_bo_delayed_delete+0x58/0xb0 [ttm
b5edc8a71b12f4467124bbbdec9e03389e118e3e]
[ 2164.139806]  process_one_work+0x241/0x440
[ 2164.139812]  worker_thread+0x291/0x5e0
[ 2164.139816]  ? __pfx_worker_thread+0x10/0x10
[ 2164.139820]  kthread+0x14a/0x170
[ 2164.139825]  ? __pfx_kthread+0x10/0x10
[ 2164.139829]  ret_from_fork+0x37/0x50
[ 2164.139834]  ? __pfx_kthread+0x10/0x10
[ 2164.139838]  ret_from_fork_asm+0x1b/0x30
[ 2164.139844]  </TASK>
[ 2164.139846] ---[ end trace 0000000000000000 ]---
[ 2164.139922] BUG: kernel NULL pointer dereference, address: 0000000000000=
248
[ 2164.139927] #PF: supervisor read access in kernel mode
[ 2164.139929] #PF: error_code(0x0000) - not-present page
[ 2164.139931] PGD 0 P4D 0=20
[ 2164.139933] Oops: 0000 [#3] PREEMPT SMP NOPTI
[ 2164.139936] CPU: 22 PID: 15913 Comm: ffmpeg Tainted: G      D W  OE=20=
=20=20=20=20
6.5.1-1-cachyos-lto #1 165231ec090ac1fb173574db6e4d823c96776a31
[ 2164.139939] Hardware name: ATERMITER ZX-99EV3/ZX-99EV3, BIOS X99AT011
10/15/2020
[ 2164.139940] RIP: 0010:amdgpu_vm_pde_update+0x2e/0x110 [amdgpu]
[ 2164.140429] Code: 0f 1f 44 00 00 41 57 41 56 41 55 41 54 53 48 83 ec 18 =
49
89 f6 48 89 fb 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 48 8b 7e 08 <48> 8=
b 87
48 02 00 00 48 85 c0 74 09 4c 8b a0 40 02 00 00 eb 03 45
[ 2164.140432] RSP: 0018:ffffa1ebc2583b08 EFLAGS: 00010292
[ 2164.140435] RAX: 59ed4394f2c52000 RBX: ffffa1ebc2583b68 RCX:
0000000000760f00
[ 2164.140437] RDX: ffff88cc11310588 RSI: ffff88d17d048720 RDI:
0000000000000000
[ 2164.140439] RBP: 0000000000000000 R08: ffff88d032c5db40 R09:
0000000000000000
[ 2164.140441] R10: ffff88d091d99b40 R11: ffffffffc0975b40 R12:
ffff88d17d048738
[ 2164.140443] R13: ffffa1ebc2583b58 R14: ffff88d17d048720 R15:
0000000000000000
[ 2164.140445] FS:  00007f17b789c440(0000) GS:ffff88d35ff80000(0000)
knlGS:0000000000000000
[ 2164.140448] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2164.140450] CR2: 0000000000000248 CR3: 0000000349ca8006 CR4:
00000000001706e0
[ 2164.140453] Call Trace:
[ 2164.140456]  <TASK>
[ 2164.140459]  ? __die_body+0x68/0xb0
[ 2164.140465]  ? page_fault_oops+0x3a9/0x400
[ 2164.140470]  ? exc_page_fault+0x7a/0x1b0
[ 2164.140477]  ? asm_exc_page_fault+0x26/0x30
[ 2164.140483]  ? __pfx_amdgpu_vm_sdma_prepare+0x10/0x10 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.140893]  ? amdgpu_vm_pde_update+0x2e/0x110 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.141361]  ? __slab_free+0x9e/0x2c0
[ 2164.141368]  amdgpu_vm_update_pdes+0x135/0x240 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.141847]  amdgpu_gem_va_update_vm+0x5b/0x90 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.142317]  amdgpu_gem_va_ioctl+0x41a/0x490 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.142791]  ? __pfx_amdgpu_gem_va_ioctl+0x10/0x10 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.143262]  drm_ioctl_kernel+0xe2/0x160
[ 2164.143268]  drm_ioctl+0x368/0x4f0
[ 2164.143273]  ? __pfx_amdgpu_gem_va_ioctl+0x10/0x10 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.143725]  amdgpu_drm_ioctl+0x45/0x80 [amdgpu
2f75e5fa96b9ffccc7e67d417353e101c7ac828e]
[ 2164.144182]  __x64_sys_ioctl+0x80/0xd0
[ 2164.144187]  do_syscall_64+0x68/0xa0
[ 2164.144192]  ? do_syscall_64+0x7a/0xa0
[ 2164.144195]  ? syscall_exit_to_user_mode+0x31/0x1b0
[ 2164.144199]  ? do_syscall_64+0x7a/0xa0
[ 2164.144201]  ? do_syscall_64+0x7a/0xa0
[ 2164.144204]  ? exit_to_user_mode_prepare+0x9e/0xe0
[ 2164.144210]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[ 2164.144217] RIP: 0033:0x7f17c852aa1f
[ 2164.144256] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c=
2 3d
00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[ 2164.144259] RSP: 002b:00007ffcbf093030 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 2164.144264] RAX: ffffffffffffffda RBX: 000056096fd7bb70 RCX:
00007f17c852aa1f
[ 2164.144266] RDX: 00007ffcbf0930d0 RSI: 00000000c0286448 RDI:
0000000000000004
[ 2164.144268] RBP: 00007ffcbf0930d0 R08: 0000000302e00000 R09:
000000000000000e
[ 2164.144271] R10: 0000000000000000 R11: 0000000000000246 R12:
00000000c0286448
[ 2164.144273] R13: 0000000000000004 R14: 0000560970c837e0 R15:
00007ffcbf093148
[ 2164.144277]  </TASK>
[ 2164.144279] Modules linked in: xt_nat xt_tcpudp veth xt_conntrack
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype nft_compat nf_tables nfnetlink
br_netfilter bridge stp llc tun rfcomm cmac algif_hash algif_skcipher af_alg
bnep snd_seq_dummy snd_hrtimer snd_seq overlay nct6775 nct6775_core hwmon_v=
id
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pc=
lmul
joydev polyval_clmulni polyval_generic gf128mul ghash_clmulni_intel
snd_hda_codec_realtek sha512_ssse3 iTCO_wdt ath3k aesni_intel btusb
snd_hda_codec_generic crypto_simd intel_pmc_bxt cryptd iTCO_vendor_support
btintel ledtrig_audio btbcm btrtl rapl snd_hda_codec_hdmi btmtk intel_cstate
r8169 snd_hda_intel realtek snd_intel_dspcfg snd_intel_sdw_acpi mdio_devres
bluetooth snd_usb_audio psmouse intel_uncore mxm_wmi snd_hda_codec snd_ump
pcspkr i2c_i801 ecdh_generic snd_usbmidi_lib rfkill snd_rawmidi i2c_smbus
[ 2164.144353]  crc16 intel_pch_thermal snd_hda_core libphy lpc_ich
snd_seq_device snd_hwdep ioatdma dca mousedev mac_hid dm_multipath snd_aloop
snd_pcm snd_timer snd soundcore v4l2loopback_dc(OE) videodev mc fuse
crypto_user dm_mod loop ip_tables x_tables usbhid serio_raw atkbd libps2
vivaldi_fmap nvme nvme_core xhci_pci xhci_pci_renesas nvme_common i8042 ser=
io
eeprom amdgpu drm_buddy drm_suballoc_helper video wmi drm_ttm_helper ttm
i2c_algo_bit gpu_sched amdxcp drm_display_helper cec xfs libcrc32c
crc32c_generic crc32c_intel
[ 2164.144400] CR2: 0000000000000248
[ 2164.145150] ---[ end trace 0000000000000000 ]---
[ 2164.145154] RIP: 0010:amdgpu_vm_pde_update+0x2e/0x110 [amdgpu]
[ 2164.145696] Code: 0f 1f 44 00 00 41 57 41 56 41 55 41 54 53 48 83 ec 18 =
49
89 f6 48 89 fb 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 48 8b 7e 08 <48> 8=
b 87
48 02 00 00 48 85 c0 74 09 4c 8b a0 40 02 00 00 eb 03 45
[ 2164.145700] RSP: 0018:ffffa1ebc97ffb18 EFLAGS: 00010296
[ 2164.145704] RAX: 251dfc3096dd5d00 RBX: ffffa1ebc97ffb78 RCX:
0000000000741500
[ 2164.145706] RDX: ffff88cc11310588 RSI: ffff88d09ac63c90 RDI:
0000000000000000
[ 2164.145708] RBP: 0000000000000000 R08: ffff88cf27211b00 R09:
0000000000000000
[ 2164.145710] R10: ffff88d0d71c86c0 R11: ffffffffc0975b40 R12:
ffff88d09ac63ca8
[ 2164.145712] R13: ffffa1ebc97ffb68 R14: ffff88d09ac63c90 R15:
0000000000000000
[ 2164.145715] FS:  00007f17b789c440(0000) GS:ffff88d35ff80000(0000)
knlGS:0000000000000000
[ 2164.145717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2164.145720] CR2: 00007f92a156d000 CR3: 0000000349ca8006 CR4:
00000000001706e0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
