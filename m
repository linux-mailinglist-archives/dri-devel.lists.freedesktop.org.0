Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC797A8670A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 22:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D3B10ECA5;
	Fri, 11 Apr 2025 20:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dYp9Gff0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8614110ECA3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 20:26:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so14945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744403214; x=1745008014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tibV02kqIfpjQzwVfkofNSdmT+dVKgEo05SoqfhJ2+8=;
 b=dYp9Gff0QVoYJr5hCHg8dIWXCIzZ1K3SOKwUMFwjNcgESecUPBpkM40KklyS1np8B/
 MRIrj/T0Xyu2RItxa7BRoaILDAnIstzRsMzF3lgD/tv1dGJEgAQ/puDJGLr6xI7rJCCL
 9MYCp1vs8bNJG1PXRU0g8kuFGkYp3yFm4/yYIvTb4fTeBPbPssziFEO6+WVKgB/4bPwf
 TmtiTk1Kyfq8JZSO/2O/CD2INtd4E8mhGseYP5Kk+KgNrZ2cKAQ2MZxUCicmXh0xZKG1
 Cq9qnWoZYikt6YBpcdMVUfYDTdhaoNWxcXCG42X4Alg+BJvZiPbD1/DOm52ws+EdaeRr
 nbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744403214; x=1745008014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tibV02kqIfpjQzwVfkofNSdmT+dVKgEo05SoqfhJ2+8=;
 b=lir/jI3XRICepOiz4easto0pegsIW15uPbRgnyofmsrwK3rSOBtWTSikkIUY3EqaQE
 eAjlC2ue9ywd3ekNExbwVF4q31yYk85u5vWwFH27xtVWUyCegjaasi68abfbRRuRdJ84
 YsHEruXB4vG+OCaZTB17WR6X9yI8sATJLbIjN1gizKuLU2gBZdSFnTLNIMPDZ5kAf9HE
 P9Q0ALlEojPRyZrD4YWCoLCP0ZP3Jp9crwmqzUXIojfiQmqcaor4kanp2Z40TYH4Pzqy
 qXfRmDJHfrYap1+PTxusUR3sz55yikb63oKXoXM62Johraa/Cf32dOxL5H+vBb+Ey7SW
 P+eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXup9h1eDzahWvluOCFw2XQ5nHdJQ9kfrJUtku2H/PMexMMo7W9T6DL8so8DihIQGfs3EGXEwFTh24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKub/DGWT0o/C2FHRUTYMqUtk9Q6SeWvJEm/E9VxGzF+5F+KRw
 y97hF5LryGz25tFJ1Zwot9NcGoo57FXJFJznZck8WyIMjctq6T/d+ymtfoPeRgJk948HHHdryAO
 CaD5OXg74xkmMEAP7fbT1zPxtne5PuvdYddBB
X-Gm-Gg: ASbGncu4zZpvfuQcTyNMxiKSOkk/o3s2MV3g6cz7gr1MpydTrqx6GeypkmjWFkLw3LG
 67L9V3wDG19KuHyiE+PxT+M+XenNOrAPHc4qksCYrrBWixVc7FhWHKY8/bhXi/f8T9RH3iBWMCE
 npml/oGA1wuIYtBzmkhHv4MSgZJapMIVIsA4F/sFWP4Jm+JFQ4IWf3
X-Google-Smtp-Source: AGHT+IEj7JSJGTMY7tzijcPBRK+tYaDhXj5RdHaw9b1MyAPSLzw+i8chIY58pDWW3sQk/9H4eba0T6NvoVrAaqx9HaU=
X-Received: by 2002:a05:600c:4f45:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-43f442c1f7dmr213215e9.6.1744403213616; Fri, 11 Apr 2025
 13:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
 <20250407-dma-buf-ecc-heap-v3-2-97cdd36a5f29@kernel.org>
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-2-97cdd36a5f29@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 11 Apr 2025 13:26:41 -0700
X-Gm-Features: ATxdqUE8D1XarBGmdgMHgxSKHuBHhlGqtjyEbFt80ZANN2TyM9iALZAZurHPNSM
Message-ID: <CABdmKX0=Er-y41roEuZjGZ95YzMxt-mPd9K5982fm_eWhtX5vw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Andrew Davis <afd@ti.com>
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

On Mon, Apr 7, 2025 at 9:29=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Some reserved memory regions might have particular memory setup or
> attributes that make them good candidates for heaps.
>
> Let's provide a heap type that will create a new heap for each reserved
> memory region flagged as such.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

This patch looks good to me, but I think it'd be good to add more
justification like you did at
https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@ker=
nel.org

> ---
>  drivers/dma-buf/heaps/Kconfig         |   8 +
>  drivers/dma-buf/heaps/Makefile        |   1 +
>  drivers/dma-buf/heaps/carveout_heap.c | 360 ++++++++++++++++++++++++++++=
++++++
>  3 files changed, 369 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3..c6981d696733b4d8d0c3f6f5a=
37d967fd6a1a4a2 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -1,5 +1,13 @@
> +config DMABUF_HEAPS_CARVEOUT
> +       bool "Carveout Heaps"
> +       depends on DMABUF_HEAPS
> +       help
> +         Choose this option to enable the carveout dmabuf heap. The carv=
eout
> +         heap is backed by pages from reserved memory regions flagged as
> +         exportable. If in doubt, say Y.
> +
>  config DMABUF_HEAPS_SYSTEM
>         bool "DMA-BUF System Heap"
>         depends on DMABUF_HEAPS
>         help
>           Choose this option to enable the system dmabuf heap. The system=
 heap
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index 974467791032ffb8a7aba17b1407d9a19b3f3b44..b734647ad5c84f44910674816=
0258e372f153df2 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DMABUF_HEAPS_CARVEOUT)    +=3D carveout_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heap=
s/carveout_heap.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f7198b781ea57f4f60e554d91=
7c9277e9a716b16
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/carveout_heap.c
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/genalloc.h>
> +#include <linux/highmem.h>
> +#include <linux/of_reserved_mem.h>
> +
> +struct carveout_heap_priv {
> +       struct dma_heap *heap;
> +       struct gen_pool *pool;
> +};
> +
> +struct carveout_heap_buffer_priv {
> +       struct mutex lock;
> +       struct list_head attachments;
> +
> +       unsigned long num_pages;
> +       struct carveout_heap_priv *heap;
> +       dma_addr_t daddr;
> +       void *vaddr;
> +       unsigned int vmap_cnt;
> +};
> +
> +struct carveout_heap_attachment {
> +       struct list_head head;
> +       struct sg_table table;
> +
> +       struct device *dev;
> +       bool mapped;
> +};
> +
> +static int carveout_heap_attach(struct dma_buf *buf,
> +                               struct dma_buf_attachment *attachment)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D buf->priv;
> +       struct carveout_heap_attachment *a;
> +       struct sg_table *sgt;
> +       unsigned long len =3D priv->num_pages * PAGE_SIZE;
> +       int ret;
> +
> +       a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> +       if (!a)
> +               return -ENOMEM;
> +       INIT_LIST_HEAD(&a->head);
> +       a->dev =3D attachment->dev;
> +       attachment->priv =3D a;
> +
> +       sgt =3D &a->table;
> +       ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +       if (ret)
> +               goto err_cleanup_attach;
> +
> +       sg_dma_address(sgt->sgl) =3D priv->daddr;
> +       sg_dma_len(sgt->sgl) =3D len;
> +
> +       mutex_lock(&priv->lock);
> +       list_add(&a->head, &priv->attachments);
> +       mutex_unlock(&priv->lock);
> +
> +       return 0;
> +
> +err_cleanup_attach:
> +       kfree(a);
> +       return ret;
> +}
> +
> +static void carveout_heap_detach(struct dma_buf *dmabuf,
> +                                struct dma_buf_attachment *attachment)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +       struct carveout_heap_attachment *a =3D attachment->priv;
> +
> +       mutex_lock(&priv->lock);
> +       list_del(&a->head);
> +       mutex_unlock(&priv->lock);
> +
> +       sg_free_table(&a->table);
> +       kfree(a);
> +}
> +
> +static struct sg_table *
> +carveout_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +                         enum dma_data_direction direction)
> +{
> +       struct carveout_heap_attachment *a =3D attachment->priv;
> +       struct sg_table *table =3D &a->table;
> +       int ret;
> +
> +       ret =3D dma_map_sgtable(a->dev, table, direction, 0);
> +       if (ret)
> +               return ERR_PTR(-ENOMEM);

Not ERR_PTR(ret)? This is already converted to ENOMEM by
dma_buf_map_attachment before leaving the dmabuf code, but it might be
nice to retain the error type internally. The two existing heaps
aren't consistent about this, and I have a slight preference to
propagate the error here.

> +
> +       a->mapped =3D true;
> +
> +       return table;
> +}
> +
> +static void carveout_heap_unmap_dma_buf(struct dma_buf_attachment *attac=
hment,
> +                                       struct sg_table *table,
> +                                       enum dma_data_direction direction=
)
> +{
> +       struct carveout_heap_attachment *a =3D attachment->priv;
> +
> +       a->mapped =3D false;
> +       dma_unmap_sgtable(a->dev, table, direction, 0);
> +}
> +
> +static int
> +carveout_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +                                      enum dma_data_direction direction)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +       struct carveout_heap_attachment *a;
> +       unsigned long len =3D priv->num_pages * PAGE_SIZE;
> +
> +       mutex_lock(&priv->lock);
> +
> +       if (priv->vmap_cnt > 0)
> +               invalidate_kernel_vmap_range(priv->vaddr, len);
> +
> +       list_for_each_entry(a, &priv->attachments, head) {
> +               if (!a->mapped)
> +                       continue;
> +
> +               dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> +       }
> +
> +       mutex_unlock(&priv->lock);
> +
> +       return 0;
> +}
> +
> +static int
> +carveout_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +                                    enum dma_data_direction direction)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +       struct carveout_heap_attachment *a;
> +       unsigned long len =3D priv->num_pages * PAGE_SIZE;
> +
> +       mutex_lock(&priv->lock);
> +
> +       if (priv->vmap_cnt > 0)
> +               flush_kernel_vmap_range(priv->vaddr, len);
> +
> +       list_for_each_entry(a, &priv->attachments, head) {
> +               if (!a->mapped)
> +                       continue;
> +
> +               dma_sync_sgtable_for_device(a->dev, &a->table, direction)=
;
> +       }
> +
> +       mutex_unlock(&priv->lock);
> +
> +       return 0;
> +}
> +
> +static int carveout_heap_mmap(struct dma_buf *dmabuf,
> +                             struct vm_area_struct *vma)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +       unsigned long len =3D priv->num_pages * PAGE_SIZE;
> +       struct page *page =3D virt_to_page(priv->vaddr);
> +
> +       return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page),
> +                              len, vma->vm_page_prot);
> +}
> +
> +static int carveout_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *=
map)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +
> +       mutex_lock(&priv->lock);
> +
> +       iosys_map_set_vaddr(map, priv->vaddr);
> +       priv->vmap_cnt++;
> +
> +       mutex_unlock(&priv->lock);
> +
> +       return 0;
> +}
> +
> +static void carveout_heap_vunmap(struct dma_buf *dmabuf, struct iosys_ma=
p *map)
> +{
> +       struct carveout_heap_buffer_priv *priv =3D dmabuf->priv;
> +
> +       mutex_lock(&priv->lock);
> +
> +       priv->vmap_cnt--;
> +       mutex_unlock(&priv->lock);
> +
> +       iosys_map_clear(map);
> +}
> +
> +static void carveout_heap_dma_buf_release(struct dma_buf *buf)
> +{
> +       struct carveout_heap_buffer_priv *buffer_priv =3D buf->priv;
> +       struct carveout_heap_priv *heap_priv =3D buffer_priv->heap;
> +       unsigned long len =3D buffer_priv->num_pages * PAGE_SIZE;
> +
> +       gen_pool_free(heap_priv->pool, (unsigned long)buffer_priv->vaddr,=
 len);
> +       kfree(buffer_priv);
> +}
> +
> +static const struct dma_buf_ops carveout_heap_buf_ops =3D {
> +       .attach         =3D carveout_heap_attach,
> +       .detach         =3D carveout_heap_detach,
> +       .map_dma_buf    =3D carveout_heap_map_dma_buf,
> +       .unmap_dma_buf  =3D carveout_heap_unmap_dma_buf,
> +       .begin_cpu_access       =3D carveout_heap_dma_buf_begin_cpu_acces=
s,
> +       .end_cpu_access =3D carveout_heap_dma_buf_end_cpu_access,
> +       .mmap           =3D carveout_heap_mmap,
> +       .vmap           =3D carveout_heap_vmap,
> +       .vunmap         =3D carveout_heap_vunmap,
> +       .release        =3D carveout_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
> +                                             unsigned long len,
> +                                             u32 fd_flags,
> +                                             u64 heap_flags)
> +{
> +       struct carveout_heap_priv *heap_priv =3D dma_heap_get_drvdata(hea=
p);
> +       struct carveout_heap_buffer_priv *buffer_priv;
> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +       struct dma_buf *buf;
> +       dma_addr_t daddr;
> +       size_t size =3D PAGE_ALIGN(len);

This PAGE_ALIGN is not needed since dma_heap_buffer_alloc requires all
heap allocations to be page aligned before this function is called.





> +       void *vaddr;
> +       int ret;
> +
> +       buffer_priv =3D kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
> +       if (!buffer_priv)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&buffer_priv->attachments);
> +       mutex_init(&buffer_priv->lock);
> +
> +       vaddr =3D gen_pool_dma_zalloc(heap_priv->pool, size, &daddr);
> +       if (!vaddr) {
> +               ret =3D -ENOMEM;
> +               goto err_free_buffer_priv;
> +       }
> +
> +       buffer_priv->vaddr =3D vaddr;
> +       buffer_priv->daddr =3D daddr;
> +       buffer_priv->heap =3D heap_priv;
> +       buffer_priv->num_pages =3D size >> PAGE_SHIFT;
> +
> +       /* create the dmabuf */
> +       exp_info.exp_name =3D dma_heap_get_name(heap);
> +       exp_info.ops =3D &carveout_heap_buf_ops;
> +       exp_info.size =3D size;
> +       exp_info.flags =3D fd_flags;
> +       exp_info.priv =3D buffer_priv;
> +
> +       buf =3D dma_buf_export(&exp_info);
> +       if (IS_ERR(buf)) {
> +               ret =3D PTR_ERR(buf);
> +               goto err_free_buffer;
> +       }
> +
> +       return buf;
> +
> +err_free_buffer:
> +       gen_pool_free(heap_priv->pool, (unsigned long)vaddr, len);
> +err_free_buffer_priv:
> +       kfree(buffer_priv);
> +
> +       return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops carveout_heap_ops =3D {
> +       .allocate =3D carveout_heap_allocate,
> +};
> +
> +static int __init carveout_heap_setup(struct device_node *node)
> +{
> +       struct dma_heap_export_info exp_info =3D {};
> +       const struct reserved_mem *rmem;
> +       struct carveout_heap_priv *priv;
> +       struct dma_heap *heap;
> +       struct gen_pool *pool;
> +       void *base;
> +       int ret;
> +
> +       rmem =3D of_reserved_mem_lookup(node);
> +       if (!rmem)
> +               return -EINVAL;
> +
> +       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       pool =3D gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
> +       if (!pool) {
> +               ret =3D -ENOMEM;
> +               goto err_cleanup_heap;
> +       }
> +       priv->pool =3D pool;
> +
> +       base =3D memremap(rmem->base, rmem->size, MEMREMAP_WB);
> +       if (!base) {
> +               ret =3D -ENOMEM;
> +               goto err_release_mem_region;
> +       }
> +
> +       ret =3D gen_pool_add_virt(pool, (unsigned long)base, rmem->base,
> +                               rmem->size, NUMA_NO_NODE);
> +       if (ret)
> +               goto err_unmap;
> +
> +       exp_info.name =3D node->full_name;
> +       exp_info.ops =3D &carveout_heap_ops;
> +       exp_info.priv =3D priv;
> +
> +       heap =3D dma_heap_add(&exp_info);
> +       if (IS_ERR(heap)) {
> +               ret =3D PTR_ERR(heap);
> +               goto err_cleanup_pool_region;
> +       }
> +       priv->heap =3D heap;
> +
> +       return 0;
> +
> +err_cleanup_pool_region:
> +       gen_pool_free(pool, (unsigned long)base, rmem->size);
> +err_unmap:
> +       memunmap(base);
> +err_release_mem_region:
> +       gen_pool_destroy(pool);
> +err_cleanup_heap:
> +       kfree(priv);
> +       return ret;
> +}
> +
> +static int __init carveout_heap_init(void)
> +{
> +       struct device_node *rmem_node;
> +       struct device_node *node;
> +       int ret;
> +
> +       rmem_node =3D of_find_node_by_path("/reserved-memory");
> +       if (!rmem_node)
> +               return 0;
> +
> +       for_each_child_of_node(rmem_node, node) {
> +               if (!of_property_read_bool(node, "export"))
> +                       continue;
> +
> +               ret =3D carveout_heap_setup(node);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +module_init(carveout_heap_init);
>
> --
> 2.49.0
>
