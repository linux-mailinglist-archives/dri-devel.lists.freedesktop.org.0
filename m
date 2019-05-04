Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02513773
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 06:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4411C89613;
	Sat,  4 May 2019 04:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2911089613
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 04:27:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BA80B721AA; Sat,  4 May 2019 04:26:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110604] AMX WX4150 hangs in aux_read call for REG_RC_CAP
Date: Sat, 04 May 2019 04:26:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: pritchard.jason@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110604-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0928113227=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0928113227==
Content-Type: multipart/alternative; boundary="15569440191.35B3e8d9A.15377"
Content-Transfer-Encoding: 7bit


--15569440191.35B3e8d9A.15377
Date: Sat, 4 May 2019 04:26:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110604

            Bug ID: 110604
           Summary: AMX WX4150 hangs in aux_read call for REG_RC_CAP
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pritchard.jason@gmail.com

Created attachment 144154
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144154&action=3Dedit
Test file: read-dpcd.c

While working with the Ubuntu maintainers of fwupd, they've determined that=
 I
have an issue with the AMD driver on Ubuntu's 5.0 kernel in 19.04. In the
sample program that they provided (see read-dpcd.c attached) the call to
aux_read(fd, REG_RC_CAP, buf, 1) hangs on my machine. They recommended I po=
st
the issue here.

Machine is a Dell 7730 with AMD WX4150 graphics.

See the original bug report here:
https://bugs.launchpad.net/ubuntu/+source/fwupd/+bug/1826691


Not sure if it's related, but here are dmesg warnings from the other ticket.

Apr 23 19:29:14 texas kernel: [ 133.673290] [drm] REG_WAIT timeout 10us * 1=
60
tries - submit_channel_request line:246
Apr 23 19:29:14 texas kernel: [ 133.673348] WARNING: CPU: 6 PID: 2467 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:249
generic_reg_wait.cold.3+0x25/0x2c [amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673349] Modules linked in: thunderbolt
rfcomm xt_owner ip6table_filter ip6_tables ipt_MASQUERADE iptable_nat
nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bri=
dge
xt_CHECKSUM xt_tcpudp stp llc iptable_filter iptable_mangle bpfilter ccm
snd_hda_codec_realtek snd_hda_codec_generic pci_stub vboxpci(OE) vboxnetadp=
(OE)
vboxnetflt(OE) cmac vboxdrv(OE) bnep binfmt_misc dell_rbtn nls_iso8859_1 jo=
ydev
arc4 snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_skl_ipc
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi
snd_soc_core snd_compress ac97_bus intel_rapl snd_pcm_dmaengine
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_hdmi kvm_intel
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep crct10dif_pclmul i915
snd_pcm crc32_pclmul iwlmvm uvcvideo amdgpu snd_seq_midi ghash_clmulni_intel
snd_seq_midi_event mac80211 videobuf2_vmalloc kvmgt videobuf2_memops vfio_m=
dev
videobuf2_v4l2 snd_rawmidi dell_laptop mdev videobuf2_common
Apr 23 19:29:14 texas kernel: [ 133.673362] ledtrig_audio vfio_iommu_type1
videodev dell_smm_hwmon vfio snd_seq dell_wmi media kvm chash btusb
snd_seq_device amd_iommu_v2 btrtl snd_timer btbcm dell_smbios gpu_sched
irqbypass btintel dcdbas ttm aesni_intel iwlwifi bluetooth drm_kms_helper
aes_x86_64 crypto_simd cryptd glue_helper rtsx_pci_ms input_leds snd drm
ecdh_generic intel_cstate mei_me ucsi_acpi cfg80211 serio_raw
dell_wmi_descriptor intel_wmi_thunderbolt wmi_bmof memstick i2c_algo_bit mei
fb_sys_fops intel_rapl_perf idma64 syscopyarea hid_multitouch
processor_thermal_device soundcore sysfillrect virt_dma typec_ucsi sysimgblt
intel_soc_dts_iosf intel_pch_thermal typec int3403_thermal int340x_thermal_=
zone
dell_smo8800 acpi_pad intel_hid int3400_thermal mac_hid acpi_thermal_rel
sparse_keymap sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic rtsx_pci_sdmmc nvme e1000e i2c_i801 intel_lpss_pci rtsx=
_pci
nvme_core intel_lpss i2c_hid wmi hid video pinctrl_cannonlake pinctrl_intel
Apr 23 19:29:14 texas kernel: [ 133.673381] CPU: 6 PID: 2467 Comm: fwupd
Tainted: G OE 5.0.0-13-generic #14-Ubuntu
Apr 23 19:29:14 texas kernel: [ 133.673382] Hardware name: Dell Inc. Precis=
ion
7730/05W5TJ, BIOS 1.7.0 02/19/2019
Apr 23 19:29:14 texas kernel: [ 133.673417] RIP:
0010:generic_reg_wait.cold.3+0x25/0x2c [amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673418] Code: e9 37 7e fe ff 44 8b 45 2=
0 48
8b 4d 18 48 c7 c7 40 34 17 c1 8b 55 10 8b 75 d4 e8 3b ce 82 e1 41 83 7d 20 =
01
0f 84 0c c3 fe ff <0f> 0b e9 05 c3 fe ff 55 48 89 e5 e8 5d de ec ff 48 c7 c=
7 00
a0 18
Apr 23 19:29:14 texas kernel: [ 133.673419] RSP: 0018:ffffbbaa0612fbb0 EFLA=
GS:
00010297
Apr 23 19:29:14 texas kernel: [ 133.673420] RAX: 0000000000000049 RBX:
00000000000000a1 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673420] RDX: 0000000000000000 RSI:
ffff94843c196448 RDI: ffff94843c196448
Apr 23 19:29:14 texas kernel: [ 133.673420] RBP: ffffbbaa0612fbf8 R08:
0000000000000001 R09: 00000000000004fa
Apr 23 19:29:14 texas kernel: [ 133.673421] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000005c04
Apr 23 19:29:14 texas kernel: [ 133.673421] R13: ffff948431de5840 R14:
00000000ffffffff R15: ffff948431de5840
Apr 23 19:29:14 texas kernel: [ 133.673422] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673422] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.673423] CR2: 00007ff83400f6d8 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.673423] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673424] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Apr 23 19:29:14 texas kernel: [ 133.673424] Call Trace:
Apr 23 19:29:14 texas kernel: [ 133.673461] submit_channel_request+0x3fd/0x=
780
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673492] dc_link_aux_transfer+0xc6/0x150
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673526] dm_dp_aux_transfer+0x61/0x130
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673531] drm_dp_dpcd_access+0x75/0x110
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673533] drm_dp_dpcd_read+0x33/0xc0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673537] auxdev_read_iter+0xe6/0x1a0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673539] new_sync_read+0x109/0x170
Apr 23 19:29:14 texas kernel: [ 133.673541] __vfs_read+0x29/0x40
Apr 23 19:29:14 texas kernel: [ 133.673542] vfs_read+0x99/0x160
Apr 23 19:29:14 texas kernel: [ 133.673542] ksys_read+0x55/0xc0
Apr 23 19:29:14 texas kernel: [ 133.673543] __x64_sys_read+0x1a/0x20
Apr 23 19:29:14 texas kernel: [ 133.673545] do_syscall_64+0x5a/0x110
Apr 23 19:29:14 texas kernel: [ 133.673546]
entry_SYSCALL_64_after_hwframe+0x44/0xa9
Apr 23 19:29:14 texas kernel: [ 133.673547] RIP: 0033:0x7ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673548] Code: 84 00 00 00 00 00 41 54 4=
9 89
d4 55 48 89 f5 53 89 fb 48 83 ec 10 e8 5b fc ff ff 4c 89 e2 48 89 ee 89 df =
41
89 c0 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 48 89 44 24 08 e8 97 f=
c ff
ff 48
Apr 23 19:29:14 texas kernel: [ 133.673548] RSP: 002b:00007ffe268d7130 EFLA=
GS:
00000246 ORIG_RAX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673549] RAX: ffffffffffffffda RBX:
0000000000000013 RCX: 00007ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673549] RDX: 0000000000000001 RSI:
00007ffe268d7194 RDI: 0000000000000013
Apr 23 19:29:14 texas kernel: [ 133.673550] RBP: 00007ffe268d7194 R08:
0000000000000000 R09: 00007ff84cca13d0
Apr 23 19:29:14 texas kernel: [ 133.673550] R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000001
Apr 23 19:29:14 texas kernel: [ 133.673550] R13: 00007ffe268d7200 R14:
0000000000000001 R15: 000056469f7bd0e0
Apr 23 19:29:14 texas kernel: [ 133.673552] ---[ end trace b363bbe01edada49
]---
Apr 23 19:29:14 texas kernel: [ 133.673574] BUG: unable to handle kernel NU=
LL
pointer dereference at 0000000000000008
Apr 23 19:29:14 texas kernel: [ 133.673576] #PF error: [normal kernel read
fault]
Apr 23 19:29:14 texas kernel: [ 133.673577] PGD 0 P4D 0
Apr 23 19:29:14 texas kernel: [ 133.673578] Oops: 0000 [#1] SMP PTI
Apr 23 19:29:14 texas kernel: [ 133.673579] CPU: 6 PID: 2467 Comm: fwupd
Tainted: G W OE 5.0.0-13-generic #14-Ubuntu
Apr 23 19:29:14 texas kernel: [ 133.673580] Hardware name: Dell Inc. Precis=
ion
7730/05W5TJ, BIOS 1.7.0 02/19/2019
Apr 23 19:29:14 texas kernel: [ 133.673614] RIP: 0010:dal_ddc_close+0xd/0x30
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673615] Code: e8 38 f5 ff ff 48 8b 55 f=
8 65
48 33 14 25 28 00 00 00 75 02 c9 c3 e8 02 01 84 e1 66 90 0f 1f 44 00 00 55 =
48
89 e5 53 48 89 fb <48> 8b 7f 08 e8 0a f6 ff ff 48 8b 3b e8 02 f6 ff ff 5b 5=
d c3
66 2e
Apr 23 19:29:14 texas kernel: [ 133.673615] RSP: 0018:ffffbbaa0612fc28 EFLA=
GS:
00010246
Apr 23 19:29:14 texas kernel: [ 133.673616] RAX: ffffffffc1052ad0 RBX:
0000000000000000 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673617] RDX: 00000000ffffffff RSI:
0000000000005c04 RDI: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673617] RBP: ffffbbaa0612fc30 R08:
0000000000000001 R09: 000000000000000a
Apr 23 19:29:14 texas kernel: [ 133.673618] R10: 0000000000000001 R11:
0000000000000000 R12: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673618] R13: ffffbbaa0612fdc0 R14:
0000000000000000 R15: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673619] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673620] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.673620] CR2: 0000000000000008 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.673621] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673622] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Apr 23 19:29:14 texas kernel: [ 133.673622] Call Trace:
Apr 23 19:29:14 texas kernel: [ 133.673657] release_engine+0x1e/0xd0 [amdgp=
u]
Apr 23 19:29:14 texas kernel: [ 133.673687] dc_link_aux_transfer+0xfc/0x150
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673720] dm_dp_aux_transfer+0x61/0x130
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673723] drm_dp_dpcd_access+0x75/0x110
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673726] drm_dp_dpcd_read+0x33/0xc0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673730] auxdev_read_iter+0xe6/0x1a0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673731] new_sync_read+0x109/0x170
Apr 23 19:29:14 texas kernel: [ 133.673733] __vfs_read+0x29/0x40
Apr 23 19:29:14 texas kernel: [ 133.673734] vfs_read+0x99/0x160
Apr 23 19:29:14 texas kernel: [ 133.673735] ksys_read+0x55/0xc0
Apr 23 19:29:14 texas kernel: [ 133.673736] __x64_sys_read+0x1a/0x20
Apr 23 19:29:14 texas kernel: [ 133.673737] do_syscall_64+0x5a/0x110
Apr 23 19:29:14 texas kernel: [ 133.673738]
entry_SYSCALL_64_after_hwframe+0x44/0xa9
Apr 23 19:29:14 texas kernel: [ 133.673739] RIP: 0033:0x7ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673740] Code: 84 00 00 00 00 00 41 54 4=
9 89
d4 55 48 89 f5 53 89 fb 48 83 ec 10 e8 5b fc ff ff 4c 89 e2 48 89 ee 89 df =
41
89 c0 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 48 89 44 24 08 e8 97 f=
c ff
ff 48
Apr 23 19:29:14 texas kernel: [ 133.673740] RSP: 002b:00007ffe268d7130 EFLA=
GS:
00000246 ORIG_RAX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673741] RAX: ffffffffffffffda RBX:
0000000000000013 RCX: 00007ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673742] RDX: 0000000000000001 RSI:
00007ffe268d7194 RDI: 0000000000000013
Apr 23 19:29:14 texas kernel: [ 133.673742] RBP: 00007ffe268d7194 R08:
0000000000000000 R09: 00007ff84cca13d0
Apr 23 19:29:14 texas kernel: [ 133.673743] R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000001
Apr 23 19:29:14 texas kernel: [ 133.673743] R13: 00007ffe268d7200 R14:
0000000000000001 R15: 000056469f7bd0e0
Apr 23 19:29:14 texas kernel: [ 133.673744] Modules linked in: thunderbolt
rfcomm xt_owner ip6table_filter ip6_tables ipt_MASQUERADE iptable_nat
nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bri=
dge
xt_CHECKSUM xt_tcpudp stp llc iptable_filter iptable_mangle bpfilter ccm
snd_hda_codec_realtek snd_hda_codec_generic pci_stub vboxpci(OE) vboxnetadp=
(OE)
vboxnetflt(OE) cmac vboxdrv(OE) bnep binfmt_misc dell_rbtn nls_iso8859_1 jo=
ydev
arc4 snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_skl_ipc
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi
snd_soc_core snd_compress ac97_bus intel_rapl snd_pcm_dmaengine
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_hdmi kvm_intel
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep crct10dif_pclmul i915
snd_pcm crc32_pclmul iwlmvm uvcvideo amdgpu snd_seq_midi ghash_clmulni_intel
snd_seq_midi_event mac80211 videobuf2_vmalloc kvmgt videobuf2_memops vfio_m=
dev
videobuf2_v4l2 snd_rawmidi dell_laptop mdev videobuf2_common
Apr 23 19:29:14 texas kernel: [ 133.673754] ledtrig_audio vfio_iommu_type1
videodev dell_smm_hwmon vfio snd_seq dell_wmi media kvm chash btusb
snd_seq_device amd_iommu_v2 btrtl snd_timer btbcm dell_smbios gpu_sched
irqbypass btintel dcdbas ttm aesni_intel iwlwifi bluetooth drm_kms_helper
aes_x86_64 crypto_simd cryptd glue_helper rtsx_pci_ms input_leds snd drm
ecdh_generic intel_cstate mei_me ucsi_acpi cfg80211 serio_raw
dell_wmi_descriptor intel_wmi_thunderbolt wmi_bmof memstick i2c_algo_bit mei
fb_sys_fops intel_rapl_perf idma64 syscopyarea hid_multitouch
processor_thermal_device soundcore sysfillrect virt_dma typec_ucsi sysimgblt
intel_soc_dts_iosf intel_pch_thermal typec int3403_thermal int340x_thermal_=
zone
dell_smo8800 acpi_pad intel_hid int3400_thermal mac_hid acpi_thermal_rel
sparse_keymap sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic rtsx_pci_sdmmc nvme e1000e i2c_i801 intel_lpss_pci rtsx=
_pci
nvme_core intel_lpss i2c_hid wmi hid video pinctrl_cannonlake pinctrl_intel
Apr 23 19:29:14 texas kernel: [ 133.673765] CR2: 0000000000000008
Apr 23 19:29:14 texas kernel: [ 133.673766] ---[ end trace b363bbe01edada4a
]---
Apr 23 19:29:14 texas kernel: [ 133.696801] RIP: 0010:dal_ddc_close+0xd/0x30
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.696804] Code: e8 38 f5 ff ff 48 8b 55 f=
8 65
48 33 14 25 28 00 00 00 75 02 c9 c3 e8 02 01 84 e1 66 90 0f 1f 44 00 00 55 =
48
89 e5 53 48 89 fb <48> 8b 7f 08 e8 0a f6 ff ff 48 8b 3b e8 02 f6 ff ff 5b 5=
d c3
66 2e
Apr 23 19:29:14 texas kernel: [ 133.696805] RSP: 0018:ffffbbaa0612fc28 EFLA=
GS:
00010246
Apr 23 19:29:14 texas kernel: [ 133.696806] RAX: ffffffffc1052ad0 RBX:
0000000000000000 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696807] RDX: 00000000ffffffff RSI:
0000000000005c04 RDI: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696808] RBP: ffffbbaa0612fc30 R08:
0000000000000001 R09: 000000000000000a
Apr 23 19:29:14 texas kernel: [ 133.696809] R10: 0000000000000001 R11:
0000000000000000 R12: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696809] R13: ffffbbaa0612fdc0 R14:
0000000000000000 R15: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696810] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696811] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.696812] CR2: 0000000000000008 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.696813] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696813] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569440191.35B3e8d9A.15377
Date: Sat, 4 May 2019 04:26:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMX WX4150 hangs in aux_read call for REG_RC_CAP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110604">110604</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMX WX4150 hangs in aux_read call for REG_RC_CAP
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pritchard.jason&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144154=
" name=3D"attach_144154" title=3D"Test file: read-dpcd.c">attachment 144154=
</a> <a href=3D"attachment.cgi?id=3D144154&amp;action=3Dedit" title=3D"Test=
 file: read-dpcd.c">[details]</a></span>
Test file: read-dpcd.c

While working with the Ubuntu maintainers of fwupd, they've determined that=
 I
have an issue with the AMD driver on Ubuntu's 5.0 kernel in 19.04. In the
sample program that they provided (see read-dpcd.c attached) the call to
aux_read(fd, REG_RC_CAP, buf, 1) hangs on my machine. They recommended I po=
st
the issue here.

Machine is a Dell 7730 with AMD WX4150 graphics.

See the original bug report here:
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/fwupd/+bug/1826691">ht=
tps://bugs.launchpad.net/ubuntu/+source/fwupd/+bug/1826691</a>


Not sure if it's related, but here are dmesg warnings from the other ticket.

Apr 23 19:29:14 texas kernel: [ 133.673290] [drm] REG_WAIT timeout 10us * 1=
60
tries - submit_channel_request line:246
Apr 23 19:29:14 texas kernel: [ 133.673348] WARNING: CPU: 6 PID: 2467 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:249
generic_reg_wait.cold.3+0x25/0x2c [amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673349] Modules linked in: thunderbolt
rfcomm xt_owner ip6table_filter ip6_tables ipt_MASQUERADE iptable_nat
nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bri=
dge
xt_CHECKSUM xt_tcpudp stp llc iptable_filter iptable_mangle bpfilter ccm
snd_hda_codec_realtek snd_hda_codec_generic pci_stub vboxpci(OE) vboxnetadp=
(OE)
vboxnetflt(OE) cmac vboxdrv(OE) bnep binfmt_misc dell_rbtn nls_iso8859_1 jo=
ydev
arc4 snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_skl_ipc
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi
snd_soc_core snd_compress ac97_bus intel_rapl snd_pcm_dmaengine
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_hdmi kvm_intel
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep crct10dif_pclmul i915
snd_pcm crc32_pclmul iwlmvm uvcvideo amdgpu snd_seq_midi ghash_clmulni_intel
snd_seq_midi_event mac80211 videobuf2_vmalloc kvmgt videobuf2_memops vfio_m=
dev
videobuf2_v4l2 snd_rawmidi dell_laptop mdev videobuf2_common
Apr 23 19:29:14 texas kernel: [ 133.673362] ledtrig_audio vfio_iommu_type1
videodev dell_smm_hwmon vfio snd_seq dell_wmi media kvm chash btusb
snd_seq_device amd_iommu_v2 btrtl snd_timer btbcm dell_smbios gpu_sched
irqbypass btintel dcdbas ttm aesni_intel iwlwifi bluetooth drm_kms_helper
aes_x86_64 crypto_simd cryptd glue_helper rtsx_pci_ms input_leds snd drm
ecdh_generic intel_cstate mei_me ucsi_acpi cfg80211 serio_raw
dell_wmi_descriptor intel_wmi_thunderbolt wmi_bmof memstick i2c_algo_bit mei
fb_sys_fops intel_rapl_perf idma64 syscopyarea hid_multitouch
processor_thermal_device soundcore sysfillrect virt_dma typec_ucsi sysimgblt
intel_soc_dts_iosf intel_pch_thermal typec int3403_thermal int340x_thermal_=
zone
dell_smo8800 acpi_pad intel_hid int3400_thermal mac_hid acpi_thermal_rel
sparse_keymap sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic rtsx_pci_sdmmc nvme e1000e i2c_i801 intel_lpss_pci rtsx=
_pci
nvme_core intel_lpss i2c_hid wmi hid video pinctrl_cannonlake pinctrl_intel
Apr 23 19:29:14 texas kernel: [ 133.673381] CPU: 6 PID: 2467 Comm: fwupd
Tainted: G OE 5.0.0-13-generic #14-Ubuntu
Apr 23 19:29:14 texas kernel: [ 133.673382] Hardware name: Dell Inc. Precis=
ion
7730/05W5TJ, BIOS 1.7.0 02/19/2019
Apr 23 19:29:14 texas kernel: [ 133.673417] RIP:
0010:generic_reg_wait.cold.3+0x25/0x2c [amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673418] Code: e9 37 7e fe ff 44 8b 45 2=
0 48
8b 4d 18 48 c7 c7 40 34 17 c1 8b 55 10 8b 75 d4 e8 3b ce 82 e1 41 83 7d 20 =
01
0f 84 0c c3 fe ff &lt;0f&gt; 0b e9 05 c3 fe ff 55 48 89 e5 e8 5d de ec ff 4=
8 c7 c7 00
a0 18
Apr 23 19:29:14 texas kernel: [ 133.673419] RSP: 0018:ffffbbaa0612fbb0 EFLA=
GS:
00010297
Apr 23 19:29:14 texas kernel: [ 133.673420] RAX: 0000000000000049 RBX:
00000000000000a1 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673420] RDX: 0000000000000000 RSI:
ffff94843c196448 RDI: ffff94843c196448
Apr 23 19:29:14 texas kernel: [ 133.673420] RBP: ffffbbaa0612fbf8 R08:
0000000000000001 R09: 00000000000004fa
Apr 23 19:29:14 texas kernel: [ 133.673421] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000005c04
Apr 23 19:29:14 texas kernel: [ 133.673421] R13: ffff948431de5840 R14:
00000000ffffffff R15: ffff948431de5840
Apr 23 19:29:14 texas kernel: [ 133.673422] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673422] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.673423] CR2: 00007ff83400f6d8 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.673423] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673424] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Apr 23 19:29:14 texas kernel: [ 133.673424] Call Trace:
Apr 23 19:29:14 texas kernel: [ 133.673461] submit_channel_request+0x3fd/0x=
780
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673492] dc_link_aux_transfer+0xc6/0x150
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673526] dm_dp_aux_transfer+0x61/0x130
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673531] drm_dp_dpcd_access+0x75/0x110
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673533] drm_dp_dpcd_read+0x33/0xc0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673537] auxdev_read_iter+0xe6/0x1a0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673539] new_sync_read+0x109/0x170
Apr 23 19:29:14 texas kernel: [ 133.673541] __vfs_read+0x29/0x40
Apr 23 19:29:14 texas kernel: [ 133.673542] vfs_read+0x99/0x160
Apr 23 19:29:14 texas kernel: [ 133.673542] ksys_read+0x55/0xc0
Apr 23 19:29:14 texas kernel: [ 133.673543] __x64_sys_read+0x1a/0x20
Apr 23 19:29:14 texas kernel: [ 133.673545] do_syscall_64+0x5a/0x110
Apr 23 19:29:14 texas kernel: [ 133.673546]
entry_SYSCALL_64_after_hwframe+0x44/0xa9
Apr 23 19:29:14 texas kernel: [ 133.673547] RIP: 0033:0x7ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673548] Code: 84 00 00 00 00 00 41 54 4=
9 89
d4 55 48 89 f5 53 89 fb 48 83 ec 10 e8 5b fc ff ff 4c 89 e2 48 89 ee 89 df =
41
89 c0 31 c0 0f 05 &lt;48&gt; 3d 00 f0 ff ff 77 38 44 89 c7 48 89 44 24 08 e=
8 97 fc ff
ff 48
Apr 23 19:29:14 texas kernel: [ 133.673548] RSP: 002b:00007ffe268d7130 EFLA=
GS:
00000246 ORIG_RAX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673549] RAX: ffffffffffffffda RBX:
0000000000000013 RCX: 00007ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673549] RDX: 0000000000000001 RSI:
00007ffe268d7194 RDI: 0000000000000013
Apr 23 19:29:14 texas kernel: [ 133.673550] RBP: 00007ffe268d7194 R08:
0000000000000000 R09: 00007ff84cca13d0
Apr 23 19:29:14 texas kernel: [ 133.673550] R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000001
Apr 23 19:29:14 texas kernel: [ 133.673550] R13: 00007ffe268d7200 R14:
0000000000000001 R15: 000056469f7bd0e0
Apr 23 19:29:14 texas kernel: [ 133.673552] ---[ end trace b363bbe01edada49
]---
Apr 23 19:29:14 texas kernel: [ 133.673574] BUG: unable to handle kernel NU=
LL
pointer dereference at 0000000000000008
Apr 23 19:29:14 texas kernel: [ 133.673576] #PF error: [normal kernel read
fault]
Apr 23 19:29:14 texas kernel: [ 133.673577] PGD 0 P4D 0
Apr 23 19:29:14 texas kernel: [ 133.673578] Oops: 0000 [#1] SMP PTI
Apr 23 19:29:14 texas kernel: [ 133.673579] CPU: 6 PID: 2467 Comm: fwupd
Tainted: G W OE 5.0.0-13-generic #14-Ubuntu
Apr 23 19:29:14 texas kernel: [ 133.673580] Hardware name: Dell Inc. Precis=
ion
7730/05W5TJ, BIOS 1.7.0 02/19/2019
Apr 23 19:29:14 texas kernel: [ 133.673614] RIP: 0010:dal_ddc_close+0xd/0x30
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673615] Code: e8 38 f5 ff ff 48 8b 55 f=
8 65
48 33 14 25 28 00 00 00 75 02 c9 c3 e8 02 01 84 e1 66 90 0f 1f 44 00 00 55 =
48
89 e5 53 48 89 fb &lt;48&gt; 8b 7f 08 e8 0a f6 ff ff 48 8b 3b e8 02 f6 ff f=
f 5b 5d c3
66 2e
Apr 23 19:29:14 texas kernel: [ 133.673615] RSP: 0018:ffffbbaa0612fc28 EFLA=
GS:
00010246
Apr 23 19:29:14 texas kernel: [ 133.673616] RAX: ffffffffc1052ad0 RBX:
0000000000000000 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673617] RDX: 00000000ffffffff RSI:
0000000000005c04 RDI: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673617] RBP: ffffbbaa0612fc30 R08:
0000000000000001 R09: 000000000000000a
Apr 23 19:29:14 texas kernel: [ 133.673618] R10: 0000000000000001 R11:
0000000000000000 R12: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673618] R13: ffffbbaa0612fdc0 R14:
0000000000000000 R15: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673619] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673620] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.673620] CR2: 0000000000000008 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.673621] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673622] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Apr 23 19:29:14 texas kernel: [ 133.673622] Call Trace:
Apr 23 19:29:14 texas kernel: [ 133.673657] release_engine+0x1e/0xd0 [amdgp=
u]
Apr 23 19:29:14 texas kernel: [ 133.673687] dc_link_aux_transfer+0xfc/0x150
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673720] dm_dp_aux_transfer+0x61/0x130
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.673723] drm_dp_dpcd_access+0x75/0x110
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673726] drm_dp_dpcd_read+0x33/0xc0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673730] auxdev_read_iter+0xe6/0x1a0
[drm_kms_helper]
Apr 23 19:29:14 texas kernel: [ 133.673731] new_sync_read+0x109/0x170
Apr 23 19:29:14 texas kernel: [ 133.673733] __vfs_read+0x29/0x40
Apr 23 19:29:14 texas kernel: [ 133.673734] vfs_read+0x99/0x160
Apr 23 19:29:14 texas kernel: [ 133.673735] ksys_read+0x55/0xc0
Apr 23 19:29:14 texas kernel: [ 133.673736] __x64_sys_read+0x1a/0x20
Apr 23 19:29:14 texas kernel: [ 133.673737] do_syscall_64+0x5a/0x110
Apr 23 19:29:14 texas kernel: [ 133.673738]
entry_SYSCALL_64_after_hwframe+0x44/0xa9
Apr 23 19:29:14 texas kernel: [ 133.673739] RIP: 0033:0x7ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673740] Code: 84 00 00 00 00 00 41 54 4=
9 89
d4 55 48 89 f5 53 89 fb 48 83 ec 10 e8 5b fc ff ff 4c 89 e2 48 89 ee 89 df =
41
89 c0 31 c0 0f 05 &lt;48&gt; 3d 00 f0 ff ff 77 38 44 89 c7 48 89 44 24 08 e=
8 97 fc ff
ff 48
Apr 23 19:29:14 texas kernel: [ 133.673740] RSP: 002b:00007ffe268d7130 EFLA=
GS:
00000246 ORIG_RAX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.673741] RAX: ffffffffffffffda RBX:
0000000000000013 RCX: 00007ff84ccb4d94
Apr 23 19:29:14 texas kernel: [ 133.673742] RDX: 0000000000000001 RSI:
00007ffe268d7194 RDI: 0000000000000013
Apr 23 19:29:14 texas kernel: [ 133.673742] RBP: 00007ffe268d7194 R08:
0000000000000000 R09: 00007ff84cca13d0
Apr 23 19:29:14 texas kernel: [ 133.673743] R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000001
Apr 23 19:29:14 texas kernel: [ 133.673743] R13: 00007ffe268d7200 R14:
0000000000000001 R15: 000056469f7bd0e0
Apr 23 19:29:14 texas kernel: [ 133.673744] Modules linked in: thunderbolt
rfcomm xt_owner ip6table_filter ip6_tables ipt_MASQUERADE iptable_nat
nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bri=
dge
xt_CHECKSUM xt_tcpudp stp llc iptable_filter iptable_mangle bpfilter ccm
snd_hda_codec_realtek snd_hda_codec_generic pci_stub vboxpci(OE) vboxnetadp=
(OE)
vboxnetflt(OE) cmac vboxdrv(OE) bnep binfmt_misc dell_rbtn nls_iso8859_1 jo=
ydev
arc4 snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_skl_ipc
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi
snd_soc_core snd_compress ac97_bus intel_rapl snd_pcm_dmaengine
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_hdmi kvm_intel
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep crct10dif_pclmul i915
snd_pcm crc32_pclmul iwlmvm uvcvideo amdgpu snd_seq_midi ghash_clmulni_intel
snd_seq_midi_event mac80211 videobuf2_vmalloc kvmgt videobuf2_memops vfio_m=
dev
videobuf2_v4l2 snd_rawmidi dell_laptop mdev videobuf2_common
Apr 23 19:29:14 texas kernel: [ 133.673754] ledtrig_audio vfio_iommu_type1
videodev dell_smm_hwmon vfio snd_seq dell_wmi media kvm chash btusb
snd_seq_device amd_iommu_v2 btrtl snd_timer btbcm dell_smbios gpu_sched
irqbypass btintel dcdbas ttm aesni_intel iwlwifi bluetooth drm_kms_helper
aes_x86_64 crypto_simd cryptd glue_helper rtsx_pci_ms input_leds snd drm
ecdh_generic intel_cstate mei_me ucsi_acpi cfg80211 serio_raw
dell_wmi_descriptor intel_wmi_thunderbolt wmi_bmof memstick i2c_algo_bit mei
fb_sys_fops intel_rapl_perf idma64 syscopyarea hid_multitouch
processor_thermal_device soundcore sysfillrect virt_dma typec_ucsi sysimgblt
intel_soc_dts_iosf intel_pch_thermal typec int3403_thermal int340x_thermal_=
zone
dell_smo8800 acpi_pad intel_hid int3400_thermal mac_hid acpi_thermal_rel
sparse_keymap sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic rtsx_pci_sdmmc nvme e1000e i2c_i801 intel_lpss_pci rtsx=
_pci
nvme_core intel_lpss i2c_hid wmi hid video pinctrl_cannonlake pinctrl_intel
Apr 23 19:29:14 texas kernel: [ 133.673765] CR2: 0000000000000008
Apr 23 19:29:14 texas kernel: [ 133.673766] ---[ end trace b363bbe01edada4a
]---
Apr 23 19:29:14 texas kernel: [ 133.696801] RIP: 0010:dal_ddc_close+0xd/0x30
[amdgpu]
Apr 23 19:29:14 texas kernel: [ 133.696804] Code: e8 38 f5 ff ff 48 8b 55 f=
8 65
48 33 14 25 28 00 00 00 75 02 c9 c3 e8 02 01 84 e1 66 90 0f 1f 44 00 00 55 =
48
89 e5 53 48 89 fb &lt;48&gt; 8b 7f 08 e8 0a f6 ff ff 48 8b 3b e8 02 f6 ff f=
f 5b 5d c3
66 2e
Apr 23 19:29:14 texas kernel: [ 133.696805] RSP: 0018:ffffbbaa0612fc28 EFLA=
GS:
00010246
Apr 23 19:29:14 texas kernel: [ 133.696806] RAX: ffffffffc1052ad0 RBX:
0000000000000000 RCX: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696807] RDX: 00000000ffffffff RSI:
0000000000005c04 RDI: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696808] RBP: ffffbbaa0612fc30 R08:
0000000000000001 R09: 000000000000000a
Apr 23 19:29:14 texas kernel: [ 133.696809] R10: 0000000000000001 R11:
0000000000000000 R12: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696809] R13: ffffbbaa0612fdc0 R14:
0000000000000000 R15: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696810] FS: 00007ff849b11b40(0000)
GS:ffff94843c180000(0000) knlGS:0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696811] CS: 0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 23 19:29:14 texas kernel: [ 133.696812] CR2: 0000000000000008 CR3:
0000000847680006 CR4: 00000000003606e0
Apr 23 19:29:14 texas kernel: [ 133.696813] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Apr 23 19:29:14 texas kernel: [ 133.696813] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569440191.35B3e8d9A.15377--

--===============0928113227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0928113227==--
