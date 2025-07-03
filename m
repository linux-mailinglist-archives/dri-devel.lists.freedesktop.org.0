Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0DAF6B2B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B2D10E166;
	Thu,  3 Jul 2025 07:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qxgvqPhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E1A10E166
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:13:41 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-610d87553b6so3089145eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 00:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751526820; x=1752131620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dr0G0HPuVKXln/Mnb/5UY0SQE5MginO3Nb336jQ6YM=;
 b=qxgvqPhHhUiMxgjKc+0cVfoHYnuXmlAMpEjRT/N2OhEZkQRqKwTYW16EklC1Uwp1O1
 PL7AuzZVGCplkvcvv7F4bVA3mGZX5KNQc2JqJn1yo/Ek5pfUi2LWKdElALb/vx9/b2Cb
 rlMsQQ9j0IhT/Sxo6pqnmHb5s1VpbbO+AQT0M2+uLA25ZQ7hmDv/YNfgB8S41zru/f25
 9BrxA9JTx0ML2rEfFYOOh7YfQO34lrDotk7vjueJLcamfDpmnZXdGlsNI3+5ecMkhoPM
 g7nC6GDWyR3IVwoci+TdnGFYHzY/zSjNK8Fb/SH60a2SjlQYYNw89fTs9apDQPmsKJjT
 PCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751526820; x=1752131620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dr0G0HPuVKXln/Mnb/5UY0SQE5MginO3Nb336jQ6YM=;
 b=Y2cMjl0b3da/ucCxkAlRe+KnbMBI7hGOrKxmhU1QbW9ckQ5P3amhUn4OhpNe/wdAC3
 oh4RDFOyZ2lYLHUj/8qaNOHVI1GE6O1D0S2arHKzc28qFM4wmgdK7/5R2SJxR5grQqVe
 xOYEX4g//2pRSgQEdviNGHhwQsMORgvMROSWZoieRf4KW+u1wJYZderk79vpgzdTWSMx
 FPndtXiMsE54dFPP0ycv9pqXuR5pQlGMn3dSqu73+BpQSrd/N23FAXs5lOMBL54rYs2M
 Gp3vN+n1qPR85UBDS1J05//Y4r8sR7NklQ0j5ueioghAC+dnKscbEwZTFQvJHdIaAlpc
 wIhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjW3kOhjt0F5dPQQOrzGZwMPuKqYJE1PP3NIOW7x1psdDuyQ5ENAcRoemtbtYPbLYK5jWF3x3JVxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfh+GnleOvb/BQUPTa9lZvAyhtu9o49TzM4D+p3gjIRx0Om38O
 y+vBZRe3xh5lpy7dJxf7LA4Iyu7pwhHqC2nd9U4LTR9dhQSNkLIZ8ELrFsKpWFWtZGS++2BV0ra
 CpOfX6J4rVsfn2OnbtSnTx68UjloTmTSiurBa/GhsaQ==
X-Gm-Gg: ASbGncuSiN3ftFn0cW8yMQ42HrkV3AvQp7AGC6fXz2nqZwEahfE4avCzGIAxVrgfZgt
 nnPMbH7gmHRV2sqtpdFK5yt5bVz927g6ddC35hvfuuHq2m3xC+sfpUugbp6aoljb9kWj1Ovlpiy
 OHrH1NhGTIuAQek2aeecZH4I87gGdE2tFe9ekygdQXYh/x
X-Google-Smtp-Source: AGHT+IGzumX+zMN3Zsc0frMnoZjTbrKq52LE81xJcdL6f0gu7EmyIA9p7bwSTX/LNs7SEM2NnBBBJP0kpnIk//vZz6Q=
X-Received: by 2002:a05:6820:198d:b0:611:e30a:fa1c with SMTP id
 006d021491bc7-61200f7034bmr3538676eaf.1.1751526820429; Thu, 03 Jul 2025
 00:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org>
 <aFFSWDiVsxA1CbCX@sumit-X1>
 <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
 <aGYi8QkgI3WyeN59@sumit-X1>
In-Reply-To: <aGYi8QkgI3WyeN59@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 3 Jul 2025 09:13:28 +0200
X-Gm-Features: Ac12FXzyoTs9Jn3XWoE-_WRgcRKkI1fV8anRZvH7Atzw9NHwCMp1fhg-J6G_50I
Message-ID: <CAHUa44EMtaSw9uMz5WNSMXSfYXwQ-1TwFjd=R1ZfCo02ir2cjw@mail.gmail.com>
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

On Thu, Jul 3, 2025 at 8:28=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Wed, Jun 18, 2025 at 09:03:00AM +0200, Jens Wiklander wrote:
> > On Tue, Jun 17, 2025 at 1:32=E2=80=AFPM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 85 ++++++++++++++++++++++++++++++++++++=
+++-
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 88 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e63095e84644..60b0f3932cee 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -5,6 +5,8 @@
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -13,9 +15,14 @@
> > > >  #include <linux/tee_core.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/uio.h>
> > > > -#include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +struct tee_shm_dma_mem {
> > > > +     struct tee_shm shm;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >  {
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > >
> > > nit: this config check can be merged into the above if check.
> >
> > No, because dma_free_pages() is only defined if
> > CONFIG_TEE_DMABUF_HEAPS is enabled.
>
> It looks like you misunderstood my above comment, I rather meant:
>
>         if (IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS) &&
>             (shm->flags & TEE_SHM_DMA_MEM))

That depends on the compiler optimizing away the call to
dma_free_pages() if CONFIG_TEE_DMABUF_HEAPS isn't defined. This is
normally the case, but if you compile for debugging, you may get
unresolved symbols.

Cheers,
Jens

>
> -Sumit
>
> >
> > >
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > > > +#endif
> > > > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> > >
> > > Do we need a similar config check for this flag too?
> >
> > No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are=
 defined.
> >
> > Cheers,
> > Jens
> >
> >
> > >
> > > With these addressed, feel free to add:
> > >
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > -Sumit
> > >
> > > >               struct tee_shm_dmabuf_ref *ref;
> > > >
> > > >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, =
shm);
> > > > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct =
tee_context *ctx, size_t size)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > > >
> > > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > > > +/**
> > > > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory =
object
> > > > + * @ctx:     Context that allocates the shared memory
> > > > + * @page_count:      Number of pages
> > > > + *
> > > > + * The allocated memory is expected to be lent (made inaccessible =
to the
> > > > + * kernel) to the TEE while it's used and returned (accessible to =
the
> > > > + * kernel again) before it's freed.
> > > > + *
> > > > + * This function should normally only be used internally in the TE=
E
> > > > + * drivers.
> > > > + *
> > > > + * @returns a pointer to 'struct tee_shm'
> > > > + */
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count)
> > > > +{
> > > > +     struct tee_device *teedev =3D ctx->teedev;
> > > > +     struct tee_shm_dma_mem *dma_mem;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +
> > > > +     if (!tee_device_get(teedev))
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     page =3D dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE=
,
> > > > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERN=
EL);
> > > > +     if (!page)
> > > > +             goto err_put_teedev;
> > > > +
> > > > +     dma_mem =3D kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > > > +     if (!dma_mem)
> > > > +             goto err_free_pages;
> > > > +
> > > > +     refcount_set(&dma_mem->shm.refcount, 1);
> > > > +     dma_mem->shm.ctx =3D ctx;
> > > > +     dma_mem->shm.paddr =3D page_to_phys(page);
> > > > +     dma_mem->dma_addr =3D dma_addr;
> > > > +     dma_mem->page =3D page;
> > > > +     dma_mem->shm.size =3D page_count * PAGE_SIZE;
> > > > +     dma_mem->shm.flags =3D TEE_SHM_DMA_MEM;
> > > > +
> > > > +     teedev_ctx_get(ctx);
> > > > +
> > > > +     return &dma_mem->shm;
> > > > +
> > > > +err_free_pages:
> > > > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dm=
a_addr,
> > > > +                    DMA_BIDIRECTIONAL);
> > > > +err_put_teedev:
> > > > +     tee_device_put(teedev);
> > > > +
> > > > +     return ERR_PTR(-ENOMEM);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > > +#else
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count)
> > > > +{
> > > > +     return ERR_PTR(-EINVAL);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > > +#endif
> > > > +
> > > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, siz=
e_t align,
> > > >                            int (*shm_register)(struct tee_context *=
ctx,
> > > >                                                struct tee_shm *shm,
> > > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > > index f17710196c4c..e46a53e753af 100644
> > > > --- a/include/linux/tee_core.h
> > > > +++ b/include/linux/tee_core.h
> > > > @@ -29,6 +29,8 @@
> > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool=
 */
> > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driv=
er */
> > > >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-bu=
f handle */
> > > > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated w=
ith */
> > > > +                                     /* dma_alloc_pages() */
> > > >
> > > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev=
);
> > > >   */
> > > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, si=
ze_t size);
> > > >
> > > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > > +                                   size_t page_count);
> > > > +
> > > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, siz=
e_t align,
> > > >                            int (*shm_register)(struct tee_context *=
ctx,
> > > >                                                struct tee_shm *shm,
> > > > --
> > > > 2.43.0
> > > >
