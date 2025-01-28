Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB8A20CBC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276E10E67D;
	Tue, 28 Jan 2025 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="lkRrFLJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9B710E67D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:16:13 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-467a37a2a53so62800591cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738077372; x=1738682172; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9asZltzPGSVkB8UT62aMxicpstwn5ZY78K38XF9efC4=;
 b=lkRrFLJxophhn9WoG57ARcl6kK4QnlzjaU2+mPVLY3Wesgyj5IMhKPedjeZ75Qe1DR
 KBWws4H86gsjU1MAEx+Z2QOi4li7ccd7V7yPt2BwyoPqCF7LM43aCt2VwMrL9VC8lDrJ
 l5U37sG+cu7lVVfimlCBb25sIGL/v18IQtbQHgurG+YkK0B3rgzITgcQeEOmxOY/MipM
 8L489Rt2OGEDF3je8Q+BV9pY60A3AW5J0GsamX/sDmQMRY5ZZzZB1HUoZbr8OqJiOnvW
 coRinMffAFW6LWbQjhDlhyebfga9YkYCdBuUcB5rbkORNOo8KjHdJB1wsC/XhG9cpuZ+
 mS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738077372; x=1738682172;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9asZltzPGSVkB8UT62aMxicpstwn5ZY78K38XF9efC4=;
 b=Govkabk9u6Hvei2p/ThCIJLKw6ATnyskPgkQcuFZWR2TzDQ8BInbYfRt+ZDjmw9nY5
 KsHkDIMrqbSpY+EpP1uyl0mX7CC+wybFGvYzOJ6+nMhUFlWZ96vl0XpdNNEMzTYmzfzv
 3qWPDAtY40THCFZFq54swRmK2gMIjcFdTfgpUe7zHBEzr6j3oApSvyxVReS1pfoemPEx
 oNlXh5npSly7ByWdJ7hcq5PQhuaedz6jXFkVWVeb8ifrSpAdz31SwGjaEJRh7q1ySrX5
 qPhqKus+g3eN/wL6uhmHH7rp8pPXvuVhCtnkgBT9KCRHigyFe56xzIUsFeoNuvpnOZcQ
 Owbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhmBYjBe0HOgvrLdP9hl18xWu17JiMAsu/h+80gVCDcNdL0I8K812tXlF5FSW0CmFj+nlolLXG09A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy62ctHSiQhSQ1RxdYjosZS4oyDFPMBlaRL6LOquhkVc4Orxtou
 nUEl+djH6YjoY2Uwcw5CB1zhlXWQ30EjkJO6EDjnJWijESDRZ1ps2pU3PfrM6Kk=
X-Gm-Gg: ASbGnctziIAX1NKK4ChzjAoHm3k16eer0B8a41rQ6RP1V7+paJBLnT0k2aUYKnrxbuo
 9DDlOcO6cyTU6sPLUQGgMma0Iyt3QYVWjZOy5SzV4t0k303SvXIeWpxslX6VMSlDw9DS/q/UG7O
 5dc0q1xQ9f7EdgUSnkXUh/TehHrTt2gHZ+D4FMFBtd5D+rF7gfyE4ptSLWl4NdYpFDKsE7tT47N
 pb7X2JYyvKGrxGclJJe+rODUkkt1Jag1m/+eTOlzXfxZE2SpPgkaou+fqeKvuNVnx3EB99gSSQS
 HHXDyfcQfP+v+mNypA7pR7T4tDsYN775TIXOdUv+DlgJeb2MinmwWvXnZJ4t+ICx
X-Google-Smtp-Source: AGHT+IGRdYaLk5GMFm39sxxEUnAoVN5fAg2yjnF65TF+ISHX+uAwVSwQhG2SfGCyK/fZcBn4SrAwBQ==
X-Received: by 2002:a05:622a:40f:b0:467:6833:e30c with SMTP id
 d75a77b69052e-46e12a8affdmr746561081cf.30.1738077372160; 
 Tue, 28 Jan 2025 07:16:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e6687dd65sm51648611cf.18.2025.01.28.07.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 07:16:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tcnJy-00000007czI-18wL;
 Tue, 28 Jan 2025 11:16:10 -0400
Date: Tue, 28 Jan 2025 11:16:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250128151610.GC1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
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

On Tue, Jan 28, 2025 at 03:48:54PM +0100, Thomas Hellström wrote:
> On Tue, 2025-01-28 at 09:20 -0400, Jason Gunthorpe wrote:
> > On Tue, Jan 28, 2025 at 09:51:52AM +0100, Thomas Hellström wrote:
> > 
> > > How would the pgmap device know whether P2P is actually possible
> > > without knowing the client device, (like calling
> > > pci_p2pdma_distance)
> > > and also if looking into access control, whether it is allowed?
> > 
> > The DMA API will do this, this happens after this patch is put on top
> > of Leon's DMA API patches. The mapping operation will fail and it
> > will
> > likely be fatal to whatever is going on.
> >  
> > get_dma_pfn_for_device() returns a new PFN, but that is not a DMA
> > mapped address, it is just a PFN that has another struct page under
> > it.
> > 
> > There is an implicit assumption here that P2P will work and we don't
> > need a 3rd case to handle non-working P2P..
> 
> OK. We will have the case where we want pfnmaps with driver-private
> fast interconnects to return "interconnect possible, don't migrate"
> whereas possibly other gpus and other devices would return
> "interconnect unsuitable, do migrate", so (as I understand it)
> something requiring a more flexible interface than this.

I'm not sure this doesn't handle that case?

Here we are talking about having DEVICE_PRIVATE struct page
mappings. On a GPU this should represent GPU local memory that is
non-coherent with the CPU, and not mapped into the CPU.

This series supports three case:

 1) pgmap->owner == range->dev_private_owner
    This is "driver private fast interconnect" in this case HMM should
    immediately return the page. The calling driver understands the
    private parts of the pgmap and computes the private interconnect
    address.

    This requires organizing your driver so that all private
    interconnect has the same pgmap->owner.

 2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
    The exporting driver has the option to return a P2P struct page
    that can be used for PCI P2P without any migration. In a PCI GPU
    context this means the GPU has mapped its local memory to a PCI
    address. The assumption is that P2P always works and so this
    address can be DMA'd from.

 3) Migrate back to CPU memory - then eveything works.

Is that not enough? Where do you want something different?

> > > but leaves any dma- mapping or pfn mangling to be done after the
> > > call to hmm_range_fault(), since hmm_range_fault() really only
> > > needs
> > > to know whether it has to migrate to system or not.
> > 
> > See above, this is already the case..
> 
> Well what I meant was at hmm_range_fault() time only consider whether
> to migrate or not. Afterwards at dma-mapping time you'd expose the
> alternative pfns that could be used for dma-mapping.

That sounds like you are talking about multipath, we are not really
ready to tackle general multipath yet at the DMA API level, IMHO.

If you are just talking about your private multi-path, then that is
already handled..

> We were actually looking at a solution where the pagemap implements
> something along
> 
> bool devmem_allowed(pagemap, client); //for hmm_range_fault
> 
> plus dma_map() and dma_unmap() methods.

This sounds like dmabuf philosophy, and I don't think we should go in
this direction. The hmm caller should always be responsible for dma
mapping and we need to improve the DMA API to make this work better,
not build side hacks like this.

You can read my feelings and reasoning on this topic within this huge thread:

https://lore.kernel.org/dri-devel/20250108132358.GP5556@nvidia.com/

> In this way you'd don't need to expose special p2p dma pages and the

Removing the "special p2p dma pages" has to be done by improving the
DMA API to understand how to map phsyical addresses without struct
page. We are working toward this, slowly.

pgmap->ops->dma_map/unmap() ideas just repeat the DMABUF mistake
of mis-using the DMA API for P2P cases. Today you cannot correctly DMA
map P2P memory without the struct page.

> interface could also handle driver-private interconnects, where
> dma_maps and dma_unmap() methods become trivial.

We already handle private interconnect.

> > > One benefit of using this alternative
> > > approach is that struct hmm_range can be subclassed by the caller
> > > and
> > > for example cache device pairs for which p2p is allowed.
> > 
> > If you want to directly address P2P non-uniformity I'd rather do it
> > directly in the core code than using a per-driver callback. Every
> > driver needs exactly the same logic for such a case.
> 
> Yeah, and that would look something like the above

No, it would look like the core HMM code calling pci distance on the
P2P page returned from get_dma_pfn_for_device() and if P2P was
impossible then proceed to option #3 fault to CPU.

> although initially we intended to keep these methods in drm
> allocator around its pagemaps, but could of course look into doing
> this directly in dev_pagemap ops.   But still would probably need
> some guidance into what's considered acceptable, and I don't think
> the solution proposed in this patch meets our needs.

I'm still not sure what you are actually trying to achieve?

Jason
