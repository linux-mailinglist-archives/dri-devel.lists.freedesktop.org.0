Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288329A10DF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 19:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725D010E173;
	Wed, 16 Oct 2024 17:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="nY0VyJFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6710E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 17:44:48 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6cbcc2bd7fcso634036d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729100688; x=1729705488; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o35iiCDiZ5eaKfswFFD+TpBr1+3YZIM/Zzff16IB6bs=;
 b=nY0VyJFJ8TrHslWvb0c+KBlmsh5mWVRd8bgkOXs0ITTKxAk1TXo+4uVrvdGH6th7Jp
 VrOXRSTWg3I+tJC1u7eENfEeRlzJ2OLLvJeb1sSpxtsPWe7ZWF6LfaeGLy7V0hOG3yES
 uqZcVXQF3sWmAX4OCdAOp7Sa4HEw0yttTL4NUPeO/gdsIKtL50cAJicc2DhI5mbqmh00
 DoDpHXKPem5HeztAHcJJ5QXorGvpmyGihCXt5OH/aqrQqvEDCkOZ2ypPL/Eq3OdBl0x1
 nSCHCRlULT9RzBoCP89t5gsVr5fALrcAWKA2qBb0TxnNOo9AEhUhvg0oKH9h4OZcuBvH
 P0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729100688; x=1729705488;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o35iiCDiZ5eaKfswFFD+TpBr1+3YZIM/Zzff16IB6bs=;
 b=TLMVUMNpypm/RrC1OhZQ90n9lZLSRKCJ6E18nk3RJQGcNAMEADCQQxH0AN2QPuMhP7
 bIgQsLrZj3xvQ6eE3rDI/XXQfNcf38acPVsB9NY8v6x0L4wjmwMt9jkKpTGbmY2Hn10F
 k58ktS76FzfIOdggoMosFD0asToMW+dfOhvzPciQ8AEWEXuC6L5jIBrGPKyS8f7Znw3J
 V+IXjzD2ZKMQZaJe/mizaD7L3oIBsOEr08FhvGUaikTknIIRkO8YbS5NxnH+izFfwTmd
 5TJ03Q3cuer1GC6vLPpdEfmc93K8CwknurpzByBEV4FyaaATEeNK9spyNtXW/j+idtOu
 0bcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU7QGJD5VbKiG0ADj63eM+QOcHpyk5/pZFAMyC7dRvW+pldU1zI02hqSD8ci0nRTlBoY2uAoQGT9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNim1lIsVB9Kvuhy60aFbPfMGfILnUMAJkM0lEyH1AEkFnas1I
 BnevKJn9jRRzvxrSUG8RmgZ7QBgVDIST/obLsxEFQPwgskKTWbMC533aEoRLw+M=
X-Google-Smtp-Source: AGHT+IHcb2p/EJ+d36NHl0163jeyLVI0sDHNW9tlAjYiB2BbJs8req4vjOwcR9cJR+8TMnyYMuXpMQ==
X-Received: by 2002:a05:6214:5b06:b0:6cb:d1ae:27a6 with SMTP id
 6a1803df08f44-6cbf0095668mr259975216d6.24.1729100687504; 
 Wed, 16 Oct 2024 10:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc22961bbasm19822836d6.108.2024.10.16.10.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 10:44:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t184j-000h5k-5X;
 Wed, 16 Oct 2024 14:44:45 -0300
Date: Wed, 16 Oct 2024 14:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241016174445.GF4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw_sn_DdZRUw5oxq@infradead.org>
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

On Wed, Oct 16, 2024 at 09:41:03AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 16, 2024 at 12:44:28PM -0300, Jason Gunthorpe wrote:
> > > We are talking about P2P memory here.  How do you manage to get a page
> > > that dma_map_page can be used on?  All P2P memory needs to use the P2P
> > > aware dma_map_sg as the pages for P2P memory are just fake zone device
> > > pages.
> > 
> > FWIW, I've been expecting this series to be rebased on top of Leon's
> > new DMA API series so it doesn't have this issue..
> 
> That's not going to make a difference at this level.

I'm not sure what you are asking then.

Patch 2 does pci_p2pdma_add_resource() and so a valid struct page with
a P2P ZONE_DEVICE type exists, and that gets returned back to the
hmm/odp code.

Today odp calls dma_map_page() which only works by chance in limited
cases. With Leon's revision it will call hmm_dma_map_pfn() ->
dma_iova_link() which does call pci_p2pdma_map_type() and should do
the right thing.

> > I'm guessing they got their testing done so far on a system without an
> > iommu translation?
> 
> IOMMU or not doens't matter much for P2P.  The important difference is
> through the host bridge or through a switch.  dma_map_page will work
> for P2P through the host brige (assuming the host bridge even support
> it as it also lacks the error handling for when not), but it lacks the
> handling for P2P through a switch.

On most x86 systems the BAR/bus address of the P2P memory is the same
as the CPU address, so without an IOMMU translation dma_map_page()
will return the CPU/host physical address which is the same as the
BAR/bus address and that will take the P2P switch path for testing.

Jason
