Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AEE3B3392
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 18:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078576EC3F;
	Thu, 24 Jun 2021 16:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995686EC3F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 16:07:19 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c8so5580580pfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
 b=V1DUMk4pWXUrJHEg/9Kd4ukoLxbJGeXfb8ZAhSFnF6RVbF8t2Z5J1ymG4niuoHNq4v
 lR13PRE87YP1jrN3LaPEaViS+9EA9qGG/k81iCPvzgmr34ySIt4SvvmFKyoWhdSPE98X
 KaxkIr3Pk6gTC5BkELMIeQJS2sWcVoDywrhkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
 b=hYWZhCNPUDvk71xi0KCU1C8Y67ld+cseQaV0C2vWY3a6JBkUYlpGRyQaBeNnba1OyI
 H9K946pKbOSi7zcEvDnOcL9KowvOhzmYaFJXAzX7Ny6VWORE3IFQwaUahxvYmutkQLfI
 SaRrGt81tKfr7miQ9LvgyKKxn9gMXTaq4yQXpVHnHRvqjNLwMqY6zBscrBpySKRB/2ym
 k4dvRHAi76ueXpS2rVoc9InywQWpzNPNHF5zpW5My/LjSwysatQke20j5Fp5RsZMwB6D
 XvP/CUZHuTN6kETpAnXfPSTkqEse2xG6qC82Pl7frjcve/SAFKDBNR3yMxBUAxlR1Bi3
 I0BA==
X-Gm-Message-State: AOAM533YTrtfis+P3sPFDIrqXwtR+HRCGAZgFSZscPkbovyKnUPTwSeI
 1CsHsqxcUjx84pQdHHWqMup2mej2v/YTkA==
X-Google-Smtp-Source: ABdhPJwqGJ0H6yXszIf702XB9CqcqrOC+u7pvwXXNO/fG/yrg4RQiXIYh1TPXg3+rei2cWCiRslOXA==
X-Received: by 2002:aa7:8615:0:b029:303:4428:9dbe with SMTP id
 p21-20020aa786150000b029030344289dbemr5781345pfn.17.1624550838983; 
 Thu, 24 Jun 2021 09:07:18 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com.
 [209.85.215.181])
 by smtp.gmail.com with ESMTPSA id c24sm3133059pgj.11.2021.06.24.09.07.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 09:07:18 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id e20so5132923pgg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:07:18 -0700 (PDT)
X-Received: by 2002:a92:9509:: with SMTP id y9mr4122371ilh.18.1624550347935;
 Thu, 24 Jun 2021 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
 <20210624114829.GB1382@willie-the-truck>
 <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com>
 <YNSq56zyJ7EYdTcI@char.us.oracle.com>
In-Reply-To: <YNSq56zyJ7EYdTcI@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 24 Jun 2021 23:58:57 +0800
X-Gmail-Original-Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>, Will Deacon <will@kernel.org>,
 intel-gfx@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, Greg KH <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, Tom Lendacky <thomas.lendacky@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 11:56 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Thu, Jun 24, 2021 at 10:10:51AM -0400, Qian Cai wrote:
> >
> >
> > On 6/24/2021 7:48 AM, Will Deacon wrote:
> > > Ok, diff below which attempts to tackle the offset issue I mentioned as
> > > well. Qian Cai -- please can you try with these changes?
> >
> > This works fine.
>
> Cool. Let me squash this patch in #6 and rebase the rest of them.
>
> Claire, could you check the devel/for-linus-5.14 say by end of today to
> double check that I didn't mess anything up please?

I just submitted v15 here
(https://lore.kernel.org/patchwork/cover/1451322/) in case it's
helpful.
I'll double check of course. Thanks for the efforts!

>
> Will,
>
> Thank you for generating the fix! I am going to run it on x86 and Xen
> to make sure all is good (granted last time I ran devel/for-linus-5.14
> on that setup I didn't see any errors so I need to double check
> I didn't do something silly like run a wrong kernel).
>
>
> >
> > >
> > > Will
> > >
> > > --->8
> > >
> > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > index 175b6c113ed8..39284ff2a6cd 100644
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> > >
> > >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > >  {
> > > -       return dev->dma_io_tlb_mem->force_bounce;
> > > +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> > > +
> > > +       return mem && mem->force_bounce;
> > >  }
> > >
> > >  void __init swiotlb_exit(void);
> > > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > > index 44be8258e27b..0ffbaae9fba2 100644
> > > --- a/kernel/dma/swiotlb.c
> > > +++ b/kernel/dma/swiotlb.c
> > > @@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >                 dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
> > >         unsigned int nslots = nr_slots(alloc_size), stride;
> > >         unsigned int index, wrap, count = 0, i;
> > > +       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
> > >         unsigned long flags;
> > >
> > >         BUG_ON(!nslots);
> > > @@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >         for (i = index; i < index + nslots; i++) {
> > >                 mem->slots[i].list = 0;
> > >                 mem->slots[i].alloc_size =
> > > -                       alloc_size - ((i - index) << IO_TLB_SHIFT);
> > > +                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
> > >         }
> > >         for (i = index - 1;
> > >              io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
> > >
