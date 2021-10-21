Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912CF436752
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059AD6ECC0;
	Thu, 21 Oct 2021 16:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467BB6ECBF;
 Thu, 21 Oct 2021 16:09:44 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y11so897965qtn.13;
 Thu, 21 Oct 2021 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NZ0L+FbYY5uFBGkgBkl6NPiS0hNSFM2L2tzSgtT6qM=;
 b=XQE5jjfpfwPWs4CqmFEJ1dswQl1oiad+LN/bFfwmyMWAB+YFk0xiO/34Q+9BkpLDRe
 i9eRvMa/cYJCJmuF+dtj6dBEan4O+HhDSEp+CWpVW393GdChRKz+nqStpj2caRbFO+9O
 cp+WazJWV6uzTNuWeb96hXtHKOWNTKzWn8IzUUao0N0e6GBx0Mgecaq9DdpOygbrPPRu
 GkZGXef7jMo2bAFmUzt0kbla5jV/q1vpShV3uJ08JN4AG1REMqjX5Tl3BUvFqPGKXqGT
 N1/o7I+Ms3qlDysrji/r1SUIlgkUGJSRTT8xTuq6GYBIwKCgBwwa7F5Sfr1NhqGfOm8I
 hDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NZ0L+FbYY5uFBGkgBkl6NPiS0hNSFM2L2tzSgtT6qM=;
 b=dpsqXKY8uc250XYnF8lMb3LsAi6/IeCYiB6KAE+BRzf1UaRQppNaEhTZnWv68IE/+o
 n6C7Q+4ns0RGiTBbKDP5RkTIa9UM+8okbXW6vRzC+c4Pvwv+woakuCTYVuigyfGpzI5Y
 vDocVsmePsw8JYSnBRVoUQABpRobSDl930v2PMy1TE6I8fxebGDI3poi5JdI55KNPFKg
 Y7iP/rH/VbEot8uNvurJz25fXDf0J2V/Wm8lYsuADxeopi6EIVl2w526kF8P5JsDvdYD
 tZVeHlRrt6qAktps7jhLBQXezYHp8AJ+kRh9eL2CyJHsVZu2mnwQBv2jlmrchDg7PswH
 YYWw==
X-Gm-Message-State: AOAM533VqlUIhTVQiIlzKkTVPVvaf8gGkdal9jX6i9ssrAE3K3r4gQ6d
 k8vLG6wl/nKd4awCktKq1vtT7bbz2Vf6rgNQyG4itPEiKEOTRg==
X-Google-Smtp-Source: ABdhPJytASn1uTxbA1VSBP1hvifvVAu6fdZboN60L6QvmCdDvJ7lFDlCIe/Lpia+XUWYpGzHrUlheLV/BvG0JCg+OCY=
X-Received: by 2002:a05:622a:1998:: with SMTP id
 u24mr7042445qtc.156.1634832583231; 
 Thu, 21 Oct 2021 09:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-9-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-9-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 17:09:15 +0100
Message-ID: <CAM0jSHM1fk_V+_FYoq8Z-hWfzOqGLe7cBZYZCgw2SsxuR50Y5g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 09/28] drm/i915: vma is always backed by an
 object.
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

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> vma->obj and vma->resv are now never NULL, and some checks can be removed.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context.c       |  2 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 48 ++++++++-----------
>  drivers/gpu/drm/i915/i915_vma.h               |  3 --
>  4 files changed, 22 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc..e0220ac0e9b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -219,7 +219,7 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>          */
>
>         err = i915_gem_object_lock(ce->timeline->hwsp_ggtt->obj, ww);
> -       if (!err && ce->ring->vma->obj)
> +       if (!err)
>                 err = i915_gem_object_lock(ce->ring->vma->obj, ww);
>         if (!err && ce->state)
>                 err = i915_gem_object_lock(ce->state->obj, ww);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 586dca1731ce..3e6fac0340ef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -1357,7 +1357,7 @@ int intel_ring_submission_setup(struct intel_engine_cs *engine)
>         err = i915_gem_object_lock(timeline->hwsp_ggtt->obj, &ww);
>         if (!err && gen7_wa_vma)
>                 err = i915_gem_object_lock(gen7_wa_vma->obj, &ww);
> -       if (!err && engine->legacy.ring->vma->obj)
> +       if (!err)
>                 err = i915_gem_object_lock(engine->legacy.ring->vma->obj, &ww);
>         if (!err)
>                 err = intel_timeline_pin(timeline, &ww);
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 1187f1956c20..aebfc232b58b 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -40,12 +40,12 @@
>
>  static struct kmem_cache *slab_vmas;
>
> -struct i915_vma *i915_vma_alloc(void)
> +static struct i915_vma *i915_vma_alloc(void)
>  {
>         return kmem_cache_zalloc(slab_vmas, GFP_KERNEL);
>  }
>
> -void i915_vma_free(struct i915_vma *vma)
> +static void i915_vma_free(struct i915_vma *vma)
>  {

I assume this belongs in the previous patch?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>         return kmem_cache_free(slab_vmas, vma);
>  }
> @@ -426,10 +426,8 @@ int i915_vma_bind(struct i915_vma *vma,
>
>                 work->base.dma.error = 0; /* enable the queue_work() */
>
> -               if (vma->obj) {
> -                       __i915_gem_object_pin_pages(vma->obj);
> -                       work->pinned = i915_gem_object_get(vma->obj);
> -               }
> +               __i915_gem_object_pin_pages(vma->obj);
> +               work->pinned = i915_gem_object_get(vma->obj);
>         } else {
>                 vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
>         }
> @@ -670,7 +668,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>         }
>
>         color = 0;
> -       if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
> +       if (i915_vm_has_cache_coloring(vma->vm))
>                 color = vma->obj->cache_level;
>
>         if (flags & PIN_OFFSET_FIXED) {
> @@ -795,17 +793,14 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
>  static int vma_get_pages(struct i915_vma *vma)
>  {
>         int err = 0;
> -       bool pinned_pages = false;
> +       bool pinned_pages = true;
>
>         if (atomic_add_unless(&vma->pages_count, 1, 0))
>                 return 0;
>
> -       if (vma->obj) {
> -               err = i915_gem_object_pin_pages(vma->obj);
> -               if (err)
> -                       return err;
> -               pinned_pages = true;
> -       }
> +       err = i915_gem_object_pin_pages(vma->obj);
> +       if (err)
> +               return err;
>
>         /* Allocations ahoy! */
>         if (mutex_lock_interruptible(&vma->pages_mutex)) {
> @@ -838,8 +833,8 @@ static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
>         if (atomic_sub_return(count, &vma->pages_count) == 0) {
>                 vma->ops->clear_pages(vma);
>                 GEM_BUG_ON(vma->pages);
> -               if (vma->obj)
> -                       i915_gem_object_unpin_pages(vma->obj);
> +
> +               i915_gem_object_unpin_pages(vma->obj);
>         }
>         mutex_unlock(&vma->pages_mutex);
>  }
> @@ -875,7 +870,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>         int err;
>
>  #ifdef CONFIG_PROVE_LOCKING
> -       if (debug_locks && !WARN_ON(!ww) && vma->resv)
> +       if (debug_locks && !WARN_ON(!ww))
>                 assert_vma_held(vma);
>  #endif
>
> @@ -983,7 +978,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>
>         GEM_BUG_ON(!vma->pages);
>         err = i915_vma_bind(vma,
> -                           vma->obj ? vma->obj->cache_level : 0,
> +                           vma->obj->cache_level,
>                             flags, work);
>         if (err)
>                 goto err_remove;
> @@ -1037,7 +1032,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>         GEM_BUG_ON(!i915_vma_is_ggtt(vma));
>
>  #ifdef CONFIG_LOCKDEP
> -       WARN_ON(!ww && vma->resv && dma_resv_held(vma->resv));
> +       WARN_ON(!ww && dma_resv_held(vma->resv));
>  #endif
>
>         do {
> @@ -1116,6 +1111,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>  void i915_vma_release(struct kref *ref)
>  {
>         struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
> +       struct drm_i915_gem_object *obj = vma->obj;
>
>         if (drm_mm_node_allocated(&vma->node)) {
>                 mutex_lock(&vma->vm->mutex);
> @@ -1126,15 +1122,11 @@ void i915_vma_release(struct kref *ref)
>         }
>         GEM_BUG_ON(i915_vma_is_active(vma));
>
> -       if (vma->obj) {
> -               struct drm_i915_gem_object *obj = vma->obj;
> -
> -               spin_lock(&obj->vma.lock);
> -               list_del(&vma->obj_link);
> -               if (!RB_EMPTY_NODE(&vma->obj_node))
> -                       rb_erase(&vma->obj_node, &obj->vma.tree);
> -               spin_unlock(&obj->vma.lock);
> -       }
> +       spin_lock(&obj->vma.lock);
> +       list_del(&vma->obj_link);
> +       if (!RB_EMPTY_NODE(&vma->obj_node))
> +               rb_erase(&vma->obj_node, &obj->vma.tree);
> +       spin_unlock(&obj->vma.lock);
>
>         __i915_vma_remove_closed(vma);
>         i915_vm_put(vma->vm);
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index b882fd7b5f99..423e0df81c87 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -416,9 +416,6 @@ static inline void i915_vma_clear_scanout(struct i915_vma *vma)
>         list_for_each_entry(V, &(OBJ)->vma.list, obj_link)              \
>                 for_each_until(!i915_vma_is_ggtt(V))
>
> -struct i915_vma *i915_vma_alloc(void);
> -void i915_vma_free(struct i915_vma *vma);
> -
>  struct i915_vma *i915_vma_make_unshrinkable(struct i915_vma *vma);
>  void i915_vma_make_shrinkable(struct i915_vma *vma);
>  void i915_vma_make_purgeable(struct i915_vma *vma);
> --
> 2.33.0
>
