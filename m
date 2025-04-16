Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09674A8AECD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 05:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB610E042;
	Wed, 16 Apr 2025 03:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2GwoS93m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44010E042
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 03:58:57 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-47681dba807so104751cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744775932; x=1745380732;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFabfu1YUr8Gpuaxg0bUAkmAqFwkoAZ83WLrOAJAIgA=;
 b=2GwoS93mjwXLg4puqbaK28eJ9SRYsEpvayz3Ox1TdKWg/YzaOmdOp0GR/uO65Hrs8g
 hBVG6WbkIFN869ElsOZLkkmXzNalVHYmp2STjV0I+LBG8M1Pfdkpdq14dVdpEXCNfgMa
 1WskAiyYB9FZKkzFw4tRq2t1mn1wY5TZe18EEiA+n180xcdXuPdER7xE7tsSJ8gVv5+X
 o1OtWCKxZwJNX3DCAQTpMufaxoGSbwrHOWkOAWF7+AFXA0bUjr+QMY6kCT7Hw/wOjIDE
 fqmEI0qwzaC+Etp60bKUDd4okPJN3F0zHZhbUCLYU9Fov/8bzdNkoQ//khSm6txrOnOQ
 RwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744775932; x=1745380732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFabfu1YUr8Gpuaxg0bUAkmAqFwkoAZ83WLrOAJAIgA=;
 b=vhD7Ve+Q5tJIy1L1yGV59758WyqUnnBO6HK+sgWyGyf/gpjjRzcFUmynmAralKNrKq
 NSPr9Bk/WGo1b5uhnlu/H9KNUXv4qdMaGKZ5rUcMhNydBpylUWjoRxB5T7fcnZRHrxXD
 GRjonGX1G8l1BPptX3pq7kJNXbzVXtk5MjXwyFHTdVJ4bLoCHsvoOhy1W1511j7G7IyD
 l6b+vS78owi6Ze/pUJHeVPEozH6PSvC6QJBHwatXPiwqNc2BF1kcKpLteBDpMHzd38/E
 KJREk1vE1iDbwMDXPl7YvpkcSHC6Gwmc2peZPdBM6Fn/4ij4z6dvqcnwz8lCN2cBxHyy
 nWJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0gz2JiANc/YBpiM2FpzCLeqo78drlv2A/7VQwaYbfKDanD+7Dc5O6fnuhCO0OPWRTCHNy8TPk6E8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcnOwJ/shshL+fGNydTfLIyrbOS0e54AAhBSTZ/n4/87L3VR7m
 mClamunLKJDIRCAb/cQkPmR20r6c+4rlF8+oZaJaP3jg4UhS1ck5jezPGNh9dZs97ptsjJ3jgqi
 O1RDZks1BJifkWlCXLEuMd8+XrtXTtN5rCh32
X-Gm-Gg: ASbGncs8NwWeIo54x6fmyaCo3+jK3Ijm5vsg/F1AHfc+7Is6wDEugpQMWr35d3akWMy
 nct/bi1Nw3WTwiS6Vfpp2DNAzenm7HGzsuTU8+NFYJUZIFxZzTUD/FCWnwIMnVDh1XZUficrHr/
 ctYkCJCbbLSyMVp2KXn+RgbirFj51jX2xdmoeeESJ4lBPsZGD2XyMSspWJ
X-Google-Smtp-Source: AGHT+IGeOWFg3oYjRQF/8DYP6nBlgJnhbE7CLdjFrvnB17no8ih232I0TwalyaJOkOjEzNnrhqtwOr+YIgZVqCq+nEI=
X-Received: by 2002:ac8:7dc1:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-47ad7ad737cmr339751cf.17.1744775932099; Tue, 15 Apr 2025
 20:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
 <CGME20250415205720epcas1p4a8bbb4ff1ad221a72776694d08801368@epcas1p4.samsung.com>
 <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
 <106c301dbae77$414454a0$c3ccfde0$@samsung.com>
In-Reply-To: <106c301dbae77$414454a0$c3ccfde0$@samsung.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 15 Apr 2025 20:58:40 -0700
X-Gm-Features: ATxdqUHh7qbmy3C_xdgIq0V1oTSEWDrnu_ijLPdQUZ9_-V5qyO1ldD2Pd_jbOZU
Message-ID: <CAJDx_riYc2GRpcmf5RH8mwJQ-ehh7+JA+tQ__vX1Qsm1HJo9OQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: =?UTF-8?B?6rmA7J6s7JuQ?= <jaewon31.kim@samsung.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 baohua@kernel.org, dmitry.osipenko@collabora.com, Guangming.Cao@mediatek.com, 
 surenb@google.com, kaleshsingh@google.com
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

On Tue, Apr 15, 2025 at 7:28=E2=80=AFPM =EA=B9=80=EC=9E=AC=EC=9B=90 <jaewon=
31.kim@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: T.J. Mercier [mailto:tjmercier@google.com]
> > Sent: Wednesday, April 16, 2025 5:57 AM
> > To: Juan Yescas <jyescas@google.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>; Benjamin Gaignard
> > <benjamin.gaignard@collabora.com>; Brian Starkey <Brian.Starkey@arm.com=
>;
> > John Stultz <jstultz@google.com>; Christian K=C3=B6nig
> > <christian.koenig@amd.com>; linux-media@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> > kernel@vger.kernel.org; baohua@kernel.org; dmitry.osipenko@collabora.co=
m;
> > jaewon31.kim@samsung.com; Guangming.Cao@mediatek.com; surenb@google.com=
;
> > kaleshsingh@google.com
> > Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger p=
age
> > sizes
> >
> > On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.co=
m> wrote:
> > >
> > > This change sets the allocation orders for the different page sizes
> > > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders fo=
r
> > > large page sizes were calculated incorrectly, this caused system heap
> > > to allocate from 2% to 4% more memory on 16KiB page size kernels.
> > >
> > > This change was tested on 4k/16k page size kernels.
> > >
> > > Signed-off-by: Juan Yescas <jyescas@google.com>
> >
> > I think "dma-buf: system_heap:" would be better for the subject since t=
his
> > is specific to the system heap.
> >
> > Would you mind cleaning up the extra space on line 321 too?
> > @@ -318,7 +318,7 @@ static struct page
> > *alloc_largest_available(unsigned long size,
> >         int i;
> >
> >         for (i =3D 0; i < NUM_ORDERS; i++) {
> > -               if (size <  (PAGE_SIZE << orders[i]))
> > +               if (size < (PAGE_SIZE << orders[i]))
> >
> > With that,
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Fixes: d963ab0f15fb ("dma-buf: system_heap: Allocate higher order pages=
 if
> > available") is also probably a good idea.
> >
>
>
> Hi Juan.
>
> Yes. This system_heap change should be changed for 16KB page. Actually,
> we may need to check other drivers using page order number. I guess
> gpu drivers may be one of them.
>

Thanks Jaewon for pointing it out. We'll take a look at the GPU drivers to =
make
sure that they are using the proper page order.

> > > ---
> > >  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c
> > > b/drivers/dma-buf/heaps/system_heap.c
> > > index 26d5dc89ea16..54674c02dcb4 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP,
> > HIGH_ORDER_GFP, LOW_ORDER_GFP};
> > >   * to match with the sizes often found in IOMMUs. Using order 4 page=
s
> > instead
> > >   * of order 0 pages can significantly improve the performance of man=
y
> > IOMMUs
> > >   * by reducing TLB pressure and time spent updating page tables.
> > > + *
> > > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE.
> > > + The possible
> > > + * page sizes for ARM devices could be 4K, 16K and 64K.
> > >   */
> > > -static const unsigned int orders[] =3D {8, 4, 0};
> > > +#define ORDER_1M (20 - PAGE_SHIFT)
> > > +#define ORDER_64K (16 - PAGE_SHIFT)
> > > +#define ORDER_FOR_PAGE_SIZE (0)
> > > +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K,
> > > +ORDER_FOR_PAGE_SIZE};
> > > +
> > >  #define NUM_ORDERS ARRAY_SIZE(orders)
> > >
> > >  static struct sg_table *dup_sg_table(struct sg_table *table)
> > > --
> > > 2.49.0.604.gff1f9ca942-goog
> > >
>
>
