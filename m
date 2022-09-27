Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4555EB9DE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 07:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F8110E061;
	Tue, 27 Sep 2022 05:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5710E061;
 Tue, 27 Sep 2022 05:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664257581; x=1695793581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i9xVrsIFEt/m7Yp0KJDQKK/34NLoz+XiB5D7ZvTYzFY=;
 b=YHNyyJdNJat5P1BXXhgjEpj4SjsbLwwwACl9yqN3AJIBcfvgVLrntcNG
 SJKstlMhmKLLoQ3T+/lNj0Yi3kaA3YFdwQEtiwDMs5d3CwB4nF6RaPlaT
 PAimhTW9h/sZG7Fd+q3M8woHZpM1x9OusZJrYeyXeTWLa5xQvRzROLv/7
 P9U/MQsUpVNZGhjdbeqiTD0hHRzOdnjRneT8zoQv7eDOEQRggEy2xVrVs
 0gfJWZdI2b4h8iTk5i0DSIJsjxD/q46nCVB8qZwomjrwldBwedtXgqrq8
 ZG/glrUK/OXOUKu3TeD63uJP0aS3D2Z9R1PR0JPwPrTDg0faJ0HSlPCES w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="288377602"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="288377602"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:46:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="616708282"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="616708282"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:46:20 -0700
Date: Mon, 26 Sep 2022 22:45:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Subject: Re: [Intel-gfx] [RFC v4 06/14] drm/i915/vm_bind: Handle persistent
 vmas
Message-ID: <20220927054558.GB16345@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-7-niranjana.vishwanathapura@intel.com>
 <BN6PR11MB16331BEF9028F43443AFA23F92559@BN6PR11MB1633.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BN6PR11MB16331BEF9028F43443AFA23F92559@BN6PR11MB1633.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 07:36:24PM -0700, Zeng, Oak wrote:
>
>
>Regards,
>Oak
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>> Vishwanathapura
>> Sent: September 21, 2022 3:10 AM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>; Hellstrom, Thomas
>> <thomas.hellstrom@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Vetter,
>> Daniel <daniel.vetter@intel.com>; christian.koenig@amd.com
>> Subject: [Intel-gfx] [RFC v4 06/14] drm/i915/vm_bind: Handle persistent vmas
>>
>> Treat VM_BIND vmas as persistent across execbuf ioctl calls and handle
>> them during the request submission in the execbuff path.
>>
>> Support eviction by maintaining a list of evicted persistent vmas
>> for rebinding during next submission.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  7 +++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++
>>  drivers/gpu/drm/i915/i915_gem_gtt.c           | 39 ++++++++++++++++
>>  drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 ++
>>  drivers/gpu/drm/i915/i915_vma.c               | 46 +++++++++++++++++++
>>  drivers/gpu/drm/i915/i915_vma.h               | 45 +++++++++++++-----
>>  drivers/gpu/drm/i915/i915_vma_types.h         | 17 +++++++
>>  8 files changed, 151 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> index 7ca6a41fc981..236f901b8b9c 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -91,6 +91,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma
>> *vma, bool release_obj)
>>  {
>>       lockdep_assert_held(&vma->vm->vm_bind_lock);
>>
>> +     spin_lock(&vma->vm->vm_rebind_lock);
>> +     if (!list_empty(&vma->vm_rebind_link))
>> +             list_del_init(&vma->vm_rebind_link);
>> +     i915_vma_set_purged(vma);
>> +     spin_unlock(&vma->vm->vm_rebind_lock);
>> +
>>       list_del_init(&vma->vm_bind_link);
>>       list_del_init(&vma->non_priv_vm_bind_link);
>>       i915_vm_bind_it_remove(vma, &vma->vm->va);
>> @@ -181,6 +187,7 @@ static struct i915_vma *vm_bind_get_vma(struct
>> i915_address_space *vm,
>>
>>       vma->start = va->start;
>>       vma->last = va->start + va->length - 1;
>> +     i915_vma_set_persistent(vma);
>>
>>       return vma;
>>  }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index da4f9dee0397..6db31197fa87 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -296,6 +296,8 @@ void i915_address_space_init(struct i915_address_space
>> *vm, int subclass)
>>       INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>>       vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
>>       GEM_BUG_ON(IS_ERR(vm->root_obj));
>> +     INIT_LIST_HEAD(&vm->vm_rebind_list);
>> +     spin_lock_init(&vm->vm_rebind_lock);
>>  }
>>
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 3f2e87d3bf34..b73d35b4e05d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -273,6 +273,10 @@ struct i915_address_space {
>>       struct list_head vm_bind_list;
>>       /** @vm_bound_list: List of vm_binding completed */
>>       struct list_head vm_bound_list;
>> +     /* @vm_rebind_list: list of vmas to be rebinded */
>> +     struct list_head vm_rebind_list;
>> +     /* @vm_rebind_lock: protects vm_rebound_list */
>> +     spinlock_t vm_rebind_lock;
>>       /* @va: tree of persistent vmas */
>>       struct rb_root_cached va;
>>       struct list_head non_priv_vm_bind_list;
>> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c
>> b/drivers/gpu/drm/i915/i915_gem_gtt.c
>> index 329ff75b80b9..b7d0844de561 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
>> @@ -25,6 +25,45 @@
>>  #include "i915_trace.h"
>>  #include "i915_vgpu.h"
>>
>> +/**
>> + * i915_vm_sync() - Wait until address space is not in use
>> + * @vm: address space
>> + *
>> + * Waits until all requests using the address space are complete.
>> + *
>> + * Returns: 0 if success, -ve err code upon failure
>> + */
>> +int i915_vm_sync(struct i915_address_space *vm)
>> +{
>> +     int ret;
>> +
>> +     /* Wait for all requests under this vm to finish */
>> +     ret = dma_resv_wait_timeout(vm->root_obj->base.resv,
>> +                                 DMA_RESV_USAGE_BOOKKEEP, false,
>> +                                 MAX_SCHEDULE_TIMEOUT);
>> +     if (ret < 0)
>> +             return ret;
>> +     else if (ret > 0)
>> +             return 0;
>> +     else
>> +             return -ETIMEDOUT;
>> +}
>> +
>> +/**
>> + * i915_vm_is_active() - Check if address space is being used
>> + * @vm: address space
>> + *
>> + * Check if any request using the specified address space is
>> + * active.
>> + *
>> + * Returns: true if address space is active, false otherwise.
>> + */
>> +bool i915_vm_is_active(const struct i915_address_space *vm)
>> +{
>> +     return !dma_resv_test_signaled(vm->root_obj->base.resv,
>> +                                    DMA_RESV_USAGE_BOOKKEEP);
>> +}
>> +
>>  int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>>                              struct sg_table *pages)
>>  {
>> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h
>> b/drivers/gpu/drm/i915/i915_gem_gtt.h
>> index 8c2f57eb5dda..a5bbdc59d9df 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
>> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
>> @@ -51,4 +51,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>>
>>  #define PIN_OFFSET_MASK              I915_GTT_PAGE_MASK
>>
>> +int i915_vm_sync(struct i915_address_space *vm);
>> +bool i915_vm_is_active(const struct i915_address_space *vm);
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index aa332ad69ec2..ff216e9a2c8d 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -237,6 +237,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>
>>       INIT_LIST_HEAD(&vma->vm_bind_link);
>>       INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>> +     INIT_LIST_HEAD(&vma->vm_rebind_link);
>>       return vma;
>>
>>  err_unlock:
>> @@ -387,6 +388,24 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>>       return err;
>>  }
>>
>> +/**
>> + * i915_vma_sync() - Wait for the vma to be idle
>> + * @vma: vma to be tested
>> + *
>> + * Returns 0 on success and error code on failure
>> + */
>> +int i915_vma_sync(struct i915_vma *vma)
>> +{
>> +     int ret;
>> +
>> +     /* Wait for the asynchronous bindings and pending GPU reads */
>> +     ret = i915_active_wait(&vma->active);
>> +     if (ret || !i915_vma_is_persistent(vma) || i915_vma_is_purged(vma))
>> +             return ret;
>> +
>> +     return i915_vm_sync(vma->vm);
>
>Hi, I try to understand why we call vm_sync here. As I understand it, each vm has many vmas. The vma_sync function wait for a single vma to be idle, for example, wait for all the request/gpu task using this vma to complete. While vm_sync wait for the whole vm to be idle. To me vm_sync essentially wait for all the vmas in this vm to be idle. Isn't it?
>

Yah. But a persistent vma is active as long as the VM is active (also checkout i915_vma_is_active()). Hence we call i915_vm_sync() here.
I am rearranging the patches a bit and this part will go into a separate patch with more description. Hope that will help.

Regards,
Niranjana

>Thanks,
>Oak
>
>> +}
>> +
>>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>  static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>  {
>> @@ -1654,6 +1673,13 @@ static void force_unbind(struct i915_vma *vma)
>>       if (!drm_mm_node_allocated(&vma->node))
>>               return;
>>
>> +     /*
>> +      * Mark persistent vma as purged to avoid it waiting
>> +      * for VM to be released.
>> +      */
>> +     if (i915_vma_is_persistent(vma))
>> +             i915_vma_set_purged(vma);
>> +
>>       atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>       WARN_ON(__i915_vma_unbind(vma));
>>       GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>> @@ -1846,6 +1872,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>>       int err;
>>
>>       assert_object_held(obj);
>> +     if (i915_vma_is_persistent(vma))
>> +             return -EINVAL;
>>
>>       GEM_BUG_ON(!vma->pages);
>>
>> @@ -2015,6 +2043,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
>>       __i915_vma_evict(vma, false);
>>
>>       drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
>> +
>> +     if (i915_vma_is_persistent(vma)) {
>> +             spin_lock(&vma->vm->vm_rebind_lock);
>> +             if (list_empty(&vma->vm_rebind_link) &&
>> +                 !i915_vma_is_purged(vma))
>> +                     list_add_tail(&vma->vm_rebind_link,
>> +                                   &vma->vm->vm_rebind_list);
>> +             spin_unlock(&vma->vm->vm_rebind_lock);
>> +     }
>> +
>>       return 0;
>>  }
>>
>> @@ -2046,6 +2084,14 @@ static struct dma_fence
>> *__i915_vma_unbind_async(struct i915_vma *vma)
>>               return ERR_PTR(-EBUSY);
>>       }
>>
>> +     if (__i915_sw_fence_await_reservation(&vma->resource->chain,
>> +                                           vma->obj->base.resv,
>> +                                           DMA_RESV_USAGE_BOOKKEEP,
>> +                                           i915_fence_timeout(vma->vm->i915),
>> +                                           I915_FENCE_GFP) < 0) {
>> +             return ERR_PTR(-EBUSY);
>> +     }
>> +
>>       fence = __i915_vma_evict(vma, true);
>>
>>       drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>> index 6feef0305fe1..aa536c9ce472 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -47,12 +47,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>>
>>  void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
>>  #define I915_VMA_RELEASE_MAP BIT(0)
>> -
>> -static inline bool i915_vma_is_active(const struct i915_vma *vma)
>> -{
>> -     return !i915_active_is_idle(&vma->active);
>> -}
>> -
>>  /* do not reserve memory to prevent deadlocks */
>>  #define __EXEC_OBJECT_NO_RESERVE BIT(31)
>>
>> @@ -138,6 +132,38 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
>>       return i915_vm_to_ggtt(vma->vm)->pin_bias;
>>  }
>>
>> +static inline bool i915_vma_is_persistent(const struct i915_vma *vma)
>> +{
>> +     return test_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
>> +}
>> +
>> +static inline void i915_vma_set_persistent(struct i915_vma *vma)
>> +{
>> +     set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
>> +}
>> +
>> +static inline bool i915_vma_is_purged(const struct i915_vma *vma)
>> +{
>> +     return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
>> +}
>> +
>> +static inline void i915_vma_set_purged(struct i915_vma *vma)
>> +{
>> +     set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
>> +}
>> +
>> +static inline bool i915_vma_is_active(const struct i915_vma *vma)
>> +{
>> +     if (i915_vma_is_persistent(vma)) {
>> +             if (i915_vma_is_purged(vma))
>> +                     return false;
>> +
>> +             return i915_vm_is_active(vma->vm);
>> +     }
>> +
>> +     return !i915_active_is_idle(&vma->active);
>> +}
>> +
>>  static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
>>  {
>>       i915_gem_object_get(vma->obj);
>> @@ -406,12 +432,7 @@ void i915_vma_make_shrinkable(struct i915_vma *vma);
>>  void i915_vma_make_purgeable(struct i915_vma *vma);
>>
>>  int i915_vma_wait_for_bind(struct i915_vma *vma);
>> -
>> -static inline int i915_vma_sync(struct i915_vma *vma)
>> -{
>> -     /* Wait for the asynchronous bindings and pending GPU reads */
>> -     return i915_active_wait(&vma->active);
>> -}
>> +int i915_vma_sync(struct i915_vma *vma);
>>
>>  /**
>>   * i915_vma_get_current_resource - Get the current resource of the vma
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
>> b/drivers/gpu/drm/i915/i915_vma_types.h
>> index 6d727c2d9802..d21bf97febaa 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -264,6 +264,21 @@ struct i915_vma {
>>  #define I915_VMA_SCANOUT_BIT 17
>>  #define I915_VMA_SCANOUT     ((int)BIT(I915_VMA_SCANOUT_BIT))
>>
>> +  /**
>> +   * I915_VMA_PERSISTENT_BIT:
>> +   * The vma is persistent (created with VM_BIND call).
>> +   *
>> +   * I915_VMA_PURGED_BIT:
>> +   * The persistent vma is force unbound either due to VM_UNBIND call
>> +   * from UMD or VM is released. Do not check/wait for VM activeness
>> +   * in i915_vma_is_active() and i915_vma_sync() calls.
>> +   */
>> +#define I915_VMA_PERSISTENT_BIT      19
>> +#define I915_VMA_PURGED_BIT  20
>> +
>> +#define I915_VMA_PERSISTENT  ((int)BIT(I915_VMA_PERSISTENT_BIT))
>> +#define I915_VMA_PURGED              ((int)BIT(I915_VMA_PURGED_BIT))
>> +
>>       struct i915_active active;
>>
>>  #define I915_VMA_PAGES_BIAS 24
>> @@ -293,6 +308,8 @@ struct i915_vma {
>>       struct list_head vm_bind_link;
>>       /* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
>>       struct list_head non_priv_vm_bind_link;
>> +     /* @vm_rebind_link: link to vm_rebind_list and protected by
>> vm_rebind_lock */
>> +     struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>
>>       /** Interval tree structures for persistent vma */
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
