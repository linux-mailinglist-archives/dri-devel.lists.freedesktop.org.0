Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95FC0F87
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 05:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA626E0E5;
	Sat, 28 Sep 2019 03:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C5F16E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 03:42:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 02A6872162; Sat, 28 Sep 2019 03:42:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111819] Running apps via Flatpak with DRI device access:
 [gfxhub] retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X
 pid 2148 thread X:cs0 pid 2151) in page starting at address
 0x0000000107720000 from 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031
Date: Sat, 28 Sep 2019 03:42:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: devurandom@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111819-502-w8NnYQBBCT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111819-502@http.bugs.freedesktop.org/>
References: <bug-111819-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0677025035=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0677025035==
Content-Type: multipart/alternative; boundary="15696421650.D2EB.16638"
Content-Transfer-Encoding: 7bit


--15696421650.D2EB.16638
Date: Sat, 28 Sep 2019 03:42:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111819

--- Comment #10 from Dennis Schridde <devurandom@gmx.net> ---
Created attachment 145562
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145562&action=3Dedit
dmesg, with backtraces in DCN

`flatpak run --nodevice=3Dall com.valvesoftware.Steam` also makes Steam sta=
rt.

`flatpak run --nodevice=3Ddri com.valvesoftware.Steam` does not.  It appear=
s that
`--nodevice` has to match the `device` setting in the app manifest and
arithmethic like `all - dri` is not supported.

This time I also found this in dmesg, supposedly from running org.signal.Si=
gnal
(according to the time: I first tried Signal with --nodevice=3Dall, then wi=
th
--nodevice=3Ddri, then I tried Steam with --nodevice=3Ddri, and again with
--nodevice=3Dall):
[47269.569990] ------------[ cut here ]------------=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                 [1173/5119]
[47269.570063] WARNING: CPU: 7 PID: 1150 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x227 [amdgpu]=20=20=20=20=20
[47269.570065] Modules linked in: fuse nf_conntrack_netlink xfrm_user xfrm_=
algo
br_netfilter nf_nat_tftp tun bridge stp llc nft_masq ebtable_nat ip_set
nft_chain_nat ebtable_filter ebtables nft_objref nft_reject_inet nf_reject_=
ipv6
nft_reject nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib xt_MASQUERADE
xt_addrtype nf_tables_set iptable_nat ipt_REJECT nf_reject_i
pv4 xt_conntrack iptable_filter xt_CHECKSUM nf_conntrack_tftp
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_tcpudp iptable_mangle
ip6table_filter ip6table_security ip6table_raw nft_ct ip6table_mangle
ip6table_nat nf_nat nf_conntrack bluetooth nf_tables nf_defrag_ipv6
nf_defrag_ipv4 ip6_tables iptable_security iptable_raw ip_tables nfnetlink
ecdh_generic ecc=20
crc16 x_tables bpfilter amdgpu snd_hda_codec_realtek snd_hda_codec_generic
kvm_amd ledtrig_audio snd_hda_codec_hdmi gpu_sched ttm ccp snd_hda_intel
snd_hda_codec rng_core kvm eeepc_wmi drm_kms_helper snd_hda_core asus_wmi
snd_hwdep snd_pcm sparse_keymap=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
[47269.570085]  syscopyarea sysfillrect sysimgblt rfkill sp5100_tco wmi_bmof
snd_timer pcspkr irqbypass fb_sys_fops k10temp input_leds drm snd i2c_piix4
led_class soundcore mousedev joydev gpio_amdpt gpio_generic evdev mac_hid
acpi_cpufreq nls_iso8859_1 nls_cp437 vfat fat sch_fq_codel sctp lm92 btrfs =
xor
raid6_pq dm_cache_smq dm_cache dm_persistent_data dm_bio_p
rison dm_bufio libcrc32c crc32c_generic sd_mod usbkbd hid_generic usbmouse
usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel a=
hci
libahci aesni_intel libata igb aes_x86_64 crypto_simd xhci_pci xhci_hcd cry=
ptd
i2c_algo_bit scsi_mod glue_helper dca hwmon wmi pinctrl_amd sunrpc dm_mirror
dm_region_hash dm_log dm_mod=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570110] CPU: 7 PID: 1150 Comm: X Tainted: G                T
5.3.1-gentoo #7=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570112] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
B350-F GAMING, BIOS 5216 09/02/2019=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[47269.570154] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
27
[amdgpu]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570156] Code: 83 c8 ff e9 09 02 f9 ff 48 c7 c7 98 1e df c0 e8 53 a8 =
97
de 0f 0b 83 c8 ff e9 f3 01 f9 ff 48 c7 c7 98 1e df c0 e8 3d a8 97 de <0f> 0=
b 80
bb 9f 01 00 00 00 75 05 e9 fb 24 f9 ff 48 8b 83 f8 02 00=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570157] RSP: 0018:ffffaab7c120f730 EFLAGS: 00010246=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570159] RAX: 0000000000000024 RBX: ffff99fb2cd00000 RCX:
0000000000000006=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570160] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff99fb307d64d0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570160] RBP: ffff99fb2cd00000 R08: 000000007ffffffd R09:
0000000000000545=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570161] R10: 000000000000003b R11: ffffaab7c120f5e0 R12:
ffff99fac66601b8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570162] R13: ffff99fac6661d18 R14: ffff99fac66601b8 R15:
ffff99f8ac70c000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570163] FS:  00007f1c1d65d480(0000) GS:ffff99fb307c0000(0000)
knlGS:0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570164] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570165] CR2: 0000565061480000 CR3: 00000003b6916000 CR4:
00000000003406e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570166] Call Trace:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570212]  dcn10_pipe_control_lock.part.0+0x64/0x70 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570253]  dc_stream_set_cursor_attributes+0x11c/0x170 [amdgpu]=20=20=
=20=20=20=20=20=20=20=20=20=20
[47269.570297]  handle_cursor_update.isra.0+0x1f1/0x350 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570341]  amdgpu_dm_commit_cursors.isra.0+0x56/0x70 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570384]  amdgpu_dm_atomic_commit_tail+0x12b9/0x1c50 [amdgpu]=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570388]  ? enqueue_task_rt+0x9d/0xc0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
[47269.570392]  ? ttm_eu_backoff_reservation+0x3f/0x80 [ttm]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570435]  ? dm_plane_helper_prepare_fb+0x19c/0x2d0 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570437]  ? _cond_resched+0x10/0x20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[47269.570439]  ? wait_for_completion_timeout+0x31/0x110=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570440]  ? wait_for_completion_interruptible+0x2e/0x140=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570441]  ? complete_all+0x2b/0x40=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[47269.570447]  ? commit_tail+0x37/0x60 [drm_kms_helper]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570451]  commit_tail+0x37/0x60 [drm_kms_helper]=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570456]  drm_atomic_helper_commit+0x103/0x110 [drm_kms_helper]
[47269.570461]  drm_atomic_helper_update_plane+0xe7/0x100 [drm_kms_helper]
[47269.570470]  drm_mode_cursor_universal+0x127/0x240 [drm]
[47269.570478]  drm_mode_cursor_common+0xd9/0x230 [drm]
[47269.570486]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.570492]  drm_ioctl_kernel+0xa2/0xf0 [drm]
[47269.570499]  drm_ioctl+0x200/0x380 [drm]
[47269.570507]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.570536]  amdgpu_drm_ioctl+0x41/0x70 [amdgpu]
[47269.570539]  do_vfs_ioctl+0x44a/0x6e0
[47269.570541]  ksys_ioctl+0x59/0x90
[47269.570542]  __x64_sys_ioctl+0x11/0x20
[47269.570545]  do_syscall_64+0x4a/0x110
[47269.570547]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[47269.570548] RIP: 0033:0x7f1c1e2a7597
[47269.570550] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d c9 48 0d 00 f7 d8 64 89 01 48
[47269.570551] RSP: 002b:00007fff5dd14a48 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[47269.570552] RAX: ffffffffffffffda RBX: 00007fff5dd14a80 RCX:
00007f1c1e2a7597
[47269.570553] RDX: 00007fff5dd14a80 RSI: 00000000c02464bb RDI:
000000000000000c
[47269.570554] RBP: 00000000c02464bb R08: 0000565061371710 R09:
0000000000003fff
[47269.570554] R10: 000000000000007f R11: 0000000000000246 R12:
0000565060457200
[47269.570555] R13: 000000000000000c R14: 0000000000000004 R15:
0000565060459fa0
[47269.570557] ---[ end trace 0b5db3fd3a295d4e ]---

[47269.571134] ------------[ cut here ]------------
[47269.571195] WARNING: CPU: 7 PID: 1150 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x227 [amdgpu]
[47269.571196] Modules linked in: fuse nf_conntrack_netlink xfrm_user xfrm_=
algo
br_netfilter nf_nat_tftp tun bridge stp llc nft_masq ebtable_nat ip_set
nft_chain_nat ebtable_filter ebtables nft_objref nft_reject_inet nf_reject_=
ipv6
nft_reject nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib xt_MASQUERADE
xt_addrtype nf_tables_set iptable_nat ipt_REJECT nf_reject_i
pv4 xt_conntrack iptable_filter xt_CHECKSUM nf_conntrack_tftp
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_tcpudp iptable_mangle
ip6table_filter ip6table_security ip6table_raw nft_ct ip6table_mangle
ip6table_nat nf_nat nf_conntrack bluetooth nf_tables nf_defrag_ipv6
nf_defrag_ipv4 ip6_tables iptable_security iptable_raw ip_tables nfnetlink
ecdh_generic ecc=20
crc16 x_tables bpfilter amdgpu snd_hda_codec_realtek snd_hda_codec_generic
kvm_amd ledtrig_audio snd_hda_codec_hdmi gpu_sched ttm ccp snd_hda_intel
snd_hda_codec rng_core kvm eeepc_wmi drm_kms_helper snd_hda_core asus_wmi
snd_hwdep snd_pcm sparse_keymap
[47269.571214]  syscopyarea sysfillrect sysimgblt rfkill sp5100_tco wmi_bmof
snd_timer pcspkr irqbypass fb_sys_fops k10temp input_leds drm snd i2c_piix4
led_class soundcore mousedev joydev gpio_amdpt gpio_generic evdev mac_hid
acpi_cpufreq nls_iso8859_1 nls_cp437 vfat fat sch_fq_codel sctp lm92 btrfs =
xor
raid6_pq dm_cache_smq dm_cache dm_persistent_data dm_bio_p
rison dm_bufio libcrc32c crc32c_generic sd_mod usbkbd hid_generic usbmouse
usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel a=
hci
libahci aesni_intel libata igb aes_x86_64 crypto_simd xhci_pci xhci_hcd cry=
ptd
i2c_algo_bit scsi_mod glue_helper dca hwmon wmi pinctrl_amd sunrpc dm_mirror
dm_region_hash dm_log dm_mod
[47269.571236] CPU: 7 PID: 1150 Comm: X Tainted: G        W       T
5.3.1-gentoo #7
[47269.571237] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
B350-F GAMING, BIOS 5216 09/02/2019
[47269.571278] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
27
[amdgpu]
[47269.571279] Code: 83 c8 ff e9 09 02 f9 ff 48 c7 c7 98 1e df c0 e8 53 a8 =
97
de 0f 0b 83 c8 ff e9 f3 01 f9 ff 48 c7 c7 98 1e df c0 e8 3d a8 97 de <0f> 0=
b 80
bb 9f 01 00 00 00 75 05 e9 fb 24 f9 ff 48 8b 83 f8 02 00
[47269.571280] RSP: 0018:ffffaab7c120f750 EFLAGS: 00010246
[47269.571281] RAX: 0000000000000024 RBX: ffff99fb2cd00000 RCX:
0000000000000006
[47269.571282] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff99fb307d64d0
[47269.571283] RBP: ffff99fb21f39800 R08: 000000007ffffffd R09:
000000000000057d
[47269.571284] R10: 000000000000003b R11: ffffaab7c120f600 R12:
ffff99fb2cd00000
[47269.571284] R13: ffff99fac6661d18 R14: ffff99fac66601b8 R15:
ffff99f8ac70c000
[47269.571285] FS:  00007f1c1d65d480(0000) GS:ffff99fb307c0000(0000)
knlGS:0000000000000000
[47269.571286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[47269.571287] CR2: 0000565061480000 CR3: 00000003b6916000 CR4:
00000000003406e0
[47269.571288] Call Trace:
[47269.571331]  dc_stream_set_cursor_attributes+0x11c/0x170 [amdgpu]
[47269.571375]  handle_cursor_update.isra.0+0x1f1/0x350 [amdgpu]
[47269.571418]  amdgpu_dm_commit_cursors.isra.0+0x56/0x70 [amdgpu]
[47269.571461]  amdgpu_dm_atomic_commit_tail+0x12b9/0x1c50 [amdgpu]
[47269.571464]  ? enqueue_task_rt+0x9d/0xc0
[47269.571468]  ? ttm_eu_backoff_reservation+0x3f/0x80 [ttm]
[47269.571510]  ? dm_plane_helper_prepare_fb+0x19c/0x2d0 [amdgpu]
[47269.571512]  ? _cond_resched+0x10/0x20
[47269.571513]  ? wait_for_completion_timeout+0x31/0x110
[47269.571514]  ? wait_for_completion_interruptible+0x2e/0x140
[47269.571516]  ? complete_all+0x2b/0x40
[47269.571521]  ? commit_tail+0x37/0x60 [drm_kms_helper]
[47269.571526]  commit_tail+0x37/0x60 [drm_kms_helper]
[47269.571530]  drm_atomic_helper_commit+0x103/0x110 [drm_kms_helper]
[47269.571535]  drm_atomic_helper_update_plane+0xe7/0x100 [drm_kms_helper]
[47269.571543]  drm_mode_cursor_universal+0x127/0x240 [drm]
[47269.571552]  drm_mode_cursor_common+0xd9/0x230 [drm]
[47269.571559]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.571566]  drm_ioctl_kernel+0xa2/0xf0 [drm]
[47269.571572]  drm_ioctl+0x200/0x380 [drm]
[47269.571580]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.571609]  amdgpu_drm_ioctl+0x41/0x70 [amdgpu]
[47269.571612]  do_vfs_ioctl+0x44a/0x6e0
[47269.571613]  ksys_ioctl+0x59/0x90
[47269.571614]  __x64_sys_ioctl+0x11/0x20
[47269.571616]  do_syscall_64+0x4a/0x110
[47269.571618]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[47269.571619] RIP: 0033:0x7f1c1e2a7597
[47269.571621] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d c9 48 0d 00 f7 d8 64 89 01 48
[47269.571621] RSP: 002b:00007fff5dd14a48 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[47269.571622] RAX: ffffffffffffffda RBX: 00007fff5dd14a80 RCX:
00007f1c1e2a7597
[47269.571623] RDX: 00007fff5dd14a80 RSI: 00000000c02464bb RDI:
000000000000000c
[47269.571624] RBP: 00000000c02464bb R08: 0000565061371710 R09:
0000000000003fff
[47269.571625] R10: 000000000000007f R11: 0000000000000246 R12:
0000565060457200
[47269.571626] R13: 000000000000000c R14: 0000000000000004 R15:
0000565060459fa0
[47269.571627] ---[ end trace 0b5db3fd3a295d4f ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696421650.D2EB.16638
Date: Sat, 28 Sep 2019 03:42:45 +0000
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
   title=3D"NEW - Running apps via Flatpak with DRI device access: [gfxhub]=
 retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X pid 21=
48 thread X:cs0 pid 2151) in page starting at address 0x0000000107720000 fr=
om 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111819#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Running apps via Flatpak with DRI device access: [gfxhub]=
 retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X pid 21=
48 thread X:cs0 pid 2151) in page starting at address 0x0000000107720000 fr=
om 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111819">bug 11181=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
devurandom&#64;gmx.net" title=3D"Dennis Schridde &lt;devurandom&#64;gmx.net=
&gt;"> <span class=3D"fn">Dennis Schridde</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145562=
" name=3D"attach_145562" title=3D"dmesg, with backtraces in DCN">attachment=
 145562</a> <a href=3D"attachment.cgi?id=3D145562&amp;action=3Dedit" title=
=3D"dmesg, with backtraces in DCN">[details]</a></span>
dmesg, with backtraces in DCN

`flatpak run --nodevice=3Dall com.valvesoftware.Steam` also makes Steam sta=
rt.

`flatpak run --nodevice=3Ddri com.valvesoftware.Steam` does not.  It appear=
s that
`--nodevice` has to match the `device` setting in the app manifest and
arithmethic like `all - dri` is not supported.

This time I also found this in dmesg, supposedly from running org.signal.Si=
gnal
(according to the time: I first tried Signal with --nodevice=3Dall, then wi=
th
--nodevice=3Ddri, then I tried Steam with --nodevice=3Ddri, and again with
--nodevice=3Dall):
[47269.569990] ------------[ cut here ]------------=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                 [1173/5119]
[47269.570063] WARNING: CPU: 7 PID: 1150 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x227 [amdgpu]=20=20=20=20=20
[47269.570065] Modules linked in: fuse nf_conntrack_netlink xfrm_user xfrm_=
algo
br_netfilter nf_nat_tftp tun bridge stp llc nft_masq ebtable_nat ip_set
nft_chain_nat ebtable_filter ebtables nft_objref nft_reject_inet nf_reject_=
ipv6
nft_reject nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib xt_MASQUERADE
xt_addrtype nf_tables_set iptable_nat ipt_REJECT nf_reject_i
pv4 xt_conntrack iptable_filter xt_CHECKSUM nf_conntrack_tftp
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_tcpudp iptable_mangle
ip6table_filter ip6table_security ip6table_raw nft_ct ip6table_mangle
ip6table_nat nf_nat nf_conntrack bluetooth nf_tables nf_defrag_ipv6
nf_defrag_ipv4 ip6_tables iptable_security iptable_raw ip_tables nfnetlink
ecdh_generic ecc=20
crc16 x_tables bpfilter amdgpu snd_hda_codec_realtek snd_hda_codec_generic
kvm_amd ledtrig_audio snd_hda_codec_hdmi gpu_sched ttm ccp snd_hda_intel
snd_hda_codec rng_core kvm eeepc_wmi drm_kms_helper snd_hda_core asus_wmi
snd_hwdep snd_pcm sparse_keymap=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
[47269.570085]  syscopyarea sysfillrect sysimgblt rfkill sp5100_tco wmi_bmof
snd_timer pcspkr irqbypass fb_sys_fops k10temp input_leds drm snd i2c_piix4
led_class soundcore mousedev joydev gpio_amdpt gpio_generic evdev mac_hid
acpi_cpufreq nls_iso8859_1 nls_cp437 vfat fat sch_fq_codel sctp lm92 btrfs =
xor
raid6_pq dm_cache_smq dm_cache dm_persistent_data dm_bio_p
rison dm_bufio libcrc32c crc32c_generic sd_mod usbkbd hid_generic usbmouse
usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel a=
hci
libahci aesni_intel libata igb aes_x86_64 crypto_simd xhci_pci xhci_hcd cry=
ptd
i2c_algo_bit scsi_mod glue_helper dca hwmon wmi pinctrl_amd sunrpc dm_mirror
dm_region_hash dm_log dm_mod=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570110] CPU: 7 PID: 1150 Comm: X Tainted: G                T
5.3.1-gentoo #7=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570112] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
B350-F GAMING, BIOS 5216 09/02/2019=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[47269.570154] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
27
[amdgpu]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570156] Code: 83 c8 ff e9 09 02 f9 ff 48 c7 c7 98 1e df c0 e8 53 a8 =
97
de 0f 0b 83 c8 ff e9 f3 01 f9 ff 48 c7 c7 98 1e df c0 e8 3d a8 97 de &lt;0f=
&gt; 0b 80
bb 9f 01 00 00 00 75 05 e9 fb 24 f9 ff 48 8b 83 f8 02 00=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570157] RSP: 0018:ffffaab7c120f730 EFLAGS: 00010246=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570159] RAX: 0000000000000024 RBX: ffff99fb2cd00000 RCX:
0000000000000006=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570160] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff99fb307d64d0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570160] RBP: ffff99fb2cd00000 R08: 000000007ffffffd R09:
0000000000000545=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570161] R10: 000000000000003b R11: ffffaab7c120f5e0 R12:
ffff99fac66601b8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570162] R13: ffff99fac6661d18 R14: ffff99fac66601b8 R15:
ffff99f8ac70c000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570163] FS:  00007f1c1d65d480(0000) GS:ffff99fb307c0000(0000)
knlGS:0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570164] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570165] CR2: 0000565061480000 CR3: 00000003b6916000 CR4:
00000000003406e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570166] Call Trace:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570212]  dcn10_pipe_control_lock.part.0+0x64/0x70 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570253]  dc_stream_set_cursor_attributes+0x11c/0x170 [amdgpu]=20=20=
=20=20=20=20=20=20=20=20=20=20
[47269.570297]  handle_cursor_update.isra.0+0x1f1/0x350 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570341]  amdgpu_dm_commit_cursors.isra.0+0x56/0x70 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570384]  amdgpu_dm_atomic_commit_tail+0x12b9/0x1c50 [amdgpu]=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[47269.570388]  ? enqueue_task_rt+0x9d/0xc0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
[47269.570392]  ? ttm_eu_backoff_reservation+0x3f/0x80 [ttm]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570435]  ? dm_plane_helper_prepare_fb+0x19c/0x2d0 [amdgpu]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570437]  ? _cond_resched+0x10/0x20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[47269.570439]  ? wait_for_completion_timeout+0x31/0x110=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570440]  ? wait_for_completion_interruptible+0x2e/0x140=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570441]  ? complete_all+0x2b/0x40=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[47269.570447]  ? commit_tail+0x37/0x60 [drm_kms_helper]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570451]  commit_tail+0x37/0x60 [drm_kms_helper]=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[47269.570456]  drm_atomic_helper_commit+0x103/0x110 [drm_kms_helper]
[47269.570461]  drm_atomic_helper_update_plane+0xe7/0x100 [drm_kms_helper]
[47269.570470]  drm_mode_cursor_universal+0x127/0x240 [drm]
[47269.570478]  drm_mode_cursor_common+0xd9/0x230 [drm]
[47269.570486]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.570492]  drm_ioctl_kernel+0xa2/0xf0 [drm]
[47269.570499]  drm_ioctl+0x200/0x380 [drm]
[47269.570507]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.570536]  amdgpu_drm_ioctl+0x41/0x70 [amdgpu]
[47269.570539]  do_vfs_ioctl+0x44a/0x6e0
[47269.570541]  ksys_ioctl+0x59/0x90
[47269.570542]  __x64_sys_ioctl+0x11/0x20
[47269.570545]  do_syscall_64+0x4a/0x110
[47269.570547]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[47269.570548] RIP: 0033:0x7f1c1e2a7597
[47269.570550] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d c9 48 0d 00 f7 d8 64 89 01 48
[47269.570551] RSP: 002b:00007fff5dd14a48 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[47269.570552] RAX: ffffffffffffffda RBX: 00007fff5dd14a80 RCX:
00007f1c1e2a7597
[47269.570553] RDX: 00007fff5dd14a80 RSI: 00000000c02464bb RDI:
000000000000000c
[47269.570554] RBP: 00000000c02464bb R08: 0000565061371710 R09:
0000000000003fff
[47269.570554] R10: 000000000000007f R11: 0000000000000246 R12:
0000565060457200
[47269.570555] R13: 000000000000000c R14: 0000000000000004 R15:
0000565060459fa0
[47269.570557] ---[ end trace 0b5db3fd3a295d4e ]---

[47269.571134] ------------[ cut here ]------------
[47269.571195] WARNING: CPU: 7 PID: 1150 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x227 [amdgpu]
[47269.571196] Modules linked in: fuse nf_conntrack_netlink xfrm_user xfrm_=
algo
br_netfilter nf_nat_tftp tun bridge stp llc nft_masq ebtable_nat ip_set
nft_chain_nat ebtable_filter ebtables nft_objref nft_reject_inet nf_reject_=
ipv6
nft_reject nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib xt_MASQUERADE
xt_addrtype nf_tables_set iptable_nat ipt_REJECT nf_reject_i
pv4 xt_conntrack iptable_filter xt_CHECKSUM nf_conntrack_tftp
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_tcpudp iptable_mangle
ip6table_filter ip6table_security ip6table_raw nft_ct ip6table_mangle
ip6table_nat nf_nat nf_conntrack bluetooth nf_tables nf_defrag_ipv6
nf_defrag_ipv4 ip6_tables iptable_security iptable_raw ip_tables nfnetlink
ecdh_generic ecc=20
crc16 x_tables bpfilter amdgpu snd_hda_codec_realtek snd_hda_codec_generic
kvm_amd ledtrig_audio snd_hda_codec_hdmi gpu_sched ttm ccp snd_hda_intel
snd_hda_codec rng_core kvm eeepc_wmi drm_kms_helper snd_hda_core asus_wmi
snd_hwdep snd_pcm sparse_keymap
[47269.571214]  syscopyarea sysfillrect sysimgblt rfkill sp5100_tco wmi_bmof
snd_timer pcspkr irqbypass fb_sys_fops k10temp input_leds drm snd i2c_piix4
led_class soundcore mousedev joydev gpio_amdpt gpio_generic evdev mac_hid
acpi_cpufreq nls_iso8859_1 nls_cp437 vfat fat sch_fq_codel sctp lm92 btrfs =
xor
raid6_pq dm_cache_smq dm_cache dm_persistent_data dm_bio_p
rison dm_bufio libcrc32c crc32c_generic sd_mod usbkbd hid_generic usbmouse
usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel a=
hci
libahci aesni_intel libata igb aes_x86_64 crypto_simd xhci_pci xhci_hcd cry=
ptd
i2c_algo_bit scsi_mod glue_helper dca hwmon wmi pinctrl_amd sunrpc dm_mirror
dm_region_hash dm_log dm_mod
[47269.571236] CPU: 7 PID: 1150 Comm: X Tainted: G        W       T
5.3.1-gentoo #7
[47269.571237] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
B350-F GAMING, BIOS 5216 09/02/2019
[47269.571278] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
27
[amdgpu]
[47269.571279] Code: 83 c8 ff e9 09 02 f9 ff 48 c7 c7 98 1e df c0 e8 53 a8 =
97
de 0f 0b 83 c8 ff e9 f3 01 f9 ff 48 c7 c7 98 1e df c0 e8 3d a8 97 de &lt;0f=
&gt; 0b 80
bb 9f 01 00 00 00 75 05 e9 fb 24 f9 ff 48 8b 83 f8 02 00
[47269.571280] RSP: 0018:ffffaab7c120f750 EFLAGS: 00010246
[47269.571281] RAX: 0000000000000024 RBX: ffff99fb2cd00000 RCX:
0000000000000006
[47269.571282] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff99fb307d64d0
[47269.571283] RBP: ffff99fb21f39800 R08: 000000007ffffffd R09:
000000000000057d
[47269.571284] R10: 000000000000003b R11: ffffaab7c120f600 R12:
ffff99fb2cd00000
[47269.571284] R13: ffff99fac6661d18 R14: ffff99fac66601b8 R15:
ffff99f8ac70c000
[47269.571285] FS:  00007f1c1d65d480(0000) GS:ffff99fb307c0000(0000)
knlGS:0000000000000000
[47269.571286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[47269.571287] CR2: 0000565061480000 CR3: 00000003b6916000 CR4:
00000000003406e0
[47269.571288] Call Trace:
[47269.571331]  dc_stream_set_cursor_attributes+0x11c/0x170 [amdgpu]
[47269.571375]  handle_cursor_update.isra.0+0x1f1/0x350 [amdgpu]
[47269.571418]  amdgpu_dm_commit_cursors.isra.0+0x56/0x70 [amdgpu]
[47269.571461]  amdgpu_dm_atomic_commit_tail+0x12b9/0x1c50 [amdgpu]
[47269.571464]  ? enqueue_task_rt+0x9d/0xc0
[47269.571468]  ? ttm_eu_backoff_reservation+0x3f/0x80 [ttm]
[47269.571510]  ? dm_plane_helper_prepare_fb+0x19c/0x2d0 [amdgpu]
[47269.571512]  ? _cond_resched+0x10/0x20
[47269.571513]  ? wait_for_completion_timeout+0x31/0x110
[47269.571514]  ? wait_for_completion_interruptible+0x2e/0x140
[47269.571516]  ? complete_all+0x2b/0x40
[47269.571521]  ? commit_tail+0x37/0x60 [drm_kms_helper]
[47269.571526]  commit_tail+0x37/0x60 [drm_kms_helper]
[47269.571530]  drm_atomic_helper_commit+0x103/0x110 [drm_kms_helper]
[47269.571535]  drm_atomic_helper_update_plane+0xe7/0x100 [drm_kms_helper]
[47269.571543]  drm_mode_cursor_universal+0x127/0x240 [drm]
[47269.571552]  drm_mode_cursor_common+0xd9/0x230 [drm]
[47269.571559]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.571566]  drm_ioctl_kernel+0xa2/0xf0 [drm]
[47269.571572]  drm_ioctl+0x200/0x380 [drm]
[47269.571580]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[47269.571609]  amdgpu_drm_ioctl+0x41/0x70 [amdgpu]
[47269.571612]  do_vfs_ioctl+0x44a/0x6e0
[47269.571613]  ksys_ioctl+0x59/0x90
[47269.571614]  __x64_sys_ioctl+0x11/0x20
[47269.571616]  do_syscall_64+0x4a/0x110
[47269.571618]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[47269.571619] RIP: 0033:0x7f1c1e2a7597
[47269.571621] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d c9 48 0d 00 f7 d8 64 89 01 48
[47269.571621] RSP: 002b:00007fff5dd14a48 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[47269.571622] RAX: ffffffffffffffda RBX: 00007fff5dd14a80 RCX:
00007f1c1e2a7597
[47269.571623] RDX: 00007fff5dd14a80 RSI: 00000000c02464bb RDI:
000000000000000c
[47269.571624] RBP: 00000000c02464bb R08: 0000565061371710 R09:
0000000000003fff
[47269.571625] R10: 000000000000007f R11: 0000000000000246 R12:
0000565060457200
[47269.571626] R13: 000000000000000c R14: 0000000000000004 R15:
0000565060459fa0
[47269.571627] ---[ end trace 0b5db3fd3a295d4f ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696421650.D2EB.16638--

--===============0677025035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0677025035==--
