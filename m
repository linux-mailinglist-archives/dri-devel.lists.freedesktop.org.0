Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D25AC3A68
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8725210E288;
	Mon, 26 May 2025 07:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b96co4CV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE310E288
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 07:12:00 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-40356cb3352so1273606b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748243520; x=1748848320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeNh+Gu5PRtxOVqfnwNssRFyT5wNEca2MVYLgQyAyLI=;
 b=b96co4CVPso2fnLVz11kRGwMx3ZNrh7m9XRh1CZxLTFz/CmnuhNxBu6EzZof/WIVIw
 eGNrwIGKasH8x6pWtzc+nsvF/7DgYwV6/AGDkmYx+0vbGVgao2wbVHGrL7ANPkC3KiwK
 6Jja9ZmzCEfhpDr3xXGOCfKM9kHOa1vdt/g992WyUNHH+eCgzjgZtclSoMyaNQ4aICNK
 DXOrQzO5i8kASF5f4KnWFI+oKzFGXBOxO+mlwwsf32ZIJe4hHl4IbEMN2HZv8Axf+zcJ
 Kdb2JZ9Nc3I/x/z6/IKqsFkx6MGKnqN8g9ugAbTTC9j0R+FTLBrJoZtKzS2wcWpD+8Iv
 LVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748243520; x=1748848320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yeNh+Gu5PRtxOVqfnwNssRFyT5wNEca2MVYLgQyAyLI=;
 b=oZKEhfyMQid1uxMwmxkgFldhiYlE5cJWG2v3ZeygD6UNUa0H3rDVUaPcUX0z3FrCdG
 duhKL2vZdy+TYEO97SWUzyj5TQdcWCP9NmaU7c20ALcYkUxK6AU0AyHwZbD0C+Mn3gcL
 tBF3VnPpr0kNQJMtFVIosYIRRKcyTj0CUaQec9o9gzPXHgHmvCYheJ4GOWz+wvmRwOBx
 SKAYZmqvc4KXGMNUb2kXzHrrbnMWw2kjhiTtSL82x9PGA2niIH300x4C5ojug7G/bqnH
 aDgmPQg0l4exQtLLFnGVk9ZT+Ca+c21+sh/CQlU59QvQ0ER+XlqouAoccucDoPCNLBnQ
 Ednw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW9B77ESQyaJ4/hfIcPZLJZ8TgO8JltA/bkmCpPKZvu7Cjr/vS3ZOChikA2cftimYVhb/G4smf+j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx89KWoN3eG3SVc6hFWJezECaJfioRV97BGRsgMRL0y1oF7JIi
 Pg1IawQFT3jf5rNaorX4cNrVMORi9aDQ6DTQE/Ri7AZJZ27AtyWyOoTnW+rUkQsSfNmhRwOdCZn
 vPPFd+hZAih6Ht3jO/Q/7ygxbXHqbQxP+wpHZjtMlag==
X-Gm-Gg: ASbGncuvrcFXGZO/ZksZaeDKOF0FlKH0k/yy9ohvqy+qdfpcfne5h8k42mqUN3rTo1l
 evhV9OmT78CYtFo6b4+Xj4SiL48dkvhhM3s4Zmp8459u1ZtMxulH5mGo0JmYF3fCd0on6yFdUtu
 qT2oZJ/VFke0IeOL7NASoiMRbK/DyWy3wSVg==
X-Google-Smtp-Source: AGHT+IGUgea18RDjcBJX7VXut+VCDWeAAmx9LttthUJiEbSZwF+n/XzCDyzJGmDSGPISGKHv7co5D1JDGrjDQLgtFCc=
X-Received: by 2002:a05:6808:319a:b0:3f3:d699:e1a8 with SMTP id
 5614622812f47-4063d028e28mr7961742b6e.13.1748243519586; Mon, 26 May 2025
 00:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-4-jens.wiklander@linaro.org>
 <aDByJpX9sBZTNXjJ@sumit-X1>
In-Reply-To: <aDByJpX9sBZTNXjJ@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 26 May 2025 09:11:48 +0200
X-Gm-Features: AX0GCFvTqAuNlFNlvMJUs40N7o0plSJW769t7mk3VndbEW_eiuoxy9DxDeXtQDs
Message-ID: <CAHUa44FGbXWtnkcXt7kq0SK9XyKXNUp0dsEbzQzQm8p6_gvTAw@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] tee: implement protected DMA-heap
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

On Fri, May 23, 2025 at 3:03=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> + Robin
>
> Jens,
>
> I suppose you missed to add Robin who has earlier reviewed this patch.

Yes, you're right, sorry. Thanks for catching this.

>
> On Tue, May 20, 2025 at 05:16:46PM +0200, Jens Wiklander wrote:
> > Implement DMA heap for protected DMA-buf allocation in the TEE
> > subsystem.
> >
> > Restricted memory refers to memory buffers behind a hardware enforced
>
> s/Restricted/Protected/
>
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
> > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > +static DEFINE_XARRAY_ALLOC(tee_dma_heap);
> > +
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
>
> I think this can rather be simplified to:
>
>         return WARN_ON(xa_is_err(xa_store(&tee_dma_heap, id, h, GFP_KERNE=
L)));

OK

>
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
>
> Did you missed pfn_valid() check from prior v8 review comments?

No, I tried it, but pfn_valid() didn't like the address, so I had to
find a way to fix it.
tee_protmem_static_pool_alloc(), below, calls memremap() on the range,
and that should make pfn_valid() redundant.

>
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
>
> s/tee_shm_pool/tee_protmem_pool/

I'll fix it.

>
> Rest looks fine to me.

Thanks,
Jens

>
> -Sumit
>
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
> > --
> > 2.43.0
> >
