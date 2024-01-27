Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859AD83ED3D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 14:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C710FEE8;
	Sat, 27 Jan 2024 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0DA10FEE8;
 Sat, 27 Jan 2024 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j460abbTum7jLNtngWFF5CRs5bwdXXz1lvyWrkSYPzk=; b=uVHZlZhCfQdnSp6dsj9Nlhtchc
 DSGCEUCM+wrgBIMiOn73gCyvtSXb2NqDVbVW0L44Vh3ZSXasjRSErRiaI7Anunli/KfisUGZBLm++
 WiNd90gsZR3XcnCRyxmwaGOLirL8e7LzIf4ePDs2QaiLNbVuVz1hfJ7mlV+OZ/ai67267yUZNO0uK
 VouoyYcEB8qA1vMHcigst7M+yLlqMISPUGjNY+N4M+KBwzzRawHTKvTFBjL8zQ/q9aFaznovTZFoh
 IkKgUbEbhLKOifYRhAgrBU6kTJzBYfctYsqG224B1KbRT8ryaw4FeXSiYk/2NJGPDsPAh2EInpC4F
 oaL87Dog==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1rTiWQ-003UJH-4O; Sat, 27 Jan 2024 13:14:58 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id 195E9BE2DE0; Sat, 27 Jan 2024 14:14:57 +0100 (CET)
Date: Sat, 27 Jan 2024 14:14:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Patrice Duroux <patrice.duroux@gmail.com>, 1061449@bugs.debian.org,
 Lewis Huang <lewis.huang@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Phil Hsieh <phil.hsieh@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: Bug#1061449: linux-image-6.7-amd64: a boot message from amdgpu
Message-ID: <ZbUB0YWxEET3Y0xA@eldamar.lan>
References: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
X-Debian-User: carnil
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
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

In Debian (https://bugs.debian.org/1061449) we got the following
quotred report:

On Wed, Jan 24, 2024 at 07:38:16PM +0100, Patrice Duroux wrote:
> Package: src:linux
> Version: 6.7.1-1~exp1
> Severity: normal
> 
> Dear Maintainer,
> 
> Giving a try to 6.7, here is a message extracted from dmesg:
> 
> [    4.177226] ------------[ cut here ]------------
> [    4.177227] WARNING: CPU: 6 PID: 248 at
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:387
> construct_phy+0xb26/0xd60 [amdgpu]
> [    4.177658] Modules linked in: amdgpu(+) i915(+) sd_mod drm_exec amdxcp
> gpu_sched drm_buddy nvme i2c_algo_bit drm_suballoc_helper drm_display_helper
> ahci nvme_core hid_generic crc32_pclmul libahci crc32c_intel t10_pi cec libata
> crc64_rocksoft_generic ghash_clmulni_intel rc_core drm_ttm_helper
> crc64_rocksoft sha512_ssse3 i2c_hid_acpi ttm rtsx_pci_sdmmc i2c_hid xhci_pci
> crc_t10dif sha512_generic mmc_core scsi_mod xhci_hcd drm_kms_helper video hid
> crct10dif_generic intel_lpss_pci crct10dif_pclmul i2c_i801 sha256_ssse3
> intel_lpss crc64 thunderbolt drm e1000e usbcore sha1_ssse3 rtsx_pci i2c_smbus
> scsi_common crct10dif_common idma64 usb_common battery wmi button aesni_intel
> crypto_simd cryptd
> [    4.177689] CPU: 6 PID: 248 Comm: (udev-worker) Not tainted 6.7-amd64 #1
> Debian 6.7.1-1~exp1
> [    4.177691] Hardware name: Dell Inc. Precision 7540/0T2FXT, BIOS 1.29.0
> 11/03/2023
> [    4.177692] RIP: 0010:construct_phy+0xb26/0xd60 [amdgpu]
> [    4.178050] Code: b9 01 00 00 00 83 fe 01 74 40 48 8b 82 f8 03 00 00 89 f2
> 48 c7 c6 00 35 a7 c1 48 8b 40 10 48 8b 00 48 8b 78 08 e8 ba b7 5b fb <0f> 0b 49
> 8b 87 d0 01 00 00 b9 0f 00 00 00 48 8b 80 e8 04 00 00 48
> [    4.178052] RSP: 0018:ffffaad300857408 EFLAGS: 00010246
> [    4.178053] RAX: 0000000000000000 RBX: ffff96df636a1700 RCX:
> c0000000ffffefff
> [    4.178054] RDX: 0000000000000000 RSI: 00000000ffffefff RDI:
> 0000000000000001
> [    4.178055] RBP: ffff96df4d379c00 R08: 0000000000000000 R09:
> ffffaad3008571d0
> [    4.178056] R10: 0000000000000003 R11: ffffffffbded2428 R12:
> ffffaad300857474
> [    4.178057] R13: ffffffffc1933140 R14: ffffaad3008577d0 R15:
> ffff96df43e82000
> [    4.178058] FS:  00007fcd5d9648c0(0000) GS:ffff96e2cc380000(0000)
> knlGS:0000000000000000
> [    4.178060] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.178061] CR2: 00007fcd5d932a6d CR3: 0000000103e9a004 CR4:
> 00000000003706f0
> [    4.178062] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    4.178063] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    4.178063] Call Trace:
> [    4.178066]  <TASK>
> [    4.178067]  ? construct_phy+0xb26/0xd60 [amdgpu]
> [    4.178422]  ? __warn+0x81/0x130
> [    4.178426]  ? construct_phy+0xb26/0xd60 [amdgpu]
> [    4.178784]  ? report_bug+0x171/0x1a0
> [    4.178787]  ? handle_bug+0x3c/0x80
> [    4.178789]  ? exc_invalid_op+0x17/0x70
> [    4.178790]  ? asm_exc_invalid_op+0x1a/0x20
> [    4.178793]  ? construct_phy+0xb26/0xd60 [amdgpu]
> [    4.179149]  ? construct_phy+0xb26/0xd60 [amdgpu]
> [    4.179507]  link_create+0x1b2/0x200 [amdgpu]
> [    4.179865]  create_links+0x135/0x420 [amdgpu]
> [    4.180196]  dc_create+0x321/0x640 [amdgpu]
> [    4.180529]  amdgpu_dm_init.isra.0+0x2a0/0x1ed0 [amdgpu]
> [    4.180881]  ? sysvec_apic_timer_interrupt+0xe/0x90
> [    4.180883]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
> [    4.180885]  ? delay_tsc+0x37/0xa0
> [    4.180889]  dm_hw_init+0x12/0x30 [amdgpu]
> [    4.181240]  amdgpu_device_init+0x1e42/0x24a0 [amdgpu]
> [    4.181517]  amdgpu_driver_load_kms+0x19/0x190 [amdgpu]
> [    4.181793]  amdgpu_pci_probe+0x165/0x4c0 [amdgpu]
> [    4.182067]  local_pci_probe+0x42/0xa0
> [    4.182070]  pci_device_probe+0xc7/0x240
> [    4.182072]  really_probe+0x19b/0x3e0
> [    4.182075]  ? __pfx___driver_attach+0x10/0x10
> [    4.182076]  __driver_probe_device+0x78/0x160
> [    4.182078]  driver_probe_device+0x1f/0x90
> [    4.182079]  __driver_attach+0xd2/0x1c0
> [    4.182081]  bus_for_each_dev+0x85/0xd0
> [    4.182083]  bus_add_driver+0x116/0x220
> [    4.182085]  driver_register+0x59/0x100
> [    4.182087]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
> [    4.182356]  do_one_initcall+0x58/0x320
> [    4.182359]  do_init_module+0x60/0x240
> [    4.182361]  init_module_from_file+0x89/0xe0
> [    4.182364]  idempotent_init_module+0x120/0x2b0
> [    4.182366]  __x64_sys_finit_module+0x5e/0xb0
> [    4.182367]  do_syscall_64+0x61/0x120
> [    4.182370]  ? do_syscall_64+0x70/0x120
> [    4.182372]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [    4.182375] RIP: 0033:0x7fcd5e130f19
> [    4.182376] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89
> f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
> f0 ff ff 73 01 c3 48 8b 0d cf 1e 0d 00 f7 d8 64 89 01 48
> [    4.182378] RSP: 002b:00007ffd314afa38 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [    4.182379] RAX: ffffffffffffffda RBX: 00005611ee7f84d0 RCX:
> 00007fcd5e130f19
> [    4.182380] RDX: 0000000000000000 RSI: 00007fcd5e2644f5 RDI:
> 0000000000000024
> [    4.182381] RBP: 0000000000000000 R08: 0000000000000040 R09:
> 00005611ee7d3140
> [    4.182382] R10: 0000000000000038 R11: 0000000000000246 R12:
> 00007fcd5e2644f5
> [    4.182383] R13: 0000000000020000 R14: 00005611ee7f0670 R15:
> 0000000000000000
> [    4.182385]  </TASK>
> [    4.182385] ---[ end trace 0000000000000000 ]---
> 
> 
> I do not know if this is something interesting and just a warning.
> Otherwise this amdgpu is a second device on my laptop system:
> 
> $ inxi -G
> Graphics:
>   Device-1: Intel CoffeeLake-H GT2 [UHD Graphics 630] driver: i915 v: kernel
>   Device-2: AMD Lexa XT [Radeon PRO WX 3200] driver: amdgpu v: kernel
>   Device-3: Sunplus Innovation Integrated_Webcam_HD driver: uvcvideo
>     type: USB
>   Display: wayland server: X.Org v: 23.2.4 with: Xwayland v: 23.2.4
>     compositor: gnome-shell v: 45.3 driver: X: loaded: amdgpu,modesetting
>     unloaded: fbdev,radeon,vesa dri: iris gpu: i915 resolution: 1920x1080~60Hz
>   API: EGL v: 1.5 drivers: iris,radeonsi,swrast
>     platforms: gbm,wayland,x11,surfaceless,device
>   API: OpenGL v: 4.6 vendor: intel mesa v: 23.3.3-3 renderer: Mesa Intel
>     UHD Graphics 630 (CFL GT2)
>   API: Vulkan v: 1.3.268 drivers: intel,radv,llvmpipe
>     surfaces: xcb,xlib,wayland

Analysis showed that this appears to be a regression from b17ef04bf3a4
("drm/amd/display: Pass pwrseq inst for backlight and ABM"). Does that
ring some bells?

See: https://bugs.debian.org/1061449#27

#regzbot introduced: b17ef04bf3a4
#regzbot link: https://bugs.debian.org/1061449
#regzbot title: Regression by b17ef04bf3a4 ("drm/amd/display: Pass pwrseq inst for backlight and ABM")

Regards,
Salvatore
