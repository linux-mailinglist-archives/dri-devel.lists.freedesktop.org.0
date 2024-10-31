Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234479B7B1E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 13:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DDD10E0A3;
	Thu, 31 Oct 2024 12:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WDowDk4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAAB10E0A3;
 Thu, 31 Oct 2024 12:53:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so521762f8f.1; 
 Thu, 31 Oct 2024 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730379224; x=1730984024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZp81MB3h2HjKJgH4YH8v1deDEcr2tOUk1Lful773Kg=;
 b=WDowDk4utyq/BKH2w9EsW09CKp0bC3fPbIk2Uop/c/MmwkVFrUMzskqK+ma36q8CVM
 pQTJo0z8NgK6dY1bMF2LEhZ7sD5QnJbK2xKa74zT2BlOSb5gSZLyzKeS5o4Fk0Kwm24l
 Rga2oVzmIu4AUlV0DVLVyGLAzdV/iVOPY6VmFOibY81N6ZDt6MYYYIL+4mJuXphjQ8Y2
 wJn5UQ/6lpMyndmpDc2+OVltyRbd1MRkOPe8hIqi5XBV4NFGS8yOPOlYXMtpUcF3QMbw
 AMKBNDRIudkk59J750Gy6p2WrO4sWPtXxNRr5mfFdOhOZUkAfi7wyZZ6Isv9JJA++l4E
 RfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730379224; x=1730984024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZp81MB3h2HjKJgH4YH8v1deDEcr2tOUk1Lful773Kg=;
 b=D1xZm3m9H8uCLi6UJP1iynal7llxSFVgS2jBzCCgHbDUwCbJfIPz7Sfabd98uax/+3
 Ruuy7Zo465zGwPaNFWfQHjIHU8YKwCGtDftW3XhviPhUCAg6Cbd0PJYtoE/H1cEJWSRc
 rHl1sGy3+yUouhpeL1lnCglsID7THT6JtnowHOT3/Ui6iaXWzqTlP4+dak85x777Y2O2
 g16ch3mc+hTnTa9KaJ1HcYJXeG9LOwH+MUAPVyiqE+/dlE+AhSFCypamXG4x+PyJZkqT
 d2uCQMjAyAxSLgg7/F+fjqyrIm3/nLLYeTOGvpTPBQVXgYSZX1KybnGjoQAv9p88Nk1l
 rlCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR8b7l8hK0rcIFoBmE/fIuWAf3DrJdL2LX7oOLPuQZiET9noZ7tNdvbj7/7Gtv6dlOS6zcRUaNDQx9@lists.freedesktop.org,
 AJvYcCVzVmr17FhHbkJThwhJ2rmqZyhUP5vKUeDjTz6hL/JQCQRSzv9bd5okQHV/w1MHQmoI+9tnADuE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcGKOgdqVQYrjf0N3oCOXA0xWaakYYZUirB5UzNgfehjmfdyKS
 34hUZBair+cnR7zgeJeL+5tthNg10AindXKhFn/avIsg0aZJ+6FD
X-Google-Smtp-Source: AGHT+IG82UQg2DDX39kTAFe33aOhlQeI87elE/0EV3r0yQzUR9g5uDsPKJ+A2EHCSRpwNqIEkfRtLw==
X-Received: by 2002:a05:6000:1547:b0:374:cee6:c298 with SMTP id
 ffacd0b85a97d-381c149f634mr1906089f8f.21.1730379224084; 
 Thu, 31 Oct 2024 05:53:44 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e853esm56812505e9.8.2024.10.31.05.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 05:53:43 -0700 (PDT)
Message-ID: <a4b907e6-2a23-4e22-bc26-607f05c91821@gmail.com>
Date: Thu, 31 Oct 2024 13:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: track bo memory stats at runtime
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-6-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20241025174113.554-6-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 25.10.24 um 19:41 schrieb Yunxiang Li:
> Before, every time fdinfo is queried we try to lock all the BOs in the
> VM and calculate memory usage from scratch. This works okay if the
> fdinfo is rarely read and the VMs don't have a ton of BOs. If either of
> these conditions is not true, we get a massive performance hit.
>
> In this new revision, we track the BOs as they change states. This way
> when the fdinfo is queried we only need to take the status lock and copy
> out the usage stats with minimal impact to the runtime performance.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 107 +++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 189 +++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  12 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
>   8 files changed, 199 insertions(+), 141 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index b144404902255..1d8a0ff3c8604 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -36,6 +36,7 @@
>   #include "amdgpu_gem.h"
>   #include "amdgpu_dma_buf.h"
>   #include "amdgpu_xgmi.h"
> +#include "amdgpu_vm.h"
>   #include <drm/amdgpu_drm.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <linux/dma-buf.h>
> @@ -190,6 +191,13 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
>   	}
>   }
>   
> +static void amdgpu_dma_buf_release(struct dma_buf *buf)
> +{
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(buf->priv);
> +	amdgpu_vm_bo_update_shared(bo, -1);
> +	drm_gem_dmabuf_release(buf);

Please run checkpatch.pl on the patch. As far as I can see it would 
complain about the coding style here (empty line between declaration and 
code).

Not much of an issue but we would like to prevent upstream from 
complaining about such things.

> +}
> +
>   /**
>    * amdgpu_dma_buf_begin_cpu_access - &dma_buf_ops.begin_cpu_access implementation
>    * @dma_buf: Shared DMA buffer
> @@ -237,7 +245,7 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>   	.unpin = amdgpu_dma_buf_unpin,
>   	.map_dma_buf = amdgpu_dma_buf_map,
>   	.unmap_dma_buf = amdgpu_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> +	.release = amdgpu_dma_buf_release,
>   	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>   	.mmap = drm_gem_dmabuf_mmap,
>   	.vmap = drm_gem_dmabuf_vmap,
> @@ -265,8 +273,10 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>   		return ERR_PTR(-EPERM);
>   
>   	buf = drm_gem_prime_export(gobj, flags);
> -	if (!IS_ERR(buf))
> +	if (!IS_ERR(buf)) {
>   		buf->ops = &amdgpu_dmabuf_ops;
> +		amdgpu_vm_bo_update_shared(bo, +1);
> +	}
>   
>   	return buf;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 7a9573958d87c..e0e09f7b39d10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -60,7 +60,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	struct amdgpu_fpriv *fpriv = file->driver_priv;
>   	struct amdgpu_vm *vm = &fpriv->vm;
>   
> -	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST] = { };
>   	ktime_t usage[AMDGPU_HW_IP_NUM];
>   	const char *pl_name[] = {
>   		[TTM_PL_VRAM] = "vram",
> @@ -70,13 +70,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	unsigned int hw_ip, i;
>   	int ret;
>   
> -	ret = amdgpu_bo_reserve(vm->root.bo, false);
> -	if (ret)
> -		return;
> -
> -	amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
> -	amdgpu_bo_unreserve(vm->root.bo);
> -
> +	amdgpu_vm_get_memory(vm, stats);
>   	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
>   
>   	/*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2436b7c9ad12b..98563124ff99c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1156,7 +1156,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   		return;
>   
>   	abo = ttm_to_amdgpu_bo(bo);
> -	amdgpu_vm_bo_invalidate(abo, evict);
> +	amdgpu_vm_bo_move(abo, new_mem, evict);
>   
>   	amdgpu_bo_kunmap(abo);
>   
> @@ -1169,86 +1169,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   			     old_mem ? old_mem->mem_type : -1);
>   }
>   
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int sz)
> -{
> -	const unsigned int domain_to_pl[] = {
> -		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]	    = TTM_PL_SYSTEM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]	    = TTM_PL_TT,
> -		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]	    = TTM_PL_VRAM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]	    = AMDGPU_PL_GDS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]	    = AMDGPU_PL_GWS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_OA)]	    = AMDGPU_PL_OA,
> -		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
> -	};
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct ttm_resource *res = bo->tbo.resource;
> -	struct drm_gem_object *obj = &bo->tbo.base;
> -	uint64_t size = amdgpu_bo_size(bo);
> -	unsigned int type;
> -
> -	if (!res) {
> -		/*
> -		 * If no backing store use one of the preferred domain for basic
> -		 * stats. We take the MSB since that should give a reasonable
> -		 * view.
> -		 */
> -		BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
> -			     TTM_PL_VRAM < TTM_PL_SYSTEM);
> -		type = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
> -		if (!type)
> -			return;
> -		type--;
> -		if (drm_WARN_ON_ONCE(&adev->ddev,
> -				     type >= ARRAY_SIZE(domain_to_pl)))
> -			return;
> -		type = domain_to_pl[type];
> -	} else {
> -		type = res->mem_type;
> -	}
> -
> -	/* Squash some into 'cpu' to keep the legacy userspace view. */
> -	switch (type) {
> -	case TTM_PL_VRAM:
> -	case TTM_PL_TT:
> -	case TTM_PL_SYSTEM:
> -		break;
> -	default:
> -		type = TTM_PL_SYSTEM;
> -		break;
> -	}
> -
> -	if (drm_WARN_ON_ONCE(&adev->ddev, type >= sz))
> -		return;
> -
> -	/* DRM stats common fields: */
> -
> -	if (drm_gem_object_is_shared_for_memory_stats(obj))
> -		stats[type].drm.shared += size;
> -	else
> -		stats[type].drm.private += size;
> -
> -	if (res) {
> -		stats[type].drm.resident += size;
> -
> -		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP))
> -			stats[type].drm.active += size;
> -		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> -			stats[type].drm.purgeable += size;
> -	}
> -
> -	/* amdgpu specific stats: */
> -
> -	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> -		stats[TTM_PL_VRAM].requested += size;
> -		if (type != TTM_PL_VRAM)
> -			stats[TTM_PL_VRAM].evicted += size;
> -	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> -		stats[TTM_PL_TT].requested += size;
> -	}
> -}
> -
>   /**
>    * amdgpu_bo_release_notify - notification about a BO being released
>    * @bo: pointer to a buffer object
> @@ -1463,6 +1383,31 @@ u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
>   	return amdgpu_gmc_sign_extend(offset);
>   }
>   
> +uint32_t amdgpu_bo_get_preferred_placement(struct amdgpu_bo *bo) {
> +	uint32_t domain = bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK;
> +	if (!domain)
> +		return TTM_PL_SYSTEM;
> +
> +	switch (ilog2(domain)) {
> +		case AMDGPU_GEM_DOMAIN_CPU:
> +			return TTM_PL_SYSTEM;
> +		case AMDGPU_GEM_DOMAIN_GTT:
> +			return TTM_PL_TT;
> +		case AMDGPU_GEM_DOMAIN_VRAM:
> +			return TTM_PL_VRAM;
> +		case AMDGPU_GEM_DOMAIN_GDS:
> +			return AMDGPU_PL_GDS;
> +		case AMDGPU_GEM_DOMAIN_GWS:
> +			return AMDGPU_PL_GWS;
> +		case AMDGPU_GEM_DOMAIN_OA:
> +			return AMDGPU_PL_OA;
> +		case AMDGPU_GEM_DOMAIN_DOORBELL:
> +			return AMDGPU_PL_DOORBELL;
> +		default:
> +			return TTM_PL_SYSTEM;

If I'm not completely mistaken that won't work like that.

The AMDGPU_GEM_DOMAIN_* defines are masks and not shifts.

> +	}
> +}
> +
>   /**
>    * amdgpu_bo_get_preferred_domain - get preferred domain
>    * @adev: amdgpu device object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index be6769852ece4..bd58a8b0ece66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -30,6 +30,7 @@
>   
>   #include <drm/amdgpu_drm.h>
>   #include "amdgpu.h"
> +#include "amdgpu_ttm.h"
>   #include "amdgpu_res_cursor.h"

Why is that necessary?

>   
>   #ifdef CONFIG_MMU_NOTIFIER
> @@ -300,9 +301,7 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
>   int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
>   u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
> +uint32_t amdgpu_bo_get_preferred_placement(struct amdgpu_bo *bo);
>   uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>   					    uint32_t domain);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 2852a6064c9ac..a9088e864fde4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,8 +26,8 @@
>   
>   #include <linux/dma-direction.h>
>   #include <drm/gpu_scheduler.h>
> +#include <drm/ttm/ttm_placement.h>
>   #include "amdgpu_vram_mgr.h"
> -#include "amdgpu.h"

Looks like a valuable cleanup, but should probably a separate patch.

>   
>   #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
>   #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9fab64edd0530..abd35c18ddaa8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -36,6 +36,7 @@
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/drm_exec.h>
>   #include "amdgpu.h"
> +#include "amdgpu_vm.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_gmc.h"
> @@ -310,6 +311,94 @@ static void amdgpu_vm_bo_reset_state_machine(struct amdgpu_vm *vm)
>   	spin_unlock(&vm->status_lock);
>   }
>   
> +/**
> + * amdgpu_vm_update_shared - helper to update shared memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @sign: if we should add (+1) or subtract (-1) from the shared stat
> + *
> + * Takes the vm status_lock and updates the shared memory stat. If the basic
> + * stat changed (e.g. buffer was moved) amdgpu_vm_update_stats need to be called
> + * as well.
> + */
> +static void amdgpu_vm_update_shared(struct amdgpu_vm_bo_base *base, int sign)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	struct ttm_resource *res;
> +	int64_t size;
> +	uint32_t type;
> +
> +	if (!vm || !bo)
> +		return;
> +
> +	size = sign * amdgpu_bo_size(bo);
> +	if ((res = bo->tbo.resource))
> +		type = res->mem_type;
> +	else
> +		type = amdgpu_bo_get_preferred_placement(bo);

As discussed with Tvrtko that won't work like this.

Either use the preferred placement or the actual backing store, but 
don't use a fallback here.

> +	if (type >= __AMDGPU_PL_LAST)
> +		return;
> +
> +	spin_lock(&vm->status_lock);
> +	vm->stats[type].drm.shared += size;
> +	vm->stats[type].drm.private -= size;
> +	spin_unlock(&vm->status_lock);
> +}
> +
> +/**
> + * amdgpu_vm_update_stats - helper to update normal memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @new_res:  if not NULL, the ttm_resource to use for the purpose of accounting
> + * (i.e. ignore the one in the BO)
> + * @sign: if we should add (+1) or subtract (-1) from the stat
> + *
> + * Takes the vm status_lock and updates the basic memory stat. If the shared
> + * stat changed (e.g. buffer was exported) amdgpu_vm_update_shared need to be
> + * called as well.
> + */
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *new_res, int sign)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	struct ttm_resource *res;
> +	int64_t size;
> +	uint32_t type;
> +	bool shared;
> +
> +	if (!vm || !bo)
> +		return;
> +
> +	size = sign * amdgpu_bo_size(bo);
> +	res = new_res ? new_res : bo->tbo.resource;
> +	type = res ? res->mem_type : amdgpu_bo_get_preferred_placement(bo);

Same here. Don't use the preferred domain as fallback.

> +	shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);
> +
> +	if (type >= __AMDGPU_PL_LAST)
> +		return;
> +
> +	spin_lock(&vm->status_lock);
> +
> +	if (shared)
> +		vm->stats[type].drm.shared += size;
> +	else
> +		vm->stats[type].drm.private += size;
> +	if (res)
> +		vm->stats[type].drm.resident += size;
> +	if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> +		vm->stats[type].drm.purgeable += size;
> +
> +	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> +		vm->stats[TTM_PL_VRAM].requested += size;
> +		if (type != TTM_PL_VRAM)
> +			vm->stats[TTM_PL_VRAM].evicted += size;

That check is probably not correct. We have BOs which can be placed in 
both VRAM and GTT.

> +	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> +			vm->stats[TTM_PL_TT].requested += size;
> +	}
> +
> +	spin_unlock(&vm->status_lock);
> +}
> +
>   /**
>    * amdgpu_vm_bo_base_init - Adds bo to the list of bos associated with the vm
>    *
> @@ -332,6 +421,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   		return;
>   	base->next = bo->vm_bo;
>   	bo->vm_bo = base;
> +	amdgpu_vm_update_stats(base, NULL, +1);
>   
>   	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
>   		return;
> @@ -1082,53 +1172,11 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	return r;
>   }
>   
> -static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
> -				    struct amdgpu_mem_stats *stats,
> -				    unsigned int size)
> -{
> -	struct amdgpu_vm *vm = bo_va->base.vm;
> -	struct amdgpu_bo *bo = bo_va->base.bo;
> -
> -	if (!bo)
> -		return;
> -
> -	/*
> -	 * For now ignore BOs which are currently locked and potentially
> -	 * changing their location.
> -	 */
> -	if (!amdgpu_vm_is_bo_always_valid(vm, bo) &&
> -	    !dma_resv_trylock(bo->tbo.base.resv))
> -		return;
> -
> -	amdgpu_bo_get_memory(bo, stats, size);
> -	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
> -		dma_resv_unlock(bo->tbo.base.resv);
> -}
> -
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size)
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST])
>   {
> -	struct amdgpu_bo_va *bo_va, *tmp;
> -
>   	spin_lock(&vm->status_lock);
> -	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> +	memcpy(stats, vm->stats, sizeof(*stats) * __AMDGPU_PL_LAST);
>   	spin_unlock(&vm->status_lock);
>   }
>   
> @@ -2071,6 +2119,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   			if (*base != &bo_va->base)
>   				continue;
>   
> +			amdgpu_vm_update_stats(*base, NULL, -1);
>   			*base = bo_va->base.next;
>   			break;
>   		}
> @@ -2136,6 +2185,22 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>   	return true;
>   }
>   
> +/**
> + * amdgpu_vm_bo_update_shared - called when bo gets shared/unshared
> + *
> + * @bo: amdgpu buffer object
> + * @sign: if we should add (+1) or subtract (-1) the memory stat
> + *
> + * Update the per VM stats for all the vm
> + */
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign)
> +{
> +	struct amdgpu_vm_bo_base *bo_base;
> +
> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next)
> +		amdgpu_vm_update_shared(bo_base, sign);
> +}
> +
>   /**
>    * amdgpu_vm_bo_invalidate - mark the bo as invalid
>    *
> @@ -2169,6 +2234,28 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
>   	}
>   }
>   
> +/**
> + * amdgpu_vm_bo_move - handle BO move
> + *
> + * @bo: amdgpu buffer object
> + * @new_mem: the new placement of the BO move
> + * @evicted: is the BO evicted
> + *
> + * Update the memory stats for the new placement and mark @bo as invalid.
> + */
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted)
> +{
> +	struct amdgpu_vm_bo_base *bo_base;
> +
> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
> +		amdgpu_vm_update_stats(bo_base, bo->tbo.resource, -1);
> +		amdgpu_vm_update_stats(bo_base, new_mem, +1);
> +	}
> +
> +	amdgpu_vm_bo_invalidate(bo, evicted);
> +}
> +
>   /**
>    * amdgpu_vm_get_block_size - calculate VM page table size as power of two
>    *
> @@ -2585,6 +2672,18 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	vm->is_compute_context = false;
>   }
>   
> +static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
> +{
> +	int is_zero = 1;
> +	for (int i = 0; i < __AMDGPU_PL_LAST; ++i) {
> +		is_zero = drm_memory_stats_is_zero(&vm->stats[i].drm) &&
> +			  vm->stats->evicted == 0 && vm->stats->requested == 0;
> +		if (!is_zero)
> +			break;

Just make that an "if (...) return false", no need for the local variable.

Regards,
Christian.

> +	}
> +	return is_zero;
> +}
> +
>   /**
>    * amdgpu_vm_fini - tear down a vm instance
>    *
> @@ -2656,6 +2755,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   		}
>   	}
>   
> +	if (!amdgpu_vm_stats_is_zero(vm))
> +		dev_err(adev->dev, "VM memory stats is non-zero when fini\n");
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 6a1b344e15e1b..03589559641c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -35,6 +35,7 @@
>   #include "amdgpu_sync.h"
>   #include "amdgpu_ring.h"
>   #include "amdgpu_ids.h"
> +#include "amdgpu_ttm.h"
>   
>   struct drm_exec;
>   
> @@ -345,6 +346,9 @@ struct amdgpu_vm {
>   	/* Lock to protect vm_bo add/del/move on all lists of vm */
>   	spinlock_t		status_lock;
>   
> +	/* Memory statistics for this vm, protected by the status_lock */
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST];
> +
>   	/* Per-VM and PT BOs who needs a validation */
>   	struct list_head	evicted;
>   
> @@ -525,6 +529,11 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>   			bool clear);
>   bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>   void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *new_res, int sign);
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign);
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted);
>   uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
>   struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
>   				       struct amdgpu_bo *bo);
> @@ -575,8 +584,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST]);
>   
>   int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		       struct amdgpu_bo_vm *vmbo, bool immediate);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index f78a0434a48fa..384526d10a3bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -537,6 +537,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>   	if (!entry->bo)
>   		return;
>   
> +	amdgpu_vm_update_stats(entry, NULL, -1);
>   	entry->bo->vm_bo = NULL;
>   	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>   

