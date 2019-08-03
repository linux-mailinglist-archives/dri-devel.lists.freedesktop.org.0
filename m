Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5F80654
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 15:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A086E529;
	Sat,  3 Aug 2019 13:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55A3F6E512
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 13:35:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 51C3372167; Sat,  3 Aug 2019 13:35:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 03 Aug 2019 13:35:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-NmEldH4VMC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0210398302=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0210398302==
Content-Type: multipart/alternative; boundary="15648393552.c39C0F3Ed.28674"
Content-Transfer-Encoding: 7bit


--15648393552.c39C0F3Ed.28674
Date: Sat, 3 Aug 2019 13:35:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #72 from Mauro Gaspari <ilvipero@gmx.com> ---
After a few weeks without crashes on Ubuntu Budgie 18.04 LTS with valve
mesa-aco, I moved to another distribution that does not have valve mesa-aco=
 to
cross check.

This is what I am using:
OS: openSUSE Tumbleweed x86_64=20
Kernel: 5.2.2-1-default
Resolution: 3440x1440
DE: Xfce
WM: Xfwm4
CPU: AMD Ryzen 7 2700X (16) @ 3.700GHz
GPU: AMD ATI Radeon VII
Memory: 1644MiB / 64387MiB=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.3
No kernel parameters configured, just out of the box openSUSE

I had 3 of full OS freezes:

1. As I was playing Albion Online (Native) No full system freeze, I was abl=
e to
drop to tty, and notice this error: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR*
Failed to initialize parser -125!

2. As I closed down Albion Online (Native) and returned to desktop. Full Sy=
stem
Freeze

3. As I was doing regular desktop operations on XFCE. No 3d gaming going on.
Please see below logs:

DMESG after crash:

ilvipero@MGDT-ROG:~> dmesg | grep amdgpu
[    5.758450] [drm] amdgpu kernel modesetting enabled.
[    5.758569] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -> 0xefffffff
[    5.758570] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -> 0xf01fffff
[    5.758571] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfcd00000 -> 0xfcd7ffff
[    5.758573] fb0: switching to amdgpudrmfb from EFI VGA
[    5.758646] amdgpu 0000:0a:00.0: vgaarb: deactivate vga console
[    5.758826] amdgpu 0000:0a:00.0: No more image in the PCI ROM
[    5.758870] amdgpu 0000:0a:00.0: VRAM: 16368M 0x0000008000000000 -
0x00000083FEFFFFFF (16368M used)
[    5.758871] amdgpu 0000:0a:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    5.758872] amdgpu 0000:0a:00.0: AGP: 267894784M 0x0000008400000000 -
0x0000FFFFFFFFFFFF
[    5.758936] [drm] amdgpu: 16368M of VRAM memory ready
[    5.758938] [drm] amdgpu: 16368M of GTT memory ready.
[    5.759204] amdgpu 0000:0a:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
"amdgpu/vega20_ta.bin"
[    6.855053] fbcon: amdgpudrmfb (fb0) is primary device
[    6.913835] amdgpu 0000:0a:00.0: fb0: amdgpudrmfb frame buffer device
[    6.928054] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[    6.928055] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    6.928056] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    6.928056] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    6.928057] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    6.928058] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    6.928059] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    6.928059] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    6.928060] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    6.928060] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    6.928061] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    6.928062] amdgpu 0000:0a:00.0: ring page0 uses VM inv eng 1 on hub 1
[    6.928063] amdgpu 0000:0a:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    6.928063] amdgpu 0000:0a:00.0: ring page1 uses VM inv eng 5 on hub 1
[    6.928064] amdgpu 0000:0a:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    6.928064] amdgpu 0000:0a:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    6.928065] amdgpu 0000:0a:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    6.928066] amdgpu 0000:0a:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    6.928066] amdgpu 0000:0a:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    6.928067] amdgpu 0000:0a:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    6.928067] amdgpu 0000:0a:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    6.928068] amdgpu 0000:0a:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    6.928068] amdgpu 0000:0a:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    7.609167] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:0a:00.0 on
minor 0

system logs:

2019-08-03T18:51:21.779695+08:00 MGDT-ROG kernel: [11817.727681] pcieport
0000:00:03.1: AER: Multiple Corrected error received: 0000:00:00.0
2019-08-03T18:51:21.779730+08:00 MGDT-ROG kernel: [11817.771355] pcieport
0000:00:03.1: AER: PCIe Bus Error: severity=3DCorrected, type=3DData Link L=
ayer,
(Transmitter ID)
2019-08-03T18:51:21.779735+08:00 MGDT-ROG kernel: [11817.771358] pcieport
0000:00:03.1: AER:   device [1022:1453] error status/mask=3D00003100/000060=
00
2019-08-03T18:51:21.779737+08:00 MGDT-ROG kernel: [11817.771361] pcieport
0000:00:03.1: AER:    [ 8] Rollover=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
2019-08-03T18:51:21.779738+08:00 MGDT-ROG kernel: [11817.771371] pcieport
0000:00:03.1: AER:    [12] Timeout=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
2019-08-03T18:51:26.721833+08:00 MGDT-ROG sudo: pam_unix(sudo:session): ses=
sion
closed for user root
2019-08-03T18:51:31.983837+08:00 MGDT-ROG kernel: [11827.971739]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D2324984, emitted seq=3D2324986
2019-08-03T18:51:31.983851+08:00 MGDT-ROG kernel: [11827.971800]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process X p=
id
2132 thread X:cs0 pid 2139
2019-08-03T18:51:31.983853+08:00 MGDT-ROG kernel: [11827.971804] amdgpu
0000:0a:00.0: GPU reset begin!
2019-08-03T18:51:32.751834+08:00 MGDT-ROG kernel: [11828.741066] amdgpu:
[powerplay] Failed to send message 0x47, response 0xffffffff
2019-08-03T18:51:32.751846+08:00 MGDT-ROG kernel: [11828.741077] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751849+08:00 MGDT-ROG kernel: [11828.741078] amdgpu:
[powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!
2019-08-03T18:51:32.751850+08:00 MGDT-ROG kernel: [11828.741090] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751852+08:00 MGDT-ROG kernel: [11828.741091] amdgpu:
[powerplay] Attempt to set Hard Min for DCEFCLK Failed!
2019-08-03T18:51:32.751854+08:00 MGDT-ROG kernel: [11828.741102] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751855+08:00 MGDT-ROG kernel: [11828.741102] amdgpu:
[powerplay] [SetHardMinFreq] Set hard min uclk failed!
2019-08-03T18:51:32.751856+08:00 MGDT-ROG kernel: [11828.741113] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:32.751858+08:00 MGDT-ROG kernel: [11828.741114] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:32.751859+08:00 MGDT-ROG kernel: [11828.741114] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:32.787843+08:00 MGDT-ROG kernel: [11828.775671] [drm] REG_=
WAIT
timeout 10us * 3000 tries - dce110_stream_encoder_dp_blank line:951
2019-08-03T18:51:32.787852+08:00 MGDT-ROG kernel: [11828.775672] ----------=
--[
cut here ]------------
2019-08-03T18:51:32.787853+08:00 MGDT-ROG kernel: [11828.775778] WARNING: C=
PU:
1 PID: 10195 at drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
2019-08-03T18:51:32.787855+08:00 MGDT-ROG kernel: [11828.775779] Modules li=
nked
in: tun fuse af_packet ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables x_tables bpfilter uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common snd_usbmidi_=
lib
videodev snd_rawmidi snd_seq_device media joydev scsi_transport_iscsi msr
nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd kvm irqbypass
snd_hda_codec_realtek crct10dif_pclmul snd_hda_codec_generic crc32_pclmul
ledtrig_audio snd_hda_codec_hdmi ghash_clmulni_intel snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep aesni_intel eeepc_wmi asus_wmi aes_x86=
_64
sparse_keymap snd_pcm crypto_simd rfkill cryptd video glue_helper wmi_bmof
mxm_wmi igb snd_timer sp5100_tco snd ptp pcspkr i2c_piix4 pps_core dca k10t=
emp
ccp soundcore gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpufreq btrfs
libcrc32c xor hid_generic usbhid amdgpu raid6_pq amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
xhci_pci drm
2019-08-03T18:51:32.787858+08:00 MGDT-ROG kernel: [11828.775807]  crc32c_in=
tel
xhci_hcd usbcore sr_mod cdrom wmi pinctrl_amd l2tp_ppp l2tp_netlink l2tp_co=
re
ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
2019-08-03T18:51:32.787860+08:00 MGDT-ROG kernel: [11828.775817] CPU: 1 PID:
10195 Comm: kworker/1:0 Not tainted 5.2.3-1-default #1 openSUSE Tumbleweed
(unreleased)
2019-08-03T18:51:32.787861+08:00 MGDT-ROG kernel: [11828.775818] Hardware n=
ame:
System manufacturer System Product Name/ROG STRIX X470-F GAMING, BIOS 5007
06/17/2019
2019-08-03T18:51:32.787862+08:00 MGDT-ROG kernel: [11828.775822] Workqueue:
events drm_sched_job_timedout [gpu_sched]
2019-08-03T18:51:32.787863+08:00 MGDT-ROG kernel: [11828.775897] RIP:
0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
2019-08-03T18:51:32.787864+08:00 MGDT-ROG kernel: [11828.775899] Code: 4c 2=
4 18
44 89 fa 89 ee 48 c7 c7 68 7c 75 c0 e8 e9 71 84 f4 83 7b 20 01 0f 84 2b 1b =
fe
ff 48 c7 c7 d8 7b 75 c0 e8 d3 71 84 f4 <0f> 0b e9 18 1b fe ff 48 c7 c7 d8 7=
b 75
c0 89 54 24 04 e8 bc 71 84
2019-08-03T18:51:32.787866+08:00 MGDT-ROG kernel: [11828.775901] RSP:
0018:ffffab7acdeb77e8 EFLAGS: 00010282
2019-08-03T18:51:32.787867+08:00 MGDT-ROG kernel: [11828.775902] RAX:
0000000000000024 RBX: ffff960e92c3c880 RCX: 0000000000000006
2019-08-03T18:51:32.787868+08:00 MGDT-ROG kernel: [11828.775903] RDX:
0000000000000007 RSI: 0000000000000096 RDI: ffff960e9e659a10
2019-08-03T18:51:32.787869+08:00 MGDT-ROG kernel: [11828.775903] RBP:
000000000000000a R08: 00000000000004da R09: 0000000000000001
2019-08-03T18:51:32.787870+08:00 MGDT-ROG kernel: [11828.775904] R10:
0000000000000000 R11: 0000000000000001 R12: 0000000000004ee2
2019-08-03T18:51:32.787871+08:00 MGDT-ROG kernel: [11828.775905] R13:
0000000000000bb9 R14: 0000000000000000 R15: 0000000000000bb8
2019-08-03T18:51:32.787872+08:00 MGDT-ROG kernel: [11828.775906] FS:=20
0000000000000000(0000) GS:ffff960e9e640000(0000) knlGS:0000000000000000
2019-08-03T18:51:32.787874+08:00 MGDT-ROG kernel: [11828.775907] CS:  0010 =
DS:
0000 ES: 0000 CR0: 0000000080050033
2019-08-03T18:51:32.787874+08:00 MGDT-ROG kernel: [11828.775907] CR2:
000055d4170da000 CR3: 0000000f03cd6000 CR4: 00000000003406e0
2019-08-03T18:51:32.787875+08:00 MGDT-ROG kernel: [11828.775908] Call Trace:
2019-08-03T18:51:32.787876+08:00 MGDT-ROG kernel: [11828.775982]=20
dce110_stream_encoder_dp_blank+0xda/0x120 [amdgpu]
2019-08-03T18:51:32.787877+08:00 MGDT-ROG kernel: [11828.776049]=20
core_link_disable_stream+0x32/0x260 [amdgpu]
2019-08-03T18:51:32.787878+08:00 MGDT-ROG kernel: [11828.776054]  ?
printk+0x48/0x4a
2019-08-03T18:51:32.787879+08:00 MGDT-ROG kernel: [11828.776119]=20
dce110_reset_hw_ctx_wrap+0xc1/0x1e0 [amdgpu]
2019-08-03T18:51:32.787881+08:00 MGDT-ROG kernel: [11828.776192]  ?
vega20_dpm_force_dpm_level.cold+0x5b/0x90 [amdgpu]
2019-08-03T18:51:32.787882+08:00 MGDT-ROG kernel: [11828.776256]=20
dce110_apply_ctx_to_hw+0x3a/0x470 [amdgpu]
2019-08-03T18:51:32.787883+08:00 MGDT-ROG kernel: [11828.776318]  ?
hwmgr_handle_task+0x66/0xc0 [amdgpu]
2019-08-03T18:51:32.787884+08:00 MGDT-ROG kernel: [11828.776322]  ?
mutex_lock+0xe/0x30
2019-08-03T18:51:32.787885+08:00 MGDT-ROG kernel: [11828.776385]  ?
pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
2019-08-03T18:51:32.787886+08:00 MGDT-ROG kernel: [11828.776450]  ?
dm_pp_apply_display_requirements+0x1a1/0x1c0 [amdgpu]
2019-08-03T18:51:32.787887+08:00 MGDT-ROG kernel: [11828.776513]=20
dc_commit_state_no_check+0x200/0x530 [amdgpu]
2019-08-03T18:51:32.787888+08:00 MGDT-ROG kernel: [11828.776516]  ?
get_page_from_freelist+0x289/0x380
2019-08-03T18:51:32.787889+08:00 MGDT-ROG kernel: [11828.776579]=20
dc_commit_state+0x8f/0xb0 [amdgpu]
2019-08-03T18:51:32.787889+08:00 MGDT-ROG kernel: [11828.776644]=20
amdgpu_dm_atomic_commit_tail+0x3a6/0xd30 [amdgpu]
2019-08-03T18:51:32.787890+08:00 MGDT-ROG kernel: [11828.776709]  ?
bw_calcs+0x8ac/0x1440 [amdgpu]
2019-08-03T18:51:32.787892+08:00 MGDT-ROG kernel: [11828.776711]  ?
__ww_mutex_lock.isra.0+0x2a/0x780
2019-08-03T18:51:32.787893+08:00 MGDT-ROG kernel: [11828.776714]  ?
_raw_spin_unlock_irqrestore+0x24/0x40
2019-08-03T18:51:32.787893+08:00 MGDT-ROG kernel: [11828.776717]  ?
__wake_up_common_lock+0x7c/0xa0
2019-08-03T18:51:32.787894+08:00 MGDT-ROG kernel: [11828.776719]  ?
wait_for_completion_timeout+0xf3/0x110
2019-08-03T18:51:32.787895+08:00 MGDT-ROG kernel: [11828.776720]  ?
wait_for_completion_interruptible+0x10b/0x150
2019-08-03T18:51:32.787896+08:00 MGDT-ROG kernel: [11828.776728]  ?
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:32.787897+08:00 MGDT-ROG kernel: [11828.776735]=20
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:32.787898+08:00 MGDT-ROG kernel: [11828.776742]=20
drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
2019-08-03T18:51:32.787899+08:00 MGDT-ROG kernel: [11828.776749]=20
drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
2019-08-03T18:51:32.787900+08:00 MGDT-ROG kernel: [11828.776756]=20
drm_atomic_helper_suspend+0x4c/0xe0 [drm_kms_helper]
2019-08-03T18:51:32.787901+08:00 MGDT-ROG kernel: [11828.776820]=20
dm_suspend+0x20/0x60 [amdgpu]
2019-08-03T18:51:32.787902+08:00 MGDT-ROG kernel: [11828.776861]=20
amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
2019-08-03T18:51:32.787903+08:00 MGDT-ROG kernel: [11828.776903]=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
2019-08-03T18:51:32.787904+08:00 MGDT-ROG kernel: [11828.776975]=20
amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
2019-08-03T18:51:32.787905+08:00 MGDT-ROG kernel: [11828.777047]=20
amdgpu_device_gpu_recover+0x67/0x765 [amdgpu]
2019-08-03T18:51:32.787906+08:00 MGDT-ROG kernel: [11828.777106]=20
amdgpu_job_timedout+0xf7/0x120 [amdgpu]
2019-08-03T18:51:32.787906+08:00 MGDT-ROG kernel: [11828.777110]=20
drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
2019-08-03T18:51:32.787907+08:00 MGDT-ROG kernel: [11828.777113]=20
process_one_work+0x1df/0x3c0
2019-08-03T18:51:32.787908+08:00 MGDT-ROG kernel: [11828.777115]=20
worker_thread+0x4d/0x400
2019-08-03T18:51:32.787909+08:00 MGDT-ROG kernel: [11828.777117]=20
kthread+0xf9/0x130
2019-08-03T18:51:32.787910+08:00 MGDT-ROG kernel: [11828.777119]  ?
process_one_work+0x3c0/0x3c0
2019-08-03T18:51:32.787911+08:00 MGDT-ROG kernel: [11828.777120]  ?
kthread_park+0x80/0x80
2019-08-03T18:51:32.787912+08:00 MGDT-ROG kernel: [11828.777122]=20
ret_from_fork+0x27/0x50
2019-08-03T18:51:32.787913+08:00 MGDT-ROG kernel: [11828.777125] ---[ end t=
race
9aaf1f62ae398b4b ]---
2019-08-03T18:51:37.791882+08:00 MGDT-ROG kernel: [11833.780084]
[drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 5s=
ecs
aborting
2019-08-03T18:51:37.791896+08:00 MGDT-ROG kernel: [11833.780129]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0B0 (len 2971, WS 4, PS 0) @ 0xB963
2019-08-03T18:51:37.791898+08:00 MGDT-ROG kernel: [11833.780172]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing AFB0 (len 255, WS 4, PS 0) @ 0xB089
2019-08-03T18:51:37.791899+08:00 MGDT-ROG kernel: [11833.780240]
[drm:dce110_link_encoder_disable_output [amdgpu]] *ERROR*
dce110_link_encoder_disable_output: Failed to execute VBIOS command table!
2019-08-03T18:51:37.791901+08:00 MGDT-ROG kernel: [11833.780240] ----------=
--[
cut here ]------------
2019-08-03T18:51:37.791902+08:00 MGDT-ROG kernel: [11833.780328] WARNING: C=
PU:
1 PID: 10195 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:1096
dce110_link_encoder_disable_output+0x13d/0x150 [amdgpu]
2019-08-03T18:51:37.791903+08:00 MGDT-ROG kernel: [11833.780329] Modules li=
nked
in: tun fuse af_packet ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables x_tables bpfilter uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common snd_usbmidi_=
lib
videodev snd_rawmidi snd_seq_device media joydev scsi_transport_iscsi msr
nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd kvm irqbypass
snd_hda_codec_realtek crct10dif_pclmul snd_hda_codec_generic crc32_pclmul
ledtrig_audio snd_hda_codec_hdmi ghash_clmulni_intel snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep aesni_intel eeepc_wmi asus_wmi aes_x86=
_64
sparse_keymap snd_pcm crypto_simd rfkill cryptd video glue_helper wmi_bmof
mxm_wmi igb snd_timer sp5100_tco snd ptp pcspkr i2c_piix4 pps_core dca k10t=
emp
ccp soundcore gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpufreq btrfs
libcrc32c xor hid_generic usbhid amdgpu raid6_pq amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
xhci_pci drm
2019-08-03T18:51:37.791905+08:00 MGDT-ROG kernel: [11833.780356]  crc32c_in=
tel
xhci_hcd usbcore sr_mod cdrom wmi pinctrl_amd l2tp_ppp l2tp_netlink l2tp_co=
re
ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
2019-08-03T18:51:37.791907+08:00 MGDT-ROG kernel: [11833.780365] CPU: 1 PID:
10195 Comm: kworker/1:0 Tainted: G        W         5.2.3-1-default #1 open=
SUSE
Tumbleweed (unreleased)
2019-08-03T18:51:37.791908+08:00 MGDT-ROG kernel: [11833.780366] Hardware n=
ame:
System manufacturer System Product Name/ROG STRIX X470-F GAMING, BIOS 5007
06/17/2019
2019-08-03T18:51:37.791910+08:00 MGDT-ROG kernel: [11833.780370] Workqueue:
events drm_sched_job_timedout [gpu_sched]
2019-08-03T18:51:37.791911+08:00 MGDT-ROG kernel: [11833.780435] RIP:
0010:dce110_link_encoder_disable_output+0x13d/0x150 [amdgpu]
2019-08-03T18:51:37.791912+08:00 MGDT-ROG kernel: [11833.780437] Code: ff f=
f 48
83 c4 38 5b 5d 41 5c c3 48 c7 c6 c0 c8 6f c0 48 c7 c7 d8 d9 74 c0 e8 cf bb =
de
ff 48 c7 c7 70 d9 74 c0 e8 61 13 8c f4 <0f> 0b eb d4 66 66 2e 0f 1f 84 00 0=
0 00
00 00 0f 1f 40 00 0f 1f 44
2019-08-03T18:51:37.791913+08:00 MGDT-ROG kernel: [11833.780438] RSP:
0018:ffffab7acdeb77f8 EFLAGS: 00010282
2019-08-03T18:51:37.791914+08:00 MGDT-ROG kernel: [11833.780439] RAX:
0000000000000024 RBX: ffff960e96034a80 RCX: 0000000000000006
2019-08-03T18:51:37.791915+08:00 MGDT-ROG kernel: [11833.780440] RDX:
0000000000000007 RSI: 0000000000000096 RDI: ffff960e9e659a10
2019-08-03T18:51:37.791917+08:00 MGDT-ROG kernel: [11833.780441] RBP:
0000000000000020 R08: 0000000000000518 R09: 0000000000000001
2019-08-03T18:51:37.791918+08:00 MGDT-ROG kernel: [11833.780441] R10:
0000000000000000 R11: 0000000000000001 R12: ffffab7acdeb77fc
2019-08-03T18:51:37.791919+08:00 MGDT-ROG kernel: [11833.780442] R13:
ffff95ffc13c1000 R14: 0000000000000000 R15: ffff9601c92c8188
2019-08-03T18:51:37.791920+08:00 MGDT-ROG kernel: [11833.780443] FS:=20
0000000000000000(0000) GS:ffff960e9e640000(0000) knlGS:0000000000000000
2019-08-03T18:51:37.791921+08:00 MGDT-ROG kernel: [11833.780444] CS:  0010 =
DS:
0000 ES: 0000 CR0: 0000000080050033
2019-08-03T18:51:37.791922+08:00 MGDT-ROG kernel: [11833.780445] CR2:
000055d4170da000 CR3: 0000000f03cd6000 CR4: 00000000003406e0
2019-08-03T18:51:37.791923+08:00 MGDT-ROG kernel: [11833.780446] Call Trace:
2019-08-03T18:51:37.791924+08:00 MGDT-ROG kernel: [11833.780512]=20
dp_disable_link_phy+0x73/0x110 [amdgpu]
2019-08-03T18:51:37.791925+08:00 MGDT-ROG kernel: [11833.780576]=20
core_link_disable_stream+0xb6/0x260 [amdgpu]
2019-08-03T18:51:37.791926+08:00 MGDT-ROG kernel: [11833.780580]  ?
printk+0x48/0x4a
2019-08-03T18:51:37.791927+08:00 MGDT-ROG kernel: [11833.780642]=20
dce110_reset_hw_ctx_wrap+0xc1/0x1e0 [amdgpu]
2019-08-03T18:51:37.791928+08:00 MGDT-ROG kernel: [11833.780716]  ?
vega20_dpm_force_dpm_level.cold+0x5b/0x90 [amdgpu]
2019-08-03T18:51:37.791929+08:00 MGDT-ROG kernel: [11833.780779]=20
dce110_apply_ctx_to_hw+0x3a/0x470 [amdgpu]
2019-08-03T18:51:37.791930+08:00 MGDT-ROG kernel: [11833.780840]  ?
hwmgr_handle_task+0x66/0xc0 [amdgpu]
2019-08-03T18:51:37.791931+08:00 MGDT-ROG kernel: [11833.780843]  ?
mutex_lock+0xe/0x30
2019-08-03T18:51:37.791933+08:00 MGDT-ROG kernel: [11833.780905]  ?
pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
2019-08-03T18:51:37.791934+08:00 MGDT-ROG kernel: [11833.780969]  ?
dm_pp_apply_display_requirements+0x1a1/0x1c0 [amdgpu]
2019-08-03T18:51:37.791935+08:00 MGDT-ROG kernel: [11833.781032]=20
dc_commit_state_no_check+0x200/0x530 [amdgpu]
2019-08-03T18:51:37.791936+08:00 MGDT-ROG kernel: [11833.781036]  ?
get_page_from_freelist+0x289/0x380
2019-08-03T18:51:37.791937+08:00 MGDT-ROG kernel: [11833.781098]=20
dc_commit_state+0x8f/0xb0 [amdgpu]
2019-08-03T18:51:37.791938+08:00 MGDT-ROG kernel: [11833.781162]=20
amdgpu_dm_atomic_commit_tail+0x3a6/0xd30 [amdgpu]
2019-08-03T18:51:37.791939+08:00 MGDT-ROG kernel: [11833.781227]  ?
bw_calcs+0x8ac/0x1440 [amdgpu]
2019-08-03T18:51:37.791940+08:00 MGDT-ROG kernel: [11833.781229]  ?
__ww_mutex_lock.isra.0+0x2a/0x780
2019-08-03T18:51:37.791941+08:00 MGDT-ROG kernel: [11833.781231]  ?
_raw_spin_unlock_irqrestore+0x24/0x40
2019-08-03T18:51:37.791942+08:00 MGDT-ROG kernel: [11833.781234]  ?
__wake_up_common_lock+0x7c/0xa0
2019-08-03T18:51:37.791943+08:00 MGDT-ROG kernel: [11833.781236]  ?
wait_for_completion_timeout+0xf3/0x110
2019-08-03T18:51:37.791944+08:00 MGDT-ROG kernel: [11833.781237]  ?
wait_for_completion_interruptible+0x10b/0x150
2019-08-03T18:51:37.791945+08:00 MGDT-ROG kernel: [11833.781245]  ?
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:37.791946+08:00 MGDT-ROG kernel: [11833.781251]=20
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:37.791947+08:00 MGDT-ROG kernel: [11833.781258]=20
drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
2019-08-03T18:51:37.791948+08:00 MGDT-ROG kernel: [11833.781265]=20
drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
2019-08-03T18:51:37.791949+08:00 MGDT-ROG kernel: [11833.781272]=20
drm_atomic_helper_suspend+0x4c/0xe0 [drm_kms_helper]
2019-08-03T18:51:37.791950+08:00 MGDT-ROG kernel: [11833.781335]=20
dm_suspend+0x20/0x60 [amdgpu]
2019-08-03T18:51:37.791951+08:00 MGDT-ROG kernel: [11833.781377]=20
amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
2019-08-03T18:51:37.791952+08:00 MGDT-ROG kernel: [11833.781418]=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
2019-08-03T18:51:37.791953+08:00 MGDT-ROG kernel: [11833.781490]=20
amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
2019-08-03T18:51:37.791954+08:00 MGDT-ROG kernel: [11833.781561]=20
amdgpu_device_gpu_recover+0x67/0x765 [amdgpu]
2019-08-03T18:51:37.791955+08:00 MGDT-ROG kernel: [11833.781620]=20
amdgpu_job_timedout+0xf7/0x120 [amdgpu]
2019-08-03T18:51:37.791956+08:00 MGDT-ROG kernel: [11833.781624]=20
drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
2019-08-03T18:51:37.791957+08:00 MGDT-ROG kernel: [11833.781627]=20
process_one_work+0x1df/0x3c0
2019-08-03T18:51:37.791958+08:00 MGDT-ROG kernel: [11833.781629]=20
worker_thread+0x4d/0x400
2019-08-03T18:51:37.791959+08:00 MGDT-ROG kernel: [11833.781631]=20
kthread+0xf9/0x130
2019-08-03T18:51:37.791960+08:00 MGDT-ROG kernel: [11833.781633]  ?
process_one_work+0x3c0/0x3c0
2019-08-03T18:51:37.791961+08:00 MGDT-ROG kernel: [11833.781634]  ?
kthread_park+0x80/0x80
2019-08-03T18:51:37.791962+08:00 MGDT-ROG kernel: [11833.781636]=20
ret_from_fork+0x27/0x50
2019-08-03T18:51:37.791963+08:00 MGDT-ROG kernel: [11833.781639] ---[ end t=
race
9aaf1f62ae398b4c ]---
2019-08-03T18:51:42.796019+08:00 MGDT-ROG kernel: [11838.784083]
[drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 5s=
ecs
aborting
2019-08-03T18:51:42.796034+08:00 MGDT-ROG kernel: [11838.784127]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing A048 (len 62, WS 0, PS 0) @ 0xA064
2019-08-03T18:51:42.796035+08:00 MGDT-ROG kernel: [11838.784208] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796036+08:00 MGDT-ROG kernel: [11838.784219] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796038+08:00 MGDT-ROG kernel: [11838.784233] amdgpu:
[powerplay] Failed to send message 0x47, response 0xffffffff
2019-08-03T18:51:42.796039+08:00 MGDT-ROG kernel: [11838.784245] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796040+08:00 MGDT-ROG kernel: [11838.784245] amdgpu:
[powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!
2019-08-03T18:51:42.796041+08:00 MGDT-ROG kernel: [11838.784258] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796042+08:00 MGDT-ROG kernel: [11838.784258] amdgpu:
[powerplay] Attempt to set Hard Min for DCEFCLK Failed!
2019-08-03T18:51:42.796044+08:00 MGDT-ROG kernel: [11838.784269] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796045+08:00 MGDT-ROG kernel: [11838.784270] amdgpu:
[powerplay] [SetHardMinFreq] Set hard min uclk failed!
2019-08-03T18:51:42.796046+08:00 MGDT-ROG kernel: [11838.784281] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:42.796047+08:00 MGDT-ROG kernel: [11838.784282] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:42.796048+08:00 MGDT-ROG kernel: [11838.784282] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:43.656061+08:00 MGDT-ROG kernel: [11839.645436] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:43.656078+08:00 MGDT-ROG kernel: [11839.645438] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:43.656080+08:00 MGDT-ROG kernel: [11839.645438] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:43.656081+08:00 MGDT-ROG kernel: [11839.645449] amdgpu:
[powerplay] Failed to send message 0x7, response 0xffffffff
2019-08-03T18:51:43.656082+08:00 MGDT-ROG kernel: [11839.645450] amdgpu:
[powerplay] [DisableAllSMUFeatures] Failed to disable all smu features!
2019-08-03T18:51:43.656083+08:00 MGDT-ROG kernel: [11839.645450] amdgpu:
[powerplay] [DisableDpmTasks] Failed to disable all smu features!
2019-08-03T18:51:43.656084+08:00 MGDT-ROG kernel: [11839.645451] amdgpu:
[powerplay] [PowerOffAsic] Failed to disable DPM!
2019-08-03T18:51:43.656086+08:00 MGDT-ROG kernel: [11839.645497]
[drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspend of IP block
<powerplay> failed -5
2019-08-03T18:51:43.911990+08:00 MGDT-ROG kernel: [11839.902893] amdgpu
0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0
test failed (-110)
2019-08-03T18:51:43.912001+08:00 MGDT-ROG kernel: [11839.902947]
[drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
2019-08-03T18:51:44.167806+08:00 MGDT-ROG kernel: [11840.159797] [drm] Time=
out
wait for RLC serdes 0,0
2019-08-03T18:51:44.191826+08:00 MGDT-ROG kernel: [11840.180793] amdgpu
0000:0a:00.0: GPU mode1 reset
2019-08-03T18:51:44.451982+08:00 MGDT-ROG kernel: [11840.442308] [drm] psp =
is
not working correctly before mode1 reset!
2019-08-03T18:51:44.451993+08:00 MGDT-ROG kernel: [11840.442310] amdgpu
0000:0a:00.0: GPU mode1 reset failed
2019-08-03T18:51:44.719056+08:00 MGDT-ROG kernel: [11840.710967]
[drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* ASIC reset failed with err=
or,
-22 for drm dev, 0000:0a:00.0
2019-08-03T18:51:44.719066+08:00 MGDT-ROG kernel: [11840.711014] amdgpu
0000:0a:00.0: GPU reset(1) failed
2019-08-03T18:51:44.719068+08:00 MGDT-ROG kernel: [11840.711033] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719068+08:00 MGDT-ROG kernel: [11840.711038] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719070+08:00 MGDT-ROG kernel: [11840.711040] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719071+08:00 MGDT-ROG kernel: [11840.711043] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719072+08:00 MGDT-ROG kernel: [11840.711045] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719073+08:00 MGDT-ROG kernel: [11840.711049] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719075+08:00 MGDT-ROG kernel: [11840.711051] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719076+08:00 MGDT-ROG kernel: [11840.711053] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719077+08:00 MGDT-ROG kernel: [11840.711057] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719078+08:00 MGDT-ROG kernel: [11840.711059] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719079+08:00 MGDT-ROG kernel: [11840.711061] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719080+08:00 MGDT-ROG kernel: [11840.711064] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719081+08:00 MGDT-ROG kernel: [11840.711066] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719082+08:00 MGDT-ROG kernel: [11840.711068] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719083+08:00 MGDT-ROG kernel: [11840.711072] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719084+08:00 MGDT-ROG kernel: [11840.711075] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719085+08:00 MGDT-ROG kernel: [11840.711077] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719086+08:00 MGDT-ROG kernel: [11840.711080] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719087+08:00 MGDT-ROG kernel: [11840.711083] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719088+08:00 MGDT-ROG kernel: [11840.711085] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719089+08:00 MGDT-ROG kernel: [11840.711087] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719090+08:00 MGDT-ROG kernel: [11840.711090] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719091+08:00 MGDT-ROG kernel: [11840.711092] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719092+08:00 MGDT-ROG kernel: [11840.711094] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719093+08:00 MGDT-ROG kernel: [11840.711096] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719094+08:00 MGDT-ROG kernel: [11840.711097] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719095+08:00 MGDT-ROG kernel: [11840.711100] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719096+08:00 MGDT-ROG kernel: [11840.711102] amdgpu
0000:0a:00.0: GPU reset end with ret =3D -22
2019-08-03T18:51:44.719097+08:00 MGDT-ROG kernel: [11840.711102] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719098+08:00 MGDT-ROG kernel: [11840.711104] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719099+08:00 MGDT-ROG kernel: [11840.711106] [drm] Skip
scheduling IBs!
2019-08-03T18:51:54.767980+08:00 MGDT-ROG kernel: [11850.756186]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D2324986, emitted seq=3D2324986
2019-08-03T18:51:54.767994+08:00 MGDT-ROG kernel: [11850.756247]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process X p=
id
2132 thread X:cs0 pid 2139
2019-08-03T18:51:54.767996+08:00 MGDT-ROG kernel: [11850.756251] amdgpu
0000:0a:00.0: GPU reset begin!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648393552.c39C0F3Ed.28674
Date: Sat, 3 Aug 2019 13:35:55 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c72">Comme=
nt # 72</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>After a few weeks without crashes on Ubuntu Budgie 18.04 LTS w=
ith valve
mesa-aco, I moved to another distribution that does not have valve mesa-aco=
 to
cross check.

This is what I am using:
OS: openSUSE Tumbleweed x86_64=20
Kernel: 5.2.2-1-default
Resolution: 3440x1440
DE: Xfce
WM: Xfwm4
CPU: AMD Ryzen 7 2700X (16) &#64; 3.700GHz
GPU: AMD ATI Radeon VII
Memory: 1644MiB / 64387MiB=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.3
No kernel parameters configured, just out of the box openSUSE

I had 3 of full OS freezes:

1. As I was playing Albion Online (Native) No full system freeze, I was abl=
e to
drop to tty, and notice this error: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR*
Failed to initialize parser -125!

2. As I closed down Albion Online (Native) and returned to desktop. Full Sy=
stem
Freeze

3. As I was doing regular desktop operations on XFCE. No 3d gaming going on.
Please see below logs:

DMESG after crash:

ilvipero&#64;MGDT-ROG:~&gt; dmesg | grep amdgpu
[    5.758450] [drm] amdgpu kernel modesetting enabled.
[    5.758569] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -&gt; 0xefffffff
[    5.758570] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -&gt; 0xf01fffff
[    5.758571] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfcd00000 -&gt; 0xfcd7ffff
[    5.758573] fb0: switching to amdgpudrmfb from EFI VGA
[    5.758646] amdgpu 0000:0a:00.0: vgaarb: deactivate vga console
[    5.758826] amdgpu 0000:0a:00.0: No more image in the PCI ROM
[    5.758870] amdgpu 0000:0a:00.0: VRAM: 16368M 0x0000008000000000 -
0x00000083FEFFFFFF (16368M used)
[    5.758871] amdgpu 0000:0a:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    5.758872] amdgpu 0000:0a:00.0: AGP: 267894784M 0x0000008400000000 -
0x0000FFFFFFFFFFFF
[    5.758936] [drm] amdgpu: 16368M of VRAM memory ready
[    5.758938] [drm] amdgpu: 16368M of GTT memory ready.
[    5.759204] amdgpu 0000:0a:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
&quot;amdgpu/vega20_ta.bin&quot;
[    6.855053] fbcon: amdgpudrmfb (fb0) is primary device
[    6.913835] amdgpu 0000:0a:00.0: fb0: amdgpudrmfb frame buffer device
[    6.928054] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[    6.928055] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    6.928056] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    6.928056] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    6.928057] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    6.928058] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    6.928059] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    6.928059] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    6.928060] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    6.928060] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    6.928061] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    6.928062] amdgpu 0000:0a:00.0: ring page0 uses VM inv eng 1 on hub 1
[    6.928063] amdgpu 0000:0a:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    6.928063] amdgpu 0000:0a:00.0: ring page1 uses VM inv eng 5 on hub 1
[    6.928064] amdgpu 0000:0a:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    6.928064] amdgpu 0000:0a:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    6.928065] amdgpu 0000:0a:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    6.928066] amdgpu 0000:0a:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    6.928066] amdgpu 0000:0a:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    6.928067] amdgpu 0000:0a:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    6.928067] amdgpu 0000:0a:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    6.928068] amdgpu 0000:0a:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    6.928068] amdgpu 0000:0a:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    7.609167] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:0a:00.0 on
minor 0

system logs:

2019-08-03T18:51:21.779695+08:00 MGDT-ROG kernel: [11817.727681] pcieport
0000:00:03.1: AER: Multiple Corrected error received: 0000:00:00.0
2019-08-03T18:51:21.779730+08:00 MGDT-ROG kernel: [11817.771355] pcieport
0000:00:03.1: AER: PCIe Bus Error: severity=3DCorrected, type=3DData Link L=
ayer,
(Transmitter ID)
2019-08-03T18:51:21.779735+08:00 MGDT-ROG kernel: [11817.771358] pcieport
0000:00:03.1: AER:   device [1022:1453] error status/mask=3D00003100/000060=
00
2019-08-03T18:51:21.779737+08:00 MGDT-ROG kernel: [11817.771361] pcieport
0000:00:03.1: AER:    [ 8] Rollover=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
2019-08-03T18:51:21.779738+08:00 MGDT-ROG kernel: [11817.771371] pcieport
0000:00:03.1: AER:    [12] Timeout=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
2019-08-03T18:51:26.721833+08:00 MGDT-ROG sudo: pam_unix(sudo:session): ses=
sion
closed for user root
2019-08-03T18:51:31.983837+08:00 MGDT-ROG kernel: [11827.971739]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D2324984, emitted seq=3D2324986
2019-08-03T18:51:31.983851+08:00 MGDT-ROG kernel: [11827.971800]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process X p=
id
2132 thread X:cs0 pid 2139
2019-08-03T18:51:31.983853+08:00 MGDT-ROG kernel: [11827.971804] amdgpu
0000:0a:00.0: GPU reset begin!
2019-08-03T18:51:32.751834+08:00 MGDT-ROG kernel: [11828.741066] amdgpu:
[powerplay] Failed to send message 0x47, response 0xffffffff
2019-08-03T18:51:32.751846+08:00 MGDT-ROG kernel: [11828.741077] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751849+08:00 MGDT-ROG kernel: [11828.741078] amdgpu:
[powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!
2019-08-03T18:51:32.751850+08:00 MGDT-ROG kernel: [11828.741090] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751852+08:00 MGDT-ROG kernel: [11828.741091] amdgpu:
[powerplay] Attempt to set Hard Min for DCEFCLK Failed!
2019-08-03T18:51:32.751854+08:00 MGDT-ROG kernel: [11828.741102] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:32.751855+08:00 MGDT-ROG kernel: [11828.741102] amdgpu:
[powerplay] [SetHardMinFreq] Set hard min uclk failed!
2019-08-03T18:51:32.751856+08:00 MGDT-ROG kernel: [11828.741113] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:32.751858+08:00 MGDT-ROG kernel: [11828.741114] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:32.751859+08:00 MGDT-ROG kernel: [11828.741114] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:32.787843+08:00 MGDT-ROG kernel: [11828.775671] [drm] REG_=
WAIT
timeout 10us * 3000 tries - dce110_stream_encoder_dp_blank line:951
2019-08-03T18:51:32.787852+08:00 MGDT-ROG kernel: [11828.775672] ----------=
--[
cut here ]------------
2019-08-03T18:51:32.787853+08:00 MGDT-ROG kernel: [11828.775778] WARNING: C=
PU:
1 PID: 10195 at drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
2019-08-03T18:51:32.787855+08:00 MGDT-ROG kernel: [11828.775779] Modules li=
nked
in: tun fuse af_packet ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables x_tables bpfilter uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common snd_usbmidi_=
lib
videodev snd_rawmidi snd_seq_device media joydev scsi_transport_iscsi msr
nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd kvm irqbypass
snd_hda_codec_realtek crct10dif_pclmul snd_hda_codec_generic crc32_pclmul
ledtrig_audio snd_hda_codec_hdmi ghash_clmulni_intel snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep aesni_intel eeepc_wmi asus_wmi aes_x86=
_64
sparse_keymap snd_pcm crypto_simd rfkill cryptd video glue_helper wmi_bmof
mxm_wmi igb snd_timer sp5100_tco snd ptp pcspkr i2c_piix4 pps_core dca k10t=
emp
ccp soundcore gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpufreq btrfs
libcrc32c xor hid_generic usbhid amdgpu raid6_pq amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
xhci_pci drm
2019-08-03T18:51:32.787858+08:00 MGDT-ROG kernel: [11828.775807]  crc32c_in=
tel
xhci_hcd usbcore sr_mod cdrom wmi pinctrl_amd l2tp_ppp l2tp_netlink l2tp_co=
re
ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
2019-08-03T18:51:32.787860+08:00 MGDT-ROG kernel: [11828.775817] CPU: 1 PID:
10195 Comm: kworker/1:0 Not tainted 5.2.3-1-default #1 openSUSE Tumbleweed
(unreleased)
2019-08-03T18:51:32.787861+08:00 MGDT-ROG kernel: [11828.775818] Hardware n=
ame:
System manufacturer System Product Name/ROG STRIX X470-F GAMING, BIOS 5007
06/17/2019
2019-08-03T18:51:32.787862+08:00 MGDT-ROG kernel: [11828.775822] Workqueue:
events drm_sched_job_timedout [gpu_sched]
2019-08-03T18:51:32.787863+08:00 MGDT-ROG kernel: [11828.775897] RIP:
0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
2019-08-03T18:51:32.787864+08:00 MGDT-ROG kernel: [11828.775899] Code: 4c 2=
4 18
44 89 fa 89 ee 48 c7 c7 68 7c 75 c0 e8 e9 71 84 f4 83 7b 20 01 0f 84 2b 1b =
fe
ff 48 c7 c7 d8 7b 75 c0 e8 d3 71 84 f4 &lt;0f&gt; 0b e9 18 1b fe ff 48 c7 c=
7 d8 7b 75
c0 89 54 24 04 e8 bc 71 84
2019-08-03T18:51:32.787866+08:00 MGDT-ROG kernel: [11828.775901] RSP:
0018:ffffab7acdeb77e8 EFLAGS: 00010282
2019-08-03T18:51:32.787867+08:00 MGDT-ROG kernel: [11828.775902] RAX:
0000000000000024 RBX: ffff960e92c3c880 RCX: 0000000000000006
2019-08-03T18:51:32.787868+08:00 MGDT-ROG kernel: [11828.775903] RDX:
0000000000000007 RSI: 0000000000000096 RDI: ffff960e9e659a10
2019-08-03T18:51:32.787869+08:00 MGDT-ROG kernel: [11828.775903] RBP:
000000000000000a R08: 00000000000004da R09: 0000000000000001
2019-08-03T18:51:32.787870+08:00 MGDT-ROG kernel: [11828.775904] R10:
0000000000000000 R11: 0000000000000001 R12: 0000000000004ee2
2019-08-03T18:51:32.787871+08:00 MGDT-ROG kernel: [11828.775905] R13:
0000000000000bb9 R14: 0000000000000000 R15: 0000000000000bb8
2019-08-03T18:51:32.787872+08:00 MGDT-ROG kernel: [11828.775906] FS:=20
0000000000000000(0000) GS:ffff960e9e640000(0000) knlGS:0000000000000000
2019-08-03T18:51:32.787874+08:00 MGDT-ROG kernel: [11828.775907] CS:  0010 =
DS:
0000 ES: 0000 CR0: 0000000080050033
2019-08-03T18:51:32.787874+08:00 MGDT-ROG kernel: [11828.775907] CR2:
000055d4170da000 CR3: 0000000f03cd6000 CR4: 00000000003406e0
2019-08-03T18:51:32.787875+08:00 MGDT-ROG kernel: [11828.775908] Call Trace:
2019-08-03T18:51:32.787876+08:00 MGDT-ROG kernel: [11828.775982]=20
dce110_stream_encoder_dp_blank+0xda/0x120 [amdgpu]
2019-08-03T18:51:32.787877+08:00 MGDT-ROG kernel: [11828.776049]=20
core_link_disable_stream+0x32/0x260 [amdgpu]
2019-08-03T18:51:32.787878+08:00 MGDT-ROG kernel: [11828.776054]  ?
printk+0x48/0x4a
2019-08-03T18:51:32.787879+08:00 MGDT-ROG kernel: [11828.776119]=20
dce110_reset_hw_ctx_wrap+0xc1/0x1e0 [amdgpu]
2019-08-03T18:51:32.787881+08:00 MGDT-ROG kernel: [11828.776192]  ?
vega20_dpm_force_dpm_level.cold+0x5b/0x90 [amdgpu]
2019-08-03T18:51:32.787882+08:00 MGDT-ROG kernel: [11828.776256]=20
dce110_apply_ctx_to_hw+0x3a/0x470 [amdgpu]
2019-08-03T18:51:32.787883+08:00 MGDT-ROG kernel: [11828.776318]  ?
hwmgr_handle_task+0x66/0xc0 [amdgpu]
2019-08-03T18:51:32.787884+08:00 MGDT-ROG kernel: [11828.776322]  ?
mutex_lock+0xe/0x30
2019-08-03T18:51:32.787885+08:00 MGDT-ROG kernel: [11828.776385]  ?
pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
2019-08-03T18:51:32.787886+08:00 MGDT-ROG kernel: [11828.776450]  ?
dm_pp_apply_display_requirements+0x1a1/0x1c0 [amdgpu]
2019-08-03T18:51:32.787887+08:00 MGDT-ROG kernel: [11828.776513]=20
dc_commit_state_no_check+0x200/0x530 [amdgpu]
2019-08-03T18:51:32.787888+08:00 MGDT-ROG kernel: [11828.776516]  ?
get_page_from_freelist+0x289/0x380
2019-08-03T18:51:32.787889+08:00 MGDT-ROG kernel: [11828.776579]=20
dc_commit_state+0x8f/0xb0 [amdgpu]
2019-08-03T18:51:32.787889+08:00 MGDT-ROG kernel: [11828.776644]=20
amdgpu_dm_atomic_commit_tail+0x3a6/0xd30 [amdgpu]
2019-08-03T18:51:32.787890+08:00 MGDT-ROG kernel: [11828.776709]  ?
bw_calcs+0x8ac/0x1440 [amdgpu]
2019-08-03T18:51:32.787892+08:00 MGDT-ROG kernel: [11828.776711]  ?
__ww_mutex_lock.isra.0+0x2a/0x780
2019-08-03T18:51:32.787893+08:00 MGDT-ROG kernel: [11828.776714]  ?
_raw_spin_unlock_irqrestore+0x24/0x40
2019-08-03T18:51:32.787893+08:00 MGDT-ROG kernel: [11828.776717]  ?
__wake_up_common_lock+0x7c/0xa0
2019-08-03T18:51:32.787894+08:00 MGDT-ROG kernel: [11828.776719]  ?
wait_for_completion_timeout+0xf3/0x110
2019-08-03T18:51:32.787895+08:00 MGDT-ROG kernel: [11828.776720]  ?
wait_for_completion_interruptible+0x10b/0x150
2019-08-03T18:51:32.787896+08:00 MGDT-ROG kernel: [11828.776728]  ?
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:32.787897+08:00 MGDT-ROG kernel: [11828.776735]=20
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:32.787898+08:00 MGDT-ROG kernel: [11828.776742]=20
drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
2019-08-03T18:51:32.787899+08:00 MGDT-ROG kernel: [11828.776749]=20
drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
2019-08-03T18:51:32.787900+08:00 MGDT-ROG kernel: [11828.776756]=20
drm_atomic_helper_suspend+0x4c/0xe0 [drm_kms_helper]
2019-08-03T18:51:32.787901+08:00 MGDT-ROG kernel: [11828.776820]=20
dm_suspend+0x20/0x60 [amdgpu]
2019-08-03T18:51:32.787902+08:00 MGDT-ROG kernel: [11828.776861]=20
amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
2019-08-03T18:51:32.787903+08:00 MGDT-ROG kernel: [11828.776903]=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
2019-08-03T18:51:32.787904+08:00 MGDT-ROG kernel: [11828.776975]=20
amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
2019-08-03T18:51:32.787905+08:00 MGDT-ROG kernel: [11828.777047]=20
amdgpu_device_gpu_recover+0x67/0x765 [amdgpu]
2019-08-03T18:51:32.787906+08:00 MGDT-ROG kernel: [11828.777106]=20
amdgpu_job_timedout+0xf7/0x120 [amdgpu]
2019-08-03T18:51:32.787906+08:00 MGDT-ROG kernel: [11828.777110]=20
drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
2019-08-03T18:51:32.787907+08:00 MGDT-ROG kernel: [11828.777113]=20
process_one_work+0x1df/0x3c0
2019-08-03T18:51:32.787908+08:00 MGDT-ROG kernel: [11828.777115]=20
worker_thread+0x4d/0x400
2019-08-03T18:51:32.787909+08:00 MGDT-ROG kernel: [11828.777117]=20
kthread+0xf9/0x130
2019-08-03T18:51:32.787910+08:00 MGDT-ROG kernel: [11828.777119]  ?
process_one_work+0x3c0/0x3c0
2019-08-03T18:51:32.787911+08:00 MGDT-ROG kernel: [11828.777120]  ?
kthread_park+0x80/0x80
2019-08-03T18:51:32.787912+08:00 MGDT-ROG kernel: [11828.777122]=20
ret_from_fork+0x27/0x50
2019-08-03T18:51:32.787913+08:00 MGDT-ROG kernel: [11828.777125] ---[ end t=
race
9aaf1f62ae398b4b ]---
2019-08-03T18:51:37.791882+08:00 MGDT-ROG kernel: [11833.780084]
[drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 5s=
ecs
aborting
2019-08-03T18:51:37.791896+08:00 MGDT-ROG kernel: [11833.780129]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing B0B0 (len 2971, WS 4, PS 0) &#64; 0xB963
2019-08-03T18:51:37.791898+08:00 MGDT-ROG kernel: [11833.780172]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing AFB0 (len 255, WS 4, PS 0) &#64; 0xB089
2019-08-03T18:51:37.791899+08:00 MGDT-ROG kernel: [11833.780240]
[drm:dce110_link_encoder_disable_output [amdgpu]] *ERROR*
dce110_link_encoder_disable_output: Failed to execute VBIOS command table!
2019-08-03T18:51:37.791901+08:00 MGDT-ROG kernel: [11833.780240] ----------=
--[
cut here ]------------
2019-08-03T18:51:37.791902+08:00 MGDT-ROG kernel: [11833.780328] WARNING: C=
PU:
1 PID: 10195 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:1096
dce110_link_encoder_disable_output+0x13d/0x150 [amdgpu]
2019-08-03T18:51:37.791903+08:00 MGDT-ROG kernel: [11833.780329] Modules li=
nked
in: tun fuse af_packet ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables x_tables bpfilter uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 snd_usb_audio videobuf2_common snd_usbmidi_=
lib
videodev snd_rawmidi snd_seq_device media joydev scsi_transport_iscsi msr
nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd kvm irqbypass
snd_hda_codec_realtek crct10dif_pclmul snd_hda_codec_generic crc32_pclmul
ledtrig_audio snd_hda_codec_hdmi ghash_clmulni_intel snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep aesni_intel eeepc_wmi asus_wmi aes_x86=
_64
sparse_keymap snd_pcm crypto_simd rfkill cryptd video glue_helper wmi_bmof
mxm_wmi igb snd_timer sp5100_tco snd ptp pcspkr i2c_piix4 pps_core dca k10t=
emp
ccp soundcore gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpufreq btrfs
libcrc32c xor hid_generic usbhid amdgpu raid6_pq amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
xhci_pci drm
2019-08-03T18:51:37.791905+08:00 MGDT-ROG kernel: [11833.780356]  crc32c_in=
tel
xhci_hcd usbcore sr_mod cdrom wmi pinctrl_amd l2tp_ppp l2tp_netlink l2tp_co=
re
ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
2019-08-03T18:51:37.791907+08:00 MGDT-ROG kernel: [11833.780365] CPU: 1 PID:
10195 Comm: kworker/1:0 Tainted: G        W         5.2.3-1-default #1 open=
SUSE
Tumbleweed (unreleased)
2019-08-03T18:51:37.791908+08:00 MGDT-ROG kernel: [11833.780366] Hardware n=
ame:
System manufacturer System Product Name/ROG STRIX X470-F GAMING, BIOS 5007
06/17/2019
2019-08-03T18:51:37.791910+08:00 MGDT-ROG kernel: [11833.780370] Workqueue:
events drm_sched_job_timedout [gpu_sched]
2019-08-03T18:51:37.791911+08:00 MGDT-ROG kernel: [11833.780435] RIP:
0010:dce110_link_encoder_disable_output+0x13d/0x150 [amdgpu]
2019-08-03T18:51:37.791912+08:00 MGDT-ROG kernel: [11833.780437] Code: ff f=
f 48
83 c4 38 5b 5d 41 5c c3 48 c7 c6 c0 c8 6f c0 48 c7 c7 d8 d9 74 c0 e8 cf bb =
de
ff 48 c7 c7 70 d9 74 c0 e8 61 13 8c f4 &lt;0f&gt; 0b eb d4 66 66 2e 0f 1f 8=
4 00 00 00
00 00 0f 1f 40 00 0f 1f 44
2019-08-03T18:51:37.791913+08:00 MGDT-ROG kernel: [11833.780438] RSP:
0018:ffffab7acdeb77f8 EFLAGS: 00010282
2019-08-03T18:51:37.791914+08:00 MGDT-ROG kernel: [11833.780439] RAX:
0000000000000024 RBX: ffff960e96034a80 RCX: 0000000000000006
2019-08-03T18:51:37.791915+08:00 MGDT-ROG kernel: [11833.780440] RDX:
0000000000000007 RSI: 0000000000000096 RDI: ffff960e9e659a10
2019-08-03T18:51:37.791917+08:00 MGDT-ROG kernel: [11833.780441] RBP:
0000000000000020 R08: 0000000000000518 R09: 0000000000000001
2019-08-03T18:51:37.791918+08:00 MGDT-ROG kernel: [11833.780441] R10:
0000000000000000 R11: 0000000000000001 R12: ffffab7acdeb77fc
2019-08-03T18:51:37.791919+08:00 MGDT-ROG kernel: [11833.780442] R13:
ffff95ffc13c1000 R14: 0000000000000000 R15: ffff9601c92c8188
2019-08-03T18:51:37.791920+08:00 MGDT-ROG kernel: [11833.780443] FS:=20
0000000000000000(0000) GS:ffff960e9e640000(0000) knlGS:0000000000000000
2019-08-03T18:51:37.791921+08:00 MGDT-ROG kernel: [11833.780444] CS:  0010 =
DS:
0000 ES: 0000 CR0: 0000000080050033
2019-08-03T18:51:37.791922+08:00 MGDT-ROG kernel: [11833.780445] CR2:
000055d4170da000 CR3: 0000000f03cd6000 CR4: 00000000003406e0
2019-08-03T18:51:37.791923+08:00 MGDT-ROG kernel: [11833.780446] Call Trace:
2019-08-03T18:51:37.791924+08:00 MGDT-ROG kernel: [11833.780512]=20
dp_disable_link_phy+0x73/0x110 [amdgpu]
2019-08-03T18:51:37.791925+08:00 MGDT-ROG kernel: [11833.780576]=20
core_link_disable_stream+0xb6/0x260 [amdgpu]
2019-08-03T18:51:37.791926+08:00 MGDT-ROG kernel: [11833.780580]  ?
printk+0x48/0x4a
2019-08-03T18:51:37.791927+08:00 MGDT-ROG kernel: [11833.780642]=20
dce110_reset_hw_ctx_wrap+0xc1/0x1e0 [amdgpu]
2019-08-03T18:51:37.791928+08:00 MGDT-ROG kernel: [11833.780716]  ?
vega20_dpm_force_dpm_level.cold+0x5b/0x90 [amdgpu]
2019-08-03T18:51:37.791929+08:00 MGDT-ROG kernel: [11833.780779]=20
dce110_apply_ctx_to_hw+0x3a/0x470 [amdgpu]
2019-08-03T18:51:37.791930+08:00 MGDT-ROG kernel: [11833.780840]  ?
hwmgr_handle_task+0x66/0xc0 [amdgpu]
2019-08-03T18:51:37.791931+08:00 MGDT-ROG kernel: [11833.780843]  ?
mutex_lock+0xe/0x30
2019-08-03T18:51:37.791933+08:00 MGDT-ROG kernel: [11833.780905]  ?
pp_dpm_dispatch_tasks+0x45/0x60 [amdgpu]
2019-08-03T18:51:37.791934+08:00 MGDT-ROG kernel: [11833.780969]  ?
dm_pp_apply_display_requirements+0x1a1/0x1c0 [amdgpu]
2019-08-03T18:51:37.791935+08:00 MGDT-ROG kernel: [11833.781032]=20
dc_commit_state_no_check+0x200/0x530 [amdgpu]
2019-08-03T18:51:37.791936+08:00 MGDT-ROG kernel: [11833.781036]  ?
get_page_from_freelist+0x289/0x380
2019-08-03T18:51:37.791937+08:00 MGDT-ROG kernel: [11833.781098]=20
dc_commit_state+0x8f/0xb0 [amdgpu]
2019-08-03T18:51:37.791938+08:00 MGDT-ROG kernel: [11833.781162]=20
amdgpu_dm_atomic_commit_tail+0x3a6/0xd30 [amdgpu]
2019-08-03T18:51:37.791939+08:00 MGDT-ROG kernel: [11833.781227]  ?
bw_calcs+0x8ac/0x1440 [amdgpu]
2019-08-03T18:51:37.791940+08:00 MGDT-ROG kernel: [11833.781229]  ?
__ww_mutex_lock.isra.0+0x2a/0x780
2019-08-03T18:51:37.791941+08:00 MGDT-ROG kernel: [11833.781231]  ?
_raw_spin_unlock_irqrestore+0x24/0x40
2019-08-03T18:51:37.791942+08:00 MGDT-ROG kernel: [11833.781234]  ?
__wake_up_common_lock+0x7c/0xa0
2019-08-03T18:51:37.791943+08:00 MGDT-ROG kernel: [11833.781236]  ?
wait_for_completion_timeout+0xf3/0x110
2019-08-03T18:51:37.791944+08:00 MGDT-ROG kernel: [11833.781237]  ?
wait_for_completion_interruptible+0x10b/0x150
2019-08-03T18:51:37.791945+08:00 MGDT-ROG kernel: [11833.781245]  ?
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:37.791946+08:00 MGDT-ROG kernel: [11833.781251]=20
commit_tail+0x3c/0x70 [drm_kms_helper]
2019-08-03T18:51:37.791947+08:00 MGDT-ROG kernel: [11833.781258]=20
drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
2019-08-03T18:51:37.791948+08:00 MGDT-ROG kernel: [11833.781265]=20
drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
2019-08-03T18:51:37.791949+08:00 MGDT-ROG kernel: [11833.781272]=20
drm_atomic_helper_suspend+0x4c/0xe0 [drm_kms_helper]
2019-08-03T18:51:37.791950+08:00 MGDT-ROG kernel: [11833.781335]=20
dm_suspend+0x20/0x60 [amdgpu]
2019-08-03T18:51:37.791951+08:00 MGDT-ROG kernel: [11833.781377]=20
amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
2019-08-03T18:51:37.791952+08:00 MGDT-ROG kernel: [11833.781418]=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
2019-08-03T18:51:37.791953+08:00 MGDT-ROG kernel: [11833.781490]=20
amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
2019-08-03T18:51:37.791954+08:00 MGDT-ROG kernel: [11833.781561]=20
amdgpu_device_gpu_recover+0x67/0x765 [amdgpu]
2019-08-03T18:51:37.791955+08:00 MGDT-ROG kernel: [11833.781620]=20
amdgpu_job_timedout+0xf7/0x120 [amdgpu]
2019-08-03T18:51:37.791956+08:00 MGDT-ROG kernel: [11833.781624]=20
drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
2019-08-03T18:51:37.791957+08:00 MGDT-ROG kernel: [11833.781627]=20
process_one_work+0x1df/0x3c0
2019-08-03T18:51:37.791958+08:00 MGDT-ROG kernel: [11833.781629]=20
worker_thread+0x4d/0x400
2019-08-03T18:51:37.791959+08:00 MGDT-ROG kernel: [11833.781631]=20
kthread+0xf9/0x130
2019-08-03T18:51:37.791960+08:00 MGDT-ROG kernel: [11833.781633]  ?
process_one_work+0x3c0/0x3c0
2019-08-03T18:51:37.791961+08:00 MGDT-ROG kernel: [11833.781634]  ?
kthread_park+0x80/0x80
2019-08-03T18:51:37.791962+08:00 MGDT-ROG kernel: [11833.781636]=20
ret_from_fork+0x27/0x50
2019-08-03T18:51:37.791963+08:00 MGDT-ROG kernel: [11833.781639] ---[ end t=
race
9aaf1f62ae398b4c ]---
2019-08-03T18:51:42.796019+08:00 MGDT-ROG kernel: [11838.784083]
[drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 5s=
ecs
aborting
2019-08-03T18:51:42.796034+08:00 MGDT-ROG kernel: [11838.784127]
[drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
executing A048 (len 62, WS 0, PS 0) &#64; 0xA064
2019-08-03T18:51:42.796035+08:00 MGDT-ROG kernel: [11838.784208] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796036+08:00 MGDT-ROG kernel: [11838.784219] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796038+08:00 MGDT-ROG kernel: [11838.784233] amdgpu:
[powerplay] Failed to send message 0x47, response 0xffffffff
2019-08-03T18:51:42.796039+08:00 MGDT-ROG kernel: [11838.784245] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796040+08:00 MGDT-ROG kernel: [11838.784245] amdgpu:
[powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!
2019-08-03T18:51:42.796041+08:00 MGDT-ROG kernel: [11838.784258] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796042+08:00 MGDT-ROG kernel: [11838.784258] amdgpu:
[powerplay] Attempt to set Hard Min for DCEFCLK Failed!
2019-08-03T18:51:42.796044+08:00 MGDT-ROG kernel: [11838.784269] amdgpu:
[powerplay] Failed to send message 0x28, response 0xffffffff
2019-08-03T18:51:42.796045+08:00 MGDT-ROG kernel: [11838.784270] amdgpu:
[powerplay] [SetHardMinFreq] Set hard min uclk failed!
2019-08-03T18:51:42.796046+08:00 MGDT-ROG kernel: [11838.784281] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:42.796047+08:00 MGDT-ROG kernel: [11838.784282] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:42.796048+08:00 MGDT-ROG kernel: [11838.784282] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:43.656061+08:00 MGDT-ROG kernel: [11839.645436] amdgpu:
[powerplay] Failed to send message 0x26, response 0xffffffff
2019-08-03T18:51:43.656078+08:00 MGDT-ROG kernel: [11839.645438] amdgpu:
[powerplay] Failed to set soft min gfxclk !
2019-08-03T18:51:43.656080+08:00 MGDT-ROG kernel: [11839.645438] amdgpu:
[powerplay] Failed to upload DPM Bootup Levels!
2019-08-03T18:51:43.656081+08:00 MGDT-ROG kernel: [11839.645449] amdgpu:
[powerplay] Failed to send message 0x7, response 0xffffffff
2019-08-03T18:51:43.656082+08:00 MGDT-ROG kernel: [11839.645450] amdgpu:
[powerplay] [DisableAllSMUFeatures] Failed to disable all smu features!
2019-08-03T18:51:43.656083+08:00 MGDT-ROG kernel: [11839.645450] amdgpu:
[powerplay] [DisableDpmTasks] Failed to disable all smu features!
2019-08-03T18:51:43.656084+08:00 MGDT-ROG kernel: [11839.645451] amdgpu:
[powerplay] [PowerOffAsic] Failed to disable DPM!
2019-08-03T18:51:43.656086+08:00 MGDT-ROG kernel: [11839.645497]
[drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspend of IP block
&lt;powerplay&gt; failed -5
2019-08-03T18:51:43.911990+08:00 MGDT-ROG kernel: [11839.902893] amdgpu
0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0
test failed (-110)
2019-08-03T18:51:43.912001+08:00 MGDT-ROG kernel: [11839.902947]
[drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
2019-08-03T18:51:44.167806+08:00 MGDT-ROG kernel: [11840.159797] [drm] Time=
out
wait for RLC serdes 0,0
2019-08-03T18:51:44.191826+08:00 MGDT-ROG kernel: [11840.180793] amdgpu
0000:0a:00.0: GPU mode1 reset
2019-08-03T18:51:44.451982+08:00 MGDT-ROG kernel: [11840.442308] [drm] psp =
is
not working correctly before mode1 reset!
2019-08-03T18:51:44.451993+08:00 MGDT-ROG kernel: [11840.442310] amdgpu
0000:0a:00.0: GPU mode1 reset failed
2019-08-03T18:51:44.719056+08:00 MGDT-ROG kernel: [11840.710967]
[drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* ASIC reset failed with err=
or,
-22 for drm dev, 0000:0a:00.0
2019-08-03T18:51:44.719066+08:00 MGDT-ROG kernel: [11840.711014] amdgpu
0000:0a:00.0: GPU reset(1) failed
2019-08-03T18:51:44.719068+08:00 MGDT-ROG kernel: [11840.711033] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719068+08:00 MGDT-ROG kernel: [11840.711038] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719070+08:00 MGDT-ROG kernel: [11840.711040] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719071+08:00 MGDT-ROG kernel: [11840.711043] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719072+08:00 MGDT-ROG kernel: [11840.711045] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719073+08:00 MGDT-ROG kernel: [11840.711049] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719075+08:00 MGDT-ROG kernel: [11840.711051] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719076+08:00 MGDT-ROG kernel: [11840.711053] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719077+08:00 MGDT-ROG kernel: [11840.711057] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719078+08:00 MGDT-ROG kernel: [11840.711059] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719079+08:00 MGDT-ROG kernel: [11840.711061] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719080+08:00 MGDT-ROG kernel: [11840.711064] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719081+08:00 MGDT-ROG kernel: [11840.711066] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719082+08:00 MGDT-ROG kernel: [11840.711068] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719083+08:00 MGDT-ROG kernel: [11840.711072] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719084+08:00 MGDT-ROG kernel: [11840.711075] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719085+08:00 MGDT-ROG kernel: [11840.711077] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719086+08:00 MGDT-ROG kernel: [11840.711080] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719087+08:00 MGDT-ROG kernel: [11840.711083] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719088+08:00 MGDT-ROG kernel: [11840.711085] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719089+08:00 MGDT-ROG kernel: [11840.711087] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719090+08:00 MGDT-ROG kernel: [11840.711090] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719091+08:00 MGDT-ROG kernel: [11840.711092] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719092+08:00 MGDT-ROG kernel: [11840.711094] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719093+08:00 MGDT-ROG kernel: [11840.711096] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719094+08:00 MGDT-ROG kernel: [11840.711097] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719095+08:00 MGDT-ROG kernel: [11840.711100] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719096+08:00 MGDT-ROG kernel: [11840.711102] amdgpu
0000:0a:00.0: GPU reset end with ret =3D -22
2019-08-03T18:51:44.719097+08:00 MGDT-ROG kernel: [11840.711102] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719098+08:00 MGDT-ROG kernel: [11840.711104] [drm] Skip
scheduling IBs!
2019-08-03T18:51:44.719099+08:00 MGDT-ROG kernel: [11840.711106] [drm] Skip
scheduling IBs!
2019-08-03T18:51:54.767980+08:00 MGDT-ROG kernel: [11850.756186]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D2324986, emitted seq=3D2324986
2019-08-03T18:51:54.767994+08:00 MGDT-ROG kernel: [11850.756247]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process X p=
id
2132 thread X:cs0 pid 2139
2019-08-03T18:51:54.767996+08:00 MGDT-ROG kernel: [11850.756251] amdgpu
0000:0a:00.0: GPU reset begin!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648393552.c39C0F3Ed.28674--

--===============0210398302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0210398302==--
