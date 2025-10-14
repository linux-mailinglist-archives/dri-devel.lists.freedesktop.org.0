Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D75BDAA41
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121F010E665;
	Tue, 14 Oct 2025 16:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZAbnWyVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1B10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:44:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-58120c35d47so994622e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760445862; x=1761050662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oo6cb/h2//KSAhz8PhrLQfUB6XAbYAkngZFzEqMMVw=;
 b=ZAbnWyVGU8MJzrA9E7/WiD9PtUS+VKuWcIeBcEYN+RApG01hLqoZWgGnWk6fgM3nEh
 VHnNqAnByZ//SoY2mMhhqkbH7wMp2udqtPMIu1flvaB7KQ95R3RYlGCtjQo1jhuHd+g7
 wfqqE87VWcei0y/V4fcMOm3Ypu1Xx/UZ8vhAVLJjmpqcQp8w7r9sqwnXPsrjTy+ihpYf
 a4D9BRB8EHFtuxTHObWXw6SF1Qb7PV4rBfmN+RD2p9VUP01zDPIZ9QyCHy5uTjIukXue
 hD9kSUoiMNwJg+TpD4IaziIyDjghtxn+N4arzlLqbTTe6C1DB5mfe1RCCmmFqv3haMeZ
 zzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445862; x=1761050662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oo6cb/h2//KSAhz8PhrLQfUB6XAbYAkngZFzEqMMVw=;
 b=VqWAdr2JwX4yOnh0bvPQ//MsLmxU5yFD8rJ8JwyFrAizJmE1Mbbj3iwptNf9eTS19H
 prU/xY2an/0fABugr2mlUZwz+6T3KwLlhsc/x799b9gfN0N5BiTDEEgYghH6kqj4WlHz
 YW+OgFutsGLvktq1gtjaGewRHcX3qJHbkBwtPZDf0l6aC69KM4/4W+1vbTHGu9Epgi2a
 wnIMHrwyGAQz9tOnwghFjQe/dr3+0MbL49fiXuuozHa+C4nQtt0gs0ksE5/bLCjFJl0O
 2ZYUN2QdC6VQShuASCzyZiB91qp1M3kmDymDel17WtI32tY7jdwYEyBZVB5/br27Dz8j
 t+1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHx3iCPRSCMF6p5Tos+hq2PjziQN1qY73PfKuAV2s18q+XVV7zH9Rkaj/s7Ss4VfVUCilrns3lwAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtNOvUckxki7ev0Jr1dbKFsI8wcxEt1u3C3ccM6kQi0RzeLd6D
 FQ/JQAI+Rm/nqROKi5y2UsVp1LCK+IY47e8m2M6WJp+6/KyiuB+Be/NiUsL+AQTZetMXmyCVzGd
 4nFh4hzohDJQd9I2XjTWr9P7UXIoYLlU=
X-Gm-Gg: ASbGncschqb3LKLlzZQy2zRoKA0745sgxn0rKmtR2nXvKLO3yXW/Qt4/4SrmbBV9woo
 PGSS8pxSwM9WD5gC2kHPWI458FR7uOxbssxbyEkRLtZTsBLC1fbhD9MBJ1DWFjao6jHgpdwFfjK
 IKm6oVawivQ6D0daFPeyB+jExkt5KG5psqhTwADxo5VykanttBNVJTS46z4iPACw2Et4EQTu8JD
 yyCRMoFFe1a5eaQcA74kZQtZCggLyKMkMvx37OlJFv8S9P8
X-Google-Smtp-Source: AGHT+IE6ZX1VGaVslNv8ZPr/UKniSljm0zQJqyI+Plq3kYLvNFNlsMtuo7K/t2++yV4p4PZdglaVsxwNfABC8vF2f6w=
X-Received: by 2002:a2e:beab:0:b0:36b:d9d2:7352 with SMTP id
 38308e7fff4ca-37609cebacdmr36927351fa.1.1760445862122; Tue, 14 Oct 2025
 05:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
In-Reply-To: <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Tue, 14 Oct 2025 20:44:10 +0800
X-Gm-Features: AS18NWC91XO6vcqGgvJynO5q8vzT5cvKYOwtu3JK2ou4LVmpJ0_YPTlGMwJ6WAA
Message-ID: <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
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

On Tue, Oct 14, 2025 at 7:59=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 14.10.25 10:32, zhaoyang.huang wrote:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > The size of once dma-buf allocation could be dozens MB or much more
> > which introduce a loop of allocating several thousands of order-0 pages=
.
> > Furthermore, the concurrent allocation could have dma-buf allocation en=
ter
> > direct-reclaim during the loop. This commit would like to eliminate the
> > above two affections by introducing alloc_pages_bulk_list in dma-buf's
> > order-0 allocation. This patch is proved to be conditionally helpful
> > in 18MB allocation as decreasing the time from 24604us to 6555us and no
> > harm when bulk allocation can't be done(fallback to single page
> > allocation)
>
> Well that sounds like an absolutely horrible idea.
>
> See the handling of allocating only from specific order is *exactly* ther=
e to avoid the behavior of bulk allocation.
>
> What you seem to do with this patch here is to add on top of the behavior=
 to avoid allocating large chunks from the buddy the behavior to allocate l=
arge chunks from the buddy because that is faster.
emm, this patch doesn't change order-8 and order-4's allocation
behaviour but just to replace the loop of order-0 allocations into
once bulk allocation in the fallback way. What is your concern about
this?
>
> So this change here doesn't looks like it will fly very high. Please expl=
ain what you're actually trying to do, just optimize allocation time?
>
> Regards,
> Christian.
>
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 36 +++++++++++++++++++----------
> >  1 file changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index bbe7881f1360..71b028c63bd8 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -300,8 +300,8 @@ static const struct dma_buf_ops system_heap_buf_ops=
 =3D {
> >       .release =3D system_heap_dma_buf_release,
> >  };
> >
> > -static struct page *alloc_largest_available(unsigned long size,
> > -                                         unsigned int max_order)
> > +static void alloc_largest_available(unsigned long size,
> > +                 unsigned int max_order, unsigned int *num_pages, stru=
ct list_head *list)
> >  {
> >       struct page *page;
> >       int i;
> > @@ -312,12 +312,19 @@ static struct page *alloc_largest_available(unsig=
ned long size,
> >               if (max_order < orders[i])
> >                       continue;
> >
> > -             page =3D alloc_pages(order_flags[i], orders[i]);
> > -             if (!page)
> > +             if (orders[i]) {
> > +                     page =3D alloc_pages(order_flags[i], orders[i]);
> > +                     if (page) {
> > +                             list_add(&page->lru, list);
> > +                             *num_pages =3D 1;
> > +                     }
> > +             } else
> > +                     *num_pages =3D alloc_pages_bulk_list(LOW_ORDER_GF=
P, size / PAGE_SIZE, list);
> > +
> > +             if (list_empty(list))
> >                       continue;
> > -             return page;
> > +             return;
> >       }
> > -     return NULL;
> >  }
> >
> >  static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> > @@ -335,6 +342,8 @@ static struct dma_buf *system_heap_allocate(struct =
dma_heap *heap,
> >       struct list_head pages;
> >       struct page *page, *tmp_page;
> >       int i, ret =3D -ENOMEM;
> > +     unsigned int num_pages;
> > +     LIST_HEAD(head);
> >
> >       buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> >       if (!buffer)
> > @@ -348,6 +357,8 @@ static struct dma_buf *system_heap_allocate(struct =
dma_heap *heap,
> >       INIT_LIST_HEAD(&pages);
> >       i =3D 0;
> >       while (size_remaining > 0) {
> > +             num_pages =3D 0;
> > +             INIT_LIST_HEAD(&head);
> >               /*
> >                * Avoid trying to allocate memory if the process
> >                * has been killed by SIGKILL
> > @@ -357,14 +368,15 @@ static struct dma_buf *system_heap_allocate(struc=
t dma_heap *heap,
> >                       goto free_buffer;
> >               }
> >
> > -             page =3D alloc_largest_available(size_remaining, max_orde=
r);
> > -             if (!page)
> > +             alloc_largest_available(size_remaining, max_order, &num_p=
ages, &head);
> > +             if (!num_pages)
> >                       goto free_buffer;
> >
> > -             list_add_tail(&page->lru, &pages);
> > -             size_remaining -=3D page_size(page);
> > -             max_order =3D compound_order(page);
> > -             i++;
> > +             list_splice_tail(&head, &pages);
> > +             max_order =3D folio_order(lru_to_folio(&head));
> > +             size_remaining -=3D PAGE_SIZE * (num_pages << max_order);
> > +             i +=3D num_pages;
> > +
> >       }
> >
> >       table =3D &buffer->sg_table;
>
