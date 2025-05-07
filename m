Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73110AAE6BB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0DB10E85D;
	Wed,  7 May 2025 16:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rk7VNUGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A4D10E063
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:32:32 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3f9832f798aso93033b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746635550; x=1747240350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
 b=rk7VNUGfh2HlFHD+BcTqiDqNbCFJuIaUBR6cG4Mk0Z3zKDgbo9h++3yMW2XMxKT2AU
 73HTyXbt+3M8L5is0mArBFkYtNz+Kjhh57HelJbpUUJn4f5zj4brxXsTjks9oroCUXHw
 MnAzsS1ELMCD2PMlIYY3SMVYKYCwODzFClvdDlZPI8Ru0GrTAcgS+BEOW6urEgYRkbEo
 Yp3TbCfCORNhupFMITmH0pODmpz0jxk94+//J0sI9S1E5cbzMk1tkny+OjChwmlREDPQ
 jSHWO96Kfl2MUg/OecfFylmJGsrThROfpXM0rxXaTU3H/JyE1OgBVydHRf9+FDr5O3RJ
 xm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746635550; x=1747240350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
 b=PPwWgBdjYDSS+ziQBe2EuaXdVcF2JeA3lzuxI0LwOUcsokSdM1sRVoHaYjZSDO2fzs
 aW1wYnxY3KWKS103BjPmfZ+cURsLlzV/cHvERYcGKobVCdBF4051Wcokwx6xkT0JqKbs
 4mWvuimWlfWrH/UK+X9DnO4XCDo2MhVBdW2wvRHr4P6OV4VtEeIBkPP6DEjjyeaiCNVD
 G3+YZd5elOXahRnLkjqyRInNMmKrpkL3WKlxmuRzarLnYHEvBHqPBiiu/MPdBdQc7iyT
 JLn7zjjLR2DU8DIVAU8qp6TkOd8LGWvL2SvQBxtmpOK5isewxicQS+IG2ssUgAhmNByF
 zNkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW30ZVvk20og9TBvdRjQg3XBC5eGgFMfc5dMGwEqI0jaDVjK3ZDyb2L0aOv40v37OfQskgyhXGgD4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0WawQDrflDVFkCAK6LlMwjI1RNfG58gENsZOxTH/8bgeFtnUG
 LqAj4k1k6hpGMCkuabyogwLWIL6czUjS8oDzWddEFHDsH8VXE+7ERVALztDdxxmz9QL2P2yqCfw
 l6GX5Nv/oTK3q3zfSlug9ArO9xlve4IXo1yU//TCAQIKVzqzfe5E=
X-Gm-Gg: ASbGncuB1naFPdbBMGhkjJuDwKEVuLHPCnj3rctvly1N/yaDvi6/W7hLNPV/PbUcxHY
 GU3LkLB09udyHB4R49TfpXYk/jZua2xzwazomnGLcHlOf7zUaRbsETdhn2wyh9FVNIBfRGskqUd
 5zPtAg/0BcLqG2SnyOkP38o94=
X-Google-Smtp-Source: AGHT+IFydqe8XP7ZbsEI4FJ7nHMo2qb0FBj+wx8QFnVlqVGZ0YgAt35WAhs9j3CQ76LLi08wMmQjhHHbpx9s0MvBOTg=
X-Received: by 2002:a05:6820:180a:b0:603:f191:a93c with SMTP id
 006d021491bc7-60828d3a917mr2866969eaf.6.1746635539868; Wed, 07 May 2025
 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-12-jens.wiklander@linaro.org>
 <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
In-Reply-To: <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 May 2025 18:32:08 +0200
X-Gm-Features: ATxdqUElU24AIG1nJsrzoZKKB0gEXwhwftpouBsM_UdwgzzPM34h3I_iZz1EmXw
Message-ID: <CAHUa44HEPF3w=b2O-4DcRUBgF4rJUUze8zy48_g_FCQ5Y34U6A@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
To: Robin Murphy <robin.murphy@arm.com>
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
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

Hi,

On Fri, May 2, 2025 at 5:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> > from the default CMA pool. The memory is represented by a tee_shm objec=
t
> > using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> > from CMA.
>
> If and when it's possible to dynamically delegate any old kernel memory
> to the TEE, it's far from clear why that should involve poking around in
> CMA internals...
>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++-=
-
> >   include/linux/tee_core.h |  4 +++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e1ed52ee0a16..faaa0a87bb18 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -3,8 +3,11 @@
> >    * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
> >    */
> >   #include <linux/anon_inodes.h>
> > +#include <linux/cma.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/highmem.h>
> >   #include <linux/idr.h>
> >   #include <linux/io.h>
> >   #include <linux/mm.h>
> > @@ -13,7 +16,6 @@
> >   #include <linux/tee_core.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >   #include "tee_private.h"
> >
> >   static void shm_put_kernel_pages(struct page **pages, size_t page_cou=
nt)
> > @@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >       struct tee_shm *parent_shm =3D NULL;
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_CMA_BUF) {
> > +#if IS_ENABLED(CONFIG_CMA)
> > +             struct page *page =3D phys_to_page(shm->paddr);
> > +             struct cma *cma =3D dev_get_cma_area(&shm->ctx->teedev->d=
ev);
>
> If you want dma_contiguous_default_area as the commit message implies,
> use dma_contiguous_default_area. Appearing to support per-device CMA
> pools but relying on the device not having one is pretty yucky.
>
> But again, why? If you want page-backed DMA-able memory, with all the
> other assumptions being made here, you may as well just rely on
> dma_alloc_pages(DMA_ATTR_SKIP_CPU_SYNC) doing what you want, while also
> being potentially more flexible for !CMA and non-invasive. Or at the
> very least, could the TEE delegation not be composed on top of the
> existing CMA heap allocator?

Thanks for suggesting dma_alloc_pages(). I'll use that in the next
version of the patch set.

Cheers,
Jens

>
> Thanks,
> Robin.
>
> > +
> > +             cma_release(cma, page, shm->size / PAGE_SIZE);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >   }
> >   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n)
> > +{
> > +#if IS_ENABLED(CONFIG_CMA)
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct cma *cma =3D dev_get_cma_area(&teedev->dev);
> > +     struct tee_shm *shm;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D cma_alloc(cma, page_count, align, true/*no_warn*/);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     shm =3D kzalloc(sizeof(*shm), GFP_KERNEL);
> > +     if (!shm)
> > +             goto err_cma_crelease;
> > +
> > +     refcount_set(&shm->refcount, 1);
> > +     shm->ctx =3D ctx;
> > +     shm->paddr =3D page_to_phys(page);
> > +     shm->size =3D page_count * PAGE_SIZE;
> > +     shm->flags =3D TEE_SHM_CMA_BUF;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return shm;
> > +
> > +err_cma_crelease:
> > +     cma_release(cma, page, page_count);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 02c07f661349..3a4e1b00fcc7 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,7 @@
> >   #define TEE_SHM_POOL                BIT(2)  /* Memory allocated from =
pool */
> >   #define TEE_SHM_PRIV                BIT(3)  /* Memory private to TEE =
driver */
> >   #define TEE_SHM_DMA_BUF             BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_CMA_BUF              BIT(5)  /* CMA allocated memory *=
/
> >
> >   #define TEE_DEVICE_FLAG_REGISTERED  0x1
> >   #define TEE_MAX_DEV_NAME_LEN                32
> > @@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >    */
> >   struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_=
t size);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
