Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9287E8AD3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 13:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D210E289;
	Sat, 11 Nov 2023 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 421 seconds by postgrey-1.36 at gabe;
 Sat, 11 Nov 2023 12:10:47 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01E510E288;
 Sat, 11 Nov 2023 12:10:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9F92C40E0176; 
 Sat, 11 Nov 2023 12:03:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 02PzBCe1tIYh; Sat, 11 Nov 2023 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1699704218; bh=mnLg2AFo7cZ77HTtx0K5iZojbFqgyb/zAT0td59x9aQ=;
 h=Date:From:To:Cc:Subject:From;
 b=OG82pIYpt34ZvrDM+b5xlw88HDBzTd9XIhAVkZanBvaUgp1s/Os7aZj2E0XgmHosU
 Qi9occJ6BHCpMoS5YjP1Tfl0XIHewMgh1ognZSYib3/28O3N60uKU4VIfjqrSUPri6
 M/+97PmtFHNZr8F97YaKQCvcn8RPa18UdDgxtn+oV6waABDbijt2ZBjwzIosXqN8Bw
 vJtO664TKu0aNa+W2S2cmi6uUZa/sphNJ7yX2ueT7ORHDa7p7Nbda2THvFXOE7alRU
 OEZlL5tZcsCNGTngbQVwWIEfOlKxOsugG8k+18iQJDUnGK8ZE31ajoG+lHZ7X9Exz5
 KmwF7vY8gVCjk7uq6vTL1dfj9dUW2RPU3iUR5NRrM98DD3hpBZPlvFkpI2xBx4+oj9
 MTjOa+O+rKUz2j4vcn8eTpza6pnSKXExrppGqx1HCo2XQpXCjPyks40H4LV6fo3PhF
 EIro3YLmi7SLZbDt9kTnqwWl3ToHSojQtdXoJh+391C7XLFlEyX2DMTzxIwSNbIz8t
 YsblvcTBR1eqYu4+fs6PPEpuhMqZsVCQop10DwXFZS9B4ggnMXiioKwJHRqnASysM0
 znyinIGp4O+iBNSUkkPXn0OP/VHK98YeDq+VGufPhiaML61Q6AI1RD4Uh5RC1rB8hV
 tTZmzMBqYcWUdEmqyat63W9E=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7DDFB40E0032;
 Sat, 11 Nov 2023 12:03:29 +0000 (UTC)
Date: Sat, 11 Nov 2023 13:03:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: nouveau@lists.freedesktop.org
Subject: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
Message-ID: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is ontop of Linus' tree from the 4th (lemme know if I should try
the latest) on one of my test boxes:

nouveau 0000:01:00.0: vgaarb: deactivate vga console
Console: switching to colour dummy device 80x25
nouveau 0000:01:00.0: NVIDIA GT218 (0a8280b1)
CE: hpet increased min_delta_ns to 20115 nsec
nouveau 0000:01:00.0: bios: version 70.18.49.00.00
nouveau 0000:01:00.0: fb: 1024 MiB DDR3
nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
------------[ cut here ]------------
nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
WARNING: CPU: 4 PID: 786 at drivers/gpu/drm/nouveau/dispnv50/disp.c:2731 nv50_display_init+0x28c/0x4f0 [nouveau]
Modules linked in: nouveau(+) drm_ttm_helper ttm video drm_exec drm_gpuvm gpu_sched drm_display_helper wmi
CPU: 4 PID: 786 Comm: systemd-udevd Not tainted 6.6.0+ #1
Hardware name: MICRO-STAR INTERNATIONAL CO.,LTD MS-7599/870-C45 (MS-7599), BIOS V1.15 03/04/2011
RIP: 0010:nv50_display_init+0x28c/0x4f0 [nouveau]
Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 6d 47 37 e1 48 c7 c1 4c 55 2d a0 48 89 c6 4c 89 ea 48 c7 c7 42 55 2d a0 e8 44 83 e8 e0 <0f> 0b 48 8b 43 08 49 39 c6 48 8d 58 f8 0f 85 41 ff ff ff 48 8d 7c
RSP: 0018:ffffc9000031ba98 EFLAGS: 00010286
RAX: 000000000000002e RBX: ffff888100a21400 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffc9000031b9b0 RDI: 0000000000000001
RBP: ffff888104eadad0 R08: ffff888136ffdfe8 R09: 0000000000000058
R10: 0000000000000289 R11: ffff888136401cd8 R12: ffff888104ead800
R13: ffff888100abddf0 R14: ffff888104eadab0 R15: 0000000000000000
FS:  00007fef9c8e38c0(0000) GS:ffff88812f500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fef9ce9d258 CR3: 000000010330e000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? __warn+0x97/0x160
 ? nv50_display_init+0x28c/0x4f0 [nouveau]
 ? report_bug+0x1ec/0x200
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x1f/0x90
 ? asm_exc_invalid_op+0x16/0x20
 ? nv50_display_init+0x28c/0x4f0 [nouveau]
 ? nv50_display_init+0x28c/0x4f0 [nouveau]
 ? sched_set_fifo+0x46/0x60
 nouveau_display_init+0xa0/0xd0 [nouveau]
 nouveau_drm_device_init+0x42a/0x990 [nouveau]
 nouveau_drm_probe+0x105/0x240 [nouveau]
 ? __pm_runtime_resume+0x68/0xa0
 pci_device_probe+0xaa/0x140
 really_probe+0xc2/0x2d0
 __driver_probe_device+0x73/0x120
 driver_probe_device+0x2c/0xb0
 __driver_attach+0xa0/0x150
 ? __device_attach_driver+0xc0/0xc0
 bus_for_each_dev+0x67/0xa0
 bus_add_driver+0x10e/0x210
 driver_register+0x5c/0x120
 ? 0xffffffffa0336000
 do_one_initcall+0x44/0x200
 ? kmalloc_trace+0x37/0xc0
 do_init_module+0x64/0x230
 init_module_from_file+0x8d/0xd0
 idempotent_init_module+0x15a/0x210
 __x64_sys_finit_module+0x67/0xb0
 do_syscall_64+0x41/0xf0
 entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x7fef9cda5ee9
Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 ee 0e 00 f7 d8 64 89 01 48
RSP: 002b:00007ffeb60299e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055b322ddf5a0 RCX: 00007fef9cda5ee9
RDX: 0000000000000000 RSI: 00007fef9cf45e2d RDI: 0000000000000012
RBP: 0000000000020000 R08: 0000000000000000 R09: 000055b322ddf690
R10: 0000000000000012 R11: 0000000000000246 R12: 00007fef9cf45e2d
R13: 0000000000000000 R14: 000055b322dcb940 R15: 000055b322ddf5a0
 </TASK>
---[ end trace 0000000000000000 ]---
[drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 on minor 0
fbcon: nouveaudrmfb (fb0) is primary device
Console: switching to colour frame buffer device 210x65
nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
