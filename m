Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lQJaDLDtdGlA/AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:05:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E07E146
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E68F10E14B;
	Sat, 24 Jan 2026 16:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="elkpJs5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A77010E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40F5A60018
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99A76C16AAE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769270695;
 bh=EiOD+9z9+iTlB582CbEVW8IIpi0HS7c5UUobcuigtVw=;
 h=From:To:Subject:Date:From;
 b=elkpJs5OgAvkkPhj//U1QBDJwKJ59vc71QnO3BKZTESpTV1wgJukLkMfviTQoOL9i
 VRmJ6bbv5BFpPO4ulS/NnYaWNCOnuL7RywpMk3Ve55CCGYluQLWZacUhBja78AblX+
 exz1zIc2ffWylWI7T8+1s2YXEA4UwyMo85yYBJb8Fuy1yM6QGpgGnkTvXJksEDrr6v
 6P7azxk2zX7dJMpUePU6PllO5/m3DEja/I5xYqSd9b+uB+weyMgXgVngibWPgEULY/
 BcPTq1xPs9cqWG8SED4yPlzR2uO5xiSB2iEX9dKf39F2qoDYd4dtG3gfln8OTxPBaF
 WdsbNXjh7E6zQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8CEF3C41612; Sat, 24 Jan 2026 16:04:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221008] New: amdgpu: Crash with KDE Plasma built from master
Date: Sat, 24 Jan 2026 16:04:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asn@samba.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221008-2300@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: C87E07E146
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221008

            Bug ID: 221008
           Summary: amdgpu: Crash with KDE Plasma built from master
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: asn@samba.org
        Regression: No

SUMMARY
I'm trying to implement a feature in plasma-workspace. So I built plasma ma=
ster
with kde-builder to test it. After logging in, the screen start to get black
line by line like pacman.

Then the kernel crashes :-(

STEPS TO REPRODUCE
1. Build KDE with kde-builder=20
2. Login
3. System freeze

OBSERVED RESULT
[ 7433.940000] [ T376673] ------------[ cut here ]------------
[ 7433.940004] [ T376673] refcount_t: underflow; use-after-free.
[ 7433.940008] [ T376673] WARNING: CPU: 14 PID: 376673 at lib/refcount.c:28
refcount_warn_saturate+0xbe/0x110
[ 7433.940014] [ T376673] Modules linked in: uinput snd_seq_dummy snd_hrtim=
er
snd_seq af_packet nft_masq algif_hash af_alg nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_n=
at
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security vboxnetadp(O) vboxnetflt(O) ip6table_filter qrtr vboxdrv(O)
iptable_filter binfmt_misc nls_iso8859_1 nls_cp437 vfat fat
snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_codec_generic
snd_hda_codec_atihdmi amd_atl intel_rapl_msr snd_hda_codec_hdmi
intel_rapl_common snd_hda_intel uvcvideo snd_usb_audio snd_hda_codec
videobuf2_vmalloc snd_usbmidi_lib snd_hda_core uvc snd_ump eeepc_wmi
edac_mce_amd snd_intel_dspcfg videobuf2_memops snd_rawmidi asus_wmi
snd_intel_sdw_acpi kvm_amd videobuf2_v4l2 snd_seq_device platform_profile
snd_hwdep spd5118 videobuf2_common snd_pcm battery
[ 7433.940036] [ T376673]  kvm snd_timer sparse_keymap raid1 videodev i2c_p=
iix4
asus_ec_sensors atlantic snd irqbypass rfkill pcspkr wmi_bmof k10temp i2c_s=
mbus
joydev mc gpio_amdpt md_mod macsec soundcore tiny_power_button amd_3d_vcache
gpio_generic button acpi_pad nvme_fabrics fuse loop efi_pstore
hid_logitech_hidpp hid_multitouch hid_logitech_dj hid_generic amdgpu dm_cry=
pt
essiv authenc crc16 trusted usbhid amdxcp asn1_encoder tee i2c_algo_bit ahci
drm_ttm_helper libahci ucsi_acpi ttm libata typec_ucsi drm_exec sd_mod roles
drm_panel_backlight_quirks scsi_dh_emc typec gpu_sched scsi_dh_rdac
drm_suballoc_helper nvme scsi_dh_alua drm_buddy nvme_core polyval_clmulni sg
xhci_pci drm_display_helper nvme_keyring ghash_clmulni_intel scsi_mod xhci_=
hcd
cec nvme_auth video aesni_intel ccp sp5100_tco scsi_common usbcore rc_core =
hkdf
wmi thunderbolt btrfs blake2b_generic xor raid6_pq dm_mirror dm_region_hash
dm_log dm_mod br_netfilter bridge stp llc nf_tables msr i2c_dev ip6_tables
ntsync nfnetlink efivarfs dmi_sysfs ip_tables x_tables
[ 7433.940069] [ T376673] CPU: 14 UID: 0 PID: 376673 Comm: kworker/14:5
Tainted: G           O        6.18.6-1-default #1 PREEMPT(voluntary) openSU=
SE
Tumbleweed  92cb00939711ed77e866daec88f8ff02e7729bee
[ 7433.940071] [ T376673] Tainted: [O]=3DOOT_MODULE
[ 7433.940072] [ T376673] Hardware name: ASUS System Product Name/ProArt
X870E-CREATOR WIFI, BIOS 1805 12/11/2025
[ 7433.940075] [ T375857] ------------[ cut here ]------------
[ 7433.940079] [ T375857] refcount_t: saturated; leaking memory.
[ 7433.940084] [ T375857] WARNING: CPU: 15 PID: 375857 at lib/refcount.c:22
refcount_warn_saturate+0x55/0x110
[ 7433.940091] [ T375857] Modules linked in: uinput snd_seq_dummy snd_hrtim=
er
snd_seq af_packet nft_masq algif_hash af_alg nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_n=
at
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security vboxnetadp(O) vboxnetflt(O) ip6table_filter qrtr vboxdrv(O)
iptable_filter binfmt_misc nls_iso8859_1 nls_cp437 vfat fat
snd_hda_codec_alc882 snd_hda_codec_realtek_lib snd_hda_codec_generic
snd_hda_codec_atihdmi amd_atl intel_rapl_msr snd_hda_codec_hdmi
intel_rapl_common snd_hda_intel uvcvideo snd_usb_audio snd_hda_codec
videobuf2_vmalloc snd_usbmidi_lib snd_hda_core uvc snd_ump eeepc_wmi
edac_mce_amd snd_intel_dspcfg videobuf2_memops snd_rawmidi asus_wmi
snd_intel_sdw_acpi kvm_amd videobuf2_v4l2 snd_seq_device platform_profile
snd_hwdep spd5118 videobuf2_common snd_pcm battery
[ 7433.940120] [ T375857]  kvm snd_timer sparse_keymap raid1 videodev i2c_p=
iix4
asus_ec_sensors atlantic snd irqbypass rfkill pcspkr wmi_bmof k10temp i2c_s=
mbus
joydev mc gpio_amdpt md_mod macsec soundcore tiny_power_button amd_3d_vcache
gpio_generic button acpi_pad nvme_fabrics fuse loop efi_pstore
hid_logitech_hidpp hid_multitouch hid_logitech_dj hid_generic amdgpu dm_cry=
pt
essiv authenc crc16 trusted usbhid amdxcp asn1_encoder tee i2c_algo_bit ahci
drm_ttm_helper libahci ucsi_acpi ttm libata typec_ucsi drm_exec sd_mod roles
drm_panel_backlight_quirks scsi_dh_emc typec gpu_sched scsi_dh_rdac
drm_suballoc_helper nvme scsi_dh_alua drm_buddy nvme_core polyval_clmulni sg
xhci_pci drm_display_helper nvme_keyring ghash_clmulni_intel scsi_mod xhci_=
hcd
cec nvme_auth video aesni_intel ccp sp5100_tco scsi_common usbcore rc_core =
hkdf
wmi thunderbolt btrfs blake2b_generic xor raid6_pq dm_mirror dm_region_hash
dm_log dm_mod br_netfilter bridge stp llc nf_tables msr i2c_dev ip6_tables
ntsync nfnetlink efivarfs dmi_sysfs ip_tables x_tables
[ 7433.940157] [ T375857] CPU: 15 UID: 1001 PID: 375857 Comm: kwin_wayland
Tainted: G           O        6.18.6-1-default #1 PREEMPT(voluntary) openSU=
SE
Tumbleweed  92cb00939711ed77e866daec88f8ff02e7729bee
[ 7433.940163] [ T375857] Tainted: [O]=3DOOT_MODULE
[ 7433.940163] [ T375857] Hardware name: ASUS System Product Name/ProArt
X870E-CREATOR WIFI, BIOS 1805 12/11/2025
[ 7433.940165] [ T375857] RIP: 0010:refcount_warn_saturate+0x55/0x110
[ 7433.940168] [ T375857] Code: 84 bc 00 00 00 c3 cc cc cc cc 85 f6 74 46 8=
0 3d
09 2c b2 01 00 75 ee 48 c7 c7 e8 69 ed 85 c6 05 f9 2b b2 01 01 e8 cb aa 99 =
ff
<0f> 0b c3 cc cc cc cc 80 3d e2 2b b2 01 00 75 cb 48 c7 c7 98 6a ed
[ 7433.940170] [ T375857] RSP: 0018:ffffd3174f4f3878 EFLAGS: 00010246
[ 7433.940172] [ T375857] RAX: 0000000000000000 RBX: ffff8b7a0c5af000 RCX:
0000000000000027
[ 7433.940174] [ T375857] RDX: ffff8b88bf59ff08 RSI: 0000000000000001 RDI:
ffff8b88bf59ff00
[ 7433.940175] [ T375857] RBP: ffff8b7a0d853400 R08: 0000000000000000 R09:
00000000fffeffff
[ 7433.940176] [ T375857] R10: ffffffff874ea0a0 R11: ffffd3174f4f3720 R12:
ffff8b7a0fcf3000
[ 7433.940177] [ T375857] R13: ffff8b7a0c5af000 R14: ffff8b7a0fce8058 R15:
0000000000000001
[ 7433.940178] [ T375857] FS:  00007f4552ce2640(0000) GS:ffff8b8938144000(0=
000)
knlGS:0000000000000000
[ 7433.940180] [ T375857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7433.940181] [ T375857] CR2: 000000002e6e94c8 CR3: 00000001d2ead000 CR4:
0000000000f50ef0
[ 7433.940182] [ T375857] PKRU: 55555554
[ 7433.940183] [ T375857] Call Trace:
[ 7433.940185] [ T375857]  <TASK>
[ 7433.940073] [ T376673] Workqueue: events dm_handle_vmin_vmax_update [amd=
gpu]
[ 7433.940287] [ T376673] RIP: 0010:refcount_warn_saturate+0xbe/0x110
[ 7433.940289] [ T376673] Code: 01 01 e8 85 aa 99 ff 0f 0b c3 cc cc cc cc 8=
0 3d
9e 2b b2 01 00 75 85 48 c7 c7 40 6a ed 85 c6 05 8e 2b b2 01 01 e8 62 aa 99 =
ff
<0f> 0b c3 cc cc cc cc 80 3d 7c 2b b2 01 00 0f 85 5e ff ff ff 48 c7
[ 7433.940290] [ T376673] RSP: 0018:ffffd317473a3e20 EFLAGS: 00010246
[ 7433.940291] [ T376673] RAX: 0000000000000000 RBX: ffff8b7a0c431240 RCX:
0000000000000027
[ 7433.940292] [ T376673] RDX: ffff8b88bf51ff08 RSI: 0000000000000001 RDI:
ffff8b88bf51ff00
[ 7433.940292] [ T376673] RBP: ffff8b7b0fb98000 R08: 0000000000000000 R09:
00000000fffeffff
[ 7433.940293] [ T376673] R10: ffffffff874ea0a0 R11: ffffd317473a3cc8 R12:
ffff8b88bf534900
[ 7433.940293] [ T376673] R13: ffff8b7a26580000 R14: ffff8b7a0c44c180 R15:
ffff8b7a0c431240
[ 7433.940294] [ T376673] FS:  0000000000000000(0000) GS:ffff8b89380c4000(0=
000)
knlGS:0000000000000000
[ 7433.940295] [ T376673] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7433.940295] [ T376673] CR2: 000000002e7fdb68 CR3: 00000001d2ead000 CR4:
0000000000f50ef0
[ 7433.940296] [ T376673] PKRU: 55555554
[ 7433.940296] [ T376673] Call Trace:
[ 7433.940297] [ T376673]  <TASK>
[ 7433.940298] [ T376673]  dm_handle_vmin_vmax_update+0x52/0x70 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[ 7433.940187] [ T375857]  amdgpu_dm_crtc_duplicate_state+0x8c/0x190 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[ 7433.940457] [ T376673]  process_one_work+0x193/0x350
[ 7433.940460] [ T376673]  worker_thread+0x2d7/0x410
[ 7433.940462] [ T376673]  ? __pfx_worker_thread+0x10/0x10
[ 7433.940463] [ T376673]  kthread+0xfc/0x230
[ 7433.940464] [ T376673]  ? __pfx_kthread+0x10/0x10
[ 7433.940465] [ T376673]  ? __pfx_kthread+0x10/0x10
[ 7433.940466] [ T376673]  ret_from_fork+0x1c2/0x1f0
[ 7433.940468] [ T376673]  ? __pfx_kthread+0x10/0x10
[ 7433.940469] [ T376673]  ret_from_fork_asm+0x1a/0x30
[ 7433.940472] [ T376673]  </TASK>
[ 7433.940472] [ T376673] ---[ end trace 0000000000000000 ]---
[ 7433.940625] [ T375857]  drm_atomic_get_crtc_state+0x7f/0x120
[ 7433.940629] [ T375857]  drm_atomic_get_plane_state+0x13c/0x1a0
[ 7433.940631] [ T375857]  drm_atomic_set_property+0x2ab/0xd50
[ 7433.940636] [ T375857]  drm_mode_atomic_ioctl+0x225/0xd00
[ 7433.940640] [ T375857]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 7433.940643] [ T375857]  drm_ioctl_kernel+0xa6/0x100
[ 7433.940646] [ T375857]  drm_ioctl+0x262/0x510
[ 7433.940648] [ T375857]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 7433.940651] [ T375857]  ? radix_tree_delete_item+0x6b/0xd0
[ 7433.940655] [ T375857]  amdgpu_drm_ioctl+0x4a/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[ 7433.940794] [ T375857]  __x64_sys_ioctl+0x97/0xe0
[ 7433.940797] [ T375857]  do_syscall_64+0x81/0x800
[ 7433.940799] [ T375857]  ? __task_pid_nr_ns+0x5f/0xc0
[ 7433.940801] [ T375857]  ? __do_sys_getpid+0x1d/0x30
[ 7433.940803] [ T375857]  ? do_syscall_64+0x81/0x800
[ 7433.940804] [ T375857]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[ 7433.940896] [ T375857]  ? __x64_sys_ioctl+0xb1/0xe0
[ 7433.940897] [ T375857]  ? do_syscall_64+0x81/0x800
[ 7433.940898] [ T375857]  ? drm_ioctl+0x280/0x510
[ 7433.940899] [ T375857]  ? __pfx_drm_mode_addfb2_ioctl+0x10/0x10
[ 7433.940901] [ T375857]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[ 7433.940990] [ T375857]  ? __x64_sys_ioctl+0xb1/0xe0
[ 7433.940992] [ T375857]  ? do_syscall_64+0x81/0x800
[ 7433.940992] [ T375857]  ? do_syscall_64+0x81/0x800
[ 7433.940993] [ T375857]  ? exc_page_fault+0x69/0x170
[ 7433.940994] [ T375857]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 7433.940996] [ T375857] RIP: 0033:0x7f4555b1c3ff
[ 7433.941023] [ T375857] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 0=
4 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f =
05
<89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[ 7433.941024] [ T375857] RSP: 002b:00007ffe64f84720 EFLAGS: 00000246 ORIG_=
RAX:
0000000000000010
[ 7433.941025] [ T375857] RAX: ffffffffffffffda RBX: 000000002f288f80 RCX:
00007f4555b1c3ff
[ 7433.941025] [ T375857] RDX: 00007ffe64f84810 RSI: 00000000c03864bc RDI:
0000000000000013
[ 7433.941026] [ T375857] RBP: 00007ffe64f84810 R08: 000000002f288f80 R09:
000000002f594370
[ 7433.941026] [ T375857] R10: 000000002f5944e8 R11: 0000000000000246 R12:
00000000c03864bc
[ 7433.941027] [ T375857] R13: 0000000000000013 R14: 000000002f5944e8 R15:
000000002f594370
[ 7433.941028] [ T375857]  </TASK>
[ 7433.941028] [ T375857] ---[ end trace 0000000000000000 ]---


EXPECTED RESULT
No kernel crash

SOFTWARE/OS VERSIONS
Linux/KDE Plasma: KDE Plasma build from master on openSUSE Tumbleweed
KDE Plasma Version: master (2026-01-24)
KDE Frameworks Version: master (2026-01-24)
Qt Version: 6.10.1

ADDITIONAL INFORMATION
GPU: AMD Radeon RX 9070 XT (RADV GFX1201)
Kernel: Linux magrathea 6.18.6-1-default #1 SMP PREEMPT_DYNAMIC Sun Jan 18
09:01:37 UTC 2026 (e4ae677) x86_64 x86_64 x86_64 GNU/Linux
Mesa: 25.3.3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
