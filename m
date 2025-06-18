Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A896ADE429
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A510E0F6;
	Wed, 18 Jun 2025 07:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XwrIIDrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC7D10E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:03:13 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7353779b10dso4177191a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750230192; x=1750834992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
 b=XwrIIDrbbAW2mZpNr6xMFNmrWLPKwjYjcGVzbB+ycpDgSHGBb094L5nIhlcMofQWZW
 HK07jLDaIfb1QNCfPmmDioLi+DyOr1AV28egnMvooUV9dnMOuWBhoylm9cbEYGSYz4oh
 Bqwahew34a5GP0J+EEAvBPHwSHXTMyDMLZ+kiCKCp0uk6x8tS2BfEHOTlnpEBFKsY00l
 LxAZi2IglNVOIqGtvv5hJpBTdxV4vYyi5iaEKVSxFx5iNHN2S49KPqymNduME2vVPeUE
 9tVPcRCxUsJIt8UBoQLAzu5mSsVcgTT/YXE474H0ZFDugtNjk3JclK1vOeooGgpVgZKM
 zTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750230192; x=1750834992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
 b=FBQnRJpY9Kx4cGd5bqwI3bhSO/hn4ApKUNFNaur2m13UkInxh/ITeKItcRPl/dKiXl
 AqXFPiuT/L2ENOddj0COSgc4HcROfTYo4LV2y9Cy8c/Uqikyd3rLe2q+tMBVpXuqMWf/
 lPiD3h4hSrYLVeOOi7CM/kYZu3+kljxfmj5PjVPoB8ZDCirCVVNbw/e2rxV1qEdMYB0p
 M/wwHNCSJ4NNRb45R5ZPksP1mmzfXpPTzzD1/BiDZWClYPW5x98tUN5QfaPbbKUKAfxn
 jYM5iw5tJJcKyATv2dAJKT9csZnDxAmHKLEaraeT+P6bQUHP62RZUhmn6NCQVlOnTOgx
 1MBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQVbiKqbQHoEVkny90Whj8F1MMIeB9nWXsGGuN/QZUBFaneG6tZfe8saN/B980p1mkXWDnOjAXuyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySJfPtHVkUzeTphepI54rXdcHFw4FHZ1DOC8O5BKB3BUZNnuTX
 7sLIYDQZ8x0lZ/vX8sVb+8BH5WavSKoGhFEWbn4qmzBHm+uZrk6X2WYxZlLBjI37uJ/2rGJTDWY
 zWXXERDPBwfupw0Jf9Gul5evNCDKYlnqO/g4whlSi9A==
X-Gm-Gg: ASbGnct1x1hUHKm9QUf0/hUwFZLDd/WdOe3i1uL5d85VZDuFVIvGtQMBVwO+BDx7euo
 YnDyJehTRiZpOrj8RVT48fdwewXiopSR3BBTaPrctZUzcBEzMPZZPGQxso6kTTrMM52jUBZ/7+u
 qdLDzvMvAjbICQZhLLt5ovvHe8gvcpSbAtsGyss6R/f3M=
X-Google-Smtp-Source: AGHT+IEYIeVC/jTVYCSxf/dGhqeDr1KHxYiJwAAX/5hmURj3RcHrh9D5I5KutnxKn6tUumkHdJ/1wa42+SytUsf+26I=
X-Received: by 2002:a05:6830:40c4:b0:72b:946e:ccc7 with SMTP id
 46e09a7af769-73a36091cbemr11291390a34.0.1750230191671; Wed, 18 Jun 2025
 00:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org>
 <aFFSWDiVsxA1CbCX@sumit-X1>
In-Reply-To: <aFFSWDiVsxA1CbCX@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 18 Jun 2025 09:03:00 +0200
X-Gm-Features: AX0GCFvrA5yXpBPMnqH5JcYKZyhNKjMM65-tKAnroIXskFJp4M6WI4XH2u_9JeE
Message-ID: <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
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

On Tue, Jun 17, 2025 at 1:32=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > identify it as DMA memory. The allocated memory will later be lent to
> > the TEE to be used as protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_core.h |  5 +++
> >  2 files changed, 88 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e63095e84644..60b0f3932cee 100644
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
> > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >  {
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
>
> nit: this config check can be merged into the above if check.

No, because dma_free_pages() is only defined if
CONFIG_TEE_DMABUF_HEAPS is enabled.

>
> > +             struct tee_shm_dma_mem *dma_mem;
> > +
> > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem, shm=
);
> > +             p =3D dma_mem;
> > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
>
> Do we need a similar config check for this flag too?

No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are def=
ined.

Cheers,
Jens


>
> With these addressed, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> -Sumit
>
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
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
> > +#else
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     return ERR_PTR(-EINVAL);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +#endif
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index f17710196c4c..e46a53e753af 100644
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
