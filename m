Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73574B258D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24810EB1C;
	Fri, 11 Feb 2022 12:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7C310EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:23:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFFCE61CBA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B23A0C34117
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644582235;
 bh=ljs6Z2oS/zHzzucj2KexWQnMVsoHRNIHQ8YPE+1+DCc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dRLODGbOLNj+sSsU0vDYFUdYdUnNXX6mz2RVhb3eJ0N9H5G5Xbgh/87kntRE5IUkh
 W4xAEfyzHUcCvUp4M7NS82zjfDgC7NY1rymzYfx8vtjL3CBxZ0sgSJhMRKQP2jzpyv
 gkDEF392e3JldrQUunIp7ubIPzpqrI/eYzxz658MqXkxRfTJG003VwLB2GoJjWqBso
 eG26vlzCjGZRJoU2ydFydmlbNqOn4w9NAznjD7vGG5Uf5d43BZZexfNPgI1NIJMzNG
 HtJy80aiEmCJikaDujFuMSQKaPpgMhy3jXhvguh9EwOTVeDM9Rre9DKdbxisR6SBk0
 sjPqxiD8ElOZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A2BA2C05FD0; Fri, 11 Feb 2022 12:23:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Fri, 11 Feb 2022 12:23:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: inferrna@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-EG8vVTASku@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Ilia (inferrna@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |inferrna@gmail.com

--- Comment #65 from Ilia (inferrna@gmail.com) ---
I have same bug with firefox (happened once a day, starting about a week ag=
o)

[ 4409.071226] BUG: unable to handle page fault for address: ffffffffffffff=
f8
[ 4409.071234] #PF: supervisor read access in kernel mode
[ 4409.071235] #PF: error_code(0x0000) - not-present page
[ 4409.071237] PGD 427e12067 P4D 427e12067 PUD 427e14067 PMD 0=20
[ 4409.071240] Oops: 0000 [#1] PREEMPT SMP NOPTI
[ 4409.071242] CPU: 18 PID: 191 Comm: uvd Tainted: G           OE=20=20=20=
=20
5.16.8uksm #1
[ 4409.071245] Hardware name: Hewlett-Packard HP Z420 Workstation/1589, BIOS
J61 v03.96 10/29/2019
[ 4409.071246] RIP: 0010:swake_up_locked+0x17/0x40
[ 4409.071251] Code: ff ff ff eb ad 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f =
00
0f 1f 44 00 00 48 8b 57 08 48 8d 47 08 48 39 c2 74 25 53 48 8b 5f 08 <48> 8=
b 7b
f8 e8 80 7f fe ff 48 8b 13 48 8b 43 08 48 89 42 08 48 89
[ 4409.071253] RSP: 0018:ffffbbdf012b7e70 EFLAGS: 00010007
[ 4409.071254] RAX: ffff9719549270b0 RBX: 0000000000000000 RCX:
0000000000000000
[ 4409.071256] RDX: 0000000000000000 RSI: ffff97185d547250 RDI:
ffff9719549270a8
[ 4409.071257] RBP: ffff9719549270a8 R08: ffff9716473efec0 R09:
ffff9716473efed8
[ 4409.071258] R10: ffff971646cc3000 R11: ffff971646cc3000 R12:
0000000000000286
[ 4409.071259] R13: ffff9716473eebe0 R14: ffff9716ee901bc0 R15:
ffff9719549270a0
[ 4409.071260] FS:  0000000000000000(0000) GS:ffff97213fc80000(0000)
knlGS:0000000000000000
[ 4409.071262] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4409.071263] CR2: fffffffffffffff8 CR3: 0000000427e10006 CR4:
00000000001706e0
[ 4409.071264] Call Trace:
[ 4409.071267]  <TASK>
[ 4409.071269]  complete+0x2f/0x40
[ 4409.071271]  drm_sched_main+0x24b/0x450
[ 4409.071274]  ? wait_woken+0x70/0x70
[ 4409.071289]  ? drm_sched_job_done.isra.0+0x130/0x130
[ 4409.071290]  kthread+0x169/0x190
[ 4409.071294]  ? set_kthread_struct+0x40/0x40
[ 4409.071297]  ret_from_fork+0x1f/0x30
[ 4409.071301]  </TASK>
[ 4409.071302] Modules linked in: xt_conntrack nfnetlink xfrm_user xfrm_algo
xt_addrtype br_netfilter cmac rfcomm vboxnetadp(OE) vboxnetflt(OE)
iptable_mangle xt_CHECKSUM xt_tcpudp iptable_nat xt_comment xt_MASQUERADE
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc overlay
iptable_filter vboxdrv(OE) bnep cpufreq_powersave zram binfmt_misc squashfs
snd_emu10k1_synth snd_hda_codec_realtek snd_emux_synth snd_seq_midi_emul
snd_seq_virmidi snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel intel_rapl_msr snd_intel_dspcfg intel_rapl_common snd_emu10k1
snd_hda_codec snd_util_mem snd_ac97_codec snd_hda_core nls_iso8859_1 hp_wmi
nls_cp866 ac97_bus platform_profile sparse_keymap snd_hwdep wmi_bmof btusb
snd_pcm sb_edac btrtl x86_pkg_temp_thermal intel_powerclamp snd_seq_midi bt=
bcm
snd_seq_midi_event btintel snd_rawmidi kvm_intel bluetooth input_leds snd_s=
eq
kvm ecdh_generic snd_seq_device snd_timer irqbypass emu10k1_gp serio_raw snd
gameport ioatdma soundcore dca
[ 4409.071342]  wmi mac_hid xpad ff_memless coretemp mei_me mei hwmon_vid
i5500_temp msr ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq
zstd_compress libcrc32c hid_logitech_hidpp hid_logitech_dj hid_generic usbh=
id
hid crc32_pclmul ghash_clmulni_intel aesni_intel e1000e psmouse crypto_simd
cryptd ahci i2c_i801 libahci lpc_ich i2c_smbus [last unloaded: cpuid]
[ 4409.071362] CR2: fffffffffffffff8
[ 4409.071364] ---[ end trace a6d18badbe55bb92 ]---
[ 4409.071365] RIP: 0010:swake_up_locked+0x17/0x40
[ 4409.071367] Code: ff ff ff eb ad 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f =
00
0f 1f 44 00 00 48 8b 57 08 48 8d 47 08 48 39 c2 74 25 53 48 8b 5f 08 <48> 8=
b 7b
f8 e8 80 7f fe ff 48 8b 13 48 8b 43 08 48 89 42 08 48 89
[ 4409.071368] RSP: 0018:ffffbbdf012b7e70 EFLAGS: 00010007
[ 4409.071370] RAX: ffff9719549270b0 RBX: 0000000000000000 RCX:
0000000000000000
[ 4409.071371] RDX: 0000000000000000 RSI: ffff97185d547250 RDI:
ffff9719549270a8
[ 4409.071372] RBP: ffff9719549270a8 R08: ffff9716473efec0 R09:
ffff9716473efed8
[ 4409.071373] R10: ffff971646cc3000 R11: ffff971646cc3000 R12:
0000000000000286
[ 4409.071374] R13: ffff9716473eebe0 R14: ffff9716ee901bc0 R15:
ffff9719549270a0
[ 4409.071375] FS:  0000000000000000(0000) GS:ffff97213fc80000(0000)
knlGS:0000000000000000
[ 4409.071377] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4409.071378] CR2: fffffffffffffff8 CR3: 0000000427e10006 CR4:
00000000001706e0
[ 4409.071379] note: uvd[191] exited with preempt_count 1
[ 4419.193226] [drm:amdgpu_job_timedout] *ERROR* ring uvd timeout, signaled
seq=3D14, emitted seq=3D14
[ 4419.193237] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss
RDD Process pid 37880 thread firefox:cs0 pid 46445
[ 4419.193242] amdgpu 0000:05:00.0: amdgpu: GPU reset begin!
[ 4419.193305] ------------[ cut here ]------------
[ 4419.193307] WARNING: CPU: 18 PID: 45938 at kernel/kthread.c:596
kthread_park+0x6d/0x90
[ 4419.193312] Modules linked in: xt_conntrack nfnetlink xfrm_user xfrm_algo
xt_addrtype br_netfilter cmac rfcomm vboxnetadp(OE) vboxnetflt(OE)
iptable_mangle xt_CHECKSUM xt_tcpudp iptable_nat xt_comment xt_MASQUERADE
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc overlay
iptable_filter vboxdrv(OE) bnep cpufreq_powersave zram binfmt_misc squashfs
snd_emu10k1_synth snd_hda_codec_realtek snd_emux_synth snd_seq_midi_emul
snd_seq_virmidi snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel intel_rapl_msr snd_intel_dspcfg intel_rapl_common snd_emu10k1
snd_hda_codec snd_util_mem snd_ac97_codec snd_hda_core nls_iso8859_1 hp_wmi
nls_cp866 ac97_bus platform_profile sparse_keymap snd_hwdep wmi_bmof btusb
snd_pcm sb_edac btrtl x86_pkg_temp_thermal intel_powerclamp snd_seq_midi bt=
bcm
snd_seq_midi_event btintel snd_rawmidi kvm_intel bluetooth input_leds snd_s=
eq
kvm ecdh_generic snd_seq_device snd_timer irqbypass emu10k1_gp serio_raw snd
gameport ioatdma soundcore dca
[ 4419.193358]  wmi mac_hid xpad ff_memless coretemp mei_me mei hwmon_vid
i5500_temp msr ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq
zstd_compress libcrc32c hid_logitech_hidpp hid_logitech_dj hid_generic usbh=
id
hid crc32_pclmul ghash_clmulni_intel aesni_intel e1000e psmouse crypto_simd
cryptd ahci i2c_i801 libahci lpc_ich i2c_smbus [last unloaded: cpuid]
[ 4419.193380] CPU: 18 PID: 45938 Comm: kworker/18:1 Tainted: G      D    O=
E=20=20=20
 5.16.8uksm #1
[ 4419.193383] Hardware name: Hewlett-Packard HP Z420 Workstation/1589, BIOS
J61 v03.96 10/29/2019
[ 4419.193384] Workqueue: events drm_sched_job_timedout
[ 4419.193388] RIP: 0010:kthread_park+0x6d/0x90
[ 4419.193391] Code: 20 e8 a7 50 dd 00 be 40 00 00 00 48 89 ef e8 7a 1d 01 =
00
48 85 c0 74 25 31 c0 5b 5d c3 0f 0b a8 04 48 8b 9d a0 05 00 00 74 b2 <0f> 0=
b b8
da ff ff ff 5b 5d c3 0f 0b b8 f0 ff ff ff eb dd 0f 0b eb
[ 4419.193394] RSP: 0018:ffffbbdf30497d10 EFLAGS: 00010202
[ 4419.193396] RAX: 000000000020804c RBX: ffff97164124c780 RCX:
0000000000000001
[ 4419.193397] RDX: 0000000000000000 RSI: ffff97185d547000 RDI:
ffff971646e38000
[ 4419.193399] RBP: ffff971646e38000 R08: 0000000000000000 R09:
ffff97213fcaab70
[ 4419.193400] R10: ffff971646e3c1e8 R11: ffff971646e3c1d8 R12:
ffff9716473eea68
[ 4419.193401] R13: 0000000000000060 R14: ffff971642540000 R15:
ffff9716473eebd0
[ 4419.193403] FS:  0000000000000000(0000) GS:ffff97213fc80000(0000)
knlGS:0000000000000000
[ 4419.193404] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4419.193406] CR2: 00007fad273687f0 CR3: 0000000427e10002 CR4:
00000000001706e0
[ 4419.193408] Call Trace:
[ 4419.193410]  <TASK>
[ 4419.193413]  drm_sched_stop+0x31/0x160
[ 4419.193416]  amdgpu_device_gpu_recover.cold+0xa34/0xa6c
[ 4419.193422]  amdgpu_job_timedout+0x145/0x170
[ 4419.193425]  drm_sched_job_timedout+0x63/0x100
[ 4419.193427]  process_one_work+0x1d8/0x3b0
[ 4419.193430]  worker_thread+0x4d/0x3d0
[ 4419.193431]  ? rescuer_thread+0x360/0x360
[ 4419.193433]  kthread+0x169/0x190
[ 4419.193436]  ? set_kthread_struct+0x40/0x40
[ 4419.193439]  ret_from_fork+0x1f/0x30
[ 4419.193444]  </TASK>
[ 4419.193445] ---[ end trace a6d18badbe55bb93 ]---

Also no problem with 3d-games.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
