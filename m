Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56037233F2D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C5C6E9DE;
	Fri, 31 Jul 2020 06:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2746E9DE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:36:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id l4so30271597ejd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 23:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ubby1BhZPsswj8yKWDM7ddtUBFRsrKHOUYxAmJCdess=;
 b=e424EwJ/SgqVLrQMpfU8eOTrQSuP2Nbahz7l7pUMhQbI/lDlOK+gFAuDr5Bf30JE6r
 g75dWbH0Snk27siYsYGv+pduOZWtZRqC0cLJNboBQPenNmqY3CewZho64zQffa7Sk2Hy
 WNhD6DT+YrDL18pmDPXypIxvDgjDjd/bIO2oSwu1zR+B6chBM0HBAoBB30UDXMHolKLu
 ciqrHp8bLz+mueiRBIL6pzJ+X7Eg93YL8XyIwjQgcKlPhZ1aZlRtZnyuvpwmgK2CRrJS
 vxmyJnM1bJzdwF+xAzDicN2prAwpflNaHJbDJRZhG1UAw79h+i5gbWNsDMzk8uCjTIqh
 Ah6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ubby1BhZPsswj8yKWDM7ddtUBFRsrKHOUYxAmJCdess=;
 b=R86tFLCyL4rNKelJHdX6JGrjFrohkcmwbQCSrKpGVVih0JXj4oNvSl/GzwbBktapFy
 CHnx8Kv5VEIokr5F4O3HkXbpRoQow2K/KLNJPsKmL+x4taa08znEq+UfqogS5DtcJJ9U
 QWaVamj1+ZOkos1yno4kC135xYJbBsdwu58U/8Tz5S4BP7Z+b6i9JLKGZIb+2JJiRY8g
 MX6SlTLBAYk0GWmbPVNKJH5KjZCYwmTQnsJKVddp6YewD7ZrEXbowdlWpO1/37vitbJW
 +tSY7Ltg/17nECjLOHJsy+uECHoP1aLjWLMZl+3y/Dhd0x0k7b2w+GkHCK4iZXkCxlnb
 jpLw==
X-Gm-Message-State: AOAM530uiQv/KC/fZBtsRpSGJ9hWH7GTp2LWLEgjODNHfzyv35pYd2Jg
 jDhuapT0gYVViT6adQ7OhZqVBdCXMgS0STjmKcVxlKPe
X-Google-Smtp-Source: ABdhPJwJcpJQtA6OaP/fH9VQTbtbLBnyCYPrsLFilROe3vTiGEoiFaow3T0TPh4ableUsTGHLoRLzFLsXHAzCgocnnk=
X-Received: by 2002:a17:906:f905:: with SMTP id
 lc5mr2499992ejb.340.1596177411833; 
 Thu, 30 Jul 2020 23:36:51 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 16:36:40 +1000
Message-ID: <CAPM=9txHFn+gH8bZxyywFM83Nx8rG2G4GW0toaJ8Co_02gcTJw@mail.gmail.com>
Subject: oops in drm-next on vmwgfx
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
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

I booted up drm-next to test my ttm rework, but hey drm-next oops on
startup without it.

Probably need to get that fixed, haven't bisected yet.

Dave.

[    2.689057] [drm] DMA map mode: Caching DMA mappings.
[    2.689151] [drm] Capabilities:
[    2.689151] [drm]   Rect copy.
[    2.689151] [drm]   Cursor.
[    2.689152] [drm]   Cursor bypass.
[    2.689152] [drm]   Cursor bypass 2.
[    2.689152] [drm]   8bit emulation.
[    2.689152] [drm]   Alpha cursor.
[    2.689152] [drm]   3D.
[    2.689152] [drm]   Extended Fifo.
[    2.689152] [drm]   Multimon.
[    2.689153] [drm]   Pitchlock.
[    2.689153] [drm]   Irq mask.
[    2.689153] [drm]   Display Topology.
[    2.689153] [drm]   GMR.
[    2.689153] [drm]   Traces.
[    2.689153] [drm]   GMR2.
[    2.689153] [drm]   Screen Object 2.
[    2.689154] [drm]   Command Buffers.
[    2.689154] [drm]   Command Buffers 2.
[    2.689154] [drm]   Guest Backed Resources.
[    2.689154] [drm]   DX Features.
[    2.689154] [drm]   HP Command Queue.
[    2.689154] [drm] Capabilities2:
[    2.689154] [drm]   Grow oTable.
[    2.689154] [drm]   IntraSurface copy.
[    2.689155] [drm] Max GMR ids is 64
[    2.689155] [drm] Max number of GMR pages is 65536
[    2.689156] [drm] Max dedicated hypervisor surface memory is 0 kiB
[    2.689156] [drm] Maximum display memory size is 262144 kiB
[    2.689156] [drm] VRAM at 0xe8000000 size is 131072 kiB
[    2.689157] [drm] MMIO at 0xfe000000 size is 256 kiB
[    2.706367] [TTM] Zone  kernel: Available graphics memory: 1001350 KiB
[    2.706368] [TTM] Initializing pool allocator
[    2.706371] [TTM] Initializing DMA pool allocator
[    2.776377] BUG: kernel NULL pointer dereference, address: 0000000000000190
[    2.776491] #PF: supervisor read access in kernel mode
[    2.776537] #PF: error_code(0x0000) - not-present page
[    2.776583] PGD 0 P4D 0
[    2.776612] Oops: 0000 [#1] SMP NOPTI
[    2.776649] CPU: 0 PID: 333 Comm: systemd-udevd Not tainted 5.8.0-rc6+ #3
[    2.776707] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 07/29/2019
[    2.776804] RIP: 0010:drm_dev_has_vblank+0x5/0x20 [drm]
[    2.776852] Code: d0 0f 85 18 ff ff ff e9 2f ff ff ff 89 f1 89 e8
45 31 ff d3 e0 89 c1 e9 fa fe ff ff 66 0f 1f 84 00 00 00 00 00 0f 1f
44 00 00 <8b> 87 90 01 00 00 85 c0 0f 95 c0 c3 66 66 2e 0f 1f 84 00 00
00 00
[    2.776995] RSP: 0000:ffffa9904078fb08 EFLAGS: 00010286
[    2.777042] RAX: ffff8f0af2f02e00 RBX: ffff8f0af1ce3000 RCX: 0000000000000000
[    2.777102] RDX: 0000000000000000 RSI: ffff8f0af2f02e00 RDI: 0000000000000000
[    2.777162] RBP: ffff8f0af2f02e00 R08: ffff8f0b3be2f140 R09: 0000000000000000
[    2.777223] R10: ffff8f0af2f02e00 R11: 3432524134325258 R12: 0000000000000000
[    2.777283] R13: ffff8f0af1ce7000 R14: ffff8f0af1ce3000 R15: 0000000000000000
[    2.777423] FS:  00007f2029cd0b80(0000) GS:ffff8f0b3be00000(0000)
knlGS:0000000000000000
[    2.777491] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.777542] CR2: 0000000000000190 CR3: 0000000032c76003 CR4: 00000000003606f0
[    2.777615] Call Trace:
[    2.777650]  __drm_atomic_helper_crtc_reset+0x1e/0x40 [drm_kms_helper]
[    2.777716]  vmw_kms_stdu_init_display+0x19a/0x380 [vmwgfx]
[    2.777790]  vmw_kms_init+0x6e/0xc0 [vmwgfx]
[    2.777848]  vmw_probe.cold+0xb58/0xd89 [vmwgfx]
[    2.777908]  local_pci_probe+0x42/0x80
[    2.777954]  ? _cond_resched+0x16/0x40
[    2.777998]  pci_device_probe+0xd9/0x190
[    2.778045]  really_probe+0x167/0x410
[    2.778089]  driver_probe_device+0xe1/0x150
[    2.778136]  device_driver_attach+0xa1/0xb0
[    2.778184]  __driver_attach+0x8a/0x150
[    2.778229]  ? device_driver_attach+0xb0/0xb0
[    2.778277]  ? device_driver_attach+0xb0/0xb0
[    2.778365]  bus_for_each_dev+0x64/0x90
[    2.778446]  bus_add_driver+0x12b/0x1e0
[    2.778492]  driver_register+0x8b/0xe0
[    2.778536]  ? 0xffffffffc0224000
[    2.778582]  vmwgfx_init+0x30/0x1000 [vmwgfx]
[    2.778632]  do_one_initcall+0x46/0x200
[    2.778677]  ? _cond_resched+0x16/0x40
[    2.778722]  ? kmem_cache_alloc_trace+0x167/0x220
[    2.778773]  ? do_init_module+0x23/0x250
[    2.778818]  do_init_module+0x5c/0x250
[    2.778863]  __do_sys_finit_module+0x93/0xe0
[    2.778912]  do_syscall_64+0x52/0x90
[    2.778955]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    2.779009] RIP: 0033:0x7f202adf237d
[    2.779051] Code: Bad RIP value.
[    2.779092] RSP: 002b:00007ffca5b88dc8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    2.779171] RAX: ffffffffffffffda RBX: 000055b67ff12410 RCX: 00007f202adf237d
[    2.779239] RDX: 0000000000000000 RSI: 00007f202aa5195d RDI: 000000000000000f
[    2.779316] RBP: 0000000000020000 R08: 0000000000000000 R09: 000055b67ff125e0
[    2.779446] R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000000
[    2.779514] R13: 00007f202aa5195d R14: 000055b67ff07570 R15: 000055b67ff04600
[    2.779582] Modules linked in: vmwgfx(+) drm_kms_helper ttm drm
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel mptspi
e1000(+) scsi_transport_spi serio_raw mptscsih mptbase ata_generic
pata_acpi fuse
[    2.779753] CR2: 0000000000000190
[    2.779794] ---[ end trace 5b38cb2d953a1310 ]---
[    2.779851] RIP: 0010:drm_dev_has_vblank+0x5/0x20 [drm]
[    2.779907] Code: d0 0f 85 18 ff ff ff e9 2f ff ff ff 89 f1 89 e8
45 31 ff d3 e0 89 c1 e9 fa fe ff ff 66 0f 1f 84 00 00 00 00 00 0f 1f
44 00 00 <8b> 87 90 01 00 00 85 c0 0f 95 c0 c3 66 66 2e 0f 1f 84 00 00
00 00
[    2.780072] RSP: 0000:ffffa9904078fb08 EFLAGS: 00010286
[    2.780126] RAX: ffff8f0af2f02e00 RBX: ffff8f0af1ce3000 RCX: 0000000000000000
[    2.780194] RDX: 0000000000000000 RSI: ffff8f0af2f02e00 RDI: 0000000000000000
[    2.780262] RBP: ffff8f0af2f02e00 R08: ffff8f0b3be2f140 R09: 0000000000000000
[    2.780367] R10: ffff8f0af2f02e00 R11: 3432524134325258 R12: 0000000000000000
[    2.780452] R13: ffff8f0af1ce7000 R14: ffff8f0af1ce3000 R15: 0000000000000000
[    2.780520] FS:  00007f2029cd0b80(0000) GS:ffff8f0b3be00000(0000)
knlGS:0000000000000000
[    2.780602] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.780660] CR2: 0000000000000190 CR3: 0000000032c76003 CR4: 00000000003606f0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
