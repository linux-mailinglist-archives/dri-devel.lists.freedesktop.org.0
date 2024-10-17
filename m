Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77119A2477
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F150A10E84C;
	Thu, 17 Oct 2024 14:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="PPXfdd50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E268410E1FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:05:09 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6cbe3e99680so5171176d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729173909; x=1729778709; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z7OJ+A0M+7sK83vQ9Fm7CrxVR6UTlfXfFle4pTLoIZk=;
 b=PPXfdd50gOT9eMrqNhB+Qck6SSQPoSjLYcr5CL0KG6O7gHCSnGH86ZSxLaMSinJ5nn
 YYvrS1pNvyGnhwtXrP+ucRYiCKH3YjAnm0cljYbCYuJj5nwX++nttOo66yBxmBHRQv7y
 Xhz0qhH3XhnMqwT4bzBsSrnzAExP59pG51zeyPzfjA5p4fWDEl+bIYDwWsOVBA2S7J4J
 mmWbSanlexdC33QDNXEvySHnaWtHi2Ca/gepRi0jAWhe06HibqII+u7JHnw4+PutVkqw
 WQNrSSmrZSunD2MOLyoCHtZqIHXNR75yvBOoQp6Jze6Tj//asPyvsUMG0vuoUxBkk7c7
 3Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729173909; x=1729778709;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7OJ+A0M+7sK83vQ9Fm7CrxVR6UTlfXfFle4pTLoIZk=;
 b=CNCyB2Vp09vetJow6JDGiASLwUcyVhAnCAfFe2yCUNTib5dpITEIrlgtdWxPFeC2YH
 o/FMOdA5M0v3IeanCWQcAnLdd5hdw0mkmsFysQ+96yzqoyGzU3lRfvqHZ0cZCTmDjOJy
 qvzplOOGRJsU0mAdpol7kaoDwR0nsiL7rZOhq8xuprp5k1iloeC0nk9gvUqcl35j6Nip
 E1vKzIXEcewJC1gqjpo3eMDKfRc22nvtsedCMXkCsuGPCiLuDr/um7w5qSFLNe7BK40l
 KVZoTa8yOotIHKDMXmbvSC5jd77votL1A1RxfAHodYLeQDaAkPfuaJvPDwGrFzWhxpOA
 b9Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFqdBLrxYKCnNFoU0csvkP1jG5yCWshbYqvD3OWbUq27Vs14s1Oqaaz7O1HsPKYWp7XQMEKob4M5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlEJmeTBPR2VN1IhCxWs8M4m1pW6SD5C/QWuctfYc5ocKpdBr1
 L3nNkmAeNhfWjBgw49KKR6wNCe3wweQstW28qkIQde40v7hbaFMj7ltiWXO+NXY=
X-Google-Smtp-Source: AGHT+IHal8p/zFk/MmJsuAonYG12bCKHBoHHm6lVzKtXA3QkUgZLBGuCRV/wmp+GJALXP2rbtY7uRw==
X-Received: by 2002:a05:6214:31a1:b0:6cb:c72d:6861 with SMTP id
 6a1803df08f44-6cc2b8cbc62mr89798966d6.14.1729173908808; 
 Thu, 17 Oct 2024 07:05:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc22921c60sm28522656d6.51.2024.10.17.07.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 07:05:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t1R7j-0041fS-QX;
 Thu, 17 Oct 2024 11:05:07 -0300
Date: Thu, 17 Oct 2024 11:05:07 -0300
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
Message-ID: <20241017140507.GB948948@ziepe.ca>
References: <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
 <20241016174445.GF4020792@ziepe.ca>
 <ZxD71D66qLI0qHpW@infradead.org> <20241017130539.GA897978@ziepe.ca>
 <ZxENV_EppCYIXfOW@infradead.org> <20241017134644.GA948948@ziepe.ca>
 <ZxEV6ocpKLjPC8H4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxEV6ocpKLjPC8H4@infradead.org>
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

On Thu, Oct 17, 2024 at 06:49:30AM -0700, Christoph Hellwig wrote:
> On Thu, Oct 17, 2024 at 10:46:44AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 17, 2024 at 06:12:55AM -0700, Christoph Hellwig wrote:
> > > On Thu, Oct 17, 2024 at 10:05:39AM -0300, Jason Gunthorpe wrote:
> > > > Broadly I think whatever flow NVMe uses for P2P will apply to ODP as
> > > > well.
> > > 
> > > ODP is a lot simpler than NVMe for P2P actually :(
> > 
> > What is your thinking there? I'm looking at the latest patches and I
> > would expect dma_iova_init() to accept a phys so it can call
> > pci_p2pdma_map_type() once for the whole transaction. It is a slow
> > operation.
> 
> You can't do it for the whole transaction.  Here is my suggestion
> for ODP:
> 
> http://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/dma-split-wip

OK, this looks very promising. I sketched something similar to the
pci-p2pdma changes a while back too.

BTW this:

  iommu: generalize the batched sync after map interface

I am hoping to in a direction of adding a gather to the map, just like
unmap. So eventually instead of open coding iotlb_sync_map() you'd
flush the gather and it would do it.

> For NVMe I need to figure out a way to split bios on a per P2P
> type boundary as we don't have any space to record if something is a bus
> mapped address.

Yeah this came up before :\ Can't precompute the p2p type during bio
creation, splitting based on pgmap would be good enough.

Jason
