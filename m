Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF78B6357
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 22:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092110E5C9;
	Mon, 29 Apr 2024 20:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eb/whkyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909D10E3A6;
 Mon, 29 Apr 2024 20:14:12 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so5175865a12.1; 
 Mon, 29 Apr 2024 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714421651; x=1715026451; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OTgE80UFA0RiSGGQoRyJY9JnzIFcWeBPEVlASd9OaLA=;
 b=Eb/whkyEVELsbAFQJjFM6xtI/Zg0S08Gs4i79clK2QsEPOLVp4Tlrh+gubrdtDE4c1
 wN0miobyfS/RerliWDr1VCaKUWSKMUD6kZxKAC1nK1YB7J2Ml84I8AfIzI9rjQHf3iUv
 gwJLh6fNK4EqO8JrfuZe+IB4h116EkIMchBl4syBs0zPO3tVCASunokIR2IJhzfc/00N
 yAsJprLeVmmblFC9DITokWTL9BrxGOyaka19npFctmBLzQ0Iumx5CfH2gGwJooZyXu1A
 PD5RHEYXyBDHcfuP/Atzq47CcX4jUbcxpdJAIRxCFcDa3IK/5SXGcjNhND9B6TKxrhza
 kYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714421651; x=1715026451;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OTgE80UFA0RiSGGQoRyJY9JnzIFcWeBPEVlASd9OaLA=;
 b=U+0LPjcaeInZH3fWXwKabpIhNttbHGCeV1wOd53A4hb/6WNnCQGAcLdh4vHi7YvfAB
 lP3zLm8PurKDCTM2or52bqqOwyBOuXAycbkNnuzkrfNpP5UUwX2BLhrpQaxaP6bn0aQ4
 8oeJlams06wAdoZzIBfLWvMxOxhp+ZO/DiqBO1abZmT08LxypimqWf1gtCexgGLgNhzr
 bVheSaKvcCatLIZXsnzCSKHI7w7SeavETfxkNzZAjfYOKoc4G+C3oZmukTEQt9ZlPJ3e
 dlKWv+XgSJ8NZmuvVeEyvuLwq/ssEOz36xPFRpQU7/tZgKC51Y6N4v8Bfl9Z55WSuCEt
 ytqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPq5kbf+KAE+Yw2b/nAgGwyC2q/qG5ONBdsafMervTUkLOtqA67sqCtye42R9k7prjsS9JDqq477a2S+x3+SWw+RwOiIxDXlBGzpRy0Q==
X-Gm-Message-State: AOJu0YwiJOyAwkgo3K1qRCRZZmxX//nNE91WTMCUi93fcyZB3XdlU6VQ
 3bu7yC2pZrsf42ZHnK5ID+Yc31GEm/Slch7h8x2mfiCjKYbUrUaSgg/DUTGuJplDRjIy1ygqBAS
 UZaJEfL1WCK0atKVFXQwWG4slcIq6nl7MGbM=
X-Google-Smtp-Source: AGHT+IHDdWMfLCr9vuqaCXcFfZrDv4AOo/u+RNnFLmQb91mQ8gDpaQ7MeWTe6WCuy+Ne3a6fSS6hjqGqP9vKhOKsIMM=
X-Received: by 2002:a50:a456:0:b0:571:d380:95fd with SMTP id
 v22-20020a50a456000000b00571d38095fdmr441967edb.28.1714421650216; Mon, 29 Apr
 2024 13:14:10 -0700 (PDT)
MIME-Version: 1.0
From: Gregory Carter <gjcarter2@gmail.com>
Date: Mon, 29 Apr 2024 13:13:59 -0700
Message-ID: <CAE4jU7hFWbpkYvw2Yx9LFcZv_8Lk1qHvUM0mj=Z0dO+DVD5BrQ@mail.gmail.com>
Subject: AMD Dell m18 r1/7600XT Laptop Issue
 dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000074e158061741e510"
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

--00000000000074e158061741e510
Content-Type: text/plain; charset="UTF-8"

is this a bug or a support issue for this laptop?

[    4.739919] ------------[ cut here ]------------
[    4.739920] WARNING: CPU: 17 PID: 551 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172
dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740183] Modules linked in: amdgpu(+) video amdxcp i2c_algo_bit
drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper rtsx_pci_sdmmc
drm_buddy crct10dif_pclmul crc32_pclmul crc32c_intel mmc_core
drm_display_helper polyval_clmulni r8169 nvme ucsi_acpi polyval_generic
hid_multitouch nvme_core ghash_clmulni_intel sha512_ssse3 sha256_ssse3
sha1_ssse3 typec_ucsi ccp rtsx_pci sp5100_tco cec realtek nvme_auth typec
i2c_hid_acpi wmi i2c_hid serio_raw scsi_dh_rdac scsi_dh_emc scsi_dh_alua
fuse i2c_dev
[    4.740203] CPU: 17 PID: 551 Comm: (udev-worker) Not tainted
6.8.7-300.fc40.x86_64 #1
[    4.740205] Hardware name: Alienware Alienware m18 R1 AMD/0XY1HF, BIOS
1.12.0 03/08/2024
[    4.740206] RIP: 0010:dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740363] Code: 57 10 8b 56 0c 85 d2 74 28 83 fa 01 74 23 48 8b 40 10
48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c7 c6 98 5d 1e c1 e8 17 2f ef fa
<0f> 0b ba 0f 00 00 00 89 53 14 5b c3 cc cc cc cc 0f 1f 80 00 00 00
[    4.740365] RSP: 0018:ffff96b840ffb3a8 EFLAGS: 00010246
[    4.740367] RAX: 0000000000000000 RBX: ffff899850d07a40 RCX:
0000000000000027
[    4.740368] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff89a73da618c0
[    4.740369] RBP: ffff96b840ffb3e8 R08: 0000000000000000 R09:
ffff96b840ffb160
[    4.740370] R10: ffffffffbd516808 R11: 0000000000000003 R12:
ffff96b840ffb43c
[    4.740371] R13: ffffffffc10902a0 R14: ffff96b840ffb7a0 R15:
ffff89984f99f800
[    4.740372] FS:  00007f9f756d0980(0000) GS:ffff89a73da40000(0000)
knlGS:0000000000000000
[    4.740373] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.740374] CR2: 00007f9f764e5b00 CR3: 0000000110086000 CR4:
0000000000f50ef0
[    4.740375] PKRU: 55555554
[    4.740376] Call Trace:
[    4.740378]  <TASK>
[    4.740379]  ? dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740525]  ? __warn+0x81/0x130
[    4.740529]  ? dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740663]  ? report_bug+0x16f/0x1a0
[    4.740666]  ? handle_bug+0x3c/0x80
[    4.740667]  ? exc_invalid_op+0x17/0x70
[    4.740669]  ? asm_exc_invalid_op+0x1a/0x20
[    4.740671]  ? dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740802]  ? dcn31_panel_cntl_construct+0x49/0x60 [amdgpu]
[    4.740930]  dcn32_panel_cntl_create+0x37/0x50 [amdgpu]
[    4.741076]  construct_phy+0xac6/0xd30 [amdgpu]
[    4.741225]  link_create+0x1da/0x210 [amdgpu]
[    4.741359]  create_links+0x134/0x420 [amdgpu]
[    4.741504]  dc_create+0x316/0x650 [amdgpu]
[    4.741645]  amdgpu_dm_init.isra.0+0x2d4/0x1fb0 [amdgpu]
[    4.741803]  ? prb_read_valid+0x1b/0x30
[    4.741806]  ? console_unlock+0x84/0x130
[    4.741807]  ? __wake_up_klogd.part.0+0x3c/0x60
[    4.741809]  ? vprintk_emit+0x175/0x2c0
[    4.741810]  ? dev_printk_emit+0xa3/0xd0
[    4.741812]  ? __pfx_smu_v13_0_update_pcie_parameters+0x10/0x10 [amdgpu]
[    4.741952]  dm_hw_init+0x12/0x30 [amdgpu]
[    4.742094]  amdgpu_device_init+0x1e9d/0x26d0 [amdgpu]
[    4.742208]  amdgpu_driver_load_kms+0x19/0x190 [amdgpu]
[    4.742318]  amdgpu_pci_probe+0x18b/0x510 [amdgpu]
[    4.742427]  local_pci_probe+0x42/0xa0
[    4.742430]  pci_device_probe+0xc1/0x280
[    4.742432]  really_probe+0x19b/0x3e0
[    4.742434]  ? __pfx___driver_attach+0x10/0x10
[    4.742435]  __driver_probe_device+0x78/0x160
[    4.742437]  driver_probe_device+0x1f/0xa0
[    4.742438]  __driver_attach+0xba/0x1c0
[    4.742440]  bus_for_each_dev+0x8c/0xe0
[    4.742441]  bus_add_driver+0x116/0x220
[    4.742443]  driver_register+0x5c/0x100
[    4.742445]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
[    4.742559]  do_one_initcall+0x58/0x320
[    4.742562]  do_init_module+0x60/0x240
[    4.742564]  __do_sys_init_module+0x17a/0x1b0
[    4.742566]  do_syscall_64+0x83/0x170
[    4.742569]  ? __count_memcg_events+0x4d/0xc0
[    4.742570]  ? count_memcg_events.constprop.0+0x1a/0x30
[    4.742572]  ? handle_mm_fault+0x1f2/0x350
[    4.742574]  ? do_user_addr_fault+0x304/0x670
[    4.742576]  ? exc_page_fault+0x7f/0x180
[    4.742577]  entry_SYSCALL_64_after_hwframe+0x78/0x80
[    4.742579] RIP: 0033:0x7f9f760a357e
[    4.742588] Code: 48 8b 0d 9d 98 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66
2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6a 98 0c 00 f7 d8 64 89 01 48
[    4.742590] RSP: 002b:00007ffdbdc2ba08 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[    4.742592] RAX: ffffffffffffffda RBX: 000055a1d88a69e0 RCX:
00007f9f760a357e
[    4.742593] RDX: 00007f9f761bb07d RSI: 00000000019e11a6 RDI:
00007f9f73c00010
[    4.742594] RBP: 00007ffdbdc2bac0 R08: 000055a1d8874010 R09:
0000000000000007
[    4.742594] R10: 0000000000000001 R11: 0000000000000246 R12:
00007f9f761bb07d
[    4.742598] R13: 0000000000020000 R14: 000055a1d88a4d70 R15:
000055a1d88b0990
[    4.742599]  </TASK>
[    4.742600] ---[ end trace 0000000000000000 ]---

Hardware Information

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: AMD (0x1002)
    Device: AMD Radeon RX 7600M XT (radeonsi, navi33, LLVM 18.1.1, DRM
3.57, 6.8.7-300.fc40.x86_64) (0x7480)
    Version: 24.0.6
    Accelerated: yes
    Video memory: 8192MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2

00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14d8
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Device 14d9
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:01.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:03.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14db
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd
00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev
71)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Upstream Port of PCI Express Switch (rev 12)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch (rev 12)
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Navi 33 [Radeon RX 7700S/7600/7600S/7600M XT/PRO W7600] (rev c7)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31
HDMI/DP Audio
04:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD
Controller PM9A1/PM9A3/980PRO
05:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD
Controller SM981/PM981/PM983
06:00.0 PCI bridge: ASMedia Technology Inc. Device 242a (rev 01)
07:02.0 PCI bridge: ASMedia Technology Inc. Device 242b (rev 01)
08:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
09:00.0 Network controller: Intel Corporation Wi-Fi 6E(802.11ax)
AX210/AX1675* 2x2 [Typhoon Peak] (rev 1a)
0a:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A
PCI Express Card Reader (rev 01)
0b:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE
Controller (rev 05)
0c:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Phoenix PCIe Dummy Function (rev d9)
0c:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family
19h PSP/CCP
0c:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b6
0c:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b7
0c:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 62)
0c:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD
Audio Controller
0d:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b8

Kernel Startup Parameters

[    0.000000] Command line:
BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.8.7-300.fc40.x86_64
root=UUID=ac66d86f-a430-4aef-8f35-53cc5f761de5 ro selinux=0 mitigations=off

--00000000000074e158061741e510
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>is this a bug or a support issue for this laptop?<br>=
</div><div><br></div><div>[ =C2=A0 =C2=A04.739919] ------------[ cut here ]=
------------</div>[ =C2=A0 =C2=A04.739920] WARNING: CPU: 17 PID: 551 at dri=
vers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 dcn31_pa=
nel_cntl_construct+0x49/0x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740183] Modules l=
inked in: amdgpu(+) video amdxcp i2c_algo_bit drm_ttm_helper ttm drm_exec g=
pu_sched drm_suballoc_helper rtsx_pci_sdmmc drm_buddy crct10dif_pclmul crc3=
2_pclmul crc32c_intel mmc_core drm_display_helper polyval_clmulni r8169 nvm=
e ucsi_acpi polyval_generic hid_multitouch nvme_core ghash_clmulni_intel sh=
a512_ssse3 sha256_ssse3 sha1_ssse3 typec_ucsi ccp rtsx_pci sp5100_tco cec r=
ealtek nvme_auth typec i2c_hid_acpi wmi i2c_hid serio_raw scsi_dh_rdac scsi=
_dh_emc scsi_dh_alua fuse i2c_dev<br>[ =C2=A0 =C2=A04.740203] CPU: 17 PID: =
551 Comm: (udev-worker) Not tainted 6.8.7-300.fc40.x86_64 #1<br>[ =C2=A0 =
=C2=A04.740205] Hardware name: Alienware Alienware m18 R1 AMD/0XY1HF, BIOS =
1.12.0 03/08/2024<br>[ =C2=A0 =C2=A04.740206] RIP: 0010:dcn31_panel_cntl_co=
nstruct+0x49/0x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740363] Code: 57 10 8b 56 0c=
 85 d2 74 28 83 fa 01 74 23 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08=
 48 c7 c6 98 5d 1e c1 e8 17 2f ef fa &lt;0f&gt; 0b ba 0f 00 00 00 89 53 14 =
5b c3 cc cc cc cc 0f 1f 80 00 00 00<br>[ =C2=A0 =C2=A04.740365] RSP: 0018:f=
fff96b840ffb3a8 EFLAGS: 00010246<br>[ =C2=A0 =C2=A04.740367] RAX: 000000000=
0000000 RBX: ffff899850d07a40 RCX: 0000000000000027<br>[ =C2=A0 =C2=A04.740=
368] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff89a73da618c0<br>[=
 =C2=A0 =C2=A04.740369] RBP: ffff96b840ffb3e8 R08: 0000000000000000 R09: ff=
ff96b840ffb160<br>[ =C2=A0 =C2=A04.740370] R10: ffffffffbd516808 R11: 00000=
00000000003 R12: ffff96b840ffb43c<br>[ =C2=A0 =C2=A04.740371] R13: ffffffff=
c10902a0 R14: ffff96b840ffb7a0 R15: ffff89984f99f800<br>[ =C2=A0 =C2=A04.74=
0372] FS: =C2=A000007f9f756d0980(0000) GS:ffff89a73da40000(0000) knlGS:0000=
000000000000<br>[ =C2=A0 =C2=A04.740373] CS: =C2=A00010 DS: 0000 ES: 0000 C=
R0: 0000000080050033<br>[ =C2=A0 =C2=A04.740374] CR2: 00007f9f764e5b00 CR3:=
 0000000110086000 CR4: 0000000000f50ef0<br>[ =C2=A0 =C2=A04.740375] PKRU: 5=
5555554<br>[ =C2=A0 =C2=A04.740376] Call Trace:<br>[ =C2=A0 =C2=A04.740378]=
 =C2=A0&lt;TASK&gt;<br>[ =C2=A0 =C2=A04.740379] =C2=A0? dcn31_panel_cntl_co=
nstruct+0x49/0x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740525] =C2=A0? __warn+0x81/=
0x130<br>[ =C2=A0 =C2=A04.740529] =C2=A0? dcn31_panel_cntl_construct+0x49/0=
x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740663] =C2=A0? report_bug+0x16f/0x1a0<br>=
[ =C2=A0 =C2=A04.740666] =C2=A0? handle_bug+0x3c/0x80<br>[ =C2=A0 =C2=A04.7=
40667] =C2=A0? exc_invalid_op+0x17/0x70<br>[ =C2=A0 =C2=A04.740669] =C2=A0?=
 asm_exc_invalid_op+0x1a/0x20<br>[ =C2=A0 =C2=A04.740671] =C2=A0? dcn31_pan=
el_cntl_construct+0x49/0x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740802] =C2=A0? dc=
n31_panel_cntl_construct+0x49/0x60 [amdgpu]<br>[ =C2=A0 =C2=A04.740930] =C2=
=A0dcn32_panel_cntl_create+0x37/0x50 [amdgpu]<br>[ =C2=A0 =C2=A04.741076] =
=C2=A0construct_phy+0xac6/0xd30 [amdgpu]<br>[ =C2=A0 =C2=A04.741225] =C2=A0=
link_create+0x1da/0x210 [amdgpu]<br>[ =C2=A0 =C2=A04.741359] =C2=A0create_l=
inks+0x134/0x420 [amdgpu]<br>[ =C2=A0 =C2=A04.741504] =C2=A0dc_create+0x316=
/0x650 [amdgpu]<br>[ =C2=A0 =C2=A04.741645] =C2=A0amdgpu_dm_init.isra.0+0x2=
d4/0x1fb0 [amdgpu]<br>[ =C2=A0 =C2=A04.741803] =C2=A0? prb_read_valid+0x1b/=
0x30<br>[ =C2=A0 =C2=A04.741806] =C2=A0? console_unlock+0x84/0x130<br>[ =C2=
=A0 =C2=A04.741807] =C2=A0? __wake_up_klogd.part.0+0x3c/0x60<br>[ =C2=A0 =
=C2=A04.741809] =C2=A0? vprintk_emit+0x175/0x2c0<br>[ =C2=A0 =C2=A04.741810=
] =C2=A0? dev_printk_emit+0xa3/0xd0<br>[ =C2=A0 =C2=A04.741812] =C2=A0? __p=
fx_smu_v13_0_update_pcie_parameters+0x10/0x10 [amdgpu]<br>[ =C2=A0 =C2=A04.=
741952] =C2=A0dm_hw_init+0x12/0x30 [amdgpu]<br>[ =C2=A0 =C2=A04.742094] =C2=
=A0amdgpu_device_init+0x1e9d/0x26d0 [amdgpu]<br>[ =C2=A0 =C2=A04.742208] =
=C2=A0amdgpu_driver_load_kms+0x19/0x190 [amdgpu]<br>[ =C2=A0 =C2=A04.742318=
] =C2=A0amdgpu_pci_probe+0x18b/0x510 [amdgpu]<br>[ =C2=A0 =C2=A04.742427] =
=C2=A0local_pci_probe+0x42/0xa0<br>[ =C2=A0 =C2=A04.742430] =C2=A0pci_devic=
e_probe+0xc1/0x280<br>[ =C2=A0 =C2=A04.742432] =C2=A0really_probe+0x19b/0x3=
e0<br>[ =C2=A0 =C2=A04.742434] =C2=A0? __pfx___driver_attach+0x10/0x10<br>[=
 =C2=A0 =C2=A04.742435] =C2=A0__driver_probe_device+0x78/0x160<br>[ =C2=A0 =
=C2=A04.742437] =C2=A0driver_probe_device+0x1f/0xa0<br>[ =C2=A0 =C2=A04.742=
438] =C2=A0__driver_attach+0xba/0x1c0<br>[ =C2=A0 =C2=A04.742440] =C2=A0bus=
_for_each_dev+0x8c/0xe0<br>[ =C2=A0 =C2=A04.742441] =C2=A0bus_add_driver+0x=
116/0x220<br>[ =C2=A0 =C2=A04.742443] =C2=A0driver_register+0x5c/0x100<br>[=
 =C2=A0 =C2=A04.742445] =C2=A0? __pfx_amdgpu_init+0x10/0x10 [amdgpu]<br>[ =
=C2=A0 =C2=A04.742559] =C2=A0do_one_initcall+0x58/0x320<br>[ =C2=A0 =C2=A04=
.742562] =C2=A0do_init_module+0x60/0x240<br>[ =C2=A0 =C2=A04.742564] =C2=A0=
__do_sys_init_module+0x17a/0x1b0<br>[ =C2=A0 =C2=A04.742566] =C2=A0do_sysca=
ll_64+0x83/0x170<br>[ =C2=A0 =C2=A04.742569] =C2=A0? __count_memcg_events+0=
x4d/0xc0<br>[ =C2=A0 =C2=A04.742570] =C2=A0? count_memcg_events.constprop.0=
+0x1a/0x30<br>[ =C2=A0 =C2=A04.742572] =C2=A0? handle_mm_fault+0x1f2/0x350<=
br>[ =C2=A0 =C2=A04.742574] =C2=A0? do_user_addr_fault+0x304/0x670<br>[ =C2=
=A0 =C2=A04.742576] =C2=A0? exc_page_fault+0x7f/0x180<br>[ =C2=A0 =C2=A04.7=
42577] =C2=A0entry_SYSCALL_64_after_hwframe+0x78/0x80<br>[ =C2=A0 =C2=A04.7=
42579] RIP: 0033:0x7f9f760a357e<br>[ =C2=A0 =C2=A04.742588] Code: 48 8b 0d =
9d 98 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 =
f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c=
3 48 8b 0d 6a 98 0c 00 f7 d8 64 89 01 48<br>[ =C2=A0 =C2=A04.742590] RSP: 0=
02b:00007ffdbdc2ba08 EFLAGS: 00000246 ORIG_RAX: 00000000000000af<br>[ =C2=
=A0 =C2=A04.742592] RAX: ffffffffffffffda RBX: 000055a1d88a69e0 RCX: 00007f=
9f760a357e<br>[ =C2=A0 =C2=A04.742593] RDX: 00007f9f761bb07d RSI: 000000000=
19e11a6 RDI: 00007f9f73c00010<br>[ =C2=A0 =C2=A04.742594] RBP: 00007ffdbdc2=
bac0 R08: 000055a1d8874010 R09: 0000000000000007<br>[ =C2=A0 =C2=A04.742594=
] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f9f761bb07d<br>[ =
=C2=A0 =C2=A04.742598] R13: 0000000000020000 R14: 000055a1d88a4d70 R15: 000=
055a1d88b0990<br>[ =C2=A0 =C2=A04.742599] =C2=A0&lt;/TASK&gt;<br><div>[ =C2=
=A0 =C2=A04.742600] ---[ end trace 0000000000000000 ]---</div><div><br></di=
v><div>Hardware Information</div><div><br></div><div>Extended renderer info=
 (GLX_MESA_query_renderer):<br>=C2=A0 =C2=A0 Vendor: AMD (0x1002)<br>=C2=A0=
 =C2=A0 Device: AMD Radeon RX 7600M XT (radeonsi, navi33, LLVM 18.1.1, DRM =
3.57, 6.8.7-300.fc40.x86_64) (0x7480)<br>=C2=A0 =C2=A0 Version: 24.0.6<br>=
=C2=A0 =C2=A0 Accelerated: yes<br>=C2=A0 =C2=A0 Video memory: 8192MB<br>=C2=
=A0 =C2=A0 Unified memory: no<br>=C2=A0 =C2=A0 Preferred profile: core (0x1=
)<br>=C2=A0 =C2=A0 Max core profile version: 4.6<br>=C2=A0 =C2=A0 Max compa=
t profile version: 4.6<br>=C2=A0 =C2=A0 Max GLES1 profile version: 1.1<br>=
=C2=A0 =C2=A0 Max GLES[23] profile version: 3.2</div><div><br></div><div>00=
:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14d8<br>00:00.=
2 IOMMU: Advanced Micro Devices, Inc. [AMD] Device 14d9<br>00:01.0 Host bri=
dge: Advanced Micro Devices, Inc. [AMD] Device 14da<br>00:01.1 PCI bridge: =
Advanced Micro Devices, Inc. [AMD] Device 14db<br>00:01.2 PCI bridge: Advan=
ced Micro Devices, Inc. [AMD] Device 14db<br>00:01.3 PCI bridge: Advanced M=
icro Devices, Inc. [AMD] Device 14db<br>00:02.0 Host bridge: Advanced Micro=
 Devices, Inc. [AMD] Device 14da<br>00:02.1 PCI bridge: Advanced Micro Devi=
ces, Inc. [AMD] Device 14db<br>00:02.2 PCI bridge: Advanced Micro Devices, =
Inc. [AMD] Device 14db<br>00:03.0 Host bridge: Advanced Micro Devices, Inc.=
 [AMD] Device 14da<br>00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD=
] Device 14db<br>00:03.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Dev=
ice 14db<br>00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device =
14da<br>00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14da=
<br>00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd<br>0=
0:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14dd<br>00:14.=
0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 71)<b=
r>00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (re=
v 51)<br>00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e=
0<br>00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e1<br=
>00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e2<br>00:=
18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e3<br>00:18.4=
 Host bridge: Advanced Micro Devices, Inc. [AMD] Device 14e4<br>00:18.5 Hos=
t bridge: Advanced Micro Devices, Inc. [AMD] Device 14e5<br>00:18.6 Host br=
idge: Advanced Micro Devices, Inc. [AMD] Device 14e6<br>00:18.7 Host bridge=
: Advanced Micro Devices, Inc. [AMD] Device 14e7<br>01:00.0 PCI bridge: Adv=
anced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express=
 Switch (rev 12)<br>02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/A=
TI] Navi 10 XL Downstream Port of PCI Express Switch (rev 12)<br>03:00.0 VG=
A compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 33 [Ra=
deon RX 7700S/7600/7600S/7600M XT/PRO W7600] (rev c7)<br>03:00.1 Audio devi=
ce: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 HDMI/DP Audio<br>04:00.0=
 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Contro=
ller PM9A1/PM9A3/980PRO<br>05:00.0 Non-Volatile memory controller: Samsung =
Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983<br>06:00.0 PCI bri=
dge: ASMedia Technology Inc. Device 242a (rev 01)<br>07:02.0 PCI bridge: AS=
Media Technology Inc. Device 242b (rev 01)<br>08:00.0 USB controller: ASMed=
ia Technology Inc. Device 242c (rev 01)<br>09:00.0 Network controller: Inte=
l Corporation Wi-Fi 6E(802.11ax) AX210/AX1675* 2x2 [Typhoon Peak] (rev 1a)<=
br>0a:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A=
 PCI Express Card Reader (rev 01)<br>0b:00.0 Ethernet controller: Realtek S=
emiconductor Co., Ltd. RTL8125 2.5GbE Controller (rev 05)<br>0c:00.0 Non-Es=
sential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Phoenix =
PCIe Dummy Function (rev d9)<br>0c:00.2 Encryption controller: Advanced Mic=
ro Devices, Inc. [AMD] Family 19h PSP/CCP<br>0c:00.3 USB controller: Advanc=
ed Micro Devices, Inc. [AMD] Device 15b6<br>0c:00.4 USB controller: Advance=
d Micro Devices, Inc. [AMD] Device 15b7<br>0c:00.5 Multimedia controller: A=
dvanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor (rev 62=
)<br>0c:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19=
h HD Audio Controller<br>0d:00.0 USB controller: Advanced Micro Devices, In=
c. [AMD] Device 15b8</div><div><br></div><div>Kernel Startup Parameters</di=
v><div><br></div>[ =C2=A0 =C2=A00.000000] Command line: BOOT_IMAGE=3D(hd1,g=
pt2)/vmlinuz-6.8.7-300.fc40.x86_64 root=3DUUID=3Dac66d86f-a430-4aef-8f35-53=
cc5f761de5 ro selinux=3D0 mitigations=3Doff<div><span style=3D"font-family:=
monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"><br></span></span></div><div><span style=3D"font-family:monospace"><span=
 style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></=
span></div><div><br></div></div>

--00000000000074e158061741e510--
