Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC273B0A685
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A800410E9CD;
	Fri, 18 Jul 2025 14:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Kvz1qmlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65BD10E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:44:44 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4ab380b8851so19795311cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1752849884; x=1753454684; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/JlY6wrS7xoiZAd1n9VylKL/5klHKuhmeV2q/x+jhjE=;
 b=Kvz1qmlFXJcGhkj8n7dItecjsd+khBrg2A9Hr7a2msVtHgQps8+D1Pd3gV0S1Jp7Gs
 rgS+x1EEPqOHk7SbhuYuwmHLfsPa12/fnSWY50ORdHifDpOJxls+Na7RThFCutjXTu9W
 kf0+DzEJHPYksEIK67PYFDAAy63DK7dcjPxTk396330SSDNA2fdxBz2J7pSZdvxH9YEK
 ZF+3Pec2G+uwhNJUcm4YxYUBYcYOz0FWsmIisStP25i6IQ0m4A0K/vl5W+Qw70Li8l+9
 fbYXj5hqWkT3JAoFyqv2pnrbuFMTETHbDqX5cu2HwTIaN2sjO9hn2sRvXyv7fCjJyLeU
 W0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752849884; x=1753454684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JlY6wrS7xoiZAd1n9VylKL/5klHKuhmeV2q/x+jhjE=;
 b=Tc8Afprj5WQgOAsajloaj23BLxrc1qvQtA2ZtS0CZYUf4xRXO8xHmQxaoCgdCYiSCc
 BQAJeUy8CRb2KAXWbcQtGW7HdlyQNVqGMJ/qPNvigtCbSQQa1qo7WHz3WZriIGjCLNJJ
 ouG7vzU+/XoRlHeJlYjDMKZwIOzx3pn3krPMBWm+9Wx//RFEzxIoC+cHTB+WKE0zSrvM
 xk+irUfaOb4B0x9C8j7S+6C89Z9ZESN+jPxDRPNyMQpHpJCNR0Kfr5niC2r6L+Wfp/TX
 b/tlJtG6FfOWns3CM+JLgTxQ2txS700TKVQG4oW8ru6mwem/mXEwwIl6FeC76aE94UvE
 L3zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRFIYQOWsA/sYC94vezk7urTYjX9aq7eNQHXoRfT3HHAYTLICtq3orubyrXwDe8UTFqNaReIyfHrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxouqDnPjSQsznDf+RInQnMJaEeY1fQ8J8RXZBRUB+lnzVNpooa
 xtiKblUO6Pt4bqjRpz+HXKHoW4RxEnSPGDYs+qDxJ2zplK/F0btUMKgVjZInOfLYOt0=
X-Gm-Gg: ASbGncumcZXS9NYMf3DNkGopLFQQfvg3QruFah1wKgX3jcPUisDdTjseY0GPZduqkdw
 KVfO1bN0YmhRtLM77QLayosAHcc/fwF6//VP5Fq4DDcPug2N3vhvR9+8/1hCATPWzcWdeSxEGlw
 k08k119/wEeKcXRSK6y3jtF02PcqRgeGU7FJ22PlHUZeYvp7YlqyRHPpwrF03VVpvM9kIXk4R07
 XOCuFqIe9cG5Q2TaZgcLVMRm7Lp2Gdwq7oFwvzo9CMQO6oVYDyJHC0uvkhBZd3wo/kWuHzkyJhL
 +eCFgaiapEE2b4gHPo60p1/wS6AE5qINzWS+JXhITflQfBmg2HNozd8DpNqH1G0QFFQhmGWDTxo
 VpWPBZ9ZJJriIuPiTWhwZAoy+2SIC5EWvP64QU4G67lHtGxGpasKLtKIs+ME5LSpYvSBmdbneVE
 oyBbIOFfJm
X-Google-Smtp-Source: AGHT+IEYd5qGIZ9KDhfEstxE616f9xXLY8QoZsrjUpURE5IRjE2GiKRGVckhayOKGta9pjoTuDB7PQ==
X-Received: by 2002:a05:622a:1448:b0:4a9:cff3:68a2 with SMTP id
 d75a77b69052e-4ab93d88915mr157868681cf.37.1752849883674; 
 Fri, 18 Jul 2025 07:44:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7051b8c04fdsm8211446d6.15.2025.07.18.07.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:44:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1ucmKI-00000009zcK-2UVK;
 Fri, 18 Jul 2025 11:44:42 -0300
Date: Fri, 18 Jul 2025 11:44:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250718144442.GG2206214@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpXXKTaqp8FUhmq@casper.infradead.org>
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

On Fri, Jul 18, 2025 at 03:17:00PM +0100, Matthew Wilcox wrote:
> On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> > +++ b/include/linux/memremap.h
> > @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
> >  	 */
> >  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
> >  
> > +	/*
> > +	 * Used for private (un-addressable) device memory only. Return a
> > +	 * corresponding PFN for a page that can be mapped to device
> > +	 * (e.g using dma_map_page)
> > +	 */
> > +	int (*get_dma_pfn_for_device)(struct page *private_page,
> > +				      unsigned long *dma_pfn);
> 
> This makes no sense.  If a page is addressable then it has a PFN.
> If a page is not addressable then it doesn't have a PFN.

The DEVICE_PRIVATE pages have a PFN, but it is not usable for
anything.

This is effectively converting from a DEVICE_PRIVATE page to an actual
DMA'able address of some kind. The DEVICE_PRIVATE is just a non-usable
proxy, like a swap entry, for where the real data is sitting.

Jason

