Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5A7804B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 17:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307789DBF;
	Sun, 28 Jul 2019 15:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 047CE89DBF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 15:41:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 001A072167; Sun, 28 Jul 2019 15:41:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110413] GPU crash and failed reset leading to deadlock on
 Polaris 22 XL [Radeon RX Vega M GL]
Date: Sun, 28 Jul 2019 15:41:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: alexander.behling@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110413-502-fYAWbDnFUR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110413-502@http.bugs.freedesktop.org/>
References: <bug-110413-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0771727101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0771727101==
Content-Type: multipart/alternative; boundary="15643284692.89eF8.26617"
Content-Transfer-Encoding: 7bit


--15643284692.89eF8.26617
Date: Sun, 28 Jul 2019 15:41:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110413

--- Comment #10 from Alex Behling <alexander.behling@googlemail.com> ---
From my experience this seems to be a thermal problem. I have the exact same
hardware configuration running latest Archlinux Kernel.=20

$ uname -a
Linux lexnote 5.2.3-arch1-1-ARCH #1 SMP PREEMPT Fri Jul 26 08:13:47 UTC 2019
x86_64 GNU/Linux

If I leave leave the system with the default PM settings (Profile Performan=
ce
or Balance doesn't matter) sooner or later I will get Lock-Ups in any game =
or
application with higher GPU loads.


EXAMPLE DMESG OUTPUT:

[Do Jul 25 23:33:45 2019] amdgpu 0000:01:00.0: GPU pci config reset
[Do Jul 25 23:33:53 2019] [drm] PCIE GART of 256M enabled (table at
0x000000F400000000).
[Do Jul 25 23:33:53 2019] amdgpu 0000:01:00.0: [drm:amdgpu_ring_test_helper
[amdgpu]] *ERROR* ring gfx test failed (-110)
[Do Jul 25 23:33:53 2019] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ER=
ROR*
resume of IP block <gfx_v8_0> failed -110
[Do Jul 25 23:33:53 2019] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-110).
[Do Jul 25 23:33:53 2019] [drm] schedsdma0 is not ready, skipping
[Do Jul 25 23:33:53 2019] [drm] schedsdma1 is not ready, skipping
[Do Jul 25 23:33:59 2019] WARNING: CPU: 1 PID: 20969 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:891
dm_suspend+0x4e/0x60 [amdgpu]
[Do Jul 25 23:33:59 2019] Modules linked in: msr fuse 8021q garp mrp stp llc
ccm snd_hda_codec_hdmi hid_sensor_gyro_3d hid_sensor_accel_3d
hid_sensor_magn_3d hid_sensor_rotation hid_sensor_incl_3d hid_sensor_trigger
industrialio_triggered_buffer kfifo_buf hid_sensor_iio_common industrialio
hid_sensor_hub intel_ishtp_loader intel_ishtp_hid arc4 iwlmvm mousedev
cdc_ether usbnet r8152 xpad ff_memless joydev mii mac80211 uvcvideo btusb
videobuf2_vmalloc hid_logitech_hidpp videobuf2_memops btrtl btbcm nls_iso88=
59_1
videobuf2_v4l2 btintel nls_cp437 videobuf2_common bluetooth vfat fat videod=
ev
media spi_pxa2xx_platform ecdh_generic iTCO_wdt 8250_dw hid_multitouch ecc
mei_hdcp iTCO_vendor_support iwlwifi intel_rapl hp_wmi x86_pkg_temp_thermal
wmi_bmof intel_powerclamp intel_wmi_thunderbolt coretemp kvm_intel
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio kvm psmouse
input_leds snd_hda_intel cfg80211 irqbypass intel_cstate snd_hda_codec
snd_hda_core intel_uncore snd_hwdep intel_rapl_perf snd_pcm
[Do Jul 25 23:33:59 2019]  rtsx_pci_ms memstick snd_timer pcspkr mei_me
intel_ish_ipc processor_thermal_device snd idma64 int3403_thermal ucsi_acpi
i2c_i801 soundcore typec_ucsi rfkill intel_lpss_pci mei tpm_crb
int340x_thermal_zone intel_pch_thermal intel_ishtp intel_soc_dts_iosf
intel_lpss i2c_hid typec wmi tpm_tis tpm_tis_core tpm rng_core intel_vbtn
battery sparse_keymap hp_wireless evdev mac_hid int3400_thermal
acpi_thermal_rel ac pcc_cpufreq vboxnetflt(OE) vboxnetadp(OE) vboxpci(OE)
vboxdrv(OE) sg crypto_user ip_tables x_tables ext4 crc32c_generic crc16 mbc=
ache
jbd2 algif_skcipher af_alg hid_logitech_dj hid_generic usbhid hid dm_crypt
crct10dif_pclmul crc32_pclmul dm_mod crc32c_intel ghash_clmulni_intel
rtsx_pci_sdmmc serio_raw mmc_core atkbd libps2 ahci libahci aesni_intel lib=
ata
aes_x86_64 crypto_simd cryptd xhci_pci glue_helper scsi_mod xhci_hcd rtsx_p=
ci
i8042 serio amdgpu amd_iommu_v2 gpu_sched ttm i915 intel_gtt i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm
[Do Jul 25 23:33:59 2019]  agpgart
[Do Jul 25 23:33:59 2019] CPU: 1 PID: 20969 Comm: kworker/1:2 Tainted: G=20=
=20=20=20=20=20=20
   OE     5.2.1-arch1-1-ARCH #1
[Do Jul 25 23:33:59 2019] Hardware name: HP HP Spectre x360 Convertible
15-ch0xx/83BB, BIOS F.24 11/06/2018
[Do Jul 25 23:33:59 2019] Workqueue: pm pm_runtime_work
[Do Jul 25 23:33:59 2019] RIP: 0010:dm_suspend+0x4e/0x60 [amdgpu]
[Do Jul 25 23:33:59 2019] Code: 00 48 89 83 70 e9 00 00 e8 9f fc ff ff 48 8=
9 df
e8 97 83 00 00 48 8b bb 70 cf 00 00 be 08 00 00 00 e8 b6 9a 08 00 31 c0 5b =
c3
<0f> 0b eb c1 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00
[Do Jul 25 23:33:59 2019] RSP: 0018:ffffb286869cfcb8 EFLAGS: 00010282
[Do Jul 25 23:33:59 2019] RAX: ffffffffc0675ed0 RBX: ffffa1b9e0d30000 RCX:
ffffffffc073e980
[Do Jul 25 23:33:59 2019] RDX: 0000000000000080 RSI: 0000000000000001 RDI:
ffffa1b9e0d30000
[Do Jul 25 23:33:59 2019] RBP: ffffa1b9e0d3e998 R08: 0000000000000001 R09:
0000000000000018
[Do Jul 25 23:33:59 2019] R10: fefefefefefefeff R11: 0000000000000000 R12:
ffffa1b9e0d30000
[Do Jul 25 23:33:59 2019] R13: 0000000000000000 R14: 0000000000000000 R15:
ffffa1b9ebc8bd80
[Do Jul 25 23:33:59 2019] FS:  0000000000000000(0000) GS:ffffa1b9eea40000(0=
000)
knlGS:0000000000000000
[Do Jul 25 23:33:59 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Do Jul 25 23:33:59 2019] CR2: 00007f1d9c02b000 CR3: 0000000469058002 CR4:
00000000003606e0
[Do Jul 25 23:33:59 2019] Call Trace:
[Do Jul 25 23:33:59 2019]  amdgpu_device_ip_suspend_phase1+0x8e/0xc0 [amdgp=
u]
[Do Jul 25 23:33:59 2019]  amdgpu_device_suspend+0x234/0x390 [amdgpu]
[Do Jul 25 23:33:59 2019]  amdgpu_pmops_runtime_suspend+0x41/0xb0 [amdgpu]
[Do Jul 25 23:33:59 2019]  pci_pm_runtime_suspend+0x5b/0x150
[Do Jul 25 23:33:59 2019]  ? __switch_to_asm+0x40/0x70
[Do Jul 25 23:33:59 2019]  vga_switcheroo_runtime_suspend+0x25/0xb0
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  __rpm_callback+0x7b/0x130
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  rpm_callback+0x2a/0x90
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  rpm_suspend+0x136/0x610
[Do Jul 25 23:33:59 2019]  pm_runtime_work+0x94/0xa0
[Do Jul 25 23:33:59 2019]  process_one_work+0x1d1/0x3e0
[Do Jul 25 23:33:59 2019]  worker_thread+0x4a/0x3d0
[Do Jul 25 23:33:59 2019]  kthread+0xfd/0x130
[Do Jul 25 23:33:59 2019]  ? process_one_work+0x3e0/0x3e0
[Do Jul 25 23:33:59 2019]  ? kthread_park+0x90/0x90
[Do Jul 25 23:33:59 2019]  ret_from_fork+0x35/0x40
[Do Jul 25 23:33:59 2019] ---[ end trace 69a711ec632dab70 ]---
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Trying to disable SCLK DPM wh=
en
DPM is disabled
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Trying to disable voltage DPM
when DPM is disabled
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Failed to force to switch arb=
f0!
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] [disable_dpm_tasks] Failed to
disable DPM!
[Do Jul 25 23:33:59 2019] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]]
*ERROR* suspend of IP block <powerplay> failed -22
[Do Jul 25 23:34:00 2019] cp is busy, skip halt cp
[Do Jul 25 23:34:00 2019] rlc is busy, skip halt rlc
[Do Jul 25 23:34:00 2019] amdgpu 0000:01:00.0: GPU pci config reset

If I reduce the maximum CPU Frequency to 2.2GHz keeping the temperatures of=
 CPU
cores and GPU just below 60 degree Celsius the problem does not occur anymo=
re.

$ sudo cpupower frequency-set -u 2.2GHz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643284692.89eF8.26617
Date: Sun, 28 Jul 2019 15:41:09 +0000
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
   title=3D"NEW - GPU crash and failed reset leading to deadlock on Polaris=
 22 XL [Radeon RX Vega M GL]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110413#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash and failed reset leading to deadlock on Polaris=
 22 XL [Radeon RX Vega M GL]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110413">bug 11041=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexander.behling&#64;googlemail.com" title=3D"Alex Behling &lt;alexander.b=
ehling&#64;googlemail.com&gt;"> <span class=3D"fn">Alex Behling</span></a>
</span></b>
        <pre>From my experience this seems to be a thermal problem. I have =
the exact same
hardware configuration running latest Archlinux Kernel.=20

$ uname -a
Linux lexnote 5.2.3-arch1-1-ARCH #1 SMP PREEMPT Fri Jul 26 08:13:47 UTC 2019
x86_64 GNU/Linux

If I leave leave the system with the default PM settings (Profile Performan=
ce
or Balance doesn't matter) sooner or later I will get Lock-Ups in any game =
or
application with higher GPU loads.


EXAMPLE DMESG OUTPUT:

[Do Jul 25 23:33:45 2019] amdgpu 0000:01:00.0: GPU pci config reset
[Do Jul 25 23:33:53 2019] [drm] PCIE GART of 256M enabled (table at
0x000000F400000000).
[Do Jul 25 23:33:53 2019] amdgpu 0000:01:00.0: [drm:amdgpu_ring_test_helper
[amdgpu]] *ERROR* ring gfx test failed (-110)
[Do Jul 25 23:33:53 2019] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ER=
ROR*
resume of IP block &lt;gfx_v8_0&gt; failed -110
[Do Jul 25 23:33:53 2019] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-110).
[Do Jul 25 23:33:53 2019] [drm] schedsdma0 is not ready, skipping
[Do Jul 25 23:33:53 2019] [drm] schedsdma1 is not ready, skipping
[Do Jul 25 23:33:59 2019] WARNING: CPU: 1 PID: 20969 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:891
dm_suspend+0x4e/0x60 [amdgpu]
[Do Jul 25 23:33:59 2019] Modules linked in: msr fuse 8021q garp mrp stp llc
ccm snd_hda_codec_hdmi hid_sensor_gyro_3d hid_sensor_accel_3d
hid_sensor_magn_3d hid_sensor_rotation hid_sensor_incl_3d hid_sensor_trigger
industrialio_triggered_buffer kfifo_buf hid_sensor_iio_common industrialio
hid_sensor_hub intel_ishtp_loader intel_ishtp_hid arc4 iwlmvm mousedev
cdc_ether usbnet r8152 xpad ff_memless joydev mii mac80211 uvcvideo btusb
videobuf2_vmalloc hid_logitech_hidpp videobuf2_memops btrtl btbcm nls_iso88=
59_1
videobuf2_v4l2 btintel nls_cp437 videobuf2_common bluetooth vfat fat videod=
ev
media spi_pxa2xx_platform ecdh_generic iTCO_wdt 8250_dw hid_multitouch ecc
mei_hdcp iTCO_vendor_support iwlwifi intel_rapl hp_wmi x86_pkg_temp_thermal
wmi_bmof intel_powerclamp intel_wmi_thunderbolt coretemp kvm_intel
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio kvm psmouse
input_leds snd_hda_intel cfg80211 irqbypass intel_cstate snd_hda_codec
snd_hda_core intel_uncore snd_hwdep intel_rapl_perf snd_pcm
[Do Jul 25 23:33:59 2019]  rtsx_pci_ms memstick snd_timer pcspkr mei_me
intel_ish_ipc processor_thermal_device snd idma64 int3403_thermal ucsi_acpi
i2c_i801 soundcore typec_ucsi rfkill intel_lpss_pci mei tpm_crb
int340x_thermal_zone intel_pch_thermal intel_ishtp intel_soc_dts_iosf
intel_lpss i2c_hid typec wmi tpm_tis tpm_tis_core tpm rng_core intel_vbtn
battery sparse_keymap hp_wireless evdev mac_hid int3400_thermal
acpi_thermal_rel ac pcc_cpufreq vboxnetflt(OE) vboxnetadp(OE) vboxpci(OE)
vboxdrv(OE) sg crypto_user ip_tables x_tables ext4 crc32c_generic crc16 mbc=
ache
jbd2 algif_skcipher af_alg hid_logitech_dj hid_generic usbhid hid dm_crypt
crct10dif_pclmul crc32_pclmul dm_mod crc32c_intel ghash_clmulni_intel
rtsx_pci_sdmmc serio_raw mmc_core atkbd libps2 ahci libahci aesni_intel lib=
ata
aes_x86_64 crypto_simd cryptd xhci_pci glue_helper scsi_mod xhci_hcd rtsx_p=
ci
i8042 serio amdgpu amd_iommu_v2 gpu_sched ttm i915 intel_gtt i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm
[Do Jul 25 23:33:59 2019]  agpgart
[Do Jul 25 23:33:59 2019] CPU: 1 PID: 20969 Comm: kworker/1:2 Tainted: G=20=
=20=20=20=20=20=20
   OE     5.2.1-arch1-1-ARCH #1
[Do Jul 25 23:33:59 2019] Hardware name: HP HP Spectre x360 Convertible
15-ch0xx/83BB, BIOS F.24 11/06/2018
[Do Jul 25 23:33:59 2019] Workqueue: pm pm_runtime_work
[Do Jul 25 23:33:59 2019] RIP: 0010:dm_suspend+0x4e/0x60 [amdgpu]
[Do Jul 25 23:33:59 2019] Code: 00 48 89 83 70 e9 00 00 e8 9f fc ff ff 48 8=
9 df
e8 97 83 00 00 48 8b bb 70 cf 00 00 be 08 00 00 00 e8 b6 9a 08 00 31 c0 5b =
c3
&lt;0f&gt; 0b eb c1 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00
[Do Jul 25 23:33:59 2019] RSP: 0018:ffffb286869cfcb8 EFLAGS: 00010282
[Do Jul 25 23:33:59 2019] RAX: ffffffffc0675ed0 RBX: ffffa1b9e0d30000 RCX:
ffffffffc073e980
[Do Jul 25 23:33:59 2019] RDX: 0000000000000080 RSI: 0000000000000001 RDI:
ffffa1b9e0d30000
[Do Jul 25 23:33:59 2019] RBP: ffffa1b9e0d3e998 R08: 0000000000000001 R09:
0000000000000018
[Do Jul 25 23:33:59 2019] R10: fefefefefefefeff R11: 0000000000000000 R12:
ffffa1b9e0d30000
[Do Jul 25 23:33:59 2019] R13: 0000000000000000 R14: 0000000000000000 R15:
ffffa1b9ebc8bd80
[Do Jul 25 23:33:59 2019] FS:  0000000000000000(0000) GS:ffffa1b9eea40000(0=
000)
knlGS:0000000000000000
[Do Jul 25 23:33:59 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Do Jul 25 23:33:59 2019] CR2: 00007f1d9c02b000 CR3: 0000000469058002 CR4:
00000000003606e0
[Do Jul 25 23:33:59 2019] Call Trace:
[Do Jul 25 23:33:59 2019]  amdgpu_device_ip_suspend_phase1+0x8e/0xc0 [amdgp=
u]
[Do Jul 25 23:33:59 2019]  amdgpu_device_suspend+0x234/0x390 [amdgpu]
[Do Jul 25 23:33:59 2019]  amdgpu_pmops_runtime_suspend+0x41/0xb0 [amdgpu]
[Do Jul 25 23:33:59 2019]  pci_pm_runtime_suspend+0x5b/0x150
[Do Jul 25 23:33:59 2019]  ? __switch_to_asm+0x40/0x70
[Do Jul 25 23:33:59 2019]  vga_switcheroo_runtime_suspend+0x25/0xb0
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  __rpm_callback+0x7b/0x130
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  rpm_callback+0x2a/0x90
[Do Jul 25 23:33:59 2019]  ? vga_switcheroo_runtime_resume+0x60/0x60
[Do Jul 25 23:33:59 2019]  rpm_suspend+0x136/0x610
[Do Jul 25 23:33:59 2019]  pm_runtime_work+0x94/0xa0
[Do Jul 25 23:33:59 2019]  process_one_work+0x1d1/0x3e0
[Do Jul 25 23:33:59 2019]  worker_thread+0x4a/0x3d0
[Do Jul 25 23:33:59 2019]  kthread+0xfd/0x130
[Do Jul 25 23:33:59 2019]  ? process_one_work+0x3e0/0x3e0
[Do Jul 25 23:33:59 2019]  ? kthread_park+0x90/0x90
[Do Jul 25 23:33:59 2019]  ret_from_fork+0x35/0x40
[Do Jul 25 23:33:59 2019] ---[ end trace 69a711ec632dab70 ]---
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Trying to disable SCLK DPM wh=
en
DPM is disabled
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Trying to disable voltage DPM
when DPM is disabled
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] Failed to force to switch arb=
f0!
[Do Jul 25 23:33:59 2019] amdgpu: [powerplay] [disable_dpm_tasks] Failed to
disable DPM!
[Do Jul 25 23:33:59 2019] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]]
*ERROR* suspend of IP block &lt;powerplay&gt; failed -22
[Do Jul 25 23:34:00 2019] cp is busy, skip halt cp
[Do Jul 25 23:34:00 2019] rlc is busy, skip halt rlc
[Do Jul 25 23:34:00 2019] amdgpu 0000:01:00.0: GPU pci config reset

If I reduce the maximum CPU Frequency to 2.2GHz keeping the temperatures of=
 CPU
cores and GPU just below 60 degree Celsius the problem does not occur anymo=
re.

$ sudo cpupower frequency-set -u 2.2GHz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643284692.89eF8.26617--

--===============0771727101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0771727101==--
