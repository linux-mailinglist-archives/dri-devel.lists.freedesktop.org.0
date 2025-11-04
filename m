Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CDC312EC
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4599788284;
	Tue,  4 Nov 2025 13:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeAc8Jsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC6E10E27B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762262215; x=1793798215;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/3KWcJahU9waByZoE5J77iiV54ktVy3yIiY7R35hTWc=;
 b=DeAc8JszV5lBPQb4G7373ezmfeR+vbLEVvKg/2fEoZJckjDKpsnzDOTB
 iJuw34NbCvDsZ7beASUhsiQrKWflTTF8k4HpVKOTLbuASR7xj993uXopD
 lnK5Ir7WkryJqI8cnFppWuAoM0Q/9jCEL/fdK4wGG8Lagz8GFFJU+kQBK
 QnqJT5ltOr7wtD5WtmeJh9xMa+zfAYj6iHZsl31vH02pMzB3Mho6OfptK
 6lv8Tz5gMtsMM8F2U8Covhf97eEgUwUqpwc67Q9NThuox0/FIGknPcX80
 o923izq8U7ZGjX0TGue8Ckrb1xyH3J+OAXkmSvEFDiIKWuuiHIBh8+roz A==;
X-CSE-ConnectionGUID: 92oWCAAoRz21KQV+8qfvLA==
X-CSE-MsgGUID: wJOkbmNhRumrBOZ0E1y+JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81984194"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="81984194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 05:16:55 -0800
X-CSE-ConnectionGUID: KeskCzxqRO2zlUr7gIMAtQ==
X-CSE-MsgGUID: i5XMsGe7RxeLnzr1jucXYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186843714"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.18.195])
 ([10.246.18.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 05:16:52 -0800
Message-ID: <cefbd464-2f0f-4055-ab6e-9b76047794b2@linux.intel.com>
Date: Tue, 4 Nov 2025 14:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Improve debug and warning messages
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251104090049.944152-1-karol.wachowski@linux.intel.com>
 <42f705ef5eb4c1b225d6e97007b900a51e24235e@intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <42f705ef5eb4c1b225d6e97007b900a51e24235e@intel.com>
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

On 11/4/2025 2:00 PM, Jani Nikula wrote:
> On Tue, 04 Nov 2025, Karol Wachowski <karol.wachowski@linux.intel.com> wrote:
>> Add IOCTL debug bit for logging user provided parameter validation
>> errors.
>>
>> Refactor several warning and error messages to better reflect fault
>> reason. User generated faults should not flood kernel messages with
>> warnings or errors, so change those to ivpu_dbg(). Add additional debug
>> logs for parameter validation in IOCTLs.
>>
>> Check size provided by in metric streamer start and return -EINVAL
>> together with a debug message print.
>>
>> Fix ivpu_warn_ratelimited() to properly use WARN logging level instead
>> of an ERROR.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/ivpu_drv.h         |  3 +-
>>  drivers/accel/ivpu/ivpu_gem.c         | 25 ++++---
>>  drivers/accel/ivpu/ivpu_gem_userptr.c | 29 +++++---
>>  drivers/accel/ivpu/ivpu_job.c         | 95 ++++++++++++++++++---------
>>  drivers/accel/ivpu/ivpu_mmu_context.c |  3 +-
>>  drivers/accel/ivpu/ivpu_ms.c          | 25 ++++---
>>  6 files changed, 121 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>> index 98b274a8567f..1b1bf0a51ccc 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -79,6 +79,7 @@
>>  #define IVPU_DBG_KREF	 BIT(11)
>>  #define IVPU_DBG_RPM	 BIT(12)
>>  #define IVPU_DBG_MMU_MAP BIT(13)
>> +#define IVPU_DBG_IOCTL   BIT(14)
>>  
>>  #define ivpu_err(vdev, fmt, ...) \
>>  	drm_err(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
>> @@ -90,7 +91,7 @@
>>  	drm_warn(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
>>  
>>  #define ivpu_warn_ratelimited(vdev, fmt, ...) \
>> -	drm_err_ratelimited(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
>> +	__drm_printk(&(vdev)->drm, warn, _ratelimited, fmt, ##__VA_ARGS__)
> The double underscore is a hint that it's private, don't use it outside
> of drm_print.h.
>
> BR,
> Jani.

Thanks, I will remove this. BTW is there a reason for
drm_warn_ratelimited not existing in drm_print.h?
- Karol

>
>>  
>>  #define ivpu_info(vdev, fmt, ...) drm_info(&(vdev)->drm, fmt, ##__VA_ARGS__)
>>  
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 03d39615ad37..74b12c7e6caf 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -128,8 +128,6 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>>  		bo->ctx_id = ctx->id;
>>  		bo->vpu_addr = bo->mm_node.start;
>>  		ivpu_dbg_bo(vdev, bo, "vaddr");
>> -	} else {
>> -		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>>  	}
>>  
>>  	ivpu_bo_unlock(bo);
>> @@ -289,8 +287,8 @@ static int ivpu_gem_bo_open(struct drm_gem_object *obj, struct drm_file *file)
>>  	struct ivpu_addr_range *range;
>>  
>>  	if (bo->ctx) {
>> -		ivpu_warn(vdev, "Can't add BO to ctx %u: already in ctx %u\n",
>> -			  file_priv->ctx.id, bo->ctx->id);
>> +		ivpu_dbg(vdev, IOCTL, "Can't add BO %pe to ctx %u: already in ctx %u\n",
>> +			 bo, file_priv->ctx.id, bo->ctx->id);
>>  		return -EALREADY;
>>  	}
>>  
>> @@ -357,15 +355,19 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>>  	struct ivpu_bo *bo;
>>  	int ret;
>>  
>> -	if (args->flags & ~DRM_IVPU_BO_FLAGS)
>> +	if (args->flags & ~DRM_IVPU_BO_FLAGS) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid BO flags 0x%x\n", args->flags);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (size == 0)
>> +	if (size == 0) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid BO size %llu\n", args->size);
>>  		return -EINVAL;
>> +	}
>>  
>>  	bo = ivpu_bo_alloc(vdev, size, args->flags);
>>  	if (IS_ERR(bo)) {
>> -		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
>> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate BO: %pe ctx %u size %llu flags 0x%x\n",
>>  			 bo, file_priv->ctx.id, args->size, args->flags);
>>  		return PTR_ERR(bo);
>>  	}
>> @@ -374,7 +376,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>>  
>>  	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
>>  	if (ret) {
>> -		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
>> +		ivpu_dbg(vdev, IOCTL, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
>>  			 bo, file_priv->ctx.id, args->size, args->flags);
>>  	} else {
>>  		args->vpu_addr = bo->vpu_addr;
>> @@ -403,14 +405,17 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>>  
>>  	bo = ivpu_bo_alloc(vdev, size, flags);
>>  	if (IS_ERR(bo)) {
>> -		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
>> +		ivpu_err(vdev, "Failed to allocate BO: %pe vpu_addr 0x%llx size %llu flags 0x%x\n",
>>  			 bo, range->start, size, flags);
>>  		return NULL;
>>  	}
>>  
>>  	ret = ivpu_bo_alloc_vpu_addr(bo, ctx, range);
>> -	if (ret)
>> +	if (ret) {
>> +		ivpu_err(vdev, "Failed to allocate NPU address for BO: %pe ctx %u size %llu: %d\n",
>> +			 bo, ctx->id, size, ret);
>>  		goto err_put;
>> +	}
>>  
>>  	ret = ivpu_bo_bind(bo);
>>  	if (ret)
>> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> index 235c67959453..25ba606164c0 100644
>> --- a/drivers/accel/ivpu/ivpu_gem_userptr.c
>> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> @@ -84,12 +84,12 @@ ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>>  	pinned = pin_user_pages_fast((unsigned long)user_ptr, nr_pages, gup_flags, pages);
>>  	if (pinned < 0) {
>>  		ret = pinned;
>> -		ivpu_warn(vdev, "Failed to pin user pages: %d\n", ret);
>> +		ivpu_dbg(vdev, IOCTL, "Failed to pin user pages: %d\n", ret);
>>  		goto free_pages_array;
>>  	}
>>  
>>  	if (pinned != nr_pages) {
>> -		ivpu_warn(vdev, "Pinned %d pages, expected %lu\n", pinned, nr_pages);
>> +		ivpu_dbg(vdev, IOCTL, "Pinned %d pages, expected %lu\n", pinned, nr_pages);
>>  		ret = -EFAULT;
>>  		goto unpin_pages;
>>  	}
>> @@ -102,7 +102,7 @@ ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>>  
>>  	ret = sg_alloc_table_from_pages(sgt, pages, nr_pages, 0, size, GFP_KERNEL);
>>  	if (ret) {
>> -		ivpu_warn(vdev, "Failed to create sg table: %d\n", ret);
>> +		ivpu_dbg(vdev, IOCTL, "Failed to create sg table: %d\n", ret);
>>  		goto free_sgt;
>>  	}
>>  
>> @@ -116,7 +116,7 @@ ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>>  	dma_buf = dma_buf_export(&exp_info);
>>  	if (IS_ERR(dma_buf)) {
>>  		ret = PTR_ERR(dma_buf);
>> -		ivpu_warn(vdev, "Failed to export userptr dma-buf: %d\n", ret);
>> +		ivpu_dbg(vdev, IOCTL, "Failed to export userptr dma-buf: %d\n", ret);
>>  		goto free_sg_table;
>>  	}
>>  
>> @@ -170,17 +170,28 @@ int ivpu_bo_create_from_userptr_ioctl(struct drm_device *dev, void *data, struct
>>  	struct ivpu_bo *bo;
>>  	int ret;
>>  
>> -	if (args->flags & ~(DRM_IVPU_BO_HIGH_MEM | DRM_IVPU_BO_DMA_MEM | DRM_IVPU_BO_READ_ONLY))
>> +	if (args->flags & ~(DRM_IVPU_BO_HIGH_MEM | DRM_IVPU_BO_DMA_MEM | DRM_IVPU_BO_READ_ONLY)) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid BO flags: 0x%x\n", args->flags);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!args->user_ptr || !args->size)
>> +	if (!args->user_ptr || !args->size) {
>> +		ivpu_dbg(vdev, IOCTL, "Userptr or size are zero: ptr %llx size %llu\n",
>> +			 args->user_ptr, args->size);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!PAGE_ALIGNED(args->user_ptr) || !PAGE_ALIGNED(args->size))
>> +	if (!PAGE_ALIGNED(args->user_ptr) || !PAGE_ALIGNED(args->size)) {
>> +		ivpu_dbg(vdev, IOCTL, "Userptr or size not page aligned: ptr %llx size %llu\n",
>> +			 args->user_ptr, args->size);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!access_ok(user_ptr, args->size))
>> +	if (!access_ok(user_ptr, args->size)) {
>> +		ivpu_dbg(vdev, IOCTL, "Userptr is not accessible: ptr %llx size %llu\n",
>> +			 args->user_ptr, args->size);
>>  		return -EFAULT;
>> +	}
>>  
>>  	bo = ivpu_bo_create_from_userptr(vdev, user_ptr, args->size, args->flags);
>>  	if (IS_ERR(bo))
>> @@ -188,7 +199,7 @@ int ivpu_bo_create_from_userptr_ioctl(struct drm_device *dev, void *data, struct
>>  
>>  	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
>>  	if (ret) {
>> -		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
>> +		ivpu_dbg(vdev, IOCTL, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
>>  			 bo, file_priv->ctx.id, args->size, args->flags);
>>  	} else {
>>  		ivpu_dbg(vdev, BO, "Created userptr BO: handle=%u vpu_addr=0x%llx size=%llu flags=0x%x\n",
>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 081819886313..4f8564e2878a 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -348,7 +348,7 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u32
>>  
>>  	cmdq = xa_load(&file_priv->cmdq_xa, cmdq_id);
>>  	if (!cmdq) {
>> -		ivpu_warn_ratelimited(vdev, "Failed to find command queue with ID: %u\n", cmdq_id);
>> +		ivpu_dbg(vdev, IOCTL, "Failed to find command queue with ID: %u\n", cmdq_id);
>>  		return NULL;
>>  	}
>>  
>> @@ -534,7 +534,7 @@ ivpu_job_create(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
>>  	job->bo_count = bo_count;
>>  	job->done_fence = ivpu_fence_create(vdev);
>>  	if (!job->done_fence) {
>> -		ivpu_warn_ratelimited(vdev, "Failed to create a fence\n");
>> +		ivpu_err(vdev, "Failed to create a fence\n");
>>  		goto err_free_job;
>>  	}
>>  
>> @@ -687,7 +687,6 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>>  	else
>>  		cmdq = ivpu_cmdq_acquire(file_priv, cmdq_id);
>>  	if (!cmdq) {
>> -		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d\n", file_priv->ctx.id);
>>  		ret = -EINVAL;
>>  		goto err_unlock;
>>  	}
>> @@ -771,8 +770,11 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
>>  	for (i = 0; i < buf_count; i++) {
>>  		struct drm_gem_object *obj = drm_gem_object_lookup(file, buf_handles[i]);
>>  
>> -		if (!obj)
>> +		if (!obj) {
>> +			ivpu_dbg(vdev, IOCTL, "Failed to lookup GEM object with handle %u\n",
>> +				 buf_handles[i]);
>>  			return -ENOENT;
>> +		}
>>  
>>  		job->bos[i] = to_ivpu_bo(obj);
>>  
>> @@ -783,12 +785,13 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
>>  
>>  	bo = job->bos[CMD_BUF_IDX];
>>  	if (!dma_resv_test_signaled(bo->base.base.resv, DMA_RESV_USAGE_READ)) {
>> -		ivpu_warn(vdev, "Buffer is already in use\n");
>> +		ivpu_dbg(vdev, IOCTL, "Buffer is already in use by another job\n");
>>  		return -EBUSY;
>>  	}
>>  
>>  	if (commands_offset >= ivpu_bo_size(bo)) {
>> -		ivpu_warn(vdev, "Invalid command buffer offset %u\n", commands_offset);
>> +		ivpu_dbg(vdev, IOCTL, "Invalid commands offset %u for buffer size %zu\n",
>> +			 commands_offset, ivpu_bo_size(bo));
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -798,11 +801,11 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
>>  		struct ivpu_bo *preempt_bo = job->bos[preempt_buffer_index];
>>  
>>  		if (ivpu_bo_size(preempt_bo) < ivpu_fw_preempt_buf_size(vdev)) {
>> -			ivpu_warn(vdev, "Preemption buffer is too small\n");
>> +			ivpu_dbg(vdev, IOCTL, "Preemption buffer is too small\n");
>>  			return -EINVAL;
>>  		}
>>  		if (ivpu_bo_is_mappable(preempt_bo)) {
>> -			ivpu_warn(vdev, "Preemption buffer cannot be mappable\n");
>> +			ivpu_dbg(vdev, IOCTL, "Preemption buffer cannot be mappable\n");
>>  			return -EINVAL;
>>  		}
>>  		job->primary_preempt_buf = preempt_bo;
>> @@ -811,14 +814,14 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
>>  	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
>>  					&acquire_ctx);
>>  	if (ret) {
>> -		ivpu_warn(vdev, "Failed to lock reservations: %d\n", ret);
>> +		ivpu_warn_ratelimited(vdev, "Failed to lock reservations: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>>  	for (i = 0; i < buf_count; i++) {
>>  		ret = dma_resv_reserve_fences(job->bos[i]->base.base.resv, 1);
>>  		if (ret) {
>> -			ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
>> +			ivpu_warn_ratelimited(vdev, "Failed to reserve fences: %d\n", ret);
>>  			goto unlock_reservations;
>>  		}
>>  	}
>> @@ -865,17 +868,14 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
>>  
>>  	job = ivpu_job_create(file_priv, engine, buffer_count);
>>  	if (!job) {
>> -		ivpu_err(vdev, "Failed to create job\n");
>>  		ret = -ENOMEM;
>>  		goto err_exit_dev;
>>  	}
>>  
>>  	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, buffer_count, cmds_offset,
>>  					      preempt_buffer_index);
>> -	if (ret) {
>> -		ivpu_err(vdev, "Failed to prepare job: %d\n", ret);
>> +	if (ret)
>>  		goto err_destroy_job;
>> -	}
>>  
>>  	down_read(&vdev->pm->reset_lock);
>>  	ret = ivpu_job_submit(job, priority, cmdq_id);
>> @@ -901,26 +901,39 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
>>  int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  {
>>  	struct ivpu_file_priv *file_priv = file->driver_priv;
>> +	struct ivpu_device *vdev = file_priv->vdev;
>>  	struct drm_ivpu_submit *args = data;
>>  	u8 priority;
>>  
>> -	if (args->engine != DRM_IVPU_ENGINE_COMPUTE)
>> +	if (args->engine != DRM_IVPU_ENGINE_COMPUTE) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid engine %d\n", args->engine);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
>> +	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid priority %d\n", args->priority);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT)
>> +	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid buffer count %u\n", args->buffer_count);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!IS_ALIGNED(args->commands_offset, 8))
>> +	if (!IS_ALIGNED(args->commands_offset, 8)) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid commands offset %u\n", args->commands_offset);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!file_priv->ctx.id)
>> +	if (!file_priv->ctx.id) {
>> +		ivpu_dbg(vdev, IOCTL, "Context not initialized\n");
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (file_priv->has_mmu_faults)
>> +	if (file_priv->has_mmu_faults) {
>> +		ivpu_dbg(vdev, IOCTL, "Context %u has MMU faults\n", file_priv->ctx.id);
>>  		return -EBADFD;
>> +	}
>>  
>>  	priority = ivpu_job_to_jsm_priority(args->priority);
>>  
>> @@ -931,28 +944,44 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  {
>>  	struct ivpu_file_priv *file_priv = file->driver_priv;
>> +	struct ivpu_device *vdev = file_priv->vdev;
>>  	struct drm_ivpu_cmdq_submit *args = data;
>>  
>> -	if (!ivpu_is_capable(file_priv->vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
>> +	if (!ivpu_is_capable(file_priv->vdev, DRM_IVPU_CAP_MANAGE_CMDQ)) {
>> +		ivpu_dbg(vdev, IOCTL, "Command queue management not supported\n");
>>  		return -ENODEV;
>> +	}
>>  
>> -	if (args->cmdq_id < IVPU_CMDQ_MIN_ID || args->cmdq_id > IVPU_CMDQ_MAX_ID)
>> +	if (args->cmdq_id < IVPU_CMDQ_MIN_ID || args->cmdq_id > IVPU_CMDQ_MAX_ID) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid command queue ID %u\n", args->cmdq_id);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT)
>> +	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid buffer count %u\n", args->buffer_count);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (args->preempt_buffer_index >= args->buffer_count)
>> +	if (args->preempt_buffer_index >= args->buffer_count) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid preemption buffer index %u\n",
>> +			 args->preempt_buffer_index);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!IS_ALIGNED(args->commands_offset, 8))
>> +	if (!IS_ALIGNED(args->commands_offset, 8)) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid commands offset %u\n", args->commands_offset);
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (!file_priv->ctx.id)
>> +	if (!file_priv->ctx.id) {
>> +		ivpu_dbg(vdev, IOCTL, "Context not initialized\n");
>>  		return -EINVAL;
>> +	}
>>  
>> -	if (file_priv->has_mmu_faults)
>> +	if (file_priv->has_mmu_faults) {
>> +		ivpu_dbg(vdev, IOCTL, "Context %u has MMU faults\n", file_priv->ctx.id);
>>  		return -EBADFD;
>> +	}
>>  
>>  	return ivpu_submit(file, file_priv, args->cmdq_id, args->buffer_count, VPU_ENGINE_COMPUTE,
>>  			   (void __user *)args->buffers_ptr, args->commands_offset,
>> @@ -967,11 +996,15 @@ int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>  	struct ivpu_cmdq *cmdq;
>>  	int ret;
>>  
>> -	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
>> +	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ)) {
>> +		ivpu_dbg(vdev, IOCTL, "Command queue management not supported\n");
>>  		return -ENODEV;
>> +	}
>>  
>> -	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
>> +	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME) {
>> +		ivpu_dbg(vdev, IOCTL, "Invalid priority %d\n", args->priority);
>>  		return -EINVAL;
>> +	}
>>  
>>  	ret = ivpu_rpm_get(vdev);
>>  	if (ret < 0)
>> @@ -999,8 +1032,10 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
>>  	u32 cmdq_id = 0;
>>  	int ret;
>>  
>> -	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
>> +	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ)) {
>> +		ivpu_dbg(vdev, IOCTL, "Command queue management not supported\n");
>>  		return -ENODEV;
>> +	}
>>  
>>  	ret = ivpu_rpm_get(vdev);
>>  	if (ret < 0)
>> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
>> index d128e8961688..87ad593ef47d 100644
>> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
>> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
>> @@ -529,7 +529,8 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
>>  
>>  	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
>>  	if (ret)
>> -		ivpu_warn(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
>> +		ivpu_warn_ratelimited(vdev, "Failed to invalidate TLB for ctx %u: %d\n",
>> +				      ctx->id, ret);
>>  }
>>  
>>  int
>> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
>> index 2a043baf10ca..1d9c1cb17924 100644
>> --- a/drivers/accel/ivpu/ivpu_ms.c
>> +++ b/drivers/accel/ivpu/ivpu_ms.c
>> @@ -8,6 +8,7 @@
>>  
>>  #include "ivpu_drv.h"
>>  #include "ivpu_gem.h"
>> +#include "ivpu_hw.h"
>>  #include "ivpu_jsm_msg.h"
>>  #include "ivpu_ms.h"
>>  #include "ivpu_pm.h"
>> @@ -37,8 +38,8 @@ int ivpu_ms_start_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>  	struct drm_ivpu_metric_streamer_start *args = data;
>>  	struct ivpu_device *vdev = file_priv->vdev;
>>  	struct ivpu_ms_instance *ms;
>> -	u64 single_buff_size;
>>  	u32 sample_size;
>> +	u64 buf_size;
>>  	int ret;
>>  
>>  	if (!args->metric_group_mask || !args->read_period_samples ||
>> @@ -52,7 +53,8 @@ int ivpu_ms_start_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>  	mutex_lock(&file_priv->ms_lock);
>>  
>>  	if (get_instance_by_mask(file_priv, args->metric_group_mask)) {
>> -		ivpu_err(vdev, "Instance already exists (mask %#llx)\n", args->metric_group_mask);
>> +		ivpu_dbg(vdev, IOCTL, "Instance already exists (mask %#llx)\n",
>> +			 args->metric_group_mask);
>>  		ret = -EALREADY;
>>  		goto unlock;
>>  	}
>> @@ -69,12 +71,18 @@ int ivpu_ms_start_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>  	if (ret)
>>  		goto err_free_ms;
>>  
>> -	single_buff_size = sample_size *
>> -		((u64)args->read_period_samples * MS_READ_PERIOD_MULTIPLIER);
>> -	ms->bo = ivpu_bo_create_global(vdev, PAGE_ALIGN(single_buff_size * MS_NUM_BUFFERS),
>> -				       DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
>> +	buf_size = PAGE_ALIGN((u64)args->read_period_samples * sample_size *
>> +			      MS_READ_PERIOD_MULTIPLIER * MS_NUM_BUFFERS);
>> +	if (buf_size > ivpu_hw_range_size(&vdev->hw->ranges.global)) {
>> +		ivpu_dbg(vdev, IOCTL, "Requested MS buffer size %llu exceeds range size %llu\n",
>> +			 buf_size, ivpu_hw_range_size(&vdev->hw->ranges.global));
>> +		ret = -EINVAL;
>> +		goto err_free_ms;
>> +	}
>> +
>> +	ms->bo = ivpu_bo_create_global(vdev, buf_size, DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
>>  	if (!ms->bo) {
>> -		ivpu_err(vdev, "Failed to allocate MS buffer (size %llu)\n", single_buff_size);
>> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate MS buffer (size %llu)\n", buf_size);
>>  		ret = -ENOMEM;
>>  		goto err_free_ms;
>>  	}
>> @@ -175,7 +183,8 @@ int ivpu_ms_get_data_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>  
>>  	ms = get_instance_by_mask(file_priv, args->metric_group_mask);
>>  	if (!ms) {
>> -		ivpu_err(vdev, "Instance doesn't exist for mask: %#llx\n", args->metric_group_mask);
>> +		ivpu_dbg(vdev, IOCTL, "Instance doesn't exist for mask: %#llx\n",
>> +			 args->metric_group_mask);
>>  		ret = -EINVAL;
>>  		goto unlock;
>>  	}
