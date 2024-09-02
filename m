Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9FD96827F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630810E0EE;
	Mon,  2 Sep 2024 08:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="kOYuobLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Mon, 02 Sep 2024 08:56:07 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E32B10E0EE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:56:07 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 618D240E0081; 
 Mon,  2 Sep 2024 08:46:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7gskwZdp3wAb; Mon,  2 Sep 2024 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725266762; bh=ieYWg9D1+m2IMD1+NLyBqX6ssI4aWplO+4yreStprIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kOYuobLz4WaHHJZwHpndAAfzyrLdGqOuzk12NF4PxJ1sWRMYKZ74yyLBVEsHDdeea
 xPoRG1ySM3HJwDdABkT76GD/KGsAjXRYNaZermGWdiEpH3GGe7k4ahRKof7ZrtMbrs
 pmGFxbmtRlyLJa2cw7+OVHz/Js6gcj5cpG/kvUqTRfKEjZfdVIlUvXWxiIeACT07oJ
 Yu0ZLLfSfqzx4hO+G4794DKFINIPj+LYpftUQx7h01wW9/cgW8V1eIxEQKrjI14/cg
 k7+apCj4KecviJvV98RwvwkwGi4LmFuM78F+OKbgg7phebJY/tXuM1794hWbzs98x3
 qq7OHGaXcvdRmrYQr/p6kMMPmF0f5+9nDPQhBFTLDO8hHTJaEpoXefy8LDXC5RInOK
 JtfWyBdbs1v07BSljpHKgv25AUT2O1X3jbtYCpoJDOhAeEgmdJX3D/T6Tb3DVd2dbt
 t8XbDSzj+GiMjUhJxq+m9KSz9XAxen5ZiESzvf2T7tP8WQMt+9OjhoE7M4pzUfs6Kl
 D2Zhcz32h3SpmLgDtE+/uk/76/pLJppGZ5R/pEIMEp+Z6bWdUI7Qw6hDbS1zgG6thL
 UmPWrE9o5qqMXRFdKuXYlMufgJKp26WnugAWP8MUrmZpIRaYWkDj5I4wc+FXeGljPc
 aa+/8DOwnqmzesLDdv/ZVTGk=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0AA7B40E0198;
 Mon,  2 Sep 2024 08:45:53 +0000 (UTC)
Date: Mon, 2 Sep 2024 10:45:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: "V, Narasimhan" <Narasimhan.V@amd.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Subject: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160 (was: Re: BUG: kernel NULL pointer
 dereference, address: 0000000000000000 on boot with linux-next-20240829)
Message-ID: <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
References: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
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

Fixing subject and recipients and leaving the whole mail untouched.

On Sun, Sep 01, 2024 at 05:01:28PM +0200, V, Narasimhan wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi,
> 
> Seeing the following warning and bug on boot with linux-next-20240829
> 
> WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregister_framebuffer+0x45/0x160
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> 
> 
> 
> 19:07:54  [   18.395285] WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregister_framebuffer+0x45/0x160
> 19:07:54  [   18.406264] Modules linked in: ast(+) i2c_algo_bit drm_shmem_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha256_ssse3 drm tg3 nvme sha1_ssse3 ahci i2c_piix4 libahci i2c_smbus nvme_core aesni_intel crypto_simd cryptd
> 19:07:54  [   18.430347] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.11.0-rc5-next-20240830-1725196918033 #1
> 19:07:54  [   18.440929] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
> 19:07:54  [   18.449572] Workqueue: events work_for_cpu_fn
> 19:07:54  [   18.454435] RIP: 0010:unregister_framebuffer+0x45/0x160
> 19:07:54  [   18.460267] Code: 83 ec 08 e8 7d 4a 76 00 49 63 44 24 04 83 f8 1f 77 18 48 83 f8 1f 0f 87 d6 00 00 00 4c 3b 24 c5 80 76 a7 83 0f 84 85 00 00 00 <0f> 0b 49 8b bc 24 d0 01 00 00 48 85 ff 74 0b 41 f6 84 24 ec 01 00
> 19:07:54  [   18.481224] RSP: 0018:ff56f06f800efb50 EFLAGS: 00010286
> 19:07:54  [   18.487058] RAX: 0000000000000000 RBX: ff2d2a8913c77a40 RCX: ff2d2a8913c77400
> 19:07:54  [   18.495023] RDX: ff2d2a8900956000 RSI: ff2d2a8913c77428 RDI: ffffffff83918360
> 19:07:54  [   18.502987] RBP: ff56f06f800efb68 R08: ffffffff82dce06a R09: 0000000000000010
> 19:07:54  [   18.510950] R10: ff2d2a8913cfc2b0 R11: 0000000000000004 R12: ff2d2a8913cffc00
> 19:07:54  [   18.518911] R13: ff56f06f800efbd0 R14: ff2d2a8913cfc010 R15: 0000000000000202
> 19:07:54  [   18.526873] FS:  0000000000000000(0000) GS:ff2d2a980ba00000(0000) knlGS:0000000000000000
> 19:07:54  [   18.535903] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 19:07:54  [   18.542312] CR2: 0000558d19347c98 CR3: 000000011827a006 CR4: 0000000000771ef0
> 19:07:54  [   18.550275] PKRU: 55555554
> 19:07:54  [   18.553293] Call Trace:
> 19:07:54  [   18.556016]  <TASK>
> 19:07:54  [   18.558354]  ? show_regs+0x6d/0x80
> 19:07:54  [   18.562153]  ? __warn+0x91/0x140
> 19:07:54  [   18.565756]  ? unregister_framebuffer+0x45/0x160
> 19:07:54  [   18.570917]  ? report_bug+0x193/0x1a0
> 19:07:54  [   18.575008]  ? handle_bug+0x63/0xa0
> 19:07:54  [   18.578901]  ? exc_invalid_op+0x1d/0x80
> 19:07:54  [   18.583181]  ? asm_exc_invalid_op+0x1f/0x30
> 19:07:54  [   18.587842]  ? unregister_framebuffer+0x45/0x160
> 19:07:54  [   18.592994]  devm_unregister_framebuffer+0x12/0x20
> 19:07:54  [   18.598338]  devm_action_release+0x16/0x20
> 19:07:54  [   18.602910]  release_nodes+0x47/0xc0
> 19:07:54  [   18.606898]  devres_release_all+0x9f/0xe0
> 19:07:54  [   18.611371]  device_unbind_cleanup+0x12/0x80
> 19:07:54  [   18.616136]  device_release_driver_internal+0x20c/0x250
> 19:07:54  [   18.621967]  ? srso_alias_return_thunk+0x5/0xfbef5
> 19:07:54  [   18.627315]  device_release_driver+0x16/0x20
> 19:07:54  [   18.632079]  bus_remove_device+0xcf/0x130
> 19:07:54  [   18.636551]  device_del+0x16a/0x3c0
> 19:07:54  [   18.640444]  ? srso_alias_return_thunk+0x5/0xfbef5
> 19:07:54  [   18.645791]  platform_device_del.part.0+0x18/0x90
> 19:07:54  [   18.651042]  platform_device_unregister+0x24/0x40
> 19:07:54  [   18.656303]  sysfb_disable+0x5c/0xa0
> 19:07:54  [   18.660296]  aperture_remove_conflicting_pci_devices+0x33/0x140
> 19:07:54  [   18.666907]  drm_aperture_remove_conflicting_pci_framebuffers+0x19/0x20 [drm]
> 19:07:54  [   18.674886]  ast_pci_probe+0x2c/0x540 [ast]
> 19:07:54  [   18.679556]  ? srso_alias_return_thunk+0x5/0xfbef5
> 19:07:54  [   18.684904]  local_pci_probe+0x4c/0xb0
> 19:07:54  [   18.689087]  work_for_cpu_fn+0x1b/0x30
> 19:07:54  [   18.693271]  process_one_work+0x17a/0x3b0
> 19:07:54  [   18.697745]  worker_thread+0x2a0/0x3a0
> 19:07:54  [   18.701927]  ? __pfx_worker_thread+0x10/0x10
> 19:07:54  [   18.706688]  kthread+0xe5/0x120
> 19:07:54  [   18.710192]  ? __pfx_kthread+0x10/0x10
> 19:07:54  [   18.714375]  ret_from_fork+0x3d/0x60
> 19:07:54  [   18.718363]  ? __pfx_kthread+0x10/0x10
> 19:07:54  [   18.722544]  ret_from_fork_asm+0x1a/0x30
> 19:07:54  [   18.726923]  </TASK>
> 19:07:54  [   18.729359] ---[ end trace 0000000000000000 ]---
> 09:13:40  [   18.100937] BUG: kernel NULL pointer dereference, address: 0000000000000000
> 09:13:40  [   18.108694] #PF: supervisor read access in kernel mode
> 09:13:40  [   18.114424] #PF: error_code(0x0000) - not-present page
> 09:13:40  [   18.120153] PGD 1156fa067 P4D 0
> 09:13:40  [   18.123751] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> 09:13:40  [   18.129194] CPU: 0 UID: 0 PID: 458 Comm: kworker/0:2 Tainted: G        W          6.11.0-rc5-next-20240829-1725075030567 #1
> 09:13:40  [   18.141618] Tainted: [W]=WARN
> 09:13:40  [   18.144922] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
> 09:13:40  [   18.153551] Workqueue: events work_for_cpu_fn
> 09:13:40  [   18.158412] RIP: 0010:fb_destroy_modelist+0x1a/0x70
> 09:13:40  [   18.163853] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 56 41 55 41 54 49 89 fc 53 48 8b 3f <48> 8b 1f 49 39 fc 74 36 49 be 00 01 00 00 00 00 ad de 49 bd 22 01
> 09:13:40  [   18.184809] RSP: 0018:ff42b545c14e7b20 EFLAGS: 00010246
> 09:13:40  [   18.190638] RAX: 0000000000000000 RBX: ff2cd8a142f7ce00 RCX: ff2cd8a142f7cf00
> 09:13:40  [   18.198597] RDX: ff2cd8b088b74000 RSI: ff2cd8a142f7cf28 RDI: 0000000000000000
> 09:13:40  [   18.206557] RBP: ff42b545c14e7b40 R08: ffffffff907cca2c R09: 0000000000000010
> 09:13:40  [   18.214520] R10: ff2cd8a142fb06b0 R11: 0000000000000004 R12: ff2cd8a142fb5288
> 09:13:40  [   18.222480] R13: ff42b545c14e7bd0 R14: ff2cd8a142fb0410 R15: 0000000000000283
> 09:13:40  [   18.230440] FS:  0000000000000000(0000) GS:ff2cd8b046600000(0000) knlGS:0000000000000000
> 09:13:40  [   18.239466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 09:13:40  [   18.245874] CR2: 0000000000000000 CR3: 00000001156cc005 CR4: 0000000000771ef0
> 09:13:40  [   18.253836] PKRU: 55555554
> 09:13:40  [   18.256851] Call Trace:
> 09:13:40  [   18.259573]  <TASK>
> 09:13:40  [   18.261901]  ? show_regs+0x6d/0x80
> 09:13:40  [   18.265695]  ? __die+0x29/0x70
> 09:13:40  [   18.269098]  ? page_fault_oops+0x15c/0x550
> 09:13:40  [   18.273664]  ? unregister_framebuffer+0x45/0x160
> 09:13:40  [   18.278813]  ? srso_alias_return_thunk+0x5/0xfbef5
> 09:13:40  [   18.284157]  ? vprintk+0x3f/0x70
> 09:13:40  [   18.287755]  ? srso_alias_return_thunk+0x5/0xfbef5
> 09:13:40  [   18.293097]  ? _printk+0x5c/0x80
> 09:13:40  [   18.296699]  ? do_user_addr_fault+0x47a/0x7e0
> 09:13:40  [   18.301559]  ? __warn+0xbc/0x140
> 09:13:40  [   18.305158]  ? unregister_framebuffer+0x45/0x160
> 09:13:40  [   18.310307]  ? exc_page_fault+0x7c/0x1b0
> 09:13:40  [   18.314680]  ? asm_exc_page_fault+0x2b/0x30
> 09:13:40  [   18.319347]  ? fb_destroy_modelist+0x1a/0x70
> 09:13:40  [   18.324107]  unregister_framebuffer+0x6c/0x160
> 09:13:40  [   18.329063]  devm_unregister_framebuffer+0x12/0x20
> 09:13:40  [   18.334408]  devm_action_release+0x16/0x20
> 09:13:40  [   18.338978]  release_nodes+0x47/0xc0
> 09:13:40  [   18.342965]  devres_release_all+0x9f/0xe0
> 09:13:40  [   18.347436]  device_unbind_cleanup+0x12/0x80
> 09:13:40  [   18.352196]  device_release_driver_internal+0x20c/0x250
> 09:13:40  [   18.358024]  ? srso_alias_return_thunk+0x5/0xfbef5
> 09:13:40  [   18.363367]  device_release_driver+0x16/0x20
> 09:13:40  [   18.368128]  bus_remove_device+0xcf/0x130
> 09:13:40  [   18.372599]  device_del+0x16a/0x3c0
> 09:13:40  [   18.376488]  ? srso_alias_return_thunk+0x5/0xfbef5
> 09:13:40  [   18.381837]  platform_device_del.part.0+0x18/0x90
> 09:13:40  [   18.387086]  platform_device_unregister+0x24/0x40
> 09:13:40  [   18.392330]  sysfb_disable+0x5c/0xa0
> 09:13:40  [   18.396316]  aperture_remove_conflicting_pci_devices+0x33/0x140
> 09:13:40  [   18.402921]  drm_aperture_remove_conflicting_pci_framebuffers+0x19/0x20 [drm]
> 09:13:40  [   18.410899]  ast_pci_probe+0x2c/0x540 [ast]
> 09:13:40  [   18.415566]  ? srso_alias_return_thunk+0x5/0xfbef5
> 09:13:40  [   18.420914]  local_pci_probe+0x4c/0xb0
> 09:13:40  [   18.425095]  work_for_cpu_fn+0x1b/0x30
> 09:13:40  [   18.429277]  process_one_work+0x17a/0x3b0
> 09:13:40  [   18.433746]  ? __pfx_worker_thread+0x10/0x10
> 09:13:40  [   18.438507]  worker_thread+0x2a0/0x3a0
> 09:13:40  [   18.442685]  ? __pfx_worker_thread+0x10/0x10
> 09:13:40  [   18.447445]  kthread+0xe5/0x120
> 09:13:40  [   18.450946]  ? __pfx_kthread+0x10/0x10
> 09:13:40  [   18.455125]  ret_from_fork+0x3d/0x60
> 09:13:40  [   18.459112]  ? __pfx_kthread+0x10/0x10
> 09:13:40  [   18.463293]  ret_from_fork_asm+0x1a/0x30
> 09:13:44  [   18.467673]  </TASK>
> 09:13:44  [   18.470106] Modules linked in: ast(+) i2c_algo_bit drm_shmem_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha256_ssse3 drm sha1_ssse3 nvme i2c_piix4 tg3 ahci nvme_core i2c_smbus libahci aesni_intel crypto_simd cryptd
> 09:13:44  [   18.494181] CR2: 0000000000000000
> 09:13:44  [   18.497876] ---[ end trace 0000000000000000 ]---
> 
> --
> Regards
> Narasimhan V
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
