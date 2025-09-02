Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B50B40C01
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A710E7FE;
	Tue,  2 Sep 2025 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="u4WtRMmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B1A10E801
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:27:14 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4b350971a2eso23831cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756834033; x=1757438833;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtd7VHBua4ceoiPNxCebsTr+W/5i6xNmrYZ+hl6cZwE=;
 b=u4WtRMmMURl1+vWuBcmALj9Nh3sjwSOW0Aq8hTpxjGoZAoLwFIswNek/wsbVyixkVq
 359pSukSzLDTb3NCmsG0mkiWTfxIr73v3kxiZ0POZGZE5onR48kIoIyR3GEjGrPRR2cW
 9fWrAFSsrydL4a3TT4/zt0blRbUBJBQ70Ih+ATJEO+az6qCtFKtCt/FS3ImqUQGmWqCx
 El7a0Nly2iuWl4fFyS0FPatyJdP0HlwTW2wdFIt+I53zA66cLyshXJFKZMHMqsWNTW20
 Zt1F1OJGzoxs7gco5Wuy6gOB45RQjaydLR6GiMQxlGTIUJ3NmvtmkUkgdJpHTHa6Euf0
 1Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756834033; x=1757438833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtd7VHBua4ceoiPNxCebsTr+W/5i6xNmrYZ+hl6cZwE=;
 b=tnPapPNWqerlW+RdDt31Y1r11uhsCtgudy4/pkCMqN6YLWBRPGelMxvY8howAoUQMF
 E4KA967qtRrWZvtX7Qe73L0UR16wgqmOUhm6E7u4SWBVuy29iZO+Fy1r58/AzW6gPaNO
 cHOz8vEFiu+Mimc5dr+0315tMu/FyfMX+94QWwom7ZwbxHuFpNMsvrN/YguCYWXXNXFU
 RmTGVKK5wDETqojfJoBCDUyUeNb/vHAjsVYZYw8YdnIVU52Xe//qPn3NiDwgxiP3TQR3
 XgnL9y5UUbu7BdxMxzb3CmTLe4+GQrhUmn2OzUNBrTxP9J6LQmq/DPQ0ODyfR7uzVgLM
 bFiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX2gW/3FXWAZLQPcPqZ7CORjxH+19qO0cSRf1xGKG0Uk06DdrQBod83EUCaEHhJRejqAKT8nyS+JE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC4AQIHSDNI4PZiCo2b3Tel7JWOYu8NQSqWRH8zYPFz3m29ib1
 JPIOU0JqxtWt6qXov2th2VWzhHhhUJSZ9Gdk1ZjLdKDjSEaKbV57I9P8JEbFDYwYXD1xjWn41yz
 sq2kRueWtfeKP9U7aEcSMR4Ri0gLF4cunTC1YHNt4
X-Gm-Gg: ASbGncuUNSQcJ8EGjXr4lbofSQibBmhrwdvqEaJvgwcmQwCG60nzM12B7N8tKvrHfky
 mSnJM6qTw4nF7MmiUh+fGduGQEijc1eP1DzgCF2rg/V1HWHOCdJx5hz2uOwSL5+vBaN9h4c/xZh
 /hSNNai/oIa3ljlPqLbPUWbp/CxD0MSEofIlmHnUPPBx/q1tY1XYIw0XtB7lh2x7PphqvkHDVoo
 MVrgVd7EQ/nw74sXBxJyQ==
X-Google-Smtp-Source: AGHT+IEC6y1tRdSi2UTqmtXyZZzRrZPY9SLNKXOIO98qFYX+T6uH0H7eN0bzXqp5gDwmp+jCKoimReIKubvN32ot1YM=
X-Received: by 2002:a05:622a:609:b0:4b2:9d13:e973 with SMTP id
 d75a77b69052e-4b48dc6d116mr536321cf.0.1756834032561; Tue, 02 Sep 2025
 10:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
In-Reply-To: <20250902154630.4032984-4-thierry.reding@gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 2 Sep 2025 10:27:01 -0700
X-Gm-Features: Ac12FXxFN3O8AlGVbL0n79ufqlqXNkpXNtbyObY0H0t07exhvNnrkMb8tnUsJCI
Message-ID: <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
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

On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> There is no technical reason why there should be a limited number of CMA
> regions, so extract some code into helpers and use them to create extra
> functions (cma_create() and cma_free()) that allow creating and freeing,
> respectively, CMA regions dynamically at runtime.
>
> Note that these dynamically created CMA areas are treated specially and
> do not contribute to the number of total CMA pages so that this count
> still only applies to the fixed number of CMA areas.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/linux/cma.h | 16 ++++++++
>  mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-----------
>  2 files changed, 83 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 62d9c1cf6326..f1e20642198a 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -61,6 +61,10 @@ extern void cma_reserve_pages_on_error(struct cma *cma=
);
>  struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
>  bool cma_free_folio(struct cma *cma, const struct folio *folio);
>  bool cma_validate_zones(struct cma *cma);
> +
> +struct cma *cma_create(phys_addr_t base, phys_addr_t size,
> +                      unsigned int order_per_bit, const char *name);
> +void cma_free(struct cma *cma);
>  #else
>  static inline struct folio *cma_alloc_folio(struct cma *cma, int order, =
gfp_t gfp)
>  {
> @@ -71,10 +75,22 @@ static inline bool cma_free_folio(struct cma *cma, co=
nst struct folio *folio)
>  {
>         return false;
>  }
> +
>  static inline bool cma_validate_zones(struct cma *cma)
>  {
>         return false;
>  }
> +
> +static inline struct cma *cma_create(phys_addr_t base, phys_addr_t size,
> +                                    unsigned int order_per_bit,
> +                                    const char *name)
> +{
> +       return NULL;
> +}
> +
> +static inline void cma_free(struct cma *cma)
> +{
> +}
>  #endif
>
>  #endif
> diff --git a/mm/cma.c b/mm/cma.c
> index e56ec64d0567..8149227d319f 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -214,6 +214,18 @@ void __init cma_reserve_pages_on_error(struct cma *c=
ma)
>         set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
>  }
>
> +static void __init cma_init_area(struct cma *cma, const char *name,
> +                                phys_addr_t size, unsigned int order_per=
_bit)
> +{
> +       if (name)
> +               snprintf(cma->name, CMA_MAX_NAME, "%s", name);
> +       else
> +               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +
> +       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> +       cma->order_per_bit =3D order_per_bit;
> +}
> +
>  static int __init cma_new_area(const char *name, phys_addr_t size,
>                                unsigned int order_per_bit,
>                                struct cma **res_cma)
> @@ -232,13 +244,8 @@ static int __init cma_new_area(const char *name, phy=
s_addr_t size,
>         cma =3D &cma_areas[cma_area_count];
>         cma_area_count++;
>
> -       if (name)
> -               snprintf(cma->name, CMA_MAX_NAME, "%s", name);
> -       else
> -               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +       cma_init_area(cma, name, size, order_per_bit);
>
> -       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> -       cma->order_per_bit =3D order_per_bit;
>         *res_cma =3D cma;
>         totalcma_pages +=3D cma->count;
>
> @@ -251,6 +258,27 @@ static void __init cma_drop_area(struct cma *cma)
>         cma_area_count--;
>  }
>
> +static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
> +{
> +       if (!size || !memblock_is_region_reserved(base, size))
> +               return -EINVAL;
> +
> +       /*
> +        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> +        * needs pageblock_order to be initialized. Let's enforce it.
> +        */
> +       if (!pageblock_order) {
> +               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> +               return -EINVAL;
> +       }
> +
> +       /* ensure minimal alignment required by mm core */
> +       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  /**
>   * cma_init_reserved_mem() - create custom contiguous area from reserved=
 memory
>   * @base: Base address of the reserved area
> @@ -271,22 +299,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, p=
hys_addr_t size,
>         struct cma *cma;
>         int ret;
>
> -       /* Sanity checks */
> -       if (!size || !memblock_is_region_reserved(base, size))
> -               return -EINVAL;
> -
> -       /*
> -        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> -        * needs pageblock_order to be initialized. Let's enforce it.
> -        */
> -       if (!pageblock_order) {
> -               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> -               return -EINVAL;
> -       }
> -
> -       /* ensure minimal alignment required by mm core */
> -       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> -               return -EINVAL;
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ret;
>
>         ret =3D cma_new_area(name, size, order_per_bit, &cma);
>         if (ret !=3D 0)
> @@ -1112,3 +1127,33 @@ void __init *cma_reserve_early(struct cma *cma, un=
signed long size)
>
>         return ret;
>  }
> +
> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
> +                             unsigned int order_per_bit, const char *nam=
e)
> +{
> +       struct cma *cma;
> +       int ret;
> +
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +
> +       cma =3D kzalloc(sizeof(*cma), GFP_KERNEL);
> +       if (!cma)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cma_init_area(cma, name, size, order_per_bit);
> +       cma->ranges[0].base_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].early_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].count =3D cma->count;
> +       cma->nranges =3D 1;
> +
> +       cma_activate_area(cma);
> +
> +       return cma;
> +}
> +
> +void cma_free(struct cma *cma)
> +{
> +       kfree(cma);
> +}
> --
> 2.50.0


I agree that supporting dynamic CMA areas would be good. However, by
doing it like this, these CMA areas are invisible to the rest of the
system. E.g. cma_for_each_area() does not know about them. It seems a
bit inconsistent that there will now be some areas that are globally
known, and some that are not.

I am being somewhat selfish here, as I have some WIP code that needs
the global list :-) But I think the inconsistency is a more general
point than just what I want (and the s390 code does use
cma_for_each_area()). Maybe you could keep maintaining a global
structure containing all areas? What do you think are the chances of
running out of the global count of areas?

Also, you say that "these are treated specially and do not contribute
to the number of total CMA pages". But, if I'm reading this right, you
do call cma_activate_area(), which will do
init_cma_reserved_pageblock() for each pageblock in it. Which adjusts
the CMA counters for the zone they are in. But your change does not
adjust totalcma_pages for dynamically created areas. That seems
inconsistent, too.

- Frank
