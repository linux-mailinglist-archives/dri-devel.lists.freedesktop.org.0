Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFF5EB33B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 23:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D4C10E7BB;
	Mon, 26 Sep 2022 21:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194A510E526
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 21:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664228119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AigG2QaFz9fUItmLdlNymo8Bc77uFt/gfHqkCrhpQs=;
 b=IHBWWnlxXnERG5uknT1vVKUsTMEZG5DCu8uDpPVL/5l5uoCQAfV1PAuzSRjDR/xbhCPIEd
 1XmRbeZdfi8WrvK7iHzAsmUt2PX97TlMpZOi7c2FX7knr7xjqgTjx9CiXTlB2T9T54JfYH
 27qU14GpoTKXBDcZozoWOhEEYWKx9Zc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-SZIj2OV3NmW6Am7c9-ShhQ-1; Mon, 26 Sep 2022 17:35:16 -0400
X-MC-Unique: SZIj2OV3NmW6Am7c9-ShhQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e22-20020ac84b56000000b0035bb64ad562so5593530qts.17
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6AigG2QaFz9fUItmLdlNymo8Bc77uFt/gfHqkCrhpQs=;
 b=dN19x6z8YE+sBAAiZuDAnVJcsQT92Bhz+2p0oJU14yL3jIIQsUPj5VkufQ5BZAeCla
 ZBtT/U7KCWxFW9R+DA6Aic2g+ZM97IQQIMXFiaj7xiStbvVT5uVzn+uR4wBcng/YSYOP
 w55GOVimQtUNeVLdbM/901Aoc2hLbpGg3hkbQJrDN8d3Op1eWVBG6xLmWdo88kxh6XBY
 F0pAjGLGYr9coX6hqLJ0HzhHmioHcoNjr8vsm/98TcYwT6X9CJMWhd/budIuJJDbkHmf
 ilNDvuGPeje0/l2XgVCzoFn0xShXx9zXQ7ejZRV7H08cMr/0S6crBqKwtiIheyZjZkfw
 3wbQ==
X-Gm-Message-State: ACrzQf2ZbWGErW8E5eU1rqZR9Jb7KVmTkVg+68fCMPI/q/VYylPo7wxz
 KBCeTQr7zyI9NIvbGosJEucDcwZkZOUdYUWg5KBwafzwAqP+FHedBehEDdFhQwexqyhL9unALhw
 UWpI2icqm5pFDaVvCWJ5CVTfK853U
X-Received: by 2002:ad4:596f:0:b0:4ad:79fc:9ae0 with SMTP id
 eq15-20020ad4596f000000b004ad79fc9ae0mr19024077qvb.53.1664228115772; 
 Mon, 26 Sep 2022 14:35:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xw6uz00XLpP3Skve6uaqwVGBSYr5mSlACMtNy5xy5ttQADFwfKgBu7gO0RX0i2rRcQ9QrXA==
X-Received: by 2002:ad4:596f:0:b0:4ad:79fc:9ae0 with SMTP id
 eq15-20020ad4596f000000b004ad79fc9ae0mr19024049qvb.53.1664228115534; 
 Mon, 26 Sep 2022 14:35:15 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00:e786:1aff:4f5c:c549?
 ([2600:4040:5c48:e00:e786:1aff:4f5c:c549])
 by smtp.gmail.com with ESMTPSA id
 e24-20020ac84918000000b003445d06a622sm11246884qtq.86.2022.09.26.14.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 14:35:13 -0700 (PDT)
Message-ID: <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>
Date: Mon, 26 Sep 2022 17:35:11 -0400
In-Reply-To: <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, amd-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
> When the module is unloaded or a GPU is unbound from the module it is
> possible for device private pages to be left mapped in currently running
> processes. This leads to a kernel crash when the pages are either freed
> or accessed from the CPU because the GPU and associated data structures
> and callbacks have all been freed.
> 
> Fix this by migrating any mappings back to normal CPU memory prior to
> freeing the GPU memory chunks and associated device private pages.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> I assume the AMD driver might have a similar issue. However I can't see
> where device private (or coherent) pages actually get unmapped/freed
> during teardown as I couldn't find any relevant calls to
> devm_memunmap(), memunmap(), devm_release_mem_region() or
> release_mem_region(). So it appears that ZONE_DEVICE pages are not being
> properly freed during module unload, unless I'm missing something?

I've got no idea, will poke Ben to see if they know the answer to this

> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 66ebbd4..3b247b8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -369,6 +369,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
>  	mutex_unlock(&drm->dmem->mutex);
>  }
>  
> +/*
> + * Evict all pages mapping a chunk.
> + */
> +void
> +nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
> +{
> +	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
> +	unsigned long *src_pfns, *dst_pfns;
> +	dma_addr_t *dma_addrs;
> +	struct nouveau_fence *fence;
> +
> +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> +	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> +
> +	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
> +			npages);
> +
> +	for (i = 0; i < npages; i++) {
> +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
> +			struct page *dpage;
> +
> +			/*
> +			 * _GFP_NOFAIL because the GPU is going away and there
> +			 * is nothing sensible we can do if we can't copy the
> +			 * data back.
> +			 */

You'll have to excuse me for a moment since this area of nouveau isn't one of
my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
retry, in the case of a GPU hotplug event I would assume we would rather just
stop trying to migrate things to the GPU and just drop the data instead of
hanging on infinite retries.

> +			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
> +			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> +			nouveau_dmem_copy_one(chunk->drm,
> +					migrate_pfn_to_page(src_pfns[i]), dpage,
> +					&dma_addrs[i]);
> +		}
> +	}
> +
> +	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
> +	migrate_device_pages(src_pfns, dst_pfns, npages);
> +	nouveau_dmem_fence_done(&fence);
> +	migrate_device_finalize(src_pfns, dst_pfns, npages);
> +	kfree(src_pfns);
> +	kfree(dst_pfns);
> +	for (i = 0; i < npages; i++)
> +		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	kfree(dma_addrs);
> +}
> +
>  void
>  nouveau_dmem_fini(struct nouveau_drm *drm)
>  {
> @@ -380,8 +426,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
>  	mutex_lock(&drm->dmem->mutex);
>  
>  	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
> +		nouveau_dmem_evict_chunk(chunk);
>  		nouveau_bo_unpin(chunk->bo);
>  		nouveau_bo_ref(NULL, &chunk->bo);
> +		WARN_ON(chunk->callocated);
>  		list_del(&chunk->list);
>  		memunmap_pages(&chunk->pagemap);
>  		release_mem_region(chunk->pagemap.range.start,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

