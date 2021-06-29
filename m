Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6FA3B777D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 19:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B6489F71;
	Tue, 29 Jun 2021 17:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AD589EB1;
 Tue, 29 Jun 2021 17:58:18 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 65so14465058qko.5;
 Tue, 29 Jun 2021 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5W0aUBusSXiJW+VtZWeoI/G+aodBLgIveOLZc0zYUo=;
 b=kDVLjVkQ1mArJMyLrtOtAC3dboLdefFgPr0jJnNMKOL7m8by7von4B0h7LIuLC16sX
 9cgSOuwYToEYxIM7pYgEIjxfsE4P4ZzNLsQhAQ5pAoQQyDEH0fsjQn41KS3bxGBBQDp6
 2cbBV9mZdylTZNADbbKQacUEQITKQAFxMaFGZD/B/sdwRjAOiLZrIugJg2A5zDRRyfan
 sHru34ss7l6GhoR5y7zpZXIRLkV9RvpdOPTmuwV1kzaUMhJZKSgEJVPYi0eT37WHekaZ
 9QQm8HDR1EWL+owjrbeuMdItuTCLsM8ZJz6nB+BAFGJZadAxCmtm/uBeKmGyvGlH2yjB
 Qx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5W0aUBusSXiJW+VtZWeoI/G+aodBLgIveOLZc0zYUo=;
 b=VNcmAv8Un+7TQAa3gATIrPksAGQ9rjnqVuNMwXESagwp1SB/Ikvivk0IsLZgKy9UIa
 VPpzC0tIbXeLsgJ0g8rH8neu3NKnDExFl9X6G6wT1LJLgdgTMx3CyXyHjTipBulipoJq
 nVaN8V1/oWFu9ga7HKVyHQVHH63v44k6M+6Cnp4etc/cgpDQsRr58PdpkmKhv21q5se9
 wEp7pat65JzSgwGMrG4fjTgPOE/Pxk9tYikcrzB/ZcyNJaUDX8gZ9TUZZ4B0eGmwz0eV
 mBw1TQpR1BAuNz5i/H7PS5bIShCifamLLDutoqLEAyPbRqUE90v/nq4H6WqdBzN1t2/v
 unCQ==
X-Gm-Message-State: AOAM533nMZJ9QkoDjfk9v34JWmzqdDB0WxxSc1pUm9At+jnbekLxLbOL
 wkMgKO8pwoUN8YtKctj3duWi84w//JBVHUTD9uA=
X-Google-Smtp-Source: ABdhPJwzO9j1vVp0U+ZflrGwGBTvfA+L1ySMRRztnTsYh44G+qwD7wP42v4DUl/Wf5tqm0gTsWcey5KqktbyNEISR9Y=
X-Received: by 2002:a37:4388:: with SMTP id
 q130mr31362378qka.460.1624989497213; 
 Tue, 29 Jun 2021 10:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210629151203.209465-1-thomas.hellstrom@linux.intel.com>
 <20210629151203.209465-2-thomas.hellstrom@linux.intel.com>
 <YNtBHh0l2Ax8rKxp@phenom.ffwll.local>
In-Reply-To: <YNtBHh0l2Ax8rKxp@phenom.ffwll.local>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 29 Jun 2021 18:57:50 +0100
Message-ID: <CAM0jSHOboLZHLELq9n42Xfmmz=M2WgQ8N7vSUccnAfFES6zHUA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/3] drm/i915/gem: Implement object
 migration
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Jun 2021 at 16:50, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jun 29, 2021 at 05:12:01PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Introduce an interface to migrate objects between regions.
> > This is primarily intended to migrate objects to LMEM for display and
> > to SYSTEM for dma-buf, but might be reused in one form or another for
> > performance-based migration.
> >
> > v2:
> > - Verify that the memory region given as an id really exists.
> >   (Reported by Matthew Auld)
> > - Call i915_gem_object_{init,release}_memory_region() when switching re=
gion
> >   to handle also switching region lists. (Reported by Matthew Auld)
> > v3:
> > - Fix i915_gem_object_can_migrate() to return true if object is already=
 in
> >   the correct region, even if the object ops doesn't have a migrate()
> >   callback.
> > - Update typo in commit message.
> > - Fix kerneldoc of i915_gem_object_wait_migration().
> > v4:
> > - Improve documentation (Suggested by Mattew Auld and Michael Ruhl)
> > - Always assume TTM migration hits a TTM move and unsets the pages thro=
ugh
> >   move_notify. (Reported by Matthew Auld)
> > - Add a dma_fence_might_wait() annotation to
> >   i915_gem_object_wait_migration() (Suggested by Daniel Vetter)
> > v5:
> > - Re-add might_sleep() instead of __dma_fence_might_wait(), Sent
> >   v4 with the wrong version, didn't compile and __dma_fence_might_wait(=
)
> >   is not exported.
> > - Added an R-B.
>
> Bummer, I missed that.
>
> Matt, want to create an exported dma_fence_might_wait() which combines
> __dma_fence_might_wait() with might_sleep()? As a follow-up patch I think
> that'd be nice, we'll have a bunch of places that often don't sleep,
> except when we start to hit resource contention, so this helper might be
> useful.

Sure, I'll take a look.

> -Daniel
>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 112 ++++++++++++++++++
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 ++
> >  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   9 ++
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  77 ++++++++++--
> >  drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  19 +++
> >  5 files changed, 217 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.c
> > index 07e8ff9a8aae..225b77fb4314 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > @@ -513,6 +513,118 @@ bool i915_gem_object_has_iomem(const struct drm_i=
915_gem_object *obj)
> >       return obj->mem_flags & I915_BO_FLAG_IOMEM;
> >  }
> >
> > +/**
> > + * i915_gem_object_can_migrate - Whether an object likely can be migra=
ted
> > + *
> > + * @obj: The object to migrate
> > + * @id: The region intended to migrate to
> > + *
> > + * Check whether the object backend supports migration to the
> > + * given region. Note that pinning may affect the ability to migrate a=
s
> > + * returned by this function.
> > + *
> > + * This function is primarily intended as a helper for checking the
> > + * possibility to migrate objects and might be slightly less permissiv=
e
> > + * than i915_gem_object_migrate() when it comes to objects with the
> > + * I915_BO_ALLOC_USER flag set.
> > + *
> > + * Return: true if migration is possible, false otherwise.
> > + */
> > +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
> > +                              enum intel_region_id id)
> > +{
> > +     struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> > +     unsigned int num_allowed =3D obj->mm.n_placements;
> > +     struct intel_memory_region *mr;
> > +     unsigned int i;
> > +
> > +     GEM_BUG_ON(id >=3D INTEL_REGION_UNKNOWN);
> > +     GEM_BUG_ON(obj->mm.madv !=3D I915_MADV_WILLNEED);
> > +
> > +     mr =3D i915->mm.regions[id];
> > +     if (!mr)
> > +             return false;
> > +
> > +     if (obj->mm.region =3D=3D mr)
> > +             return true;
> > +
> > +     if (!i915_gem_object_evictable(obj))
> > +             return false;
> > +
> > +     if (!obj->ops->migrate)
> > +             return false;
> > +
> > +     if (!(obj->flags & I915_BO_ALLOC_USER))
> > +             return true;
> > +
> > +     if (num_allowed =3D=3D 0)
> > +             return false;
> > +
> > +     for (i =3D 0; i < num_allowed; ++i) {
> > +             if (mr =3D=3D obj->mm.placements[i])
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +/**
> > + * i915_gem_object_migrate - Migrate an object to the desired region i=
d
> > + * @obj: The object to migrate.
> > + * @ww: An optional struct i915_gem_ww_ctx. If NULL, the backend may
> > + * not be successful in evicting other objects to make room for this o=
bject.
> > + * @id: The region id to migrate to.
> > + *
> > + * Attempt to migrate the object to the desired memory region. The
> > + * object backend must support migration and the object may not be
> > + * pinned, (explicitly pinned pages or pinned vmas). The object must
> > + * be locked.
> > + * On successful completion, the object will have pages pointing to
> > + * memory in the new region, but an async migration task may not have
> > + * completed yet, and to accomplish that, i915_gem_object_wait_migrati=
on()
> > + * must be called.
> > + *
> > + * This function is a bit more permissive than i915_gem_object_can_mig=
rate()
> > + * to allow for migrating objects where the caller knows exactly what =
is
> > + * happening. For example within selftests. More specifically this
> > + * function allows migrating I915_BO_ALLOC_USER objects to regions
> > + * that are not in the list of allowable regions.
> > + *
> > + * Note: the @ww parameter is not used yet, but included to make sure
> > + * callers put some effort into obtaining a valid ww ctx if one is
> > + * available.
> > + *
> > + * Return: 0 on success. Negative error code on failure. In particular=
 may
> > + * return -ENXIO on lack of region space, -EDEADLK for deadlock avoida=
nce
> > + * if @ww is set, -EINTR or -ERESTARTSYS if signal pending, and
> > + * -EBUSY if the object is pinned.
> > + */
> > +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
> > +                         struct i915_gem_ww_ctx *ww,
> > +                         enum intel_region_id id)
> > +{
> > +     struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> > +     struct intel_memory_region *mr;
> > +
> > +     GEM_BUG_ON(id >=3D INTEL_REGION_UNKNOWN);
> > +     GEM_BUG_ON(obj->mm.madv !=3D I915_MADV_WILLNEED);
> > +     assert_object_held(obj);
> > +
> > +     mr =3D i915->mm.regions[id];
> > +     GEM_BUG_ON(!mr);
> > +
> > +     if (obj->mm.region =3D=3D mr)
> > +             return 0;
> > +
> > +     if (!i915_gem_object_evictable(obj))
> > +             return -EBUSY;
> > +
> > +     if (!obj->ops->migrate)
> > +             return -EOPNOTSUPP;
> > +
> > +     return obj->ops->migrate(obj, mr);
> > +}
> > +
> >  void i915_gem_init__objects(struct drm_i915_private *i915)
> >  {
> >       INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.h
> > index ea3224a480c4..8cbd7a5334e2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -17,6 +17,8 @@
> >  #include "i915_gem_ww.h"
> >  #include "i915_vma_types.h"
> >
> > +enum intel_region_id;
> > +
> >  /*
> >   * XXX: There is a prevalence of the assumption that we fit the
> >   * object's page count inside a 32bit _signed_ variable. Let's documen=
t
> > @@ -597,6 +599,16 @@ bool i915_gem_object_migratable(struct drm_i915_ge=
m_object *obj);
> >
> >  bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj=
);
> >
> > +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
> > +                         struct i915_gem_ww_ctx *ww,
> > +                         enum intel_region_id id);
> > +
> > +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
> > +                              enum intel_region_id id);
> > +
> > +int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
> > +                                unsigned int flags);
> > +
> >  #ifdef CONFIG_MMU_NOTIFIER
> >  static inline bool
> >  i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers=
/gpu/drm/i915/gem/i915_gem_object_types.h
> > index 441f913c87e6..ef3de2ae9723 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -18,6 +18,7 @@
> >
> >  struct drm_i915_gem_object;
> >  struct intel_fronbuffer;
> > +struct intel_memory_region;
> >
> >  /*
> >   * struct i915_lut_handle tracks the fast lookups from handle to vma u=
sed
> > @@ -77,6 +78,14 @@ struct drm_i915_gem_object_ops {
> >        * delayed_free - Override the default delayed free implementatio=
n
> >        */
> >       void (*delayed_free)(struct drm_i915_gem_object *obj);
> > +
> > +     /**
> > +      * migrate - Migrate object to a different region either for
> > +      * pinning or for as long as the object lock is held.
> > +      */
> > +     int (*migrate)(struct drm_i915_gem_object *obj,
> > +                    struct intel_memory_region *mr);
> > +
> >       void (*release)(struct drm_i915_gem_object *obj);
> >
> >       const struct vm_operations_struct *mmap_ops;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index c39d982c4fa6..521ab740001a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -617,7 +617,8 @@ struct ttm_device_funcs *i915_ttm_driver(void)
> >       return &i915_ttm_bo_driver;
> >  }
> >
> > -static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> > +static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
> > +                             struct ttm_placement *placement)
> >  {
> >       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> >       struct ttm_operation_ctx ctx =3D {
> > @@ -625,19 +626,12 @@ static int i915_ttm_get_pages(struct drm_i915_gem=
_object *obj)
> >               .no_wait_gpu =3D false,
> >       };
> >       struct sg_table *st;
> > -     struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> > -     struct ttm_placement placement;
> >       int real_num_busy;
> >       int ret;
> >
> > -     GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> > -
> > -     /* Move to the requested placement. */
> > -     i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> > -
> >       /* First try only the requested placement. No eviction. */
> > -     real_num_busy =3D fetch_and_zero(&placement.num_busy_placement);
> > -     ret =3D ttm_bo_validate(bo, &placement, &ctx);
> > +     real_num_busy =3D fetch_and_zero(&placement->num_busy_placement);
> > +     ret =3D ttm_bo_validate(bo, placement, &ctx);
> >       if (ret) {
> >               ret =3D i915_ttm_err_to_gem(ret);
> >               /*
> > @@ -652,8 +646,8 @@ static int i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj)
> >                * If the initial attempt fails, allow all accepted place=
ments,
> >                * evicting if necessary.
> >                */
> > -             placement.num_busy_placement =3D real_num_busy;
> > -             ret =3D ttm_bo_validate(bo, &placement, &ctx);
> > +             placement->num_busy_placement =3D real_num_busy;
> > +             ret =3D ttm_bo_validate(bo, placement, &ctx);
> >               if (ret)
> >                       return i915_ttm_err_to_gem(ret);
> >       }
> > @@ -668,6 +662,7 @@ static int i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj)
> >               i915_ttm_adjust_gem_after_move(obj);
> >       }
> >
> > +     GEM_WARN_ON(obj->mm.pages);
> >       /* Object either has a page vector or is an iomem object */
> >       st =3D bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io=
_st;
> >       if (IS_ERR(st))
> > @@ -678,6 +673,63 @@ static int i915_ttm_get_pages(struct drm_i915_gem_=
object *obj)
> >       return ret;
> >  }
> >
> > +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> > +{
> > +     struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> > +     struct ttm_placement placement;
> > +
> > +     GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> > +
> > +     /* Move to the requested placement. */
> > +     i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> > +
> > +     return __i915_ttm_get_pages(obj, &placement);
> > +}
> > +
> > +/**
> > + * DOC: Migration vs eviction
> > + *
> > + * GEM migration may not be the same as TTM migration / eviction. If
> > + * the TTM core decides to evict an object it may be evicted to a
> > + * TTM memory type that is not in the object's allowable GEM regions, =
or
> > + * in fact theoretically to a TTM memory type that doesn't correspond =
to
> > + * a GEM memory region. In that case the object's GEM region is not
> > + * updated, and the data is migrated back to the GEM region at
> > + * get_pages time. TTM may however set up CPU ptes to the object even
> > + * when it is evicted.
> > + * Gem forced migration using the i915_ttm_migrate() op, is allowed ev=
en
> > + * to regions that are not in the object's list of allowable placement=
s.
> > + */
> > +static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
> > +                         struct intel_memory_region *mr)
> > +{
> > +     struct ttm_place requested;
> > +     struct ttm_placement placement;
> > +     int ret;
> > +
> > +     i915_ttm_place_from_region(mr, &requested, obj->flags);
> > +     placement.num_placement =3D 1;
> > +     placement.num_busy_placement =3D 1;
> > +     placement.placement =3D &requested;
> > +     placement.busy_placement =3D &requested;
> > +
> > +     ret =3D __i915_ttm_get_pages(obj, &placement);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * Reinitialize the region bindings. This is primarily
> > +      * required for objects where the new region is not in
> > +      * its allowable placements.
> > +      */
> > +     if (obj->mm.region !=3D mr) {
> > +             i915_gem_object_release_memory_region(obj);
> > +             i915_gem_object_init_memory_region(obj, mr);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
> >                              struct sg_table *st)
> >  {
> > @@ -814,6 +866,7 @@ static const struct drm_i915_gem_object_ops i915_ge=
m_ttm_obj_ops =3D {
> >       .truncate =3D i915_ttm_purge,
> >       .adjust_lru =3D i915_ttm_adjust_lru,
> >       .delayed_free =3D i915_ttm_delayed_free,
> > +     .migrate =3D i915_ttm_migrate,
> >       .mmap_offset =3D i915_ttm_mmap_offset,
> >       .mmap_ops =3D &vm_ops_ttm,
> >  };
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm=
/i915/gem/i915_gem_wait.c
> > index 1070d3afdce7..f909aaa09d9c 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > @@ -290,3 +290,22 @@ i915_gem_wait_ioctl(struct drm_device *dev, void *=
data, struct drm_file *file)
> >       i915_gem_object_put(obj);
> >       return ret;
> >  }
> > +
> > +/**
> > + * i915_gem_object_wait_migration - Sync an accelerated migration oper=
ation
> > + * @obj: The migrating object.
> > + * @flags: waiting flags. Currently supports only I915_WAIT_INTERRUPTI=
BLE.
> > + *
> > + * Wait for any pending async migration operation on the object,
> > + * whether it's explicitly (i915_gem_object_migrate()) or implicitly
> > + * (swapin, initial clearing) initiated.
> > + *
> > + * Return: 0 if successful, -ERESTARTSYS if a signal was hit during wa=
iting.
> > + */
> > +int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
> > +                                unsigned int flags)
> > +{
> > +     might_sleep();
> > +     /* NOP for now. */
> > +     return 0;
> > +}
> > --
> > 2.31.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
