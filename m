Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC1371691
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 16:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796D6E201;
	Mon,  3 May 2021 14:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A30E6E209
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 14:26:25 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j12so3806784ils.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELcNibbwxopbe4wnzShPTb7xRMLVvYpqQ8un28QQp9U=;
 b=nOyrfh2thpmQagEkzKEHJkMTgRy+3FJJdT9Oo6MZndwooAl8msGQ2IZHFMeS6aJ6Md
 +OeRGM111zl+0t7XmNgYC8WpP2ka9OwZM9VN//prTwlXpUXb+Muztthx/dt4YfUeTqwD
 ene0+k2RSvchnHpwNfAnGfkLV6l7GmkYIbRvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELcNibbwxopbe4wnzShPTb7xRMLVvYpqQ8un28QQp9U=;
 b=CfnQUR4WZJqrtAry1cX9bUF3pw3zKhCtHZZprBjcnWbY5UX8X3k3LpY02CoLPOxB78
 XbIz9D/KNK5TlRskDbHVyf+iy7LJb486cpgAisZ85iVqGjYOLG8NqblO3CcMAeMkd2MF
 py64VGJhROeh5U30Vh/RmHXApq+I4nrX3V2ABOo8AzdRkth1lQ6Qa4UKRpsMQRIb/jUz
 wvUd9N0twajx563uvtLjvtPTtro6rmh78XyThBLJocSBDKahaVNBAn8ElbjM0Gxj4X+L
 q5vxt1cmOiBwEMXhZ28Y+aBm7Ct0RmeK3cECJWKxqGdBX2hUtOB+veszSzy9AgtgWjiy
 ygZw==
X-Gm-Message-State: AOAM530LGoVlZ1lN2lDXFbE1zblvVg2XFnnVBMS4E9/818xvjaK3eQdi
 o8OMkZxcblfv+2NCmMdUsjEiwZNZOaaw9w==
X-Google-Smtp-Source: ABdhPJxuRFKv1ySLkFlxLgmuLn4a1YfJeFJ5AGjafWx4rM+0UdEYQpsbsVyXf8GNYfn3vUA6yhIHbA==
X-Received: by 2002:a05:6e02:214e:: with SMTP id
 d14mr16557314ilv.142.1620051984562; 
 Mon, 03 May 2021 07:26:24 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id v7sm5712175ilo.25.2021.05.03.07.26.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 07:26:23 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id j12so3806677ils.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 07:26:23 -0700 (PDT)
X-Received: by 2002:a05:6e02:f4e:: with SMTP id
 y14mr3397094ilj.18.1620051971892; 
 Mon, 03 May 2021 07:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-15-tientzu@chromium.org>
 <70b895c2-4a39-bbbd-a719-5c8b6b922026@arm.com>
In-Reply-To: <70b895c2-4a39-bbbd-a719-5c8b6b922026@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 3 May 2021 22:26:00 +0800
X-Gmail-Original-Message-ID: <CALiNf28cc5T-cMZxNPZnrTQvqu2Ge_MmZj-teN4mE_-E-6_6XQ@mail.gmail.com>
Message-ID: <CALiNf28cc5T-cMZxNPZnrTQvqu2Ge_MmZj-teN4mE_-E-6_6XQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] dma-direct: Allocate memory from restricted DMA
 pool if available
To: Robin Murphy <robin.murphy@arm.com>
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
 lkml <linux-kernel@vger.kernel.org>, grant.likely@arm.com, paulus@samba.org,
 Will Deacon <will@kernel.org>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 chris@chris-wilson.co.uk, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 9:46 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > The restricted DMA pool is preferred if available.
> >
> > The restricted DMA pools provide a basic level of protection against the
> > DMA overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
> > needs to provide a way to lock down the memory access, e.g., MPU.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   kernel/dma/direct.c | 35 ++++++++++++++++++++++++++---------
> >   1 file changed, 26 insertions(+), 9 deletions(-)
> >
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 7a27f0510fcc..29523d2a9845 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -78,6 +78,10 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
> >   static void __dma_direct_free_pages(struct device *dev, struct page *page,
> >                                   size_t size)
> >   {
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (swiotlb_free(dev, page, size))
> > +             return;
> > +#endif
> >       dma_free_contiguous(dev, page, size);
> >   }
> >
> > @@ -92,7 +96,17 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> >
> >       gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> >                                          &phys_limit);
> > -     page = dma_alloc_contiguous(dev, size, gfp);
> > +
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     page = swiotlb_alloc(dev, size);
> > +     if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > +             __dma_direct_free_pages(dev, page, size);
> > +             page = NULL;
> > +     }
> > +#endif
> > +
> > +     if (!page)
> > +             page = dma_alloc_contiguous(dev, size, gfp);
> >       if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> >               dma_free_contiguous(dev, page, size);
> >               page = NULL;
> > @@ -148,7 +162,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >               gfp |= __GFP_NOWARN;
> >
> >       if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> > -         !force_dma_unencrypted(dev)) {
> > +         !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
> >               page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
> >               if (!page)
> >                       return NULL;
> > @@ -161,8 +175,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >       }
> >
> >       if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> > -         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > -         !dev_is_dma_coherent(dev))
> > +         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> >
> >       /*
> > @@ -172,7 +186,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >       if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> >           !gfpflags_allow_blocking(gfp) &&
> >           (force_dma_unencrypted(dev) ||
> > -          (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
> > +          (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > +           !dev_is_dma_coherent(dev))) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> >
> >       /* we always manually zero the memory once we are done */
> > @@ -253,15 +269,15 @@ void dma_direct_free(struct device *dev, size_t size,
> >       unsigned int page_order = get_order(size);
> >
> >       if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> > -         !force_dma_unencrypted(dev)) {
> > +         !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
> >               /* cpu_addr is a struct page cookie, not a kernel address */
> >               dma_free_contiguous(dev, cpu_addr, size);
> >               return;
> >       }
> >
> >       if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> > -         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > -         !dev_is_dma_coherent(dev)) {
> > +         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> > +         !is_dev_swiotlb_force(dev)) {
> >               arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> >               return;
> >       }
> > @@ -289,7 +305,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
> >       void *ret;
> >
> >       if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> > -         force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
> > +         force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>
> Wait, this seems broken for non-coherent devices - in that case we need
> to return a non-cacheable address, but we can't simply fall through into
> the remapping path below in GFP_ATOMIC context. That's why we need the
> atomic pool concept in the first place :/

Sorry for the late reply. I'm not very familiar with this. I wonder if
the memory returned here must be coherent. If yes, could we say for
this case, one must set up another device coherent pool
(shared-dma-pool) and go with dma_alloc_from_dev_coherent()[1]?

[1] https://elixir.bootlin.com/linux/v5.12/source/kernel/dma/mapping.c#L435

>
> Unless I've overlooked something, we're still using the regular
> cacheable linear map address of the dma_io_tlb_mem buffer, no?
>
> Robin.
>
> >
> >       page = __dma_direct_alloc_pages(dev, size, gfp);
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
