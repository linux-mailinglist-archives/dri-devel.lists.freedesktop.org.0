Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E369F8CC814
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 23:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9FD10EE60;
	Wed, 22 May 2024 21:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3yLBJiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6485810EEB4;
 Wed, 22 May 2024 21:18:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-420180b5898so45148765e9.2; 
 Wed, 22 May 2024 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716412714; x=1717017514; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LPFBmLMrXmmvr6J+GTuOCF+VbCYwsLvpCyRM6XYnE9o=;
 b=O3yLBJiPWFlpGrjpYxsXX5DPBHY/7Kbe8+00ITEBGV9ubOu7WnvbbwI3R0XTPinvDm
 ugMuxdJcQZy5fKSjgMBuGwTC2LiSTt72o6mS8oQQ/z1+XHqCx92oj7bXlM5vwMqHQFLa
 dztv87q+GLXMxM1izarr8+E02pCBIJa1yCrhI/Vbg+1QU/fJbsbCXy43c8it7Tk6Ks5M
 eohA5titcpp2fP9GY4U6p9WqDn5oXpWxgCWUtZ8mYWT355UGw3LPCzL5RCTiZLVG1n2C
 y10IVnluX0fZRERHikgHpjsaFPxQCmf5z8w4oCnpoy5MPZYa62PDz4YFmn7OEQxm9tux
 ym9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716412714; x=1717017514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPFBmLMrXmmvr6J+GTuOCF+VbCYwsLvpCyRM6XYnE9o=;
 b=FbDNeT5/sqbiKVZQiA1BENQ7njkHECJmZNVo+LFTf/3ZYZYQJHl6Qz1UUowZSnhda4
 gminPkFX4/zEVkJAU7XUFqbPLH2fOwKWirITXDdz+2wbzT35GjuOzzOeYZeulJEXTeGp
 4SBACzoogb1fUt/UnfSMdiMoyh1YUMkHD13oB1nRiM3GT2VuClYvyKwlP9SZQuNpbPov
 jlGna/JwbB+cUHCCMM28hexG9i2yiWAgGQawWEX6mLDN8TUoH2ooP73M7t/uZ9PLKfvU
 JFXyjK2CAf6kw/7qChbZargKrVCZaSuTP4Z/k8xWHo5MhFn96gzmvBZPTKPeEFXl7w8Z
 LXag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/+QLrQRivep1Zd0OiRSNKN1Br0Cz1DRRS1WG4qLS36h6nSbu21xzKWHzTT49v6kzRk5iqqCGO7w/wFfTRb753WZi+NAVT/VEjfhJcEPovXeAoliwuz2IOX5c+XC0Tx6bF0JWPVEu0Vxwgf+t7SA==
X-Gm-Message-State: AOJu0YzoQfV7LY1SPu2RBATROsIHWtsTsn2qBHCbDqpxhC4OHq2O8xCA
 RJVZqmIrZ8mPCIASPfeNGv/b/DHs2oovBTiOnE61HRxeO5wukiw8
X-Google-Smtp-Source: AGHT+IG0LdNWuJZ1ltYpuD0k+A5ABTbklxoeAIOSGNw9XhOK2ynbOESExj8haYzXA6n8ue9WeSxYLQ==
X-Received: by 2002:a5d:638d:0:b0:349:eb59:c188 with SMTP id
 ffacd0b85a97d-354d8c7428fmr2719584f8f.5.1716412713944; 
 Wed, 22 May 2024 14:18:33 -0700 (PDT)
Received: from debian.local (host-92-13-19-4.as13285.net. [92.13.19.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a25f0d2a9sm1804494266b.60.2024.05.22.14.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 14:18:33 -0700 (PDT)
Date: Wed, 22 May 2024 22:18:30 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: regressions@lists.linux.dev, vasant.hegde@amd.com,
 suravee.suthikulpanit@amd.com, jgg@nvidia.com, jroedel@suse.de,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: 6.10/regression/bisected commit c4cb23111103 causes sleeping
 function called from invalid context at kernel/locking/mutex.c:585
Message-ID: <Zk5hJrY_lGmuW1G9@debian.local>
References: <CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com>
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

On Tue, May 21, 2024 at 02:39:06PM +0500, Mikhail Gavrilov wrote:
> Hi,
> Yesterday on the fresh kernel snapshot
> I spotted a new bug message with follow stacktrace:
> [    4.307097] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:585
> [    4.307135] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
> 1, name: swapper/0
> [    4.307150] preempt_count: 3, expected: 0
> [    4.307159] RCU nest depth: 0, expected: 0
> [    4.307168] 4 locks held by swapper/0/1:
> [    4.307176]  #0: ffff8881080ba920 (&group->mutex){+.+.}-{3:3}, at:
> bus_iommu_probe+0xf6/0x4c0
> [    4.307203]  #1: ffff88811654c1b8 (&domain->lock){....}-{2:2}, at:
> amd_iommu_attach_device+0x1ad/0x1e80
> [    4.307227]  #2: ffff888113518c18 (&dev_data->lock){....}-{2:2},
> at: amd_iommu_attach_device+0x213/0x1e80
> [    4.307243]  #3: ffff888108393030 (&iommu->lock){....}-{2:2}, at:
> amd_iommu_iopf_add_device+0x69/0x140
> [    4.307243] irq event stamp: 1021718
> [    4.307243] hardirqs last  enabled at (1021717):
> [<ffffffff9cc35f2e>] kasan_quarantine_put+0x12e/0x250
> [    4.307243] hardirqs last disabled at (1021718):
> [<ffffffff9f46895c>] _raw_spin_lock_irqsave+0x7c/0xa0
> [    4.307243] softirqs last  enabled at (1020154):
> [<ffffffff9c2721fb>] __irq_exit_rcu+0xbb/0x1c0
> [    4.307243] softirqs last disabled at (1020147):
> [<ffffffff9c2721fb>] __irq_exit_rcu+0xbb/0x1c0
> [    4.307243] Preemption disabled at:
> [    4.307243] [<0000000000000000>] 0x0
> [    4.307243] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug #1
> [    4.307243] Hardware name: ASUS System Product Name/ROG STRIX
> B650E-I GAMING WIFI, BIOS 2611 04/07/2024
> [    4.307243] Call Trace:
> [    4.307243]  <TASK>
> [    4.307243]  dump_stack_lvl+0x84/0xd0
> [    4.307243]  __might_resched.cold+0x1f7/0x23d
> [    4.307243]  ? __pfx___might_resched+0x10/0x10
> [    4.307243]  __mutex_lock+0xf3/0x13f0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx___mutex_lock+0x10/0x10
> [    4.307243]  ? find_held_lock+0x34/0x120
> [    4.307243]  ? __pfx_lock_acquired+0x10/0x10
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  amd_iommu_iopf_add_device+0xcd/0x140
> [    4.307243]  amd_iommu_attach_device+0xdc8/0x1e80
> [    4.307243]  ? iommu_create_device_direct_mappings+0x571/0x7d0
> [    4.307243]  __iommu_attach_device+0x64/0x250
> [    4.307243]  __iommu_device_set_domain+0x122/0x1c0
> [    4.307243]  __iommu_group_set_domain_internal+0xfa/0x2d0
> [    4.307243]  iommu_setup_default_domain+0x918/0xcd0
> [    4.307243]  bus_iommu_probe+0x1ad/0x4c0
> [    4.307243]  ? __pfx_bus_iommu_probe+0x10/0x10
> [    4.307243]  iommu_device_register+0x184/0x230
> [    4.307243]  ? amd_iommu_iopf_init+0xfd/0x170
> [    4.307243]  iommu_go_to_state+0xf87/0x3890
> [    4.307243]  ? __pfx_iommu_go_to_state+0x10/0x10
> [    4.307243]  ? lockdep_hardirqs_on+0x7c/0x100
> [    4.307243]  ? _raw_spin_unlock_irqrestore+0x4f/0x80
> [    4.307243]  ? add_device_randomness+0xb8/0xf0
> [    4.307243]  ? __pfx_add_device_randomness+0x10/0x10
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  amd_iommu_init+0x21/0x60
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  pci_iommu_init+0x38/0x60
> [    4.307243]  do_one_initcall+0xd6/0x460
> [    4.307243]  ? __pfx_do_one_initcall+0x10/0x10
> [    4.307243]  ? kernel_init_freeable+0x4cb/0x750
> [    4.307243]  ? kasan_unpoison+0x44/0x70
> [    4.307243]  kernel_init_freeable+0x6b4/0x750
> [    4.307243]  ? __pfx_kernel_init_freeable+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  kernel_init+0x1c/0x150
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork+0x31/0x70
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork_asm+0x1a/0x30
> [    4.307243]  </TASK>
> 
> [    4.307243] =============================
> [    4.307243] [ BUG: Invalid wait context ]
> [    4.307243] 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug
> #1 Tainted: G        W         -------  ---
> [    4.307243] -----------------------------
> [    4.307243] swapper/0/1 is trying to lock:
> [    4.307243] ffff88810de2fa88 (&queue->lock){....}-{3:3}, at:
> iopf_queue_add_device+0xd2/0x5d0
> [    4.307243] other info that might help us debug this:
> [    4.307243] context-{4:4}
> [    4.307243] 4 locks held by swapper/0/1:
> [    4.307243]  #0: ffff8881080ba920 (&group->mutex){+.+.}-{3:3}, at:
> bus_iommu_probe+0xf6/0x4c0
> [    4.307243]  #1: ffff88811654c1b8 (&domain->lock){....}-{2:2}, at:
> amd_iommu_attach_device+0x1ad/0x1e80
> [    4.307243]  #2: ffff888113518c18 (&dev_data->lock){....}-{2:2},
> at: amd_iommu_attach_device+0x213/0x1e80
> [    4.307243]  #3: ffff888108393030 (&iommu->lock){....}-{2:2}, at:
> amd_iommu_iopf_add_device+0x69/0x140
> [    4.307243] stack backtrace:
> [    4.307243] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
>   -------  ---
> 6.10.0-0.rc0.20240520giteb6a9339efeb.9.fc41.x86_64+debug #1
> [    4.307243] Hardware name: ASUS System Product Name/ROG STRIX
> B650E-I GAMING WIFI, BIOS 2611 04/07/2024
> [    4.307243] Call Trace:
> [    4.307243]  <TASK>
> [    4.307243]  dump_stack_lvl+0x84/0xd0
> [    4.307243]  __lock_acquire.cold+0x1fe/0x2a0
> [    4.307243]  ? __pfx___lock_acquire+0x10/0x10
> [    4.307243]  ? ret_from_fork_asm+0x1a/0x30
> [    4.307243]  lock_acquire+0x1ae/0x540
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx_lock_acquire+0x10/0x10
> [    4.307243]  ? __printk_cpu_sync_put+0x35/0x60
> [    4.307243]  ? add_taint+0x2a/0x70
> [    4.307243]  ? __might_resched.cold+0x203/0x23d
> [    4.307243]  ? __pfx___might_resched+0x10/0x10
> [    4.307243]  __mutex_lock+0x189/0x13f0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  ? __pfx___mutex_lock+0x10/0x10
> [    4.307243]  ? find_held_lock+0x34/0x120
> [    4.307243]  ? __pfx_lock_acquired+0x10/0x10
> [    4.307243]  ? iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  iopf_queue_add_device+0xd2/0x5d0
> [    4.307243]  amd_iommu_iopf_add_device+0xcd/0x140
> [    4.307243]  amd_iommu_attach_device+0xdc8/0x1e80
> [    4.307243]  ? iommu_create_device_direct_mappings+0x571/0x7d0
> [    4.307243]  __iommu_attach_device+0x64/0x250
> [    4.307243]  __iommu_device_set_domain+0x122/0x1c0
> [    4.307243]  __iommu_group_set_domain_internal+0xfa/0x2d0
> [    4.307243]  iommu_setup_default_domain+0x918/0xcd0
> [    4.307243]  bus_iommu_probe+0x1ad/0x4c0
> [    4.307243]  ? __pfx_bus_iommu_probe+0x10/0x10
> [    4.307243]  iommu_device_register+0x184/0x230
> [    4.307243]  ? amd_iommu_iopf_init+0xfd/0x170
> [    4.307243]  iommu_go_to_state+0xf87/0x3890
> [    4.307243]  ? __pfx_iommu_go_to_state+0x10/0x10
> [    4.307243]  ? lockdep_hardirqs_on+0x7c/0x100
> [    4.307243]  ? _raw_spin_unlock_irqrestore+0x4f/0x80
> [    4.307243]  ? add_device_randomness+0xb8/0xf0
> [    4.307243]  ? __pfx_add_device_randomness+0x10/0x10
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  amd_iommu_init+0x21/0x60
> [    4.307243]  ? __pfx_pci_iommu_init+0x10/0x10
> [    4.307243]  pci_iommu_init+0x38/0x60
> [    4.307243]  do_one_initcall+0xd6/0x460
> [    4.307243]  ? __pfx_do_one_initcall+0x10/0x10
> [    4.307243]  ? kernel_init_freeable+0x4cb/0x750
> [    4.307243]  ? kasan_unpoison+0x44/0x70
> [    4.307243]  kernel_init_freeable+0x6b4/0x750
> [    4.307243]  ? __pfx_kernel_init_freeable+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  kernel_init+0x1c/0x150
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork+0x31/0x70
> [    4.307243]  ? __pfx_kernel_init+0x10/0x10
> [    4.307243]  ret_from_fork_asm+0x1a/0x30
> [    4.307243]  </TASK>
> [    4.311628] AMD-Vi: Extended features (0x246577efa2254afa, 0x0):
> PPR NX GT [5] IA GA PC GA_vAPIC
> [    4.311639] AMD-Vi: Interrupt remapping enabled
> [    4.366191] AMD-Vi: Virtual APIC enabled
> 
> Bisect pointed to commit:
> commit c4cb23111103a841c2df30058597398443bcad5f (HEAD)
> Author: Vasant Hegde <vasant.hegde@amd.com>
> Date:   Thu Apr 18 10:33:57 2024 +0000
> 
>     iommu/amd: Add support for enable/disable IOPF
> 
>     Return success from enable_feature(IOPF) path as this interface is going
>     away. Instead we will enable/disable IOPF support in attach/detach device
>     path.
> 
>     In attach device path, if device is capable of PRI, then we will add it to
>     per IOMMU IOPF queue and enable PPR support in IOMMU. Also it will
>     attach device to domain even if it fails to enable PRI or add device to
>     IOPF queue as device can continue to work without PRI support.
> 
>     In detach device patch it follows following sequence:
>       - Flush the queue for the given device
>       - Disable PPR support in DTE[devid]
>       - Remove device from IOPF queue
>       - Disable device PRI
> 
>     Also add IOMMU_IOPF as dependency to AMD_IOMMU driver.
> 
>     Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>     Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>     Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
>     Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>     Link: https://lore.kernel.org/r/20240418103400.6229-13-vasant.hegde@amd.com
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
> 
>  drivers/iommu/amd/Kconfig     |  1 +
>  drivers/iommu/amd/amd_iommu.h |  4 ++++
>  drivers/iommu/amd/iommu.c     | 39 +++++++++++++++++++++++++++++++--------
>  drivers/iommu/amd/ppr.c       | 41 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 77 insertions(+), 8 deletions(-)
> 
> 
> Unfortunately I can't check revert c4cb23111103 due to conflicts:
> > git revert -n c4cb23111103a841c2df30058597398443bcad5f
> Auto-merging drivers/iommu/amd/Kconfig
> CONFLICT (content): Merge conflict in drivers/iommu/amd/Kconfig
> Auto-merging drivers/iommu/amd/amd_iommu.h
> Auto-merging drivers/iommu/amd/iommu.c
> CONFLICT (content): Merge conflict in drivers/iommu/amd/iommu.c
> Auto-merging drivers/iommu/amd/ppr.c
> error: could not revert c4cb23111103... iommu/amd: Add support for
> enable/disable IOPF
> 
> 
> I also attach below a full kernel log and build config.
> 
> My hardware specs: https://linux-hardware.org/?probe=ca80d0a307
> 
> Vasant or anyone else from the AMD team can you look please.
> 
> -- 
> Best Regards,
> Mike Gavrilov.

I am also getting this error on every boot. Decoded stacktrace:

[    0.395553] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
[    0.395560] fbcon: Taking over console
[    0.395564] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
[    0.395569] preempt_count: 3, expected: 0
[    0.395573] RCU nest depth: 0, expected: 0
[    0.395578] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-11198-gf3033eb79136 #897
[    0.395581] Hardware name: HP HP Pavilion Aero Laptop 13-be0xxx/8916, BIOS F.12 04/11/2023
[    0.395582] Call Trace:
[    0.395584]  <TASK>
[    0.395587] dump_stack_lvl (lib/dump_stack.c:117 (discriminator 1))
[    0.395595] dump_stack (lib/dump_stack.c:124)
[    0.395597] __might_resched (kernel/sched/core.c:10197)
[    0.395602] __might_sleep (kernel/sched/core.c:10126 (discriminator 17))
[    0.395605] mutex_lock (./include/linux/kernel.h:73 kernel/locking/mutex.c:283)
[    0.395610] iopf_queue_add_device (drivers/iommu/io-pgfault.c:341)
[    0.395616] amd_iommu_iopf_add_device (drivers/iommu/amd/ppr.c:265)
[    0.395621] amd_iommu_attach_device (drivers/iommu/amd/iommu.c:2064 drivers/iommu/amd/iommu.c:2123 drivers/iommu/amd/iommu.c:2509)
[    0.395626] __iommu_attach_device (drivers/iommu/iommu.c:2069)
[    0.395630] __iommu_device_set_domain (drivers/iommu/iommu.c:2257)
[    0.395633] __iommu_group_set_domain_internal (drivers/iommu/iommu.c:2313)
[    0.395637] iommu_setup_default_domain (drivers/iommu/iommu.c:2976)
[    0.395640] bus_iommu_probe (drivers/iommu/iommu.c:1828)
[    0.395644] iommu_device_register (drivers/iommu/iommu.c:267 (discriminator 3))
[    0.395646] ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:182)
[    0.395650] state_next (drivers/iommu/amd/init.c:2121 drivers/iommu/amd/init.c:2167 drivers/iommu/amd/init.c:3258)
[    0.395655] amd_iommu_init (drivers/iommu/amd/init.c:3305 drivers/iommu/amd/init.c:3373)
[    0.395657] ? __pfx_pci_iommu_init (arch/x86/kernel/pci-dma.c:177)
[    0.395661] pci_iommu_init (arch/x86/kernel/pci-dma.c:182)
[    0.395663] ? __pfx_pci_iommu_init (arch/x86/kernel/pci-dma.c:177)
[    0.395665] do_one_initcall (init/main.c:1267)
[    0.395671] kernel_init_freeable (init/main.c:1328 init/main.c:1345 init/main.c:1364 init/main.c:1578)
[    0.395675] ? __pfx_kernel_init (init/main.c:1459)
[    0.395679] kernel_init (init/main.c:1469)
[    0.395681] ret_from_fork (arch/x86/kernel/process.c:153)
[    0.395684] ? __pfx_kernel_init (init/main.c:1459)
[    0.395686] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
[    0.395691]  </TASK>

#regzbot ^introduced c4cb23111103a841c2df30058597398443bcad5f
