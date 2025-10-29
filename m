Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B2C1957D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1D10E74B;
	Wed, 29 Oct 2025 09:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWHyykD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3D10E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761729473; x=1793265473;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eFShxgmBTUVl9WWtUoaOQNQDGhv8nZxQZrnHsStHgQ8=;
 b=NWHyykD1XejwOBSuU7aFq9rF5rYcRXX6yGSjHVLXXN4Y9IepGy7p8tyA
 vqj1K+Fh5y1aGkg730PyFu6XX+pcDO55v+ZCRLFbWXRNOsm+JVb6tzZc5
 l5onVegUbdbfbRxHo67H/Vs34UbtjdegjgoAS20MS53fcDY2Ig4z9+6G9
 jzDLROb4IniOSGGcSLUn/HOt23I7oLe6pdPfa7cKyVsQEpVTUOOiua6QG
 uk5B7A8sFlN2WZIWWFsFjLVnoyRcjO/TVPll3DJp/+Iz7kpvQqJvOo0Wq
 3u+qO1ggrqsH4N42ZbLaM0Cjg4jksNyu6TWSxKZqUBextkLxYvfw5n0Ty Q==;
X-CSE-ConnectionGUID: TUn5CvMVSXyfpcxKDk9uzQ==
X-CSE-MsgGUID: gIHlccraSHS22QU3VkCpsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89314306"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="89314306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:17:52 -0700
X-CSE-ConnectionGUID: +BzmhJhaT+GVaW6v30K97g==
X-CSE-MsgGUID: bzyfTa5aRxWpNHgUINt8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="189668168"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 02:17:50 -0700
Message-ID: <42b52f9f-bb6a-41a0-b0c8-bd3fbc9f6ef4@linux.intel.com>
Date: Wed, 29 Oct 2025 10:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add support for userptr buffer objects
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20251028070624.135142-1-karol.wachowski@linux.intel.com>
 <e18e73eb-79f8-4e23-9223-6a5ddbfe77ae@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e18e73eb-79f8-4e23-9223-6a5ddbfe77ae@oss.qualcomm.com>
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

On 10/28/2025 9:39 PM, Jeff Hugo wrote:
> On 10/28/2025 1:06 AM, Karol Wachowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Add support for creating buffer objects from user pointers
>> in the Intel NPU driver.
>
> This feels redundant. $SUBJECT already mentions adding the support,
> and in the Intel NPU driver is a given. 
Removed.
>
>> Introduce a new ioctl `drm_ivpu_bo_create_from_userptr` that allows
>> users to create a GEM buffer object from a user pointer to a memory
>> region.
>> The user pointer must be page-aligned and the memory region must remain
>> valid for the lifetime of the buffer object.
>
> This seems good, but perhaps incomplete. Why do this? What benifit
> would this new IOCTL give the user? Increases performance when the
> user has a specific usecase? 
I have added paragraph describing that this allows to limit memory used
and simplifies NPU usage for user applications allowing to mmap files
directly into NPU's buffer objects.
>
>> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c
>> b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> new file mode 100644
>> index 000000000000..c5b64e0f2b13
>> --- /dev/null
>> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> @@ -0,0 +1,207 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020-2025 Intel Corporation
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/err.h>
>> +#include <linux/highmem.h>
>> +#include <linux/mm.h>
>> +#include <linux/mman.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +#include <linux/capability.h>
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> +
>> +#include "ivpu_drv.h"
>> +#include "ivpu_gem.h"
>> +
>> +#define IVPU_BO_USERPTR_MAX_SIZE (4ULL * SZ_1G)
>
> Is this not the same as SZ_4G? 

After consideration I have decided to remove this limitation. So I have
removed this define and check completely.
Maximum memory usage for both userptr and generic buffer object is
limited by driver's defined ranges anyway.

>
>> +/**
>> + * struct drm_ivpu_bo_create_from_userptr - Create dma-buf from user
>> pointer
>> + *
>> + * Create a GEM buffer object from a user pointer to a memory region.
>> + */
>> +struct drm_ivpu_bo_create_from_userptr {
>> +    /** @user_ptr: User pointer to memory region (must be page
>> aligned) */
>> +    __u64 user_ptr;
>> +
>> +    /** @size: Size of the memory region in bytes (must be page
>> aligned) */
>
> Mention max size? 
As above, I have removed the limitation.
>
>> +    __u64 size;
>> +
>> +    /**
>> +     * @flags:
>> +     *
>> +     * Supported flags:
>> +     *
>> +     * %DRM_IVPU_BO_HIGH_MEM:
>> +     *
>> +     * Allocate VPU address from >4GB range.
>> +     *
>> +     * %DRM_IVPU_BO_DMA_MEM:
>> +     *
>> +     * Allocate from DMA memory range accessible by hardware DMA.
>> +     *
>> +     * %DRM_IVPU_BO_READ_ONLY:
>> +     *
>> +     * Allocate as a read-only buffer object.
>> +     */
>> +    __u32 flags;
>> +
>> +    /** @handle: Returned GEM object handle */
>> +    __u32 handle;
>> +
>> +    /** @vpu_addr: Returned VPU virtual address */
>> +    __u64 vpu_addr;
>> +};
>> +
>>   /**
>>    * struct drm_ivpu_bo_info - Query buffer object info
>>    */
>
Thank you for the review, all above are addressed in v2.
-Karol

