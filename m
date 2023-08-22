Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59DB7839B7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 08:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4E710E2DA;
	Tue, 22 Aug 2023 06:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D41210E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 06:06:04 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-44d3fceb567so1448507137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692684363; x=1693289163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96PAr/ZKdMv2+Os9IV3Xbt2ZP288+QT1rrqfr7FmrOU=;
 b=IJDiTjAeGAyJ/4v+6yRZ0Dczs1hvAAYjI0NGvmfIJer5b9MNhWRYjXm06nhHUNLB1D
 Qfe9gPlHjEr0Eo3/G+BGb+bF61xVTLzVwNiZCDRRA7PQJ4GwPBnuCfAuRL7/l3mhS7XP
 mPT0JKrpzt1v28Bfg/SbnIyg1YMZa7Ibd6q+hu12FsBSjrvNPUlt4lXmW4P4vENdqO4/
 yLydp7lGe+qK3dyza2zr3g7+zKfCh2hxsqMVVESpN6obRHxfL7RPTb2UHIIZAf8ZF2Cq
 4w9CKtnqRyIT0JPnwJiD6ZPKnouBBEUN9CAK91DbvJny16uE00Tx3YffPDcQFU40FxoE
 VAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692684363; x=1693289163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96PAr/ZKdMv2+Os9IV3Xbt2ZP288+QT1rrqfr7FmrOU=;
 b=TGUKH8wcUlsSy6OMqZQlD9SUCpVTRi8KSObap2GJTjGtOrhY73rAzPl4ivfX9yKH6+
 U4an92ItbKSakG5J72tGHjajG8ddq5Bof0zAyxXY6lAwAp3jCOmZY6EQ97yAT+Hcgb6A
 tHfxuTMRNW2ZuCRT2gnmUNlvhYnaT8sYVuK5mpjmjggITVHXRIqQ60rWipwv2VSSdwIA
 bTYEKzXteU2ltYbb7bjaFfelfmDr6LqhinFS91sDXUu6rDJg2xMh1j4DCOj9nzBLk+Cx
 +qWx5A8PV6vJMrOaves9E0xEGfIss4up5V9EGq+TAJxzLT+QFvdKC8F3N8R8HwKHWGYX
 DXjw==
X-Gm-Message-State: AOJu0YzjBl3KyqbmoM3VQw+tWqmnzEEl2WzoGXC9nGsch/ghRWBOJtT1
 vqqEdzNRkrF0JJUTPxKBFhRxjGXQ4ng4n7Tk+OZCwg==
X-Google-Smtp-Source: AGHT+IFPjPglggVAFjlide5m+mn7HoVFzA/jDolI+RailJQq2VaayvEQFWJzjNa7Zg17QcOhYhc1OZHohW/GCYlclM0=
X-Received: by 2002:a05:6102:320b:b0:44b:f502:148d with SMTP id
 r11-20020a056102320b00b0044bf502148dmr4725729vsf.6.1692684363159; Mon, 21 Aug
 2023 23:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
In-Reply-To: <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 21 Aug 2023 23:05:50 -0700
Message-ID: <CAHS8izM4w2UETAwfnV7w+ZzTMxLkz+FKO+xTgRdtYKzV8RzqXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Hari Ramakrishnan <rharix@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>, brouer@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 19, 2023 at 2:51=E2=80=AFAM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:
>
>
>
> On 10/08/2023 03.57, Mina Almasry wrote:
> > Overload the LSB of struct page* to indicate that it's a page_pool_iov.
> >
> > Refactor mm calls on struct page * into helpers, and add page_pool_iov
> > handling on those helpers. Modify callers of these mm APIs with calls t=
o
> > these helpers instead.
> >
>
> I don't like of this approach.
> This is adding code to the PP (page_pool) fast-path in multiple places.
>
> I've not had time to run my usual benchmarks, which are here:
>
> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/lib/b=
ench_page_pool_simple.c
>

I ported over this benchmark to my tree and ran it, my results:

net-next @ b44693495af8
https://pastebin.com/raw/JuU7UQXe

+ Jakub's memory-provider APIs:
https://pastebin.com/raw/StMBhetn

+ devmem TCP changes:
https://pastebin.com/raw/mY1L6U4r

+ intentional regression just to make sure the benchmark is working:
https://pastebin.com/raw/wqWhcJdG

I don't seem to be able to detect a regression with this series as-is,
but I'm not that familiar with the test and may be doing something
wrong or misinterpreting the results. Does this look ok to you?

> But I'm sure it will affect performance.
>
> Regardless of performance, this approach is using ptr-LSB-bits, to hide
> that page-pointer are not really struct-pages, feels like force feeding
> a solution just to use the page_pool APIs.
>
>
> > In areas where struct page* is dereferenced, add a check for special
> > handling of page_pool_iov.
> >
> > The memory providers producing page_pool_iov can set the LSB on the
> > struct page* returned to the page pool.
> >
> > Note that instead of overloading the LSB of page pointers, we can
> > instead define a new union between struct page & struct page_pool_iov a=
nd
> > compact it in a new type. However, we'd need to implement the code chur=
n
> > to modify the page_pool & drivers to use this new type. For this POC
> > that is not implemented (feedback welcome).
> >
>
> I've said before, that I prefer multiplexing on page->pp_magic.
> For your page_pool_iov the layout would have to match the offset of
> pp_magic, to do this. (And if insisting on using PP infra the refcnt
> would also need to align).
>
> On the allocation side, all drivers already use a driver helper
> page_pool_dev_alloc_pages() or we could add another (better named)
> helper to multiplex between other types of allocators, e.g. a devmem
> allocator.
>
> On free/return/recycle the functions napi_pp_put_page or skb_pp_recycle
> could multiplex on pp_magic and call another API.  The API could be an
> extension to PP helpers, but it could also be a devmap allocator helper.
>
> IMHO forcing/piggy-bagging everything into page_pool is not the right
> solution.  I really think netstack need to support different allocator
> types. The page pool have been leading the way, yes, but perhaps it is
> time to add an API layer that e.g. could be named netmem, that gives us
> the multiplexing between allocators.  In that process some of page_pool
> APIs would be lifted out as common blocks and others remain.
>
> --Jesper
>
> > I have a sample implementation of adding a new page_pool_token type
> > in the page_pool to give a general idea here:
> > https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db036003bc=
a50779608d
> >
> > Full branch here:
> > https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem=
-pp-tokens
> >
> > (In the branches above, page_pool_iov is called devmem_slice).
> >
> > Could also add static_branch to speed up the checks in page_pool_iov
> > memory providers are being used.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >   include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
> >   net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++------------=
-
> >   2 files changed, 131 insertions(+), 28 deletions(-)
> >
> > diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> > index 537eb36115ed..f08ca230d68e 100644
> > --- a/include/net/page_pool.h
> > +++ b/include/net/page_pool.h
> > @@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_page_p=
ool_iov(struct page *page)
> >       return NULL;
> >   }
> >
> > +static inline int page_pool_page_ref_count(struct page *page)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return page_pool_iov_refcount(page_to_page_pool_iov(page)=
);
> > +
> > +     return page_ref_count(page);
> > +}
> > +
> > +static inline void page_pool_page_get_many(struct page *page,
> > +                                        unsigned int count)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return page_pool_iov_get_many(page_to_page_pool_iov(page)=
,
> > +                                           count);
> > +
> > +     return page_ref_add(page, count);
> > +}
> > +
> > +static inline void page_pool_page_put_many(struct page *page,
> > +                                        unsigned int count)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return page_pool_iov_put_many(page_to_page_pool_iov(page)=
,
> > +                                           count);
> > +
> > +     if (count > 1)
> > +             page_ref_sub(page, count - 1);
> > +
> > +     put_page(page);
> > +}
> > +
> > +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return false;
> > +
> > +     return page_is_pfmemalloc(page);
> > +}
> > +
> > +static inline bool page_pool_page_is_pref_nid(struct page *page, int p=
ref_nid)
> > +{
> > +     /* Assume page_pool_iov are on the preferred node without actuall=
y
> > +      * checking...
> > +      *
> > +      * This check is only used to check for recycling memory in the p=
age
> > +      * pool's fast paths. Currently the only implementation of page_p=
ool_iov
> > +      * is dmabuf device memory. It's a deliberate decision by the use=
r to
> > +      * bind a certain dmabuf to a certain netdev, and the netdev rx q=
ueue
> > +      * would not be able to reallocate memory from another dmabuf tha=
t
> > +      * exists on the preferred node, so, this check doesn't make much=
 sense
> > +      * in this case. Assume all page_pool_iovs can be recycled for no=
w.
> > +      */
> > +     if (page_is_page_pool_iov(page))
> > +             return true;
> > +
> > +     return page_to_nid(page) =3D=3D pref_nid;
> > +}
> > +
> >   struct page_pool {
> >       struct page_pool_params p;
> >
> > @@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct pag=
e *page, long nr)
> >   {
> >       long ret;
> >
> > +     if (page_is_page_pool_iov(page))
> > +             return -EINVAL;
> > +
> >       /* If nr =3D=3D pp_frag_count then we have cleared all remaining
> >        * references to the page. No need to actually overwrite it, inst=
ead
> >        * we can leave this to be overwritten by the calling function.
> > @@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(struct=
 page_pool *pool,
> >
> >   static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
> >   {
> > -     dma_addr_t ret =3D page->dma_addr;
> > +     dma_addr_t ret;
> > +
> > +     if (page_is_page_pool_iov(page))
> > +             return page_pool_iov_dma_addr(page_to_page_pool_iov(page)=
);
> > +
> > +     ret =3D page->dma_addr;
> >
> >       if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> >               ret |=3D (dma_addr_t)page->dma_addr_upper << 16 << 16;
> > @@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_addr(st=
ruct page *page)
> >
> >   static inline void page_pool_set_dma_addr(struct page *page, dma_addr=
_t addr)
> >   {
> > +     /* page_pool_iovs are mapped and their dma-addr can't be modified=
. */
> > +     if (page_is_page_pool_iov(page)) {
> > +             DEBUG_NET_WARN_ON_ONCE(true);
> > +             return;
> > +     }
> > +
> >       page->dma_addr =3D addr;
> >       if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> >               page->dma_addr_upper =3D upper_32_bits(addr);
> > diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> > index 0a7c08d748b8..20c1f74fd844 100644
> > --- a/net/core/page_pool.c
> > +++ b/net/core/page_pool.c
> > @@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cache(st=
ruct page_pool *pool)
> >               if (unlikely(!page))
> >                       break;
> >
> > -             if (likely(page_to_nid(page) =3D=3D pref_nid)) {
> > +             if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
> >                       pool->alloc.cache[pool->alloc.count++] =3D page;
> >               } else {
> >                       /* NUMA mismatch;
> > @@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(struct p=
age_pool *pool,
> >                                         struct page *page,
> >                                         unsigned int dma_sync_size)
> >   {
> > -     dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
> > +     dma_addr_t dma_addr;
> > +
> > +     /* page_pool_iov memory provider do not support PP_FLAG_DMA_SYNC_=
DEV */
> > +     if (page_is_page_pool_iov(page)) {
> > +             DEBUG_NET_WARN_ON_ONCE(true);
> > +             return;
> > +     }
> > +
> > +     dma_addr =3D page_pool_get_dma_addr(page);
> >
> >       dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
> >       dma_sync_single_range_for_device(pool->p.dev, dma_addr,
> > @@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool *po=
ol, struct page *page)
> >   {
> >       dma_addr_t dma;
> >
> > +     if (page_is_page_pool_iov(page)) {
> > +             /* page_pool_iovs are already mapped */
> > +             DEBUG_NET_WARN_ON_ONCE(true);
> > +             return true;
> > +     }
> > +
> >       /* Setup DMA mapping: use 'struct page' area for storing DMA-addr
> >        * since dma_addr_t can be either 32 or 64 bits and does not alwa=
ys fit
> >        * into page private data (i.e 32bit cpu with 64bit DMA caps)
> > @@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_pool *p=
ool, struct page *page)
> >   static void page_pool_set_pp_info(struct page_pool *pool,
> >                                 struct page *page)
> >   {
> > -     page->pp =3D pool;
> > -     page->pp_magic |=3D PP_SIGNATURE;
> > +     if (!page_is_page_pool_iov(page)) {
> > +             page->pp =3D pool;
> > +             page->pp_magic |=3D PP_SIGNATURE;
> > +     } else {
> > +             page_to_page_pool_iov(page)->pp =3D pool;
> > +     }
> > +
> >       if (pool->p.init_callback)
> >               pool->p.init_callback(page, pool->p.init_arg);
> >   }
> >
> >   static void page_pool_clear_pp_info(struct page *page)
> >   {
> > +     if (page_is_page_pool_iov(page)) {
> > +             page_to_page_pool_iov(page)->pp =3D NULL;
> > +             return;
> > +     }
> > +
> >       page->pp_magic =3D 0;
> >       page->pp =3D NULL;
> >   }
> > @@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct page =
*page,
> >               return false;
> >       }
> >
> > -     /* Caller MUST have verified/know (page_ref_count(page) =3D=3D 1)=
 */
> > +     /* Caller MUST have verified/know (page_pool_page_ref_count(page)=
 =3D=3D 1) */
> >       pool->alloc.cache[pool->alloc.count++] =3D page;
> >       recycle_stat_inc(pool, cached);
> >       return true;
> > @@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, struc=
t page *page,
> >        * refcnt =3D=3D 1 means page_pool owns page, and can recycle it.
> >        *
> >        * page is NOT reusable when allocated when system is under
> > -      * some pressure. (page_is_pfmemalloc)
> > +      * some pressure. (page_pool_page_is_pfmemalloc)
> >        */
> > -     if (likely(page_ref_count(page) =3D=3D 1 && !page_is_pfmemalloc(p=
age))) {
> > +     if (likely(page_pool_page_ref_count(page) =3D=3D 1 &&
> > +                !page_pool_page_is_pfmemalloc(page))) {
> >               /* Read barrier done in page_ref_count / READ_ONCE */
> >
> >               if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> > @@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct pag=
e_pool *pool,
> >       if (likely(page_pool_defrag_page(page, drain_count)))
> >               return NULL;
> >
> > -     if (page_ref_count(page) =3D=3D 1 && !page_is_pfmemalloc(page)) {
> > +     if (page_pool_page_ref_count(page) =3D=3D 1 &&
> > +         !page_pool_page_is_pfmemalloc(page)) {
> >               if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> >                       page_pool_dma_sync_for_device(pool, page, -1);
> >
> > @@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_pool *=
pool)
> >       /* Empty recycle ring */
> >       while ((page =3D ptr_ring_consume_bh(&pool->ring))) {
> >               /* Verify the refcnt invariant of cached pages */
> > -             if (!(page_ref_count(page) =3D=3D 1))
> > +             if (!(page_pool_page_ref_count(page) =3D=3D 1))
> >                       pr_crit("%s() page_pool refcnt %d violation\n",
> > -                             __func__, page_ref_count(page));
> > +                             __func__, page_pool_page_ref_count(page))=
;
> >
> >               page_pool_return_page(pool, page);
> >       }
> > @@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *page=
, bool napi_safe)
> >       struct page_pool *pp;
> >       bool allow_direct;
> >
> > -     page =3D compound_head(page);
> > +     if (!page_is_page_pool_iov(page)) {
> > +             page =3D compound_head(page);
> >
> > -     /* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
> > -      * in order to preserve any existing bits, such as bit 0 for the
> > -      * head page of compound page and bit 1 for pfmemalloc page, so
> > -      * mask those bits for freeing side when doing below checking,
> > -      * and page_is_pfmemalloc() is checked in __page_pool_put_page()
> > -      * to avoid recycling the pfmemalloc page.
> > -      */
> > -     if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNATURE))
> > -             return false;
> > +             /* page->pp_magic is OR'ed with PP_SIGNATURE after the
> > +              * allocation in order to preserve any existing bits, suc=
h as
> > +              * bit 0 for the head page of compound page and bit 1 for
> > +              * pfmemalloc page, so mask those bits for freeing side w=
hen
> > +              * doing below checking, and page_pool_page_is_pfmemalloc=
() is
> > +              * checked in __page_pool_put_page() to avoid recycling t=
he
> > +              * pfmemalloc page.
> > +              */
> > +             if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNATURE)=
)
> > +                     return false;
> >
> > -     pp =3D page->pp;
> > +             pp =3D page->pp;
> > +     } else {
> > +             pp =3D page_to_page_pool_iov(page)->pp;
> > +     }
> >
> >       /* Allow direct recycle if we have reasons to believe that we are
> >        * in the same context as the consumer would run, so there's
> > @@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, unsi=
gned int idx)
> >
> >       for (j =3D 0; j < (1 << MP_HUGE_ORDER); j++) {
> >               page =3D hu->page[idx] + j;
> > -             if (page_ref_count(page) !=3D 1) {
> > +             if (page_pool_page_ref_count(page) !=3D 1) {
> >                       pr_warn("Page with ref count %d at %u, %u. Can't =
safely destory, leaking memory!\n",
> > -                             page_ref_count(page), idx, j);
> > +                             page_pool_page_ref_count(page), idx, j);
> >                       return true;
> >               }
> >       }
> > @@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struct pa=
ge_pool *pool, gfp_t gfp)
> >                       continue;
> >
> >               if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> > -                 page_ref_count(page) !=3D 1) {
> > +                 page_pool_page_ref_count(page) !=3D 1) {
> >                       atomic_inc(&mp_huge_ins_b);
> >                       continue;
> >               }
> > @@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_pool *=
pool)
> >       free =3D true;
> >       for (i =3D 0; i < MP_HUGE_1G_CNT; i++) {
> >               page =3D hu->page + i;
> > -             if (page_ref_count(page) !=3D 1) {
> > +             if (page_pool_page_ref_count(page) !=3D 1) {
> >                       pr_warn("Page with ref count %d at %u. Can't safe=
ly destory, leaking memory!\n",
> > -                             page_ref_count(page), i);
> > +                             page_pool_page_ref_count(page), i);
> >                       free =3D false;
> >                       break;
> >               }
> > @@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(struct=
 page_pool *pool, gfp_t gfp)
> >               page =3D hu->page + page_i;
> >
> >               if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> > -                 page_ref_count(page) !=3D 1) {
> > +                 page_pool_page_ref_count(page) !=3D 1) {
> >                       atomic_inc(&mp_huge_ins_b);
> >                       continue;
> >               }
> > --
> > 2.41.0.640.ga95def55d0-goog
> >
>


--
Thanks,
Mina
