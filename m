Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4FAC3C8A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD90310E0B5;
	Mon, 26 May 2025 09:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RmAB08S6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133C10E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:22:00 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-400fa6eafa9so1182762b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251319; x=1748856119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53ua48kPxy8ZlB5Khz3jNgjUQRcX7ad7dpgywMRYq/U=;
 b=RmAB08S6z6cXFZJCWRKC4XiPQQiTqZk6GgXIcLkIYObVVFzchSVcoHbUCg7e0r/QM1
 NVdQUAb0fYaSp7nEvOnYTxM721hPTZ3JYx6rEkbjbauH8IoVS34SPLQuo/kGqsVXkVT7
 1kjqSy/iCnytHcLfwuihMyoQ47SBBd3Wc7n1WJnFdXfPcrnaQ9h94Ojfpr43jGSrGtbM
 iZglWLXfOGTuayloLYZC+miDO0H66mGnJhnaDow+vjHwwaezgIbXUVbWm3sGo5C2Ks1/
 ElI1I40oq9rgSd2L4alWm9ruE2FXsC1GPAhtZYD+NbphJDNtvujRAPhAwieWOUoKEcfg
 WRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251319; x=1748856119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53ua48kPxy8ZlB5Khz3jNgjUQRcX7ad7dpgywMRYq/U=;
 b=j4zmgJF16Cw/CxnRz9B/n/ypqyUZdlzL9wp9jy0zGTGzIlGG0NFVjoJkVgoiT401c7
 jLGfRT+fvmP5BM4ggdOrAc1XsJBSeufXLmPUtYLRKN0H6kBLQ2Jq9pmHCKE9KeT9m1u1
 ShgI1Ql/IrazpWnOJGPP0mBedCkXGfdEQ19D4sJRO2S+XYFi8RddRkiqZc3+ikhaFWft
 yo8grxISqqlwl1Frcq0eo0WNV8VIYJ31a8QAcHcjq168pSzN198kLRG+JoumSrFJzNHr
 T0buJUuTuzv9lt0JL5Sn2JrucnbdKX46UjBQKpVj9z6Rsv1ro9O2zqqMd9s+uPvxRkSM
 en+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULiItT62JYlS221iQKNC54IiUCqsUi65K5Xf0+nJSfgPlua2DlE4UwVynY81bKb1vMrP3bVRyGmpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx1s/Wj32xc0WZwy93uTxWeAxIq/aCZK1eRYR4kp6fdPo+kZrh
 NuPCf5IoOo1gRbhZgTM1pcE/VwAAPkqGc24Uu+o3g3IbDI6p0LmTuPhX5QrlXLMZjVJvc8AILtv
 0itYtKNIJW9Tm3Zp2hie3f5Y/hkAHTs13e2y8CPJlgw==
X-Gm-Gg: ASbGncubzEensdhUlFD3pvKiUMXw6Q4Gfb/RqR9kAEl0yP09mlcjkIyAgAzlluR2S0B
 8eCLi3jYdf23FjiSVRe/yfqSmE67OTAAaKisvf1VCtbdq/xVzh/jncAovt1kNUKsx7Di+CkPeo8
 YFo2v3Srj/khg9okDK6lkOz6oPboSipPvljA==
X-Google-Smtp-Source: AGHT+IFq5JZekHnxWc3sg2RWJXDb6uZ9CM+A22YqbDlbRKnubyEazTYamiLb0ugXmmhMYRQ6G3WVBNUuNH4AYqeD19U=
X-Received: by 2002:a05:6808:3c44:b0:404:e2fe:ee9b with SMTP id
 5614622812f47-406467f6e09mr4084598b6e.15.1748251319604; Mon, 26 May 2025
 02:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org>
 <aDQWt5Ck1Bo01Z_4@sumit-X1>
In-Reply-To: <aDQWt5Ck1Bo01Z_4@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 26 May 2025 11:21:47 +0200
X-Gm-Features: AX0GCFvNzG6NkiJ-eN9bCOPUdD2632rQhBqnsSHNlg_n4KEoEPp6J0_ZkxvvwnI
Message-ID: <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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

On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > identify it as DMA memory. The allocated memory will later be lent to
> > the TEE to be used as protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h |  5 +++
> >  2 files changed, 77 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e1ed52ee0a16..92a6a35e1a1e 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -5,6 +5,8 @@
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-buf.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/highmem.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -13,9 +15,14 @@
> >  #include <linux/tee_core.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +struct tee_shm_dma_mem {
> > +     struct tee_shm shm;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >       size_t n;
> > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >       struct tee_shm *parent_shm =3D NULL;
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > +             struct tee_shm_dma_mem *dma_mem;
> > +
> > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem, shm=
);
> > +             p =3D dma_mem;
> > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
>
> Although the kernel bot already found a randconfig issue, it looks like
> we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
>
> Also, I was thinking if we should rather add a new TEE subsystem
> specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used to
> select whatever dependency is needed as well as act as a gating Kconfig
> for relevant features.

You mean something like this?

--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -13,6 +13,14 @@ menuconfig TEE

 if TEE

+config TEE_DMABUF_HEAPS
+       bool
+       depends on HAS_DMA && DMABUF_HEAPS
+
+config TEE_STATIC_PROTMEM_POOL
+       bool
+       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+

Cheers,
Jens

>
> -Sumit
>
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -306,6 +320,62 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +/**
> > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory obje=
ct
> > + * @ctx:     Context that allocates the shared memory
> > + * @page_count:      Number of pages
> > + *
> > + * The allocated memory is expected to be lent (made inaccessible to t=
he
> > + * kernel) to the TEE while it's used and returned (accessible to the
> > + * kernel again) before it's freed.
> > + *
> > + * This function should normally only be used internally in the TEE
> > + * drivers.
> > + *
> > + * @returns a pointer to 'struct tee_shm'
> > + */
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct tee_shm_dma_mem *dma_mem;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     dma_mem =3D kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > +     if (!dma_mem)
> > +             goto err_free_pages;
> > +
> > +     refcount_set(&dma_mem->shm.refcount, 1);
> > +     dma_mem->shm.ctx =3D ctx;
> > +     dma_mem->shm.paddr =3D page_to_phys(page);
> > +     dma_mem->dma_addr =3D dma_addr;
> > +     dma_mem->page =3D page;
> > +     dma_mem->shm.size =3D page_count * PAGE_SIZE;
> > +     dma_mem->shm.flags =3D TEE_SHM_DMA_MEM;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return &dma_mem->shm;
> > +
> > +err_free_pages:
> > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_ad=
dr,
> > +                    DMA_BIDIRECTIONAL);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 02c07f661349..925690e1020b 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,8 @@
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated with =
*/
> > +                                     /* dma_alloc_pages() */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >   */
> >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t=
 size);
> >
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count);
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > --
> > 2.43.0
> >
