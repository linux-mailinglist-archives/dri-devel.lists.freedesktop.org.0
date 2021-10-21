Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DEC43669E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFBF6ECB7;
	Thu, 21 Oct 2021 15:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557106ECAA;
 Thu, 21 Oct 2021 15:42:29 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d205so1902856qke.3;
 Thu, 21 Oct 2021 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bP3PpTzuKSkswm52zIWZGRSjzTqs6/5a5g6f528XaBc=;
 b=eLkNOsnh4Nv4JsdpjQ1j3nJk0iFD4ukyv/LXkCPXzU8/gNhKnYtXjR2KrSwFfkp32K
 c6xvRB2TSssJYsIgKE3M+5FUVs3xVk55I2mC1oeMfnrHmrKaJUm0Q0Y2kh4WGqA17mZV
 KDg8xuPSDc/mi8J+zJUWhKLMob626AkoeLhlN5/WUSd2Obvjff0Tda60u1qUGGOI3pJ7
 3e4+q69PjMlyBEN2a4PAhhedkEHd6AEKIlSoPi6TrH69oxozwwru0TIUGWKQwBlJjyDN
 GfyiqfXxd+rGgumgKXdz86nk4yE4x1amlUzWCXMdVRcYyvBKoxEzygFV+B/DnfT1LyiE
 P7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bP3PpTzuKSkswm52zIWZGRSjzTqs6/5a5g6f528XaBc=;
 b=TmxNfd/9KEEuv3cxS8DxvfaWgT4awngC+9iN8v4FH/73nSIKzWaJ5rboQA/J5u10aj
 aWuti3wzhkqFc+dA3vpYJDDH5X+jYCI3UMM8jxpua3oDpK6LRa+SLk+8vTR7ClgNHKXs
 FjZWUhpsQkrFAAiIQVepyBYkaXSR182V4+Bxu0ou4CNyCCSeEEaGrCVUgNPn6CvwL00i
 Ec/6102zP86gxiSZlqpzaffdK1EEavqukRDaHmZz9D5+tr3itYg8bS/426saIkysHurt
 bUsFGSS/V8RVXa//TyA1s/msAblXaNY6PrwEm6arz0ihCktI+7I3P9j2MutEC/Z14EpB
 V5kg==
X-Gm-Message-State: AOAM530J7l/O9j8VMMZ0DnjHCTnJiew6yG1SLtRBcV+AWTq+eAeVFW9s
 PzevI9IXTSRWWmnF7jk1fPoH78m1uoCTiBNr119DI7itAqg=
X-Google-Smtp-Source: ABdhPJyJ9FNJqnd3Ra4p1l97SBHr+eVdPd5IhQBpc3dXYPk5333cs8JULshE2aNGl39Ex/bRH8ZwJ0OQv/NKh/ToR4A=
X-Received: by 2002:a37:ae84:: with SMTP id x126mr5061241qke.334.1634830948319; 
 Thu, 21 Oct 2021 08:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-7-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-7-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 16:42:00 +0100
Message-ID: <CAM0jSHMyT8YZek1ZtAom2vqaZCOWp1QdWTJkmwmBDrXM03gtWQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 07/28] drm/i915: Create a dummy object for
 gen6 ppgtt
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> We currently have to special case vma->obj being NULL because
> of gen6 ppgtt and mock_engine. Fix gen6 ppgtt, so we may soon
> be able to remove a few checks. As the object only exists as
> a fake object pointing to ggtt, we have no backing storage,
> so no real object is created. It just has to look real enough.
>
> Also kill pin_mutex, it's not compatible with ww locking,
> and we can use the vm lock instead.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c |  44 ++++---
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c         | 122 +++++++++++--------
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.h         |   1 -
>  drivers/gpu/drm/i915/i915_drv.h              |   4 +
>  4 files changed, 99 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> index a57a6b7013c2..c5150a1ee3d2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -145,24 +145,10 @@ static const struct drm_i915_gem_object_ops i915_gem_object_internal_ops = {
>         .put_pages = i915_gem_object_put_pages_internal,
>  };
>
> -/**
> - * i915_gem_object_create_internal: create an object with volatile pages
> - * @i915: the i915 device
> - * @size: the size in bytes of backing storage to allocate for the object
> - *
> - * Creates a new object that wraps some internal memory for private use.
> - * This object is not backed by swappable storage, and as such its contents
> - * are volatile and only valid whilst pinned. If the object is reaped by the
> - * shrinker, its pages and data will be discarded. Equally, it is not a full
> - * GEM object and so not valid for access from userspace. This makes it useful
> - * for hardware interfaces like ringbuffers (which are pinned from the time
> - * the request is written to the time the hardware stops accessing it), but
> - * not for contexts (which need to be preserved when not active for later
> - * reuse). Note that it is not cleared upon allocation.
> - */
>  struct drm_i915_gem_object *
> -i915_gem_object_create_internal(struct drm_i915_private *i915,
> -                               phys_addr_t size)
> +__i915_gem_object_create_internal(struct drm_i915_private *i915,
> +                                 const struct drm_i915_gem_object_ops *ops,
> +                                 phys_addr_t size)
>  {
>         static struct lock_class_key lock_class;
>         struct drm_i915_gem_object *obj;
> @@ -179,7 +165,7 @@ i915_gem_object_create_internal(struct drm_i915_private *i915,
>                 return ERR_PTR(-ENOMEM);
>
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
> -       i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class, 0);
> +       i915_gem_object_init(obj, ops, &lock_class, 0);
>         obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>
>         /*
> @@ -199,3 +185,25 @@ i915_gem_object_create_internal(struct drm_i915_private *i915,
>
>         return obj;
>  }
> +
> +/**
> + * i915_gem_object_create_internal: create an object with volatile pages
> + * @i915: the i915 device
> + * @size: the size in bytes of backing storage to allocate for the object
> + *
> + * Creates a new object that wraps some internal memory for private use.
> + * This object is not backed by swappable storage, and as such its contents
> + * are volatile and only valid whilst pinned. If the object is reaped by the
> + * shrinker, its pages and data will be discarded. Equally, it is not a full
> + * GEM object and so not valid for access from userspace. This makes it useful
> + * for hardware interfaces like ringbuffers (which are pinned from the time
> + * the request is written to the time the hardware stops accessing it), but
> + * not for contexts (which need to be preserved when not active for later
> + * reuse). Note that it is not cleared upon allocation.
> + */
> +struct drm_i915_gem_object *
> +i915_gem_object_create_internal(struct drm_i915_private *i915,
> +                               phys_addr_t size)
> +{
> +       return __i915_gem_object_create_internal(i915, &i915_gem_object_internal_ops, size);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index 9fdbd9d3372b..5caa1703716e 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -262,13 +262,10 @@ static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
>  {
>         struct gen6_ppgtt *ppgtt = to_gen6_ppgtt(i915_vm_to_ppgtt(vm));
>
> -       __i915_vma_put(ppgtt->vma);
> -
>         gen6_ppgtt_free_pd(ppgtt);
>         free_scratch(vm);
>
>         mutex_destroy(&ppgtt->flush);
> -       mutex_destroy(&ppgtt->pin_mutex);
>
>         free_pd(&ppgtt->base.vm, ppgtt->base.pd);
>  }
> @@ -331,37 +328,6 @@ static const struct i915_vma_ops pd_vma_ops = {
>         .unbind_vma = pd_vma_unbind,
>  };
>
> -static struct i915_vma *pd_vma_create(struct gen6_ppgtt *ppgtt, int size)
> -{
> -       struct i915_ggtt *ggtt = ppgtt->base.vm.gt->ggtt;
> -       struct i915_vma *vma;
> -
> -       GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE));
> -       GEM_BUG_ON(size > ggtt->vm.total);
> -
> -       vma = i915_vma_alloc();
> -       if (!vma)
> -               return ERR_PTR(-ENOMEM);
> -
> -       i915_active_init(&vma->active, NULL, NULL, 0);
> -
> -       kref_init(&vma->ref);
> -       mutex_init(&vma->pages_mutex);
> -       vma->vm = i915_vm_get(&ggtt->vm);
> -       vma->ops = &pd_vma_ops;
> -       vma->private = ppgtt;
> -
> -       vma->size = size;
> -       vma->fence_size = size;
> -       atomic_set(&vma->flags, I915_VMA_GGTT);
> -       vma->ggtt_view.type = I915_GGTT_VIEW_ROTATED; /* prevent fencing */
> -
> -       INIT_LIST_HEAD(&vma->obj_link);
> -       INIT_LIST_HEAD(&vma->closed_link);
> -
> -       return vma;
> -}
> -
>  int gen6_ppgtt_pin(struct i915_ppgtt *base, struct i915_gem_ww_ctx *ww)
>  {
>         struct gen6_ppgtt *ppgtt = to_gen6_ppgtt(base);
> @@ -378,24 +344,84 @@ int gen6_ppgtt_pin(struct i915_ppgtt *base, struct i915_gem_ww_ctx *ww)
>         if (atomic_add_unless(&ppgtt->pin_count, 1, 0))
>                 return 0;
>
> -       if (mutex_lock_interruptible(&ppgtt->pin_mutex))
> -               return -EINTR;
> +       /* grab the ppgtt resv to pin the object */
> +       err = i915_vm_lock_objects(&ppgtt->base.vm, ww);
> +       if (err)
> +               return err;
>
>         /*
>          * PPGTT PDEs reside in the GGTT and consists of 512 entries. The
>          * allocator works in address space sizes, so it's multiplied by page
>          * size. We allocate at the top of the GTT to avoid fragmentation.
>          */
> -       err = 0;
> -       if (!atomic_read(&ppgtt->pin_count))
> +       if (!atomic_read(&ppgtt->pin_count)) {
>                 err = i915_ggtt_pin(ppgtt->vma, ww, GEN6_PD_ALIGN, PIN_HIGH);
> +
> +               GEM_BUG_ON(ppgtt->vma->fence);
> +               clear_bit(I915_VMA_CAN_FENCE_BIT, __i915_vma_flags(ppgtt->vma));
> +       }
>         if (!err)
>                 atomic_inc(&ppgtt->pin_count);
> -       mutex_unlock(&ppgtt->pin_mutex);
>
>         return err;
>  }
>
> +static int pd_dummy_obj_get_pages(struct drm_i915_gem_object *obj)
> +{
> +       obj->mm.pages = ZERO_SIZE_PTR;
> +       return 0;
> +}
> +
> +static void pd_dummy_obj_put_pages(struct drm_i915_gem_object *obj,
> +                                    struct sg_table *pages)
> +{
> +}
> +
> +static const struct drm_i915_gem_object_ops pd_dummy_obj_ops = {
> +       .name = "pd_dummy_obj",
> +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE,

I would assume we don't want this dummy object to be considered for shrinking?

> +       .get_pages = pd_dummy_obj_get_pages,
> +       .put_pages = pd_dummy_obj_put_pages,
> +};
> +
> +static struct i915_page_directory *
> +gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
> +{
> +       struct i915_ggtt * const ggtt = ppgtt->base.vm.gt->ggtt;
> +       struct i915_page_directory *pd;
> +       int err;
> +
> +       pd = __alloc_pd(I915_PDES);
> +       if (unlikely(!pd))
> +               return ERR_PTR(-ENOMEM);
> +
> +       pd->pt.base = __i915_gem_object_create_internal(ppgtt->base.vm.gt->i915, &pd_dummy_obj_ops, I915_PDES * SZ_4K);

Overly long line?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +       if (IS_ERR(pd->pt.base)) {
> +               err = PTR_ERR(pd->pt.base);
> +               pd->pt.base = NULL;
> +               goto err_pd;
> +       }
> +
> +       pd->pt.base->base.resv = i915_vm_resv_get(&ppgtt->base.vm);
> +       pd->pt.base->shares_resv_from = &ppgtt->base.vm;
> +
> +       ppgtt->vma = i915_vma_instance(pd->pt.base, &ggtt->vm, NULL);
> +       if (IS_ERR(ppgtt->vma)) {
> +               err = PTR_ERR(ppgtt->vma);
> +               ppgtt->vma = NULL;
> +               goto err_pd;
> +       }
> +
> +       /* The dummy object we create is special, override ops.. */
> +       ppgtt->vma->ops = &pd_vma_ops;
> +       ppgtt->vma->private = ppgtt;
> +       return pd;
> +
> +err_pd:
> +       free_pd(&ppgtt->base.vm, pd);
> +       return ERR_PTR(err);
> +}
> +
>  void gen6_ppgtt_unpin(struct i915_ppgtt *base)
>  {
>         struct gen6_ppgtt *ppgtt = to_gen6_ppgtt(base);
> @@ -416,7 +442,6 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
>                 return ERR_PTR(-ENOMEM);
>
>         mutex_init(&ppgtt->flush);
> -       mutex_init(&ppgtt->pin_mutex);
>
>         ppgtt_init(&ppgtt->base, gt, 0);
>         ppgtt->base.vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen6_pte_t));
> @@ -431,19 +456,13 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
>         ppgtt->base.vm.alloc_pt_dma = alloc_pt_dma;
>         ppgtt->base.vm.pte_encode = ggtt->vm.pte_encode;
>
> -       ppgtt->base.pd = __alloc_pd(I915_PDES);
> -       if (!ppgtt->base.pd) {
> -               err = -ENOMEM;
> -               goto err_free;
> -       }
> -
>         err = gen6_ppgtt_init_scratch(ppgtt);
>         if (err)
> -               goto err_pd;
> +               goto err_free;
>
> -       ppgtt->vma = pd_vma_create(ppgtt, GEN6_PD_SIZE);
> -       if (IS_ERR(ppgtt->vma)) {
> -               err = PTR_ERR(ppgtt->vma);
> +       ppgtt->base.pd = gen6_alloc_top_pd(ppgtt);
> +       if (IS_ERR(ppgtt->base.pd)) {
> +               err = PTR_ERR(ppgtt->base.pd);
>                 goto err_scratch;
>         }
>
> @@ -451,10 +470,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
>
>  err_scratch:
>         free_scratch(&ppgtt->base.vm);
> -err_pd:
> -       free_pd(&ppgtt->base.vm, ppgtt->base.pd);
>  err_free:
> -       mutex_destroy(&ppgtt->pin_mutex);
>         kfree(ppgtt);
>         return ERR_PTR(err);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.h b/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
> index ab0eecb086dd..5e5cf2ec3309 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.h
> @@ -19,7 +19,6 @@ struct gen6_ppgtt {
>         u32 pp_dir;
>
>         atomic_t pin_count;
> -       struct mutex pin_mutex;
>
>         bool scan_for_unused_pt;
>  };
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 12256218634f..a8d733a7e1d9 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1933,6 +1933,10 @@ int i915_gem_evict_vm(struct i915_address_space *vm);
>  struct drm_i915_gem_object *
>  i915_gem_object_create_internal(struct drm_i915_private *dev_priv,
>                                 phys_addr_t size);
> +struct drm_i915_gem_object *
> +__i915_gem_object_create_internal(struct drm_i915_private *dev_priv,
> +                                 const struct drm_i915_gem_object_ops *ops,
> +                                 phys_addr_t size);
>
>  /* i915_gem_tiling.c */
>  static inline bool i915_gem_object_needs_bit17_swizzle(struct drm_i915_gem_object *obj)
> --
> 2.33.0
>
