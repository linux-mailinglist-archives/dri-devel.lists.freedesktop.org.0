Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7D9A22F6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 15:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F3210E81C;
	Thu, 17 Oct 2024 13:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="nSV39Jl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549E010E81A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 13:05:42 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6cbcc2bd7fcso5522316d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729170341; x=1729775141; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lk++0v4zwR7xUpep4iNg0I6MKOHA7nEjzuqiKjJzkok=;
 b=nSV39Jl3XnhUtZeVlTjVWSPentkawGZGzpbdnBtusByHTauei7eFZiV132d2FhBk5O
 OBMKA9Zf19u3aAfv3FSTZOIBh7NPOUy/pFw5pYsCFgOlzuJmI9bsaw6n0Z72trdRrngh
 4CnGRiJdf37H6SFEpg+tM/k5b1FC+tU15ndXK+Cnk4Cxpy6C5kzeybxIi640lmlxildV
 02iZ+1OhveKtMgrJdMNIGbO8xx3aufwK5zbX8z5V+YE6bITgzZEndhorGWn8jf8WNzka
 Y/G6dOf6s57ZpvNDk5iHax+xattGpKIaDo2l4ptWB7QOvEiKaMwqPOCOi0vX2dVcTGea
 MAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729170341; x=1729775141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lk++0v4zwR7xUpep4iNg0I6MKOHA7nEjzuqiKjJzkok=;
 b=laGK9lGIqhBBqPybr1GFZZhiL+CdPtXviWeX2LUaGkCoE5YXZGnsZuEpMZIdhWQodk
 bNbRkSzXB1jr9wyY5Wt/HDuYr9N7UG43jIjbT/n7kP9kmheQbX5UWAF4CLfDSp+mfC6o
 L1wfqKiDngODCKvLgWUTHwOXG/DjNVon08T9xWycfeL7L7ZdPw+bpB8UfV9J6HbfnO8G
 enMC4UJE5Ei1cp6UpYhgq1s11/GKw/R81Bx8Ukxh6/Xt2PQUl2IynQlt30RxMUlM4VRd
 aWVZ/CsT2pABDStmbZJqAh/Hn7X2Y8nBJoMn1yYF+qKJK3lYLdXBWEa7u5xTFsfi4UEQ
 4p6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4W8Op05aJqomVSXhRKhsLKrfMDJNRNvUasWJ9Q7j4W1svpFq0QDEyxqLIitkPe9fTsPLxo8GvLYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqISWeUm9MXBA292dJOdbZRAB2uSixG9qW+7uHtUAeo5PHco9F
 ZiXlogyesA4NWcYqdr0erfQ3e9ud2mmZXK9h6p4kaegMPc0OZIwstcfLMD6m/I0=
X-Google-Smtp-Source: AGHT+IG5n5S3zHSv/JX5s/LYaf+o3YrOaG8HklVpPKUbKJ/yS6kcQbfiEDJXO6iYDC0yAlGNuOhLug==
X-Received: by 2002:a05:6214:2b93:b0:6cb:d094:d1c4 with SMTP id
 6a1803df08f44-6cbf009b918mr251899446d6.30.1729170340973; 
 Thu, 17 Oct 2024 06:05:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc2290fa01sm27747076d6.24.2024.10.17.06.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:05:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t1QCB-003suE-SU;
 Thu, 17 Oct 2024 10:05:39 -0300
Date: Thu, 17 Oct 2024 10:05:39 -0300
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
Message-ID: <20241017130539.GA897978@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
 <20241016174445.GF4020792@ziepe.ca>
 <ZxD71D66qLI0qHpW@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxD71D66qLI0qHpW@infradead.org>
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

On Thu, Oct 17, 2024 at 04:58:12AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 16, 2024 at 02:44:45PM -0300, Jason Gunthorpe wrote:
> > > > FWIW, I've been expecting this series to be rebased on top of Leon's
> > > > new DMA API series so it doesn't have this issue..
> > > 
> > > That's not going to make a difference at this level.
> > 
> > I'm not sure what you are asking then.
> > 
> > Patch 2 does pci_p2pdma_add_resource() and so a valid struct page with
> > a P2P ZONE_DEVICE type exists, and that gets returned back to the
> > hmm/odp code.
> > 
> > Today odp calls dma_map_page() which only works by chance in limited
> > cases. With Leon's revision it will call hmm_dma_map_pfn() ->
> > dma_iova_link() which does call pci_p2pdma_map_type() and should do
> > the right thing.
> 
> Again none of this affects the code posted here.  It reshuffles the
> callers but has no direct affect on the patches posted here.

I didn't realize till last night that Leon's series did not have P2P
support.

What I'm trying to say is that this is a multi-series project.

A followup based on Leon's initial work will get the ODP DMA mapping
path able to support ZONE_DEVICE P2P pages.

Once that is done, this series sits on top. This series is only about
hmm and effectively allows hmm_range_fault() to return a ZONE_DEVICE
P2P page.

Yonatan should explain this better in the cover letter and mark it as
a RFC series.

So, I know we are still figuring out the P2P support on the DMA API
side, but my expectation for hmm is that hmm_range_fault() returing a
ZONE_DEVICE P2P page is going to be what we want.

> (and the current DMA series lacks P2P support, I'm trying to figure
> out how to properly handle it at the moment).

Yes, I see, I looked through those patches last night and there is a
gap there.

Broadly I think whatever flow NVMe uses for P2P will apply to ODP as
well.

Thanks,
Jason
