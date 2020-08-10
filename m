Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E72413F2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 01:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8565D6E487;
	Mon, 10 Aug 2020 23:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F156E487
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 23:49:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 10 Aug 2020 23:49:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: randyk161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-5d8wzM8QOE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201957

Randy (randyk161@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |randyk161@gmail.com

--- Comment #35 from Randy (randyk161@gmail.com) ---
I've been getting "ring gfx timeouts" for some time, most of the time it's when
the computer has not had any input for a while (while I'm away from it).  When
it freezes I can SSH into it but when I try to do a: "shutdown -h now" it boots
me out of SSH as it should but the computer never seems to actually shutdown. 
The screen stays frozen with whatever was on the display when it froze.  Any
help would be greatly appreciated, here is my info:

Mobo: AsRock AB350 Pro4 UEFI: 5.80
Video card: Sapphire Nitro+ RX580 (8GB)
Distro: Manjaro
Kernel: 5.7.9-1-MANJARO

Aug 09 21:33:06.054857 kernel: pcieport 0000:00:03.1: AER: Multiple Uncorrected
(Non-Fatal) error received: 0000:00:00.0
Aug 09 21:33:06.068305 kernel: pcieport 0000:00:03.1: AER: PCIe Bus Error:
severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
Aug 09 21:33:06.068636 kernel: pcieport 0000:00:03.1: AER:   device [1022:1453]
error status/mask=00200000/00000000
Aug 09 21:33:06.068863 kernel: pcieport 0000:00:03.1: AER:    [21] ACSViol     
          (First)
Aug 09 21:33:06.069137 kernel: amdgpu 0000:0a:00.0: AER: can't recover (no
error_detected callback)
Aug 09 21:33:06.069421 kernel: snd_hda_intel 0000:0a:00.1: AER: can't recover
(no error_detected callback)
Aug 09 21:33:06.069633 kernel: pcieport 0000:00:03.1: AER: device recovery
failed
Aug 09 21:33:16.258283 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
sdma0 timeout, signaled seq=9087, emitted seq=9089
Aug 09 21:33:16.258412 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Aug 09 21:33:16.258446 kernel: amdgpu 0000:0a:00.0: GPU reset begin!
Aug 09 21:33:16.258741 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx timeout, but soft recovered
Aug 09 21:33:16.258773 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.258803 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.258835 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.258869 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.258896 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.258925 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.258951 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.258977 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259009 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259035 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259060 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259084 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259108 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259131 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259156 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259186 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259213 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259242 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259272 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259298 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259324 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259350 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259373 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259400 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259426 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259456 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259483 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259509 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259540 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259566 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259592 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259617 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259642 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259671 kernel: amdgpu: [powerplay] 
                                failed to send message 261 ret is 65535 
Aug 09 21:33:16.259697 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259723 kernel: amdgpu: [powerplay] 
                                failed to send message 306 ret is 65535 
Aug 09 21:33:16.259754 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259785 kernel: amdgpu: [powerplay] 
                                failed to send message 5e ret is 65535 
Aug 09 21:33:16.259816 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259860 kernel: amdgpu: [powerplay] 
                                failed to send message 145 ret is 65535 
Aug 09 21:33:16.259913 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.259947 kernel: amdgpu: [powerplay] 
                                failed to send message 146 ret is 65535 
Aug 09 21:33:16.259976 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.260003 kernel: amdgpu: [powerplay] 
                                failed to send message 148 ret is 65535 
Aug 09 21:33:16.260034 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.260061 kernel: amdgpu: [powerplay] 
                                failed to send message 145 ret is 65535 
Aug 09 21:33:16.260088 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:16.260114 kernel: amdgpu: [powerplay] 
                                failed to send message 146 ret is 65535 
Aug 09 21:33:16.291929 kernel: [drm] REG_WAIT timeout 10us * 3000 tries -
dce110_stream_encoder_dp_blank line:955
Aug 09 21:33:16.292012 kernel: ------------[ cut here ]------------
Aug 09 21:33:16.292044 kernel: WARNING: CPU: 3 PID: 154 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:526
generic_reg_wait.cold+0x26/0x2d [amdgpu]
Aug 09 21:33:16.292070 kernel: Modules linked in: snd_seq_dummy snd_hrtimer
snd_seq fuse nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw
iptable_security nfnetlink ip6table_filter ip6_tables iptable_filter squashfs
loop nls_iso8859_1 nls_cp437 vfat fat uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev
snd_usbmidi_lib snd_rawmidi snd_seq_device mc joydev mousedev input_leds
wmi_bmof amdgpu snd_hda_codec_realtek snd_hda_codec_generic wl(POE)
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel gpu_sched i2c_algo_bit
edac_mce_amd snd_intel_dspcfg ttm snd_hda_codec kvm_amd drm_kms_helper r8169
snd_hda_core kvm cfg80211 snd_hwdep snd_pcm cec realtek irqbypass rc_core
snd_timer libphy syscopyarea snd rfkill sysfillrect k10temp
Aug 09 21:33:16.292112 kernel:  pcspkr sysimgblt sp5100_tco i2c_piix4
fb_sys_fops soundcore wmi evdev mac_hid gpio_amdpt pinctrl_amd acpi_cpufreq drm
uinput sg crypto_user agpgart ip_tables x_tables ext4 crc32c_generic crc16
mbcache jbd2 dm_crypt dm_mod uas usb_storage hid_logitech ff_memless
hid_generic usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper ccp xhci_pci
mpt3sas rng_core xhci_hcd raid_class scsi_transport_sas
Aug 09 21:33:16.292141 kernel: CPU: 3 PID: 154 Comm: kworker/3:1 Tainted: P    
      OE     5.7.9-1-MANJARO #1
Aug 09 21:33:16.292164 kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./AB350 Pro4, BIOS P5.80 06/14/2019
Aug 09 21:33:16.292188 kernel: Workqueue: events drm_sched_job_timedout
[gpu_sched]
Aug 09 21:33:16.292213 kernel: RIP: 0010:generic_reg_wait.cold+0x26/0x2d
[amdgpu]
Aug 09 21:33:16.292240 kernel: Code: a7 41 fd ff 44 8b 44 24 24 48 8b 4c 24 18
89 ee 48 c7 c7 08 14 cd c1 8b 54 24 20 e8 7a 91 d2 f9 83 7b 20 01 0f 84 c3 52
fd ff <0f> 0b e9 bc 52 fd ff 48 c7 c7 fd 4c c8 c1 e8 f3 c2 12 fa e8 4a 29
Aug 09 21:33:16.292263 kernel: RSP: 0018:ffffab9b806c3610 EFLAGS: 00010297
Aug 09 21:33:16.292284 kernel: RAX: 0000000000000052 RBX: ffff92334ad7fa40 RCX:
0000000000000000
Aug 09 21:33:16.292306 kernel: RDX: 0000000000000000 RSI: ffff92334e8d9ac8 RDI:
00000000ffffffff
Aug 09 21:33:16.292335 kernel: RBP: 000000000000000a R08: 0000000000000561 R09:
0000000000000001
Aug 09 21:33:16.292356 kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000000
Aug 09 21:33:16.292376 kernel: R13: 0000000000010000 R14: 0000000000004ea4 R15:
0000000000000bb9
Aug 09 21:33:16.292398 kernel: FS:  0000000000000000(0000)
GS:ffff92334e8c0000(0000) knlGS:0000000000000000
Aug 09 21:33:16.292421 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 09 21:33:16.292446 kernel: CR2: 00007f494fc04000 CR3: 00000003af1ce000 CR4:
00000000003406e0
Aug 09 21:33:16.292466 kernel: Call Trace:
Aug 09 21:33:16.292485 kernel:  dce110_stream_encoder_dp_blank+0xea/0x140
[amdgpu]
Aug 09 21:33:16.292507 kernel:  core_link_disable_stream+0x9c/0x200 [amdgpu]
Aug 09 21:33:16.292525 kernel:  dce110_reset_hw_ctx_wrap+0xbe/0x240 [amdgpu]
Aug 09 21:33:16.292543 kernel:  dce110_apply_ctx_to_hw+0x4f/0x570 [amdgpu]
Aug 09 21:33:16.292560 kernel:  ? hwmgr_handle_task+0x98/0xf0 [amdgpu]
Aug 09 21:33:16.292578 kernel:  ? pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
Aug 09 21:33:16.292598 kernel:  ? dm_pp_apply_display_requirements+0x19e/0x1c0
[amdgpu]
Aug 09 21:33:16.292619 kernel:  dc_commit_state+0x323/0x970 [amdgpu]
Aug 09 21:33:16.292640 kernel:  amdgpu_dm_atomic_commit_tail+0x38c/0x2310
[amdgpu]
Aug 09 21:33:16.292662 kernel:  ? free_one_page+0x57/0xd0
Aug 09 21:33:16.292680 kernel:  ? kfree+0x219/0x250
Aug 09 21:33:16.292698 kernel:  ? bw_calcs+0xa30/0x4380 [amdgpu]
Aug 09 21:33:16.292718 kernel:  ? dc_validate_global_state+0x2f2/0x390 [amdgpu]
Aug 09 21:33:16.292736 kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Aug 09 21:33:16.292757 kernel:  drm_atomic_helper_commit+0x113/0x140
[drm_kms_helper]
Aug 09 21:33:16.292776 kernel:  drm_atomic_helper_disable_all+0x175/0x190
[drm_kms_helper]
Aug 09 21:33:16.292792 kernel:  drm_atomic_helper_suspend+0x78/0x150
[drm_kms_helper]
Aug 09 21:33:16.292810 kernel:  dm_suspend+0x1c/0x60 [amdgpu]
Aug 09 21:33:16.292869 kernel:  amdgpu_device_ip_suspend_phase1+0x83/0xe0
[amdgpu]
Aug 09 21:33:16.292889 kernel:  ? _raw_spin_lock+0x13/0x30
Aug 09 21:33:16.292908 kernel:  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
Aug 09 21:33:16.292926 kernel:  amdgpu_device_pre_asic_reset+0x16b/0x182
[amdgpu]
Aug 09 21:33:16.292944 kernel:  amdgpu_device_gpu_recover.cold+0x42a/0xc74
[amdgpu]
Aug 09 21:33:16.292962 kernel:  amdgpu_job_timedout+0x105/0x130 [amdgpu]
Aug 09 21:33:16.292981 kernel:  drm_sched_job_timedout+0x64/0xe0 [gpu_sched]
Aug 09 21:33:16.293001 kernel:  process_one_work+0x1da/0x3d0
Aug 09 21:33:16.293017 kernel:  worker_thread+0x4d/0x3e0
Aug 09 21:33:16.293036 kernel:  ? rescuer_thread+0x3f0/0x3f0
Aug 09 21:33:16.293057 kernel:  kthread+0x13e/0x160
Aug 09 21:33:16.293074 kernel:  ? __kthread_bind_mask+0x60/0x60
Aug 09 21:33:16.293097 kernel:  ret_from_fork+0x22/0x40
Aug 09 21:33:16.293123 kernel: ---[ end trace aa4b924a702f7188 ]---
Aug 09 21:33:26.298272 kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios
stuck in loop for more than 10secs aborting
Aug 09 21:33:26.298425 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing DB6E (len 824, WS 0, PS 0) @ 0xDCEE
Aug 09 21:33:26.298470 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing DA28 (len 326, WS 0, PS 0) @ 0xDB18
Aug 09 21:33:26.298505 kernel: [drm:dce110_link_encoder_disable_output
[amdgpu]] *ERROR* dce110_link_encoder_disable_output: Failed to execute VBIOS
command table!
Aug 09 21:33:26.298535 kernel: ------------[ cut here ]------------
Aug 09 21:33:26.298571 kernel: WARNING: CPU: 3 PID: 154 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:1099
dce110_link_encoder_disable_output+0x141/0x150 [amdgpu]
Aug 09 21:33:26.298607 kernel: Modules linked in: snd_seq_dummy snd_hrtimer
snd_seq fuse nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw
iptable_security nfnetlink ip6table_filter ip6_tables iptable_filter squashfs
loop nls_iso8859_1 nls_cp437 vfat fat uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev
snd_usbmidi_lib snd_rawmidi snd_seq_device mc joydev mousedev input_leds
wmi_bmof amdgpu snd_hda_codec_realtek snd_hda_codec_generic wl(POE)
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel gpu_sched i2c_algo_bit
edac_mce_amd snd_intel_dspcfg ttm snd_hda_codec kvm_amd drm_kms_helper r8169
snd_hda_core kvm cfg80211 snd_hwdep snd_pcm cec realtek irqbypass rc_core
snd_timer libphy syscopyarea snd rfkill sysfillrect k10temp
Aug 09 21:33:26.298656 kernel:  pcspkr sysimgblt sp5100_tco i2c_piix4
fb_sys_fops soundcore wmi evdev mac_hid gpio_amdpt pinctrl_amd acpi_cpufreq drm
uinput sg crypto_user agpgart ip_tables x_tables ext4 crc32c_generic crc16
mbcache jbd2 dm_crypt dm_mod uas usb_storage hid_logitech ff_memless
hid_generic usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper ccp xhci_pci
mpt3sas rng_core xhci_hcd raid_class scsi_transport_sas
Aug 09 21:33:26.298691 kernel: CPU: 3 PID: 154 Comm: kworker/3:1 Tainted: P    
   W  OE     5.7.9-1-MANJARO #1
Aug 09 21:33:26.298722 kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./AB350 Pro4, BIOS P5.80 06/14/2019
Aug 09 21:33:26.298753 kernel: Workqueue: events drm_sched_job_timedout
[gpu_sched]
Aug 09 21:33:26.298783 kernel: RIP:
0010:dce110_link_encoder_disable_output+0x141/0x150 [amdgpu]
Aug 09 21:33:26.298811 kernel: Code: 44 24 38 65 48 2b 04 25 28 00 00 00 75 20
48 83 c4 40 5b 5d 41 5c c3 48 c7 c6 60 4a c4 c1 48 c7 c7 30 f2 cb c1 e8 4f 2c
bd fe <0f> 0b eb d0 e8 76 01 db f9 66 0f 1f 44 00 00 0f 1f 44 00 00 41 57
Aug 09 21:33:26.298840 kernel: RSP: 0018:ffffab9b806c3600 EFLAGS: 00010246
Aug 09 21:33:26.298865 kernel: RAX: 0000000000000000 RBX: 0000000000000020 RCX:
0000000000000000
Aug 09 21:33:26.298896 kernel: RDX: 0000000000000000 RSI: 0000000000000086 RDI:
00000000ffffffff
Aug 09 21:33:26.298926 kernel: RBP: ffff923349574720 R08: 0000000000000598 R09:
0000000000000001
Aug 09 21:33:26.298954 kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffffab9b806c3604
Aug 09 21:33:26.298979 kernel: R13: 0000000000000000 R14: ffff923251500000 R15:
ffff92334c016900
Aug 09 21:33:26.299004 kernel: FS:  0000000000000000(0000)
GS:ffff92334e8c0000(0000) knlGS:0000000000000000
Aug 09 21:33:26.299032 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 09 21:33:26.299059 kernel: CR2: 00007f494fc04000 CR3: 000000038dd62000 CR4:
00000000003406e0
Aug 09 21:33:26.299087 kernel: Call Trace:
Aug 09 21:33:26.299111 kernel:  dp_disable_link_phy+0x83/0x150 [amdgpu]
Aug 09 21:33:26.299142 kernel:  disable_link+0x4f/0xa0 [amdgpu]
Aug 09 21:33:26.299170 kernel:  core_link_disable_stream+0xd6/0x200 [amdgpu]
Aug 09 21:33:26.299203 kernel:  dce110_reset_hw_ctx_wrap+0xbe/0x240 [amdgpu]
Aug 09 21:33:26.299231 kernel:  dce110_apply_ctx_to_hw+0x4f/0x570 [amdgpu]
Aug 09 21:33:26.299258 kernel:  ? hwmgr_handle_task+0x98/0xf0 [amdgpu]
Aug 09 21:33:26.299283 kernel:  ? pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
Aug 09 21:33:26.299309 kernel:  ? dm_pp_apply_display_requirements+0x19e/0x1c0
[amdgpu]
Aug 09 21:33:26.299361 kernel:  dc_commit_state+0x323/0x970 [amdgpu]
Aug 09 21:33:26.299392 kernel:  amdgpu_dm_atomic_commit_tail+0x38c/0x2310
[amdgpu]
Aug 09 21:33:26.299421 kernel:  ? free_one_page+0x57/0xd0
Aug 09 21:33:26.299448 kernel:  ? kfree+0x219/0x250
Aug 09 21:33:26.299476 kernel:  ? bw_calcs+0xa30/0x4380 [amdgpu]
Aug 09 21:33:26.299502 kernel:  ? dc_validate_global_state+0x2f2/0x390 [amdgpu]
Aug 09 21:33:26.299532 kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Aug 09 21:33:26.299555 kernel:  drm_atomic_helper_commit+0x113/0x140
[drm_kms_helper]
Aug 09 21:33:26.299581 kernel:  drm_atomic_helper_disable_all+0x175/0x190
[drm_kms_helper]
Aug 09 21:33:26.299606 kernel:  drm_atomic_helper_suspend+0x78/0x150
[drm_kms_helper]
Aug 09 21:33:26.299633 kernel:  dm_suspend+0x1c/0x60 [amdgpu]
Aug 09 21:33:26.299660 kernel:  amdgpu_device_ip_suspend_phase1+0x83/0xe0
[amdgpu]
Aug 09 21:33:26.299685 kernel:  ? _raw_spin_lock+0x13/0x30
Aug 09 21:33:26.299710 kernel:  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
Aug 09 21:33:26.299736 kernel:  amdgpu_device_pre_asic_reset+0x16b/0x182
[amdgpu]
Aug 09 21:33:26.299761 kernel:  amdgpu_device_gpu_recover.cold+0x42a/0xc74
[amdgpu]
Aug 09 21:33:26.299787 kernel:  amdgpu_job_timedout+0x105/0x130 [amdgpu]
Aug 09 21:33:26.299818 kernel:  drm_sched_job_timedout+0x64/0xe0 [gpu_sched]
Aug 09 21:33:26.299844 kernel:  process_one_work+0x1da/0x3d0
Aug 09 21:33:26.299872 kernel:  worker_thread+0x4d/0x3e0
Aug 09 21:33:26.299898 kernel:  ? rescuer_thread+0x3f0/0x3f0
Aug 09 21:33:26.299925 kernel:  kthread+0x13e/0x160
Aug 09 21:33:26.299951 kernel:  ? __kthread_bind_mask+0x60/0x60
Aug 09 21:33:26.299979 kernel:  ret_from_fork+0x22/0x40
Aug 09 21:33:26.300004 kernel: ---[ end trace aa4b924a702f7189 ]---
Aug 09 21:33:36.301609 kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios
stuck in loop for more than 10secs aborting
Aug 09 21:33:36.301729 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing C51A (len 62, WS 0, PS 0) @ 0xC536
Aug 09 21:33:36.334815 kernel: [drm] REG_WAIT timeout 10us * 3000 tries -
dce110_stream_encoder_dp_blank line:955
Aug 09 21:33:46.338270 kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios
stuck in loop for more than 10secs aborting
Aug 09 21:33:46.338400 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing DB6E (len 824, WS 0, PS 0) @ 0xDCEE
Aug 09 21:33:46.338434 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing DA28 (len 326, WS 0, PS 0) @ 0xDB18
Aug 09 21:33:46.338466 kernel: [drm:dce110_link_encoder_disable_output
[amdgpu]] *ERROR* dce110_link_encoder_disable_output: Failed to execute VBIOS
command table!
Aug 09 21:33:56.339196 plasmashell[1403]:
qrc:/plasma/plasmoids/org.kde.plasma.volume/contents/ui/ListItemBase.qml:151:
TypeError: Cannot read property 'ports' of undefined
Aug 09 21:33:56.346378 kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios
stuck in loop for more than 10secs aborting
Aug 09 21:33:56.346481 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing C51A (len 62, WS 0, PS 0) @ 0xC536
Aug 09 21:33:56.346519 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:56.346572 kernel: amdgpu: [powerplay] 
                                failed to send message 148 ret is 65535 
Aug 09 21:33:56.346606 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:56.346632 kernel: amdgpu: [powerplay] 
                                failed to send message 145 ret is 65535 
Aug 09 21:33:56.346659 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:56.346692 kernel: amdgpu: [powerplay] 
                                failed to send message 146 ret is 65535 
Aug 09 21:33:56.345571 plasmashell[1403]:
qrc:/plasma/plasmoids/org.kde.plasma.volume/contents/ui/main.qml:550:39: QML
DeviceListItem: Binding loop detected for property "width"
Aug 09 21:33:56.591481 kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]]
*ERROR* suspend of IP block <vce_v3_0> failed -110
Aug 09 21:33:57.054823 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.054914 kernel: amdgpu: [powerplay] 
                                failed to send message 133 ret is 65535 
Aug 09 21:33:57.054952 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.054971 kernel: amdgpu: [powerplay] 
                                failed to send message 306 ret is 65535 
Aug 09 21:33:57.054990 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055010 kernel: amdgpu: [powerplay] 
                                failed to send message 5e ret is 65535 
Aug 09 21:33:57.055027 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055047 kernel: amdgpu: [powerplay] 
                                failed to send message 145 ret is 65535 
Aug 09 21:33:57.055064 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055080 kernel: amdgpu: [powerplay] 
                                failed to send message 146 ret is 65535 
Aug 09 21:33:57.055097 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055113 kernel: amdgpu: [powerplay] 
                                failed to send message 148 ret is 65535 
Aug 09 21:33:57.055134 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055151 kernel: amdgpu: [powerplay] 
                                failed to send message 145 ret is 65535 
Aug 09 21:33:57.055165 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055180 kernel: amdgpu: [powerplay] 
                                failed to send message 146 ret is 65535 
Aug 09 21:33:57.055195 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055208 kernel: amdgpu: [powerplay] 
                                failed to send message 16a ret is 65535 
Aug 09 21:33:57.055225 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055238 kernel: amdgpu: [powerplay] 
                                failed to send message 186 ret is 65535 
Aug 09 21:33:57.055253 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.055267 kernel: amdgpu: [powerplay] 
                                failed to send message 54 ret is 65535 
Aug 09 21:33:57.558146 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558240 kernel: amdgpu: [powerplay] 
                                failed to send message 26b ret is 65535 
Aug 09 21:33:57.558260 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558279 kernel: amdgpu: [powerplay] 
                                failed to send message 13d ret is 65535 
Aug 09 21:33:57.558297 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558313 kernel: amdgpu: [powerplay] 
                                failed to send message 14f ret is 65535 
Aug 09 21:33:57.558329 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558342 kernel: amdgpu: [powerplay] 
                                failed to send message 151 ret is 65535 
Aug 09 21:33:57.558356 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558369 kernel: amdgpu: [powerplay] 
                                failed to send message 135 ret is 65535 
Aug 09 21:33:57.558384 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558398 kernel: amdgpu: [powerplay] 
                                failed to send message 190 ret is 65535 
Aug 09 21:33:57.558415 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558428 kernel: amdgpu: [powerplay] 
                                failed to send message 63 ret is 65535 
Aug 09 21:33:57.558442 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:33:57.558454 kernel: amdgpu: [powerplay] 
                                failed to send message 84 ret is 65535 
Aug 09 21:33:57.558468 kernel: amdgpu: [powerplay] Failed to force to switch
arbf0!
Aug 09 21:33:57.558485 kernel: amdgpu: [powerplay] [disable_dpm_tasks] Failed
to disable DPM!
Aug 09 21:33:57.558502 kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]]
*ERROR* suspend of IP block <powerplay> failed -22
Aug 09 21:33:57.811494 kernel: amdgpu 0000:0a:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Aug 09 21:33:57.811816 kernel: [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
Aug 09 21:33:58.314928 kernel: cp is busy, skip halt cp
Aug 09 21:33:58.564823 kernel: rlc is busy, skip halt rlc
Aug 09 21:33:58.818145 kernel: amdgpu 0000:0a:00.0: GPU BACO reset
Aug 09 21:34:59.601512 kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios
stuck in loop for more than 10secs aborting
Aug 09 21:34:59.601664 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing C51A (len 62, WS 0, PS 0) @ 0xC536
Aug 09 21:34:59.601700 kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]]
*ERROR* atombios stuck executing ADA0 (len 142, WS 0, PS 8) @ 0xADBB
Aug 09 21:34:59.601732 kernel: [drm] asic atom init failed!
Aug 09 21:34:59.601767 kernel: amdgpu 0000:0a:00.0: GPU reset succeeded, trying
to resume
Aug 09 21:34:59.851491 kernel: amdgpu 0000:0a:00.0: Wait for MC idle timedout !
Aug 09 21:35:00.101588 kernel: amdgpu 0000:0a:00.0: Wait for MC idle timedout !
Aug 09 21:35:00.104823 kernel: [drm] PCIE GART of 256M enabled (table at
0x000000F4007E9000).
Aug 09 21:35:00.104893 kernel: [drm] VRAM is lost due to GPU reset!
Aug 09 21:35:00.121493 kernel: amdgpu: [powerplay] Failed to send Message.
Aug 09 21:35:00.121580 kernel: amdgpu: [powerplay] SMC address must be 4 byte
aligned.
Aug 09 21:35:00.121616 kernel: amdgpu: [powerplay]
[AVFS][Polaris10_SetupGfxLvlStruct] Problems copying VRConfig value over to SMC
Aug 09 21:35:00.121645 kernel: amdgpu: [powerplay]
[AVFS][Polaris10_AVFSEventMgr] Could not Copy Graphics Level table over to SMU
Aug 09 21:35:00.121672 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:35:00.121706 kernel: amdgpu: [powerplay] 
                                failed to send message 252 ret is 65535 
Aug 09 21:35:00.121740 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:35:00.121767 kernel: amdgpu: [powerplay] 
                                failed to send message 253 ret is 65535 
Aug 09 21:35:00.121796 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:35:00.121822 kernel: amdgpu: [powerplay] 
                                failed to send message 250 ret is 65535 
Aug 09 21:35:00.121853 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:35:00.121879 kernel: amdgpu: [powerplay] 
                                failed to send message 251 ret is 65535 
Aug 09 21:35:00.121911 kernel: amdgpu: [powerplay] 
                                last message was failed ret is 65535
Aug 09 21:35:00.121940 kernel: amdgpu: [powerplay] 
                                failed to send message 254 ret is 65535 
Aug 09 21:35:00.374824 kernel: [drm] Timeout wait for RLC serdes 0,0
Aug 09 21:35:00.624828 kernel: amdgpu 0000:0a:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring gfx test failed (-110)
Aug 09 21:35:00.625100 kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu]]
*ERROR* resume of IP block <gfx_v8_0> failed -110
Aug 09 21:35:00.625130 kernel: [drm] Skip scheduling IBs!
Aug 09 21:35:00.625152 kernel: [drm] Skip scheduling IBs!
Aug 09 21:35:00.625166 kernel: [drm] Skip scheduling IBs!
Aug 09 21:35:00.625180 kernel: amdgpu 0000:0a:00.0: GPU reset(2) failed
Aug 09 21:35:00.625307 kernel: [drm] Skip scheduling IBs!
Aug 09 21:35:00.625320 kernel: amdgpu 0000:0a:00.0: GPU reset end with ret =
-110
Aug 09 21:35:10.818142 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
sdma0 timeout, signaled seq=9089, emitted seq=9089
Aug 09 21:35:10.818255 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Aug 09 21:35:10.818280 kernel: amdgpu 0000:0a:00.0: GPU reset begin!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
