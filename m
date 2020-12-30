Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B082E7C54
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 21:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584B4893A8;
	Wed, 30 Dec 2020 20:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67705893A8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 20:53:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2588A20B1F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 20:53:40 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 14CD781645; Wed, 30 Dec 2020 20:53:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Wed, 30 Dec 2020 20:53:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jvdelisle@charter.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210849-2300-l6Op7fPucw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210849

--- Comment #7 from JerryD (jvdelisle@charter.net) ---
[  296.606452] PM: resume devices took 10.437 seconds
[  296.606454] ------------[ cut here ]------------
[  296.606455] Component: resume devices, time: 10437
[  296.606465] WARNING: CPU: 2 PID: 3357 at kernel/power/suspend_test.c:53
suspend_test_finish+0x74/0x80
[  296.606465] Modules linked in: ccm uinput rfcomm nf_conntrack_netlink
xt_CHECKSUM xt_addrtype xt_MASQUERADE xt_conntrack br_netfilter ipt_REJECT
nf_nat_tftp nf_conntrack_tftp tun bridge stp llc nft_objref
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject
nft_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security
ip_set overlay nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter cmac bnep sunrpc vfat fat rtw88_8822be rtw88_8822b edac_mce_amd
kvm_amd rtw88_pci snd_hda_codec_realtek snd_hda_codec_hdmi rtw88_core
snd_hda_codec_generic ledtrig_audio kvm btusb snd_hda_intel btrtl
snd_intel_dspcfg btbcm btintel irqbypass snd_hda_codec uvcvideo rapl mac80211
videobuf2_vmalloc bluetooth hp_wmi snd_hda_core pcspkr
[  296.606504]  videobuf2_memops videobuf2_v4l2 snd_hwdep hid_sensor_accel_3d
wmi_bmof sparse_keymap snd_seq hid_sensor_rotation hid_sensor_magn_3d
videobuf2_common hid_sensor_gyro_3d snd_seq_device hid_sensor_incl_3d
hid_sensor_trigger snd_pcm videodev hid_sensor_iio_common
industrialio_triggered_buffer kfifo_buf ecdh_generic cfg80211 industrialio ecc
joydev snd_timer mc snd k10temp i2c_piix4 soundcore rfkill libarc4 hp_accel
i2c_scmi hp_wireless lis3lv02d acpi_cpufreq zram ip_tables mmc_block amdgpu
hid_sensor_hub hid_multitouch rtsx_pci_sdmmc mmc_core hid_logitech_hidpp
iommu_v2 gpu_sched i2c_algo_bit ttm drm_kms_helper cec crct10dif_pclmul drm
crc32_pclmul ccp crc32c_intel ghash_clmulni_intel serio_raw nvme rtsx_pci
nvme_core wmi video i2c_hid pinctrl_amd hid_logitech_dj fuse
[  296.606537] CPU: 2 PID: 3357 Comm: systemd-sleep Not tainted
5.9.16-200.fc33.x86_64 #1
[  296.606538] Hardware name: HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS
F.21 04/29/2019
[  296.606542] RIP: 0010:suspend_test_finish+0x74/0x80
[  296.606545] Code: e8 03 00 00 29 c1 e8 78 5d 9f 00 41 81 fc 10 27 00 00 77
04 5d 41 5c c3 44 89 e2 48 89 ee 48 c7 c7 c8 80 38 a8 e8 81 03 9f 00 <0f> 0b 5d
41 5c c3 cc cc cc cc cc cc 0f 1f 44 00 00 0f b6 05 58 d9
[  296.606546] RSP: 0018:ffffbdf382e8fdd8 EFLAGS: 00010296
[  296.606548] RAX: 0000000000000026 RBX: 0000000000000001 RCX:
ffff975857298d08
[  296.606549] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI:
ffff975857298d00
[  296.606550] RBP: ffffffffa8388011 R08: 000000450f1f561c R09:
ffffffffa9404be4
[  296.606551] R10: 000000000000058a R11: 0000000000021ee0 R12:
00000000000028c5
[  296.606552] R13: 0000000000000000 R14: ffffbdf382e8fe08 R15:
0000000000000000
[  296.606554] FS:  00007f1e3fd5f000(0000) GS:ffff975857280000(0000)
knlGS:0000000000000000
[  296.606555] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  296.606556] CR2: 00005584bb97e928 CR3: 000000018e8f6000 CR4:
00000000003506e0
[  296.606557] Call Trace:
[  296.606564]  suspend_devices_and_enter+0x1a2/0x7f0
[  296.606569]  pm_suspend.cold+0x329/0x374
[  296.606572]  state_store+0x71/0xd0
[  296.606577]  kernfs_fop_write+0xce/0x1b0
[  296.606581]  vfs_write+0xc7/0x210
[  296.606584]  ksys_write+0x4f/0xc0
[  296.606587]  do_syscall_64+0x33/0x40
[  296.606591]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  296.606593] RIP: 0033:0x7f1e40d26297
[  296.606597] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00
f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  296.606598] RSP: 002b:00007ffe985f7fa8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[  296.606600] RAX: ffffffffffffffda RBX: 0000000000000007 RCX:
00007f1e40d26297
[  296.606601] RDX: 0000000000000007 RSI: 00005584bb97d920 RDI:
0000000000000004
[  296.606601] RBP: 00005584bb97d920 R08: 0000000000000001 R09:
00007f1e40df8a60
[  296.606602] R10: 0000000000000070 R11: 0000000000000246 R12:
0000000000000007
[  296.606603] R13: 00005584bb978650 R14: 0000000000000007 R15:
00007f1e40df9720
[  296.606605] ---[ end trace 6fa811f71ae3a8ac ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
