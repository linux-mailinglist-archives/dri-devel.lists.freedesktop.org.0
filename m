Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A372644A7E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 18:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847F510E338;
	Tue,  6 Dec 2022 17:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654A10E338;
 Tue,  6 Dec 2022 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670348459; x=1701884459;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xPfEcAqzZv4H5nyIKencyDwovop1rldRHU5I9TCqgks=;
 b=Lv8/+knzyWpSHul4og5GZFasgDvvOcXUYy/BE9LrSR9C0ah+c4PIdYr6
 Jk3WmzPJg/sFkMTV+nxCmF7LhJvjsMPfAgnKjRY9phwEoWOKPxrh3375h
 Gqfukqf1Bl+11SU111EgmVPDADzbPtgGYtQcjXn3gUnUZPTzwnmCnpVhB
 rkxPpgdivOSK2o10CAD6IICby9NTPhT60JvgPC5Q8oAyjdqV4v1ApSHaG
 47B66muSiYbd6Vpk/YqCQioEIAo8xLzmplruPTn0iyUVY3ixkruUSwR6i
 eGeLvnbtb2CW/SSH3+Xdcrau+vRpC/qO4I5EPMn+PoTIMtdbJOtiXGAz6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300105893"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="300105893"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 09:40:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="770803245"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="770803245"
Received: from yk-book.ger.corp.intel.com (HELO [10.252.19.83])
 ([10.252.19.83])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 09:40:56 -0800
Message-ID: <c2346df8-87b3-586f-a4d2-b4c70e08e66b@intel.com>
Date: Tue, 6 Dec 2022 17:40:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [Intel-gfx] [PATCH v8 22/22] drm/i915/vm_bind: Support capture of
 persistent mappings
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-23-niranjana.vishwanathapura@intel.com>
 <dbbd19e4-4354-bd11-a68d-435f59150fc8@intel.com>
 <Y4jH4297KUGrYTr6@nvishwa1-DESK> <Y4j1w8KoN9ASjJxu@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y4j1w8KoN9ASjJxu@nvishwa1-DESK>
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2022 18:43, Niranjana Vishwanathapura wrote:
> On Thu, Dec 01, 2022 at 07:27:31AM -0800, Niranjana Vishwanathapura wrote:
>> On Thu, Dec 01, 2022 at 10:49:15AM +0000, Matthew Auld wrote:
>>> On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
>>>> Support dump capture of persistent mappings upon user request.
>>>>
>>>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>> <niranjana.vishwanathapura@intel.com>
>>>> ---
>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 11 +++++++++++
>>>> drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 +++
>>>> drivers/gpu/drm/i915/gt/intel_gtt.h           |  5 +++++
>>>> drivers/gpu/drm/i915/i915_gpu_error.c         | 19 +++++++++++++++++++
>>>> drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>>> drivers/gpu/drm/i915/i915_vma_types.h         |  2 ++
>>>> include/uapi/drm/i915_drm.h                   |  3 ++-
>>>> 7 files changed, 43 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>> index 78e7c0642c5f..50969613daf6 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>> @@ -88,6 +88,11 @@ static void i915_gem_vm_bind_remove(struct 
>>>> i915_vma *vma, bool release_obj)
>>>> {
>>>>     lockdep_assert_held(&vma->vm->vm_bind_lock);
>>>> +    spin_lock(&vma->vm->vm_capture_lock);
>>>> +    if (!list_empty(&vma->vm_capture_link))
>>>> +        list_del_init(&vma->vm_capture_link);
>>>> +    spin_unlock(&vma->vm->vm_capture_lock);
>>>> +
>>>>     spin_lock(&vma->vm->vm_rebind_lock);
>>>>     if (!list_empty(&vma->vm_rebind_link))
>>>>         list_del_init(&vma->vm_rebind_link);
>>>> @@ -357,6 +362,12 @@ static int i915_gem_vm_bind_obj(struct 
>>>> i915_address_space *vm,
>>>>                 continue;
>>>>         }
>>>> +        if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
>>>> +            spin_lock(&vm->vm_capture_lock);
>>>> +            list_add_tail(&vma->vm_capture_link, 
>>>> &vm->vm_capture_list);
>>>> +            spin_unlock(&vm->vm_capture_lock);
>>>> +        }
>>>> +
>>>>         list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>>         i915_vm_bind_it_insert(vma, &vm->va);
>>>>         if (!obj->priv_root)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>> index ebf6830574a0..bdabe13fc30e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>> @@ -297,6 +297,9 @@ void i915_address_space_init(struct 
>>>> i915_address_space *vm, int subclass)
>>>>     spin_lock_init(&vm->vm_rebind_lock);
>>>>     spin_lock_init(&vm->userptr_invalidated_lock);
>>>>     INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>>> +
>>>> +    INIT_LIST_HEAD(&vm->vm_capture_list);
>>>> +    spin_lock_init(&vm->vm_capture_lock);
>>>> }
>>>> void *__px_vaddr(struct drm_i915_gem_object *p)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> index 87e5b6568a00..8e4ddd073348 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> @@ -281,6 +281,11 @@ struct i915_address_space {
>>>>     /** @root_obj: root object for dma-resv sharing by private 
>>>> objects */
>>>>     struct drm_i915_gem_object *root_obj;
>>>> +    /* @vm_capture_list: list of vm captures */
>>>> +    struct list_head vm_capture_list;
>>>> +    /* @vm_capture_lock: protects vm_capture_list */
>>>> +    spinlock_t vm_capture_lock;
>>>> +
>>>>     /* Global GTT */
>>>>     bool is_ggtt:1;
>>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> index 9d5d5a397b64..3b2b12a739f7 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>> @@ -1460,6 +1460,22 @@ capture_vma(struct intel_engine_capture_vma 
>>>> *next,
>>>>     return next;
>>>> }
>>>> +static struct intel_engine_capture_vma *
>>>> +capture_user_vm(struct intel_engine_capture_vma *capture,
>>>> +        struct i915_address_space *vm, gfp_t gfp)
>>>> +{
>>>> +    struct i915_vma *vma;
>>>> +
>>>> +    spin_lock(&vm->vm_capture_lock);
>>>
>>> Does it make sense to move this into the eb3 submission stage, like 
>>> we do for eb2? IIRC the gfp flags here are quite limiting due to 
>>> potentially being in a fence critical section. If we can use 
>>> rq->capture_list for eb3, we shouldn't need to change much here?
>>>
>>
>> But that will add latency on submission path as we will have to iterate
>> over capture_list in each submission. Besides, unlike eb2 case, we can't
>> just transfer the list to rq->capture_list as we will have to do this
>> for each submission. It was discussed long time back and decided not to
>> bother the fast path (submision) scenario with this error capture which
>> is only required upon gpu hang (slow path).

Maybe add some of this to the commit message, just to give a bit more 
back story/history. From my pov I'm coming into this semi-blind.

>>
>>> Also there is the existing CONFIG_DRM_I915_CAPTURE_ERROR. Should we 
>>> take that into account?
>>>
>>
>> Ok, will fix.
>>
>>>> +    /* vma->resource must be valid here as persistent vmas are 
>>>> bound */
>>>> +    list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
>>>> +        capture = capture_vma_snapshot(capture, vma->resource,
>>>> +                           gfp, "user");
>>>> +    spin_unlock(&vm->vm_capture_lock);
>>>> +
>>>> +    return capture;
>>>> +}
>>>> +
>>>> static struct intel_engine_capture_vma *
>>>> capture_user(struct intel_engine_capture_vma *capture,
>>>>          const struct i915_request *rq,
>>>> @@ -1471,6 +1487,9 @@ capture_user(struct intel_engine_capture_vma 
>>>> *capture,
>>>>         capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>>>                            "user");
>>>> +    capture = capture_user_vm(capture, rq->context->vm,
>>>> +                  GFP_NOWAIT | __GFP_NOWARN);
>>>
>>> And this should maybe use the passed in gfp?
>>>
>>
>> Ok, will fix
>>
> 
> Acutally in one path (capture_engine), it is called with non-blocking gfp,
> in other path (execlists_capture_work), it is called with blocking gfp.
> I chose to override it here as we use spinlock (vm_capture_lock) and we
> are using MAYFAIL version in somepaths anyhow.I can add documentation
> for this override here. We can switch to a mutex here (instead of spinlock)
> for vm_capture_lock, but not sure it is worth it or if in anyway we endup
> here with atomic context. What do you think?

No strong opinion. Keeping the existing gfp looks like the least amount 
of friction, if possible.

> 
> Thanks,
> Niranjana
> 
>>>> +
>>>>     return capture;
>>>> }
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>> b/drivers/gpu/drm/i915/i915_vma.c
>>>> index 68a9ac77b4f2..0244864e94f7 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>> @@ -248,6 +248,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>     INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>>>     INIT_LIST_HEAD(&vma->vm_rebind_link);
>>>>     INIT_LIST_HEAD(&vma->userptr_invalidated_link);
>>>> +    INIT_LIST_HEAD(&vma->vm_capture_link);
>>>>     return vma;
>>>> err_unlock:
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>>>> b/drivers/gpu/drm/i915/i915_vma_types.h
>>>> index 90471dc0b235..10ae9f739d57 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>>>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>>> @@ -309,6 +309,8 @@ struct i915_vma {
>>>>     struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>>>     /** @userptr_invalidated_link: link to the 
>>>> vm->userptr_invalidated_list */
>>>>     struct list_head userptr_invalidated_link;
>>>> +    /* @vm_capture_link: link to the captureable VMA list */
>>>> +    struct list_head vm_capture_link;
>>>>     /** Timeline fence for vm_bind completion notification */
>>>>     struct {
>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>> index b9167f950327..0744651ad5b0 100644
>>>> --- a/include/uapi/drm/i915_drm.h
>>>> +++ b/include/uapi/drm/i915_drm.h
>>>> @@ -3930,7 +3930,8 @@ struct drm_i915_gem_vm_bind {
>>>>      * Note that @fence carries its own flags.
>>>>      */
>>>>     __u64 flags;
>>>> -#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>>> +#define I915_GEM_VM_BIND_CAPTURE           (1 << 0)
>>>
>>> 1ull << 0
>>>
>>> Worried about what the value of UNKNOWN_FLAGS might be otherwise? 
>>> Also needs some kernel-doc.
>>>
>>
>> Ok, will fix and add kernel-doc.
>>
>> Thanks,
>> Niranjana
>>
>>>> +#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   
>>>> (-(I915_GEM_VM_BIND_CAPTURE << 1))
>>>>     /** @rsvd: Reserved, MBZ */
>>>>     __u64 rsvd[2];
