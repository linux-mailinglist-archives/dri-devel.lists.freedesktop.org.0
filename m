Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E231C301EB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8C010E595;
	Tue,  4 Nov 2025 09:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQydSFZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B8510E595
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762246831; x=1793782831;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=8bbK0VVgIgartqdq6BqgZVV6+0aapFxrkKR9DZxRWac=;
 b=dQydSFZDXxys/vu6px+gfIOgxXsR9+gPhLk4CaA0q5QCNkHCKOmvn8xP
 R2+PmApajifMWQbOdt7h8eiIPOEqlDi9qmAiWCYDWEpPZ4XTM+dEOBsiM
 jQaSolybaI1y4RntW1ZMc9Mbo04Xged3onJDKJlmDP14U7zd6ZKDjxp8j
 TAzZQOoFo60QH5nwHYoGiHHicetA8iBi13x/nw0fsjMQkyF35RRNdaStX
 pwRcXHmcQV/irwqVh2ALN9u/KWMpIjIWXeDw7DbuYg6mDGyLaDuWQ1dJI
 eEERhx52aCqbQaoeFk2UoopAnEZKvmjKH+nNHbfuBui3aYgkvargItr6k A==;
X-CSE-ConnectionGUID: DBJGOnK3RLiQfscWKYMrTw==
X-CSE-MsgGUID: UjI5alSMS4CQEMxfQZaC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64239782"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64239782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:00:31 -0800
X-CSE-ConnectionGUID: KiuW81S8SHqQQvIMlEIrTQ==
X-CSE-MsgGUID: BcEuHB1sTUCp02SqkjDuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187052805"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:00:29 -0800
Message-ID: <2bd69ded-6676-49c2-97b0-137bf4b560c2@linux.intel.com>
Date: Tue, 4 Nov 2025 10:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: Re: [PATCH] accel/ivpu: Improve debug and warning messages
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070705.135211-1-karol.wachowski@linux.intel.com>
 <ada53b66-48a4-46de-8eb2-4a3548b42f15@oss.qualcomm.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ada53b66-48a4-46de-8eb2-4a3548b42f15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/29/2025 7:45 PM, Jeff Hugo wrote:
> On 10/28/2025 1:07 AM, Karol Wachowski wrote:
>> @@ -377,7 +379,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fi
>>         ret = drm_gem_handle_create(file, &bo->base.base,
>> &args->handle);
>>       if (ret) {
>> -        ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u
>> size %llu flags 0x%x)",
>> +        ivpu_err(vdev, "Failed to create handle for BO: %pe ctx %u
>> size %llu flags 0x%x\n",
>>                bo, file_priv->ctx.id, args->size, args->flags);
>
> This looks like it could be triggered by a user (in an ioctl, and in
> this case the user could exhaust the handle space), so this should be
> changed to a debug message per the commit text, no? 
I agree that this one can be changed to debug. I will send new version
of the patch.
>
>>       } else {
>>           args->vpu_addr = bo->vpu_addr;
>> @@ -406,14 +408,17 @@ ivpu_bo_create(struct ivpu_device *vdev, struct
>> ivpu_mmu_context *ctx,
>>         bo = ivpu_bo_alloc(vdev, size, flags);
>>       if (IS_ERR(bo)) {
>> -        ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx
>> size %llu flags 0x%x)",
>> +        ivpu_err(vdev, "Failed to allocate BO: %pe vpu_addr 0x%llx
>> size %llu flags 0x%x\n",
>>                bo, range->start, size, flags);
>
> Another possible debug message? 
ivpu_bo_create() is only used by internal driver's allocations, I want
those to emit error messages. User cannot trigger these. So this should
stay error.
>
>>           return NULL;
>>       }
>>         ret = ivpu_bo_alloc_vpu_addr(bo, ctx, range);
>> -    if (ret)
>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to allocate NPU address for BO: %pe
>> ctx %u size %llu: %d\n",
>> +             bo, ctx->id, size, ret);
>
> Another possible debug message? 
Same here, this one is specifically called by ivpu_bo_create(). There's
another one in IOCTL and that one prints debug message only. 
>
>>           goto err_put;
>> +    }
>>         ret = ivpu_bo_bind(bo);
>>       if (ret)
>> @@ -193,7 +206,7 @@ int ivpu_bo_create_from_userptr_ioctl(struct
>> drm_device *dev, void *data, struct
>>         ret = drm_gem_handle_create(file, &bo->base.base,
>> &args->handle);
>>       if (ret) {
>> -        ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u
>> size %llu flags 0x%x)",
>> +        ivpu_err(vdev, "Failed to create handle for BO: %pe ctx %u
>> size %llu flags 0x%x\n",
>>                bo, file_priv->ctx.id, args->size, args->flags);
>
> Another possible debug message? 
Similar to the first one, I will change this to debug.
>
>>       } else {
>>           ivpu_dbg(vdev, BO, "Created userptr BO: handle=%u
>> vpu_addr=0x%llx size=%llu flags=0x%x\n",
>> @@ -69,12 +71,18 @@ int ivpu_ms_start_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>       if (ret)
>>           goto err_free_ms;
>>   -    single_buff_size = sample_size *
>> -        ((u64)args->read_period_samples * MS_READ_PERIOD_MULTIPLIER);
>> -    ms->bo = ivpu_bo_create_global(vdev, PAGE_ALIGN(single_buff_size
>> * MS_NUM_BUFFERS),
>> -                       DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
>> +    buf_size = PAGE_ALIGN((u64)args->read_period_samples *
>> sample_size *
>> +                  MS_READ_PERIOD_MULTIPLIER * MS_NUM_BUFFERS);
>> +    if (buf_size > ivpu_hw_range_size(&vdev->hw->ranges.global)) {
>> +        ivpu_dbg(vdev, IOCTL, "Requested MS buffer size %llu exceeds
>> range size %llu\n",
>> +             buf_size, ivpu_hw_range_size(&vdev->hw->ranges.global));
>> +        ret = -EINVAL;
>> +        goto err_free_ms;
>> +    }
>> +
>> +    ms->bo = ivpu_bo_create_global(vdev, buf_size,
>> DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
>>       if (!ms->bo) {
>> -        ivpu_err(vdev, "Failed to allocate MS buffer (size %llu)\n",
>> single_buff_size);
>> +        ivpu_err(vdev, "Failed to allocate MS buffer (size %llu)\n",
>> buf_size);
>
> Another possible debug message? 
Yes, I think this one also could be debug instead. It can be triggered
by user.
>
>>           ret = -ENOMEM;
>>           goto err_free_ms;
>>       } 

I've sent v2 version of the patch with those concerns addressed.
Thank you for your insights, as usual.
- Karol

