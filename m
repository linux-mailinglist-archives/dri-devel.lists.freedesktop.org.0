Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2F3724708
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0510E36B;
	Tue,  6 Jun 2023 14:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7900210E36B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:57:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74CC6AB;
 Tue,  6 Jun 2023 16:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686063404;
 bh=R8AYt/ewVAHj+Szdux6YlwDq7lNAGZTqe0BsGM89Nmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGPkSDwqpzM2HtVZeK6lj8xOjIINrXtl8oF5TUQw4McN77mvC8uvNDUpvPKIOVyC0
 /5SIZsczH29kOs4OtsUfr2c88G944zpDWVX4uKhkHy/CEg7Q/bW40koJagtXWc0i9r
 Fvf+d44+lCg/XQbC5kWobnh11hb/5ZVW3Hcp+H0I=
Date: Tue, 6 Jun 2023 17:57:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 6/8] drm: Remove usage of deprecated DRM_DEBUG
Message-ID: <20230606145706.GE7234@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <3b880e4a20b7952b257b896900256fcfff14b153.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b880e4a20b7952b257b896900256fcfff14b153.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:20PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_DEBUG is deprecated in favor of drm_dbg_core().
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  drivers/gpu/drm/drm_agpsupport.c  |   4 +-
>  drivers/gpu/drm/drm_bufs.c        | 114 +++++++++++++++---------------
>  drivers/gpu/drm/drm_context.c     |  14 ++--
>  drivers/gpu/drm/drm_dma.c         |  10 +--
>  drivers/gpu/drm/drm_drv.c         |  10 +--
>  drivers/gpu/drm/drm_gem.c         |   5 +-
>  drivers/gpu/drm/drm_hashtab.c     |   6 +-
>  drivers/gpu/drm/drm_irq.c         |   4 +-
>  drivers/gpu/drm/drm_lease.c       |   2 +-
>  drivers/gpu/drm/drm_legacy_misc.c |   4 +-
>  drivers/gpu/drm/drm_lock.c        |  20 +++---
>  drivers/gpu/drm/drm_mode_object.c |   6 +-
>  drivers/gpu/drm/drm_pci.c         |  12 ++--
>  drivers/gpu/drm/drm_plane.c       |  12 ++--
>  drivers/gpu/drm/drm_scatter.c     |  10 +--
>  drivers/gpu/drm/drm_syncobj.c     |   2 +-
>  drivers/gpu/drm/drm_sysfs.c       |  14 ++--
>  drivers/gpu/drm/drm_vm.c          |  43 ++++++-----
>  18 files changed, 150 insertions(+), 142 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
> index a4ad6fd13abc..d27686d6e82d 100644
> --- a/drivers/gpu/drm/drm_agpsupport.c
> +++ b/drivers/gpu/drm/drm_agpsupport.c
> @@ -315,8 +315,8 @@ int drm_legacy_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
>  	if (retcode)
>  		return retcode;
>  	entry->bound = dev->agp->base + (page << PAGE_SHIFT);
> -	DRM_DEBUG("base = 0x%lx entry->bound = 0x%lx\n",
> -		  dev->agp->base, entry->bound);
> +	drm_dbg_core(dev, "base = 0x%lx entry->bound = 0x%lx\n",
> +		     dev->agp->base, entry->bound);
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_legacy_agp_bind);
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index aa66fe16ea6e..a767f51c5369 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -171,8 +171,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  		kfree(map);
>  		return -EINVAL;
>  	}
> -	DRM_DEBUG("offset = 0x%08llx, size = 0x%08lx, type = %d\n",
> -		  (unsigned long long)map->offset, map->size, map->type);
> +	drm_dbg_core(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
> +		     (unsigned long long)map->offset, map->size, map->type);
>  
>  	/* page-align _DRM_SHM maps. They are allocated here so there is no security
>  	 * hole created by that and it works around various broken drivers that use
> @@ -205,10 +205,10 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  		list = drm_find_matching_map(dev, map);
>  		if (list != NULL) {
>  			if (list->map->size != map->size) {
> -				DRM_DEBUG("Matching maps of type %d with "
> -					  "mismatched sizes, (%ld vs %ld)\n",
> -					  map->type, map->size,
> -					  list->map->size);
> +				drm_dbg_core(dev, "Matching maps of type %d with "
> +					     "mismatched sizes, (%ld vs %ld)\n",
> +					     map->type, map->size,
> +					     list->map->size);
>  				list->map->size = map->size;
>  			}
>  
> @@ -239,9 +239,9 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  		list = drm_find_matching_map(dev, map);
>  		if (list != NULL) {
>  			if (list->map->size != map->size) {
> -				DRM_DEBUG("Matching maps of type %d with "
> -					  "mismatched sizes, (%ld vs %ld)\n",
> -					  map->type, map->size, list->map->size);
> +				drm_dbg_core(dev, "Matching maps of type %d with "
> +					     "mismatched sizes, (%ld vs %ld)\n",
> +					     map->type, map->size, list->map->size);
>  				list->map->size = map->size;
>  			}
>  
> @@ -250,8 +250,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  			return 0;
>  		}
>  		map->handle = vmalloc_user(map->size);
> -		DRM_DEBUG("%lu %d %p\n",
> -			  map->size, order_base_2(map->size), map->handle);
> +		drm_dbg_core(dev, "%lu %d %p\n",
> +			     map->size, order_base_2(map->size), map->handle);
>  		if (!map->handle) {
>  			kfree(map);
>  			return -ENOMEM;
> @@ -308,8 +308,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  			kfree(map);
>  			return -EPERM;
>  		}
> -		DRM_DEBUG("AGP offset = 0x%08llx, size = 0x%08lx\n",
> -			  (unsigned long long)map->offset, map->size);
> +		drm_dbg_core(dev, "AGP offset = 0x%08llx, size = 0x%08lx\n",
> +			     (unsigned long long)map->offset, map->size);
>  
>  		break;
>  	}
> @@ -745,13 +745,13 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
>  	byte_count = 0;
>  	agp_offset = dev->agp->base + request->agp_start;
>  
> -	DRM_DEBUG("count:      %d\n", count);
> -	DRM_DEBUG("order:      %d\n", order);
> -	DRM_DEBUG("size:       %d\n", size);
> -	DRM_DEBUG("agp_offset: %lx\n", agp_offset);
> -	DRM_DEBUG("alignment:  %d\n", alignment);
> -	DRM_DEBUG("page_order: %d\n", page_order);
> -	DRM_DEBUG("total:      %d\n", total);
> +	drm_dbg_core(dev, "count:      %d\n", count);
> +	drm_dbg_core(dev, "order:      %d\n", order);
> +	drm_dbg_core(dev, "size:       %d\n", size);
> +	drm_dbg_core(dev, "agp_offset: %lx\n", agp_offset);
> +	drm_dbg_core(dev, "alignment:  %d\n", alignment);
> +	drm_dbg_core(dev, "page_order: %d\n", page_order);
> +	drm_dbg_core(dev, "total:      %d\n", total);
>  
>  	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
>  		return -EINVAL;
> @@ -766,7 +766,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
>  		}
>  	}
>  	if (!list_empty(&dev->agp->memory) && !valid) {
> -		DRM_DEBUG("zone invalid\n");
> +		drm_dbg_core(dev, "zone invalid\n");
>  		return -EINVAL;
>  	}
>  	spin_lock(&dev->buf_lock);
> @@ -829,14 +829,15 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
>  			return -ENOMEM;
>  		}
>  
> -		DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
> +		drm_dbg_core(dev, "buffer %d @ %p\n", entry->buf_count,
> +			     buf->address);
>  
>  		offset += alignment;
>  		entry->buf_count++;
>  		byte_count += PAGE_SIZE << page_order;
>  	}
>  
> -	DRM_DEBUG("byte_count: %d\n", byte_count);
> +	drm_dbg_core(dev, "byte_count: %d\n", byte_count);
>  
>  	temp_buflist = krealloc(dma->buflist,
>  				(dma->buf_count + entry->buf_count) *
> @@ -859,8 +860,8 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
>  	dma->page_count += byte_count >> PAGE_SHIFT;
>  	dma->byte_count += byte_count;
>  
> -	DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
> -	DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
> +	drm_dbg_core(dev, "dma->buf_count : %d\n", dma->buf_count);
> +	drm_dbg_core(dev, "entry->buf_count : %d\n", entry->buf_count);
>  
>  	mutex_unlock(&dev->struct_mutex);
>  
> @@ -908,8 +909,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  	order = order_base_2(request->size);
>  	size = 1 << order;
>  
> -	DRM_DEBUG("count=%d, size=%d (%d), order=%d\n",
> -		  request->count, request->size, size, order);
> +	drm_dbg_core(dev, "count=%d, size=%d (%d), order=%d\n",
> +		     request->count, request->size, size, order);
>  
>  	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
>  		return -EINVAL;
> @@ -971,8 +972,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  	}
>  	memcpy(temp_pagelist,
>  	       dma->pagelist, dma->page_count * sizeof(*dma->pagelist));
> -	DRM_DEBUG("pagelist: %d entries\n",
> -		  dma->page_count + (count << page_order));
> +	drm_dbg_core(dev, "pagelist: %d entries\n",
> +		     dma->page_count + (count << page_order));
>  
>  	entry->buf_size = size;
>  	entry->page_order = page_order;
> @@ -1011,9 +1012,9 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  		}
>  		entry->seglist[entry->seg_count++] = dmah;
>  		for (i = 0; i < (1 << page_order); i++) {
> -			DRM_DEBUG("page %d @ 0x%08lx\n",
> -				  dma->page_count + page_count,
> -				  (unsigned long)dmah->vaddr + PAGE_SIZE * i);
> +			drm_dbg_core(dev, "page %d @ 0x%08lx\n",
> +				     dma->page_count + page_count,
> +				     (unsigned long)dmah->vaddr + PAGE_SIZE * i);
>  			temp_pagelist[dma->page_count + page_count++]
>  				= (unsigned long)dmah->vaddr + PAGE_SIZE * i;
>  		}
> @@ -1047,8 +1048,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  				return -ENOMEM;
>  			}
>  
> -			DRM_DEBUG("buffer %d @ %p\n",
> -				  entry->buf_count, buf->address);
> +			drm_dbg_core(dev, "buffer %d @ %p\n",
> +				     entry->buf_count, buf->address);
>  		}
>  		byte_count += PAGE_SIZE << page_order;
>  	}
> @@ -1136,13 +1137,13 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
>  	byte_count = 0;
>  	agp_offset = request->agp_start;
>  
> -	DRM_DEBUG("count:      %d\n", count);
> -	DRM_DEBUG("order:      %d\n", order);
> -	DRM_DEBUG("size:       %d\n", size);
> -	DRM_DEBUG("agp_offset: %lu\n", agp_offset);
> -	DRM_DEBUG("alignment:  %d\n", alignment);
> -	DRM_DEBUG("page_order: %d\n", page_order);
> -	DRM_DEBUG("total:      %d\n", total);
> +	drm_dbg_core(dev, "count:      %d\n", count);
> +	drm_dbg_core(dev, "order:      %d\n", order);
> +	drm_dbg_core(dev, "size:       %d\n", size);
> +	drm_dbg_core(dev, "agp_offset: %lu\n", agp_offset);
> +	drm_dbg_core(dev, "alignment:  %d\n", alignment);
> +	drm_dbg_core(dev, "page_order: %d\n", page_order);
> +	drm_dbg_core(dev, "total:      %d\n", total);
>  
>  	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
>  		return -EINVAL;
> @@ -1208,14 +1209,15 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
>  			return -ENOMEM;
>  		}
>  
> -		DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
> +		drm_dbg_core(dev, "buffer %d @ %p\n", entry->buf_count,
> +			     buf->address);
>  
>  		offset += alignment;
>  		entry->buf_count++;
>  		byte_count += PAGE_SIZE << page_order;
>  	}
>  
> -	DRM_DEBUG("byte_count: %d\n", byte_count);
> +	drm_dbg_core(dev, "byte_count: %d\n", byte_count);
>  
>  	temp_buflist = krealloc(dma->buflist,
>  				(dma->buf_count + entry->buf_count) *
> @@ -1238,8 +1240,8 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
>  	dma->page_count += byte_count >> PAGE_SHIFT;
>  	dma->byte_count += byte_count;
>  
> -	DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
> -	DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
> +	drm_dbg_core(dev, "dma->buf_count : %d\n", dma->buf_count);
> +	drm_dbg_core(dev, "entry->buf_count : %d\n", entry->buf_count);
>  
>  	mutex_unlock(&dev->struct_mutex);
>  
> @@ -1340,7 +1342,7 @@ int __drm_legacy_infobufs(struct drm_device *dev,
>  			++count;
>  	}
>  
> -	DRM_DEBUG("count = %d\n", count);
> +	drm_dbg_core(dev, "count = %d\n", count);
>  
>  	if (*p >= count) {
>  		for (i = 0, count = 0; i < DRM_MAX_ORDER + 1; i++) {
> @@ -1349,12 +1351,12 @@ int __drm_legacy_infobufs(struct drm_device *dev,
>  			if (from->buf_count) {
>  				if (f(data, count, from) < 0)
>  					return -EFAULT;
> -				DRM_DEBUG("%d %d %d %d %d\n",
> -					  i,
> -					  dma->bufs[i].buf_count,
> -					  dma->bufs[i].buf_size,
> -					  dma->bufs[i].low_mark,
> -					  dma->bufs[i].high_mark);
> +				drm_dbg_core(dev, "%d %d %d %d %d\n",
> +					     i,
> +					     dma->bufs[i].buf_count,
> +					     dma->bufs[i].buf_size,
> +					     dma->bufs[i].low_mark,
> +					     dma->bufs[i].high_mark);
>  				++count;
>  			}
>  		}
> @@ -1417,8 +1419,8 @@ int drm_legacy_markbufs(struct drm_device *dev, void *data,
>  	if (!dma)
>  		return -EINVAL;
>  
> -	DRM_DEBUG("%d, %d, %d\n",
> -		  request->size, request->low_mark, request->high_mark);
> +	drm_dbg_core(dev, "%d, %d, %d\n",
> +		     request->size, request->low_mark, request->high_mark);
>  	order = order_base_2(request->size);
>  	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
>  		return -EINVAL;
> @@ -1465,7 +1467,7 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
>  	if (!dma)
>  		return -EINVAL;
>  
> -	DRM_DEBUG("%d\n", request->count);
> +	drm_dbg_core(dev, "%d\n", request->count);
>  	for (i = 0; i < request->count; i++) {
>  		if (copy_from_user(&idx, &request->list[i], sizeof(idx)))
>  			return -EFAULT;
> @@ -1565,7 +1567,7 @@ int __drm_legacy_mapbufs(struct drm_device *dev, void *data, int *p,
>  	}
>        done:
>  	*p = dma->buf_count;
> -	DRM_DEBUG("%d buffers, retcode = %d\n", *p, retcode);
> +	drm_dbg_core(dev, "%d buffers, retcode = %d\n", *p, retcode);
>  
>  	return retcode;
>  }
> diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
> index bf1fc8bb97de..8b7b925aee97 100644
> --- a/drivers/gpu/drm/drm_context.c
> +++ b/drivers/gpu/drm/drm_context.c
> @@ -274,7 +274,7 @@ static int drm_context_switch(struct drm_device * dev, int old, int new)
>  		return -EBUSY;
>  	}
>  
> -	DRM_DEBUG("Context switch from %d to %d\n", old, new);
> +	drm_dbg_core(dev, "Context switch from %d to %d\n", old, new);
>  
>  	if (new == dev->last_context) {
>  		clear_bit(0, &dev->context_flag);
> @@ -371,9 +371,9 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
>  		/* Skip kernel's context and get a new one. */
>  		tmp_handle = drm_legacy_ctxbitmap_next(dev);
>  	}
> -	DRM_DEBUG("%d\n", tmp_handle);
> +	drm_dbg_core(dev, "%d\n", tmp_handle);
>  	if (tmp_handle < 0) {
> -		DRM_DEBUG("Not enough free contexts.\n");
> +		drm_dbg_core(dev, "Not enough free contexts.\n");
>  		/* Should this return -EBUSY instead? */
>  		return tmp_handle;
>  	}
> @@ -382,7 +382,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
>  
>  	ctx_entry = kmalloc(sizeof(*ctx_entry), GFP_KERNEL);
>  	if (!ctx_entry) {
> -		DRM_DEBUG("out of memory\n");
> +		drm_dbg_core(dev, "out of memory\n");

This message could also be dropped.

>  		return -ENOMEM;
>  	}
>  
> @@ -439,7 +439,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>  		return -EOPNOTSUPP;
>  
> -	DRM_DEBUG("%d\n", ctx->handle);
> +	drm_dbg_core(dev, "%d\n", ctx->handle);
>  	return drm_context_switch(dev, dev->last_context, ctx->handle);
>  }
>  
> @@ -462,7 +462,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>  		return -EOPNOTSUPP;
>  
> -	DRM_DEBUG("%d\n", ctx->handle);
> +	drm_dbg_core(dev, "%d\n", ctx->handle);
>  	drm_context_switch_complete(dev, file_priv, ctx->handle);
>  
>  	return 0;
> @@ -487,7 +487,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>  		return -EOPNOTSUPP;
>  
> -	DRM_DEBUG("%d\n", ctx->handle);
> +	drm_dbg_core(dev, "%d\n", ctx->handle);
>  	if (ctx->handle != DRM_KERNEL_CONTEXT) {
>  		if (dev->driver->context_dtor)
>  			dev->driver->context_dtor(dev, ctx->handle);
> diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> index eb6b741a6f99..dac137072c33 100644
> --- a/drivers/gpu/drm/drm_dma.c
> +++ b/drivers/gpu/drm/drm_dma.c
> @@ -94,11 +94,11 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
>  	/* Clear dma buffers */
>  	for (i = 0; i <= DRM_MAX_ORDER; i++) {
>  		if (dma->bufs[i].seg_count) {
> -			DRM_DEBUG("order %d: buf_count = %d,"
> -				  " seg_count = %d\n",
> -				  i,
> -				  dma->bufs[i].buf_count,
> -				  dma->bufs[i].seg_count);
> +			drm_dbg_core(dev, "order %d: buf_count = %d,"
> +				     " seg_count = %d\n",
> +				     i,
> +				     dma->bufs[i].buf_count,
> +				     dma->bufs[i].seg_count);
>  			for (j = 0; j < dma->bufs[i].seg_count; j++) {
>  				if (dma->bufs[i].seglist[j]) {
>  					dmah = dma->bufs[i].seglist[j];
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 04246afc934f..7adf10cc6e67 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -166,7 +166,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  	unsigned long flags;
>  	int ret;
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(dev, "\n");

This message seems of dubious value :-) Maybe you could drop it in a
patch on top of this series ?

>  
>  	minor = *drm_minor_get_slot(dev, type);
>  	if (!minor)
> @@ -195,7 +195,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  		spin_unlock_irqrestore(&drm_minor_lock, flags);
>  	}
>  
> -	DRM_DEBUG("new minor registered %d\n", minor->index);
> +	drm_dbg_core(dev, "new minor registered %d\n", minor->index);
>  	return 0;
>  
>  err_debugfs:
> @@ -422,7 +422,7 @@ void drm_minor_release(struct drm_minor *minor)
>   */
>  void drm_put_dev(struct drm_device *dev)
>  {
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(NULL, "\n");

This is even worse :-) The next two messages are also fairly useless,
they should be expanded, or dropped.

>  
>  	if (!dev) {
>  		drm_err(NULL, "cleanup called no dev\n");
> @@ -1030,7 +1030,7 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
>  	struct drm_minor *minor;
>  	int err;
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(NULL, "\n");
>  
>  	minor = drm_minor_acquire(iminor(inode));
>  	if (IS_ERR(minor))
> @@ -1099,7 +1099,7 @@ static int __init drm_core_init(void)
>  
>  	drm_core_init_complete = true;
>  
> -	DRM_DEBUG("Initialized\n");
> +	drm_dbg_core(NULL, "Initialized\n");
>  	return 0;
>  
>  error:
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index e0d52e69df15..3d88f0483fdf 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -705,7 +705,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>  
>  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>  		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in GEM handles\n");
> +		drm_dbg_core(filp->minor->dev, "Failed to copy in GEM handles\n");
>  		goto out;
>  	}
>  
> @@ -760,7 +760,8 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>  
>  	obj = drm_gem_object_lookup(filep, handle);
>  	if (!obj) {
> -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +		drm_dbg_core(filep->minor->dev,
> +			     "Failed to look up GEM BO %d\n", handle);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
> index a1ebf8e056c7..357f20d73b43 100644
> --- a/drivers/gpu/drm/drm_hashtab.c
> +++ b/drivers/gpu/drm/drm_hashtab.c
> @@ -67,10 +67,12 @@ void drm_ht_verbose_list(struct drm_open_hash *ht, unsigned long key)
>  	int count = 0;
>  
>  	hashed_key = hash_long(key, ht->order);
> -	DRM_DEBUG("Key is 0x%08lx, Hashed key is 0x%08x\n", key, hashed_key);
> +	drm_dbg_core(NULL, "Key is 0x%08lx, Hashed key is 0x%08x\n",
> +		     key, hashed_key);
>  	h_list = &ht->table[hashed_key];
>  	hlist_for_each_entry(entry, h_list, head)
> -		DRM_DEBUG("count %d, key: 0x%08lx\n", count++, entry->key);
> +		drm_dbg_core(NULL, "count %d, key: 0x%08lx\n",
> +			     count++, entry->key);
>  }
>  
>  static struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht,
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index d327638e15ee..e70d6975310c 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -78,7 +78,7 @@ static int drm_legacy_irq_install(struct drm_device *dev, int irq)
>  		return -EBUSY;
>  	dev->irq_enabled = true;
>  
> -	DRM_DEBUG("irq=%d\n", irq);
> +	drm_dbg_core(dev, "irq=%d\n", irq);
>  
>  	/* Before installing handler */
>  	if (dev->driver->irq_preinstall)
> @@ -146,7 +146,7 @@ int drm_legacy_irq_uninstall(struct drm_device *dev)
>  	if (!irq_enabled)
>  		return -EINVAL;
>  
> -	DRM_DEBUG("irq=%d\n", dev->irq);
> +	drm_dbg_core(dev, "irq=%d\n", dev->irq);
>  
>  	if (drm_core_check_feature(dev, DRIVER_LEGACY))
>  		vga_client_unregister(to_pci_dev(dev->dev));
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 150fe1555068..af72fc38bb7c 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -677,7 +677,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  		count++;
>  	}
>  
> -	DRM_DEBUG("lease holds %d objects\n", count);
> +	drm_dbg_core(dev, "lease holds %d objects\n", count);
>  	if (ret == 0)
>  		arg->count_objects = count;
>  
> diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy_misc.c
> index d4c5434062d7..ad0eef292cb0 100644
> --- a/drivers/gpu/drm/drm_legacy_misc.c
> +++ b/drivers/gpu/drm/drm_legacy_misc.c
> @@ -70,7 +70,7 @@ int drm_legacy_setup(struct drm_device * dev)
>  		return ret;
>  
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(dev, "\n");

Ditto.

>  	return 0;
>  }
>  
> @@ -95,7 +95,7 @@ void drm_legacy_dev_reinit(struct drm_device *dev)
>  	dev->last_context = 0;
>  	dev->if_version = 0;
>  
> -	DRM_DEBUG("lastclose completed\n");
> +	drm_dbg_core(dev, "lastclose completed\n");
>  }
>  
>  void drm_master_legacy_init(struct drm_master *master)
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index 411f75a1ee14..fea573dcb016 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -180,10 +180,10 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  	}
>  
> -	DRM_DEBUG("%d (pid %d) requests lock (0x%08x), flags = 0x%08x\n",
> -		  lock->context, task_pid_nr(current),
> -		  master->lock.hw_lock ? master->lock.hw_lock->lock : -1,
> -		  lock->flags);
> +	drm_dbg_core(dev, "%d (pid %d) requests lock (0x%08x), flags = 0x%08x\n",
> +		     lock->context, task_pid_nr(current),
> +		     master->lock.hw_lock ? master->lock.hw_lock->lock : -1,
> +		     lock->flags);
>  
>  	add_wait_queue(&master->lock.lock_queue, &entry);
>  	spin_lock_bh(&master->lock.spinlock);
> @@ -219,8 +219,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
>  	__set_current_state(TASK_RUNNING);
>  	remove_wait_queue(&master->lock.lock_queue, &entry);
>  
> -	DRM_DEBUG("%d %s\n", lock->context,
> -		  ret ? "interrupted" : "has lock");
> +	drm_dbg_core(dev, "%d %s\n", lock->context,
> +		     ret ? "interrupted" : "has lock");
>  	if (ret) return ret;
>  
>  	/* don't set the block all signals on the master process for now 
> @@ -234,8 +234,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
>  	if (dev->driver->dma_quiescent && (lock->flags & _DRM_LOCK_QUIESCENT))
>  	{
>  		if (dev->driver->dma_quiescent(dev)) {
> -			DRM_DEBUG("%d waiting for DMA quiescent\n",
> -				  lock->context);
> +			drm_dbg_core(dev, "%d waiting for DMA quiescent\n",
> +				     lock->context);
>  			return -EBUSY;
>  		}
>  	}
> @@ -345,8 +345,8 @@ void drm_legacy_lock_release(struct drm_device *dev, struct file *filp)
>  		return;
>  
>  	if (drm_legacy_i_have_hw_lock(dev, file_priv)) {
> -		DRM_DEBUG("File %p released, freeing lock for context %d\n",
> -			  filp, _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->lock));
> +		drm_dbg_core(dev, "File %p released, freeing lock for context %d\n",
> +			     filp, _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->lock));
>  		drm_legacy_lock_free(&file_priv->master->lock,
>  				     _DRM_LOCKING_CONTEXT(file_priv->master->lock.hw_lock->lock));
>  	}
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index ba1608effc0f..6e5a970043fc 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -192,7 +192,8 @@ EXPORT_SYMBOL(drm_mode_object_find);
>  void drm_mode_object_put(struct drm_mode_object *obj)
>  {
>  	if (obj->free_cb) {
> -		DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
> +		drm_dbg_core(NULL, "OBJ ID: %d (%d)\n", obj->id,
> +			     kref_read(&obj->refcount));
>  		kref_put(&obj->refcount, obj->free_cb);
>  	}
>  }
> @@ -209,7 +210,8 @@ EXPORT_SYMBOL(drm_mode_object_put);
>  void drm_mode_object_get(struct drm_mode_object *obj)
>  {
>  	if (obj->free_cb) {
> -		DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
> +		drm_dbg_core(NULL, "OBJ ID: %d (%d)\n", obj->id,
> +			     kref_read(&obj->refcount));
>  		kref_get(&obj->refcount);
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 7dfb837d1325..485ec407a115 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -85,8 +85,8 @@ static int drm_legacy_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_bu
>  
>  	p->irq = pdev->irq;
>  
> -	DRM_DEBUG("%d:%d:%d => IRQ %d\n", p->busnum, p->devnum, p->funcnum,
> -		  p->irq);
> +	drm_dbg_core(dev, "%d:%d:%d => IRQ %d\n",
> +		     p->busnum, p->devnum, p->funcnum, p->irq);
>  	return 0;
>  }
>  
> @@ -151,12 +151,12 @@ static int drm_legacy_get_pci_dev(struct pci_dev *pdev,
>  	struct drm_device *dev;
>  	int ret;
>  
> -	DRM_DEBUG("\n");
> -
>  	dev = drm_dev_alloc(driver, &pdev->dev);
>  	if (IS_ERR(dev))
>  		return PTR_ERR(dev);
>  
> +	drm_dbg_core(dev, "\n");
> +

Same, and the two messages below too.

>  	ret = pci_enable_device(pdev);
>  	if (ret)
>  		goto err_free;
> @@ -203,7 +203,7 @@ int drm_legacy_pci_init(const struct drm_driver *driver,
>  	const struct pci_device_id *pid;
>  	int i;
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(NULL, "\n");
>  
>  	if (WARN_ON(!(driver->driver_features & DRIVER_LEGACY)))
>  		return -EINVAL;
> @@ -247,7 +247,7 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
>  {
>  	struct drm_device *dev, *tmp;
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(NULL, "\n");
>  
>  	if (!(driver->driver_features & DRIVER_LEGACY)) {
>  		WARN_ON(1);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index fc11efd5e560..1e8727b7bce9 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1260,17 +1260,19 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		switch (page_flip->flags & DRM_MODE_PAGE_FLIP_TARGET) {
>  		case DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE:
>  			if ((int)(target_vblank - current_vblank) > 1) {
> -				DRM_DEBUG("Invalid absolute flip target %u, "
> -					  "must be <= %u\n", target_vblank,
> -					  current_vblank + 1);
> +				drm_dbg_core(dev,
> +					     "Invalid absolute flip target %u, "
> +					     "must be <= %u\n", target_vblank,
> +					     current_vblank + 1);
>  				drm_crtc_vblank_put(crtc);
>  				return -EINVAL;
>  			}
>  			break;
>  		case DRM_MODE_PAGE_FLIP_TARGET_RELATIVE:
>  			if (target_vblank != 0 && target_vblank != 1) {
> -				DRM_DEBUG("Invalid relative flip target %u, "
> -					  "must be 0 or 1\n", target_vblank);
> +				drm_dbg_core(dev,
> +					     "Invalid relative flip target %u, "
> +					     "must be 0 or 1\n", target_vblank);
>  				drm_crtc_vblank_put(crtc);
>  				return -EINVAL;
>  			}
> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> index 5b0b2140d535..08b3eb586484 100644
> --- a/drivers/gpu/drm/drm_scatter.c
> +++ b/drivers/gpu/drm/drm_scatter.c
> @@ -82,7 +82,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  	struct drm_sg_mem *entry;
>  	unsigned long pages, i, j;
>  
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(dev, "\n");

Here too.

With the commit subject fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>  		return -EOPNOTSUPP;
> @@ -101,7 +101,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  		return -ENOMEM;
>  
>  	pages = (request->size + PAGE_SIZE - 1) / PAGE_SIZE;
> -	DRM_DEBUG("size=%ld pages=%ld\n", request->size, pages);
> +	drm_dbg_core(dev, "size=%ld pages=%ld\n", request->size, pages);
>  
>  	entry->pages = pages;
>  	entry->pagelist = kcalloc(pages, sizeof(*entry->pagelist), GFP_KERNEL);
> @@ -132,8 +132,8 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  
>  	entry->handle = ScatterHandle((unsigned long)entry->virtual);
>  
> -	DRM_DEBUG("handle  = %08lx\n", entry->handle);
> -	DRM_DEBUG("virtual = %p\n", entry->virtual);
> +	drm_dbg_core(dev, "handle  = %08lx\n", entry->handle);
> +	drm_dbg_core(dev, "virtual = %p\n", entry->virtual);
>  
>  	for (i = (unsigned long)entry->virtual, j = 0; j < pages;
>  	     i += PAGE_SIZE, j++) {
> @@ -213,7 +213,7 @@ int drm_legacy_sg_free(struct drm_device *dev, void *data,
>  	if (!entry || entry->handle != request->handle)
>  		return -EINVAL;
>  
> -	DRM_DEBUG("virtual  = %p\n", entry->virtual);
> +	drm_dbg_core(dev, "virtual  = %p\n", entry->virtual);
>  
>  	drm_sg_cleanup(entry);
>  
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..e84957a0f319 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -298,7 +298,7 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
>  	prev = drm_syncobj_fence_get(syncobj);
>  	/* You are adding an unorder point to timeline, which could cause payload returned from query_ioctl is 0! */
>  	if (prev && prev->seqno >= point)
> -		DRM_DEBUG("You are adding an unorder point to timeline!\n");
> +		drm_dbg_core(NULL, "You are adding an unorder point to timeline!\n");
>  	dma_fence_chain_init(chain, prev, fence, point);
>  	rcu_assign_pointer(syncobj->fence, &chain->base);
>  
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index f62767ff34b2..b7c6754b4688 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -383,8 +383,8 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>  	if (r)
>  		goto err_free;
>  
> -	DRM_DEBUG("adding \"%s\" to sysfs\n",
> -		  connector->name);
> +	drm_dbg_core(dev, "adding \"%s\" to sysfs\n",
> +		     connector->name);
>  
>  	r = device_add(kdev);
>  	if (r) {
> @@ -422,8 +422,8 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
>  	if (dev_fwnode(connector->kdev))
>  		component_del(connector->kdev, &typec_connector_ops);
>  
> -	DRM_DEBUG("removing \"%s\" from sysfs\n",
> -		  connector->name);
> +	drm_dbg_core(connector->dev, "removing \"%s\" from sysfs\n",
> +		     connector->name);
>  
>  	device_unregister(connector->kdev);
>  	connector->kdev = NULL;
> @@ -434,7 +434,7 @@ void drm_sysfs_lease_event(struct drm_device *dev)
>  	char *event_string = "LEASE=1";
>  	char *envp[] = { event_string, NULL };
>  
> -	DRM_DEBUG("generating lease event\n");
> +	drm_dbg_core(dev, "generating lease event\n");
>  
>  	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
> @@ -455,7 +455,7 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  	char *event_string = "HOTPLUG=1";
>  	char *envp[] = { event_string, NULL };
>  
> -	DRM_DEBUG("generating hotplug event\n");
> +	drm_dbg_core(dev, "generating hotplug event\n");
>  
>  	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
> @@ -511,7 +511,7 @@ void drm_sysfs_connector_status_event(struct drm_connector *connector,
>  	snprintf(prop_id, ARRAY_SIZE(prop_id),
>  		 "PROPERTY=%u", property->base.id);
>  
> -	DRM_DEBUG("generating connector status event\n");
> +	drm_dbg_core(dev, "generating connector status event\n");
>  
>  	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 03c0a4e6e77b..966ba9e46034 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -168,12 +168,11 @@ static vm_fault_t drm_vm_fault(struct vm_fault *vmf)
>  		get_page(page);
>  		vmf->page = page;
>  
> -		DRM_DEBUG
> -		    ("baddr = 0x%llx page = 0x%p, offset = 0x%llx, count=%d\n",
> -		     (unsigned long long)baddr,
> -		     agpmem->memory->pages[offset],
> -		     (unsigned long long)offset,
> -		     page_count(page));
> +		drm_dbg_core(dev, "baddr = 0x%llx page = 0x%p, offset = 0x%llx, count=%d\n",
> +			     (unsigned long long)baddr,
> +			     agpmem->memory->pages[offset],
> +			     (unsigned long long)offset,
> +			     page_count(page));
>  		return 0;
>  	}
>  vm_fault_error:
> @@ -215,7 +214,7 @@ static vm_fault_t drm_vm_shm_fault(struct vm_fault *vmf)
>  	get_page(page);
>  	vmf->page = page;
>  
> -	DRM_DEBUG("shm_fault 0x%lx\n", offset);
> +	drm_dbg_core(NULL, "shm_fault 0x%lx\n", offset);
>  	return 0;
>  }
>  
> @@ -236,8 +235,8 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
>  	struct drm_map_list *r_list;
>  	int found_maps = 0;
>  
> -	DRM_DEBUG("0x%08lx,0x%08lx\n",
> -		  vma->vm_start, vma->vm_end - vma->vm_start);
> +	drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
> +		     vma->vm_start, vma->vm_end - vma->vm_start);
>  
>  	map = vma->vm_private_data;
>  
> @@ -319,7 +318,7 @@ static vm_fault_t drm_vm_dma_fault(struct vm_fault *vmf)
>  	get_page(page);
>  	vmf->page = page;
>  
> -	DRM_DEBUG("dma_fault 0x%lx (page %lu)\n", offset, page_nr);
> +	drm_dbg_core(dev, "dma_fault 0x%lx (page %lu)\n", offset, page_nr);
>  	return 0;
>  }
>  
> @@ -391,8 +390,8 @@ static void drm_vm_open_locked(struct drm_device *dev,
>  {
>  	struct drm_vma_entry *vma_entry;
>  
> -	DRM_DEBUG("0x%08lx,0x%08lx\n",
> -		  vma->vm_start, vma->vm_end - vma->vm_start);
> +	drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
> +		     vma->vm_start, vma->vm_end - vma->vm_start);
>  
>  	vma_entry = kmalloc(sizeof(*vma_entry), GFP_KERNEL);
>  	if (vma_entry) {
> @@ -417,8 +416,8 @@ static void drm_vm_close_locked(struct drm_device *dev,
>  {
>  	struct drm_vma_entry *pt, *temp;
>  
> -	DRM_DEBUG("0x%08lx,0x%08lx\n",
> -		  vma->vm_start, vma->vm_end - vma->vm_start);
> +	drm_dbg_core(dev, "0x%08lx,0x%08lx\n",
> +		     vma->vm_start, vma->vm_end - vma->vm_start);
>  
>  	list_for_each_entry_safe(pt, temp, &dev->vmalist, head) {
>  		if (pt->vma == vma) {
> @@ -466,8 +465,8 @@ static int drm_mmap_dma(struct file *filp, struct vm_area_struct *vma)
>  
>  	dev = priv->minor->dev;
>  	dma = dev->dma;
> -	DRM_DEBUG("start = 0x%lx, end = 0x%lx, page offset = 0x%lx\n",
> -		  vma->vm_start, vma->vm_end, vma->vm_pgoff);
> +	drm_dbg_core(dev, "start = 0x%lx, end = 0x%lx, page offset = 0x%lx\n",
> +		     vma->vm_start, vma->vm_end, vma->vm_pgoff);
>  
>  	/* Length must match exact page count */
>  	if (!dma || (length >> PAGE_SHIFT) != dma->page_count) {
> @@ -528,8 +527,8 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
>  	resource_size_t offset = 0;
>  	struct drm_hash_item *hash;
>  
> -	DRM_DEBUG("start = 0x%lx, end = 0x%lx, page offset = 0x%lx\n",
> -		  vma->vm_start, vma->vm_end, vma->vm_pgoff);
> +	drm_dbg_core(dev, "start = 0x%lx, end = 0x%lx, page offset = 0x%lx\n",
> +		     vma->vm_start, vma->vm_end, vma->vm_pgoff);
>  
>  	if (!priv->authenticated)
>  		return -EACCES;
> @@ -600,10 +599,10 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
>  				       vma->vm_end - vma->vm_start,
>  				       vma->vm_page_prot))
>  			return -EAGAIN;
> -		DRM_DEBUG("   Type = %d; start = 0x%lx, end = 0x%lx,"
> -			  " offset = 0x%llx\n",
> -			  map->type,
> -			  vma->vm_start, vma->vm_end, (unsigned long long)(map->offset + offset));
> +		drm_dbg_core(dev,
> +			     "   Type = %d; start = 0x%lx, end = 0x%lx, offset = 0x%llx\n",
> +			     map->type, vma->vm_start, vma->vm_end,
> +			     (unsigned long long)(map->offset + offset));
>  
>  		vma->vm_ops = &drm_vm_ops;
>  		break;

-- 
Regards,

Laurent Pinchart
