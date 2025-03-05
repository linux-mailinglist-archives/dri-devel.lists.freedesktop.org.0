Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1B0A4F50D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 04:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BBB10E707;
	Wed,  5 Mar 2025 03:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BTFcABtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F0210E6FB;
 Wed,  5 Mar 2025 03:01:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1174188566b.3; 
 Tue, 04 Mar 2025 19:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741143714; x=1741748514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBUzV9LzrnHUVAMk9HN+Z4sk5M9aGopscRCNrzV3RB8=;
 b=BTFcABtA6uhf71zpy5itOK2MDItYAe2ruTRLh5E6Jd5s/CkuKS+lLojnXZufpOtkTS
 X3+2L8Evs+1QRDs15V8oBDpp1+kEetLS7OpXDDdPEYdasMAmSPAJjJm3hmJ8EoLYMjwq
 DJjtBV31vTlRi9rHV66k12z6+hq7Nh5NCComCmMfOvNyn4l55f074AXulAwhtT9VBkgA
 gemFc3zk6YY/cYutg9hswUhQDmxZnrErPZjYr5V5VjZ6Xn8Pqc88oNfKd39sKBIAw8Ee
 +cjz+bCvFu7wMDXyFl7fSyBlXI+qCl0tW1r0ehrnzLnQA7GJbwlYvc/0x3WayQrcrImP
 AkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741143714; x=1741748514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBUzV9LzrnHUVAMk9HN+Z4sk5M9aGopscRCNrzV3RB8=;
 b=UeWP9yqpkfWteTst8r8mNlYh+E8kl7kZWMuowd2FBhC7UecAzb7pS3FVDifmHFJTTJ
 5AHbqYnuSwwDplzHUn62aJRgNH/+IKRm/iErAENWIPPCEehfE18fYC5KHZJ5MAq2FNAR
 Q0s4n5m4UvYExxaKwUOEge82bYA7S1TkOye0l5Ltf2kurm21mYZr9tByV1E7GmxbGgp8
 y6jCWMGtFnxcGxm2QdUmpKLFB/ItX59rui12TdUpEy8tR8p48aPIDobKBb4aALZgGP2A
 sIURqSGauEOTN7awZvl+b/G+sW4edMwegPaawu97dlBHctaHWJ9/cKGRcLuwVmkAJvGa
 zSbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVnlYfhr25DRekv4Qe+rPArza5+e2ROGVutZZf2hVYjyeX9O0g8gflfWakQbRNQyOumfzfqaCtbGg=@lists.freedesktop.org,
 AJvYcCXguM35K1JXSoCMNyrOBYAJ7WXYEsm46by+qHLREW32D7TCTY4Gze/LzDsVS1ez/Jyt9DxMoOhU36c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoLaKlOtwx0sFHTYUJs3vHVSqJirACe2+BPCsVI8tsWKhzKblD
 2O1kZZujgjnGQvgwiDBLazwx4RwUCGgdZXnXedgxadA9zOmjk6ONO0aVUKsYO9gGKfKG4Ia9JPM
 oXX1oqk8UR2X42L5XBw+BkrlMCjs=
X-Gm-Gg: ASbGnctvu/+7y4a79+J4BuPV6pX2QMUJunXlrD+dXHbVp/90Gd1mDqNyfsTfMZyS4r6
 hskAofQkvJKjc9c/DRdL/pjPxSHzYD7lFusSwqmv4xXrQzSXACCAlIzVTEfoagpJ13cpW5kC0Vm
 PfkAddv/sbwBddg4d38G584V+l
X-Google-Smtp-Source: AGHT+IHJvJtnHcv//qncEaaRfgyKHgPbmhdnMyA9IeW/a/ILCA20oRVh5wcHpmJDfzINuF2M/IkuGbrP+cyfOvlpys4=
X-Received: by 2002:a17:907:96a2:b0:abf:5e61:cde with SMTP id
 a640c23a62f3a-ac20da94240mr150175866b.46.1741143714234; Tue, 04 Mar 2025
 19:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-3-thomas.hellstrom@linux.intel.com>
 <57ec915f-f766-413e-9377-af37071f29d8@amd.com>
 <cdb50c7a4e721afd6cebfbf7cacab6cd8cd524c7.camel@linux.intel.com>
 <a57a92694883a2243def43ee1c9b803d02c8e1b3.camel@linux.intel.com>
In-Reply-To: <a57a92694883a2243def43ee1c9b803d02c8e1b3.camel@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 5 Mar 2025 13:01:42 +1000
X-Gm-Features: AQ5f1Jr62K_X3XVTgrsdVWDjqce1uzrxn-6dEpNKNaRjGZ8f6oirJ5IU5ImUtD4
Message-ID: <CAPM=9txN-FsAk=W_QbyYhUk9fWios5t-h5oL=ZrdTKoxKjWVWg@mail.gmail.com>
Subject: Re: RESEND Re: [PATCH v16 2/7] drm/ttm/pool, drm/ttm/tt: Provide a
 helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, 
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

I've looked over the two patches mentioned here, I think they have
seen enough time and we need to unblock,

Please add and merge them:
Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

On Tue, 25 Feb 2025 at 18:44, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi, Christian,
>
> Ping? I'd really want to get this in before -rc6
>
> Thanks,
> Thomas
>
>
>
> On Tue, 2025-02-18 at 16:40 +0100, Thomas Hellstr=C3=B6m wrote:
> > Hi, Christian,
> >
> > On Wed, 2025-02-05 at 15:02 +0100, Christian K=C3=B6nig wrote:
> > > Am 30.01.25 um 11:13 schrieb Thomas Hellstr=C3=B6m:
> > > > Provide a helper to shrink ttm_tt page-vectors on a per-page
> > > > basis. A ttm_backup backend could then in theory get away with
> > > > allocating a single temporary page for each struct ttm_tt.
> > > >
> > > > This is accomplished by splitting larger pages before trying to
> > > > back them up.
> > > >
> > > > In the future we could allow ttm_backup to handle backing up
> > > > large pages as well, but currently there's no benefit in
> > > > doing that, since the shmem backup backend would have to
> > > > split those anyway to avoid allocating too much temporary
> > > > memory, and if the backend instead inserts pages into the
> > > > swap-cache, those are split on reclaim by the core.
> > > >
> > > > Due to potential backup- and recover errors, allow partially
> > > > swapped
> > > > out struct ttm_tt's, although mark them as swapped out stopping
> > > > them
> > > > from being swapped out a second time. More details in the
> > > > ttm_pool.c
> > > > DOC section.
> > > >
> > > > v2:
> > > > - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> > > > - s/back_up/backup/
> > > > - Add a writeback parameter to the exported interface.
> > > > v8:
> > > > - Use a struct for flags for readability (Matt Brost)
> > > > - Address misc other review comments (Matt Brost)
> > > > v9:
> > > > - Update the kerneldoc for the ttm_tt::backup field.
> > > > v10:
> > > > - Rebase.
> > > > v13:
> > > > - Rebase on ttm_backup interface change. Update kerneldoc.
> > > > - Rebase and adjust ttm_tt_is_swapped().
> > > > v15:
> > > > - Rebase on ttm_backup return value change.
> > > > - Rebase on previous restructuring of ttm_pool_alloc()
> > > > - Rework the ttm_pool backup interface (Christian K=C3=B6nig)
> > > > - Remove cond_resched() (Christian K=C3=B6nig)
> > > > - Get rid of the need to allocate an intermediate page array
> > > >    when restoring a multi-order page (Christian K=C3=B6nig)
> > > > - Update documentation.
> > > >
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > >
> > > I've tried to wrap my head around all of this like twenty times in
> > > the
> > > last three month, but was always interrupted at some point.
> > >
> > > Feel free to add Acked-by: Christian Koenig
> > > <christian.koenig@amd.com>.
> > >
> > > Sorry,
> > > Christian.
> >
> > Thanks a lot for all reviewing and comments so far. There are two TTM
> > patches left in the series that don't have an ack by you:
> >
> > https://patchwork.freedesktop.org/patch/634715/?series=3D131815&rev=3D1=
7
> > and
> >
> > https://patchwork.freedesktop.org/patch/634716/?series=3D131815&rev=3D1=
7
> >
> > None of them particularly big considering the amount of doc text.
> >
> > It'd be great if those could have an ack as well so we could finally
> > merge this series.
> >
> > Thanks,
> > Thomas
> >
> >
> >
> >
> >
> >
> > >
> > > > ---
> > > >   drivers/gpu/drm/ttm/ttm_pool.c | 554
> > > > +++++++++++++++++++++++++++++----
> > > >   drivers/gpu/drm/ttm/ttm_tt.c   |  54 ++++
> > > >   include/drm/ttm/ttm_pool.h     |   8 +
> > > >   include/drm/ttm/ttm_tt.h       |  67 +++-
> > > >   4 files changed, 629 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > index c9eba76d5143..ffb7abf52bab 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > @@ -41,6 +41,7 @@
> > > >   #include <asm/set_memory.h>
> > > >   #endif
> > > >
> > > > +#include <drm/ttm/ttm_backup.h>
> > > >   #include <drm/ttm/ttm_pool.h>
> > > >   #include <drm/ttm/ttm_tt.h>
> > > >   #include <drm/ttm/ttm_bo.h>
> > > > @@ -75,6 +76,35 @@ struct ttm_pool_alloc_state {
> > > >           enum ttm_caching tt_caching;
> > > >   };
> > > >
> > > > +/**
> > > > + * struct ttm_pool_tt_restore - State representing restore from
> > > > backup
> > > > + * @pool: The pool used for page allocation while restoring.
> > > > + * @snapshot_alloc: A snapshot of the most recent struct
> > > > ttm_pool_alloc_state.
> > > > + * @alloced_page: Pointer to the page most recently allocated
> > > > from
> > > > a pool or system.
> > > > + * @first_dma: The dma address corresponding to @alloced_page if
> > > > dma_mapping
> > > > + * is requested.
> > > > + * @alloced_pages: The number of allocated pages present in the
> > > > struct ttm_tt
> > > > + * page vector from this restore session.
> > > > + * @restored_pages: The number of 4K pages restored for
> > > > @alloced_page (which
> > > > + * is typically a multi-order page).
> > > > + * @page_caching: The struct ttm_tt requested caching
> > > > + * @order: The order of @alloced_page.
> > > > + *
> > > > + * Recovery from backup might fail when we've recovered less
> > > > than
> > > > the
> > > > + * full ttm_tt. In order not to loose any data (yet), keep
> > > > information
> > > > + * around that allows us to restart a failed ttm backup
> > > > recovery.
> > > > + */
> > > > +struct ttm_pool_tt_restore {
> > > > + struct ttm_pool *pool;
> > > > + struct ttm_pool_alloc_state snapshot_alloc;
> > > > + struct page *alloced_page;
> > > > + dma_addr_t first_dma;
> > > > + pgoff_t alloced_pages;
> > > > + pgoff_t restored_pages;
> > > > + enum ttm_caching page_caching;
> > > > + unsigned int order;
> > > > +};
> > > > +
> > > >   static unsigned long page_pool_size;
> > > >
> > > >   MODULE_PARM_DESC(page_pool_size, "Number of pages in the
> > > > WC/UC/DMA pool");
> > > > @@ -199,12 +229,11 @@ static int ttm_pool_apply_caching(struct
> > > > ttm_pool_alloc_state *alloc)
> > > >           return 0;
> > > >   }
> > > >
> > > > -/* Map pages of 1 << order size and fill the DMA address array
> > > > */
> > > > +/* DMA Map pages of 1 << order size and return the resulting
> > > > dma_address. */
> > > >   static int ttm_pool_map(struct ttm_pool *pool, unsigned int
> > > > order,
> > > > -                 struct page *p, dma_addr_t **dma_addr)
> > > > +                 struct page *p, dma_addr_t *dma_addr)
> > > >   {
> > > >           dma_addr_t addr;
> > > > - unsigned int i;
> > > >
> > > >           if (pool->use_dma_alloc) {
> > > >                   struct ttm_pool_dma *dma =3D (void *)p->private;
> > > > @@ -218,10 +247,7 @@ static int ttm_pool_map(struct ttm_pool
> > > > *pool,
> > > > unsigned int order,
> > > >                           return -EFAULT;
> > > >           }
> > > >
> > > > - for (i =3D 1 << order; i ; --i) {
> > > > -         *(*dma_addr)++ =3D addr;
> > > > -         addr +=3D PAGE_SIZE;
> > > > - }
> > > > + *dma_addr =3D addr;
> > > >
> > > >           return 0;
> > > >   }
> > > > @@ -371,6 +397,190 @@ static unsigned int
> > > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > > >           return p->private;
> > > >   }
> > > >
> > > > +/*
> > > > + * Split larger pages so that we can free each PAGE_SIZE page as
> > > > soon
> > > > + * as it has been backed up, in order to avoid memory pressure
> > > > during
> > > > + * reclaim.
> > > > + */
> > > > +static void ttm_pool_split_for_swap(struct ttm_pool *pool,
> > > > struct
> > > > page *p)
> > > > +{
> > > > + unsigned int order =3D ttm_pool_page_order(pool, p);
> > > > + pgoff_t nr;
> > > > +
> > > > + if (!order)
> > > > +         return;
> > > > +
> > > > + split_page(p, order);
> > > > + nr =3D 1UL << order;
> > > > + while (nr--)
> > > > +         (p++)->private =3D 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * DOC: Partial backup and restoration of a struct ttm_tt.
> > > > + *
> > > > + * Swapout using ttm_backup_backup_page() and swapin using
> > > > + * ttm_backup_copy_page() may fail.
> > > > + * The former most likely due to lack of swap-space or memory,
> > > > the
> > > > latter due
> > > > + * to lack of memory or because of signal interruption during
> > > > waits.
> > > > + *
> > > > + * Backup failure is easily handled by using a ttm_tt pages
> > > > vector
> > > > that holds
> > > > + * both backup handles and page pointers. This has to be taken
> > > > into account when
> > > > + * restoring such a ttm_tt from backup, and when freeing it
> > > > while
> > > > backed up.
> > > > + * When restoring, for simplicity, new pages are actually
> > > > allocated from the
> > > > + * pool and the contents of any old pages are copied in and then
> > > > the old pages
> > > > + * are released.
> > > > + *
> > > > + * For restoration failures, the struct ttm_pool_tt_restore
> > > > holds
> > > > sufficient state
> > > > + * to be able to resume an interrupted restore, and that
> > > > structure
> > > > is freed once
> > > > + * the restoration is complete. If the struct ttm_tt is
> > > > destroyed
> > > > while there
> > > > + * is a valid struct ttm_pool_tt_restore attached, that is also
> > > > properly taken
> > > > + * care of.
> > > > + */
> > > > +
> > > > +/* Is restore ongoing for the currently allocated page? */
> > > > +static bool ttm_pool_restore_valid(const struct
> > > > ttm_pool_tt_restore *restore)
> > > > +{
> > > > + return restore && restore->restored_pages < (1 <<
> > > > restore-
> > > > > order);
> > > > +}
> > > > +
> > > > +/* DMA unmap and free a multi-order page, either to the relevant
> > > > pool or to system. */
> > > > +static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool,
> > > > struct page *page,
> > > > +                                const dma_addr_t
> > > > *dma_addr,
> > > > enum ttm_caching caching)
> > > > +{
> > > > + struct ttm_pool_type *pt =3D NULL;
> > > > + unsigned int order;
> > > > + pgoff_t nr;
> > > > +
> > > > + if (pool) {
> > > > +         order =3D ttm_pool_page_order(pool, page);
> > > > +         nr =3D (1UL << order);
> > > > +         if (dma_addr)
> > > > +                 ttm_pool_unmap(pool, *dma_addr, nr);
> > > > +
> > > > +         pt =3D ttm_pool_select_type(pool, caching, order);
> > > > + } else {
> > > > +         order =3D page->private;
> > > > +         nr =3D (1UL << order);
> > > > + }
> > > > +
> > > > + if (pt)
> > > > +         ttm_pool_type_give(pt, page);
> > > > + else
> > > > +         ttm_pool_free_page(pool, caching, order, page);
> > > > +
> > > > + return nr;
> > > > +}
> > > > +
> > > > +/* Populate the page-array using the most recent allocated
> > > > multi-
> > > > order page. */
> > > > +static void ttm_pool_allocated_page_commit(struct page
> > > > *allocated,
> > > > +                                    dma_addr_t first_dma,
> > > > +                                    struct
> > > > ttm_pool_alloc_state *alloc,
> > > > +                                    pgoff_t nr)
> > > > +{
> > > > + pgoff_t i;
> > > > +
> > > > + for (i =3D 0; i < nr; ++i)
> > > > +         *alloc->pages++ =3D allocated++;
> > > > +
> > > > + alloc->remaining_pages -=3D nr;
> > > > +
> > > > + if (!alloc->dma_addr)
> > > > +         return;
> > > > +
> > > > + for (i =3D 0; i < nr; ++i) {
> > > > +         *alloc->dma_addr++ =3D first_dma;
> > > > +         first_dma +=3D PAGE_SIZE;
> > > > + }
> > > > +}
> > > > +
> > > > +/*
> > > > + * When restoring, restore backed-up content to the newly
> > > > allocated page and
> > > > + * if successful, populate the page-table and dma-address
> > > > arrays.
> > > > + */
> > > > +static int ttm_pool_restore_commit(struct ttm_pool_tt_restore
> > > > *restore,
> > > > +                            struct ttm_backup *backup,
> > > > +                            const struct
> > > > ttm_operation_ctx
> > > > *ctx,
> > > > +                            struct ttm_pool_alloc_state
> > > > *alloc)
> > > > +
> > > > +{
> > > > + pgoff_t i, nr =3D 1UL << restore->order;
> > > > + struct page **first_page =3D alloc->pages;
> > > > + struct page *p;
> > > > + int ret =3D 0;
> > > > +
> > > > + for (i =3D restore->restored_pages; i < nr; ++i) {
> > > > +         p =3D first_page[i];
> > > > +         if (ttm_backup_page_ptr_is_handle(p)) {
> > > > +                 unsigned long handle =3D
> > > > ttm_backup_page_ptr_to_handle(p);
> > > > +
> > > > +                 if (handle =3D=3D 0) {
> > > > +                         restore->restored_pages++;
> > > > +                         continue;
> > > > +                 }
> > > > +
> > > > +                 ret =3D ttm_backup_copy_page(backup,
> > > > restore->alloced_page + i,
> > > > +                                            handle, ctx-
> > > > > interruptible);
> > > > +                 if (ret)
> > > > +                         break;
> > > > +
> > > > +                 ttm_backup_drop(backup, handle);
> > > > +         } else if (p) {
> > > > +                 /*
> > > > +                  * We could probably avoid splitting the
> > > > old page
> > > > +                  * using clever logic, but ATM we don't
> > > > care, as
> > > > +                  * we prioritize releasing memory ASAP.
> > > > Note that
> > > > +                  * here, the old retained page is always
> > > > write-back
> > > > +                  * cached.
> > > > +                  */
> > > > +                 ttm_pool_split_for_swap(restore->pool,
> > > > p);
> > > > +                 copy_highpage(restore->alloced_page + i,
> > > > p);
> > > > +                 __free_pages(p, 0);
> > > > +         }
> > > > +
> > > > +         restore->restored_pages++;
> > > > +         first_page[i] =3D
> > > > ttm_backup_handle_to_page_ptr(0);
> > > > + }
> > > > +
> > > > + if (ret) {
> > > > +         if (!restore->restored_pages) {
> > > > +                 dma_addr_t *dma_addr =3D alloc->dma_addr ?
> > > > &restore->first_dma : NULL;
> > > > +
> > > > +                 ttm_pool_unmap_and_free(restore->pool,
> > > > restore->alloced_page,
> > > > +                                         dma_addr,
> > > > restore-
> > > > > page_caching);
> > > > +                 restore->restored_pages =3D nr;
> > > > +         }
> > > > +         return ret;
> > > > + }
> > > > +
> > > > + ttm_pool_allocated_page_commit(restore->alloced_page,
> > > > restore->first_dma,
> > > > +                                alloc, nr);
> > > > + if (restore->page_caching =3D=3D alloc->tt_caching ||
> > > > PageHighMem(restore->alloced_page))
> > > > +         alloc->caching_divide =3D alloc->pages;
> > > > + restore->snapshot_alloc =3D *alloc;
> > > > + restore->alloced_pages +=3D nr;
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +/* If restoring, save information needed for
> > > > ttm_pool_restore_commit(). */
> > > > +static void
> > > > +ttm_pool_page_allocated_restore(struct ttm_pool *pool, unsigned
> > > > int order,
> > > > +                         struct page *p,
> > > > +                         enum ttm_caching page_caching,
> > > > +                         dma_addr_t first_dma,
> > > > +                         struct ttm_pool_tt_restore
> > > > *restore,
> > > > +                         const struct
> > > > ttm_pool_alloc_state
> > > > *alloc)
> > > > +{
> > > > + restore->pool =3D pool;
> > > > + restore->order =3D order;
> > > > + restore->restored_pages =3D 0;
> > > > + restore->page_caching =3D page_caching;
> > > > + restore->first_dma =3D first_dma;
> > > > + restore->alloced_page =3D p;
> > > > + restore->snapshot_alloc =3D *alloc;
> > > > +}
> > > > +
> > > >   /*
> > > >    * Called when we got a page, either from a pool or newly
> > > > allocated.
> > > >    * if needed, dma map the page and populate the dma address
> > > > array.
> > > > @@ -380,10 +590,11 @@ static unsigned int
> > > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > > >    */
> > > >   static int ttm_pool_page_allocated(struct ttm_pool *pool,
> > > > unsigned int order,
> > > >                                      struct page *p, enum
> > > > ttm_caching page_caching,
> > > > -                            struct ttm_pool_alloc_state
> > > > *alloc)
> > > > +                            struct ttm_pool_alloc_state
> > > > *alloc,
> > > > +                            struct ttm_pool_tt_restore
> > > > *restore)
> > > >   {
> > > > - pgoff_t i, nr =3D 1UL << order;
> > > >           bool caching_consistent;
> > > > + dma_addr_t first_dma;
> > > >           int r =3D 0;
> > > >
> > > >           caching_consistent =3D (page_caching =3D=3D alloc->tt_cac=
hing)
> > > > > > PageHighMem(p);
> > > > @@ -395,17 +606,20 @@ static int ttm_pool_page_allocated(struct
> > > > ttm_pool *pool, unsigned int order,
> > > >           }
> > > >
> > > >           if (alloc->dma_addr) {
> > > > -         r =3D ttm_pool_map(pool, order, p, &alloc-
> > > > > dma_addr);
> > > > +         r =3D ttm_pool_map(pool, order, p, &first_dma);
> > > >                   if (r)
> > > >                           return r;
> > > >           }
> > > >
> > > > - alloc->remaining_pages -=3D nr;
> > > > - for (i =3D 0; i < nr; ++i)
> > > > -         *alloc->pages++ =3D p++;
> > > > + if (restore) {
> > > > +         ttm_pool_page_allocated_restore(pool, order, p,
> > > > page_caching,
> > > > +                                         first_dma,
> > > > restore, alloc);
> > > > + } else {
> > > > +         ttm_pool_allocated_page_commit(p, first_dma,
> > > > alloc, 1UL << order);
> > > >
> > > > - if (caching_consistent)
> > > > -         alloc->caching_divide =3D alloc->pages;
> > > > +         if (caching_consistent)
> > > > +                 alloc->caching_divide =3D alloc->pages;
> > > > + }
> > > >
> > > >           return 0;
> > > >   }
> > > > @@ -428,22 +642,24 @@ static void ttm_pool_free_range(struct
> > > > ttm_pool *pool, struct ttm_tt *tt,
> > > >                                   pgoff_t start_page, pgoff_t
> > > > end_page)
> > > >   {
> > > >           struct page **pages =3D &tt->pages[start_page];
> > > > - unsigned int order;
> > > > + struct ttm_backup *backup =3D tt->backup;
> > > >           pgoff_t i, nr;
> > > >
> > > >           for (i =3D start_page; i < end_page; i +=3D nr, pages +=
=3D nr)
> > > > {
> > > > -         struct ttm_pool_type *pt =3D NULL;
> > > > +         struct page *p =3D *pages;
> > > >
> > > > -         order =3D ttm_pool_page_order(pool, *pages);
> > > > -         nr =3D (1UL << order);
> > > > -         if (tt->dma_address)
> > > > -                 ttm_pool_unmap(pool, tt->dma_address[i],
> > > > nr);
> > > > +         nr =3D 1;
> > > > +         if (ttm_backup_page_ptr_is_handle(p)) {
> > > > +                 unsigned long handle =3D
> > > > ttm_backup_page_ptr_to_handle(p);
> > > >
> > > > -         pt =3D ttm_pool_select_type(pool, caching, order);
> > > > -         if (pt)
> > > > -                 ttm_pool_type_give(pt, *pages);
> > > > -         else
> > > > -                 ttm_pool_free_page(pool, caching, order,
> > > > *pages);
> > > > +                 if (handle !=3D 0)
> > > > +                         ttm_backup_drop(backup, handle);
> > > > +         } else if (p) {
> > > > +                 dma_addr_t *dma_addr =3D tt->dma_address ?
> > > > +                         tt->dma_address + i : NULL;
> > > > +
> > > > +                 nr =3D ttm_pool_unmap_and_free(pool, p,
> > > > dma_addr, caching);
> > > > +         }
> > > >           }
> > > >   }
> > > >
> > > > @@ -467,22 +683,11 @@ static unsigned int
> > > > ttm_pool_alloc_find_order(unsigned int highest,
> > > >           return min_t(unsigned int, highest, __fls(alloc-
> > > > > remaining_pages));
> > > >   }
> > > >
> > > > -/**
> > > > - * ttm_pool_alloc - Fill a ttm_tt object
> > > > - *
> > > > - * @pool: ttm_pool to use
> > > > - * @tt: ttm_tt object to fill
> > > > - * @ctx: operation context
> > > > - *
> > > > - * Fill the ttm_tt object with pages and also make sure to DMA
> > > > map
> > > > them when
> > > > - * necessary.
> > > > - *
> > > > - * Returns: 0 on successe, negative error code otherwise.
> > > > - */
> > > > -int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> > > > -            struct ttm_operation_ctx *ctx)
> > > > +static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt
> > > > *tt,
> > > > +                     const struct ttm_operation_ctx *ctx,
> > > > +                     struct ttm_pool_alloc_state *alloc,
> > > > +                     struct ttm_pool_tt_restore *restore)
> > > >   {
> > > > - struct ttm_pool_alloc_state alloc;
> > > >           enum ttm_caching page_caching;
> > > >           gfp_t gfp_flags =3D GFP_USER;
> > > >           pgoff_t caching_divide;
> > > > @@ -491,10 +696,8 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > > struct ttm_tt *tt,
> > > >           struct page *p;
> > > >           int r;
> > > >
> > > > - ttm_pool_alloc_state_init(tt, &alloc);
> > > > -
> > > > - WARN_ON(!alloc.remaining_pages ||
> > > > ttm_tt_is_populated(tt));
> > > > - WARN_ON(alloc.dma_addr && !pool->dev);
> > > > + WARN_ON(!alloc->remaining_pages ||
> > > > ttm_tt_is_populated(tt));
> > > > + WARN_ON(alloc->dma_addr && !pool->dev);
> > > >
> > > >           if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
> > > >                   gfp_flags |=3D __GFP_ZERO;
> > > > @@ -509,9 +712,9 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > > struct ttm_tt *tt,
> > > >
> > > >           page_caching =3D tt->caching;
> > > >           allow_pools =3D true;
> > > > - for (order =3D ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
> > > > &alloc);
> > > > -      alloc.remaining_pages;
> > > > -      order =3D ttm_pool_alloc_find_order(order, &alloc)) {
> > > > + for (order =3D ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
> > > > alloc);
> > > > +      alloc->remaining_pages;
> > > > +      order =3D ttm_pool_alloc_find_order(order, alloc)) {
> > > >                   struct ttm_pool_type *pt;
> > > >
> > > >                   /* First, try to allocate a page from a pool if
> > > > one exists. */
> > > > @@ -541,30 +744,120 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > > struct ttm_tt *tt,
> > > >                           r =3D -ENOMEM;
> > > >                           goto error_free_all;
> > > >                   }
> > > > -         r =3D ttm_pool_page_allocated(pool, order, p,
> > > > page_caching, &alloc);
> > > > +         r =3D ttm_pool_page_allocated(pool, order, p,
> > > > page_caching, alloc,
> > > > +                                     restore);
> > > >                   if (r)
> > > >                           goto error_free_page;
> > > > +
> > > > +         if (ttm_pool_restore_valid(restore)) {
> > > > +                 r =3D ttm_pool_restore_commit(restore, tt-
> > > > > backup, ctx, alloc);
> > > > +                 if (r)
> > > > +                         goto error_free_all;
> > > > +         }
> > > >           }
> > > >
> > > > - r =3D ttm_pool_apply_caching(&alloc);
> > > > + r =3D ttm_pool_apply_caching(alloc);
> > > >           if (r)
> > > >                   goto error_free_all;
> > > >
> > > > + kfree(tt->restore);
> > > > + tt->restore =3D NULL;
> > > > +
> > > >           return 0;
> > > >
> > > >   error_free_page:
> > > >           ttm_pool_free_page(pool, page_caching, order, p);
> > > >
> > > >   error_free_all:
> > > > - caching_divide =3D alloc.caching_divide - tt->pages;
> > > > + if (tt->restore)
> > > > +         return r;
> > > > +
> > > > + caching_divide =3D alloc->caching_divide - tt->pages;
> > > >           ttm_pool_free_range(pool, tt, tt->caching, 0,
> > > > caching_divide);
> > > >           ttm_pool_free_range(pool, tt, ttm_cached,
> > > > caching_divide,
> > > > -                     tt->num_pages -
> > > > alloc.remaining_pages);
> > > > +                     tt->num_pages - alloc-
> > > > > remaining_pages);
> > > >
> > > >           return r;
> > > >   }
> > > > +
> > > > +/**
> > > > + * ttm_pool_alloc - Fill a ttm_tt object
> > > > + *
> > > > + * @pool: ttm_pool to use
> > > > + * @tt: ttm_tt object to fill
> > > > + * @ctx: operation context
> > > > + *
> > > > + * Fill the ttm_tt object with pages and also make sure to DMA
> > > > map
> > > > them when
> > > > + * necessary.
> > > > + *
> > > > + * Returns: 0 on successe, negative error code otherwise.
> > > > + */
> > > > +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> > > > +            struct ttm_operation_ctx *ctx)
> > > > +{
> > > > + struct ttm_pool_alloc_state alloc;
> > > > +
> > > > + if (WARN_ON(ttm_tt_is_backed_up(tt)))
> > > > +         return -EINVAL;
> > > > +
> > > > + ttm_pool_alloc_state_init(tt, &alloc);
> > > > +
> > > > + return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
> > > > +}
> > > >   EXPORT_SYMBOL(ttm_pool_alloc);
> > > >
> > > > +/**
> > > > + * ttm_pool_restore_and_alloc - Fill a ttm_tt, restoring
> > > > previously backed-up
> > > > + * content.
> > > > + *
> > > > + * @pool: ttm_pool to use
> > > > + * @tt: ttm_tt object to fill
> > > > + * @ctx: operation context
> > > > + *
> > > > + * Fill the ttm_tt object with pages and also make sure to DMA
> > > > map
> > > > them when
> > > > + * necessary. Read in backed-up content.
> > > > + *
> > > > + * Returns: 0 on successe, negative error code otherwise.
> > > > + */
> > > > +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
> > > > ttm_tt *tt,
> > > > +                        const struct ttm_operation_ctx
> > > > *ctx)
> > > > +{
> > > > + struct ttm_pool_alloc_state alloc;
> > > > +
> > > > + if (WARN_ON(!ttm_tt_is_backed_up(tt)))
> > > > +         return -EINVAL;
> > > > +
> > > > + if (!tt->restore) {
> > > > +         gfp_t gfp =3D GFP_KERNEL | __GFP_NOWARN;
> > > > +
> > > > +         ttm_pool_alloc_state_init(tt, &alloc);
> > > > +         if (ctx->gfp_retry_mayfail)
> > > > +                 gfp |=3D __GFP_RETRY_MAYFAIL;
> > > > +
> > > > +         tt->restore =3D kzalloc(sizeof(*tt->restore),
> > > > gfp);
> > > > +         if (!tt->restore)
> > > > +                 return -ENOMEM;
> > > > +
> > > > +         tt->restore->snapshot_alloc =3D alloc;
> > > > +         tt->restore->pool =3D pool;
> > > > +         tt->restore->restored_pages =3D 1;
> > > > + } else {
> > > > +         struct ttm_pool_tt_restore *restore =3D tt-
> > > > >restore;
> > > > +         int ret;
> > > > +
> > > > +         alloc =3D restore->snapshot_alloc;
> > > > +         if (ttm_pool_restore_valid(tt->restore)) {
> > > > +                 ret =3D ttm_pool_restore_commit(restore,
> > > > tt-
> > > > > backup, ctx, &alloc);
> > > > +                 if (ret)
> > > > +                         return ret;
> > > > +         }
> > > > +         if (!alloc.remaining_pages)
> > > > +                 return 0;
> > > > + }
> > > > +
> > > > + return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt-
> > > > > restore);
> > > > +}
> > > > +
> > > >   /**
> > > >    * ttm_pool_free - Free the backing pages from a ttm_tt object
> > > >    *
> > > > @@ -582,6 +875,163 @@ void ttm_pool_free(struct ttm_pool *pool,
> > > > struct ttm_tt *tt)
> > > >   }
> > > >   EXPORT_SYMBOL(ttm_pool_free);
> > > >
> > > > +/**
> > > > + * ttm_pool_drop_backed_up() - Release content of a swapped-out
> > > > struct ttm_tt
> > > > + * @tt: The struct ttm_tt.
> > > > + *
> > > > + * Release handles with associated content or any remaining
> > > > pages
> > > > of
> > > > + * a backed-up struct ttm_tt.
> > > > + */
> > > > +void ttm_pool_drop_backed_up(struct ttm_tt *tt)
> > > > +{
> > > > + struct ttm_pool_tt_restore *restore;
> > > > + pgoff_t start_page =3D 0;
> > > > +
> > > > + WARN_ON(!ttm_tt_is_backed_up(tt));
> > > > +
> > > > + restore =3D tt->restore;
> > > > +
> > > > + /*
> > > > +  * Unmap and free any uncommitted restore page.
> > > > +  * any tt page-array backup entries already read back
> > > > has
> > > > +  * been cleared already
> > > > +  */
> > > > + if (ttm_pool_restore_valid(restore)) {
> > > > +         dma_addr_t *dma_addr =3D tt->dma_address ?
> > > > &restore-
> > > > > first_dma : NULL;
> > > > +
> > > > +         ttm_pool_unmap_and_free(restore->pool, restore-
> > > > > alloced_page,
> > > > +                                 dma_addr, restore-
> > > > > page_caching);
> > > > +         restore->restored_pages =3D 1UL << restore->order;
> > > > + }
> > > > +
> > > > + /*
> > > > +  * If a restore is ongoing, part of the tt pages may
> > > > have
> > > > a
> > > > +  * caching different than writeback.
> > > > +  */
> > > > + if (restore) {
> > > > +         pgoff_t mid =3D restore-
> > > > > snapshot_alloc.caching_divide - tt->pages;
> > > > +
> > > > +         start_page =3D restore->alloced_pages;
> > > > +         WARN_ON(mid > start_page);
> > > > +         /* Pages that might be dma-mapped and non-cached
> > > > */
> > > > +         ttm_pool_free_range(restore->pool, tt, tt-
> > > > > caching,
> > > > +                             0, mid);
> > > > +         /* Pages that might be dma-mapped but cached */
> > > > +         ttm_pool_free_range(restore->pool, tt,
> > > > ttm_cached,
> > > > +                             mid, restore-
> > > > >alloced_pages);
> > > > +         kfree(restore);
> > > > +         tt->restore =3D NULL;
> > > > + }
> > > > +
> > > > + ttm_pool_free_range(NULL, tt, ttm_cached, start_page,
> > > > tt-
> > > > > num_pages);
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_pool_backup() - Back up or purge a struct ttm_tt
> > > > + * @pool: The pool used when allocating the struct ttm_tt.
> > > > + * @tt: The struct ttm_tt.
> > > > + * @flags: Flags to govern the backup behaviour.
> > > > + *
> > > > + * Back up or purge a struct ttm_tt. If @purge is true, then
> > > > + * all pages will be freed directly to the system rather than to
> > > > the pool
> > > > + * they were allocated from, making the function behave
> > > > similarly
> > > > to
> > > > + * ttm_pool_free(). If @purge is false the pages will be backed
> > > > up
> > > > instead,
> > > > + * exchanged for handles.
> > > > + * A subsequent call to ttm_pool_restore_and_alloc() will then
> > > > read back the content and
> > > > + * a subsequent call to ttm_pool_drop_backed_up() will drop it.
> > > > + * If backup of a page fails for whatever reason, @ttm will
> > > > still
> > > > be
> > > > + * partially backed up, retaining those pages for which backup
> > > > fails.
> > > > + * In that case, this function can be retried, possibly after
> > > > freeing up
> > > > + * memory resources.
> > > > + *
> > > > + * Return: Number of pages actually backed up or freed, or
> > > > negative
> > > > + * error code on error.
> > > > + */
> > > > +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
> > > > +              const struct ttm_backup_flags *flags)
> > > > +{
> > > > + struct ttm_backup *backup =3D tt->backup;
> > > > + struct page *page;
> > > > + unsigned long handle;
> > > > + gfp_t alloc_gfp;
> > > > + gfp_t gfp;
> > > > + int ret =3D 0;
> > > > + pgoff_t shrunken =3D 0;
> > > > + pgoff_t i, num_pages;
> > > > +
> > > > + if (WARN_ON(ttm_tt_is_backed_up(tt)))
> > > > +         return -EINVAL;
> > > > +
> > > > + if ((!ttm_backup_bytes_avail() && !flags->purge) ||
> > > > +     pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
> > > > +         return -EBUSY;
> > > > +
> > > > +#ifdef CONFIG_X86
> > > > + /* Anything returned to the system needs to be cached.
> > > > */
> > > > + if (tt->caching !=3D ttm_cached)
> > > > +         set_pages_array_wb(tt->pages, tt->num_pages);
> > > > +#endif
> > > > +
> > > > + if (tt->dma_address || flags->purge) {
> > > > +         for (i =3D 0; i < tt->num_pages; i +=3D num_pages) {
> > > > +                 unsigned int order;
> > > > +
> > > > +                 page =3D tt->pages[i];
> > > > +                 if (unlikely(!page)) {
> > > > +                         num_pages =3D 1;
> > > > +                         continue;
> > > > +                 }
> > > > +
> > > > +                 order =3D ttm_pool_page_order(pool, page);
> > > > +                 num_pages =3D 1UL << order;
> > > > +                 if (tt->dma_address)
> > > > +                         ttm_pool_unmap(pool, tt-
> > > > > dma_address[i],
> > > > +                                        num_pages);
> > > > +                 if (flags->purge) {
> > > > +                         shrunken +=3D num_pages;
> > > > +                         page->private =3D 0;
> > > > +                         __free_pages(page, order);
> > > > +                         memset(tt->pages + i, 0,
> > > > +                                num_pages * sizeof(*tt-
> > > > > pages));
> > > > +                 }
> > > > +         }
> > > > + }
> > > > +
> > > > + if (flags->purge)
> > > > +         return shrunken;
> > > > +
> > > > + if (pool->use_dma32)
> > > > +         gfp =3D GFP_DMA32;
> > > > + else
> > > > +         gfp =3D GFP_HIGHUSER;
> > > > +
> > > > + alloc_gfp =3D GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > > > __GFP_RETRY_MAYFAIL;
> > > > +
> > > > + for (i =3D 0; i < tt->num_pages; ++i) {
> > > > +         s64 shandle;
> > > > +
> > > > +         page =3D tt->pages[i];
> > > > +         if (unlikely(!page))
> > > > +                 continue;
> > > > +
> > > > +         ttm_pool_split_for_swap(pool, page);
> > > > +
> > > > +         shandle =3D ttm_backup_backup_page(backup, page,
> > > > flags->writeback, i,
> > > > +                                          gfp,
> > > > alloc_gfp);
> > > > +         if (shandle < 0) {
> > > > +                 /* We allow partially shrunken tts */
> > > > +                 ret =3D shandle;
> > > > +                 break;
> > > > +         }
> > > > +         handle =3D shandle;
> > > > +         tt->pages[i] =3D
> > > > ttm_backup_handle_to_page_ptr(handle);
> > > > +         put_page(page);
> > > > +         shrunken++;
> > > > + }
> > > > +
> > > > + return shrunken ? shrunken : ret;
> > > > +}
> > > > +
> > > >   /**
> > > >    * ttm_pool_init - Initialize a pool
> > > >    *
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > index 3baf215eca23..00b7c28f2329 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -40,6 +40,7 @@
> > > >   #include <drm/drm_cache.h>
> > > >   #include <drm/drm_device.h>
> > > >   #include <drm/drm_util.h>
> > > > +#include <drm/ttm/ttm_backup.h>
> > > >   #include <drm/ttm/ttm_bo.h>
> > > >   #include <drm/ttm/ttm_tt.h>
> > > >
> > > > @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt
> > > > *ttm,
> > > >           ttm->swap_storage =3D NULL;
> > > >           ttm->sg =3D bo->sg;
> > > >           ttm->caching =3D caching;
> > > > + ttm->restore =3D NULL;
> > > > + ttm->backup =3D NULL;
> > > >   }
> > > >
> > > >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object
> > > > *bo,
> > > > @@ -182,6 +185,13 @@ void ttm_tt_fini(struct ttm_tt *ttm)
> > > >                   fput(ttm->swap_storage);
> > > >           ttm->swap_storage =3D NULL;
> > > >
> > > > + if (ttm_tt_is_backed_up(ttm))
> > > > +         ttm_pool_drop_backed_up(ttm);
> > > > + if (ttm->backup) {
> > > > +         ttm_backup_fini(ttm->backup);
> > > > +         ttm->backup =3D NULL;
> > > > + }
> > > > +
> > > >           if (ttm->pages)
> > > >                   kvfree(ttm->pages);
> > > >           else
> > > > @@ -253,6 +263,49 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> > > >   }
> > > >   EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
> > > >
> > > > +/**
> > > > + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> > > > + * @bdev: The TTM device.
> > > > + * @tt: The struct ttm_tt.
> > > > + * @flags: Flags that govern the backup behaviour.
> > > > + *
> > > > + * Update the page accounting and call ttm_pool_shrink_tt to
> > > > free
> > > > pages
> > > > + * or back them up.
> > > > + *
> > > > + * Return: Number of pages freed or swapped out, or negative
> > > > error
> > > > code on
> > > > + * error.
> > > > + */
> > > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > > > +            const struct ttm_backup_flags flags)
> > > > +{
> > > > + long ret;
> > > > +
> > > > + if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> > > > +         return 0;
> > > > +
> > > > + ret =3D ttm_pool_backup(&bdev->pool, tt, &flags);
> > > > + if (ret > 0) {
> > > > +         tt->page_flags &=3D ~TTM_TT_FLAG_PRIV_POPULATED;
> > > > +         tt->page_flags |=3D TTM_TT_FLAG_BACKED_UP;
> > > > + }
> > > > +
> > > > + return ret;
> > > > +}
> > > > +
> > > > +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
> > > > +            const struct ttm_operation_ctx *ctx)
> > > > +{
> > > > + int ret =3D ttm_pool_restore_and_alloc(&bdev->pool, tt,
> > > > ctx);
> > > > +
> > > > + if (ret)
> > > > +         return ret;
> > > > +
> > > > + tt->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > > +
> > > > + return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_tt_restore);
> > > > +
> > > >   /**
> > > >    * ttm_tt_swapout - swap out tt object
> > > >    *
> > > > @@ -348,6 +401,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
> > > >                   goto error;
> > > >
> > > >           ttm->page_flags |=3D TTM_TT_FLAG_PRIV_POPULATED;
> > > > + ttm->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > >           if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
> > > >                   ret =3D ttm_tt_swapin(ttm);
> > > >                   if (unlikely(ret !=3D 0)) {
> > > > diff --git a/include/drm/ttm/ttm_pool.h
> > > > b/include/drm/ttm/ttm_pool.h
> > > > index 160d954a261e..54cd34a6e4c0 100644
> > > > --- a/include/drm/ttm/ttm_pool.h
> > > > +++ b/include/drm/ttm/ttm_pool.h
> > > > @@ -33,6 +33,7 @@
> > > >
> > > >   struct device;
> > > >   struct seq_file;
> > > > +struct ttm_backup_flags;
> > > >   struct ttm_operation_ctx;
> > > >   struct ttm_pool;
> > > >   struct ttm_tt;
> > > > @@ -89,6 +90,13 @@ void ttm_pool_fini(struct ttm_pool *pool);
> > > >
> > > >   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file
> > > > *m);
> > > >
> > > > +void ttm_pool_drop_backed_up(struct ttm_tt *tt);
> > > > +
> > > > +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *ttm,
> > > > +              const struct ttm_backup_flags *flags);
> > > > +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
> > > > ttm_tt *tt,
> > > > +                        const struct ttm_operation_ctx
> > > > *ctx);
> > > > +
> > > >   int ttm_pool_mgr_init(unsigned long num_pages);
> > > >   void ttm_pool_mgr_fini(void);
> > > >
> > > > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > > > index 991edafdb2dd..c736c01ac2ca 100644
> > > > --- a/include/drm/ttm/ttm_tt.h
> > > > +++ b/include/drm/ttm/ttm_tt.h
> > > > @@ -32,11 +32,13 @@
> > > >   #include <drm/ttm/ttm_caching.h>
> > > >   #include <drm/ttm/ttm_kmap_iter.h>
> > > >
> > > > +struct ttm_backup;
> > > >   struct ttm_device;
> > > >   struct ttm_tt;
> > > >   struct ttm_resource;
> > > >   struct ttm_buffer_object;
> > > >   struct ttm_operation_ctx;
> > > > +struct ttm_pool_tt_restore;
> > > >
> > > >   /**
> > > >    * struct ttm_tt - This is a structure holding the pages,
> > > > caching- and aperture
> > > > @@ -85,17 +87,22 @@ struct ttm_tt {
> > > >            * fault handling abuses the DMA api a bit and
> > > > dma_map_attrs can't be
> > > >            * used to assure pgprot always matches.
> > > >            *
> > > > +  * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set
> > > > if the
> > > > +  * struct ttm_tt has been (possibly partially) backed
> > > > up.
> > > > +  *
> > > >            * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> > > > USE. This is
> > > >            * set by TTM after ttm_tt_populate() has successfully
> > > > returned, and is
> > > >            * then unset when TTM calls ttm_tt_unpopulate().
> > > > +  *
> > > >            */
> > > >   #define TTM_TT_FLAG_SWAPPED             BIT(0)
> > > >   #define TTM_TT_FLAG_ZERO_ALLOC          BIT(1)
> > > >   #define TTM_TT_FLAG_EXTERNAL            BIT(2)
> > > >   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE   BIT(3)
> > > >   #define TTM_TT_FLAG_DECRYPTED           BIT(4)
> > > > +#define TTM_TT_FLAG_BACKED_UP            BIT(5)
> > > >
> > > > -#define TTM_TT_FLAG_PRIV_POPULATED       BIT(5)
> > > > +#define TTM_TT_FLAG_PRIV_POPULATED       BIT(6)
> > > >           uint32_t page_flags;
> > > >           /** @num_pages: Number of pages in the page array. */
> > > >           uint32_t num_pages;
> > > > @@ -105,11 +112,20 @@ struct ttm_tt {
> > > >           dma_addr_t *dma_address;
> > > >           /** @swap_storage: Pointer to shmem struct file for swap
> > > > storage. */
> > > >           struct file *swap_storage;
> > > > + /**
> > > > +  * @backup: Pointer to backup struct for backed up tts.
> > > > +  * Could be unified with @swap_storage. Meanwhile, the
> > > > driver's
> > > > +  * ttm_tt_create() callback is responsible for assigning
> > > > +  * this field.
> > > > +  */
> > > > + struct ttm_backup *backup;
> > > >           /**
> > > >            * @caching: The current caching state of the pages, see
> > > > enum
> > > >            * ttm_caching.
> > > >            */
> > > >           enum ttm_caching caching;
> > > > + /** @restore: Partial restoration from backup state. TTM
> > > > private */
> > > > + struct ttm_pool_tt_restore *restore;
> > > >   };
> > > >
> > > >   /**
> > > > @@ -129,9 +145,38 @@ static inline bool
> > > > ttm_tt_is_populated(struct
> > > > ttm_tt *tt)
> > > >           return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
> > > >   }
> > > >
> > > > +/**
> > > > + * ttm_tt_is_swapped() - Whether the ttm_tt is swapped out or
> > > > backed up
> > > > + * @tt: The struct ttm_tt.
> > > > + *
> > > > + * Return: true if swapped or backed up, false otherwise.
> > > > + */
> > > >   static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
> > > >   {
> > > > - return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> > > > + return tt->page_flags & (TTM_TT_FLAG_SWAPPED |
> > > > TTM_TT_FLAG_BACKED_UP);
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_tt_is_backed_up() - Whether the ttm_tt backed up
> > > > + * @tt: The struct ttm_tt.
> > > > + *
> > > > + * Return: true if swapped or backed up, false otherwise.
> > > > + */
> > > > +static inline bool ttm_tt_is_backed_up(const struct ttm_tt *tt)
> > > > +{
> > > > + return tt->page_flags & TTM_TT_FLAG_BACKED_UP;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_tt_clear_backed_up() - Clear the ttm_tt backed-up status
> > > > + * @tt: The struct ttm_tt.
> > > > + *
> > > > + * Drivers can use this functionto clear the backed-up status,
> > > > + * for example before destroying or re-validating a purged tt.
> > > > + */
> > > > +static inline void ttm_tt_clear_backed_up(struct ttm_tt *tt)
> > > > +{
> > > > + tt->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > >   }
> > > >
> > > >   /**
> > > > @@ -235,6 +280,24 @@ void ttm_tt_mgr_init(unsigned long
> > > > num_pages,
> > > > unsigned long num_dma32_pages);
> > > >   struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
> > > > ttm_kmap_iter_tt *iter_tt,
> > > >                                               struct ttm_tt *tt);
> > > >   unsigned long ttm_tt_pages_limit(void);
> > > > +
> > > > +/**
> > > > + * struct ttm_backup_flags - Flags to govern backup behaviour.
> > > > + * @purge: Free pages without backing up. Bypass pools.
> > > > + * @writeback: Attempt to copy contents directly to swap space,
> > > > even
> > > > + * if that means blocking on writes to external memory.
> > > > + */
> > > > +struct ttm_backup_flags {
> > > > + u32 purge : 1;
> > > > + u32 writeback : 1;
> > > > +};
> > > > +
> > > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > > > +            const struct ttm_backup_flags flags);
> > > > +
> > > > +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
> > > > +            const struct ttm_operation_ctx *ctx);
> > > > +
> > > >   #if IS_ENABLED(CONFIG_AGP)
> > > >   #include <linux/agp_backend.h>
> > > >
> > >
> >
>
