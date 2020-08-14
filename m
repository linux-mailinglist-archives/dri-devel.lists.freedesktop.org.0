Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D404244C7F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 18:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD976EB8B;
	Fri, 14 Aug 2020 16:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77616EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 16:15:09 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id kq25so10502644ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hwLryFmmpy/JVB2xUG6sb9RS+C+BrqY8tJt93O/yuc=;
 b=ZPiwVQBn4AAWOHVf29z51JEx5xczpiAU8lDucVo+lBFGV0CqEncKgPBSq8COxPDqdM
 ifrrd8Oyid3bbTgnFZGRLyob+2BlHEwr7TBvNulqswmz5LCYr9pISc90c65795LWwrSk
 Z6Pwd86t8qlINXdCqM+4WNx1lG9nwqiWdmekzXDuGUWVEU0w5XoJK/si8AkF5TiyCVq5
 D5vAIW9Xi3IWDcRZPwTmkiASh9hk1DsY+CtYEwsd/TnoPTHQypSgXh/F66NG1zQ0nnKW
 XODidsk1BVXnM6iAjXxqbOJitTihU1BFTlCNgfH0h0m4Zp8EBtfmrU4yCDKR1mShJDv2
 59eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hwLryFmmpy/JVB2xUG6sb9RS+C+BrqY8tJt93O/yuc=;
 b=HJLMpLO4NUqmb62T1KtJ5cWpZUkKt0MpXdbtbebJzO6uwviba4RE+t7LbffTWBYvoR
 5rEIRf7PKeZv2Shpf3RGdpJG8UOw1MxAUKVXTAFhsITDqsSFDWxk6Oe0AewK62QolUFU
 CApv1mNcmYdGuRpa/2HL+CnJQHaZyFK1sDcmnoLXpdf7XFaNSnhedhRARaluHun+Ypzj
 aWJWQrurs3bPRFidOJkEFH4tGwAWGOCvdgpLmV8a4jafvO2ohBCuo5lKzL8ykY5EnREq
 OvVsEwIHku8ik3yKcFOufnSYveUrSQOIPU9VJ3AJmYJngNb5NRY5VopSqk6sPsruEZC8
 1JmQ==
X-Gm-Message-State: AOAM533q4XeiqzsyMo1nFhb+g4A2HY4+Z9zeSwj+fBsYCaWJA9wusift
 6KkKQQaarVvkUnV6iyU+/Mg/bFopNkTkf8EhgyrTLA==
X-Google-Smtp-Source: ABdhPJxrH3Dm2oUGgePSsgO9Fk0uSsuhDd3nm6OjPx0vyycnGmSY6QQM89YrJ+ix3v4/epzz/q0ndYpXAW5BNJZfB2k=
X-Received: by 2002:a17:906:aed4:: with SMTP id
 me20mr3236453ejb.141.1597421708267; 
 Fri, 14 Aug 2020 09:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200814062458.53049-1-john.stultz@linaro.org>
 <20200814062458.53049-2-john.stultz@linaro.org>
In-Reply-To: <20200814062458.53049-2-john.stultz@linaro.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 14 Aug 2020 13:14:56 -0300
Message-ID: <CAAEAJfDy7V9thc4-dfkwkiRAqqG=D1_qWTv7_gOkN9dcaM6mkw@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 2/2] dma-heap: Add a system-uncached heap
To: John Stultz <john.stultz@linaro.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

Thanks for the patch.

On Fri, 14 Aug 2020 at 03:25, John Stultz <john.stultz@linaro.org> wrote:
>
> This adds a heap that allocates non-contiguous buffers that are
> marked as writecombined, so they are not cached by the CPU.
>

What's the rationale for exposing the memory
attribute as a new heap, instead of just introducing flags?

I guess this calls for some guidelines on what situations
call for a separate heap, and when it's just a modifier flag.

Thanks!
Ezequiel

> This is useful, as most graphics buffers are usually not touched
> by the CPU or only written into once by the CPU. So when mapping
> the buffer over and over between devices, we can skip the CPU
> syncing, which saves a lot of cache management overhead, greatly
> improving performance.
>
> For folk using ION, there was a ION_FLAG_CACHED flag, which
> signaled if the returned buffer should be CPU cacheable or not.
> With DMA-BUF heaps, we have no such flag, and by default the
> current heaps (system and cma) produce CPU cachable buffers.
> So for folks transitioning from ION to DMA-BUF Heaps, this fills
> in some of that missing functionality.
>
> This does have a few "ugly" bits that were required to get
> the buffer properly flushed out initially which I'd like to
> improve. So feedback would be very welcome!
>
> Many thanks to Liam Mark for his help to get this working.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
> * Fix build issue on sh reported-by: kernel test robot <lkp@intel.com>
> * Rework to use for_each_sgtable_sg(), dma_map_sgtable(), and
>   for_each_sg_page() along with numerous other cleanups suggested
>   by Robin Murphy
> ---
>  drivers/dma-buf/heaps/Kconfig                |  10 +
>  drivers/dma-buf/heaps/Makefile               |   1 +
>  drivers/dma-buf/heaps/system_uncached_heap.c | 371 +++++++++++++++++++
>  3 files changed, 382 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/system_uncached_heap.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c4226..420b0ed0a512 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -5,6 +5,16 @@ config DMABUF_HEAPS_SYSTEM
>           Choose this option to enable the system dmabuf heap. The system heap
>           is backed by pages from the buddy allocator. If in doubt, say Y.
>
> +config DMABUF_HEAPS_SYSTEM_UNCACHED
> +       bool "DMA-BUF Uncached System Heap"
> +       depends on DMABUF_HEAPS
> +       help
> +         Choose this option to enable the uncached system dmabuf heap. This
> +         heap is backed by pages from the buddy allocator, but pages are setup
> +         for write combining. This avoids cache management overhead, and can
> +         be faster if pages are mostly untouched by the cpu.  If in doubt,
> +         say Y.
> +
>  config DMABUF_HEAPS_CMA
>         bool "DMA-BUF CMA Heap"
>         depends on DMABUF_HEAPS && DMA_CMA
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 6e54cdec3da0..085685ec478f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y                                  += heap-helpers.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      += system_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_SYSTEM_UNCACHED) += system_uncached_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         += cma_heap.o
> diff --git a/drivers/dma-buf/heaps/system_uncached_heap.c b/drivers/dma-buf/heaps/system_uncached_heap.c
> new file mode 100644
> index 000000000000..3b8e699bcae7
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/system_uncached_heap.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Uncached System DMA-Heap exporter
> + *
> + * Copyright (C) 2020 Linaro Ltd.
> + *
> + * Based off of Andrew Davis' SRAM heap:
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *     Andrew F. Davis <afd@ti.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/highmem.h>
> +#include <linux/io.h>
> +#include <linux/mm.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +
> +struct uncached_heap {
> +       struct dma_heap *heap;
> +};
> +
> +struct uncached_heap_buffer {
> +       struct dma_heap *heap;
> +       struct list_head attachments;
> +       struct mutex lock;
> +       unsigned long len;
> +       struct sg_table sg_table;
> +       int vmap_cnt;
> +       void *vaddr;
> +};
> +
> +struct dma_heap_attachment {
> +       struct device *dev;
> +       struct sg_table *table;
> +       struct list_head list;
> +};
> +
> +static struct sg_table *dup_sg_table(struct sg_table *table)
> +{
> +       struct sg_table *new_table;
> +       int ret, i;
> +       struct scatterlist *sg, *new_sg;
> +
> +       new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
> +       if (!new_table)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
> +       if (ret) {
> +               kfree(new_table);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       new_sg = new_table->sgl;
> +       for_each_sgtable_sg(table, sg, i) {
> +               sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> +               new_sg = sg_next(new_sg);
> +       }
> +
> +       return new_table;
> +}
> +
> +static int dma_heap_attach(struct dma_buf *dmabuf,
> +                          struct dma_buf_attachment *attachment)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +       struct dma_heap_attachment *a;
> +       struct sg_table *table;
> +
> +       a = kzalloc(sizeof(*a), GFP_KERNEL);
> +       if (!a)
> +               return -ENOMEM;
> +
> +       table = dup_sg_table(&buffer->sg_table);
> +       if (IS_ERR(table)) {
> +               kfree(a);
> +               return -ENOMEM;
> +       }
> +
> +       a->table = table;
> +       a->dev = attachment->dev;
> +       INIT_LIST_HEAD(&a->list);
> +
> +       attachment->priv = a;
> +
> +       mutex_lock(&buffer->lock);
> +       list_add(&a->list, &buffer->attachments);
> +       mutex_unlock(&buffer->lock);
> +
> +       return 0;
> +}
> +
> +static void dma_heap_detatch(struct dma_buf *dmabuf,
> +                            struct dma_buf_attachment *attachment)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +       struct dma_heap_attachment *a = attachment->priv;
> +
> +       mutex_lock(&buffer->lock);
> +       list_del(&a->list);
> +       mutex_unlock(&buffer->lock);
> +
> +       sg_free_table(a->table);
> +       kfree(a->table);
> +       kfree(a);
> +}
> +
> +static struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +                                            enum dma_data_direction direction)
> +{
> +       struct dma_heap_attachment *a = attachment->priv;
> +       struct sg_table *table = a->table;
> +
> +       if (dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC))
> +               return ERR_PTR(-ENOMEM);
> +
> +       return table;
> +}
> +
> +static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +                                  struct sg_table *table,
> +                                  enum dma_data_direction direction)
> +{
> +       dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
> +static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +       struct sg_table *table = &buffer->sg_table;
> +       unsigned long addr = vma->vm_start;
> +       struct sg_page_iter piter;
> +       int ret;
> +
> +       vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> +
> +       for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> +               struct page *page = sg_page_iter_page(&piter);
> +
> +               ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> +                                     vma->vm_page_prot);
> +               if (ret)
> +                       return ret;
> +               addr += PAGE_SIZE;
> +               if (addr >= vma->vm_end)
> +                       return 0;
> +       }
> +       return 0;
> +}
> +
> +static void *dma_heap_do_vmap(struct uncached_heap_buffer *buffer)
> +{
> +       struct sg_table *table = &buffer->sg_table;
> +       int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> +       struct page **pages = vmalloc(sizeof(struct page *) * npages);
> +       struct page **tmp = pages;
> +       struct sg_page_iter piter;
> +       pgprot_t pgprot;
> +       void *vaddr;
> +
> +       if (!pages)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pgprot = pgprot_writecombine(PAGE_KERNEL);
> +
> +       for_each_sgtable_page(table, &piter, 0) {
> +               WARN_ON(tmp - pages >= npages);
> +               *tmp++ = sg_page_iter_page(&piter);
> +       }
> +
> +       vaddr = vmap(pages, npages, VM_MAP, pgprot);
> +       vfree(pages);
> +
> +       if (!vaddr)
> +               return ERR_PTR(-ENOMEM);
> +
> +       return vaddr;
> +}
> +
> +static void *dma_heap_buffer_vmap_get(struct uncached_heap_buffer *buffer)
> +{
> +       void *vaddr;
> +
> +       if (buffer->vmap_cnt) {
> +               buffer->vmap_cnt++;
> +               return buffer->vaddr;
> +       }
> +
> +       vaddr = dma_heap_do_vmap(buffer);
> +       if (IS_ERR(vaddr))
> +               return vaddr;
> +
> +       buffer->vaddr = vaddr;
> +       buffer->vmap_cnt++;
> +       return vaddr;
> +}
> +
> +static void dma_heap_buffer_vmap_put(struct uncached_heap_buffer *buffer)
> +{
> +       if (!--buffer->vmap_cnt) {
> +               vunmap(buffer->vaddr);
> +               buffer->vaddr = NULL;
> +       }
> +}
> +
> +static void *dma_heap_vmap(struct dma_buf *dmabuf)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +       void *vaddr;
> +
> +       mutex_lock(&buffer->lock);
> +       vaddr = dma_heap_buffer_vmap_get(buffer);
> +       mutex_unlock(&buffer->lock);
> +
> +       return vaddr;
> +}
> +
> +static void dma_heap_vunmap(struct dma_buf *dmabuf, void *vaddr)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +
> +       mutex_lock(&buffer->lock);
> +       dma_heap_buffer_vmap_put(buffer);
> +       mutex_unlock(&buffer->lock);
> +}
> +
> +static void dma_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +       struct uncached_heap_buffer *buffer = dmabuf->priv;
> +       struct sg_table *table;
> +       struct scatterlist *sg;
> +       int i;
> +
> +       table = &buffer->sg_table;
> +       dma_unmap_sgtable(dma_heap_get_dev(buffer->heap), table, DMA_BIDIRECTIONAL, 0);
> +
> +       for_each_sgtable_sg(table, sg, i)
> +               __free_page(sg_page(sg));
> +       sg_free_table(table);
> +       kfree(buffer);
> +}
> +
> +const struct dma_buf_ops uncached_heap_buf_ops = {
> +       .attach = dma_heap_attach,
> +       .detach = dma_heap_detatch,
> +       .map_dma_buf = dma_heap_map_dma_buf,
> +       .unmap_dma_buf = dma_heap_unmap_dma_buf,
> +       .mmap = dma_heap_mmap,
> +       .vmap = dma_heap_vmap,
> +       .vunmap = dma_heap_vunmap,
> +       .release = dma_heap_dma_buf_release,
> +};
> +
> +static int uncached_heap_allocate(struct dma_heap *heap,
> +                                 unsigned long len,
> +                                 unsigned long fd_flags,
> +                                 unsigned long heap_flags)
> +{
> +       struct uncached_heap_buffer *buffer;
> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +       struct dma_buf *dmabuf;
> +       struct sg_table *table;
> +       struct scatterlist *sg;
> +       pgoff_t pagecount;
> +       pgoff_t pg;
> +       int i, ret = -ENOMEM;
> +
> +       buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> +       if (!buffer)
> +               return -ENOMEM;
> +
> +       INIT_LIST_HEAD(&buffer->attachments);
> +       mutex_init(&buffer->lock);
> +       buffer->heap = heap;
> +       buffer->len = len;
> +
> +       table = &buffer->sg_table;
> +       pagecount = len / PAGE_SIZE;
> +       if (sg_alloc_table(table, pagecount, GFP_KERNEL))
> +               goto free_buffer;
> +
> +       sg = table->sgl;
> +       for (pg = 0; pg < pagecount; pg++) {
> +               struct page *page;
> +               /*
> +                * Avoid trying to allocate memory if the process
> +                * has been killed by SIGKILL
> +                */
> +               if (fatal_signal_pending(current))
> +                       goto free_pages;
> +               page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +               if (!page)
> +                       goto free_pages;
> +               sg_set_page(sg, page, page_size(page), 0);
> +               sg = sg_next(sg);
> +       }
> +
> +       /* create the dmabuf */
> +       exp_info.ops = &uncached_heap_buf_ops;
> +       exp_info.size = buffer->len;
> +       exp_info.flags = fd_flags;
> +       exp_info.priv = buffer;
> +       dmabuf = dma_buf_export(&exp_info);
> +       if (IS_ERR(dmabuf)) {
> +               ret = PTR_ERR(dmabuf);
> +               goto free_pages;
> +       }
> +
> +       ret = dma_buf_fd(dmabuf, fd_flags);
> +       if (ret < 0) {
> +               dma_buf_put(dmabuf);
> +               /* just return, as put will call release and that will free */
> +               return ret;
> +       }
> +
> +       /*
> +        * XXX This is hackish. While the buffer will be uncached, we need
> +        * to initially flush cpu cache, since the __GFP_ZERO on the
> +        * allocation means the zeroing was done by the cpu and thus it is
> +        * likely cached. Map (and implicitly flush) it out now so we don't
> +        * get corruption later on.
> +        *
> +        * Ideally we could do this without using the heap device as a dummy dev.
> +        */
> +       dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
> +
> +       return ret;
> +
> +free_pages:
> +       for_each_sgtable_sg(table, sg, i)
> +               __free_page(sg_page(sg));
> +       sg_free_table(table);
> +free_buffer:
> +       kfree(buffer);
> +
> +       return ret;
> +}
> +
> +static struct dma_heap_ops uncached_heap_ops = {
> +       .allocate = uncached_heap_allocate,
> +};
> +
> +static int uncached_heap_create(void)
> +{
> +       struct uncached_heap *heap;
> +       struct dma_heap_export_info exp_info;
> +
> +       heap = kzalloc(sizeof(*heap), GFP_KERNEL);
> +       if (!heap)
> +               return -ENOMEM;
> +
> +       exp_info.name = "system-uncached";
> +       exp_info.ops = &uncached_heap_ops;
> +       exp_info.priv = heap;
> +       heap->heap = dma_heap_add(&exp_info);
> +       if (IS_ERR(heap->heap)) {
> +               int ret = PTR_ERR(heap->heap);
> +
> +               kfree(heap);
> +               return ret;
> +       }
> +       dma_coerce_mask_and_coherent(dma_heap_get_dev(heap->heap), DMA_BIT_MASK(64));
> +
> +       return 0;
> +}
> +device_initcall(uncached_heap_create);
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
