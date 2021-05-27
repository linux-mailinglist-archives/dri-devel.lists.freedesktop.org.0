Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D6392CB1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDA6E483;
	Thu, 27 May 2021 11:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E1E6E483
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:29:43 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j12so3459536pgh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
 b=J39qajy3UJ3qAzWqGeZGEnwMoSI9LW5BjibS8fd+Acudu4FxBAXa2OhDGjuMcgqW0/
 wo/z5L5WO21v6biwP7ZKEgtIJf223PVujpTOF4zDsL3aPOmxJx+dxaS3A0oSwB4zv/i6
 Jb0bh8tNiRStD2FZiusMVkFxa8G1teBBpM9vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
 b=EeMG1ZLpD1c1nKg/5vmlm9OINX38Lq3y9EaPxp7hNQH9B4xaaErfFio8YsSACsft7p
 0skGPeaOyBhennJM34GlY+pLADqsB3e85PNXVWTlNl56yFOeODW5SkYnHgIH3ji41UnS
 E3+Pu1yd78ZozhFM0X9V1RBgZX4gk31FUKrneLXF+YROfymc6AlLZxh0HOvEinoLz9xw
 1BfKP+MAXbYVeFMxvFcl3BzGQ8cBxrEUJFy/ie2yHMpQeDrQ13AW15mWtewgLTL9qDPc
 +0zdIFe8adO5r3/Xqy7sgV2DHPTwfeGAY2wdd8L9RLcGz0baWvkRj5upqwoE0+mf4JOB
 oCag==
X-Gm-Message-State: AOAM533bJnYGWRHeQInlQ51uKIOsrzdAiQCC2LTOrN/cDAIBM2Lk5TcT
 UT44HOVk+QP5KyIHisLKnwp5yT6Hp1Ls7g==
X-Google-Smtp-Source: ABdhPJzqamlqRs70y3IwkS4hzUMdA8VWts/bsmgp329QvuNnhUoQqUipaSVmbvSNgJtUTzBRyD2U+A==
X-Received: by 2002:a62:2e81:0:b029:2db:1e53:678a with SMTP id
 u123-20020a622e810000b02902db1e53678amr3202502pfu.36.1622114982815; 
 Thu, 27 May 2021 04:29:42 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com.
 [209.85.215.181])
 by smtp.gmail.com with ESMTPSA id 23sm1803049pgv.90.2021.05.27.04.29.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 04:29:42 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id m124so3455109pgm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:29:42 -0700 (PDT)
X-Received: by 2002:a05:6e02:e42:: with SMTP id
 l2mr2536928ilk.189.1622114971302; 
 Thu, 27 May 2021 04:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
In-Reply-To: <20210526155321.GA19633@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 19:29:20 +0800
X-Gmail-Original-Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
To: Will Deacon <will@kernel.org>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > >             memory-region = <&multimedia_reserved>;
> > >             /* ... */
> > >     };
> > > +
> > > +   pcie_device: pcie_device@0,0 {
> > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > +           /* ... */
> > > +   };
> >
> > I still don't understand how this works for individual PCIe devices -- how
> > is dev->of_node set to point at the node you have above?
> >
> > I tried adding the memory-region to the host controller instead, and then
> > I see it crop up in dmesg:
> >
> >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> >
> > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> >
> > What am I missing to make this work with PCIe devices?
>
> Aha, looks like we're just missing the logic to inherit the DMA
> configuration. The diff below gets things working for me.

I guess what was missing is the reg property in the pcie_device node.
Will update the example dts.
