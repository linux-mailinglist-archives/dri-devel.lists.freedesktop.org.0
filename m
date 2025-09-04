Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63710B42FC7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1167A10E2A1;
	Thu,  4 Sep 2025 02:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qvvxvw83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31F10E2A1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:34:04 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b00a9989633so97442666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756953242; x=1757558042; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aQRRO020tNw8VwUMsv/jB3s9ADW9yx/e6LLFdE70er8=;
 b=Qvvxvw83X5RPy5SH3IC8W+KM0ZvTQCOMghVkpKcsK5gzEvTU9KsTDCt3/ZIpexce62
 p/c7ePDafBt+VIfpynVoBwP447onYWNMFa1rSMCbM9Bag32OeUOZ5BXEH/HdfJhfskNh
 592XRMGpxh7Rt3NTohbN9k63q7dA17lTVhq3juM3Qy6tKH9/Ah4J6Uz6ixKIdDih5FVx
 faqOjzKyrIeBHuNIf1NARM/S1IHTB/fdAAffmPAMZbwIxHh7BmJrM3xDZk9nhx07EfAa
 Vzw8YPF/bkh1LGtXbYrQK61tpBMklrxxuskKq4UJ8A6GZVWVWNnKTilkEshrcIGN/vou
 2KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756953242; x=1757558042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQRRO020tNw8VwUMsv/jB3s9ADW9yx/e6LLFdE70er8=;
 b=gQP1P734IGaa7xwN5Uynen+wVbDMVHxX687C5WBBhdP8zY6F7Bd96icFqd1Ccbpe9L
 A4RxEB0064jjzoPvDnWsjYMONXLcRRZ0imYUMaUdAqn2h01Sf3PQ7BZL6MMtEqhoUQ8P
 z1a/MTQRbOga6UTDIok+zhETl+FlmOACqPCjefP3diTHELJACeAszFvpPUVI9u8Kw29L
 ApOcLl6feHxPAnXwL7ZWBL8ifRUtb4G3VSHzmczsPb/tYktwWSYpkHGaiaOZ4+da3G6x
 IE5w32RHAopSs0NOR9Zl5FE8DenXkNM3paDDFX3dRKBf1keDzbXyWW2vVgt0Oeo0NoVB
 8oEA==
X-Gm-Message-State: AOJu0YzTf028Czp5YyMmwvpkE700uf+5aAQKqIkqnYvp+5bjG9MAHLOK
 q3s+9rBdkDFt0NoCpr3+mNH+x4utjgQESqZJz2xUObXvkF2UmBRGuYj6iBiQBYVfFpU4LmcSM9t
 +yyAkopi1fDw68GLIIKzzaHEqvgs7kEELTw==
X-Gm-Gg: ASbGncvb7uNtrFOjBNB3GMKfr1nvMl8j7xR+mkC4L1mcE268dWnaltNJmDm+i7Y7ApH
 PkajjlXz/S6wDh/iZCv4lD8Wvmw0oRVXWY7wR3ZBze6oj3GmCu4wJZj0TOSN1pfBT5U2cMtgJkU
 EfTWafPozX9YhBCtSN6/VNx8E/9WyXZ+n/CsVAvgokFv3jr8NfUPD1cK3m8IZUxcLVAWHe41O6N
 PcCDQ==
X-Google-Smtp-Source: AGHT+IEHb2Ha8OeW69G4lllTzxlPf0KuWfyQgec8hGpD/++aDtHt12fSZRvB8E20PYTzyWawYzb6ijCl/H7kuUI0+Gc=
X-Received: by 2002:a17:907:a45:b0:afe:8bd8:e2c3 with SMTP id
 a640c23a62f3a-b01af2e0a2fmr2091641966b.0.1756953242235; Wed, 03 Sep 2025
 19:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-3-airlied@gmail.com>
 <28c94812-0bfb-45ec-bb44-c3dc6e85e5f3@lankhorst.se>
In-Reply-To: <28c94812-0bfb-45ec-bb44-c3dc6e85e5f3@lankhorst.se>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Sep 2025 12:33:50 +1000
X-Gm-Features: Ac12FXwfVKcqpyVo14ACfM5Z8x1ldkVHTFAQ4sh1Ry_9Q_jCXzxhPRK1f07efs0
Message-ID: <CAPM=9tzRf4XR1fOStxCOG3PzEhvM_iw8ptKX_4A5n7R8dHoi7g@mail.gmail.com>
Subject: Re: [PATCH 02/15] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v4)
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Sept 2025 at 21:10, Maarten Lankhorst <dev@lankhorst.se> wrote:
>
> Hey,
>
> Den 2025-09-02 kl. 06:06, skrev Dave Airlie:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This uses the newly introduced per-node gpu tracking stats,
> > to track GPU memory allocated via TTM and reclaimable memory in
> > the TTM page pools.
> >
> > These stats will be useful later for system information and
> > later when mem cgroups are integrated.
> >
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: linux-mm@kvack.org
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > ---
> > v2: add reclaim parameters and adjust the right counters.
> > v3: drop the nid helper and get it from page.
> > v4: use mod_lruvec_page_state (Shakeel)
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > index baf27c70a419..148c7530738d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -150,8 +150,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> >
> >       if (!pool->use_dma_alloc) {
> >               p = alloc_pages_node(pool->nid, gfp_flags, order);
> > -             if (p)
> > +             if (p) {
> >                       p->private = order;
> > +                     mod_lruvec_page_state(p, NR_GPU_ACTIVE, 1 << order);
> > +             }
> >               return p;
> >       }
> >
> > @@ -186,7 +188,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> >
> >  /* Reset the caching and pages of size 1 << order */
> >  static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> > -                            unsigned int order, struct page *p)
> > +                            unsigned int order, struct page *p, bool reclaim)
> >  {
> >       unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> >       struct ttm_pool_dma *dma;
> > @@ -201,6 +203,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> >  #endif
> >
> >       if (!pool || !pool->use_dma_alloc) {
> > +             mod_lruvec_page_state(p, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> > +                                   -(1 << order));
> >               __free_pages(p, order);
> >               return;
> >       }
> > @@ -288,6 +292,9 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> >       list_add(&p->lru, &pt->pages);
> >       spin_unlock(&pt->lock);
> >       atomic_long_add(1 << pt->order, &allocated_pages);
> > +
> > +     mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
> > +     mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
> >  }
> >
> >  /* Take pages from a specific pool_type, return NULL when nothing available */
> > @@ -299,6 +306,8 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
> >       p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
> >       if (p) {
> >               atomic_long_sub(1 << pt->order, &allocated_pages);
> > +             mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
> > +             mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
> >               list_del(&p->lru);
> >       }
> >       spin_unlock(&pt->lock);
> > @@ -331,7 +340,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
> >       spin_unlock(&shrinker_lock);
> >
> >       while ((p = ttm_pool_type_take(pt)))
> > -             ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > +             ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
> >  }
> >
> >  /* Return the pool_type to use for the given caching and order */
> > @@ -383,7 +392,7 @@ static unsigned int ttm_pool_shrink(void)
> >
> >       p = ttm_pool_type_take(pt);
> >       if (p) {
> > -             ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > +             ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
> >               num_pages = 1 << pt->order;
> >       } else {
> >               num_pages = 0;
> > @@ -475,7 +484,7 @@ static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool, struct page *page,
> >       if (pt)
> >               ttm_pool_type_give(pt, page);
> >       else
> > -             ttm_pool_free_page(pool, caching, order, page);
> > +             ttm_pool_free_page(pool, caching, order, page, false);
> >
> >       return nr;
> >  }
> > @@ -780,7 +789,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> >       return 0;
> >
> >  error_free_page:
> > -     ttm_pool_free_page(pool, page_caching, order, p);
> > +     ttm_pool_free_page(pool, page_caching, order, p, false);
> >
> >  error_free_all:
> >       if (tt->restore)
>
> Looking at the patch, there are 2 users of ttm_pool_free_page, one frees an active page (various error paths), the other during page reclaim at pool teardown and shrinking.
>
> So perhaps split into ttm_pool_free_active_page() and ttm_pool_reclaim_page()?

They would be 90% the same function though, with just hitting a
different mod page state path, and I also change this later to use the
cgroup mechanisms instead, so I'm not sure it would be effective.

Dave.

>
> Kind regards,
> ~Maarten Lankhorst
