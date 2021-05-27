Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C304392CCF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAE26E03D;
	Thu, 27 May 2021 11:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B343C6E03D;
 Thu, 27 May 2021 11:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886A6113B;
 Thu, 27 May 2021 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622115307;
 bh=awWFyuDtGzTSFYuKnqnAwD8I2u8LvxPLkIedgwXpacY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4bPfFCD5PrcmECQ/JmYfkoIQvGIdlvd3Xmt5WsLHiji5zjF5hUpY/7jV/AEVHJHW
 CB6f9oBS2X3aNGgQ3+WcdNwOGV1gPRmBycO/zJJUoapgziqu+7IL5STMx1dAhYz3+T
 0bM7UEMZILv76zqCaWO+pWXqjNmfb4VQ6CH4Qz9dn7I0OepvY2P5/VxhAaiFsn1JPd
 ce1hSAg7oNQpoYW+JbRsJjBqIARt3uf0TgyQ8bjr7saHdzXTBfM/jxaDHBHbhfTQ4Z
 nDFzJaE8tdL5MVg6406RffF7r/1Of9XzA/MNxWJkmUtb6zscbeJZBFAuG32Qt3uWbG
 DCkceG/OoqRLg==
Date: Thu, 27 May 2021 12:34:57 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210527113456.GA22019@willie-the-truck>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
 <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Jianxiong Gao <jxgao@google.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 mingo@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 bskeggs@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 07:29:20PM +0800, Claire Chang wrote:
> On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > >             memory-region = <&multimedia_reserved>;
> > > >             /* ... */
> > > >     };
> > > > +
> > > > +   pcie_device: pcie_device@0,0 {
> > > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > > +           /* ... */
> > > > +   };
> > >
> > > I still don't understand how this works for individual PCIe devices -- how
> > > is dev->of_node set to point at the node you have above?
> > >
> > > I tried adding the memory-region to the host controller instead, and then
> > > I see it crop up in dmesg:
> > >
> > >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> > >
> > > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> > >
> > > What am I missing to make this work with PCIe devices?
> >
> > Aha, looks like we're just missing the logic to inherit the DMA
> > configuration. The diff below gets things working for me.
> 
> I guess what was missing is the reg property in the pcie_device node.
> Will update the example dts.

Thanks. I still think something like my diff makes sense, if you wouldn't mind including
it, as it allows restricted DMA to be used for situations where the PCIe
topology is not static.

Perhaps we should prefer dev->of_node if it exists, but then use the node
of the host bridge's parent node otherwise?

Will
