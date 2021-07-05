Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631173BB7DA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A507898A4;
	Mon,  5 Jul 2021 07:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339B489256
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 07:29:58 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id w15so17454333pgk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8aOTxpCpkipy5n3d0JHyfRjSSgUP3aCWoPMsdbSOV4=;
 b=MJjJv9vXGkq68MzcWqJ8Lqqow7NxZ75tHGPZbYF1jhN9Bhg/MWiZ0zY75eGHeJNh5Z
 PszBTQni1VZca3yQMBDVtTmKafxxH3GNCEriEJqlKouIDe5e4/R1nL0etnQNDybC+N/V
 LRgX2z3bSUPhZ4K1Wms/UIusjY+z2apf3AHmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8aOTxpCpkipy5n3d0JHyfRjSSgUP3aCWoPMsdbSOV4=;
 b=sZmeRiI2vplkZQXSqS2yVy3zHYh8OCVG2o+H/WLqc9vpudNoT2RKHD9a8WEN7p/HVc
 0b8jHfkpWZy6258P27uMjlNJMvxnuHZJlmVlJeJtqTK/HXtmwKaH0UjSzVG6nJuiJFYt
 7FP88d0wLZSkTgsDFDhkTzlfJXd0+JGZ/z32L69wWhOjdG0sHFW/QoOu9/mMmnlfLtBY
 fJeJkS3zRUdplH/1US7SWO0znO95p8AB4Ehc0bUxyL18qQGDqvXH5IiuB8Htycf8CWdS
 uY4hJe9sy+06RsnTgGZmonGgQdArF8bL6uFSYg5T95Z4JjJiftPN4573z109RPal9/gB
 6mLw==
X-Gm-Message-State: AOAM532ZVJrad0nFxJblgF5u5LH2nUqo31GYJ2HAaMaDax/J9Dhvk6kA
 dyW+zuaNb8is51/DVhcS5rbx9cT+Dl5IMw==
X-Google-Smtp-Source: ABdhPJyCp0JcxYGphRVR2wjkJPxJVd+4Y8+L834Ht9VdNBsv+1ivjFjq0pSHluY80GGGXjtgtid69Q==
X-Received: by 2002:a63:2cc4:: with SMTP id
 s187mr14218824pgs.233.1625470197121; 
 Mon, 05 Jul 2021 00:29:57 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id s27sm11534222pfg.169.2021.07.05.00.29.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 00:29:56 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d12so15965927pfj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 00:29:56 -0700 (PDT)
X-Received: by 2002:a92:d10:: with SMTP id 16mr9764177iln.189.1625470185557;
 Mon, 05 Jul 2021 00:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
In-Reply-To: <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 5 Jul 2021 15:29:34 +0800
X-Gmail-Original-Message-ID: <CALiNf2_ZJq4MoxOGe_m_KFv5xYw8t9SdscTFUwSoLBy5rEuxwQ@mail.gmail.com>
Message-ID: <CALiNf2_ZJq4MoxOGe_m_KFv5xYw8t9SdscTFUwSoLBy5rEuxwQ@mail.gmail.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, mpe@ellerman.id.au,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 3, 2021 at 1:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Will and Robin,
>
> On Fri, Jul 02, 2021 at 04:13:50PM +0100, Robin Murphy wrote:
> > On 2021-07-02 14:58, Will Deacon wrote:
> > > Hi Nathan,
> > >
> > > On Thu, Jul 01, 2021 at 12:52:20AM -0700, Nathan Chancellor wrote:
> > > > On 7/1/2021 12:40 AM, Will Deacon wrote:
> > > > > On Wed, Jun 30, 2021 at 08:56:51AM -0700, Nathan Chancellor wrote:
> > > > > > On Wed, Jun 30, 2021 at 12:43:48PM +0100, Will Deacon wrote:
> > > > > > > On Wed, Jun 30, 2021 at 05:17:27PM +0800, Claire Chang wrote:
> > > > > > > > `BUG: unable to handle page fault for address: 00000000003a8290` and
> > > > > > > > the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
> > > > > > > > (maybe dev->dma_io_tlb_mem) was corrupted?
> > > > > > > > The dev->dma_io_tlb_mem should be set here
> > > > > > > > (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
> > > > > > > > through device_initialize.
> > > > > > >
> > > > > > > I'm less sure about this. 'dma_io_tlb_mem' should be pointing at
> > > > > > > 'io_tlb_default_mem', which is a page-aligned allocation from memblock.
> > > > > > > The spinlock is at offset 0x24 in that structure, and looking at the
> > > > > > > register dump from the crash:
> > > > > > >
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
> > > > > > > Jun 29 18:28:42 hp-4300G kernel: Call Trace:
> > > > > > > Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
> > > > > > > Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
> > > > > > >
> > > > > > > Then that correlates with R11 holding the 'dma_io_tlb_mem' pointer and
> > > > > > > RDX pointing at the spinlock. Yet RAX is holding junk :/
> > > > > > >
> > > > > > > I agree that enabling KASAN would be a good idea, but I also think we
> > > > > > > probably need to get some more information out of swiotlb_tbl_map_single()
> > > > > > > to see see what exactly is going wrong in there.
> > > > > >
> > > > > > I can certainly enable KASAN and if there is any debug print I can add
> > > > > > or dump anything, let me know!
> > > > >
> > > > > I bit the bullet and took v5.13 with swiotlb/for-linus-5.14 merged in, built
> > > > > x86 defconfig and ran it on my laptop. However, it seems to work fine!
> > > > >
> > > > > Please can you share your .config?
> > > >
> > > > Sure thing, it is attached. It is just Arch Linux's config run through
> > > > olddefconfig. The original is below in case you need to diff it.
> > > >
> > > > https://raw.githubusercontent.com/archlinux/svntogit-packages/9045405dc835527164f3034b3ceb9a67c7a53cd4/trunk/config
> > > >
> > > > If there is anything more that I can provide, please let me know.
> > >
> > > I eventually got this booting (for some reason it was causing LD to SEGV
> > > trying to link it for a while...) and sadly it works fine on my laptop. Hmm.
>
> Seems like it might be something specific to the amdgpu module?
>
> > > Did you manage to try again with KASAN?
>
> Yes, it took a few times to reproduce the issue but I did manage to get
> a dmesg, please find it attached. I build from commit 7d31f1c65cc9 ("swiotlb:
> fix implicit debugfs declarations") in Konrad's tree.

Looking at the logs, the use-after-free bug looked somehow relevant
(and it's nvme again. Qian's crash is about nvme too):

[    2.468288] BUG: KASAN: use-after-free in __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.468288] Read of size 8 at addr ffff8881d7830000 by task swapper/0/0

[    2.468288] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3-debug #1
[    2.468288] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    2.468288] Call Trace:
[    2.468288]  <IRQ>
[    2.479433]  dump_stack+0x9c/0xcf
[    2.479433]  print_address_description.constprop.0+0x18/0x130
[    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  kasan_report.cold+0x7f/0x111
[    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  __iommu_dma_unmap_swiotlb+0x64/0xb0
[    2.479433]  nvme_pci_complete_rq+0x73/0x130
[    2.479433]  blk_complete_reqs+0x6f/0x80
[    2.479433]  __do_softirq+0xfc/0x3be
[    2.479433]  irq_exit_rcu+0xce/0x120
[    2.479433]  common_interrupt+0x80/0xa0
[    2.479433]  </IRQ>
[    2.479433]  asm_common_interrupt+0x1e/0x40
[    2.479433] RIP: 0010:cpuidle_enter_state+0xf9/0x590

I wonder if this ended up unmapping something wrong and messing up the
dev->dma_io_tlb_mem (i.e. io_tlb_default_mem)?

Could you try this patch on top of 7d31f1c65cc9? This patch helps
check if we try to unmap the wrong address.

```
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b7f76bca89bf..5ac08d50a394 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -613,6 +613,21 @@ void swiotlb_tbl_unmap_single(struct device *dev,
phys_addr_t tlb_addr,
                              size_t mapping_size, enum dma_data_direction dir,
                              unsigned long attrs)
 {
+       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+       unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
+       int index;
+
+       if (!is_swiotlb_buffer(dev, tlb_addr - offset)) {
+               dev_err(dev, "%s: attempt to unmap invalid address
(0x%llx, offset=%u)\n", __func__, tlb_addr, offset);
+               return;
+       }
+
+       index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
+       if (mem->slots[index].orig_addr == INVALID_PHYS_ADDR) {
+               dev_err(dev, "%s: memory is not mapped before (0x%llx,
offset=%u)\n", __func__, tlb_addr, offset);
+               return;
+       }
+
        /*
         * First, sync the memory before unmapping the entry
         */
```
It might be useful to have CONFIG_SLUB_DEBUG=y, CONFIG_SLUB_DEBUG_ON=y
and line numbers (scripts/decode_stacktrace.sh) too.

Thank you so much for helping!

>
> > > It might also be worth taking the IOMMU out of the equation, since that
> > > interfaces differently with SWIOTLB and I couldn't figure out the code path
> > > from the log you provided. What happens if you boot with "amd_iommu=off
> > > swiotlb=force"?
> >
> > Oh, now there's a thing... the chat from the IOMMU API in the boot log
> > implies that the IOMMU *should* be in the picture - we see that default
> > domains are IOMMU_DOMAIN_DMA default and the GPU 0000:0c:00.0 was added to a
> > group. That means dev->dma_ops should be set and DMA API calls should be
> > going through iommu-dma, yet the callstack in the crash says we've gone
> > straight from dma_map_page_attrs() to swiotlb_map(), implying the inline
> > dma_direct_map_page() path.
> >
> > If dev->dma_ops didn't look right in the first place, it's perhaps less
> > surprising that dev->dma_io_tlb_mem might be wild as well. It doesn't seem
> > plausible that we should have a race between initialising the device and
> > probing its driver, so maybe the whole dev pointer is getting trampled
> > earlier in the callchain (or is fundamentally wrong to begin with, but from
> > a quick skim of the amdgpu code it did look like adev->dev and adev->pdev
> > are appropriately set early on by amdgpu_pci_probe()).
> >
> > > (although word of warning here: i915 dies horribly on my laptop if I pass
> > > swiotlb=force, even with the distro 5.10 kernel)
> >
> > FWIW I'd imagine you probably need to massively increase the SWIOTLB buffer
> > size to have hope of that working.
>
> Is it worth trying this still then?
>
> Cheers,
> Nathan
