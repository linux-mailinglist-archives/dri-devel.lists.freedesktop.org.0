Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE38BDAA3B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7DE10E65A;
	Tue, 14 Oct 2025 16:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HGOoXncD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4E10E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:47:04 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-58120c35d47so995051e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760446023; x=1761050823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOYDAUUrPF9BNX7d43RB9kvFca4sRiuUrwceAzjG9h0=;
 b=HGOoXncDoEJ1k1xs8mnauzjmTuxcZXLEYDoGw0681kjyS6saJZyutdNzSavsaeJCGe
 4exs0epcaJMw3EZrLmicycQalM1CoVfS0sg+/zL/ZXNEdHCRmO0WOrPxAaj+cWOVLgvW
 AawjD1uy4j4UZ24uvPWg/+kWP9QS5YTKu4vrrBVz3FSYuJYo6usw1syl91GGXEVs1RpT
 dIV0qi9UHZr9fLzeTrMdStv13YLugb3yUhf1JEXGuJ861X30wlmv1HukF8Ex4AA1+UaT
 RuxmK/2S2QPosT9WJ0a9vZsNTiwqoWFLI654I1fj8u280hIAyogwAOC2avdH55lHKACr
 Pj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760446023; x=1761050823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOYDAUUrPF9BNX7d43RB9kvFca4sRiuUrwceAzjG9h0=;
 b=YMCiucGgPzEgLy4mjR4UnOX2eYSPjWZ69MgXfpcRZOCnueFaXL4Z17yxcuedPxXzpi
 ASVNxTgaocRTq5OM9tKgLp/ITNibY5LYL1yplOz5e/ZwjSNnbTW+7jSglsrj9Jj0sg8W
 h/JbSkwDGN11sJMuN6WwHh8ANnBAA2GZc0MrQIeRFjTHg36HL5gGVKXS62cS5+Qlp7Sh
 bRLpcPlMlk9Qeu5cteNZy3JmIS3x1/wbEf3crNOPoSu03G4PyXthNCVUO6oWX1DBkxGg
 LTeMae3WwVZNqkOFuwY/uuY/EqmBuO3Zr8R3YcshA/R74XTIcTiW40GaQUrk+cUjPnKu
 x7ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8KzDIeHIbD/pkkrPmd9UjPJ8P4S+dgKvPacUyxI2XiXpDO2FvYVQfJ0TqXCqcXqzEOBhf2s7RJB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMezPn3NSGj8r2Ei4dGiac3l32n/7/E+WiDYu+PkaZQqty61kF
 BJv69hRTPd8HznqmzxSulhkZ2AVFYAJVI+hShZiz2Iq0tZGUeYRCnt+nKQZ93waWqL6V1I7Xaia
 p3JKeZwh3txs17bUBAhUKh91OO3+BvgM=
X-Gm-Gg: ASbGncvrGLnssFtvw9FmEUfXe/EEL60mJ9BRufQisp31lQVFD/I32jjnR3DXOkVTh2V
 fRSccgte1vrSxH818bolmgqqka+0tFIqVBfHf2VgjCBdhHoN05vauSnXo+57YYTxHIQnRrmPWeE
 TEWDyZlb4+pfK3ouc44h2HY3bE5/eis+pS0UKMlHRkbGMBEdhxVUIMAT4NwqWv4qZ+oBsssXlgU
 t0Zri0kjO2ICO2VOEC7mm8sdRE=
X-Google-Smtp-Source: AGHT+IFlO5uSigu5dtEPUFsiPorGQT8JHKN9gDGfcyR2bXSQJaHthPRim/dru6Buj5TcNFP99XIzDYgEUyJNtMVBif8=
X-Received: by 2002:a2e:beab:0:b0:36b:d9d2:7352 with SMTP id
 38308e7fff4ca-37609cebacdmr36943081fa.1.1760446022264; Tue, 14 Oct 2025
 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-2-zhaoyang.huang@unisoc.com>
 <20251014114124.145165bc@mordecai.tesarici.cz>
In-Reply-To: <20251014114124.145165bc@mordecai.tesarici.cz>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Tue, 14 Oct 2025 20:46:48 +0800
X-Gm-Features: AS18NWCZqvwBFj414D2SlPbku69nYjWV6cLatwbTi_BHqfCcVjP0WhD8gi8qGCk
Message-ID: <CAGWkznEPqsORQCiGqpjSp6XTvtHov76EGw830hxXmrUxd2U_4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: call back alloc_pages_bulk_list since it is useful
To: Petr Tesarik <ptesarik@suse.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:36:49 +0000
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

On Tue, Oct 14, 2025 at 5:41=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> On Tue, 14 Oct 2025 16:32:29 +0800
> "zhaoyang.huang" <zhaoyang.huang@unisoc.com> wrote:
>
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > commit c8b979530f27 ("mm: alloc_pages_bulk_noprof: drop page_list
> > argument") drops alloc_pages_bulk_list. This commit would like to call =
back
> > it since it is proved to be helpful to the drivers which allocate a bul=
k of
> > pages(see patch of 2 in this series ).
> > I do notice that Matthew's comment of the time cost of iterating a list=
.
> > However, I also observed in our test that the extra page_array's alloca=
tion
> > could be more expensive than cpu iteration when direct reclaiming happe=
ns
> > when ram is low[1]. IMHO, could we leave the API here to have the users
> > choose between the array or list according to their scenarios.
>
> OK, so this is more or less a revert of commit c8b979530f27 ("mm:
> alloc_pages_bulk_noprof: drop page_list argument")...
>
> I cannot comment on the performance gains, but I dislike the fact that
> the patch re-introduces alloc_pages_bulk_noprof() as a function with two
> signatures (either page_list is used, or page_array is used).
>
> If we can agree that allocations onto a linked list are useful, then I
> suggest to split the existing function so that the common bits end up
> in helper functions, called by both variants (one function using a
> list, one using an array).
Yes. That is also what I wanted to do in the beginning. I will
implement if dma-buf would like to take the change
>
> Petr T
>
> > [1]
> > android.hardwar-728     [002] .....   334.573875: system_heap_do_alloca=
te: Execution time: order 0 1 us
> > android.hardwar-728     [002] .....   334.573879: system_heap_do_alloca=
te: Execution time: order 0 2 us
> > android.hardwar-728     [002] .....   334.574239: system_heap_do_alloca=
te: Execution time: order 0 354 us
> > android.hardwar-728     [002] .....   334.574247: system_heap_do_alloca=
te: Execution time: order 0 4 us
> > android.hardwar-728     [002] .....   334.574250: system_heap_do_alloca=
te: Execution time: order 0 2 us
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  include/linux/gfp.h |  9 +++++++--
> >  mm/mempolicy.c      | 14 +++++++-------
> >  mm/page_alloc.c     | 39 +++++++++++++++++++++++++++------------
> >  3 files changed, 41 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> > index 5ebf26fcdcfa..f1540c9fcd87 100644
> > --- a/include/linux/gfp.h
> > +++ b/include/linux/gfp.h
> > @@ -231,6 +231,7 @@ struct folio *__folio_alloc_noprof(gfp_t gfp, unsig=
ned int order, int preferred_
> >
> >  unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
> >                               nodemask_t *nodemask, int nr_pages,
> > +                             struct list_head *page_list,
> >                               struct page **page_array);
> >  #define __alloc_pages_bulk(...)                      alloc_hooks(alloc=
_pages_bulk_noprof(__VA_ARGS__))
> >
> > @@ -242,7 +243,11 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(gf=
p_t gfp,
> >
> >  /* Bulk allocate order-0 pages */
> >  #define alloc_pages_bulk(_gfp, _nr_pages, _page_array)               \
> > -     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _page_ar=
ray)
> > +     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, NULL, _p=
age_array)
> > +
> > +#define alloc_pages_bulk_list(_gfp, _nr_pages, _list)                 =
       \
> > +     __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _list, N=
ULL)
> > +
> >
> >  static inline unsigned long
> >  alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, unsigned long nr_page=
s,
> > @@ -251,7 +256,7 @@ alloc_pages_bulk_node_noprof(gfp_t gfp, int nid, un=
signed long nr_pages,
> >       if (nid =3D=3D NUMA_NO_NODE)
> >               nid =3D numa_mem_id();
> >
> > -     return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, page_arr=
ay);
> > +     return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, NULL, pa=
ge_array);
> >  }
> >
> >  #define alloc_pages_bulk_node(...)                           \
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index eb83cff7db8c..26274302ee01 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -2537,13 +2537,13 @@ static unsigned long alloc_pages_bulk_interleav=
e(gfp_t gfp,
> >               if (delta) {
> >                       nr_allocated =3D alloc_pages_bulk_noprof(gfp,
> >                                       interleave_nodes(pol), NULL,
> > -                                     nr_pages_per_node + 1,
> > +                                     nr_pages_per_node + 1, NULL,
> >                                       page_array);
> >                       delta--;
> >               } else {
> >                       nr_allocated =3D alloc_pages_bulk_noprof(gfp,
> >                                       interleave_nodes(pol), NULL,
> > -                                     nr_pages_per_node, page_array);
> > +                                     nr_pages_per_node, NULL, page_arr=
ay);
> >               }
> >
> >               page_array +=3D nr_allocated;
> > @@ -2593,7 +2593,7 @@ static unsigned long alloc_pages_bulk_weighted_in=
terleave(gfp_t gfp,
> >       if (weight && node_isset(node, nodes)) {
> >               node_pages =3D min(rem_pages, weight);
> >               nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node=
_pages,
> > -                                               page_array);
> > +                                               NULL, page_array);
> >               page_array +=3D nr_allocated;
> >               total_allocated +=3D nr_allocated;
> >               /* if that's all the pages, no need to interleave */
> > @@ -2658,7 +2658,7 @@ static unsigned long alloc_pages_bulk_weighted_in=
terleave(gfp_t gfp,
> >               if (!node_pages)
> >                       break;
> >               nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node=
_pages,
> > -                                               page_array);
> > +                                               NULL, page_array);
> >               page_array +=3D nr_allocated;
> >               total_allocated +=3D nr_allocated;
> >               if (total_allocated =3D=3D nr_pages)
> > @@ -2682,11 +2682,11 @@ static unsigned long alloc_pages_bulk_preferred=
_many(gfp_t gfp, int nid,
> >       preferred_gfp &=3D ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
> >
> >       nr_allocated  =3D alloc_pages_bulk_noprof(preferred_gfp, nid, &po=
l->nodes,
> > -                                        nr_pages, page_array);
> > +                                        nr_pages, NULL, page_array);
> >
> >       if (nr_allocated < nr_pages)
> >               nr_allocated +=3D alloc_pages_bulk_noprof(gfp, numa_node_=
id(), NULL,
> > -                             nr_pages - nr_allocated,
> > +                             nr_pages - nr_allocated, NULL,
> >                               page_array + nr_allocated);
> >       return nr_allocated;
> >  }
> > @@ -2722,7 +2722,7 @@ unsigned long alloc_pages_bulk_mempolicy_noprof(g=
fp_t gfp,
> >       nid =3D numa_node_id();
> >       nodemask =3D policy_nodemask(gfp, pol, NO_INTERLEAVE_INDEX, &nid)=
;
> >       return alloc_pages_bulk_noprof(gfp, nid, nodemask,
> > -                                    nr_pages, page_array);
> > +                                    nr_pages, NULL, page_array);
> >  }
> >
> >  int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *=
dst)
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index d1d037f97c5f..a95bdd8cbf5b 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -4940,23 +4940,28 @@ static inline bool prepare_alloc_pages(gfp_t gf=
p_mask, unsigned int order,
> >  }
> >
> >  /*
> > - * __alloc_pages_bulk - Allocate a number of order-0 pages to an array
> > + * __alloc_pages_bulk - Allocate a number of order-0 pages to a list o=
r array
> >   * @gfp: GFP flags for the allocation
> >   * @preferred_nid: The preferred NUMA node ID to allocate from
> >   * @nodemask: Set of nodes to allocate from, may be NULL
> > - * @nr_pages: The number of pages desired in the array
> > - * @page_array: Array to store the pages
> > + * @nr_pages: The number of pages desired on the list or array
> > + * @page_list: Optional list to store the allocated pages
> > + * @page_array: Optional array to store the pages
> >   *
> >   * This is a batched version of the page allocator that attempts to
> > - * allocate nr_pages quickly. Pages are added to the page_array.
> > + * allocate nr_pages quickly. Pages are added to page_list if page_lis=
t
> > + * is not NULL, otherwise it is assumed that the page_array is valid.
> >   *
> > - * Note that only NULL elements are populated with pages and nr_pages
> > + * For lists, nr_pages is the number of pages that should be allocated=
.
> > + *
> > + * For arrays, only NULL elements are populated with pages and nr_page=
s
> >   * is the maximum number of pages that will be stored in the array.
> >   *
> > - * Returns the number of pages in the array.
> > + * Returns the number of pages on the list or array.
> >   */
> >  unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
> >                       nodemask_t *nodemask, int nr_pages,
> > +                     struct list_head *page_list,
> >                       struct page **page_array)
> >  {
> >       struct page *page;
> > @@ -4974,7 +4979,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >        * Skip populated array elements to determine if any pages need
> >        * to be allocated before disabling IRQs.
> >        */
> > -     while (nr_populated < nr_pages && page_array[nr_populated])
> > +     while (page_array && nr_populated < nr_pages && page_array[nr_pop=
ulated])
> >               nr_populated++;
> >
> >       /* No pages requested? */
> > @@ -4982,7 +4987,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >               goto out;
> >
> >       /* Already populated array? */
> > -     if (unlikely(nr_pages - nr_populated =3D=3D 0))
> > +     if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
> >               goto out;
> >
> >       /* Bulk allocator does not support memcg accounting. */
> > @@ -5064,7 +5069,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, =
int preferred_nid,
> >       while (nr_populated < nr_pages) {
> >
> >               /* Skip existing pages */
> > -             if (page_array[nr_populated]) {
> > +             if (page_array && page_array[nr_populated]) {
> >                       nr_populated++;
> >                       continue;
> >               }
> > @@ -5083,7 +5088,11 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp,=
 int preferred_nid,
> >
> >               prep_new_page(page, 0, gfp, 0);
> >               set_page_refcounted(page);
> > -             page_array[nr_populated++] =3D page;
> > +             if (page_list)
> > +                     list_add(&page->lru, page_list);
> > +             else
> > +                     page_array[nr_populated] =3D page;
> > +             nr_populated++;
> >       }
> >
> >       pcp_spin_unlock(pcp);
> > @@ -5100,8 +5109,14 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp,=
 int preferred_nid,
> >
> >  failed:
> >       page =3D __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask);
> > -     if (page)
> > -             page_array[nr_populated++] =3D page;
> > +     if (page) {
> > +             if (page_list)
> > +                     list_add(&page->lru, page_list);
> > +             else
> > +                     page_array[nr_populated] =3D page;
> > +             nr_populated++;
> > +     }
> > +
> >       goto out;
> >  }
> >  EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
>
