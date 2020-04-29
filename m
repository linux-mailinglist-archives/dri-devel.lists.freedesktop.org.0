Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB271BE887
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 22:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE426EB14;
	Wed, 29 Apr 2020 20:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64D6EB22
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 20:29:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TIeoga091804;
 Wed, 29 Apr 2020 13:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588185650;
 bh=dq76WnL2o1kKDFvoA+0ex1cWV/7t1++4WeJwqpEBuYs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=A71DgmKpz66UQoMu0+smwV8D6pK5Tok3K1A2GNCxwCkCU9GB9VXsIm8xgWkGZEWfV
 XaPbegGCGQuUzGz/Qek0QzNl+BUL1ENTgKPL06ZUwioBwdHyVNI1czlkG+QdxLgFI9
 igrSHyXU1KRkiK7+2+QGewXA5t8Cb09P2jy639bs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TIeoT6036326
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Apr 2020 13:40:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 13:40:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 13:40:49 -0500
Received: from [10.250.87.22] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TIelWk012216;
 Wed, 29 Apr 2020 13:40:48 -0500
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
To: John Stultz <john.stultz@linaro.org>
References: <20200424222740.16259-1-afd@ti.com>
 <CALAqxLWcUkESyqVL1=Jzn_qOayohSvZe9008HGsSZ6+6AXaRXA@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <0b8a1d9a-463f-e1c6-9e4e-e07926cbafb0@ti.com>
Date: Wed, 29 Apr 2020 14:40:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLWcUkESyqVL1=Jzn_qOayohSvZe9008HGsSZ6+6AXaRXA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER
 SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/20 8:44 PM, John Stultz wrote:
> On Fri, Apr 24, 2020 at 3:27 PM Andrew F. Davis <afd@ti.com> wrote:
>> This new export type exposes to userspace the SRAM area as a DMA-Heap,
>> this allows for allocations as DMA-BUFs that can be consumed by various
>> DMA-BUF supporting devices.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
> 
> Nice! Very excited to have the first new heap (that didn't come with
> the initial patchset)!
> 
> Overall looks good! I don't have any comment on the SRAM side of
> things, but a few minor questions/nits below.
> 
>> diff --git a/drivers/misc/sram-dma-heap.c b/drivers/misc/sram-dma-heap.c
>> new file mode 100644
>> index 000000000000..38df0397f294
>> --- /dev/null
>> +++ b/drivers/misc/sram-dma-heap.c
>> @@ -0,0 +1,243 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SRAM DMA-Heap userspace exporter
>> + *
>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *     Andrew F. Davis <afd@ti.com>
>> + */
>> +
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/genalloc.h>
>> +#include <linux/io.h>
>> +#include <linux/mm.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +#include <linux/dma-buf.h>
>> +#include <linux/dma-heap.h>
>> +
>> +#include "sram.h"
>> +
>> +struct sram_dma_heap {
>> +       struct dma_heap *heap;
>> +       struct gen_pool *pool;
>> +};
>> +
>> +struct sram_dma_heap_buffer {
>> +       struct gen_pool *pool;
>> +       struct list_head attachments;
>> +       struct mutex attachments_lock;
>> +       unsigned long len;
>> +       void *vaddr;
>> +       phys_addr_t paddr;
>> +};
>> +
>> +struct dma_heap_attachment {
>> +       struct device *dev;
>> +       struct sg_table *table;
>> +       struct list_head list;
>> +};
>> +
>> +static int dma_heap_attach(struct dma_buf *dmabuf,
>> +                          struct dma_buf_attachment *attachment)
>> +{
>> +       struct sram_dma_heap_buffer *buffer = dmabuf->priv;
>> +       struct dma_heap_attachment *a;
>> +       struct sg_table *table;
>> +
>> +       a = kzalloc(sizeof(*a), GFP_KERNEL);
>> +       if (!a)
>> +               return -ENOMEM;
>> +
>> +       table = kmalloc(sizeof(*table), GFP_KERNEL);
>> +       if (!table) {
>> +               kfree(a);
>> +               return -ENOMEM;
>> +       }
>> +       if (sg_alloc_table(table, 1, GFP_KERNEL)) {
>> +               kfree(table);
>> +               kfree(a);
>> +               return -ENOMEM;
>> +       }
>> +       sg_set_page(table->sgl, pfn_to_page(PFN_DOWN(buffer->paddr)), buffer->len, 0);
>> +
>> +       a->table = table;
>> +       a->dev = attachment->dev;
>> +       INIT_LIST_HEAD(&a->list);
>> +
>> +       attachment->priv = a;
>> +
>> +       mutex_lock(&buffer->attachments_lock);
>> +       list_add(&a->list, &buffer->attachments);
>> +       mutex_unlock(&buffer->attachments_lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static void dma_heap_detatch(struct dma_buf *dmabuf,
>> +                            struct dma_buf_attachment *attachment)
>> +{
>> +       struct sram_dma_heap_buffer *buffer = dmabuf->priv;
>> +       struct dma_heap_attachment *a = attachment->priv;
>> +
>> +       mutex_lock(&buffer->attachments_lock);
>> +       list_del(&a->list);
>> +       mutex_unlock(&buffer->attachments_lock);
>> +
>> +       sg_free_table(a->table);
>> +       kfree(a->table);
>> +       kfree(a);
>> +}
>> +
>> +static struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
>> +                                            enum dma_data_direction direction)
>> +{
>> +       struct dma_heap_attachment *a = attachment->priv;
>> +       struct sg_table *table = a->table;
>> +
>> +       if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents,
>> +                             direction, DMA_ATTR_SKIP_CPU_SYNC))
> 
> Might be nice to have a comment as to why you're using SKIP_CPU_SYNC
> and why it's safe.
> 


Ack, should be simple enough to explain that SRAM is non-cached and so
this sync is not needed (and may not work either given the SRAM region
does not have valid page structures assdociated).


>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       return table;
>> +}
>> +
>> +static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>> +                                  struct sg_table *table,
>> +                                  enum dma_data_direction direction)
>> +{
>> +       dma_unmap_sg_attrs(attachment->dev, table->sgl, table->nents,
>> +                          direction, DMA_ATTR_SKIP_CPU_SYNC);
>> +}
>> +
>> +static void dma_heap_dma_buf_release(struct dma_buf *dmabuf)
>> +{
>> +       struct sram_dma_heap_buffer *buffer = dmabuf->priv;
>> +
>> +       gen_pool_free(buffer->pool, (unsigned long)buffer->vaddr, buffer->len);
>> +       kfree(buffer);
>> +}
>> +
>> +static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>> +{
>> +       struct sram_dma_heap_buffer *buffer = dmabuf->priv;
>> +       int ret;
>> +
>> +       /* SRAM mappings are not cached */
>> +       vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>> +
>> +       ret = vm_iomap_memory(vma, buffer->paddr, buffer->len);
>> +       if (ret)
>> +               pr_err("Could not map buffer to userspace\n");
>> +
>> +       return ret;
>> +}
>> +
>> +static void *dma_heap_vmap(struct dma_buf *dmabuf)
>> +{
>> +       struct sram_dma_heap_buffer *buffer = dmabuf->priv;
>> +
>> +       return buffer->vaddr;
>> +}
>> +
>> +const struct dma_buf_ops sram_dma_heap_buf_ops = {
>> +       .attach = dma_heap_attach,
>> +       .detach = dma_heap_detatch,
>> +       .map_dma_buf = dma_heap_map_dma_buf,
>> +       .unmap_dma_buf = dma_heap_unmap_dma_buf,
>> +       .release = dma_heap_dma_buf_release,
>> +       .mmap = dma_heap_mmap,
>> +       .vmap = dma_heap_vmap,
>> +};
> 
> No begin/end_cpu_access functions here? I'm guessing it's because
> you're always using SKIP_CPU_SYNC so it wouldn't do anything? A small
> comment in the code might help.
> 


Yes, same idea, non-cached/coherent means the access does not need to be
bracketed by *_cpu_access functions. Will comment.


> 
>> +
>> +static int sram_dma_heap_allocate(struct dma_heap *heap,
>> +                                 unsigned long len,
>> +                                 unsigned long fd_flags,
>> +                                 unsigned long heap_flags)
>> +{
>> +       struct sram_dma_heap *sram_dma_heap = dma_heap_get_drvdata(heap);
>> +       struct sram_dma_heap_buffer *buffer;
>> +
>> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>> +       struct dma_buf *dmabuf;
>> +       int ret;
>> +
>> +       buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>> +       if (!buffer)
>> +               return -ENOMEM;
>> +       buffer->pool = sram_dma_heap->pool;
>> +       INIT_LIST_HEAD(&buffer->attachments);
>> +       mutex_init(&buffer->attachments_lock);
>> +       buffer->len = len;
>> +
>> +       buffer->vaddr = (void *)gen_pool_alloc(buffer->pool, buffer->len);
>> +       if (!buffer->vaddr) {
>> +               ret = -ENOMEM;
>> +               goto free_buffer;
>> +       }
>> +
>> +       buffer->paddr = gen_pool_virt_to_phys(buffer->pool, (unsigned long)buffer->vaddr);
>> +       if (buffer->paddr == -1) {
>> +               ret = -ENOMEM;
>> +               goto free_pool;
>> +       }
>> +
>> +       /* create the dmabuf */
>> +       exp_info.ops = &sram_dma_heap_buf_ops;
>> +       exp_info.size = buffer->len;
>> +       exp_info.flags = fd_flags;
>> +       exp_info.priv = buffer;
>> +       dmabuf = dma_buf_export(&exp_info);
>> +       if (IS_ERR(dmabuf)) {
>> +               ret = PTR_ERR(dmabuf);
>> +               goto free_pool;
>> +       }
>> +
>> +       ret = dma_buf_fd(dmabuf, fd_flags);
>> +       if (ret < 0) {
>> +               dma_buf_put(dmabuf);
>> +               /* just return, as put will call release and that will free */
>> +               return ret;
>> +       }
>> +
>> +       return ret;
>> +
>> +free_pool:
>> +       gen_pool_free(buffer->pool, (unsigned long)buffer->vaddr, buffer->len);
>> +free_buffer:
>> +       kfree(buffer);
>> +
>> +       return ret;
>> +}
>> +
>> +static struct dma_heap_ops sram_dma_heap_ops = {
>> +       .allocate = sram_dma_heap_allocate,
>> +};
>> +
>> +int sram_dma_heap_export(struct sram_dev *sram,
> 
> This is totally a bikeshed thing (feel free to ignore), but maybe
> sram_dma_heap_create()  or _add() would be a better name to avoid
> folks mixing it up with the dmabuf exporter?
> 


Maybe sram_add_dma_heap() which will match up better with the other SRAM
functions, will change.


>> +                        struct sram_reserve *block,
>> +                        phys_addr_t start,
>> +                        struct sram_partition *part)
>> +{
>> +       struct sram_dma_heap *sram_dma_heap;
>> +       struct dma_heap_export_info exp_info;
>> +
>> +       dev_info(sram->dev, "Exporting SRAM pool '%s'\n", block->label);
> 
> Again, shed issue: but for terminology consistency (at least in the
> dmabuf heaps space), maybe heap instead of pool?
> 


Ack, s/pool/heap.


> Thanks so much again for submitting this!


Thanks for the review,
Andrew


> -john
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
