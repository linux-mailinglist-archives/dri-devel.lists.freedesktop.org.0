Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3680FA7F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 23:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B5210E6C7;
	Tue, 12 Dec 2023 22:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C410E6B9;
 Tue, 12 Dec 2023 22:40:56 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EBFB540E00CC; 
 Tue, 12 Dec 2023 22:40:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id x24XXjbKmf7F; Tue, 12 Dec 2023 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1702420851; bh=EAkMLeIiRvKz4MWTsYFVSwx0Xpd0WR2ZKKQgaMckL54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7w1WFcil7CmodzOwfF1K2GIRPImVnrE7deGVLSH9PVkSbG2elSXIBhrvvHienNoM
 DFUXE7FSrGL6H2qxWEu2iR7Bp5vQc/L1SOzwxERfmR2ZXK/EBN8mJfEAvNJ5m8u0wI
 3EoI9f8f/vTRFLpqtJrniaHYRTlCqgXWstZUUBnGu1eDnx0CMDzX5sGxm84UPRZfrw
 QOeIX7ebFCEXN+5n9pvQ7+2hBETVkDuRwEdyygUkCW/foKbw/oEyMYyPneqOttFnqH
 8qN/7Fr9WgMNCzgOr73PvhqAjJeyxEdGna/93grPNfyrfGrlD77T1usPe7r8JNSDug
 5ZEuCJpq+9vW8N21oAh2TUmVmn21ezakJiuyiiLKoMNsCEHOUjRCamNs94wk4MwjdU
 TfeV1TfjGx+rm4ZmJfZ2HdFoecJynbMBXVx1FTb6l8M07gegXf42PKjz1KrHL6LI43
 Sni0smlkFKrPb5QpJyH+iEWZUUe0UiPAW/pGUViOLmr6jJkiK1q2MXlbWwoJiqqYi0
 ZsyAq15bP/c41x9BH0D/nBa1h3/qUVpWFO7evphFn8t+0REKmqITWyF2P2rtkzhxE6
 IfrhZccYSR43wzstyG1bKwEd9hN9pmYXtUl4mWG2cBaGuIUaj5WSGxiKsdGw4D305N
 uiiPT1zQ7bkk/9qobr12Dk9w=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AF09A40E00CD;
 Tue, 12 Dec 2023 22:40:42 +0000 (UTC)
Date: Tue, 12 Dec 2023 23:40:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: nouveau@lists.freedesktop.org
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
Message-ID: <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
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

On Sat, Nov 11, 2023 at 01:03:23PM +0100, Borislav Petkov wrote:
> Hi,
> 
> this is ontop of Linus' tree from the 4th (lemme know if I should try
> the latest) on one of my test boxes:
> 
> nouveau 0000:01:00.0: vgaarb: deactivate vga console
> Console: switching to colour dummy device 80x25
> nouveau 0000:01:00.0: NVIDIA GT218 (0a8280b1)
> CE: hpet increased min_delta_ns to 20115 nsec
> nouveau 0000:01:00.0: bios: version 70.18.49.00.00
> nouveau 0000:01:00.0: fb: 1024 MiB DDR3
> nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
> nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> ------------[ cut here ]------------
> nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
> WARNING: CPU: 4 PID: 786 at drivers/gpu/drm/nouveau/dispnv50/disp.c:2731 nv50_display_init+0x28c/0x4f0 [nouveau]
> Modules linked in: nouveau(+) drm_ttm_helper ttm video drm_exec drm_gpuvm gpu_sched drm_display_helper wmi
> CPU: 4 PID: 786 Comm: systemd-udevd Not tainted 6.6.0+ #1

This still fires on -rc5:

[    4.577348] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    4.584482] Console: switching to colour dummy device 80x25
[    4.590120] nouveau 0000:01:00.0: NVIDIA GT218 (0a8280b1)
[    4.718171] nouveau 0000:01:00.0: bios: version 70.18.49.00.00
[    4.724788] nouveau 0000:01:00.0: fb: 1024 MiB DDR3
[    6.047984] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    6.053031] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.058340] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.065892] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    6.078375] ------------[ cut here ]------------
[    6.082994] nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
[    6.083023] WARNING: CPU: 3 PID: 779 at drivers/gpu/drm/nouveau/dispnv50/disp.c:2731 nv50_display_init+0x28c/0x4f0 [nouve
au]
[    6.099800] Modules linked in: nouveau(+) drm_ttm_helper ttm video drm_exec drm_gpuvm gpu_sched drm_display_helper wmi
[    6.110490] CPU: 3 PID: 779 Comm: systemd-udevd Not tainted 6.7.0-rc5+ #2
[    6.117272] Hardware name: MICRO-STAR INTERNATIONAL CO.,LTD MS-7599/870-C45 (MS-7599), BIOS V1.15 03/04/2011
[    6.127087] RIP: 0010:nv50_display_init+0x28c/0x4f0 [nouveau]
[    6.132915] Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 cd 16 37 e1 48 c7 c1 4c 55 2d a0 48 89 c6 4c 89 ea 48 c7 c7 42 5
5 2d a0 e8 44 5a e8 e0 <0f> 0b 48 8b 43 08 49 39 c6 48 8d 58 f8 0f 85 41 ff ff ff 48 8d 7c
[    6.151660] RSP: 0018:ffffc9000036ba98 EFLAGS: 00010286
[    6.156885] RAX: 000000000000002e RBX: ffff8881009fbc00 RCX: 0000000000000000
[    6.164013] RDX: 0000000000000002 RSI: ffffc9000036b9b0 RDI: 0000000000000001
[    6.171141] RBP: ffff888103fc8ad0 R08: ffff888136ffdfe8 R09: 0000000000000058
[    6.178263] R10: 000000000000027a R11: ffff888136401b70 R12: ffff888103fc8800
[    6.185393] R13: ffff888100abddf0 R14: ffff888103fc8ab0 R15: 0000000000000000
[    6.192521] FS:  00007fdc144858c0(0000) GS:ffff88812f4c0000(0000) knlGS:0000000000000000
[    6.200601] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.206339] CR2: 000055676cc01000 CR3: 0000000103f6c000 CR4: 00000000000006f0
[    6.213466] Call Trace:
[    6.215921]  <TASK>
[    6.218015]  ? __warn+0x96/0x160
[    6.221240]  ? nv50_display_init+0x28c/0x4f0 [nouveau]
[    6.226461]  ? report_bug+0x1ec/0x200
[    6.230119]  ? handle_bug+0x3c/0x70
[    6.233611]  ? exc_invalid_op+0x1f/0x90
[    6.237442]  ? asm_exc_invalid_op+0x16/0x20
[    6.241622]  ? nv50_display_init+0x28c/0x4f0 [nouveau]
[    6.246840]  ? nv50_display_init+0x28c/0x4f0 [nouveau]
[    6.252058]  ? sched_set_fifo+0x46/0x60
[    6.255897]  nouveau_display_init+0xa0/0xd0 [nouveau]
[    6.261031]  nouveau_drm_device_init+0x42a/0x990 [nouveau]
[    6.266604]  nouveau_drm_probe+0x105/0x240 [nouveau]
[    6.271651]  ? __pm_runtime_resume+0x68/0xa0
[    6.275920]  pci_device_probe+0xaa/0x140
[    6.279840]  really_probe+0xc2/0x2d0
[    6.283411]  __driver_probe_device+0x73/0x120
[    6.287761]  driver_probe_device+0x2c/0xb0
[    6.291851]  __driver_attach+0xa0/0x150
[    6.295683]  ? __device_attach_driver+0xc0/0xc0
[    6.300205]  bus_for_each_dev+0x67/0xa0
[    6.304044]  bus_add_driver+0x10e/0x210
[    6.307874]  driver_register+0x5c/0x120
[    6.311706]  ? 0xffffffffa0336000
[    6.315017]  do_one_initcall+0x44/0x200
[    6.318851]  ? kmalloc_trace+0x37/0xc0
[    6.322595]  do_init_module+0x64/0x230
[    6.326344]  init_module_from_file+0x8d/0xd0
[    6.330609]  idempotent_init_module+0x15a/0x210
[    6.335136]  __x64_sys_finit_module+0x67/0xb0
[    6.339490]  do_syscall_64+0x41/0xf0
[    6.343066]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[    6.348118] RIP: 0033:0x7fdc14947ee9
[    6.351691] Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 ee 0e 00 f7 d8 64 89 01 48
[    6.370433] RSP: 002b:00007ffe228d74b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    6.377993] RAX: ffffffffffffffda RBX: 000055676cc11d60 RCX: 00007fdc14947ee9
[    6.385116] RDX: 0000000000000000 RSI: 00007fdc14ae7e2d RDI: 0000000000000012
[    6.392245] RBP: 0000000000020000 R08: 0000000000000000 R09: 000055676cc0f170
[    6.399368] R10: 0000000000000012 R11: 0000000000000246 R12: 00007fdc14ae7e2d
[    6.406496] R13: 0000000000000000 R14: 000055676cc0c230 R15: 000055676cc11d60
[    6.413621]  </TASK>
[    6.415803] ---[ end trace 0000000000000000 ]---
[    6.420697] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 on minor 0
[    6.469632] fbcon: nouveaudrmfb (fb0) is primary device
[    6.548495] Console: switching to colour frame buffer device 210x65
[    6.563870] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[    6.660166] EXT4-fs (sda5): mounted filesystem 6fe02972-f7b5-4f2d-9796-e78fe2d6b511 ro with ordered data mode. Quota mode: disabled.
[    7.226100] acpi_cpufreq: overriding BIOS provided _PSD data
[    7.609728] kvm_amd: Nested Virtualization enabled
[    7.614585] kvm_amd: Nested Paging enabled
[    7.618825] kvm_amd: LBR virtualization supported
[    7.656480] MCE: In-kernel MCE decoding enabled.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
