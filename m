Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qICRIjVloGkejQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:22:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB841A891A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA28F10E969;
	Thu, 26 Feb 2026 15:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2208B10E969
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:22:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1091516;
 Thu, 26 Feb 2026 07:22:19 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62553F62B;
 Thu, 26 Feb 2026 07:22:21 -0800 (PST)
Message-ID: <d05a81ff-c6af-4621-9593-d06f80220e34@arm.com>
Date: Thu, 26 Feb 2026 15:22:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Albert Esteve <aesteve@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, echanude@redhat.com, mripard@redhat.com
References: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:echanude@redhat.com,m:mripard@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xyz:email]
X-Rspamd-Queue-Id: CAB841A891A
X-Rspamd-Action: no action

On 24/02/2026 7:57 am, Albert Esteve wrote:
> Add a dma-buf heap for DT coherent reserved-memory
> (i.e., 'shared-dma-pool' without 'reusable' property),
> exposing one heap per region for userspace buffers.

Despite the "shared" naming of the compatible, these kinds of 
reservations are often for highly device-specific purposes, and 
sometimes may not even be accessible to other devices at all, so it's 
far from clear that there's a generic use-case for connecting them to 
dma-buf. Certainly it doesn't seem like a good idea to unconditionally 
create heaps for *everyting*, and give userspace free reign to mess with 
things it doesn't necessarily understand (especially where 
usage-specific restrictions implied by "no-map" are involved) and which 
may break drivers.

Most drivers that accomodate a memory-region expect to manage it 
themselves, so I would think it should be up to the drivers to opt into 
delegating "their" pool to userspace by registering it as a heap. Or at 
very worst, at least some additional DT compatible or property to 
indicate that it really is safe and desirable to use a given pool in a 
truly shared manner.

Otherwise, If we just present some heaps named "memory@xyz" to userspace 
(arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi is 
a fun example), do we really expect it to maintain exhaustive 
platform-specific knowledge of which actual device(s) they belong to and 
what they're for? And if it does try to just mess around and allocate 
and map stuff, how does the dma-buf layer also have all of that 
usage-specific detail to know what memory attributes are safe to map 
with etc.?

Thanks,
Robin.

> The heap binds a synthetic platform device to each region
> so coherent allocations use the correct dev->dma_mem,
> and it defers registration until late_initcall when
> normal allocator are available.
> 
> This patch includes charging of the coherent heap
> allocator to the dmem cgroup.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
> This patch introduces a new driver to expose DT coherent reserved-memory
> regions as dma-buf heaps, allowing userspace buffers to be created.
> 
> Since these regions are device-dependent, we bind a synthetic platform
> device to each region so coherent allocations use the correct dev->dma_mem.
> 
> Following Eric’s [1] and Maxime’s [2] work on charging DMA buffers
> allocated from userspace to cgroups (dmem), this patch adds the same
> charging pattern used by CMA heaps patch. Charging is done only through
> the dma-buf heap interface so it can be attributed to a userspace allocator.
> 
> This allows each device-specific reserved-memory region to enforce its
> own limits.
> 
> [1] https://lore.kernel.org/all/20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com/
> [2] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
> ---
>   drivers/dma-buf/heaps/Kconfig         |  17 ++
>   drivers/dma-buf/heaps/Makefile        |   1 +
>   drivers/dma-buf/heaps/coherent_heap.c | 485 ++++++++++++++++++++++++++++++++++
>   include/linux/dma-heap.h              |  11 +
>   kernel/dma/coherent.c                 |   9 +
>   5 files changed, 523 insertions(+)
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c42264..93765dca164e3 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,20 @@ config DMABUF_HEAPS_CMA
>   	  Choose this option to enable dma-buf CMA heap. This heap is backed
>   	  by the Contiguous Memory Allocator (CMA). If your system has these
>   	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_COHERENT
> +	bool "DMA-BUF Coherent Reserved-Memory Heap"
> +	depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHERENT
> +	help
> +	  Choose this option to enable coherent reserved-memory dma-buf heaps.
> +	  This heap is backed by non-reusable DT "shared-dma-pool" regions.
> +	  If your system defines coherent reserved-memory regions, you should
> +	  say Y here.
> +
> +config COHERENT_AREAS_DEFERRED
> +	int "Max deferred coherent reserved-memory regions"
> +	depends on DMABUF_HEAPS_COHERENT
> +	default 16
> +	help
> +	  Maximum number of coherent reserved-memory regions that can be
> +	  deferred for later registration during early boot.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032f..96bda7a65f041 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>   obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_COHERENT)	+= coherent_heap.o
> diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/heaps/coherent_heap.c
> new file mode 100644
> index 0000000000000..870b2b89aefcb
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/coherent_heap.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF heap for coherent reserved-memory regions
> + *
> + * Copyright (C) 2026 Red Hat, Inc.
> + * Author: Albert Esteve <aesteve@redhat.com>
> + *
> + */
> +
> +#include <linux/cgroup_dmem.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/highmem.h>
> +#include <linux/iosys-map.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +#define DEFERRED_AREAS_MAX CONFIG_COHERENT_AREAS_DEFERRED
> +
> +/*
> + * Early init can't use normal memory management yet (memblock is used
> + * instead), so keep a small deferred list and retry at late_initcall.
> + */
> +static struct reserved_mem *rmem_areas_deferred[DEFERRED_AREAS_MAX];
> +static unsigned int rmem_areas_deferred_num;
> +
> +static int coherent_heap_add_deferred(struct reserved_mem *rmem)
> +{
> +	if (rmem_areas_deferred_num >= DEFERRED_AREAS_MAX) {
> +		pr_warn("Deferred heap areas list full, dropping %s\n",
> +			rmem->name ? rmem->name : "unknown");
> +		return -EINVAL;
> +	}
> +	rmem_areas_deferred[rmem_areas_deferred_num++] = rmem;
> +	return 0;
> +}
> +
> +struct coherent_heap {
> +	struct dma_heap *heap;
> +	struct reserved_mem *rmem;
> +	char *name;
> +	struct device *dev;
> +	struct platform_device *pdev;
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	struct dmem_cgroup_region *cg;
> +#endif
> +};
> +
> +struct coherent_heap_buffer {
> +	struct coherent_heap *heap;
> +	struct list_head attachments;
> +	struct mutex lock;
> +	unsigned long len;
> +	dma_addr_t dma_addr;
> +	void *alloc_vaddr;
> +	struct page **pages;
> +	pgoff_t pagecount;
> +	int vmap_cnt;
> +	void *vaddr;
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	struct dmem_cgroup_pool_state *pool;
> +#endif
> +};
> +
> +struct dma_heap_attachment {
> +	struct device *dev;
> +	struct sg_table table;
> +	struct list_head list;
> +	bool mapped;
> +};
> +
> +static int coherent_heap_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +	int ret;
> +
> +	a = kzalloc_obj(*a);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
> +					buffer->pagecount, 0,
> +					buffer->pagecount << PAGE_SHIFT,
> +					GFP_KERNEL);
> +	if (ret) {
> +		kfree(a);
> +		return ret;
> +	}
> +
> +	a->dev = attachment->dev;
> +	INIT_LIST_HEAD(&a->list);
> +	a->mapped = false;
> +
> +	attachment->priv = a;
> +
> +	mutex_lock(&buffer->lock);
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void coherent_heap_detach(struct dma_buf *dmabuf,
> +				 struct dma_buf_attachment *attachment)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a = attachment->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&buffer->lock);
> +
> +	sg_free_table(&a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *coherent_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +						  enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a = attachment->priv;
> +	struct sg_table *table = &a->table;
> +	int ret;
> +
> +	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	if (ret)
> +		return ERR_PTR(-ENOMEM);
> +	a->mapped = true;
> +
> +	return table;
> +}
> +
> +static void coherent_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +					struct sg_table *table,
> +					enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a = attachment->priv;
> +
> +	a->mapped = false;
> +	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +}
> +
> +static int coherent_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +						  enum dma_data_direction direction)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt)
> +		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	list_for_each_entry(a, &buffer->attachments, list) {
> +		if (!a->mapped)
> +			continue;
> +		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int coherent_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +						enum dma_data_direction direction)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt)
> +		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	list_for_each_entry(a, &buffer->attachments, list) {
> +		if (!a->mapped)
> +			continue;
> +		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int coherent_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct coherent_heap *coh_heap = buffer->heap;
> +
> +	return dma_mmap_coherent(coh_heap->dev, vma, buffer->alloc_vaddr,
> +				 buffer->dma_addr, buffer->len);
> +}
> +
> +static void *coherent_heap_do_vmap(struct coherent_heap_buffer *buffer)
> +{
> +	void *vaddr;
> +
> +	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
> +	if (!vaddr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return vaddr;
> +}
> +
> +static int coherent_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	void *vaddr;
> +	int ret = 0;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt) {
> +		buffer->vmap_cnt++;
> +		iosys_map_set_vaddr(map, buffer->vaddr);
> +		goto out;
> +	}
> +
> +	vaddr = coherent_heap_do_vmap(buffer);
> +	if (IS_ERR(vaddr)) {
> +		ret = PTR_ERR(vaddr);
> +		goto out;
> +	}
> +
> +	buffer->vaddr = vaddr;
> +	buffer->vmap_cnt++;
> +	iosys_map_set_vaddr(map, buffer->vaddr);
> +out:
> +	mutex_unlock(&buffer->lock);
> +
> +	return ret;
> +}
> +
> +static void coherent_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	if (!--buffer->vmap_cnt) {
> +		vunmap(buffer->vaddr);
> +		buffer->vaddr = NULL;
> +	}
> +	mutex_unlock(&buffer->lock);
> +	iosys_map_clear(map);
> +}
> +
> +static void coherent_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct coherent_heap_buffer *buffer = dmabuf->priv;
> +	struct coherent_heap *coh_heap = buffer->heap;
> +
> +	if (buffer->vmap_cnt > 0) {
> +		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
> +		vunmap(buffer->vaddr);
> +		buffer->vaddr = NULL;
> +		buffer->vmap_cnt = 0;
> +	}
> +
> +	if (buffer->alloc_vaddr)
> +		dma_free_coherent(coh_heap->dev, buffer->len, buffer->alloc_vaddr,
> +			       buffer->dma_addr);
> +	kfree(buffer->pages);
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> +#endif
> +	kfree(buffer);
> +}
> +
> +static const struct dma_buf_ops coherent_heap_buf_ops = {
> +	.attach = coherent_heap_attach,
> +	.detach = coherent_heap_detach,
> +	.map_dma_buf = coherent_heap_map_dma_buf,
> +	.unmap_dma_buf = coherent_heap_unmap_dma_buf,
> +	.begin_cpu_access = coherent_heap_dma_buf_begin_cpu_access,
> +	.end_cpu_access = coherent_heap_dma_buf_end_cpu_access,
> +	.mmap = coherent_heap_mmap,
> +	.vmap = coherent_heap_vmap,
> +	.vunmap = coherent_heap_vunmap,
> +	.release = coherent_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *coherent_heap_allocate(struct dma_heap *heap,
> +					      unsigned long len,
> +					      u32 fd_flags,
> +					      u64 heap_flags)
> +{
> +	struct coherent_heap *coh_heap;
> +	struct coherent_heap_buffer *buffer;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	size_t size = PAGE_ALIGN(len);
> +	pgoff_t pagecount = size >> PAGE_SHIFT;
> +	struct dma_buf *dmabuf;
> +	int ret = -ENOMEM;
> +	pgoff_t pg;
> +
> +	coh_heap = dma_heap_get_drvdata(heap);
> +	if (!coh_heap)
> +		return ERR_PTR(-EINVAL);
> +	if (!coh_heap->dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	buffer = kzalloc_obj(*buffer);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	mutex_init(&buffer->lock);
> +	buffer->len = size;
> +	buffer->heap = coh_heap;
> +	buffer->pagecount = pagecount;
> +
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	if (mem_accounting) {
> +		ret = dmem_cgroup_try_charge(coh_heap->cg, size,
> +					     &buffer->pool, NULL);
> +		if (ret)
> +			goto free_buffer;
> +	}
> +#endif
> +
> +	buffer->alloc_vaddr = dma_alloc_coherent(coh_heap->dev, buffer->len,
> +						 &buffer->dma_addr, GFP_KERNEL);
> +	if (!buffer->alloc_vaddr) {
> +		ret = -ENOMEM;
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +		goto uncharge_cgroup;
> +#else
> +		goto free_buffer;
> +#endif
> +	}
> +
> +	buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages),
> +				      GFP_KERNEL);
> +	if (!buffer->pages) {
> +		ret = -ENOMEM;
> +		goto free_dma;
> +	}
> +
> +	for (pg = 0; pg < pagecount; pg++)
> +		buffer->pages[pg] = virt_to_page((char *)buffer->alloc_vaddr +
> +						 (pg * PAGE_SIZE));
> +
> +	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.ops = &coherent_heap_buf_ops;
> +	exp_info.size = buffer->len;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = buffer;
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto free_pages;
> +	}
> +	return dmabuf;
> +
> +free_pages:
> +	kfree(buffer->pages);
> +free_dma:
> +	dma_free_coherent(coh_heap->dev, buffer->len, buffer->alloc_vaddr,
> +			  buffer->dma_addr);
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +uncharge_cgroup:
> +	dmem_cgroup_uncharge(buffer->pool, size);
> +#endif
> +free_buffer:
> +	kfree(buffer);
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops coherent_heap_ops = {
> +	.allocate = coherent_heap_allocate,
> +};
> +
> +static int __coherent_heap_register(struct reserved_mem *rmem)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct coherent_heap *coh_heap;
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	struct dmem_cgroup_region *region;
> +#endif
> +	const char *rmem_name;
> +	int ret;
> +
> +	if (!rmem)
> +		return -EINVAL;
> +
> +	rmem_name = rmem->name ? rmem->name : "unknown";
> +
> +	coh_heap = kzalloc_obj(*coh_heap);
> +	if (!coh_heap)
> +		return -ENOMEM;
> +
> +	coh_heap->name = kasprintf(GFP_KERNEL, "coherent_%s", rmem_name);
> +	if (!coh_heap->name) {
> +		ret = -ENOMEM;
> +		goto free_coherent_heap;
> +	}
> +
> +	coh_heap->rmem = rmem;
> +
> +	/* create a platform device per rmem and bind it */
> +	coh_heap->pdev = platform_device_register_simple("coherent-heap",
> +							 PLATFORM_DEVID_AUTO,
> +							 NULL, 0);
> +	if (IS_ERR(coh_heap->pdev)) {
> +		ret = PTR_ERR(coh_heap->pdev);
> +		goto free_name;
> +	}
> +
> +	if (rmem->ops && rmem->ops->device_init) {
> +		ret = rmem->ops->device_init(rmem, &coh_heap->pdev->dev);
> +		if (ret)
> +			goto pdev_unregister;
> +	}
> +
> +	coh_heap->dev = &coh_heap->pdev->dev;
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	region = dmem_cgroup_register_region(rmem->size, "coh/%s", rmem_name);
> +	if (IS_ERR(region)) {
> +		ret = PTR_ERR(region);
> +		goto pdev_unregister;
> +	}
> +	coh_heap->cg = region;
> +#endif
> +
> +	exp_info.name = coh_heap->name;
> +	exp_info.ops = &coherent_heap_ops;
> +	exp_info.priv = coh_heap;
> +
> +	coh_heap->heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(coh_heap->heap)) {
> +		ret = PTR_ERR(coh_heap->heap);
> +		goto cg_unregister;
> +	}
> +
> +	return 0;
> +
> +cg_unregister:
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +	dmem_cgroup_unregister_region(coh_heap->cg);
> +#endif
> +pdev_unregister:
> +	platform_device_unregister(coh_heap->pdev);
> +	coh_heap->pdev = NULL;
> +free_name:
> +	kfree(coh_heap->name);
> +free_coherent_heap:
> +	kfree(coh_heap);
> +
> +	return ret;
> +}
> +
> +int dma_heap_coherent_register(struct reserved_mem *rmem)
> +{
> +	int ret;
> +
> +	ret = __coherent_heap_register(rmem);
> +	if (ret == -ENOMEM)
> +		return coherent_heap_add_deferred(rmem);
> +	return ret;
> +}
> +
> +static int __init coherent_heap_register_deferred(void)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < rmem_areas_deferred_num; i++) {
> +		struct reserved_mem *rmem = rmem_areas_deferred[i];
> +
> +		ret = __coherent_heap_register(rmem);
> +		if (ret) {
> +			pr_warn("Failed to add coherent heap %s",
> +				rmem->name ? rmem->name : "unknown");
> +			continue;
> +		}
> +	}
> +
> +	return 0;
> +}
> +late_initcall(coherent_heap_register_deferred);
> +MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions");
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 648328a64b27e..e894cfa1ecf1a 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,9 +9,11 @@
>   #ifndef _DMA_HEAPS_H
>   #define _DMA_HEAPS_H
>   
> +#include <linux/errno.h>
>   #include <linux/types.h>
>   
>   struct dma_heap;
> +struct reserved_mem;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
> @@ -48,4 +50,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
>   extern bool mem_accounting;
>   
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> +int dma_heap_coherent_register(struct reserved_mem *rmem);
> +#else
> +static inline int dma_heap_coherent_register(struct reserved_mem *rmem)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>   #endif /* _DMA_HEAPS_H */
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> index 1147497bc512c..f49d13e460e4b 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -9,6 +9,7 @@
>   #include <linux/module.h>
>   #include <linux/dma-direct.h>
>   #include <linux/dma-map-ops.h>
> +#include <linux/dma-heap.h>
>   
>   struct dma_coherent_mem {
>   	void		*virt_base;
> @@ -393,6 +394,14 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
>   	rmem->ops = &rmem_dma_ops;
>   	pr_info("Reserved memory: created DMA memory pool at %pa, size %ld MiB\n",
>   		&rmem->base, (unsigned long)rmem->size / SZ_1M);
> +
> +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)) {
> +		int ret = dma_heap_coherent_register(rmem);
> +
> +		if (ret)
> +			pr_warn("Reserved memory: failed to register coherent heap for %s (%d)\n",
> +				rmem->name ? rmem->name : "unknown", ret);
> +	}
>   	return 0;
>   }
>   
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9
> 
> Best regards,

