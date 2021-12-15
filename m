Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B749475CBE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F9510EE32;
	Wed, 15 Dec 2021 16:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1C010EE30;
 Wed, 15 Dec 2021 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639584523; x=1671120523;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cbcD3ZwhsZnwdQ8cAonOJQUqYgEJ5zRow45H92GB6Yg=;
 b=jXzaQmENN8zqq0w9PCxHFSKRSjrSqCOyGJc+K//c+hVP2bB1J5rW1kw5
 vl/GHHPyQfsjcbCulFx3sA1Mp1nF8J+5kCtvo6xxuf4apOs8I+He7rVLt
 GE1V/K/cbwqCU93M704pR6NJQH/QQ5QADFBfRQNEqQx9Cbp+OxpkHHQTG
 gZJwIHmAZd1HxJcziKrgq6joWVaTgN5qZNZegONCdWoUMX9vederrjhNB
 XR/Qhmnh5yMwZkdwhToDNl7ShqP+7626RAsaN8IjvxNXCbmhTyp+y0UOe
 7bEGgM5Wf7JgzO/h3p9CiakL032FVfYca9FkxHWeH267V6aNEtV8LTBE0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="300036971"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="300036971"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:08:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="505858036"
Received: from dhogarty-mobl1.ger.corp.intel.com (HELO [10.252.6.151])
 ([10.252.6.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:08:35 -0800
Message-ID: <ace284ec-b35d-441e-d295-fc49bb27da51@intel.com>
Date: Wed, 15 Dec 2021 16:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] drm/i915: clean up shrinker_release_pages
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20211215110746.865-1-matthew.auld@intel.com>
 <20211215110746.865-2-matthew.auld@intel.com>
 <47715429-7e03-8fc8-4d30-0dae1d38c4b1@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <47715429-7e03-8fc8-4d30-0dae1d38c4b1@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/12/2021 15:55, Tvrtko Ursulin wrote:
> 
> On 15/12/2021 11:07, Matthew Auld wrote:
>> Add some proper flags for the different modes, and shorten the name to
>> something more snappy.
> 
> Looks good to me - but since it touches TTM I leave for Thomas to approve.
> 
> Regards,
> 
> Tvrtko
> 
> P.S. I hope writing the patch means you thought it is an improvement as 
> well, rather than feeling I was asking for it to be done.

Yes, I do see both patches as an improvement :)

> 
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 23 ++++++++++++++++---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  8 +++----
>>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 16 +++++++++----
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 10 ++++----
>>   4 files changed, 39 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 00c844caeabd..6f446cca4322 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -57,9 +57,26 @@ struct drm_i915_gem_object_ops {
>>       void (*put_pages)(struct drm_i915_gem_object *obj,
>>                 struct sg_table *pages);
>>       int (*truncate)(struct drm_i915_gem_object *obj);
>> -    int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
>> -                      bool no_gpu_wait,
>> -                      bool should_writeback);
>> +    /**
>> +     * shrink - Perform further backend specific actions to facilate
>> +     * shrinking.
>> +     * @obj: The gem object
>> +     * @flags: Extra flags to control shrinking behaviour in the backend
>> +     *
>> +     * Possible values for @flags:
>> +     *
>> +     * I915_GEM_OBJECT_SHRINK_WRITEBACK - Try to perform writeback of 
>> the
>> +     * backing pages, if supported.
>> +     *
>> +     * I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT - Don't wait for the object to
>> +     * idle.  Active objects can be considered later. The TTM backend 
>> for
>> +     * example might have aync migrations going on, which don't use any
>> +     * i915_vma to track the active GTT binding, and hence having an 
>> unbound
>> +     * object might not be enough.
>> +     */
>> +#define I915_GEM_OBJECT_SHRINK_WRITEBACK   BIT(0)
>> +#define I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT BIT(1)
>> +    int (*shrink)(struct drm_i915_gem_object *obj, unsigned int flags);
>>       int (*pread)(struct drm_i915_gem_object *obj,
>>                const struct drm_i915_gem_pread *arg);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 7fdf4fa10b0e..6c57b0a79c8a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -331,9 +331,7 @@ shmem_writeback(struct drm_i915_gem_object *obj)
>>       __shmem_writeback(obj->base.size, obj->base.filp->f_mapping);
>>   }
>> -static int shmem_shrinker_release_pages(struct drm_i915_gem_object *obj,
>> -                    bool no_gpu_wait,
>> -                    bool writeback)
>> +static int shmem_shrink(struct drm_i915_gem_object *obj, unsigned int 
>> flags)
>>   {
>>       switch (obj->mm.madv) {
>>       case I915_MADV_DONTNEED:
>> @@ -342,7 +340,7 @@ static int shmem_shrinker_release_pages(struct 
>> drm_i915_gem_object *obj,
>>           return 0;
>>       }
>> -    if (writeback)
>> +    if (flags & I915_GEM_OBJECT_SHRINK_WRITEBACK)
>>           shmem_writeback(obj);
>>       return 0;
>> @@ -520,7 +518,7 @@ const struct drm_i915_gem_object_ops 
>> i915_gem_shmem_ops = {
>>       .get_pages = shmem_get_pages,
>>       .put_pages = shmem_put_pages,
>>       .truncate = shmem_truncate,
>> -    .shrinker_release_pages = shmem_shrinker_release_pages,
>> +    .shrink = shmem_shrink,
>>       .pwrite = shmem_pwrite,
>>       .pread = shmem_pread,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> index fd54e05521f6..968ca0fdd57b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> @@ -57,10 +57,18 @@ static bool unsafe_drop_pages(struct 
>> drm_i915_gem_object *obj,
>>   static int try_to_writeback(struct drm_i915_gem_object *obj, 
>> unsigned int flags)
>>   {
>> -    if (obj->ops->shrinker_release_pages)
>> -        return obj->ops->shrinker_release_pages(obj,
>> -                            !(flags & I915_SHRINK_ACTIVE),
>> -                            flags & I915_SHRINK_WRITEBACK);
>> +    if (obj->ops->shrink) {
>> +        unsigned int shrink_flags = 0;
>> +
>> +        if (!(flags & I915_SHRINK_ACTIVE))
>> +            shrink_flags |= I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT;
>> +
>> +        if (flags & I915_SHRINK_WRITEBACK)
>> +            shrink_flags |= I915_GEM_OBJECT_SHRINK_WRITEBACK;
>> +
>> +        return obj->ops->shrink(obj, shrink_flags);
>> +    }
>> +
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 923cc7ad8d70..21277f3c64e7 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -424,16 +424,14 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
>>       return 0;
>>   }
>> -static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object 
>> *obj,
>> -                       bool no_wait_gpu,
>> -                       bool should_writeback)
>> +static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned 
>> int flags)
>>   {
>>       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>       struct i915_ttm_tt *i915_tt =
>>           container_of(bo->ttm, typeof(*i915_tt), ttm);
>>       struct ttm_operation_ctx ctx = {
>>           .interruptible = true,
>> -        .no_wait_gpu = no_wait_gpu,
>> +        .no_wait_gpu = flags & I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT,
>>       };
>>       struct ttm_placement place = {};
>>       int ret;
>> @@ -467,7 +465,7 @@ static int i915_ttm_shrinker_release_pages(struct 
>> drm_i915_gem_object *obj,
>>           return ret;
>>       }
>> -    if (should_writeback)
>> +    if (flags & I915_GEM_OBJECT_SHRINK_WRITEBACK)
>>           __shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
>>       return 0;
>> @@ -953,7 +951,7 @@ static const struct drm_i915_gem_object_ops 
>> i915_gem_ttm_obj_ops = {
>>       .get_pages = i915_ttm_get_pages,
>>       .put_pages = i915_ttm_put_pages,
>>       .truncate = i915_ttm_purge,
>> -    .shrinker_release_pages = i915_ttm_shrinker_release_pages,
>> +    .shrink = i915_ttm_shrink,
>>       .adjust_lru = i915_ttm_adjust_lru,
>>       .delayed_free = i915_ttm_delayed_free,
>>
