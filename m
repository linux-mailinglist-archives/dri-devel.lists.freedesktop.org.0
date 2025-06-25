Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F7AE7A7F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1361510E6A3;
	Wed, 25 Jun 2025 08:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="CzHCb2B0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2415310E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250625084220euoutp0127f2bf97895ee570ae008936cf173fb7~MPI8ZiUPv1818518185euoutp018
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250625084220euoutp0127f2bf97895ee570ae008936cf173fb7~MPI8ZiUPv1818518185euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750840940;
 bh=rajn+g2Oqrf0lxEltO7HAcymJJqYGt/Au+aZbXuqSoE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=CzHCb2B0+V4PT4n8kOe3m+LHixhVNpJV1jQ87KxlC5v9M5b2Xk3eic6tyXn1VZQy5
 1bt2MCq2Zw8XUucTCpHA0mtuoJzkFTFntAFMUJgihAU7IjAq2YQOFGqpAL1/sVLx7n
 qdMYpVhBu++APo/Neg45Pu0fw6SWBBUluNL0Js8s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250625084219eucas1p2ad80455b26312631d928ef16a7cb3a23~MPI7721jG0933809338eucas1p2a;
 Wed, 25 Jun 2025 08:42:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250625084219eusmtip247ccf68dde7932f00ec254134783fd13~MPI7fSRE80286402864eusmtip2x;
 Wed, 25 Jun 2025 08:42:19 +0000 (GMT)
Message-ID: <833aef10-9fcf-4abd-bea8-c34ea7ed6bb2@samsung.com>
Date: Wed, 25 Jun 2025 10:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help: Samsung Exynos 7870 DECON SYSMMU panic
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Robin Murphy
 <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <c338c9f7528fdcba56c088390c4ccffc@disroot.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625084219eucas1p2ad80455b26312631d928ef16a7cb3a23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625073955eucas1p2913134af8cc26dcb2145188f8a43256b
X-EPHeader: CA
X-CMS-RootMailID: 20250625073955eucas1p2913134af8cc26dcb2145188f8a43256b
References: <544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org>
 <0bc60699-eeaa-4121-8d93-0274862f5aed@arm.com>
 <CGME20250625073955eucas1p2913134af8cc26dcb2145188f8a43256b@eucas1p2.samsung.com>
 <c338c9f7528fdcba56c088390c4ccffc@disroot.org>
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

On 25.06.2025 09:39, Kaustabh Chakraborty wrote:
> On 2025-06-24 17:12, Robin Murphy wrote:
>> On 2025-06-18 3:02 pm, Kaustabh Chakraborty wrote:
>>> Since bcb81ac6ae3c (iommu: Get DT/ACPI parsing into the proper probe 
>>> path),
>>> The Samsung Exynos 7870 DECON device (with patches [1], [2], and 
>>> [3]) seems
>>> to not work anymore. Upon closer inspection, I observe that there is an
>>> IOMMU crash.
>>>
>>> [    2.918189] exynos-sysmmu 14860000.sysmmu: 14830000.decon: [READ] 
>>> PAGE FAULT occurred at 0x6715b3e0
>>> [    2.918199] exynos-sysmmu 14860000.sysmmu: Page table base: 
>>> 0x0000000044a14000
>>> [    2.918243] exynos-drm exynos-drm: bound 14830000.decon (ops 
>>> decon_component_ops)
>>> [    2.922868] exynos-sysmmu 14860000.sysmmu:   Lv1 entry: 0x4205001
>>> [    2.922877] Kernel panic - not syncing: Unrecoverable System MMU 
>>> Fault!
>>> [    2.922885] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 
>>> 6.16.0-rc2-exynos7870 #722 PREEMPT
>>> [    2.995312] Hardware name: Samsung Galaxy J7 Prime (DT)
>>> [    3.000509] Call trace:
>>> [    3.002938]  show_stack+0x18/0x24 (C)
>>> [    3.006582]  dump_stack_lvl+0x60/0x80
>>> [    3.010224]  dump_stack+0x18/0x24
>>> [    3.013521]  panic+0x168/0x360
>>> [    3.016558]  exynos_sysmmu_irq+0x224/0x2ac
>>> [         ...]
>>> [    3.108786] ---[ end Kernel panic - not syncing: Unrecoverable 
>>> System MMU Fault! ]---
>>
>> For starters, what if you just remove this panic() from the IOMMU 
>> driver? Frankly it seems a bit excessive anyway...
>
> I've tried that, sysmmu repeatedly keeps issuing interrupts (yes, even
> after clearing the interrupt bit) indefinitely.
>
Right, this is because decon device is still accessing system memory in 
a loop trying to display the splash screen. That panic is indeed a bit 
excessive, but what else IOMMU driver can do if no page fault handle is 
registered?


>>
>> From the logs below it seems there is apparently unexpected traffic 
>> already going through the IOMMU when it wakes up. Is this the DRM 
>> drivers doing something sketchy, or has the bootloader left the 
>> display running for a splash screen? However in the latter case I 
>> don't obviously see why delaying the IOMMU probe should make much 
>> difference, given that the decon driver should still be waiting for 
>> it either way.
>
> The display is initialized by the bootloader for splash yes, but I reckon
> it doesn't use the IOMMU as it's accessible from a framebuffer region.

Right, bootloader configured decon device to display splash screen, what 
means that decon device is constantly reading splash screen pixel data 
from system memory. There is no such thing as a 'framebuffer region', it 
is just a system memory, which exynos sysmmu protects when enabled. So 
far this issue of splash screen from bootloader has not yet been solved 
in mainline. On other Exynos based supported boards this works only 
because there are also power domain drivers enabled, which are 
instantiated before the display related device and respective sysmmu 
device. That power domain driver shuts down power effectively disabling 
the display before the sysmmu gets probbed.

Long time ago I've pointed this issue and proposed some simple solution 
like a special initial identity mapping for the memory range used for 
splash screen, but that proposal is no longer applicable for the current 
code.

As a workaround I would suggest to shutdown display in the decon device 
before starting the kernel (i.e. from the 'kernel loading mid-stage 
bootloader' if you have such).


>
>>
>> Thanks,
>> Robin.
>>
>>> The commit has been introduced in mainline v6.15-rc1. I've also 
>>> tested in
>>> v6.15, v6.15.2, and v6.16-rc2, and there have been no apparent changes.
>>>
>>> I've tried to revert the commit, and it does work that way. But on 
>>> reading
>>> the commit message I understand that I need to find a proper 
>>> solution here.
>>> I've tried to skim down the revert, and this is what I get - if i 
>>> change
>>> line [4] as follows:
>>>
>>> -        dev->bus->dma_configure(dev);
>>> +        if (!strcmp(dev_name(dev), "14830000.decon"))
>>> +            dev->bus->dma_configure(dev);
>>>
>>> It really doesn't like dma_configure for some reason. It works, but:
>>>
>>> [    2.779291] exynos-decon 14830000.decon: late IOMMU probe at 
>>> driver bind, something fishy here!
>>>
>>> I believe the IOMMU hardware doesn't like the fact that it is being
>>> initialized/resumed too early. I formed this conclusion by comparing 
>>> the
>>> logs:
>>>
>>> mainline:
>>> [    1.274575] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_resume enter
>>> [    2.859656] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable enter
>>> [    2.864192] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_clocks enter
>>> [    2.869299] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>>> 0x00000007
>>> [    2.875062] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_init_config enter
>>> [    2.880006] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000004 val 
>>> 0x01100784
>>> [    2.885819] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_set_ptbase enter
>>> [    2.890677] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x0000000c val 
>>> 0x00044a14
>>> [    2.896490] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_tlb_invalidate 
>>> enter
>>> [    2.901695] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000010 val 
>>> 0x00000001
>>> [    2.907507] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_vid enter
>>> [    2.912366] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>>> 0x00000005
>>> [    2.912371] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_irq enter
>>> [    2.912836] [drm] Exynos DRM: using 14830000.decon device for DMA 
>>> mapping operations
>>> [    2.918175] I_HAVE_ADDED_THESE: SYSMMU: 
>>> exynos_sysmmu_v5_get_fault_info enter
>>> [    2.918182] I_HAVE_ADDED_THESE: SYSMMU: show_fault_information enter
>>> [    2.918189] exynos-sysmmu 14860000.sysmmu: 14830000.decon: [READ] 
>>> PAGE FAULT occurred at 0x6715b3e0
>>> [    2.918199] exynos-sysmmu 14860000.sysmmu: Page table base: 
>>> 0x0000000044a14000
>>> [    2.918243] exynos-drm exynos-drm: bound 14830000.decon (ops 
>>> decon_component_ops)
>>> [    2.922859] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>>> [    2.922864] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    2.922868] exynos-sysmmu 14860000.sysmmu:   Lv1 entry: 0x4205001
>>> [    2.922877] Kernel panic - not syncing: Unrecoverable System MMU 
>>> Fault!
>>>
>>> and with the patch above applied:
>>> [    3.018478] [drm] Exynos DRM: using 14830000.decon device for DMA 
>>> mapping operations
>>> [    3.025794] exynos-drm exynos-drm: bound 14830000.decon (ops 
>>> decon_component_ops)
>>> [    3.058655] exynos-dsi 14800000.dsi: 
>>> [drm:samsung_dsim_host_attach] Attached td4300-panel device (lanes:4 
>>> bpp:24 mode-flags:0x23)
>>> [    3.070189] exynos-drm exynos-drm: bound 14800000.dsi (ops 
>>> exynos_dsi_component_ops)
>>> [    3.078506] [drm] Initialized exynos 1.1.0 for exynos-drm on minor 1
>>> [    3.090747] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_map enter
>>> [    3.090845] I_HAVE_ADDED_THESE: SYSMMU: to_exynos_domain enter
>>> [    3.093325] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>>> [    3.097662] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    3.102000] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    3.106337] I_HAVE_ADDED_THESE: SYSMMU: lv1set_section enter
>>> [    3.110762] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>>> [    3.115726] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_map enter
>>> [    3.120317] I_HAVE_ADDED_THESE: SYSMMU: to_exynos_domain enter
>>> [    3.124914] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>>> [    3.129240] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    3.133578] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    3.137916] I_HAVE_ADDED_THESE: SYSMMU: lv1set_section enter
>>> [    3.142340] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>>> [         ...] (a lot of repetitions later)
>>> [    4.322904] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>>> [    4.327230] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    4.331567] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    4.335905] I_HAVE_ADDED_THESE: SYSMMU: alloc_lv2entry enter
>>> [    4.340329] I_HAVE_ADDED_THESE: SYSMMU: page_entry enter
>>> [    4.344407] I_HAVE_ADDED_THESE: SYSMMU: lv2ent_offset enter
>>> [    4.348744] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>>> [    4.353082] I_HAVE_ADDED_THESE: SYSMMU: lv2set_page enter
>>> [    4.357246] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>>> [    4.362751] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_resume enter
>>> [    4.362767] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable enter
>>> [    4.362771] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_clocks enter
>>> [    4.362777] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>>> 0x00000007
>>> [    4.362782] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_init_config enter
>>> [    4.362786] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000004 val 
>>> 0x01100784
>>> [    4.362791] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_set_ptbase enter
>>> [    4.362795] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x0000000c val 
>>> 0x00042a64
>>> [    4.362799] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_tlb_invalidate 
>>> enter
>>> [    4.362803] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000010 val 
>>> 0x00000001
>>> [    4.362808] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_vid enter
>>> [    4.362811] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>>> 0x00000005
>>>
>>> Then it continues booting as usual.
>>>
>>> My lack of understanding of the IOMMU and DRM subsystems are really
>>> limiting my triaging capabilities here, therefore I ask for any form
>>> guidance or assistance with this.
>>>
>>> Thank you.
>>>
>>> [1] 
>>> https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
>>> [2] 
>>> https://lore.kernel.org/all/20250612-exynos7870-drm-dts-v1-2-88c0779af6cb@disroot.org
>>> [3] 
>>> https://lore.kernel.org/all/20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org
>>> [4] 
>>> https://protect2.fireeye.com/v1/url?k=015e6282-60d577b4-015fe9cd-74fe485cbff1-5039f5dfc286ac1d&q=1&e=4899b4fe-bcb8-43f2-87ed-92e79b0abe08&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.16-rc2%2Fsource%2Fdrivers%2Fiommu%2Fiommu.c%23L431
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

