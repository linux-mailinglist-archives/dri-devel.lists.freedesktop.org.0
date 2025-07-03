Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24CFAF7338
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 14:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F53410E81A;
	Thu,  3 Jul 2025 12:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="NjW3FxR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 12:05:16 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16C410E81A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1751544313; x=1752149113; i=spasswolf@web.de;
 bh=fAi+xSb6cOO9vl4vl/HW3tePddcQqHbTiegUCqMdoew=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NjW3FxR0oSQxCk0eHk7cf8KJ+g4VrIJL/9U1OloQIVvbI8sxVDcPzJdmQz8YlS3s
 s58yw/mjrsday8o8vQfcGNxl6cXu5bbFecSoRik0EMU9B1Gx9LoC+1IADWgUWw0Ao
 /iQ+GvM2u7swz63LK+EGxGkDmUvhdCRPWayhoLToWRrm0CrnoDyU8/snFcwMa01IM
 NWFAAK/sgx///Vsg9VS/oHtn0Co+85gSnBoUM+VsPwAe1yOmKfvyhV9EIb70wSJY9
 S+oLEZCTlUiQJTWKurHZyFuFGZHJ+vdEr2xLriGqMdwlyn7Hx4p4OAvP2OKkF4azo
 oZ6XH9MN2SgpEtDHmQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa ([95.223.134.88]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaWF-1uqu3323Jr-015Cjx; Thu, 03
 Jul 2025 13:59:18 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Warnings in next-20250703 caused by commit 582111e630f5
Date: Thu,  3 Jul 2025 13:59:14 +0200
Message-ID: <20250703115915.3096-1-spasswolf@web.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: 20250630084001.293053-1-tzimmermann@suse.de
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8KV1YE7CqG6BhWOT9B5AdHrB9j349dXCEMpC4JxUYVHC7B5AxQp
 rElPAVGBHD7zzuHSe9uBeoGQmiTeRwoAzWcaQiK25MR+3gjDrbuwE7r2EhroPadRQqHl0r0
 RMQiT5t7wVcj0ku0wiSP67RK0HOWeaeKr4H6ccVKDcRFXE3fLCJyFuch/kWoz5vWhFC7I9A
 8ZsaYnbLUpaxGXyntTqVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ax1T7Wwa3/Q=;eN8isI5Oa+cgN88fN6akCXOUUk2
 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
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

When booting next-20250703 on my Msi Alpha 15 Laptop running debian sid (la=
st
updated 20250703) I get a several warnings of the following kind:

    [    8.702999] [   T1628] ------------[ cut here ]------------
    [    8.703001] [   T1628] WARNING: drivers/gpu/drm/drm_gem.c:287 at drm=
_gem_object_handle_put_unlocked+0xaa/0xe0, CPU#14: Xorg/1628
    [    8.703007] [   T1628] Modules linked in: snd_seq_dummy snd_hrtimer =
snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm b=
nep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_hda_codec_realtek snd_hda_=
codec_generic snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel btu=
sb snd_intel_dspcfg btrtl btintel snd_hda_codec uvcvideo snd_soc_dmic snd_a=
cp3x_pdm_dma btbcm snd_acp3x_rn btmtk snd_hwdep videobuf2_vmalloc snd_soc_c=
ore snd_hda_core videobuf2_memops snd_pcm_oss uvc videobuf2_v4l2 bluetooth =
snd_mixer_oss videodev snd_pcm snd_rn_pci_acp3x videobuf2_common snd_acp_co=
nfig snd_timer msi_wmi ecdh_generic snd_soc_acpi ecc mc sparse_keymap snd w=
mi_bmof edac_mce_amd k10temp soundcore snd_pci_acp3x ccp ac battery button =
joydev hid_sensor_accel_3d hid_sensor_prox hid_sensor_als hid_sensor_magn_3=
d hid_sensor_gyro_3d hid_sensor_trigger industrialio_triggered_buffer kfifo=
_buf industrialio hid_sensor_iio_common amd_pmc evdev mt7921e mt7921_common=
 mt792x_lib mt76_connac_lib mt76 mac80211 libarc4 cfg80211 rfkill msr fuse
    [    8.703056] [   T1628]  nvme_fabrics efi_pstore configfs efivarfs au=
tofs4 ext4 mbcache jbd2 usbhid amdgpu drm_client_lib i2c_algo_bit drm_ttm_h=
elper ttm drm_panel_backlight_quirks drm_exec drm_suballoc_helper amdxcp dr=
m_buddy xhci_pci gpu_sched xhci_hcd drm_display_helper hid_sensor_hub hid_m=
ultitouch mfd_core hid_generic drm_kms_helper psmouse i2c_hid_acpi nvme usb=
core amd_sfh i2c_hid hid cec serio_raw nvme_core r8169 crc16 i2c_piix4 usb_=
common i2c_smbus i2c_designware_platform i2c_designware_core
    [    8.703082] [   T1628] CPU: 14 UID: 1000 PID: 1628 Comm: Xorg Not ta=
inted 6.16.0-rc4-next-20250703-master #127 PREEMPT_{RT,(full)}
    [    8.703085] [   T1628] Hardware name: Micro-Star International Co., =
Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
    [    8.703086] [   T1628] RIP: 0010:drm_gem_object_handle_put_unlocked+=
0xaa/0xe0
    [    8.703088] [   T1628] Code: c7 f6 8a ff 48 89 ef e8 94 d4 2e 00 eb =
d8 48 8b 43 08 48 8d b8 d8 06 00 00 e8 52 78 2b 00 c7 83 08 01 00 00 00 00 =
00 00 eb 98 <0f> 0b 5b 5d e9 98 f6 8a ff 48 8b 83 68 01 00 00 48 8b 00 48 8=
5 c0
    [    8.703089] [   T1628] RSP: 0018:ffffb8e8c7fbfb00 EFLAGS: 00010246
    [    8.703091] [   T1628] RAX: 0000000000000000 RBX: 0000000000000001 R=
CX: 0000000000000000
    [    8.703092] [   T1628] RDX: 0000000000000000 RSI: ffff94cdc062b478 R=
DI: ffff94ce71390448
    [    8.703093] [   T1628] RBP: ffff94ce14780010 R08: ffff94cdc062b618 R=
09: ffff94ce14780278
    [    8.703094] [   T1628] R10: 0000000000000001 R11: ffff94cdc062b478 R=
12: ffff94ce14780010
    [    8.703095] [   T1628] R13: 0000000000000007 R14: 0000000000000004 R=
15: ffff94ce14780010
    [    8.703096] [   T1628] FS:  00007fc164276b00(0000) GS:ffff94dcb49cf0=
00(0000) knlGS:0000000000000000
    [    8.703097] [   T1628] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
    [    8.703098] [   T1628] CR2: 00005647ccd53008 CR3: 000000012533f000 C=
R4: 0000000000750ef0
    [    8.703099] [   T1628] PKRU: 55555554
    [    8.703100] [   T1628] Call Trace:
    [    8.703101] [   T1628]  <TASK>
    [    8.703104] [   T1628]  drm_gem_fb_destroy+0x27/0x50 [drm_kms_helper]
    [    8.703113] [   T1628]  __drm_atomic_helper_plane_destroy_state+0x1a=
/0xa0 [drm_kms_helper]
    [    8.703119] [   T1628]  drm_atomic_helper_plane_destroy_state+0x10/0=
x20 [drm_kms_helper]
    [    8.703124] [   T1628]  drm_atomic_state_default_clear+0x1c0/0x2e0
    [    8.703127] [   T1628]  __drm_atomic_state_free+0x6c/0xb0
    [    8.703129] [   T1628]  drm_atomic_helper_disable_plane+0x92/0xe0 [d=
rm_kms_helper]
    [    8.703135] [   T1628]  drm_mode_cursor_universal+0xf2/0x2a0
    [    8.703140] [   T1628]  drm_mode_cursor_common.part.0+0x9c/0x1e0
    [    8.703144] [   T1628]  ? drm_mode_setplane+0x320/0x320
    [    8.703146] [   T1628]  drm_mode_cursor_ioctl+0x8a/0xa0
    [    8.703148] [   T1628]  drm_ioctl_kernel+0xa1/0xf0
    [    8.703151] [   T1628]  drm_ioctl+0x26a/0x510
    [    8.703153] [   T1628]  ? drm_mode_setplane+0x320/0x320
    [    8.703155] [   T1628]  ? srso_alias_return_thunk+0x5/0xfbef5
    [    8.703157] [   T1628]  ? rt_spin_unlock+0x12/0x40
    [    8.703159] [   T1628]  ? do_setitimer+0x185/0x1d0
    [    8.703161] [   T1628]  ? srso_alias_return_thunk+0x5/0xfbef5
    [    8.703164] [   T1628]  amdgpu_drm_ioctl+0x46/0x90 [amdgpu]
    [    8.703283] [   T1628]  __x64_sys_ioctl+0x91/0xe0
    [    8.703286] [   T1628]  do_syscall_64+0x65/0xfc0
    [    8.703289] [   T1628]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
    [    8.703291] [   T1628] RIP: 0033:0x7fc1645f78db
    [    8.703292] [   T1628] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 =
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 0=
0 00
    [    8.703294] [   T1628] RSP: 002b:00007ffd75bce430 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000010
    [    8.703295] [   T1628] RAX: ffffffffffffffda RBX: 000056224e896ea0 R=
CX: 00007fc1645f78db
    [    8.703296] [   T1628] RDX: 00007ffd75bce4c0 RSI: 00000000c01c64a3 R=
DI: 000000000000000f
    [    8.703297] [   T1628] RBP: 00007ffd75bce4c0 R08: 0000000000000100 R=
09: 0000562210547ab0
    [    8.703298] [   T1628] R10: 000000000000004c R11: 0000000000000246 R=
12: 00000000c01c64a3
    [    8.703298] [   T1628] R13: 000000000000000f R14: 0000000000000000 R=
15: 000056224e5c1cd0
    [    8.703302] [   T1628]  </TASK>
    [    8.703303] [   T1628] ---[ end trace 0000000000000000 ]---

As the warnings do not occur in next-20250702, I looked at the commits give=
n by
$ git log --oneline next-20250702..next-20250703 drivers/gpu/drm
to search for a culprit. So I reverted the most likely candidate,
commit 582111e630f5 ("drm/gem: Acquire references on GEM handles for frameb=
uffers"),
in next-20250703 and the warnings disappeared.
This is the hardware I used:
$ lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne Root=
 Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe=
 GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam Port of PCI Express Switch (rev c3)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downs=
tream Port of PCI Express Switch
03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 =
[Radeon RX 6600/6600 XT/6600M] (rev c3)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDM=
I/DP Audio Controller
04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
211/8411 PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. K=
C3000/FURY Renegade NVMe SSD [E18] (rev 01)
07:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 NVMe P=
CIe SSD[Frampton] (rev 03)
08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] C=
ezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c5)
08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon =
High Definition Audio Controller
08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17=
h (Models 10h-1fh) Platform Security Processor
08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB 3.1
08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB 3.1
08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Audio Cop=
rocessor (rev 01)
08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/1ah=
 HD Audio Controller
08:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD] Se=
nsor Fusion Hub


Bert Karwatzki
