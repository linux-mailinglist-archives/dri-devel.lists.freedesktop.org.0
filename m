Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC5ACB930
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 18:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540BA10E558;
	Mon,  2 Jun 2025 16:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K2zCoUQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594610E558
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 16:01:09 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-6063462098eso3244836eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748880068; x=1749484868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oyejHJskL3Xk0STV8MjGnp4NQnUrpIej5IgY0aXNyg=;
 b=K2zCoUQ3F7RheIyJj3CzaypJm8exc6OFqJFYw0axXzYEhJYTN0572MkXNcKp4nIehp
 KazItIEmuLKAgin1klqnX6R0QS/dnCQRHnRaiOfR/KSVourWAH5bvaKjgMDLgnheUMzM
 LfHpsvwO1e0Kc3Bfnk7oNX7xsUL5yGSC6XeWAkoNBNfF/Zw8pLMAFtYjhq854VbOYgqR
 tbYz7TgW4m8qmODL8eFbueW2lY5b7hBvRxq/iT7/xKrV5YQQ5emNoT8Wpg/CpX8x+BPT
 VmyEMuC3M1M023CnkdfzPTHQc7aDAyMBACMtcHuLaR7kHCt8eq7y4k2/SDn0/MZxYu/l
 53tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748880068; x=1749484868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7oyejHJskL3Xk0STV8MjGnp4NQnUrpIej5IgY0aXNyg=;
 b=vDrxM8fEZ7I+IalDbKgfLjdB4IsdhwRga0wRizE8tVkWjj6heeHU5mSoC8L1yJ6VS4
 QbORCYBnNlJhfcew6imn67pVq2ylaX7velkcWjr8TDTN1LWuFT2U2fIr65obY0iyjgX+
 48t1FS7NcMRnVOWcEf/YxUsWUrEBr0+XX3H0CP0KRLBSeovfAVqD2pMoaO66lDFA0Uiv
 CQDtKB0XH6ZDVZykJB7eqrWDLLTHueDP8w/ovEhL9SyALZHA+7E9/3HEpQzY5PRE+cwi
 OxOBmmx5MWWK/qjaGI2tN3Bs0yMUQNV8WPB62jPCRBFPlKSZqQvVxQPQWevnWJdhXgGK
 TIeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDggqlTU5G+BAjxFrPwTHWs7xGzsO72rdrvadhOOZKZ9U79X4IMfuRdNHXRc2Sm9Yzk6lbjkNhEGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynzELTHoaeCR5IAEtr8QjLUnMq+9tlRjFVWxhyOyMTGXgZ7vhX
 R9CO4YVbrkthpJpueCUlUeLfv9UZRHbGqW+xscC8RKGRosF94k4bApDPQXzk6/Ac3m9UIhBVtSv
 YBy3xtycyaPO86MdSKAp+AvaaY3kMp6GYDPtkaZSU1g==
X-Gm-Gg: ASbGncvUYqZ6FkgPNcj3sHTXT1OGJpL0E2L0dcuwEwe/V58wryYRIAgLBW+oK8W+NZJ
 uhiYUOhY5S2HBAO4vsirPazwvxuq+cXM68FWzWI+146oIexzRwQuoCOyreatcJdgMrRDwF3nq1X
 48IFpbJyVK1qqnuOeF7HhDq4gOihrV2zjM7gMxajxCqReW
X-Google-Smtp-Source: AGHT+IHu0QM/F6B+oM6CIK37KxLjkVYT8dczv7/j3Jr4N/jJqSLJse/ue22vN43cCaCHDXar40L6PCcZaGBtBwXMG5o=
X-Received: by 2002:a05:6820:1e13:b0:60b:a8e7:b23e with SMTP id
 006d021491bc7-60dc37c657emr5686518eaf.8.1748880067794; Mon, 02 Jun 2025
 09:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-4-jens.wiklander@linaro.org>
 <a6a6c6bb-2d01-4f46-854c-583e9afa7cf1@oss.qualcomm.com>
In-Reply-To: <a6a6c6bb-2d01-4f46-854c-583e9afa7cf1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Jun 2025 18:00:55 +0200
X-Gm-Features: AX0GCFsih_dd8QdtYCuEOaRXoahetW6bMotqbXbLkwnJtHy8tO1uk1WN5n2aJYg
Message-ID: <CAHUa44FLGVRE+=gBGmSKV7qH45bFmn6GKDsC=zvLB-BogaEvsA@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] tee: implement protected DMA-heap
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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

Hi Amir,

On Fri, May 30, 2025 at 4:13=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 5/21/2025 1:16 AM, Jens Wiklander wrote:
> > Implement DMA heap for protected DMA-buf allocation in the TEE
> > subsystem.
> >
> > Restricted memory refers to memory buffers behind a hardware enforced
> > firewall. It is not accessible to the kernel during normal circumstance=
s
> > but rather only accessible to certain hardware IPs or CPUs executing in
> > higher or differently privileged mode than the kernel itself. This
> > interface allows to allocate and manage such protected memory buffers
> > via interaction with a TEE implementation.
> >
> > The protected memory is allocated for a specific use-case, like Secure
> > Video Playback, Trusted UI, or Secure Video Recording where certain
> > hardware devices can access the memory.
> >
> > The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> > backend drivers needs to implement protected memory pool to manage the
> > protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/Makefile      |   1 +
> >  drivers/tee/tee_heap.c    | 487 ++++++++++++++++++++++++++++++++++++++
> >  drivers/tee/tee_private.h |   6 +
> >  include/linux/tee_core.h  |  65 +++++
> >  4 files changed, 559 insertions(+)
> >  create mode 100644 drivers/tee/tee_heap.c
> >
> > diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> > index 5488cba30bd2..949a6a79fb06 100644
> > --- a/drivers/tee/Makefile
> > +++ b/drivers/tee/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_TEE) +=3D tee.o
> >  tee-objs +=3D tee_core.o
> > +tee-objs +=3D tee_heap.o
> >  tee-objs +=3D tee_shm.o
> >  tee-objs +=3D tee_shm_pool.o
> >  obj-$(CONFIG_OPTEE) +=3D optee/
> > diff --git a/drivers/tee/tee_heap.c b/drivers/tee/tee_heap.c
> > new file mode 100644
> > index 000000000000..a332805f9f26
> > --- /dev/null
> > +++ b/drivers/tee/tee_heap.c
> > @@ -0,0 +1,487 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025, Linaro Limited
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/module.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +#include <linux/tee_core.h>
> > +#include <linux/xarray.h>
> > +
> > +#include "tee_private.h"
> > +
> > +struct tee_dma_heap {
> > +     struct dma_heap *heap;
> > +     enum tee_dma_heap_id id;
> > +     struct tee_protmem_pool *pool;
> > +     struct tee_device *teedev;
> > +     /* Protects pool and teedev above */
> > +     struct mutex mu;
> > +};
> > +
> > +struct tee_heap_buffer {
> > +     struct tee_protmem_pool *pool;
> > +     struct tee_device *teedev;
> > +     size_t size;
> > +     size_t offs;
> > +     struct sg_table table;
> > +};
> > +
> > +struct tee_heap_attachment {
> > +     struct sg_table table;
> > +     struct device *dev;
> > +};
> > +
> > +struct tee_protmem_static_pool {
> > +     struct tee_protmem_pool pool;
> > +     struct gen_pool *gen_pool;
> > +     phys_addr_t pa_base;
> > +     void *base;
> > +};
> > +
>
> Isn't using an xarray excessive for just three entries, given static, lim=
ited IDs?

The interface is nice and scales well. Do you think it adds too much
overhead? What should we use instead?

>
> > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > +static DEFINE_XARRAY_ALLOC(tee_dma_heap);
> > +
>
> Why are we even considering sgl in the first place, given that tee_shm_re=
gister_fd()
> does not accept any dma_buf with more than one entry? Wouldn't it make se=
nse to
> ensure sgl has a single entry after calling alloc()?

I didn't want to close that door completely, even if we can currently
only have a single entry.

>
> > +static int copy_sg_table(struct sg_table *dst, struct sg_table *src)
> > +{
> > +     struct scatterlist *dst_sg;
> > +     struct scatterlist *src_sg;
> > +     int ret;
> > +     int i;
> > +
> > +     ret =3D sg_alloc_table(dst, src->orig_nents, GFP_KERNEL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dst_sg =3D dst->sgl;
> > +     for_each_sgtable_sg(src, src_sg, i) {
> > +             sg_set_page(dst_sg, sg_page(src_sg), src_sg->length,
> > +                         src_sg->offset);
> > +             dst_sg =3D sg_next(dst_sg);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int tee_heap_attach(struct dma_buf *dmabuf,
> > +                        struct dma_buf_attachment *attachment)
> > +{
> > +     struct tee_heap_buffer *buf =3D dmabuf->priv;
> > +     struct tee_heap_attachment *a;
> > +     int ret;
> > +
> > +     a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> > +     if (!a)
> > +             return -ENOMEM;
> > +
> > +     ret =3D copy_sg_table(&a->table, &buf->table);
> > +     if (ret) {
> > +             kfree(a);
> > +             return ret;
> > +     }
> > +
> > +     a->dev =3D attachment->dev;
> > +     attachment->priv =3D a;
> > +
> > +     return 0;
> > +}
> > +
> > +static void tee_heap_detach(struct dma_buf *dmabuf,
> > +                         struct dma_buf_attachment *attachment)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +
> > +     sg_free_table(&a->table);
> > +     kfree(a);
> > +}
> > +
> > +static struct sg_table *
> > +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                  enum dma_data_direction direction)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +     int ret;
> > +
> > +     ret =3D dma_map_sgtable(attachment->dev, &a->table, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return &a->table;
> > +}
> > +
> > +static void tee_heap_unmap_dma_buf(struct dma_buf_attachment *attachme=
nt,
> > +                                struct sg_table *table,
> > +                                enum dma_data_direction direction)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +
> > +     WARN_ON(&a->table !=3D table);
> > +
> > +     dma_unmap_sgtable(attachment->dev, table, direction,
> > +                       DMA_ATTR_SKIP_CPU_SYNC);
> > +}
> > +
> > +static void tee_heap_buf_free(struct dma_buf *dmabuf)
> > +{
> > +     struct tee_heap_buffer *buf =3D dmabuf->priv;
> > +     struct tee_device *teedev =3D buf->teedev;
> > +
> > +     buf->pool->ops->free(buf->pool, &buf->table);
> > +     tee_device_put(teedev);
> > +}
> > +
> > +static const struct dma_buf_ops tee_heap_buf_ops =3D {
> > +     .attach =3D tee_heap_attach,
> > +     .detach =3D tee_heap_detach,
> > +     .map_dma_buf =3D tee_heap_map_dma_buf,
> > +     .unmap_dma_buf =3D tee_heap_unmap_dma_buf,
> > +     .release =3D tee_heap_buf_free,
> > +};
> > +
> > +static struct dma_buf *tee_dma_heap_alloc(struct dma_heap *heap,
> > +                                       unsigned long len, u32 fd_flags=
,
> > +                                       u64 heap_flags)
> > +{
> > +     struct tee_dma_heap *h =3D dma_heap_get_drvdata(heap);
> > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +     struct tee_device *teedev =3D NULL;
> > +     struct tee_heap_buffer *buf;
> > +     struct tee_protmem_pool *pool;
> > +     struct dma_buf *dmabuf;
> > +     int rc;
> > +
> > +     mutex_lock(&h->mu);
> > +     if (tee_device_get(h->teedev)) {
> > +             teedev =3D h->teedev;
> > +             pool =3D h->pool;
> > +     }
> > +     mutex_unlock(&h->mu);
> > +
> > +     if (!teedev)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     buf =3D kzalloc(sizeof(*buf), GFP_KERNEL);
> > +     if (!buf) {
> > +             dmabuf =3D ERR_PTR(-ENOMEM);
> > +             goto err;
> > +     }
> > +     buf->size =3D len;
> > +     buf->pool =3D pool;
> > +     buf->teedev =3D teedev;
> > +
> > +     rc =3D pool->ops->alloc(pool, &buf->table, len, &buf->offs);
> > +     if (rc) {
> > +             dmabuf =3D ERR_PTR(rc);
> > +             goto err_kfree;
> > +     }
> > +
> > +     exp_info.ops =3D &tee_heap_buf_ops;
> > +     exp_info.size =3D len;
> > +     exp_info.priv =3D buf;
> > +     exp_info.flags =3D fd_flags;
> > +     dmabuf =3D dma_buf_export(&exp_info);
> > +     if (IS_ERR(dmabuf))
> > +             goto err_protmem_free;
> > +
> > +     return dmabuf;
> > +
> > +err_protmem_free:
> > +     pool->ops->free(pool, &buf->table);
> > +err_kfree:
> > +     kfree(buf);
> > +err:
> > +     tee_device_put(h->teedev);
> > +     return dmabuf;
> > +}
> > +
> > +static const struct dma_heap_ops tee_dma_heap_ops =3D {
> > +     .allocate =3D tee_dma_heap_alloc,
> > +};
> > +
> > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > +{
> > +     switch (id) {
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > +             return "protected,secure-video";
> > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > +             return "protected,trusted-ui";
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > +             return "protected,secure-video-record";
> > +     default:
> > +             return NULL;
> > +     }
> > +}
> > +
> > +static int alloc_dma_heap(struct tee_device *teedev, enum tee_dma_heap=
_id id,
> > +                       struct tee_protmem_pool *pool)
> > +{
> > +     struct dma_heap_export_info exp_info =3D {
> > +             .ops =3D &tee_dma_heap_ops,
> > +             .name =3D heap_id_2_name(id),
> > +     };
> > +     struct tee_dma_heap *h;
> > +     int rc;
> > +
> > +     if (!exp_info.name)
> > +             return -EINVAL;
> > +
> > +     if (xa_reserve(&tee_dma_heap, id, GFP_KERNEL)) {
> > +             if (!xa_load(&tee_dma_heap, id))
> > +                     return -EEXIST;
> > +             return -ENOMEM;
> > +     }
> > +
> > +     h =3D kzalloc(sizeof(*h), GFP_KERNEL);
> > +     if (!h)
> > +             return -ENOMEM;
> > +     h->id =3D id;
> > +     h->teedev =3D teedev;
> > +     h->pool =3D pool;
> > +     mutex_init(&h->mu);
> > +
> > +     exp_info.priv =3D h;
> > +     h->heap =3D dma_heap_add(&exp_info);
> > +     if (IS_ERR(h->heap)) {
> > +             rc =3D PTR_ERR(h->heap);
> > +             kfree(h);
> > +
> > +             return rc;
> > +     }
> > +
> > +     /* "can't fail" due to the call to xa_reserve() above */
> > +     return WARN(xa_store(&tee_dma_heap, id, h, GFP_KERNEL),
> > +                 "xa_store() failed");
> > +}
> > +
> > +int tee_device_register_dma_heap(struct tee_device *teedev,
> > +                              enum tee_dma_heap_id id,
> > +                              struct tee_protmem_pool *pool)
> > +{
> > +     struct tee_dma_heap *h;
> > +     int rc;
> > +
> > +     h =3D xa_load(&tee_dma_heap, id);
> > +     if (h) {
> > +             mutex_lock(&h->mu);
> > +             if (h->teedev) {
> > +                     rc =3D -EBUSY;
> > +             } else {
> > +                     h->teedev =3D teedev;
> > +                     h->pool =3D pool;
> > +                     rc =3D 0;
> > +             }
> > +             mutex_unlock(&h->mu);
> > +     } else {
> > +             rc =3D alloc_dma_heap(teedev, id, pool);
> > +     }
> > +
> > +     if (rc)
> > +             dev_err(&teedev->dev, "can't register DMA heap id %d (%s)=
\n",
> > +                     id, heap_id_2_name(id));
> > +
> > +     return rc;
> > +}
> > +EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
> > +
> > +void tee_device_unregister_all_dma_heaps(struct tee_device *teedev)
> > +{
> > +     struct tee_protmem_pool *pool;
> > +     struct tee_dma_heap *h;
> > +     u_long i;
> > +
> > +     xa_for_each(&tee_dma_heap, i, h) {
> > +             if (h) {
> > +                     pool =3D NULL;
> > +                     mutex_lock(&h->mu);
> > +                     if (h->teedev =3D=3D teedev) {
> > +                             pool =3D h->pool;
> > +                             h->teedev =3D NULL;
> > +                             h->pool =3D NULL;
> > +                     }
> > +                     mutex_unlock(&h->mu);
> > +                     if (pool)
> > +                             pool->ops->destroy_pool(pool);
> > +             }
> > +     }
> > +}
> > +EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
> > +
>
> (Please first see comment below for update_shm())
>
> Other than calling update_shm(), nothing significant happens in this func=
tion.
> If we remove update_shm(), these operations can be moved to the register =
function.

Yes, but at the expense of making that function more complicated.

>
> However, I also argue that since we have a well-designed generic function=
 like
> tee_ioctl_shm_register_fd(), why should we restrict ourselves to checking=
 the type of
> dma_buf? Any dma_buf should be acceptable to register as tee_shm (thougn =
it should fail
> if it is used in protected operation). Otherwise, TEE_IOC_SHM_REGISTER_FD=
 is
> not an accurate name it should be TEE_IOC_SHM_REGISTER_PROTECTED_FD (or s=
omething similar).

tee_shm_register_fd() can handle both DMA-bufs from a registered TEE
heap and DMA-bufs allocated by other means. The backend driver may
have further restrictions. The OP-TEE FF-A driver can only accept
DMA-bufs allocated from a registered TEE heap since it needs the
shared memory handle of the underlying pool to pass the buffer as an
argument to the secure world.

>
> > +int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> > +                              struct dma_buf *dmabuf, size_t *offset,
> > +                              struct tee_shm *shm,
> > +                              struct tee_shm **parent_shm)
> > +{
> > +     struct tee_heap_buffer *buf;
> > +     int rc;
> > +
> > +     /* The DMA-buf must be from our heap */
> > +     if (dmabuf->ops !=3D &tee_heap_buf_ops)
> > +             return -EINVAL;
> > +
> > +     buf =3D dmabuf->priv;
> > +     /* The buffer must be from the same teedev */
> > +     if (buf->teedev !=3D teedev)
> > +             return -EINVAL;
> > +
> > +     shm->size =3D buf->size;
> > +
> > +     rc =3D buf->pool->ops->update_shm(buf->pool, &buf->table, buf->of=
fs, shm,
> > +                                     parent_shm);
> > +     if (!rc && *parent_shm)
> > +             *offset =3D buf->offs;
> > +
> > +     return rc;
> > +}
> > +#else
> > +int tee_device_register_dma_heap(struct tee_device *teedev __always_un=
used,
> > +                              enum tee_dma_heap_id id __always_unused,
> > +                              struct tee_protmem_pool *pool __always_u=
nused)
> > +{
> > +     return -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
> > +
> > +void
> > +tee_device_unregister_all_dma_heaps(struct tee_device *teedev __always=
_unused)
> > +{
> > +}
> > +EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
> > +
> > +int tee_heap_update_from_dma_buf(struct tee_device *teedev __always_un=
used,
> > +                              struct dma_buf *dmabuf __always_unused,
> > +                              size_t *offset __always_unused,
> > +                              struct tee_shm *shm __always_unused,
> > +                              struct tee_shm **parent_shm __always_unu=
sed)
> > +{
> > +     return -EINVAL;
> > +}
> > +#endif
> > +
> > +static struct tee_protmem_static_pool *
> > +to_protmem_static_pool(struct tee_protmem_pool *pool)
> > +{
> > +     return container_of(pool, struct tee_protmem_static_pool, pool);
> > +}
> > +
> > +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> > +                                     struct sg_table *sgt, size_t size=
,
> > +                                     size_t *offs)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +     phys_addr_t pa;
> > +     int ret;
> > +
> > +     pa =3D gen_pool_alloc(stp->gen_pool, size);
> > +     if (!pa)
> > +             return -ENOMEM;
> > +
> > +     ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > +     if (ret) {
> > +             gen_pool_free(stp->gen_pool, pa, size);
> > +             return ret;
> > +     }
> > +
> > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> > +     *offs =3D pa - stp->pa_base;
> > +
> > +     return 0;
> > +}
> > +
> > +static void protmem_pool_op_static_free(struct tee_protmem_pool *pool,
> > +                                     struct sg_table *sgt)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +     struct scatterlist *sg;
> > +     int i;
> > +
>
> Should be a loop?
>
> > +     for_each_sgtable_sg(sgt, sg, i)
> > +             gen_pool_free(stp->gen_pool, sg_phys(sg), sg->length);
> > +     sg_free_table(sgt);
> > +}
> > +
> > +static int protmem_pool_op_static_update_shm(struct tee_protmem_pool *=
pool,
> > +                                          struct sg_table *sgt, size_t=
 offs,
> > +                                          struct tee_shm *shm,
> > +                                          struct tee_shm **parent_shm)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +
> > +     shm->paddr =3D stp->pa_base + offs;
> > +     *parent_shm =3D NULL;
> > +
> > +     return 0;
> > +}
> > +
> > +static void protmem_pool_op_static_destroy_pool(struct tee_protmem_poo=
l *pool)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +
> > +     gen_pool_destroy(stp->gen_pool);
> > +     memunmap(stp->base);
> > +     kfree(stp);
> > +}
> > +
> > +static struct tee_protmem_pool_ops protmem_pool_ops_static =3D {
> > +     .alloc =3D protmem_pool_op_static_alloc,
> > +     .free =3D protmem_pool_op_static_free,
> > +     .update_shm =3D protmem_pool_op_static_update_shm,
> > +     .destroy_pool =3D protmem_pool_op_static_destroy_pool,
> > +};
> > +
> > +struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t pad=
dr,
> > +                                                    size_t size)
> > +{
> > +     const size_t page_mask =3D PAGE_SIZE - 1;
> > +     struct tee_protmem_static_pool *stp;
> > +     int rc;
> > +
> > +     /* Check it's page aligned */
> > +     if ((paddr | size) & page_mask)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     stp =3D kzalloc(sizeof(*stp), GFP_KERNEL);
> > +     if (!stp)
> > +             return ERR_PTR(-ENOMEM);
> > +
>
> I understand your reasoning for this, but considering that paddr comes fr=
om
> the backend, isn=E2=80=99t it the backend=E2=80=99s responsibility to ens=
ure that pfn_valid()
> passes? For example, it might want to call devm_memremap_pages() itself.
> So, should we simply ensure that the pages are valid , and fail on return=
,
> rather than attempting to fix them?

You have a point. I'll update accordingly.

>
> > +     /*
> > +      * Map the memory as uncached to make sure the kernel can work wi=
th
> > +      * __pfn_to_page() and friends since that's needed when passing t=
he
> > +      * protected DMA-buf to a device. The memory should otherwise not
> > +      * be touched by the kernel since it's likely to cause an externa=
l
> > +      * abort due to the protection status.
> > +      */
> > +     stp->base =3D memremap(paddr, size, MEMREMAP_WC);
> > +     if (!stp->base) {
> > +             rc =3D -EINVAL;
> > +             goto err_free;
> > +     }
> > +
> > +     stp->gen_pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > +     if (!stp->gen_pool) {
> > +             rc =3D -ENOMEM;
> > +             goto err_unmap;
> > +     }
> > +
> > +     rc =3D gen_pool_add(stp->gen_pool, paddr, size, -1);
> > +     if (rc)
> > +             goto err_free_pool;
> > +
> > +     stp->pool.ops =3D &protmem_pool_ops_static;
> > +     stp->pa_base =3D paddr;
> > +     return &stp->pool;
> > +
> > +err_free_pool:
> > +     gen_pool_destroy(stp->gen_pool);
> > +err_unmap:
> > +     memunmap(stp->base);
> > +err_free:
> > +     kfree(stp);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_protmem_static_pool_alloc);
> > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > index 9bc50605227c..6c6ff5d5eed2 100644
> > --- a/drivers/tee/tee_private.h
> > +++ b/drivers/tee/tee_private.h
> > @@ -8,6 +8,7 @@
> >  #include <linux/cdev.h>
> >  #include <linux/completion.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/kref.h>
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> > @@ -24,4 +25,9 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_con=
text *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
> >                                         unsigned long addr, size_t leng=
th);
> >
> > +int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> > +                              struct dma_buf *dmabuf, size_t *offset,
> > +                              struct tee_shm *shm,
> > +                              struct tee_shm **parent_shm);
> > +
> >  #endif /*TEE_PRIVATE_H*/
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index a38494d6b5f4..b8b99c97e00c 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -8,9 +8,11 @@
> >
> >  #include <linux/cdev.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/kref.h>
> >  #include <linux/list.h>
> > +#include <linux/scatterlist.h>
> >  #include <linux/tee.h>
> >  #include <linux/tee_drv.h>
> >  #include <linux/types.h>
> > @@ -30,6 +32,12 @@
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> >
> > +enum tee_dma_heap_id {
> > +     TEE_DMA_HEAP_SECURE_VIDEO_PLAY =3D 1,
> > +     TEE_DMA_HEAP_TRUSTED_UI,
> > +     TEE_DMA_HEAP_SECURE_VIDEO_RECORD,
> > +};
> > +
> >  /**
> >   * struct tee_device - TEE Device representation
> >   * @name:    name of device
> > @@ -116,6 +124,36 @@ struct tee_desc {
> >       u32 flags;
> >  };
> >
> > +/**
> > + * struct tee_protmem_pool - protected memory pool
> > + * @ops:             operations
> > + *
> > + * This is an abstract interface where this struct is expected to be
> > + * embedded in another struct specific to the implementation.
> > + */
> > +struct tee_protmem_pool {
> > +     const struct tee_protmem_pool_ops *ops;
> > +};
> > +
> > +/**
> > + * struct tee_protmem_pool_ops - protected memory pool operations
> > + * @alloc:           called when allocating protected memory
> > + * @free:            called when freeing protected memory
> > + * @update_shm:              called when registering a dma-buf to upda=
te the @shm
> > + *                   with physical address of the buffer or to return =
the
> > + *                   @parent_shm of the memory pool
> > + * @destroy_pool:    called when destroying the pool
> > + */
> > +struct tee_protmem_pool_ops {
> > +     int (*alloc)(struct tee_protmem_pool *pool, struct sg_table *sgt,
> > +                  size_t size, size_t *offs);
> > +     void (*free)(struct tee_protmem_pool *pool, struct sg_table *sgt)=
;
>
> Why do we need update_shm()? Currently, it seems to do nothing beyond set=
ting
> parent_shm, simply indicating that this shm is part of a larger shm.
>
> What if the backend wants to handle the buffer using something other than
> tee_shm - for example, if it doesn=E2=80=99t want to use tee_shm_alloc_dm=
a_mem()?
> Would removing update_shm() and replacing it with shm_release(), while al=
so
> getting rid of tee_heap_update_from_dma_buf(), be a more streamlined appr=
oach?"
>
> This way, tee_shm for dma_buf would be treated like any other tee_shm - u=
sing
> refcounting based on tee_shm rather than its parent - and we would simply=
 call
> shm_release() upon release.
>
> With this change, we can even accept any dm_buf making the TEE_IOC_SHM_RE=
GISTER_FD generic.

The parent_shm is a must for the dynamic allocation of protected
memory for the OP-TEE backend driver.

Cheers,
Jens

>
> Best Regards,
> Amir
>
> > +     int (*update_shm)(struct tee_protmem_pool *pool, struct sg_table =
*sgt,
> > +                       size_t offs, struct tee_shm *shm,
> > +                       struct tee_shm **parent_shm);
> > +     void (*destroy_pool)(struct tee_protmem_pool *pool);
> > +};
> > +
> >  /**
> >   * tee_device_alloc() - Allocate a new struct tee_device instance
> >   * @teedesc: Descriptor for this driver
> > @@ -154,6 +192,11 @@ int tee_device_register(struct tee_device *teedev)=
;
> >   */
> >  void tee_device_unregister(struct tee_device *teedev);
> >
> > +int tee_device_register_dma_heap(struct tee_device *teedev,
> > +                              enum tee_dma_heap_id id,
> > +                              struct tee_protmem_pool *pool);
> > +void tee_device_unregister_all_dma_heaps(struct tee_device *teedev);
> > +
> >  /**
> >   * tee_device_set_dev_groups() - Set device attribute groups
> >   * @teedev:  Device to register
> > @@ -229,6 +272,28 @@ static inline void tee_shm_pool_free(struct tee_sh=
m_pool *pool)
> >       pool->ops->destroy_pool(pool);
> >  }
> >
> > +/**
> > + * tee_protmem_static_pool_alloc() - Create a protected memory manager
> > + * @paddr:   Physical address of start of pool
> > + * @size:    Size in bytes of the pool
> > + *
> > + * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failur=
e.
> > + */
> > +struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t pad=
dr,
> > +                                                    size_t size);
> > +
> > +/**
> > + * tee_protmem_pool_free() - Free a protected memory pool
> > + * @pool:    The protected memory pool to free
> > + *
> > + * There must be no remaining protected memory allocated from this poo=
l
> > + * when this function is called.
> > + */
> > +static inline void tee_protmem_pool_free(struct tee_protmem_pool *pool=
)
> > +{
> > +     pool->ops->destroy_pool(pool);
> > +}
> > +
> >  /**
> >   * tee_get_drvdata() - Return driver_data pointer
> >   * @returns the driver_data pointer supplied to tee_register().
>
