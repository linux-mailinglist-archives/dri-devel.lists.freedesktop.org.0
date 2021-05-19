Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C6388B37
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 11:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192C96ECFD;
	Wed, 19 May 2021 09:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58F6ECF5;
 Wed, 19 May 2021 09:53:53 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id ez19so6460112qvb.3;
 Wed, 19 May 2021 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nL/o1N/IXpNvWLKlqYDkIQjJPXz9DDB0WYGFkrJogHs=;
 b=Pyk1ry+Efo/wS7dvZpxQngDjwDysKDzkyYRRDWPlEJnqDRzWfD0gEd1LXFOx/tfxdu
 04nEnBm113AhloXzx2dsEBA6kNUIxzKnidnJyPRBFMJ1v6/KtMW4Ivxp8rjs1JQ77mRO
 w57dWj6YI9gPhA/AT5vu9VAPMKJ64qXW1ho3xRknt/UPy6ibm8xfaxOQG7bDxNijn0AF
 eHGdWmJehYm9hgSNOUwTtzSTed0XBt/0xIl7sckpAAqm5NT7Z84N+HucbC52VQm+XvBD
 xbJCEnbYY4NOYsfElvyGv+BCDybNPbUvEw+erlv45nPRHrf5zRA6LH901UnciuD4hVwg
 de9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nL/o1N/IXpNvWLKlqYDkIQjJPXz9DDB0WYGFkrJogHs=;
 b=fPSJAY2l34LrY5ojPVnAZ4FqLdM4HRkMOnhUySD05L6KXo5IVtJKY79rqq2SR7Ssb7
 bw6jQuRmj5qAjEB7zh58WxWkugkYd13Rg/jh8NHCUCU8Jv7r243eR/3Wmkpcb7Vnu8tr
 dmKpt1JhSHSt+yEP1oFcTuV+23u9Sr6AiVN6l9WC1nPxnsSMnpX6gaRhh/8JIYJ0CRRe
 i+tDG3Aq0/UhjPzz635RduP2xgoNHcimJBZPHFRmn/urvNSLZlRw003jXkLFncI0i+p+
 M++LIL5yeFVyqhg3LkVmY/vQjAr/01pVvxzTJ73FKcRbBpMlY03KzRYeP9VeROlKLGrr
 Otng==
X-Gm-Message-State: AOAM5320Y1Kzudp4EyhIPVsZNRWG0nvynI4WG91EN8CQt85zAMLqcKwM
 fjdDDI6RvV7+dNZ1FOSRD2mUrLPFVymNumJulXguyXAJRVfQH8IOTxA=
X-Google-Smtp-Source: ABdhPJzfMP/fJyirDENmQ8Gvqg4ggtKuxC6dAMlbryxjxq49uTpr5qWFb/JaZWls2oa99d7HwYE0SHqUE7NL7P6f3mk=
X-Received: by 2002:ad4:4961:: with SMTP id p1mr11961906qvy.43.1621418032401; 
 Wed, 19 May 2021 02:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-11-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-11-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 19 May 2021 10:53:25 +0100
Message-ID: <CAM0jSHPLdajyqtZBsR1C75aSgBa8wV1FLnQSa+tytAOKr5x11A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 10/15] drm/i915/ttm: Introduce a TTM i915
 gem object backend
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 09:28, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Most logical place to introduce TTM buffer objects is as an i915
> gem object backend. We need to add some ops to account for added
> functionality like delayed delete and LRU list manipulation.
>
> Initially we support only LMEM and SYSTEM memory, but SYSTEM
> (which in this case means evicted LMEM objects) is not
> visible to i915 GEM yet. The plan is to move the i915 gem system region
> over to the TTM system memory type in upcoming patches.
>
> We set up GPU bindings directly both from LMEM and from the system region=
,
> as there is no need to use the legacy TTM_TT memory type. We reserve
> that for future porting of GGTT bindings to TTM.
>
> Remove the old lmem backend.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Break out needed TTM functionality to a separate patch (Reported by
> Christian K=C3=B6nig).
> - Fix an unhandled error (Reported by Matthew Auld and Maarten Lankhorst)
> - Remove a stray leftover sg_table allocation (Reported by Matthew Auld)
> - Use ttm_tt_unpopulate() rather than ttm_tt_destroy() in the purge path
>   as some TTM functionality relies on having a ttm_tt present for !is_iom=
em.
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  84 ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 125 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  18 +
>  drivers/gpu/drm/i915/gem/i915_gem_region.c    |   6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 519 ++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>  drivers/gpu/drm/i915/intel_memory_region.c    |   1 -
>  drivers/gpu/drm/i915/intel_memory_region.h    |   1 -
>  drivers/gpu/drm/i915/intel_region_ttm.c       |   5 +-
>  drivers/gpu/drm/i915/intel_region_ttm.h       |   7 +-
>  15 files changed, 696 insertions(+), 141 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 958ccc1edfed..ef0d884a9e2d 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -155,6 +155,7 @@ gem-y +=3D \
>         gem/i915_gem_stolen.o \
>         gem/i915_gem_throttle.o \
>         gem/i915_gem_tiling.o \
> +       gem/i915_gem_ttm.o \
>         gem/i915_gem_ttm_bo_util.o \
>         gem/i915_gem_userptr.o \
>         gem/i915_gem_wait.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i=
915/gem/i915_gem_lmem.c
> index 3b4aa28a076d..2b8cd15de1d9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -4,74 +4,10 @@
>   */
>
>  #include "intel_memory_region.h"
> -#include "intel_region_ttm.h"
>  #include "gem/i915_gem_region.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "i915_drv.h"
>
> -static void lmem_put_pages(struct drm_i915_gem_object *obj,
> -                          struct sg_table *pages)
> -{
> -       intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
> -       obj->mm.dirty =3D false;
> -       sg_free_table(pages);
> -       kfree(pages);
> -}
> -
> -static int lmem_get_pages(struct drm_i915_gem_object *obj)
> -{
> -       unsigned int flags;
> -       struct sg_table *pages;
> -
> -       flags =3D I915_ALLOC_MIN_PAGE_SIZE;
> -       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
> -               flags |=3D I915_ALLOC_CONTIGUOUS;
> -
> -       obj->mm.st_mm_node =3D intel_region_ttm_node_alloc(obj->mm.region=
,
> -                                                        obj->base.size,
> -                                                        flags);
> -       if (IS_ERR(obj->mm.st_mm_node))
> -               return PTR_ERR(obj->mm.st_mm_node);
> -
> -       /* Range manager is always contigous */
> -       if (obj->mm.region->is_range_manager)
> -               obj->flags |=3D I915_BO_ALLOC_CONTIGUOUS;
> -       pages =3D intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_=
mm_node);
> -       if (IS_ERR(pages)) {
> -               intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_=
node);
> -               return PTR_ERR(pages);
> -       }
> -
> -       __i915_gem_object_set_pages(obj, pages, i915_sg_dma_sizes(pages->=
sgl));
> -
> -       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
> -               void __iomem *vaddr =3D
> -                       i915_gem_object_lmem_io_map(obj, 0, obj->base.siz=
e);
> -
> -               if (!vaddr) {
> -                       struct sg_table *pages =3D
> -                               __i915_gem_object_unset_pages(obj);
> -
> -                       if (!IS_ERR_OR_NULL(pages))
> -                               lmem_put_pages(obj, pages);
> -               }
> -
> -               memset_io(vaddr, 0, obj->base.size);
> -               io_mapping_unmap(vaddr);
> -       }
> -
> -       return 0;
> -}
> -
> -const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops =3D {
> -       .name =3D "i915_gem_object_lmem",
> -       .flags =3D I915_GEM_OBJECT_HAS_IOMEM,
> -
> -       .get_pages =3D lmem_get_pages,
> -       .put_pages =3D lmem_put_pages,
> -       .release =3D i915_gem_object_release_memory_region,
> -};
> -
>  void __iomem *
>  i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
>                             unsigned long n,
> @@ -103,23 +39,3 @@ i915_gem_object_create_lmem(struct drm_i915_private *=
i915,
>         return i915_gem_object_create_region(i915->mm.regions[INTEL_REGIO=
N_LMEM],
>                                              size, flags);
>  }
> -
> -int __i915_gem_lmem_object_init(struct intel_memory_region *mem,
> -                               struct drm_i915_gem_object *obj,
> -                               resource_size_t size,
> -                               unsigned int flags)
> -{
> -       static struct lock_class_key lock_class;
> -       struct drm_i915_private *i915 =3D mem->i915;
> -
> -       drm_gem_private_object_init(&i915->drm, &obj->base, size);
> -       i915_gem_object_init(obj, &i915_gem_lmem_obj_ops, &lock_class, fl=
ags);
> -
> -       obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> -
> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> -
> -       i915_gem_object_init_memory_region(obj, mem);
> -
> -       return 0;
> -}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i=
915/gem/i915_gem_lmem.h
> index fac6bc5a5ebb..ea76fd11ccb0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> @@ -26,9 +26,4 @@ i915_gem_object_create_lmem(struct drm_i915_private *i9=
15,
>                             resource_size_t size,
>                             unsigned int flags);
>
> -int __i915_gem_lmem_object_init(struct intel_memory_region *mem,
> -                               struct drm_i915_gem_object *obj,
> -                               resource_size_t size,
> -                               unsigned int flags);
> -
>  #endif /* !__I915_GEM_LMEM_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index c8953e3f5c70..8580996107ce 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -172,7 +172,7 @@ static void i915_gem_close_object(struct drm_gem_obje=
ct *gem, struct drm_file *f
>         }
>  }
>
> -static void __i915_gem_free_object_rcu(struct rcu_head *head)
> +void __i915_gem_free_object_rcu(struct rcu_head *head)
>  {
>         struct drm_i915_gem_object *obj =3D
>                 container_of(head, typeof(*obj), rcu);
> @@ -208,59 +208,69 @@ static void __i915_gem_object_free_mmaps(struct drm=
_i915_gem_object *obj)
>         }
>  }
>
> -static void __i915_gem_free_objects(struct drm_i915_private *i915,
> -                                   struct llist_node *freed)
> +void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>  {
> -       struct drm_i915_gem_object *obj, *on;
> +       trace_i915_gem_object_destroy(obj);
>
> -       llist_for_each_entry_safe(obj, on, freed, freed) {
> -               trace_i915_gem_object_destroy(obj);
> +       if (!list_empty(&obj->vma.list)) {
> +               struct i915_vma *vma;
> +
> +               /*
> +                * Note that the vma keeps an object reference while
> +                * it is active, so it *should* not sleep while we
> +                * destroy it. Our debug code errs insits it *might*.
> +                * For the moment, play along.
> +                */
> +               spin_lock(&obj->vma.lock);
> +               while ((vma =3D list_first_entry_or_null(&obj->vma.list,
> +                                                      struct i915_vma,
> +                                                      obj_link))) {
> +                       GEM_BUG_ON(vma->obj !=3D obj);
> +                       spin_unlock(&obj->vma.lock);
>
> -               if (!list_empty(&obj->vma.list)) {
> -                       struct i915_vma *vma;
> +                       __i915_vma_put(vma);
>
> -                       /*
> -                        * Note that the vma keeps an object reference wh=
ile
> -                        * it is active, so it *should* not sleep while w=
e
> -                        * destroy it. Our debug code errs insits it *mig=
ht*.
> -                        * For the moment, play along.
> -                        */
>                         spin_lock(&obj->vma.lock);
> -                       while ((vma =3D list_first_entry_or_null(&obj->vm=
a.list,
> -                                                              struct i91=
5_vma,
> -                                                              obj_link))=
) {
> -                               GEM_BUG_ON(vma->obj !=3D obj);
> -                               spin_unlock(&obj->vma.lock);
> +               }
> +               spin_unlock(&obj->vma.lock);
> +       }
>
> -                               __i915_vma_put(vma);
> +       __i915_gem_object_free_mmaps(obj);
>
> -                               spin_lock(&obj->vma.lock);
> -                       }
> -                       spin_unlock(&obj->vma.lock);
> -               }
> +       GEM_BUG_ON(!list_empty(&obj->lut_list));
>
> -               __i915_gem_object_free_mmaps(obj);
> +       atomic_set(&obj->mm.pages_pin_count, 0);
> +       __i915_gem_object_put_pages(obj);
> +       GEM_BUG_ON(i915_gem_object_has_pages(obj));
> +       bitmap_free(obj->bit_17);
>
> -               GEM_BUG_ON(!list_empty(&obj->lut_list));
> +       if (obj->base.import_attach)
> +               drm_prime_gem_destroy(&obj->base, NULL);
>
> -               atomic_set(&obj->mm.pages_pin_count, 0);
> -               __i915_gem_object_put_pages(obj);
> -               GEM_BUG_ON(i915_gem_object_has_pages(obj));
> -               bitmap_free(obj->bit_17);
> +       drm_gem_free_mmap_offset(&obj->base);
>
> -               if (obj->base.import_attach)
> -                       drm_prime_gem_destroy(&obj->base, NULL);
> +       if (obj->ops->release)
> +               obj->ops->release(obj);
>
> -               drm_gem_free_mmap_offset(&obj->base);
> +       if (obj->mm.n_placements > 1)
> +               kfree(obj->mm.placements);
>
> -               if (obj->ops->release)
> -                       obj->ops->release(obj);
> +       if (obj->resv_shared_from)
> +               i915_vm_resv_put(obj->resv_shared_from);
> +}
>
> -               if (obj->mm.n_placements > 1)
> -                       kfree(obj->mm.placements);
> +static void __i915_gem_free_objects(struct drm_i915_private *i915,
> +                                   struct llist_node *freed)
> +{
> +       struct drm_i915_gem_object *obj, *on;
>
> -               if (obj->resv_shared_from)
> -                       i915_vm_resv_put(obj->resv_shared_from);
> +       llist_for_each_entry_safe(obj, on, freed, freed) {
> +               might_sleep();
> +               if (obj->ops->delayed_free) {
> +                       obj->ops->delayed_free(obj);
> +                       continue;
> +               }
> +               __i915_gem_free_object(obj);
>
>                 /* But keep the pointer alive for RCU-protected lookups *=
/
>                 call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> @@ -318,6 +328,7 @@ static void i915_gem_free_object(struct drm_gem_objec=
t *gem_obj)
>          * worker and performing frees directly from subsequent allocatio=
ns for
>          * crude but effective memory throttling.
>          */
> +
>         if (llist_add(&obj->freed, &i915->mm.free_list))
>                 queue_work(i915->wq, &i915->mm.free_work);
>  }
> @@ -410,6 +421,42 @@ int i915_gem_object_read_from_page(struct drm_i915_g=
em_object *obj, u64 offset,
>         return 0;
>  }
>
> +/**
> + * i915_gem_object_evictable - Whether object is likely evictable after =
unbind.
> + * @obj: The object to check
> + *
> + * This function checks whether the object is likely unvictable after un=
bind.
> + * If the object is not locked when checking, the result is only advisor=
y.
> + * If the object is locked when checking, and the function returns true,
> + * then an eviction should indeed be possible. But since unlocked vma
> + * unpinning and unbinding is currently possible, the object can actuall=
y
> + * become evictable even if this function returns false.
> + *
> + * Return: true if the object may be evictable. False otherwise.
> + */
> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj)
> +{
> +       struct i915_vma *vma;
> +       int pin_count =3D atomic_read(&obj->mm.pages_pin_count);
> +
> +       if (!pin_count)
> +               return true;
> +
> +       spin_lock(&obj->vma.lock);
> +       list_for_each_entry(vma, &obj->vma.list, obj_link) {
> +               if (i915_vma_is_pinned(vma)) {
> +                       spin_unlock(&obj->vma.lock);
> +                       return false;
> +               }
> +               if (atomic_read(&vma->pages_count))
> +                       pin_count--;

Can't pages_count be > 1, which would also be reflected in
pages_pin_count? The vma_pin path looks very complex.

> +       }
> +       spin_unlock(&obj->vma.lock);
> +       GEM_WARN_ON(pin_count < 0);
> +
> +       return pin_count =3D=3D 0;
> +}
> +
>  void i915_gem_init__objects(struct drm_i915_private *i915)
>  {
>         INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 2ebd79537aea..ae5930e307d5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -200,6 +200,9 @@ static inline bool i915_gem_object_trylock(struct drm=
_i915_gem_object *obj)
>
>  static inline void i915_gem_object_unlock(struct drm_i915_gem_object *ob=
j)
>  {
> +       if (obj->ops->adjust_lru)
> +               obj->ops->adjust_lru(obj);

Interesting, so we bump the lru even when we just drop the lock?

> +
>         dma_resv_unlock(obj->base.resv);
>  }
>
> @@ -587,6 +590,12 @@ int i915_gem_object_read_from_page(struct drm_i915_g=
em_object *obj, u64 offset,
>
>  bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
>
> +void __i915_gem_free_object_rcu(struct rcu_head *head);
> +
> +void __i915_gem_free_object(struct drm_i915_gem_object *obj);
> +
> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
> +
>  #ifdef CONFIG_MMU_NOTIFIER
>  static inline bool
>  i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index 98f69d8fd37d..b350765e1935 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -63,6 +63,20 @@ struct drm_i915_gem_object_ops {
>                       const struct drm_i915_gem_pwrite *arg);
>
>         int (*dmabuf_export)(struct drm_i915_gem_object *obj);
> +
> +       /**
> +        * adjust_lru - notify that the madvise value was updated
> +        * @obj: The gem object
> +        *
> +        * The madvise value may have been updated, or object was recentl=
y
> +        * referenced so act accordingly (Perhaps changing an LRU list et=
c).
> +        */
> +       void (*adjust_lru)(struct drm_i915_gem_object *obj);
> +
> +       /**
> +        * delayed_free - Override the default delayed free implementatio=
n
> +        */
> +       void (*delayed_free)(struct drm_i915_gem_object *obj);
>         void (*release)(struct drm_i915_gem_object *obj);
>
>         const char *name; /* friendly name for debug, e.g. lockdep classe=
s */
> @@ -307,6 +321,10 @@ struct drm_i915_gem_object {
>                 bool dirty:1;
>         } mm;
>
> +       struct {
> +               struct sg_table *cached_io_st;
> +       } ttm;
> +
>         /** Record of address bit 17 of each page at last unbind. */
>         unsigned long *bit_17;
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm=
/i915/gem/i915_gem_region.c
> index f25e6646c5b7..d1f1840540dd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -18,11 +18,7 @@ void i915_gem_object_init_memory_region(struct drm_i91=
5_gem_object *obj,
>
>         mutex_lock(&mem->objects.lock);
>
> -       if (obj->flags & I915_BO_ALLOC_VOLATILE)
> -               list_add(&obj->mm.region_link, &mem->objects.purgeable);
> -       else
> -               list_add(&obj->mm.region_link, &mem->objects.list);
> -
> +       list_add(&obj->mm.region_link, &mem->objects.list);
>         mutex_unlock(&mem->objects.lock);
>  }
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> new file mode 100644
> index 000000000000..790f5ec45c4d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2021 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "i915_drv.h"
> +#include "intel_memory_region.h"
> +#include "intel_region_ttm.h"
> +
> +#include "gem/i915_gem_object.h"
> +#include "gem/i915_gem_region.h"
> +#include "gem/i915_gem_ttm.h"
> +#include "gem/i915_gem_ttm_bo_util.h"
> +
> +#define I915_PL_LMEM0 TTM_PL_PRIV
> +#define I915_PL_SYSTEM TTM_PL_SYSTEM
> +#define I915_PL_STOLEN TTM_PL_VRAM
> +#define I915_PL_GGTT TTM_PL_TT
> +
> +#define I915_TTM_PRIO_PURGE     0
> +#define I915_TTM_PRIO_NO_PAGES  1
> +#define I915_TTM_PRIO_HAS_PAGES 2
> +
> +/**
> + * struct i915_ttm_tt - TTM page vector with additional private informat=
ion
> + * @ttm: The base TTM page vector.
> + * @dev: The struct device used for dma mapping and unmapping.
> + * @cached_st: The cached scatter-gather table.
> + *
> + * Note that DMA may be going on right up to the point where the page-
> + * vector is unpopulated in delayed destroy. Hence keep the
> + * scatter-gather table mapped and cached up to that point. This is
> + * different from the cached gem object io scatter-gather table which
> + * doesn't have an associated dma mapping.
> + */
> +struct i915_ttm_tt {

What is the _tt here btw? Translation table? We also have use_tt
elsewhere. ttm_tt looks like it just holds an array of pages, and
associated data? ttm_pv?

> +       struct ttm_tt ttm;
> +       struct device *dev;
> +       struct sg_table *cached_st;
> +};
> +
> +static const struct ttm_place lmem0_sys_placement_flags[] =3D {
> +       {
> +               .fpfn =3D 0,
> +               .lpfn =3D 0,
> +               .mem_type =3D I915_PL_LMEM0,
> +               .flags =3D 0,
> +       }, {
> +               .fpfn =3D 0,
> +               .lpfn =3D 0,
> +               .mem_type =3D I915_PL_SYSTEM,
> +               .flags =3D 0,
> +       }
> +};
> +
> +struct ttm_placement i915_lmem0_placement =3D {
> +       .num_placement =3D 1,
> +       .placement =3D &lmem0_sys_placement_flags[0],
> +       .num_busy_placement =3D 1,
> +       .busy_placement =3D &lmem0_sys_placement_flags[0],
> +};
> +
> +struct ttm_placement i915_lmem0_sys_placement =3D {
> +       .num_placement =3D 1,
> +       .placement =3D &lmem0_sys_placement_flags[0],
> +       .num_busy_placement =3D 2,
> +       .busy_placement =3D &lmem0_sys_placement_flags[0],
> +};
> +
> +struct ttm_placement i915_sys_placement =3D {
> +       .num_placement =3D 1,
> +       .placement =3D &lmem0_sys_placement_flags[1],
> +       .num_busy_placement =3D 1,
> +       .busy_placement =3D &lmem0_sys_placement_flags[1],
> +};
> +
> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
> +
> +static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> +                                        uint32_t page_flags)
> +{
> +       struct ttm_resource_manager *man =3D
> +               ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +       struct i915_ttm_tt *i915_tt;
> +       int ret;
> +
> +       i915_tt =3D kzalloc(sizeof(*i915_tt), GFP_KERNEL);
> +       if (!i915_tt)
> +               return NULL;
> +
> +       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
> +           man->use_tt)
> +               page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> +
> +       ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_cached);
> +       if (ret) {
> +               kfree(i915_tt);
> +               return NULL;
> +       }
> +
> +       i915_tt->dev =3D obj->base.dev->dev;
> +
> +       return &i915_tt->ttm;
> +}
> +
> +static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_t=
t *ttm)
> +{
> +       struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
> +
> +       if (i915_tt->cached_st) {
> +               dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
> +                                 DMA_BIDIRECTIONAL, 0);
> +               sg_free_table(i915_tt->cached_st);
> +               kfree(i915_tt->cached_st);
> +               i915_tt->cached_st =3D NULL;
> +       }
> +       ttm_pool_free(&bdev->pool, ttm);
> +}
> +
> +static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *=
ttm)
> +{
> +       struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
> +
> +       ttm_tt_destroy_common(bdev, ttm);
> +       kfree(i915_tt);
> +}
> +
> +static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
> +                                      const struct ttm_place *place)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +
> +       /* Will do for now. Our pinned objects are still on TTM's LRU lis=
ts */
> +       if (!i915_gem_object_evictable(obj))
> +               return false;
> +
> +       /* This isn't valid with a buddy allocator */
> +       return ttm_bo_eviction_valuable(bo, place);
> +}
> +
> +static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
> +                                struct ttm_placement *placement)
> +{
> +       *placement =3D i915_sys_placement;

What's the story here?

> +}
> +
> +static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +       int ret;
> +
> +       ret =3D i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE=
);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D __i915_gem_object_put_pages(obj);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
> +{
> +       if (obj->ttm.cached_io_st) {
> +               sg_free_table(obj->ttm.cached_io_st);
> +               kfree(obj->ttm.cached_io_st);
> +               obj->ttm.cached_io_st =3D NULL;
> +       }
> +}
> +
> +static void i915_ttm_purge(struct drm_i915_gem_object *obj)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +
> +       if (obj->mm.madv =3D=3D __I915_MADV_PURGED)
> +               return;
> +
> +       i915_ttm_free_cached_io_st(obj);
> +
> +       ttm_resource_free(bo, &bo->mem);
> +       if (bo->ttm) {
> +               ttm_tt_unpopulate(bo->bdev, bo->ttm);
> +               bo->ttm->page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> +       }
> +
> +       obj->mm.madv =3D __I915_MADV_PURGED;
> +}
> +
> +static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +       int ret =3D i915_ttm_move_notify(bo);
> +
> +       GEM_WARN_ON(ret);
> +       GEM_WARN_ON(obj->ttm.cached_io_st);
> +       if (!ret && obj->mm.madv !=3D I915_MADV_WILLNEED)
> +               i915_ttm_purge(obj);
> +}
> +
> +static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +
> +       if (likely(obj)) {
> +               /* This releases all gem object bindings to the backend. =
*/
> +               __i915_gem_free_object(obj);
> +       }
> +}
> +
> +static struct intel_memory_region *
> +i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
> +{
> +       struct drm_i915_private *i915 =3D container_of(bdev, typeof(*i915=
), bdev);
> +
> +       /* There's some room for optimization here... */
> +       GEM_BUG_ON(ttm_mem_type !=3D I915_PL_SYSTEM &&
> +                  ttm_mem_type < I915_PL_LMEM0);
> +       if (ttm_mem_type =3D=3D I915_PL_SYSTEM)
> +               return intel_memory_region_lookup(i915, INTEL_MEMORY_SYST=
EM,
> +                                                 0);

So at the moment we just have lmem using the new ttm backend, right?
Stolen and system are unchanged?

> +
> +       return intel_memory_region_lookup(i915, INTEL_MEMORY_LOCAL,
> +                                         ttm_mem_type - I915_PL_LMEM0);
> +}
> +
> +static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
> +{
> +       struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
> +       struct scatterlist *sg;
> +       struct sg_table *st;
> +       int ret;
> +
> +       if (i915_tt->cached_st)
> +               return i915_tt->cached_st;
> +
> +       st =3D kzalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               return ERR_PTR(-ENOMEM);
> +
> +       sg =3D __sg_alloc_table_from_pages
> +               (st, ttm->pages, ttm->num_pages, 0,
> +                (unsigned long)ttm->num_pages << PAGE_SHIFT,
> +                i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
> +       if (IS_ERR(sg)) {
> +               kfree(st);
> +               return ERR_CAST(sg);
> +       }
> +
> +       ret =3D dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
> +       if (ret) {
> +               sg_free_table(st);
> +               kfree(st);
> +               return ERR_PTR(ret);
> +       }
> +
> +       i915_tt->cached_st =3D st;
> +       return st;
> +}
> +
> +static struct sg_table *
> +i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
> +                        struct ttm_resource *res)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +       struct ttm_resource_manager *man =3D
> +               ttm_manager_type(bo->bdev, res->mem_type);
> +
> +       if (man->use_tt)
> +               return i915_ttm_tt_get_st(bo->ttm);
> +
> +       return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
> +}
> +
> +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> +                        struct ttm_operation_ctx *ctx,
> +                        struct ttm_resource *new_mem,
> +                        struct ttm_place *hop)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +       struct ttm_resource_manager *new_man =3D
> +               ttm_manager_type(bo->bdev, new_mem->mem_type);
> +       struct ttm_resource_manager *old_man =3D
> +               ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +       struct intel_memory_region *new_reg, *old_reg;
> +       union {
> +               struct i915_ttm_kmap_iter_tt tt;
> +               struct i915_ttm_kmap_iter_iomap io;
> +       } _new_iter, _old_iter;
> +       struct i915_ttm_kmap_iter *new_iter, *old_iter;
> +       struct sg_table *new_st;
> +       int ret;
> +
> +       new_reg =3D i915_ttm_region(bo->bdev, new_mem->mem_type);
> +       old_reg =3D i915_ttm_region(bo->bdev, bo->mem.mem_type);
> +       GEM_BUG_ON(!new_reg || !old_reg);
> +
> +       /* Sync for now. We could do the actual copy async. */
> +       ret =3D ttm_bo_wait_ctx(bo, ctx);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D i915_ttm_move_notify(bo);
> +       if (ret)
> +               return ret;
> +
> +       if (obj->mm.madv !=3D I915_MADV_WILLNEED) {
> +               i915_ttm_purge(obj);
> +               ttm_resource_free(bo, new_mem);
> +               return 0;
> +       }
> +
> +       /* Populate ttm with pages if needed. Typically system memory. */
> +       if (new_man->use_tt && bo->ttm) {
> +               ret =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       new_st =3D i915_ttm_resource_get_st(obj, new_mem);
> +       if (IS_ERR(new_st))
> +               return PTR_ERR(new_st);
> +
> +       new_iter =3D new_man->use_tt ?
> +               i915_ttm_kmap_iter_tt_init(&_new_iter.tt, bo->ttm) :
> +               i915_ttm_kmap_iter_iomap_init(&_new_iter.io, &new_reg->io=
map,
> +                                             new_st, new_reg->region.sta=
rt);
> +
> +       old_iter =3D old_man->use_tt ?
> +               i915_ttm_kmap_iter_tt_init(&_old_iter.tt, bo->ttm) :
> +               i915_ttm_kmap_iter_iomap_init(&_old_iter.io, &old_reg->io=
map,
> +                                             obj->ttm.cached_io_st,
> +                                             old_reg->region.start);
> +
> +       i915_ttm_move_memcpy(bo, new_mem, new_iter, old_iter);
> +       i915_ttm_free_cached_io_st(obj);
> +
> +       if (!new_man->use_tt)
> +               obj->ttm.cached_io_st =3D new_st;
> +
> +       return 0;
> +}
> +
> +struct ttm_device_funcs i915_ttm_bo_driver =3D {
> +       .ttm_tt_create =3D i915_ttm_tt_create,
> +       .ttm_tt_unpopulate =3D i915_ttm_tt_unpopulate,
> +       .ttm_tt_destroy =3D i915_ttm_tt_destroy,
> +       .eviction_valuable =3D i915_ttm_eviction_valuable,
> +       .evict_flags =3D i915_ttm_evict_flags,
> +       .move =3D i915_ttm_move,
> +       .verify_access =3D NULL,
> +       .swap_notify =3D i915_ttm_swap_notify,
> +       .delete_mem_notify =3D i915_ttm_delete_mem_notify,
> +};
> +
> +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +       struct ttm_operation_ctx ctx =3D {
> +               .interruptible =3D true,
> +               .no_wait_gpu =3D false,
> +       };
> +       struct sg_table *st;
> +       int ret;
> +
> +       /* Swap in. */
> +       if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> +               ret =3D ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Move to the requested placement. */
> +       ret =3D ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
> +       if (ret)
> +               return ret =3D=3D -ENOSPC ? -ENXIO : ret;
> +
> +       /* Object either has a page vector or is an iomem object */
> +       st =3D bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io=
_st;
> +       if (IS_ERR(st))
> +               return PTR_ERR(st);
> +
> +       __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
> +
> +       i915_ttm_adjust_lru(obj);
> +
> +       return ret;
> +}
> +
> +static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
> +                              struct sg_table *st)
> +{
> +       /*
> +        * We're currently not called from a shrinker, so put_pages()
> +        * typically means the object is about to destroyed, or called
> +        * from move_notify(). So just avoid doing much for now.
> +        * If the object is not destroyed next, The TTM eviction logic
> +        * and shrinkers will move it out if needed.
> +        */
> +
> +       i915_ttm_adjust_lru(obj);
> +}
> +
> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +
> +       /*
> +        * Don't manipulate the TTM LRUs while in TTM bo destruction.
> +        * We're called through i915_ttm_delete_mem_notify().
> +        */
> +       if (!kref_read(&bo->kref))
> +               return;
> +
> +       /*
> +        * Put on the correct LRU list depending on the MADV status
> +        */
> +       spin_lock(&bo->bdev->lru_lock);
> +       if (obj->mm.madv !=3D I915_MADV_WILLNEED) {
> +               bo->priority =3D I915_TTM_PRIO_PURGE;
> +       } else if (!i915_gem_object_has_pages(obj)) {
> +               if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
> +                       bo->priority =3D I915_TTM_PRIO_HAS_PAGES;
> +       } else {
> +               if (bo->priority > I915_TTM_PRIO_NO_PAGES)
> +                       bo->priority =3D I915_TTM_PRIO_NO_PAGES;
> +       }
> +
> +       ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +       spin_unlock(&bo->bdev->lru_lock);
> +}
> +
> +/*
> + * TTM-backed gem object destruction requires some clarification.
> + * Basically we have two possibilities here. We can either rely on the
> + * i915 delayed destruction and put the TTM object when the object
> + * is idle. This would be detected by TTM which would bypass the
> + * TTM delayed destroy handling. The other approach is to put the TTM
> + * object early and rely on the TTM destroyed handling, and then free
> + * the leftover parts of the GEM object once TTM's destroyed list handli=
ng is
> + * complete. For now, we rely on the latter for two reasons:
> + * a) TTM can evict an object even when it's on the delayed destroy list=
,
> + * which in theory allows for complete eviction.
> + * b) There is work going on in TTM to allow freeing an object even when
> + * it's not idle, and using the TTM destroyed list handling could help u=
s
> + * benefit from that.
> + */
> +static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
> +{
> +       ttm_bo_put(i915_gem_to_ttm(obj));
> +}
> +
> +static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops =3D {
> +       .name =3D "i915_gem_object_ttm",
> +       .flags =3D I915_GEM_OBJECT_HAS_IOMEM,
> +
> +       .get_pages =3D i915_ttm_get_pages,
> +       .put_pages =3D i915_ttm_put_pages,
> +       .truncate =3D i915_ttm_purge,
> +       .adjust_lru =3D i915_ttm_adjust_lru,
> +       .delayed_free =3D i915_ttm_delayed_free,
> +};
> +
> +void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
> +{
> +       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> +
> +       i915_gem_object_release_memory_region(obj);
> +       call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> +}
> +
> +/**
> + * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
> + * @mem: The initial memory region for the object.
> + * @obj: The gem object.
> + * @size: Object size in bytes.
> + * @flags: gem object flags.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
> +                              struct drm_i915_gem_object *obj,
> +                              resource_size_t size,
> +                              unsigned int flags)
> +{
> +       static struct lock_class_key lock_class;
> +       struct drm_i915_private *i915 =3D mem->i915;
> +       size_t alignment =3D 0;
> +       int ret;
> +
> +       /* Adjust alignment to GPU- and CPU huge page sizes. */
> +
> +       if (mem->is_range_manager) {
> +               if (size >=3D SZ_1G)
> +                       alignment =3D SZ_1G >> PAGE_SHIFT;
> +               else if (size >=3D SZ_2M)
> +                       alignment =3D SZ_2M >> PAGE_SHIFT;
> +               else if (size >=3D SZ_64K)
> +                       alignment =3D SZ_64K >> PAGE_SHIFT;
> +       }
> +
> +       drm_gem_private_object_init(&i915->drm, &obj->base, size);
> +       i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, fla=
gs);
> +       i915_gem_object_init_memory_region(obj, mem);
> +       i915_gem_object_make_unshrinkable(obj);
> +       obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> +       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
> +       ret =3D ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> +                         ttm_bo_type_kernel, &i915_sys_placement, alignm=
ent,
> +                         true, NULL, NULL, i915_ttm_bo_destroy);

Move this further up, or add some onion?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
