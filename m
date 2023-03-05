Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FA6AB13C
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 16:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A5010E186;
	Sun,  5 Mar 2023 15:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58A710E186
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 15:32:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDB5160AE2
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 15:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38BA9C4339B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678030346;
 bh=F0Bl/6WUi5Q0tsKfobvjqaLsQFRlBJjVrwaoni59TZs=;
 h=From:To:Subject:Date:From;
 b=eN6oSbBQPSsw5XfELYqcbyRmgpL5lx6JrEVwDAIUDArf8DbFYi9l8qJcK4KJAVmg8
 uJYEIGIjhos3rcCBbljuZRk41eJufsMzK1W3p8XhJQoDcsHDMol95Sp/yFLbmsX/xu
 Dg/+BB5VqQfY/304wvffIzzpZBxzjLL7myCCsWhj6MB796opFkj5HeU45pjfVpon1V
 6LSzazVRmJTTkJw3+pKYIIMTDfG2SbkV/3rXkNyleH6O1oof6j69EDTnv4+YERLFJV
 u+MryL1DR7Z4DKMuKb1krO2328KYm9LlOY1Nb6hQXvJjdbkfM5ftmbHffCDkxgxTNO
 N3VXYsFSUma/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1FBD4C43143; Sun,  5 Mar 2023 15:32:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217141] New: [amdgpu] ring gfx_0.0.0 timeout steam deck AMD APU
Date: Sun, 05 Mar 2023 15:32:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: serg@podtynnyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217141

            Bug ID: 217141
           Summary: [amdgpu] ring gfx_0.0.0 timeout steam deck AMD APU
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.12
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: serg@podtynnyi.com
        Regression: No

[  257.182206] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D26043, emitted[64/36172]
[  257.182668] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process NMS.exe pid 2571 thread NMS.exe
pid 2571
[  257.183084] amdgpu 0000:04:00.0: amdgpu: GPU reset begin!
[  257.183094] ------------[ cut here ]------------
[  257.183095] Evicting all processes
[  257.183151] WARNING: CPU: 6 PID: 745 at
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1935 kfd_suspend_all_proc
esses+0x100/0x110 [amdgpu]
[  257.183562] Modules linked in: uinput snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device ccm algif_aead cbc des_generi
c libdes ecb md4 cmac algif_hash algif_skcipher af_alg bnep ramoops
reed_solomon snd_acp5x_pcm_dma snd_soc_acp5x_mach s
nd_acp5x_i2s snd_sof_amd_rembrandt rtw88_8822ce snd_sof_amd_renoir rtw88_88=
22c
snd_sof_amd_acp rtw88_pci intel_rapl_msr
 snd_sof_pci intel_rapl_common rtw88_core snd_sof edac_mce_amd snd_sof_utils
btusb kvm_amd btrtl snd_pci_ps mac80211 sn
d_hda_codec_hdmi btbcm snd_soc_cs35l41_spi btintel kvm snd_soc_cs35l41
snd_rpl_pci_acp6x snd_hda_intel btmtk snd_soc_wm
_adsp snd_intel_dspcfg cs_dsp snd_acp_pci libarc4 leds_steamdeck
extcon_steamdeck snd_pci_acp6x snd_intel_sdw_acpi snd_
soc_nau8821 snd_soc_cs35l41_lib steamdeck_hwmon irqbypass bluetooth
snd_hda_codec snd_pci_acp5x snd_soc_core rapl snd_r
n_pci_acp3x cfg80211 pcspkr snd_hda_core snd_compress i2c_piix4 mousedev
cdc_acm ac97_bus snd_acp_config joydev ecdh_ge
neric snd_pcm_dmaengine snd_hwdep snd_soc_acpi
[  257.183627]  snd_pci_acp3x snd_pcm dwc3_pci rfkill ina2xx_adc kfifo_buf
snd_timer opt3001 ltrf216a steamdeck spi_amd
 ina2xx industrialio snd acpi_cpufreq mac_hid soundcore fuse ip_tables x_ta=
bles
overlay ext4 crc16 mbcache jbd2 hid_ste
am usbhid amdgpu vfat fat gpu_sched drm_buddy serio_raw sdhci_pci nvme_tcp
drm_display_helper atkbd cqhci libps2 nvme_f
abrics crct10dif_pclmul vivaldi_fmap crc32_pclmul polyval_clmulni sdhci
polyval_generic cec i8042 gf128mul nvme hid_mul
titouch drm_ttm_helper ghash_clmulni_intel xhci_pci sha512_ssse3 nvme_core
aesni_intel crypto_simd sp5100_tco cryptd wd
at_wdt ttm xhci_pci_renesas ccp mmc_core nvme_common serio video i2c_hid_ac=
pi
wmi 8250_dw i2c_hid btrfs blake2b_generic
 xor raid6_pq libcrc32c crc32c_generic crc32c_intel dm_mirror dm_region_hash
dm_log dm_mod pkcs8_key_parser crypto_user
[  257.183700] CPU: 6 PID: 745 Comm: kworker/u32:7 Not tainted
6.1.12-valve2-1-neptune-61 #1 4091faa51bd1be3bbac5fd4c3c
e3432202f24d92
[  257.183704] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
[  257.183708] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sche=
d]
[  257.183718] RIP: 0010:kfd_suspend_all_processes+0x100/0x110 [amdgpu]
[  257.184119] Code: c7 c7 00 b3 3f c1 41 5c 41 5d e9 cb 4f 5f f1 be 03 00 =
00
00 e8 d1 89 a3 f1 e9 59 ff ff ff 48 c7 c7
 14 a2 24 c1 e8 12 d6 06 f2 <0f> 0b e9 24 ff ff ff 0f 0b eb c5 0f 1f 44 00 =
00
66 0f 1f 00 0f 1f
[  257.184122] RSP: 0018:ffffad1140f67cf8 EFLAGS: 00010286
[  257.184125] RAX: 0000000000000000 RBX: ffff993b46b68400 RCX:
0000000000000027
[  257.184127] RDX: ffff993e6eda0728 RSI: 0000000000000001 RDI:
ffff993e6eda0720
[  257.184128] RBP: ffff993b44620000 R08: 0000000000000000 R09:
ffffad1140f67b78
[  257.184130] R10: 0000000000000003 R11: ffff993e7ef7ffe8 R12:
ffffad1140f67dd0
[  257.184131] R13: 0000000000000000 R14: ffff993b89dbe400 R15:
0000000000000000
[  257.184133] FS:  0000000000000000(0000) GS:ffff993e6ed80000(0000)
knlGS:0000000000000000
[  257.184135] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  257.184137] CR2: 000055d62521f000 CR3: 0000000108b04000 CR4:
0000000000350ee0
[  257.184139] Call Trace:
[  257.184143]  <TASK>
[  257.184147]  kgd2kfd_suspend.part.0+0x3d/0x40 [amdgpu
ad613437896db6c29581f2be9152cc5a6dd35ad7]
[  257.184571]  kgd2kfd_pre_reset+0x47/0x60 [amdgpu
ad613437896db6c29581f2be9152cc5a6dd35ad7]
[  257.184965]  amdgpu_device_gpu_recover.cold+0x119/0xb40 [amdgpu
ad613437896db6c29581f2be9152cc5a6dd35ad7]
[  257.185430]  amdgpu_job_timedout+0x1dc/0x220 [amdgpu
ad613437896db6c29581f2be9152cc5a6dd35ad7]
[  257.185866]  ? try_to_wake_up+0xd9/0x560
[  257.185874]  drm_sched_job_timedout+0x7a/0x110 [gpu_sched
32db77b2b4e1fdeaf45e32d64ce206e5c0ca90ae]
[  257.185885]  process_one_work+0x1c7/0x380
[  257.185892]  worker_thread+0x51/0x390
[  257.185897]  ? rescuer_thread+0x3b0/0x3b0
[  257.185901]  kthread+0xde/0x110
[  257.185905]  ? kthread_complete_and_exit+0x20/0x20
[  257.185909]  ret_from_fork+0x22/0x30
[  257.185917]  </TASK>
[  257.185918] ---[ end trace 0000000000000000 ]---
[  257.284610] amdgpu 0000:04:00.0: amdgpu: MODE2 reset
[  257.294783] amdgpu 0000:04:00.0: amdgpu: GPU reset succeeded, trying to
resume

cat /proc/cmdline
BOOT_IMAGE=3D/boot/vmlinuz-linux-neptune-61 console=3Dtty1 rd.luks=3D0 rd.l=
vm=3D0
rd.md=3D0 rd.dm=3D0 rd.systemd.gpt_auto=3Dno amdgpu.noretry=3D0
amdgpu.ppfeaturemask=3D0xffffbfff amdgpu.lockup_timeout=3D20000
amdgpu.job_hang_limit=3D2 drm.debug=3D0x1ff amdgpu.debug_evictions=3Dtrue1
tsc=3Ddirectsync module_blacklist=3Dtpm log_buf_len=3D4M amd_iommu=3Doff
amdgpu.gttsize=3D8128 spi_amd.speed_dev=3D1 audit=3D0 fbcon=3Drotate:1 logl=
evel=3D3
splash quiet plymouth.ignore-serial-consoles fbcon=3Dvc:4-6
steamos.efi=3DPARTUUID=3D8bdf3e52-bf2f-7c45-9f00-45e568aa5af0


Linux Thorax 6.1.12-valve2-1-neptune-61 #1 SMP PREEMPT_DYNAMIC Mon, 27 Feb =
2023
21:06:42 +0000 x86_64 GNU/Linux


Devices:
=3D=3D=3D=3D=3D=3D=3D=3D
GPU0:
        apiVersion         =3D 4206830 (1.3.238)
        driverVersion      =3D 96469091 (0x5c00063)
        vendorID           =3D 0x1002
        deviceID           =3D 0x163f
        deviceType         =3D PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
        deviceName         =3D AMD Custom GPU 0405 (RADV VANGOGH)
        driverID           =3D DRIVER_ID_MESA_RADV
        driverName         =3D radv
        driverInfo         =3D Mesa 23.1.0-devel (git-16283f7b97)
        conformanceVersion =3D 1.3.0.0
        deviceUUID         =3D 00000000-0400-0000-0000-000000000000
        driverUUID         =3D 414d442d-4d45-5341-2d44-525600000000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
