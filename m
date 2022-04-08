Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3314F9223
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D434C10E1C3;
	Fri,  8 Apr 2022 09:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EB510E205;
 Fri,  8 Apr 2022 09:39:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k23so16178155ejd.3;
 Fri, 08 Apr 2022 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tsGzAIi74QtByGW709COJjAShCzflE3HJdR1Mr3sX0Y=;
 b=GvYjd/0WzRbp4jlLSW0Oue0vvp6pztK3JnRvcvpaa+JeJ0G7eXw5Qn9gfvXbkWRhvu
 5ggxD0yvnVdpYMum3zgjOVfSf3cbvPf1DxaJiIj6LqophOm0r1ZG574oHuf/wwDafkkx
 L5EQGj5pQgJEFXPUGoe8GbeCdcjjP5x0brxcv1XjF6jdfUd1kSh6L3A2nHl7WMlQNROU
 A/YVpad2JgwsTbToelhyxwlWBs2imAdXhxzMvR4NunqAvwRnNN0wr7lSXbgKkEUJsoPa
 izuIg7iCyqpau+xjCc44X/5MG734YUdbKfw61vROonHLRLC7PSo2DONtqMNTNgfI3Lnv
 mfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tsGzAIi74QtByGW709COJjAShCzflE3HJdR1Mr3sX0Y=;
 b=hl6IgRN3tDSxxqfXrSCsxY5BqLkA2QBMUKBZ2hyeYp7z2xrqNo4DEBZlg/tRnLo5B4
 6vYxPZg0zaHUvJyuuMoe2O/e8e2B7/hQ+qIRfz1+F/jSVIy5eG4w7BpE3eFbE7W5w5C0
 zbgVYQRfH08eg+2hXYfhWwMwTmnop7kYG7MLAgcyvodQQVaf/JgsB2VOZUA7JhFfBeVa
 +bgQR9lkWG3y3sEm+4KiSJdeP6/hLs0Q5B2lgatOpAR/Tq2ttQU26jtK2xXn8zaYOpRS
 Ge0Q8W16CglU2VWFiKEt1UZaqhHfIpgB0307eUXU/JMxKlTEB5iJDnB5ADXIk5mLVjs0
 wEnw==
X-Gm-Message-State: AOAM532UMbRd4DwXu/gDtZftRyoqCYKWR0azS6icWfR4iAS0sg1fmCNi
 4NECMsKmx4eGxUNdeCEU0Hg=
X-Google-Smtp-Source: ABdhPJz7RH7xBJ+qWnA5hWmL+S03P9dlzHJsu8iIVtIR2lc3djaPixzhg4BhL5dHJKR9tFgBGWzW4Q==
X-Received: by 2002:a17:907:1c16:b0:6d7:622b:efea with SMTP id
 nc22-20020a1709071c1600b006d7622befeamr17293005ejc.110.1649410768228; 
 Fri, 08 Apr 2022 02:39:28 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:114:5e2d:4d2d:2c8b?
 ([2a02:908:1252:fb60:114:5e2d:4d2d:2c8b])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm8564408ejj.142.2022.04.08.02.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 02:39:27 -0700 (PDT)
Message-ID: <3b9a361a-543c-f6e0-7f12-260f90de9c9e@gmail.com>
Date: Fri, 8 Apr 2022 11:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/15] drm/i915: drop bo->moving dependency
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-13-christian.koenig@amd.com>
 <87y20ghrmy.fsf@intel.com> <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
 <CAKMK7uEYbNrNZAx1k_D7u01=2-d3chResyBo9NFzG9BPq84LpA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKMK7uEYbNrNZAx1k_D7u01=2-d3chResyBo9NFzG9BPq84LpA@mail.gmail.com>
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 11:33 schrieb Daniel Vetter:
> On Fri, 8 Apr 2022 at 11:27, Christian König <christian.koenig@amd.com> wrote:
>> Am 08.04.22 um 11:05 schrieb Jani Nikula:
>>> On Thu, 07 Apr 2022, "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> That should now be handled by the common dma_resv framework.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: intel-gfx@lists.freedesktop.org
>>> So, where are the i915 maintainer acks for merging this (and the other
>>> patches in the series touching i915) via drm-misc-next?
>>>
>>> Daniel's Reviewed-by is not an ack to merge outside drm-intel-next.
>> I had the impression that it would be sufficient.
>>
>>> We don't merge i915 stuff without passing CI results. Apparently this
>>> one failed enough machines that the CI had to be stopped entirely.
>> That was unfortunately partially expected and pointed out by Matthew and
>> Daniel before the push.
> Uh I didn't realize that CI never tested this. Usually the way then is
> to rebase onto drm-tip and figure out the merge story. Doing subsystem
> wide changes while not on linux-next or drm-tip or another integration
> tree is just fraught with surprises due to conflicts.
>
> Also "doesn't even compile" is really below the bar, and not the first
> time this happened at all. And i915 isn't really an obscure driver
> which is hard to compile test :-)

Yeah, I'm really wondering how the build breakage slipped as well.

I've double checked it multiple times now. My build system was certainly 
not complaining about anything, but right after the push both i915, VC4 
and one of the core header changes broke the build on drm-tip.

Going to try to figure out why that didn't worked as expected.

Thanks,
Christian

> -Daniel
>
>> i915 for some reason extended the usage of the bo->moving fence despite
>> the fact we had patches on the mailing list to entirely remove this feature.
>>
>> I couldn't get any sane CI results for weeks because of this and at some
>> point we just had to go ahead and fix the clash in drm-tip.
>>
>> Sorry for any inconvenience cause by that. I hoped that we fixed all
>> cases, but looks like we still missed some.
>>
>> Regards,
>> Christian.
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
>>>>    .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
>>>>    .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
>>>>    drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
>>>>    6 files changed, 21 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 372bc220faeb..ffde7bc0a95d 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>>>>    /**
>>>>     * i915_gem_object_get_moving_fence - Get the object's moving fence if any
>>>>     * @obj: The object whose moving fence to get.
>>>> + * @fence: The resulting fence
>>>>     *
>>>>     * A non-signaled moving fence means that there is an async operation
>>>>     * pending on the object that needs to be waited on before setting up
>>>>     * any GPU- or CPU PTEs to the object's pages.
>>>>     *
>>>> - * Return: A refcounted pointer to the object's moving fence if any,
>>>> - * NULL otherwise.
>>>> + * Return: Negative error code or 0 for success.
>>>>     */
>>>> -struct dma_fence *
>>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>>> +                                 struct dma_fence **fence)
>>>>    {
>>>> -    return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>>>> -}
>>>> -
>>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>> -                                  struct dma_fence *fence)
>>>> -{
>>>> -    struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
>>>> -
>>>> -    if (*moving == fence)
>>>> -            return;
>>>> -
>>>> -    dma_fence_put(*moving);
>>>> -    *moving = dma_fence_get(fence);
>>>> +    return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
>>>> +                                  fence);
>>>>    }
>>>>
>>>>    /**
>>>> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>>    int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>>                                     bool intr)
>>>>    {
>>>> -    struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
>>>> -    int ret;
>>>> -
>>>>       assert_object_held(obj);
>>>> -    if (!fence)
>>>> -            return 0;
>>>> -
>>>> -    ret = dma_fence_wait(fence, intr);
>>>> -    if (ret)
>>>> -            return ret;
>>>> -
>>>> -    if (fence->error)
>>>> -            return fence->error;
>>>> -
>>>> -    i915_gem_to_ttm(obj)->moving = NULL;
>>>> -    dma_fence_put(fence);
>>>> -    return 0;
>>>> +    return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>>>> +                                 intr, MAX_SCHEDULE_TIMEOUT);
>>>>    }
>>>>
>>>>    #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index 02c37fe4a535..e11d82a9f7c3 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>>>>       i915_gem_object_unpin_pages(obj);
>>>>    }
>>>>
>>>> -struct dma_fence *
>>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
>>>> -
>>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>> -                                  struct dma_fence *fence);
>>>> -
>>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>>> +                                 struct dma_fence **fence);
>>>>    int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>>                                     bool intr);
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> index 438b8a95b3d1..a10716f4e717 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>>>>       return fence;
>>>>    }
>>>>
>>>> -static int
>>>> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>> -      struct i915_deps *deps)
>>>> -{
>>>> -    int ret;
>>>> -
>>>> -    ret = i915_deps_add_dependency(deps, bo->moving, ctx);
>>>> -    if (!ret)
>>>> -            ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
>>>> -
>>>> -    return ret;
>>>> -}
>>>> -
>>>>    /**
>>>>     * i915_ttm_move - The TTM move callback used by i915.
>>>>     * @bo: The buffer object.
>>>> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>>>               struct i915_deps deps;
>>>>
>>>>               i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>>>> -            ret = prev_deps(bo, ctx, &deps);
>>>> +            ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
>>>>               if (ret) {
>>>>                       i915_refct_sgt_put(dst_rsgt);
>>>>                       return ret;
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> index 4997ed18b6e4..0ad443a90c8b 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
>>>>                       err = dma_resv_reserve_fences(obj->base.resv, 1);
>>>>                       if (!err)
>>>>                               dma_resv_add_fence(obj->base.resv, &rq->fence,
>>>> -                                               DMA_RESV_USAGE_WRITE);
>>>> -                    i915_gem_object_set_moving_fence(obj, &rq->fence);
>>>> +                                               DMA_RESV_USAGE_KERNEL);
>>>>                       i915_request_put(rq);
>>>>               }
>>>>               if (err)
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> index 3a6e3f6d239f..dfc34cc2ef8c 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
>>>>       i915_gem_object_unpin_pages(obj);
>>>>       if (rq) {
>>>>               dma_resv_add_fence(obj->base.resv, &rq->fence,
>>>> -                               DMA_RESV_USAGE_WRITE);
>>>> -            i915_gem_object_set_moving_fence(obj, &rq->fence);
>>>> +                               DMA_RESV_USAGE_KERNEL);
>>>>               i915_request_put(rq);
>>>>       }
>>>>       i915_gem_object_unlock(obj);
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>> index 524477d8939e..d077f7b9eaad 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>>       if (err)
>>>>               return err;
>>>>
>>>> +    if (vma->obj) {
>>>> +            err = i915_gem_object_get_moving_fence(vma->obj, &moving);
>>>> +            if (err)
>>>> +                    return err;
>>>> +    } else {
>>>> +            moving = NULL;
>>>> +    }
>>>> +
>>>>       if (flags & PIN_GLOBAL)
>>>>               wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>>>>
>>>> -    moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
>>>>       if (flags & vma->vm->bind_async_flags || moving) {
>>>>               /* lock VM */
>>>>               err = i915_vm_lock_objects(vma->vm, ww);
>

