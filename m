Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726A7B3EAD
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 08:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016E010E1BB;
	Sat, 30 Sep 2023 06:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFC010E1BB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 06:45:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DC64FB80010
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 06:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 772F3C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696056304;
 bh=ovyRhymp9MBo+9Ec/rHaX2Opo33geYknW7MZNmYiGGg=;
 h=From:To:Subject:Date:From;
 b=WRClqPFHWB0B6l2mhq0qU4+hswlbRFwAPlqqst8Nmaja99hBVmWHUAHKQg6QOhD4n
 W3QdOyAASfQNMkUp2OQaz+WXSG5cju8BYL0hsPIvJy4beYMG6vNCcUGH3O/oeGlUxo
 3xmqrnGU1MbQ31wAYSV9aV+bP4OUFeCNqzZqhImsottA8wXpokowOvDv9d0Ll/GPOa
 ZJ2FyAWmK5MhQYV/2zRy0pI9D4/mIrU9T1KfuFiIWAP0qgDKlJ2r/sTmHRu6dPfzDD
 Ymh5y0ChjmKg9l42qpSANZ142i7ZNt3I4t0WigqbMHOxoL1EoPfsr07gh+Zshu2LpH
 zDImQtlL5a2PA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 32647C53BD0; Sat, 30 Sep 2023 06:45:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217958] New: Crashes if I boot the computer with the second
 display connected to HDMI output
Date: Sat, 30 Sep 2023 06:45:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anickname@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217958-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217958

            Bug ID: 217958
           Summary: Crashes if I boot the computer with the second display
                    connected to HDMI output
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: anickname@gmail.com
        Regression: No

If I boot the computer with the second display connected to HDMI output, th=
en I
can see a crash in the logs.
I already have another monitor (same model) connected to DP and it boots fi=
ne
only with this monitor.
If I connect the second monitor, to the same HDMI port after then computer =
is
booted, then the crash is not happening.

The following crashes are from different computer boots.

Kernel 6.X.Y, not tried on 5.X.Y

Video card: Sapphire Radeon=E2=84=A2 RX 6600 PULSE, 8GB GDDR6, 128-bit
https://www.sapphiretech.com/en/consumer/pulse-radeon-rx-6600-8g-gddr6
VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23
[Radeon RX 6600/6600 XT/6600M] (rev c7)
Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Aud=
io
Controller


kernel: ------------[ cut here ]------------
kernel: kernel BUG at mm/migrate.c:654!
kernel: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
kernel: CPU: 3 PID: 3798 Comm: systemd-sysctl Tainted: P           OE=20=20=
=20=20=20
6.5.5-arch1-1 #1 d82a0f532dd8cfe67d5795c1738d9c01059a0c62
kernel: Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS MASTER/X570
AORUS MASTER, BIOS F37c 03/23/2023
kernel: RIP: 0010:migrate_folio_extra+0x6c/0x70
kernel: Code: de 48 89 ef e8 05 e3 ff ff 5b 44 89 e0 5d 41 5c 41 5d e9 97 9=
1 9e
00 e8 f2 e2 ff ff 44 89 e0 5b 5d 41 5c 41 5d e9 84 91 9e 00 <0f> 0b 66 90 9=
0 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
kernel: RSP: 0018:ffff98535db977d0 EFLAGS: 00010282
kernel: RAX: 02ffff0000008025 RBX: ffffe848cc0c3780 RCX: 0000000000000002
kernel: RDX: ffffe848cc0c3780 RSI: ffffe848d0092240 RDI: ffff8b27d341fdd0
kernel: RBP: ffff8b27d341fdd0 R08: 0000000000000000 R09: 0000000000039120
kernel: R10: ffffe848d0092248 R11: 0000000000000000 R12: ffffe848d0092240
kernel: R13: 0000000000000002 R14: ffff98535db97888 R15: ffff98535db97878
kernel: FS:  00007f3c907a3e80(0000) GS:ffff8b468eac0000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000055af5c5add40 CR3: 00000001441a8000 CR4: 0000000000750ee0
kernel: PKRU: 55555554
kernel: Call Trace:
kernel:  <TASK>
kernel:  ? die+0x36/0x90
kernel:  ? do_trap+0xda/0x100
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? do_error_trap+0x6a/0x90
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? exc_invalid_op+0x50/0x70
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? asm_exc_invalid_op+0x1a/0x20
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  move_to_new_folio+0x136/0x150
kernel:  migrate_pages_batch+0x893/0xc10
kernel:  ? __pfx_remove_migration_pte+0x10/0x10
kernel:  migrate_pages+0xb9e/0xd20
kernel:  ? __pfx_alloc_migration_target+0x10/0x10
kernel:  __alloc_contig_migrate_range+0xb1/0x1c0
kernel:  alloc_contig_range+0x14e/0x280
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  alloc_contig_pages+0x206/0x260
kernel:  alloc_fresh_hugetlb_folio+0xa6/0x230
kernel:  alloc_pool_huge_page+0x80/0x100
kernel:  set_max_huge_pages+0x1a7/0x420
kernel:  hugetlb_sysctl_handler_common+0x10e/0x140
kernel:  ? __pfx_hugetlb_sysctl_handler+0x10/0x10
kernel:  proc_sys_call_handler+0x1c0/0x2e0
kernel:  vfs_write+0x23e/0x420
kernel:  ksys_write+0x6f/0xf0
kernel:  do_syscall_64+0x60/0x90
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? default_llseek+0x70/0xd0
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? ksys_lseek+0x6c/0xb0
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? exc_page_fault+0x7f/0x180
kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
kernel: RIP: 0033:0x7f3c912a4f84
kernel: Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 0=
0 00
f3 0f 1e fa 80 3d e5 c3 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 f=
f ff
77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
kernel: RSP: 002b:00007ffc47790068 EFLAGS: 00000202 ORIG_RAX: 0000000000000=
001
kernel: RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f3c912a4f84
kernel: RDX: 0000000000000004 RSI: 00007ffc47790140 RDI: 0000000000000004
kernel: RBP: 00007ffc47790140 R08: 0000557aa0d30010 R09: 0000000000000007
kernel: R10: 0000557aa0d326a0 R11: 0000000000000202 R12: 0000000000000004
kernel: R13: 0000557aa0d302d0 R14: 00007f3c91377f20 R15: 0000000000000004
kernel:  </TASK>
kernel: Modules linked in: kvm_amd(+) snd_hda_core btintel amdgpu(+) snd_hw=
dep
it87(OE) btmtk hwmon_vid kvm ir_rc6_decoder snd_pcm irqbypass snd_timer
bluetooth amdxcp drm_buddy rc_rc6_mce snd sp5100_tco gpu_sched ecdh_generic
gigabyte_wmi wmi_bmof pcspkr soundcore i2c_piix4 mceusb drm_suballoc_helper
zenpower(OE) rapl crc16 joydev mousedev mac_hid dm_multipath sg crypto_user
fuse loop ip_tables x_tables dm_crypt cbc encrypted_keys trusted asn1_encod=
er
tee hid_logitech_hidpp hid_logitech_dj usbhid zfs(POE) dm_mod zunicode(POE)
zzstd(OE) zlua(OE) zavl(POE) icp(POE) zcommon(POE) crct10dif_pclmul
znvpair(POE) crc32_pclmul crc32c_intel spl(OE) polyval_clmulni iwlmvm
polyval_generic gf128mul mac80211 ghash_clmulni_intel libarc4 sha512_ssse3 =
nvme
r8169 aesni_intel mpt3sas realtek nvme_core mdio_devres crypto_simd igb
raid_class xhci_pci cryptd ccp iwlwifi libphy xhci_pci_renesas dca
scsi_transport_sas nvme_common nouveau cfg80211 drm_ttm_helper rfkill ttm v=
ideo
i2c_algo_bit mxm_wmi wmi drm_display_helper cec vfat fat
kernel: ---[ end trace 0000000000000000 ]---
kernel: RIP: 0010:migrate_folio_extra+0x6c/0x70
kernel: Code: de 48 89 ef e8 05 e3 ff ff 5b 44 89 e0 5d 41 5c 41 5d e9 97 9=
1 9e
00 e8 f2 e2 ff ff 44 89 e0 5b 5d 41 5c 41 5d e9 84 91 9e 00 <0f> 0b 66 90 9=
0 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
kernel: RSP: 0018:ffff98535db977d0 EFLAGS: 00010282
kernel: RAX: 02ffff0000008025 RBX: ffffe848cc0c3780 RCX: 0000000000000002
kernel: RDX: ffffe848cc0c3780 RSI: ffffe848d0092240 RDI: ffff8b27d341fdd0
kernel: RBP: ffff8b27d341fdd0 R08: 0000000000000000 R09: 0000000000039120
kernel: R10: ffffe848d0092248 R11: 0000000000000000 R12: ffffe848d0092240
kernel: R13: 0000000000000002 R14: ffff98535db97888 R15: ffff98535db97878
kernel: FS:  00007f3c907a3e80(0000) GS:ffff8b468eac0000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000055af5c5add40 CR3: 00000001441a8000 CR4: 0000000000750ee0
kernel: PKRU: 55555554

---------------------------------------------------------------------------=
-------------------------------------------------------------

kernel: ------------[ cut here ]------------
kernel: kernel BUG at mm/migrate.c:654!
kernel: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
kernel: CPU: 0 PID: 3786 Comm: systemd-sysctl Tainted: P           OE=20=20=
=20=20=20
6.5.5-arch1-1 #1 d82a0f532dd8cfe67d5795c1738d9c01059a0c62
kernel: Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS MASTER/X570
AORUS MASTER, BIOS F37c 03/23/2023
kernel: RIP: 0010:migrate_folio_extra+0x6c/0x70
kernel: Code: de 48 89 ef e8 05 e3 ff ff 5b 44 89 e0 5d 41 5c 41 5d e9 97 9=
1 9e
00 e8 f2 e2 ff ff 44 89 e0 5b 5d 41 5c 41 5d e9 84 91 9e 00 <0f> 0b 66 90 9=
0 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
kernel: RSP: 0018:ffffa538dd66b7f0 EFLAGS: 00010282
kernel: RAX: 02ffff0000008025 RBX: ffffec990c56cc80 RCX: 0000000000000002
kernel: RDX: ffffec990c56cc80 RSI: ffffec9905416d00 RDI: ffff912d4a3d5080
kernel: rc rc1: Media Center Ed. eHome Infrared Remote Transceiver (0471:06=
0c)
as
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:08.0/0000:0a:00.3/usb=
3/3-6/3-6.3/3-6.3:1.0/rc/rc1
kernel: RBP: ffff912d4a3d5080 R08: 0000000000000000 R09: ffffffffbbfdf65c
kernel: R10: ffffec9905416d08 R11: 0000000000000000 R12: ffffec9905416d00
kernel: rc rc1: lirc_dev: driver mceusb registered at minor =3D 1, raw IR
receiver, raw IR transmitter
kernel: R13: 0000000000000002 R14: ffffa538dd66b8a8 R15: ffffa538dd66b898
kernel: FS:  00007f9254a92e80(0000) GS:ffff914c0ea00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000055cd613fe000 CR3: 0000000105034000 CR4: 0000000000750ef0
kernel: PKRU: 55555554
kernel: Call Trace:
kernel:  <TASK>
kernel: input: Media Center Ed. eHome Infrared Remote Transceiver (0471:060=
c)
as
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:08.0/0000:0a:00.3/usb=
3/3-6/3-6.3/3-6.3:1.0/rc/rc1/input34
kernel:  ? die+0x36/0x90
kernel:  ? do_trap+0xda/0x100
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? do_error_trap+0x6a/0x90
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? exc_invalid_op+0x50/0x70
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  ? asm_exc_invalid_op+0x1a/0x20
kernel:  ? migrate_folio_extra+0x6c/0x70
kernel:  move_to_new_folio+0x136/0x150
kernel:  migrate_pages_batch+0x893/0xc10
kernel:  ? __pfx_remove_migration_pte+0x10/0x10
kernel:  migrate_pages+0xb9e/0xd20
kernel:  ? __pfx_alloc_migration_target+0x10/0x10
kernel:  __alloc_contig_migrate_range+0xb1/0x1c0
kernel:  alloc_contig_range+0x14e/0x280
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  alloc_contig_pages+0x206/0x260
kernel:  alloc_fresh_hugetlb_folio+0xa6/0x230
kernel:  alloc_pool_huge_page+0x80/0x100
kernel:  set_max_huge_pages+0x1a7/0x420
kernel:  hugetlb_sysctl_handler_common+0x10e/0x140
kernel:  ? __pfx_hugetlb_sysctl_handler+0x10/0x10
kernel:  proc_sys_call_handler+0x1c0/0x2e0
kernel:  vfs_write+0x23e/0x420
kernel:  ksys_write+0x6f/0xf0
kernel:  do_syscall_64+0x60/0x90
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
kernel:  ? srso_alias_return_thunk+0x5/0x7f
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? do_syscall_64+0x6c/0x90
kernel:  ? exc_page_fault+0x7f/0x180
kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
kernel: RIP: 0033:0x7f9255593f84
kernel: Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 0=
0 00
f3 0f 1e fa 80 3d e5 c3 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 f=
f ff
77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
kernel: RSP: 002b:00007ffd93994b38 EFLAGS: 00000202 ORIG_RAX: 0000000000000=
001
kernel: RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f9255593f84
kernel: RDX: 0000000000000004 RSI: 00007ffd93994c10 RDI: 0000000000000004
kernel: RBP: 00007ffd93994c10 R08: 000055eaeea62010 R09: 0000000000000007
kernel: R10: 000055eaeea646e0 R11: 0000000000000202 R12: 0000000000000004
kernel: R13: 000055eaeea622d0 R14: 00007f9255666f20 R15: 0000000000000004
kernel:  </TASK>
kernel: Modules linked in: amdgpu(+) snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg intel_rapl_msr snd_intel_sdw_acpi intel_rapl_common
snd_hda_codec edac_mce_amd snd_hda_core btusb snd_hwdep btrtl btbcm kvm_amd
snd_pcm btintel amdxcp it87(OE) btmtk ir_rc6_decoder hwmon_vid snd_timer
drm_buddy kvm rc_rc6_mce bluetooth sp5100_tco snd irqbypass gpu_sched wmi_b=
mof
gigabyte_wmi drm_suballoc_helper pcspkr i2c_piix4 soundcore mceusb(+)
zenpower(OE) ecdh_generic rapl crc16 mousedev joydev mac_hid dm_multipath sg
crypto_user fuse loop ip_tables x_tables dm_crypt cbc encrypted_keys trusted
asn1_encoder tee zfs(POE) zunicode(POE) zzstd(OE) iwlmvm zlua(OE) zavl(POE)
hid_logitech_hidpp hid_logitech_dj usbhid icp(POE) crct10dif_pclmul
zcommon(POE) crc32_pclmul znvpair(POE) dm_mod crc32c_intel spl(OE)
polyval_clmulni mac80211 polyval_generic gf128mul ghash_clmulni_intel
sha512_ssse3 libarc4 r8169 nvme aesni_intel mpt3sas realtek nvme_core
mdio_devres crypto_simd igb raid_class xhci_pci cryptd ccp libphy iwlwifi
kernel:  xhci_pci_renesas dca scsi_transport_sas nvme_common nouveau cfg802=
11
rfkill drm_ttm_helper ttm video i2c_algo_bit mxm_wmi wmi drm_display_helper=
 cec
vfat fat
kernel: ---[ end trace 0000000000000000 ]---
kernel: RIP: 0010:migrate_folio_extra+0x6c/0x70
kernel: Code: de 48 89 ef e8 05 e3 ff ff 5b 44 89 e0 5d 41 5c 41 5d e9 97 9=
1 9e
00 e8 f2 e2 ff ff 44 89 e0 5b 5d 41 5c 41 5d e9 84 91 9e 00 <0f> 0b 66 90 9=
0 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
kernel: RSP: 0018:ffffa538dd66b7f0 EFLAGS: 00010282
kernel: RAX: 02ffff0000008025 RBX: ffffec990c56cc80 RCX: 0000000000000002
kernel: RDX: ffffec990c56cc80 RSI: ffffec9905416d00 RDI: ffff912d4a3d5080
kernel: RBP: ffff912d4a3d5080 R08: 0000000000000000 R09: ffffffffbbfdf65c
kernel: R10: ffffec9905416d08 R11: 0000000000000000 R12: ffffec9905416d00
kernel: R13: 0000000000000002 R14: ffffa538dd66b8a8 R15: ffffa538dd66b898
kernel: FS:  00007f9254a92e80(0000) GS:ffff914c0ea00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000055cd613fe000 CR3: 0000000105034000 CR4: 0000000000750ef0
kernel: PKRU: 55555554

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
