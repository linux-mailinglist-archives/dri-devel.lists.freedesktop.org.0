Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95BBD37944
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786210E908;
	Fri, 16 Jan 2026 17:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="V9LhYH/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B510E90B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:20:54 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-8907ec50855so31070666d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768584053; x=1769188853; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
 b=V9LhYH/conGHRNcYVgRh2X+90O+ZQXxVT78D/JovAZq2VfVpLsXVeexk5utLvqG/8C
 sNG9ieTKSrxwVlvpM1q17GqibBFuJ0ggJMpgkZEYcp+kcIlT5oVUg6OpzhqWfREf4v0B
 DrElO2TzIXLNta4ISNzorSWsNIHTEVMfGdh4JNLUr4dRjNkudz4EevjbvBzbhzn9AI1z
 f+FrCvwjdHFyPXfHzR2FHtf0sOv92VgZpRcDdyNRwSV2wDYKpDQr75j2KIoc3Etwy2hR
 ZHBPji2oMWjlJfNqSTefGNIbptv8hB8XkbWal1cmffB7+8OqsZ6ZVcolX1P6FZrWrOXg
 blhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768584053; x=1769188853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
 b=RMyCv+y9UYzOeSMewC+KnQ6rg8Q3FPA8b7vzDE6dmZIovR/pmVn1e97wmPCcJJZwXw
 0glQ7kAXGpZBeFY8YB52L3iunEG4C5aV/zL5t/bh8PbQ7qCXq5aQ7XfFG2ZEYrk075jS
 CNP0NSzfBac9LVLRbNibyAIuZCQpqcZQhR2iBapABSBhcG9uekA/79bXQjEgFO751Jc0
 mAMWbjYtX9QuUFvrJvAaq+j9sli1aPYe8zw3MDWRM591LLPIkuNiAw6tCqcgYZ8vizlR
 X3rmjhmb7OYCLa640pNBsvznYFP9/0q/xOLPSRvDFv/xkqKkzKz2AVLJf/Zux8NqjZ9O
 Khtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/ASoUUa4nOZdb/TGNrw3O12fYparsG6Q2VUoZVCrjL5NPqDo4r68ixKhj7gqn/Y+J/aKHCyRbun8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrdGtxGldjjx59NwTaYsk9VT6E1sFJ6dsSwsp6UC1DoMaUk9Zw
 HX1xT0LVHoueobB80NWW8S8gNvt3dF+tTf65FfWQJPbZPhjXqSPH+ZcysfU/OgIt4/o=
X-Gm-Gg: AY/fxX63F+AfKOZe3FHmstt4JrNOMwy1HX4x/OOVijWwQLl574mMBpt3hxpAhhOAuXw
 4r0rdsg6+sPKXkZrOFxLSBdkImFt7mhqlC1jiG0T0CsHzpiiKtXk+UBQBfRsVFQcQqKtBodRo0Q
 m0Y5CEGm4sgWK+ZaDy8DY05Z0WwL7Iab4FrEQsR053Zcphzh0C/lIay/tCJ1Bcg/eiQ5bKkBDnB
 DLQUdyurf3dxu85xsZi9Vo1kIiFLDEFnaVL7/Dycrtq3Rls37l/41+JnP6J9Xnfa0+Fi2n3Ons4
 GSXjjexA2NyW3c2SOZjAfeK5IPS0xxGOvuTbEoOPBQAhLJe7rEyzzvYZELElFDSwq8o+gERfrQi
 cEowcz2NQ6F8X227mb4RkRHHJRgd1wP1nTsGcgb+YypylVr68l3hy7bkhbybdzmCzKE2IjcE88s
 kVCUm4fVhZkiEK0xj02FuFR0cYQl8w2pp/RLdb4BlvSFv/asVfv/4Rc4Q/iRh55VqIxfE=
X-Received: by 2002:a05:6214:d08:b0:88a:529a:a543 with SMTP id
 6a1803df08f44-8942e543175mr46699756d6.69.1768584053510; 
 Fri, 16 Jan 2026 09:20:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6ad606sm26895826d6.33.2026.01.16.09.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 09:20:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vgnVE-00000004kb4-0KMs;
 Fri, 16 Jan 2026 13:20:52 -0400
Date: Fri, 16 Jan 2026 13:20:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260116172052.GC961572@ziepe.ca>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
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

On Fri, Jan 16, 2026 at 05:07:09PM +0100, Vlastimil Babka wrote:
> On 1/16/26 12:10, Francois Dugast wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..ac7be07e3361 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -477,10 +477,43 @@ void free_zone_device_folio(struct folio *folio)
> >  	}
> >  }
> >  
> > -void zone_device_page_init(struct page *page, unsigned int order)
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order)
> >  {
> > +	struct page *new_page = page;
> > +	unsigned int i;
> > +
> >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >  
> > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > +		struct folio *new_folio = (struct folio *)new_page;
> > +
> > +		/*
> > +		 * new_page could have been part of previous higher order folio
> > +		 * which encodes the order, in page + 1, in the flags bits. We
> > +		 * blindly clear bits which could have set my order field here,
> > +		 * including page head.
> > +		 */
> > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > +
> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +		/*
> > +		 * This pointer math looks odd, but new_page could have been
> > +		 * part of a previous higher order folio, which sets _nr_pages
> > +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> > +		 * correctly locate the _nr_pages bits within new_page which
> > +		 * could have modified by previous higher order folio.
> > +		 */
> > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > +#endif
> > +
> > +		new_folio->mapping = NULL;
> > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > +	}
> > +
> >  	/*
> >  	 * Drivers shouldn't be allocating pages after calling
> >  	 * memunmap_pages().
> 
> Can't say I'm a fan of this. It probably works now (so I'm not nacking) but
> seems rather fragile. It seems likely to me somebody will try to change some
> implementation detail in the page allocator and not notice it breaks this,
> for example. I hope we can eventually get to something more robust.

These pages shouldn't be in the buddy allocator at all? The driver
using the ZONE_DEVICE pages is responsible to provide its own
allocator.

Did you mean something else?

Jason
 
