Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F9AC664A
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A7410E22E;
	Wed, 28 May 2025 09:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fe3xO/OC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B72A10E2A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748425930; x=1779961930;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+8jeoOChyIR2EXYdUDL4jTq3QGeCn3LPTy/KFJV9ous=;
 b=Fe3xO/OCtbvEaTy3y0MN+ZOSP+u6zxNogv30mNG7rRGrVm3vl8cFlNex
 EYllY0gwr7Om7QMQtI+TICNQRawJ9Bh0UocyCbJ/GY+mA94eqw/H6OOpu
 zk9TJf18keFL9sSEx+i6RIRrNDqtFWTilSKeQgZOXNvZKfBDGJBfQlyEi
 IXO8rFOUPHUOjj6x1reY15PZqKd1O0F3VbEK7mqXuUhNUKXQ7mMkrOmB2
 lWQUA8v78OBrh1BeKMKWdXXJhr0l5+CAyZP7AZ2DCJTIXs1R2IQpfwWVJ
 qv965BxV0l4L3R2PnrS0wYn7i5sQJRFKvm2DXhqpbuhNjvAaL4I1cempW A==;
X-CSE-ConnectionGUID: uNKGxszOT6umVjZyiHvVfA==
X-CSE-MsgGUID: V/K/Dk6OTx61AucMpoxh5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50143850"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50143850"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:52:09 -0700
X-CSE-ConnectionGUID: N+19f2W/QqOkyOmSSMDnqQ==
X-CSE-MsgGUID: MgrZ4nMAQwCWWWId94NjNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148234776"
Received: from fbeltech-mobl2.ger.corp.intel.com (HELO [10.245.80.225])
 ([10.245.80.225])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:52:09 -0700
Message-ID: <9545d9c6-2cb7-454b-b364-5d3f7c749356@linux.intel.com>
Date: Wed, 28 May 2025 11:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Improve buffer object logging
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-fixes

On 5/6/2025 11:13 AM, Jacek Lawrynowicz wrote:
> - Fix missing alloc log when drm_gem_handle_create() fails in
>   drm_vma_node_allow() and open callback is not called
> - Add ivpu_bo->ctx_id that enables to log the actual context
>   id instead of using 0 as default
> - Add couple WARNs and errors so we can catch more memory
>   corruption issues
> 
> Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 25 +++++++++++++++++--------
>  drivers/accel/ivpu/ivpu_gem.h |  1 +
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index e0d242d9f3e50..a76cbf4761f8c 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -28,7 +28,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>  {
>  	ivpu_dbg(vdev, BO,
>  		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
> -		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
> +		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx_id,
>  		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
>  		 (bool)drm_gem_is_imported(&bo->base.base));
>  }
> @@ -94,8 +94,6 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>  		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>  	}
>  
> -	ivpu_dbg_bo(vdev, bo, "alloc");
> -
>  	mutex_unlock(&bo->lock);
>  
>  	drm_dev_exit(idx);
> @@ -215,7 +213,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>  	return ERR_PTR(ret);
>  }
>  
> -static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
> +static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, u32 ctx_id)
>  {
>  	struct drm_gem_shmem_object *shmem;
>  	struct ivpu_bo *bo;
> @@ -233,6 +231,7 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>  		return ERR_CAST(shmem);
>  
>  	bo = to_ivpu_bo(&shmem->base);
> +	bo->ctx_id = ctx_id;
>  	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
>  	bo->flags = flags;
>  
> @@ -240,6 +239,8 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>  	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>  	mutex_unlock(&vdev->bo_list_lock);
>  
> +	ivpu_dbg_bo(vdev, bo, "alloc");
> +
>  	return bo;
>  }
>  
> @@ -278,8 +279,13 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  	mutex_unlock(&vdev->bo_list_lock);
>  
>  	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> +	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
> +	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
>  
>  	ivpu_bo_unbind_locked(bo);
> +	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
> +	drm_WARN_ON(&vdev->drm, bo->ctx);
> +
>  	mutex_destroy(&bo->lock);
>  
>  	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
> @@ -314,7 +320,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  	if (size == 0)
>  		return -EINVAL;
>  
> -	bo = ivpu_bo_alloc(vdev, size, args->flags);
> +	bo = ivpu_bo_alloc(vdev, size, args->flags, file_priv->ctx.id);
>  	if (IS_ERR(bo)) {
>  		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
>  			 bo, file_priv->ctx.id, args->size, args->flags);
> @@ -322,7 +328,10 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  	}
>  
>  	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
> -	if (!ret)
> +	if (ret)
> +		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
> +			 bo, file_priv->ctx.id, args->size, args->flags);
> +	else
>  		args->vpu_addr = bo->vpu_addr;
>  
>  	drm_gem_object_put(&bo->base.base);
> @@ -345,7 +354,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->end));
>  	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
>  
> -	bo = ivpu_bo_alloc(vdev, size, flags);
> +	bo = ivpu_bo_alloc(vdev, size, flags, IVPU_GLOBAL_CONTEXT_MMU_SSID);
>  	if (IS_ERR(bo)) {
>  		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
>  			 bo, range->start, size, flags);
> @@ -452,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>  	mutex_lock(&bo->lock);
>  
>  	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
> -		   bo, bo->ctx ? bo->ctx->id : 0, bo->vpu_addr, bo->base.base.size,
> +		   bo, bo->ctx_id, bo->vpu_addr, bo->base.base.size,
>  		   bo->flags, kref_read(&bo->base.base.refcount));
>  
>  	if (bo->base.pages)
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index a222a9ec9d611..0c93118c85bd3 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -21,6 +21,7 @@ struct ivpu_bo {
>  	u64 vpu_addr;
>  	u32 flags;
>  	u32 job_status; /* Valid only for command buffer */
> +	u32 ctx_id;
>  	bool mmu_mapped;
>  };
>  

