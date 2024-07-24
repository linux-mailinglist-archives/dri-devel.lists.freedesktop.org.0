Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBA93B595
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C171010E76D;
	Wed, 24 Jul 2024 17:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b5VVfdn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6542B10E780
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:08:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B98CCE1178
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C99ADC4AF09
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721840893;
 bh=JD7Jh9l2CBTYbGa/AIC7m+eZmi82ldkZdmNQU/FnMFk=;
 h=From:To:Subject:Date:From;
 b=b5VVfdn/ttZvefrHhOQjCxXZj4u+tJ0mx+/m8ysIJlIt9MFe9agj0VHLH42zHAaX5
 OoGuPJTk+XTtCeVD7NBXo9b79tUn9qwroU/A7nQ7UEU6IjlJ1IvWZ9cIerVmVuVC3n
 /ADneO8aiX6PolnZtuViycdqSzkdBUmd0dlP9jLKvheU+9z4K4L2zvDIsokX5V6EX2
 11KCIs453JpcLFOciH82txtsYQsbZ6+fL8BF/HwSKoIsE5/ZkuSGHUeDF4YaqKfzjr
 TBWJY5buaX1tVLMzCKrgtIS0vC39MDuPYiievOzF1amJY1eFjXBvg9TiH/Cfwurg4w
 8EH1kF1mdNpLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BFCF1C53BB7; Wed, 24 Jul 2024 17:08:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219092] New: Problem with fill_dc_mst_payload_table_from_drm
 [amdgpu]
Date: Wed, 24 Jul 2024 17:08:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a92zu@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-219092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219092

            Bug ID: 219092
           Summary: Problem with fill_dc_mst_payload_table_from_drm
                    [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: Ubuntu 6.8.0-40.40-generic 6.8.12
          Hardware: i386
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: a92zu@hotmail.com
        Regression: No

Dear maintainers,

I am using a Intel NUC nuc8i7hvk hades-canyon, there I want to use the
thunderbolt3 (usb-c) for my two displays via Lenovo Docking Station, but the
only interfaces via HDMI and Mini-DP at the Intel-NUC are working.

The displays are recognised, but enabling is not possible , I have disabled
them in KDE for now.
The problem is via tb3-usb-c-directly connnected and also via Lenovo Docking
Station.

First at bootup there is a warning message with a problem at
fill_dc_mst_payload_table_from_drm and then you see "amdgpu 0000:01:00.0: [=
drm]
enabling link 1 failed: 15"-messages.

On MS Windows 10 (or in the BIOS_UEFI setup) there is no problem tb3/usb-c =
with
the two displays and the docking station.

My workaround for now is to connect the two displays (each two cables) to t=
he
Intel-NUC via HDMI/Mini-DP AND to the Docking-Station to have a working set=
up.

Is there the possibility to fix this problem?

Thank you in advance.

Best regards, Bernhard

=3D=3D=3D=3D Messages:

# Outputs

uname -a
Linux stargazer 6.8.0-40-generic #40-Ubuntu SMP PREEMPT_DYNAMIC Fri Jul  5
10:34:03 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

Ubuntu 6.8.0-40.40-generic 6.8.12


# Specs of the Intel NUC nuc8i7hvk hades-canyon

https://geizhals.at/intel-nuc-kit-nuc8i7hvk-hades-canyon-boxnuc8i7hvk-a1752=
708.html

=3D> Discrete Graphics is AMD VEGA M and IGP is Intel .


Mobo: Intel model: NUC8i7HVB
    UEFI: Intel v: HNKBLi70.86A.0070.2022.1103.1527 date: 11/03/2022
product: NUC8i7HVK

Graphics:
  Device-1: AMD Polaris 22 XT [Radeon RX Vega M GH] vendor: Intel
    driver: amdgpu v: kernel arch: GCN-4 pcie: speed: 8 GT/s lanes: 8 ports:
    active: HDMI-A-1,HDMI-A-2 off: DP-7,DP-8 empty: DP-1, DP-2, DP-3, DP-4,
    DP-5, DP-6, DP-9 bus-ID: 01:00.0 chip-ID: 1002:694c

Kubuntu 24.04
  Display: server: X.Org v: 21.1.11 with: Xwayland v: 23.2.6
    compositor: kwin_x11 driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,vesa dri: radeonsi gpu: amdgpu display-ID: =
:0
    screens: 1
  Screen-1: 0 s-res: 7680x2160 s-dpi: 96
  Monitor-1: DP-7 mapped: DisplayPort-6 note: disabled model: Dell S2722QC
    res: N/A dpi: 163 diag: 685mm (27")
  Monitor-2: DP-8 mapped: DisplayPort-7 note: disabled model: Dell S2722QC
    res: N/A dpi: 163 diag: 685mm (27")
  Monitor-3: HDMI-A-1 mapped: HDMI-A-0 pos: left model: Dell S2722QC
    res: 3840x2160 dpi: 163 diag: 685mm (27")
  Monitor-4: HDMI-A-2 mapped: HDMI-A-1 pos: primary,right
    model: Dell S2722QC res: 3840x2160 dpi: 163 diag: 685mm (27")
  API: EGL v: 1.5 platforms: device: 0 drv: radeonsi device: 1 drv: swrast
    surfaceless: drv: radeonsi x11: drv: radeonsi inactive: gbm,wayland
  API: OpenGL v: 4.6 compat-v: 4.5 vendor: amd mesa v: 24.0.9-0ubuntu0.1
    glx-v: 1.4 direct-render: yes renderer: AMD Radeon RX Vega M GH Graphics
    (radeonsi vegam LLVM 17.0.6 DRM 3.57 6.8.0-40-generic)
    device-ID: 1002:694c
  API: Vulkan v: 1.3.275 surfaces: xcb,xlib device: 0 type: discrete-gpu
    driver: N/A device-ID: 1002:694c device: 1 type: cpu driver: N/A
    device-ID: 10005:0000



lspci
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v6/7th Gen Core Process=
or
Host Bridge/DRAM Registers (rev 05)
00:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe
Controller (x16) (rev 05)
00:01.1 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x8) (rev 05)
00:01.2 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x4) (rev 05)
00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v=
5 /
6th/7th/8th Gen Core Processor Gaussian Mixture Model
00:14.0 USB controller: Intel Corporation 100 Series/C230 Series Chipset Fa=
mily
USB 3.0 xHCI Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation 100 Series/C230 Ser=
ies
Chipset Family Thermal Subsystem (rev 31)
00:15.0 Signal processing controller: Intel Corporation 100 Series/C230 Ser=
ies
Chipset Family Serial IO I2C Controller #0 (rev 31)
00:15.1 Signal processing controller: Intel Corporation 100 Series/C230 Ser=
ies
Chipset Family Serial IO I2C Controller #1 (rev 31)
00:15.2 Signal processing controller: Intel Corporation 100 Series/C230 Ser=
ies
Chipset Family Serial IO I2C Controller #2 (rev 31)
00:16.0 Communication controller: Intel Corporation 100 Series/C230 Series
Chipset Family MEI Controller #1 (rev 31)
00:1c.0 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #1 (rev f1)
00:1c.1 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #2 (rev f1)
00:1c.2 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #3 (rev f1)
00:1c.4 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #5 (rev f1)
00:1d.0 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #9 (rev f1)
00:1d.4 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family=
 PCI
Express Root Port #13 (rev f1)
00:1e.0 Signal processing controller: Intel Corporation 100 Series/C230 Ser=
ies
Chipset Family Serial IO UART #0 (rev 31)
00:1f.0 ISA bridge: Intel Corporation HM175 Chipset LPC/eSPI Controller (rev
31)
00:1f.2 Memory controller: Intel Corporation 100 Series/C230 Series Chipset
Family Power Management Controller (rev 31)
00:1f.3 Audio device: Intel Corporation CM238 HD Audio Controller (rev 31)
00:1f.4 SMBus: Intel Corporation 100 Series/C230 Series Chipset Family SMBus
(rev 31)
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Polaris 22 XT [Radeon RX Vega M GH] (rev c0)
01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Polaris 22 HDMI
Audio
02:00.0 USB controller: ASMedia Technology Inc. ASM2142/ASM3142 USB 3.1 Host
Controller
03:00.0 SD Host controller: O2 Micro, Inc. SD/MMC Card Reader Controller (r=
ev
01)
05:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connect=
ion
(rev 03)
06:00.0 Network controller: Intel Corporation Wireless 8265 / 8275 (rev 78)
07:00.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)
08:00.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)
08:01.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)
08:02.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)
08:04.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)
09:00.0 System peripheral: Intel Corporation JHL6540 Thunderbolt 3 NHI (C s=
tep)
[Alpine Ridge 4C 2016] (rev 02)
0a:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 20=
20]
(rev 03)
0b:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 20=
20]
(rev 03)
0b:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 20=
20]
(rev 03)
0b:04.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 20=
20]
(rev 03)
0c:00.0 USB controller: Intel Corporation Thunderbolt 4 USB Controller [Gos=
hen
Ridge 2020] (rev 03)
72:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc.
KC3000/FURY Renegade NVMe SSD E18 (rev 01)
73:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc.
KC3000/FURY Renegade NVMe SSD E18 (rev 01)

boltctl
 =E2=97=8F Lenovo ThinkPad Thunderbolt 4 Dock
   =E2=94=9C=E2=94=80 type:          peripheral
   =E2=94=9C=E2=94=80 name:          ThinkPad Thunderbolt 4 Dock
   =E2=94=9C=E2=94=80 vendor:        Lenovo
   =E2=94=9C=E2=94=80 uuid:          00cca024-31a9-8780-ffff-ffffffffffff
   =E2=94=9C=E2=94=80 generation:    USB4
   =E2=94=9C=E2=94=80 status:        authorized
   =E2=94=82  =E2=94=9C=E2=94=80 domain:     d8030000-0070-6d18-2313-f71ae6=
f3d922
   =E2=94=82  =E2=94=9C=E2=94=80 rx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
   =E2=94=82  =E2=94=9C=E2=94=80 tx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
   =E2=94=82  =E2=94=94=E2=94=80 authflags:  none
   =E2=94=9C=E2=94=80 authorized:    Mi 24 Jul 2024 04:21:13
   =E2=94=9C=E2=94=80 connected:     Mi 24 Jul 2024 04:21:13
   =E2=94=94=E2=94=80 stored:        So 18 Feb 2024 18:55:55
      =E2=94=9C=E2=94=80 policy:     auto
      =E2=94=94=E2=94=80 key:        no


[Mi Jul 24 06:34:30 2024] ------------[ cut here ]------------
[Mi Jul 24 06:34:30 2024] WARNING: CPU: 2 PID: 2517 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:191
fill_dc_mst_payload_table_from_drm+0xb2/0x250 [amdgpu]
[Mi Jul 24 06:34:30 2024] Modules linked in: xt_conntrack nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nf_tables libcrc32c cmac algif_hash
algif_skcipher af_alg qrtr bnep binfmt_misc intel_rapl_msr intel_rapl_common
intel_uncore_frequency intel_uncore_frequency_common nls_iso8859_1 snd_soc_=
avs
intel_tcc_cooling snd_soc_hda_codec x86_pkg_temp_thermal snd_hda_ext_core
intel_powerclamp coretemp snd_soc_core kvm_intel snd_compress
snd_hda_codec_realtek ac97_bus snd_hda_codec_generic snd_hda_codec_hdmi
snd_pcm_dmaengine btusb iwlmvm snd_hda_intel kvm btrtl snd_usb_audio
snd_intel_dspcfg tps6598x btintel irqbypass ee1004 mei_pxp mei_hdcp typec
snd_intel_sdw_acpi snd_usbmidi_lib btbcm rapl mac80211 snd_seq_midi
snd_hda_codec snd_ump btmtk snd_seq_midi_event snd_hda_core mc
intel_wmi_thunderbolt intel_cstate libarc4 wmi_bmof i2c_i801 bluetooth
snd_hwdep snd_rawmidi snd_pcm i2c_smbus iwlwifi snd_seq ecdh_generic
snd_seq_device ecc snd_timer cfg80211 mei_me joydev snd soundcore
intel_pch_thermal mei serial_multi_instantiate
[Mi Jul 24 06:34:30 2024]  intel_pmc_core intel_vsec pmt_telemetry pmt_class
input_leds acpi_pad serio_raw mac_hid msr parport_pc ppdev lp parport
nvme_fabrics efi_pstore nfnetlink dmi_sysfs ip_tables x_tables autofs4 dm_c=
rypt
cdc_ether usbnet r8152 mii hid_logitech_hidpp hid_logitech_dj i915 hid_gene=
ric
usbhid hid thunderbolt amdgpu amdxcp drm_exec crct10dif_pclmul gpu_sched
crc32_pclmul drm_suballoc_helper polyval_clmulni 8250_dw drm_buddy
polyval_generic drm_display_helper ghash_clmulni_intel nvme cec sdhci_pci i=
gb
sha256_ssse3 rc_core nvme_core cqhci intel_lpss_pci dca sha1_ssse3
drm_ttm_helper xhci_pci video psmouse intel_lpss sdhci nvme_auth i2c_algo_b=
it
ttm xhci_pci_renesas wmi idma64 pinctrl_sunrisepoint aesni_intel crypto_simd
cryptd
[Mi Jul 24 06:34:30 2024] CPU: 2 PID: 2517 Comm: kworker/2:3 Not tainted
6.8.0-40-generic #40-Ubuntu
[Mi Jul 24 06:34:30 2024] Hardware name: Intel(R) Client Systems
NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0070.2022.1103.1527 11/03/2022
[Mi Jul 24 06:34:30 2024] Workqueue: events drm_mode_rmfb_work_fn
[Mi Jul 24 06:34:30 2024] RIP:
0010:fill_dc_mst_payload_table_from_drm+0xb2/0x250 [amdgpu]
[Mi Jul 24 06:34:30 2024] Code: 4c 63 f3 49 83 fe 07 0f 83 1a 01 00 00 0f b=
6 7a
09 41 38 7d 00 75 dd 4b 8d 14 76 31 c9 66 89 8c d5 50 ff ff ff 41 39 df 75 =
31
<0f> 0b eb 2d 49 83 ff 07 0f 83 53 01 00 00 0f b7 0d fb 08 c2 00 8a
[Mi Jul 24 06:34:30 2024] RSP: 0018:ffffb5da822eb538 EFLAGS: 00010246
[Mi Jul 24 06:34:30 2024] RAX: ffffb5da822eb6e8 RBX: 0000000000000000 RCX:
0000000000000000
[Mi Jul 24 06:34:30 2024] RDX: ffffb5da822eb640 RSI: ffff90229417abf8 RDI:
ffffb5da822eb5f0
[Mi Jul 24 06:34:30 2024] RBP: ffffb5da822eb620 R08: ffff90229417a800 R09:
0000000000000000
[Mi Jul 24 06:34:30 2024] R10: 0000000000000000 R11: 0000000000000000 R12:
ffffb5da822eb570
[Mi Jul 24 06:34:30 2024] R13: ffffb5da822eb570 R14: ffff902289b2ef60 R15:
0000000000000000
[Mi Jul 24 06:34:30 2024] FS:  0000000000000000(0000) GS:ffff9029e6500000(0=
000)
knlGS:0000000000000000
[Mi Jul 24 06:34:30 2024] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mi Jul 24 06:34:30 2024] CR2: 00007f62bfb36000 CR3: 0000000781e3c003 CR4:
00000000003706f0
[Mi Jul 24 06:34:30 2024] Call Trace:
[Mi Jul 24 06:34:30 2024]  <TASK>
[Mi Jul 24 06:34:30 2024]  ? show_regs+0x6d/0x80
[Mi Jul 24 06:34:30 2024]  ? __warn+0x89/0x160
[Mi Jul 24 06:34:30 2024]  ? fill_dc_mst_payload_table_from_drm+0xb2/0x250
[amdgpu]
[Mi Jul 24 06:34:30 2024]  ? report_bug+0x17e/0x1b0
[Mi Jul 24 06:34:30 2024]  ? handle_bug+0x51/0xa0
[Mi Jul 24 06:34:30 2024]  ? exc_invalid_op+0x18/0x80
[Mi Jul 24 06:34:30 2024]  ? asm_exc_invalid_op+0x1b/0x20
[Mi Jul 24 06:34:30 2024]  ? fill_dc_mst_payload_table_from_drm+0xb2/0x250
[amdgpu]
[Mi Jul 24 06:34:30 2024]=20
dm_helpers_dp_mst_write_payload_allocation_table+0xc3/0x120 [amdgpu]
[Mi Jul 24 06:34:30 2024]  deallocate_mst_payload.isra.0+0x324/0x550 [amdgp=
u]
[Mi Jul 24 06:34:30 2024]  ? __pfx_process_timeout+0x10/0x10
[Mi Jul 24 06:34:30 2024]  link_set_dpms_off+0x281/0x3b0 [amdgpu]
[Mi Jul 24 06:34:30 2024]  ? dc_is_timing_changed+0x40/0x60 [amdgpu]
[Mi Jul 24 06:34:30 2024]  dce110_reset_hw_ctx_wrap+0xdd/0x300 [amdgpu]
[Mi Jul 24 06:34:30 2024]  dce110_apply_ctx_to_hw+0x5f/0x380 [amdgpu]
[Mi Jul 24 06:34:30 2024]  ? apply_ctx_interdependent_lock+0xf9/0x150 [amdg=
pu]
[Mi Jul 24 06:34:30 2024]  dc_commit_state_no_check+0x2ea/0xdd0 [amdgpu]
[Mi Jul 24 06:34:30 2024]  dc_commit_streams+0x30f/0x6b0 [amdgpu]
[Mi Jul 24 06:34:30 2024]  amdgpu_dm_commit_streams+0x5fe/0x780 [amdgpu]
[Mi Jul 24 06:34:30 2024]  amdgpu_dm_atomic_commit_tail+0xff/0x10b0 [amdgpu]
[Mi Jul 24 06:34:30 2024]  ? dc_validate_global_state.part.0+0x302/0x4c0
[amdgpu]
[Mi Jul 24 06:34:30 2024]  ? dc_validate_global_state+0x5d/0x80 [amdgpu]
[Mi Jul 24 06:34:30 2024]  ? __kmalloc+0x1c0/0x4f0
[Mi Jul 24 06:34:30 2024]  ? wait_for_completion_timeout+0x119/0x150
[Mi Jul 24 06:34:30 2024]  ? drm_dp_mst_atomic_setup_commit+0x91/0x1f0
[drm_display_helper]
[Mi Jul 24 06:34:30 2024]  ? drm_dp_mst_atomic_setup_commit+0x91/0x1f0
[drm_display_helper]
[Mi Jul 24 06:34:30 2024]  commit_tail+0xc6/0x1b0
[Mi Jul 24 06:34:30 2024]  drm_atomic_helper_commit+0x132/0x160
[Mi Jul 24 06:34:30 2024]  drm_atomic_commit+0x96/0xd0
[Mi Jul 24 06:34:30 2024]  ? __pfx___drm_printfn_info+0x10/0x10
[Mi Jul 24 06:34:30 2024]  atomic_remove_fb+0x2fa/0x380
[Mi Jul 24 06:34:30 2024]  drm_framebuffer_remove+0x6e/0x220
[Mi Jul 24 06:34:30 2024]  drm_mode_rmfb_work_fn+0x6f/0xa0
[Mi Jul 24 06:34:30 2024]  process_one_work+0x16c/0x350
[Mi Jul 24 06:34:30 2024]  worker_thread+0x306/0x440
[Mi Jul 24 06:34:30 2024]  ? _raw_spin_lock_irqsave+0xe/0x20
[Mi Jul 24 06:34:30 2024]  ? __pfx_worker_thread+0x10/0x10
[Mi Jul 24 06:34:30 2024]  kthread+0xef/0x120
[Mi Jul 24 06:34:30 2024]  ? __pfx_kthread+0x10/0x10
[Mi Jul 24 06:34:30 2024]  ret_from_fork+0x44/0x70
[Mi Jul 24 06:34:30 2024]  ? __pfx_kthread+0x10/0x10
[Mi Jul 24 06:34:30 2024]  ret_from_fork_asm+0x1b/0x30
[Mi Jul 24 06:34:30 2024]  </TASK>
[Mi Jul 24 06:34:30 2024] ---[ end trace 0000000000000000 ]---

[Mi Jul 24 06:34:33 2024] amdgpu 0000:01:00.0: [drm] enabling link 1 failed=
: 15

[Mi Jul 24 06:41:41 2024] DMAR: DRHD: handling fault status reg 3
[Mi Jul 24 06:41:41 2024] DMAR: [DMA Read NO_PASID] Request device [01:00.1]
fault addr 0xf3fc0000 [fault reason 0x06] PTE Read access is not set
[Mi Jul 24 06:41:41 2024] DMAR: DRHD: handling fault status reg 3
[Mi Jul 24 06:41:41 2024] DMAR: [DMA Read NO_PASID] Request device [01:00.1]
fault addr 0xf3fc0000 [fault reason 0x06] PTE Read access is not set
[Mi Jul 24 06:41:41 2024] DMAR: DRHD: handling fault status reg 3
[Mi Jul 24 06:41:41 2024] DMAR: [DMA Read NO_PASID] Request device [01:00.1]
fault addr 0xf3fc0000 [fault reason 0x06] PTE Read access is not set
[Mi Jul 24 06:41:41 2024] DMAR: DRHD: handling fault status reg 3


[Mi Jul 24 16:43:47 2024] [drm] DM_MST: stopping TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:43:49 2024] [drm] DM_MST: starting TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:43:49 2024] [drm] DM_MST: DP12, 4-lane link detected
[Mi Jul 24 16:43:50 2024] [drm] Synaptics Cascaded MST hub
[Mi Jul 24 16:43:50 2024] [drm] Downstream port present 1, type 0
[Mi Jul 24 16:43:53 2024] amdgpu 0000:01:00.0: [drm] enabling link 1 failed=
: 15
[Mi Jul 24 16:43:53 2024] [drm] DM_MST: stopping TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:44:01 2024] [drm] DM_MST: starting TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:44:01 2024] [drm] DM_MST: DP12, 4-lane link detected
[Mi Jul 24 16:44:01 2024] [drm] Synaptics Cascaded MST hub
[Mi Jul 24 16:44:01 2024] [drm] Downstream port present 1, type 0
[Mi Jul 24 16:44:04 2024] amdgpu 0000:01:00.0: [drm] enabling link 1 failed=
: 15
[Mi Jul 24 16:44:04 2024] [drm] DM_MST: stopping TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:44:05 2024] [drm] DM_MST: starting TM on aconnector:
000000007e84905a [id: 83]
[Mi Jul 24 16:44:05 2024] [drm] DM_MST: DP12, 4-lane link detected
[Mi Jul 24 16:44:05 2024] [drm] Downstream port present 1, type 0
[Mi Jul 24 16:44:05 2024] [drm] Downstream port present 1, type 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
