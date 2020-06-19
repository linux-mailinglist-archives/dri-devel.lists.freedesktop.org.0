Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC9201AF5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 21:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F82D6E4FB;
	Fri, 19 Jun 2020 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706D6E4FB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 19:11:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Fri, 19 Jun 2020 19:11:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: panospolychronis@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-QwBrxk5NUZ@https.bugzilla.kernel.org/>
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

Panagiotis Polychronis (panospolychronis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |panospolychronis@gmail.com

--- Comment #34 from Panagiotis Polychronis (panospolychronis@gmail.com) ---
The problem still exists with Linux Kernel 5.8-rc1 from git. (My graphics card
is Radeon 5600XT)


[20581.087159] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=2768656, emitted seq=2768658
[20581.087212] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process DOOMEternalx64v pid 8875 thread DOOMEternalx64v pid 8875
[20581.087217] amdgpu 0000:29:00.0: amdgpu: GPU reset begin!
[20583.381257] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[20585.087232] amdgpu 0000:29:00.0: amdgpu: failed to suspend display audio
[20585.156036] snd_hda_codec_hdmi hdaudioC0D0: HDMI: ELD buf size is 0, force
128
[20585.156052] snd_hda_codec_hdmi hdaudioC0D0: HDMI: invalid ELD data byte 0
[20585.463157] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20585.463205] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
[20585.694999] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20585.695047] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[20585.926951] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* failed to halt cp gfx
[20588.045497] amdgpu 0000:29:00.0: amdgpu: GPU reset succeeded, trying to
resume
[20588.045605] [drm] PCIE GART of 512M enabled (table at 0x0000008000E10000).
[20588.045682] [drm] VRAM is lost due to GPU reset!
[20588.048023] [drm] PSP is resuming...
[20588.218089] [drm] reserve 0x900000 from 0x817e400000 for PSP TMR
[20588.287093] amdgpu 0000:29:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[20588.293101] amdgpu: SMU is resuming...
[20588.295088] amdgpu: SMU is resumed successfully!
[20588.413155] [drm] kiq ring mec 2 pipe 1 q 0
[20588.417493] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[20588.417632] [drm] JPEG decode initialized successfully.
[20588.417690] amdgpu 0000:29:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on
hub 0
[20588.417693] amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1
on hub 0
[20588.417697] amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4
on hub 0
[20588.417700] amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5
on hub 0
[20588.417703] amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6
on hub 0
[20588.417707] amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7
on hub 0
[20588.417709] amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8
on hub 0
[20588.417713] amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9
on hub 0
[20588.417716] amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10
on hub 0
[20588.417719] amdgpu 0000:29:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11
on hub 0
[20588.417721] amdgpu 0000:29:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[20588.417724] amdgpu 0000:29:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[20588.417726] amdgpu 0000:29:00.0: amdgpu: ring vcn_dec uses VM inv eng 0 on
hub 1
[20588.417728] amdgpu 0000:29:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 1 on
hub 1
[20588.417730] amdgpu 0000:29:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 4 on
hub 1
[20588.417732] amdgpu 0000:29:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on
hub 1
[20588.421588] [drm] recover vram bo from shadow start
[20588.427530] [drm] recover vram bo from shadow done
[20588.427534] [drm] Skip scheduling IBs!
[20588.427537] [drm] Skip scheduling IBs!
[20588.427565] [drm] Skip scheduling IBs!
[20588.427573] [drm] Skip scheduling IBs!
[20588.427583] [drm] Skip scheduling IBs!
[20588.427591] [drm] Skip scheduling IBs!
[20588.427597] [drm] Skip scheduling IBs!
[20588.427649] [drm] Skip scheduling IBs!
[20588.427669] [drm] Skip scheduling IBs!
[20588.427680] [drm] Skip scheduling IBs!
[20588.427692] [drm] Skip scheduling IBs!
[20588.427693] [drm] Skip scheduling IBs!
[20588.427699] [drm] Skip scheduling IBs!
[20588.427703] [drm] Skip scheduling IBs!
[20588.427710] [drm] Skip scheduling IBs!
[20588.427714] amdgpu 0000:29:00.0: amdgpu: GPU reset(2) succeeded!
[20588.427719] [drm] Skip scheduling IBs!
[20588.427721] [drm] Skip scheduling IBs!
[20588.427724] [drm] Skip scheduling IBs!
[20588.427726] [drm] Skip scheduling IBs!
[20600.095254] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=2768668, emitted seq=2768669
[20600.095404] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process plasmashell pid 1570 thread plasmashel:cs0 pid 1713
[20600.095413] amdgpu 0000:29:00.0: amdgpu: GPU reset begin!
[20604.095435] amdgpu 0000:29:00.0: amdgpu: failed to suspend display audio
[20604.448799] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20604.448848] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
[20604.681029] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20604.681078] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[20604.913262] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* failed to halt cp gfx
[20605.288303] Disabling lock debugging due to kernel taint
[20605.288325] mce: [Hardware Error]: Machine check events logged
[20605.288327] [Hardware Error]: Uncorrected, software restartable error.
[20605.288330] [Hardware Error]: CPU:1 (17:8:2)
MC0_STATUS[-|UE|MiscV|AddrV|-|-|-|UECC|-|Poison|-]: 0xbc002800000c0135
[20605.288335] [Hardware Error]: Error Addr: 0x00000000e8ac0000
[20605.288337] [Hardware Error]: IPID: 0x000000b000000000
[20605.288339] [Hardware Error]: Load Store Unit Ext. Error Code: 12, DC Data
error type 1 and poison consumption.
[20605.288341] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
[20605.288345] mce: Uncorrected hardware memory error in user-access at
e8ac0000
[20605.288347] Memory failure: 0xe8ac0: memory outside kernel control
[20605.288348] mce: Memory error not recovered
[20605.288361] amdgpu 0000:29:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0003 address=0x8ac0000 flags=0x0000]
[20605.288375] amdgpu 0000:29:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0003 address=0x8ac0000 flags=0x0000]
[20607.031477] amdgpu 0000:29:00.0: amdgpu: GPU reset succeeded, trying to
resume
[20607.031591] [drm] PCIE GART of 512M enabled (table at 0x0000008000E10000).
[20607.031613] [drm] VRAM is lost due to GPU reset!
[20607.034094] [drm] PSP is resuming...
[20607.204092] [drm] reserve 0x900000 from 0x817e400000 for PSP TMR
[20607.273093] amdgpu 0000:29:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[20607.279097] amdgpu: SMU is resuming...
[20607.281035] amdgpu: SMU is resumed successfully!
[20607.397649] [drm] kiq ring mec 2 pipe 1 q 0
[20607.402090] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[20607.402494] [drm] JPEG decode initialized successfully.
[20607.402540] amdgpu 0000:29:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on
hub 0
[20607.402542] amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1
on hub 0
[20607.402544] amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4
on hub 0
[20607.402546] amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5
on hub 0
[20607.402548] amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6
on hub 0
[20607.402549] amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7
on hub 0
[20607.402551] amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8
on hub 0
[20607.402553] amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9
on hub 0
[20607.402554] amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10
on hub 0
[20607.402556] amdgpu 0000:29:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11
on hub 0
[20607.402558] amdgpu 0000:29:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[20607.402559] amdgpu 0000:29:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[20607.402561] amdgpu 0000:29:00.0: amdgpu: ring vcn_dec uses VM inv eng 0 on
hub 1
[20607.402563] amdgpu 0000:29:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 1 on
hub 1
[20607.402564] amdgpu 0000:29:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 4 on
hub 1
[20607.402566] amdgpu 0000:29:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on
hub 1
[20607.405742] [drm] recover vram bo from shadow start
[20607.409317] [drm] recover vram bo from shadow done
[20607.409320] [drm] Skip scheduling IBs!
[20607.409410] amdgpu 0000:29:00.0: amdgpu: GPU reset(4) succeeded!
[20607.493800] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* got no
status for stream 00000000fbb3d792 on acrtc00000000bb69f545
[20607.494597] ------------[ cut here ]------------
[20607.494599] WARNING: CPU: 10 PID: 999 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7429
amdgpu_dm_atomic_commit_tail+0x1ada/0x22b0 [amdgpu]
[20607.494599] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq fuse joydev
mousedev input_leds hid_generic usbhid hid uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common videodev
snd_usbmidi_lib snd_rawmidi snd_seq_device mc rfkill squashfs nls_iso8859_1
snd_hda_codec_realtek nls_cp437 vfat snd_hda_codec_generic fat ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg loop snd_hda_codec
edac_mce_amd amd_energy snd_hda_core kvm_amd snd_hwdep kvm wmi_bmof snd_pcm
irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
snd_timer aesni_intel r8169 snd crypto_simd realtek cryptd ccp glue_helper
sp5100_tco k10temp soundcore libphy i2c_piix4 rng_core pcspkr wmi evdev mac_hid
pinctrl_amd gpio_amdpt acpi_cpufreq uinput sg crypto_user ip_tables x_tables
xhci_pci xhci_pci_renesas xhci_hcd amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec rc_core drm
[20607.494633] CPU: 10 PID: 999 Comm: Xorg Tainted: G   M             
5.8.0-rc1-MANJARO+ #2
[20607.494634] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470
GAMING PLUS (MS-7B79), BIOS A.G0 11/11/2019
[20607.494635] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1ada/0x22b0 [amdgpu]
[20607.494636] Code: 8b bd e8 fc ff ff e8 d5 7f 10 00 48 85 c0 0f 85 23 e9 ff
ff 49 8b b5 e8 01 00 00 4c 89 e2 48 c7 c7 e0 5c 91 c0 e8 f6 74 d0 ff <0f> 0b 49
8b 4f 08 e9 10 e9 ff ff 49 8b 45 00 48 8d b8 78 01 00 00
[20607.494637] RSP: 0018:ffffa6b781987838 EFLAGS: 00010246
[20607.494638] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[20607.494639] RDX: 0000000000000000 RSI: ffffffffaaf63047 RDI:
00000000ffffffff
[20607.494640] RBP: ffffa6b781987ba8 R08: 000000000000053e R09:
0000000000000001
[20607.494641] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff941201964000
[20607.494641] R13: ffff9410db79d400 R14: ffff94110b71bc00 R15:
ffff9410fcc69880
[20607.494642] FS:  00007f87fbe2be80(0000) GS:ffff94120ea80000(0000)
knlGS:0000000000000000
[20607.494643] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[20607.494644] CR2: 0000000000fb1fe8 CR3: 0000000402700000 CR4:
00000000003406e0
[20607.494644] Call Trace:
[20607.494644]  ? sched_clock+0x5/0x10
[20607.494645]  ? irqtime_account_irq+0x90/0xc0
[20607.494646]  ? preempt_count_add+0x68/0xa0
[20607.494646]  commit_tail+0x94/0x130 [drm_kms_helper]
[20607.494647]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[20607.494648]  drm_atomic_helper_update_plane+0xe9/0x140 [drm_kms_helper]
[20607.494648]  drm_mode_cursor_universal+0x128/0x240 [drm]
[20607.494649]  drm_mode_cursor_common+0x102/0x230 [drm]
[20607.494650]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[20607.494650]  drm_ioctl_kernel+0xb2/0x100 [drm]
[20607.494651]  drm_ioctl+0x208/0x360 [drm]
[20607.494651]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[20607.494652]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[20607.494652]  ksys_ioctl+0x82/0xc0
[20607.494653]  __x64_sys_ioctl+0x16/0x20
[20607.494653]  do_syscall_64+0x44/0x70
[20607.494654]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[20607.494655] RIP: 0033:0x7f87fca658eb
[20607.494655] Code: Bad RIP value.
[20607.494656] RSP: 002b:00007ffc20a98628 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[20607.494657] RAX: ffffffffffffffda RBX: 00007ffc20a98660 RCX:
00007f87fca658eb
[20607.494658] RDX: 00007ffc20a98660 RSI: 00000000c02464bb RDI:
000000000000000d
[20607.494659] RBP: 00000000c02464bb R08: 000055c87121c270 R09:
000000000000007f
[20607.494659] R10: 0000000000000a00 R11: 0000000000000246 R12:
000055c87109aad0
[20607.494660] R13: 000000000000000d R14: 0000000000000004 R15:
000055c87109b210
[20607.494661] ---[ end trace 96f7cc95700c9634 ]---
[20610.652685] GpuWatchdog[5225]: segfault at 0 ip 000055f7f6e6f76d sp
00007fa63e0b05d0 error 6 in chrome[55f7f27c2000+785b000]
[20610.652696] Code: Bad RIP value.
[20610.652994] audit: type=1701 audit(1592593154.666:113): auid=1000 uid=1000
gid=1000 ses=2 subj==unconfined pid=5147 comm="GpuWatchdog"
exe="/opt/google/chrome/chrome" sig=11 res=1
[20610.674438] audit: type=1334 audit(1592593154.687:114): prog-id=15 op=LOAD
[20610.674597] audit: type=1334 audit(1592593154.687:115): prog-id=16 op=LOAD
[20610.675951] audit: type=1130 audit(1592593154.688:116): pid=1 uid=0
auid=4294967295 ses=4294967295 subj==unconfined
msg='unit=systemd-coredump@0-10631-0 comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[20611.663071] audit: type=1131 audit(1592593155.675:117): pid=1 uid=0
auid=4294967295 ses=4294967295 subj==unconfined
msg='unit=systemd-coredump@0-10631-0 comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[20611.701231] audit: type=1334 audit(1592593155.714:118): prog-id=16 op=UNLOAD
[20611.701236] audit: type=1334 audit(1592593155.714:119): prog-id=15 op=UNLOAD
[20617.685151] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[20617.694549] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[20627.925351] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[20638.165634] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CONNECTOR:80:DP-2] flip_done timed out
[20648.405154] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:55:plane-5] flip_done timed out
[20658.645157] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:61:plane-7] flip_done timed out
[20658.646471] ------------[ cut here ]------------
[20658.646473] WARNING: CPU: 10 PID: 999 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7016
amdgpu_dm_atomic_commit_tail+0x2139/0x22b0 [amdgpu]
[20658.646474] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq fuse joydev
mousedev input_leds hid_generic usbhid hid uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common videodev
snd_usbmidi_lib snd_rawmidi snd_seq_device mc rfkill squashfs nls_iso8859_1
snd_hda_codec_realtek nls_cp437 vfat snd_hda_codec_generic fat ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg loop snd_hda_codec
edac_mce_amd amd_energy snd_hda_core kvm_amd snd_hwdep kvm wmi_bmof snd_pcm
irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
snd_timer aesni_intel r8169 snd crypto_simd realtek cryptd ccp glue_helper
sp5100_tco k10temp soundcore libphy i2c_piix4 rng_core pcspkr wmi evdev mac_hid
pinctrl_amd gpio_amdpt acpi_cpufreq uinput sg crypto_user ip_tables x_tables
xhci_pci xhci_pci_renesas xhci_hcd amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec rc_core drm
[20658.646503] CPU: 10 PID: 999 Comm: Xorg Tainted: G   M    W        
5.8.0-rc1-MANJARO+ #2
[20658.646504] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470
GAMING PLUS (MS-7B79), BIOS A.G0 11/11/2019
[20658.646505] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x2139/0x22b0 [amdgpu]
[20658.646506] Code: 22 ef ff ff 41 8b 4c 24 60 48 c7 c2 20 bc 89 c0 bf 02 00
00 00 48 c7 c6 88 58 91 c0 e8 e0 6d d0 ff 49 8b 4f 08 e9 8f e0 ff ff <0f> 0b e9
0a f0 ff ff 0f 0b 0f 0b e9 21 f0 ff ff 48 8b 85 f0 fc ff
[20658.646506] RSP: 0018:ffffa6b781987948 EFLAGS: 00010002
[20658.646507] RAX: 0000000000000286 RBX: 0000000000000bfc RCX:
0000000000000000
[20658.646508] RDX: 0000000000000002 RSI: 0000000000000206 RDI:
0000000000000000
[20658.646509] RBP: ffffa6b781987cb8 R08: 0000000000000005 R09:
0000000000000000
[20658.646509] R10: ffffa6b7819878b0 R11: ffffa6b7819878b4 R12:
0000000000000286
[20658.646510] R13: ffff941201964000 R14: ffff9410db79c000 R15:
ffff9410fcc69600
[20658.646511] FS:  00007f87fbe2be80(0000) GS:ffff94120ea80000(0000)
knlGS:0000000000000000
[20658.646511] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[20658.646512] CR2: 00001a0ee45cb008 CR3: 0000000402700000 CR4:
00000000003406e0
[20658.646512] Call Trace:
[20658.646513]  commit_tail+0x94/0x130 [drm_kms_helper]
[20658.646514]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[20658.646514]  drm_mode_obj_set_property_ioctl+0x156/0x320 [drm]
[20658.646515]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[20658.646515]  drm_ioctl_kernel+0xb2/0x100 [drm]
[20658.646516]  drm_ioctl+0x208/0x360 [drm]
[20658.646516]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[20658.646517]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[20658.646517]  ksys_ioctl+0x82/0xc0
[20658.646518]  __x64_sys_ioctl+0x16/0x20
[20658.646518]  do_syscall_64+0x44/0x70
[20658.646519]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[20658.646519] RIP: 0033:0x7f87fca658eb
[20658.646520] Code: Bad RIP value.
[20658.646520] RSP: 002b:00007ffc20a995c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[20658.646521] RAX: ffffffffffffffda RBX: 00007ffc20a99600 RCX:
00007f87fca658eb
[20658.646522] RDX: 00007ffc20a99600 RSI: 00000000c01864ba RDI:
000000000000000d
[20658.646523] RBP: 00000000c01864ba R08: 000000000000006c R09:
00000000cccccccc
[20658.646523] R10: 0000000000000fff R11: 0000000000000246 R12:
000055c87121db90
[20658.646524] R13: 000000000000000d R14: 0000000000000000 R15:
0000000000000003
[20658.646525] ---[ end trace 96f7cc95700c9635 ]---
[20658.646525] ------------[ cut here ]------------
[20658.646526] WARNING: CPU: 10 PID: 999 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6613
amdgpu_dm_atomic_commit_tail+0x2142/0x22b0 [amdgpu]
[20658.646527] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq fuse joydev
mousedev input_leds hid_generic usbhid hid uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common videodev
snd_usbmidi_lib snd_rawmidi snd_seq_device mc rfkill squashfs nls_iso8859_1
snd_hda_codec_realtek nls_cp437 vfat snd_hda_codec_generic fat ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg loop snd_hda_codec
edac_mce_amd amd_energy snd_hda_core kvm_amd snd_hwdep kvm wmi_bmof snd_pcm
irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
snd_timer aesni_intel r8169 snd crypto_simd realtek cryptd ccp glue_helper
sp5100_tco k10temp soundcore libphy i2c_piix4 rng_core pcspkr wmi evdev mac_hid
pinctrl_amd gpio_amdpt acpi_cpufreq uinput sg crypto_user ip_tables x_tables
xhci_pci xhci_pci_renesas xhci_hcd amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec rc_core drm
[20658.646556] CPU: 10 PID: 999 Comm: Xorg Tainted: G   M    W        
5.8.0-rc1-MANJARO+ #2
[20658.646557] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470
GAMING PLUS (MS-7B79), BIOS A.G0 11/11/2019
[20658.646557] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x2142/0x22b0 [amdgpu]
[20658.646558] Code: 48 c7 c2 20 bc 89 c0 bf 02 00 00 00 48 c7 c6 88 58 91 c0
e8 e0 6d d0 ff 49 8b 4f 08 e9 8f e0 ff ff 0f 0b e9 0a f0 ff ff 0f 0b <0f> 0b e9
21 f0 ff ff 48 8b 85 f0 fc ff ff 48 8d 8d 64 fd ff ff 48
[20658.646559] RSP: 0018:ffffa6b781987948 EFLAGS: 00010082
[20658.646560] RAX: 0000000000000001 RBX: 0000000000000bfc RCX:
0000000000000000
[20658.646561] RDX: 0000000000000002 RSI: 0000000000000206 RDI:
0000000000000000
[20658.646561] RBP: ffffa6b781987cb8 R08: 0000000000000005 R09:
0000000000000000
[20658.646562] R10: ffffa6b7819878b0 R11: ffffa6b7819878b4 R12:
0000000000000286
[20658.646563] R13: ffff941201964000 R14: ffff9410db79c000 R15:
ffff9410fcc69600
[20658.646563] FS:  00007f87fbe2be80(0000) GS:ffff94120ea80000(0000)
knlGS:0000000000000000
[20658.646564] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[20658.646564] CR2: 00001a0ee45cb008 CR3: 0000000402700000 CR4:
00000000003406e0
[20658.646565] Call Trace:
[20658.646565]  commit_tail+0x94/0x130 [drm_kms_helper]
[20658.646566]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[20658.646567]  drm_mode_obj_set_property_ioctl+0x156/0x320 [drm]
[20658.646567]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[20658.646568]  drm_ioctl_kernel+0xb2/0x100 [drm]
[20658.646568]  drm_ioctl+0x208/0x360 [drm]
[20658.646569]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[20658.646569]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[20658.646570]  ksys_ioctl+0x82/0xc0
[20658.646570]  __x64_sys_ioctl+0x16/0x20
[20658.646571]  do_syscall_64+0x44/0x70
[20658.646571]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[20658.646572] RIP: 0033:0x7f87fca658eb
[20658.646572] Code: Bad RIP value.
[20658.646573] RSP: 002b:00007ffc20a995c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[20658.646574] RAX: ffffffffffffffda RBX: 00007ffc20a99600 RCX:
00007f87fca658eb
[20658.646574] RDX: 00007ffc20a99600 RSI: 00000000c01864ba RDI:
000000000000000d
[20658.646575] RBP: 00000000c01864ba R08: 000000000000006c R09:
00000000cccccccc
[20658.646576] R10: 0000000000000fff R11: 0000000000000246 R12:
000055c87121db90
[20658.646576] R13: 000000000000000d R14: 0000000000000000 R15:
0000000000000003
[20658.646577] ---[ end trace 96f7cc95700c9636 ]---
[20668.885142] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[20684.245559] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[20694.485139] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:61:plane-7] flip_done timed out

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
