Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62313A467B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 18:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEBD6F384;
	Fri, 11 Jun 2021 16:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC186F384;
 Fri, 11 Jun 2021 16:29:37 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id t6so10961647qvp.5;
 Fri, 11 Jun 2021 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X3KlzGG/X5Q1chag9d6E2zkxQhDyCN1nLhnZKOGcyfQ=;
 b=dHdh3drpHk4Rb6jN8932pKw+t+ePK3DFvQIYEFVYimGbYOetw/aZs+zLyYsE6r1wHq
 CEBWARNikqmAPv8VjCmrx+nLx+OVvfUr0gt+IZBed3COkwfzNB1cp8DZPi/ZT2jRdHvv
 Eu8QTR/Xw/85VYlmNd82hHXGbqFV3tqiEANss6TYcXckXpg8LqvAsPbiH7A6GZcLZcF7
 0O1IRP2gDQKMBlfJ3Qco71miojdFaYUVez9fHJWUB39qtXhN59l97cJKjvGdKx/5gWj1
 K48caMl65qpl4bkhzI66rImOraQ76dlDFJZ1rOcbFII1XbBC9DYEGapVHatn9RKNTczd
 ppog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X3KlzGG/X5Q1chag9d6E2zkxQhDyCN1nLhnZKOGcyfQ=;
 b=lbRFPEdbDxUqb+id2viIhs/1ELJHU/jP5QiAw4ogNZo2KmyjdIFLnvMXTus1uo7/2c
 UW/OvIbbfV/w1Rpt5ouQOE6h+NMoYJ6E2rtWcLcjPpcO2rVdlLqmZtCCRMtacQEN98rl
 Ju06gAFXsdEFoRwGyPIwFlIQ7LMMunyaeQephaT9wM815+oUnQWs9RpGQjFoPG4U+HDU
 fEO3P4vfPtMZYH6LIfA0RX6tVLZzl2tIyZtcGOOFFHv1FqtBsqxbibWh77++3wijTCgq
 z4So79VC8HNriww/AU/YHIcjaYDr8m27AjrsAB8NEDBjmMVOqFC+tYQYeGDpAGsA7eKx
 f0pA==
X-Gm-Message-State: AOAM532vueqKWS5B2WdVRVEMZ+QCOODiNF3P31kKc5fPQAJiS2f90Rg8
 rjUxN/KQPNICi+cgUYPYb8PgfCJb7O7J5owQNKrBHIlA9Q0=
X-Google-Smtp-Source: ABdhPJxll5GkTY8sb1OnEk9OrWcBEHs3f1PhZ12rAliTeArSXEZgI6U2TJf4/6a2H67tznjWq3m/APhRrwroQBcpp2U=
X-Received: by 2002:ad4:596c:: with SMTP id eq12mr5654335qvb.30.1623428976761; 
 Fri, 11 Jun 2021 09:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210611145459.8576-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Jun 2021 17:29:10 +0100
Message-ID: <CAM0jSHNdwG0WcGNUV01JV2r5SXdxQPN4Oz+wLJrBs=7yZrCz0g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
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

On Fri, 11 Jun 2021 at 15:55, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> After a TTM move we need to update the i915 gem flags and caching
> settings to reflect the new placement.
> Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up the
> various ways we previously used to detect this.
> Finally, initialize the TTM object reserved to be able to update
> flags and caching before anyone else gets hold of the object.

Hmm, why do we need to update it after a move? Is it not static? i.e
we just consider the mm.placements/region to determine the correct
domain and cache tracking? Or maybe it doesn't really matter either
way?

>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Style fixes (Reported by Matthew Auld)
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 112 +++++++++++++++++++-----
>  1 file changed, 90 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 33ab47f1e05b..45ef1d101937 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -70,6 +70,17 @@ static struct ttm_placement i915_sys_placement =3D {
>         .busy_placement =3D &lmem0_sys_placement_flags[1],
>  };
>
> +static bool gpu_binds_iomem(struct ttm_resource *mem)
> +{
> +       return mem->mem_type !=3D TTM_PL_SYSTEM;
> +}
> +
> +static bool cpu_maps_iomem(struct ttm_resource *mem)
> +{
> +       /* Once / if we support GGTT, this is also false for cached ttm_t=
ts */
> +       return mem->mem_type !=3D TTM_PL_SYSTEM;
> +}
> +
>  static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> @@ -175,6 +186,41 @@ static void i915_ttm_free_cached_io_st(struct drm_i9=
15_gem_object *obj)
>         obj->ttm.cached_io_st =3D NULL;
>  }
>
> +static void
> +i915_ttm_adjust_domains_after_cpu_move(struct drm_i915_gem_object *obj)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +
> +       if (cpu_maps_iomem(bo->resource) || bo->ttm->caching !=3D ttm_cac=
hed) {
> +               obj->write_domain =3D I915_GEM_DOMAIN_WC;
> +               obj->read_domains =3D I915_GEM_DOMAIN_WC;
> +       } else {
> +               obj->write_domain =3D I915_GEM_DOMAIN_CPU;
> +               obj->read_domains =3D I915_GEM_DOMAIN_CPU;
> +       }
> +}
> +
> +static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *o=
bj)
> +{
> +       struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +       unsigned int cache_level;
> +
> +       obj->mem_flags &=3D ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOM=
EM);
> +
> +       obj->mem_flags |=3D cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_I=
OMEM :
> +               I915_BO_FLAG_STRUCT_PAGE;
> +
> +       if ((HAS_LLC(i915) || HAS_SNOOP(i915)) && !gpu_binds_iomem(bo->re=
source) &&
> +           bo->ttm->caching =3D=3D ttm_cached) {
> +               cache_level =3D I915_CACHE_LLC;
> +       } else {
> +               cache_level =3D I915_CACHE_NONE;
> +       }

Nit: no need for the braces.

> +
> +       i915_gem_object_set_cache_coherency(obj, cache_level);
> +}
> +
>  static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>  {
>         struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> @@ -190,8 +236,10 @@ static void i915_ttm_purge(struct drm_i915_gem_objec=
t *obj)
>
>         /* TTM's purge interface. Note that we might be reentering. */
>         ret =3D ttm_bo_validate(bo, &place, &ctx);
> -
>         if (!ret) {
> +               obj->write_domain =3D 0;
> +               obj->read_domains =3D 0;
> +               i915_ttm_adjust_gem_after_move(obj);
>                 i915_ttm_free_cached_io_st(obj);
>                 obj->mm.madv =3D __I915_MADV_PURGED;
>         }
> @@ -273,12 +321,15 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object=
 *obj,
>                          struct ttm_resource *res)
>  {
>         struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> -       struct ttm_resource_manager *man =3D
> -               ttm_manager_type(bo->bdev, res->mem_type);
>
> -       if (man->use_tt)
> +       if (!gpu_binds_iomem(res))
>                 return i915_ttm_tt_get_st(bo->ttm);
>
> +       /*
> +        * If CPU mapping differs, we need to add the ttm_tt pages to
> +        * the resulting st. Might make sense for GGTT.
> +        */
> +       GEM_WARN_ON(!cpu_maps_iomem(res));
>         return intel_region_ttm_node_to_st(obj->mm.region, res);
>  }
>
> @@ -290,8 +341,6 @@ static int i915_ttm_move(struct ttm_buffer_object *bo=
, bool evict,
>         struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
>         struct ttm_resource_manager *dst_man =3D
>                 ttm_manager_type(bo->bdev, dst_mem->mem_type);
> -       struct ttm_resource_manager *src_man =3D
> -               ttm_manager_type(bo->bdev, bo->resource->mem_type);
>         struct intel_memory_region *dst_reg, *src_reg;
>         union {
>                 struct ttm_kmap_iter_tt tt;
> @@ -332,34 +381,36 @@ static int i915_ttm_move(struct ttm_buffer_object *=
bo, bool evict,
>         if (IS_ERR(dst_st))
>                 return PTR_ERR(dst_st);
>
> -       /* If we start mapping GGTT, we can no longer use man::use_tt her=
e. */
> -       dst_iter =3D dst_man->use_tt ?
> +       dst_iter =3D !cpu_maps_iomem(dst_mem) ?
>                 ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
>                 ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
>                                          dst_st, dst_reg->region.start);
>
> -       src_iter =3D src_man->use_tt ?
> +       src_iter =3D !cpu_maps_iomem(bo->resource) ?
>                 ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
>                 ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
>                                          obj->ttm.cached_io_st,
>                                          src_reg->region.start);
>
>         ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +       /* Below dst_mem becomes bo->resource. */
>         ttm_bo_move_sync_cleanup(bo, dst_mem);
> +       i915_ttm_adjust_domains_after_cpu_move(obj);
>         i915_ttm_free_cached_io_st(obj);
>
> -       if (!dst_man->use_tt) {
> +       if (gpu_binds_iomem(dst_mem) || cpu_maps_iomem(dst_mem)) {
>                 obj->ttm.cached_io_st =3D dst_st;
>                 obj->ttm.get_io_page.sg_pos =3D dst_st->sgl;
>                 obj->ttm.get_io_page.sg_idx =3D 0;
>         }
>
> +       i915_ttm_adjust_gem_after_move(obj);
>         return 0;
>  }
>
>  static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_r=
esource *mem)
>  {
> -       if (mem->mem_type < I915_PL_LMEM0)
> +       if (!cpu_maps_iomem(mem))
>                 return 0;
>
>         mem->bus.caching =3D ttm_write_combined;
> @@ -421,6 +472,16 @@ static int i915_ttm_get_pages(struct drm_i915_gem_ob=
ject *obj)
>         if (ret)
>                 return ret =3D=3D -ENOSPC ? -ENXIO : ret;
>
> +       i915_ttm_adjust_lru(obj);
> +       if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
> +               ret =3D ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> +               if (ret)
> +                       return ret;
> +
> +               i915_ttm_adjust_domains_after_cpu_move(obj);
> +               i915_ttm_adjust_gem_after_move(obj);
> +       }
> +
>         /* Object either has a page vector or is an iomem object */
>         st =3D bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io=
_st;
>         if (IS_ERR(st))
> @@ -428,8 +489,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_obj=
ect *obj)
>
>         __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
>
> -       i915_ttm_adjust_lru(obj);
> -
>         return ret;
>  }
>
> @@ -563,6 +622,7 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_o=
bject *obj)
>
>  const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops =3D {
>         .name =3D "i915_gem_object_ttm",
> +       .flags =3D I915_GEM_OBJECT_IS_SHRINKABLE,
>
>         .get_pages =3D i915_ttm_get_pages,
>         .put_pages =3D i915_ttm_put_pages,
> @@ -599,6 +659,10 @@ int __i915_gem_ttm_object_init(struct intel_memory_r=
egion *mem,
>  {
>         static struct lock_class_key lock_class;
>         struct drm_i915_private *i915 =3D mem->i915;
> +       struct ttm_operation_ctx ctx =3D {
> +               .interruptible =3D true,
> +               .no_wait_gpu =3D false,
> +       };
>         enum ttm_bo_type bo_type;
>         size_t alignment =3D 0;
>         int ret;
> @@ -618,15 +682,14 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
>         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, fla=
gs);
>         i915_gem_object_init_memory_region(obj, mem);
>         i915_gem_object_make_unshrinkable(obj);
> -       obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> -       obj->mem_flags |=3D I915_BO_FLAG_IOMEM;
> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_N=
OWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
>
>         bo_type =3D (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_devic=
e :
>                 ttm_bo_type_kernel;
>
> +       obj->base.vma_node.driver_private =3D i915_gem_to_ttm(obj);
> +
>         /*
>          * If this function fails, it will call the destructor, but
>          * our caller still owns the object. So no freeing in the
> @@ -634,14 +697,19 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
>          * Similarly, in delayed_destroy, we can't call ttm_bo_put()
>          * until successful initialization.
>          */
> -       obj->base.vma_node.driver_private =3D i915_gem_to_ttm(obj);
> -       ret =3D ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> -                         bo_type, &i915_sys_placement, alignment,
> -                         true, NULL, NULL, i915_ttm_bo_destroy);
> +       ret =3D ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), s=
ize,
> +                                  bo_type, &i915_sys_placement, alignmen=
t,
> +                                  &ctx, NULL, NULL, i915_ttm_bo_destroy)=
;
> +
> +       if (ret)
> +               goto out;
>
> -       if (!ret)
> -               obj->ttm.created =3D true;
> +       obj->ttm.created =3D true;
> +       i915_ttm_adjust_domains_after_cpu_move(obj);
> +       i915_ttm_adjust_gem_after_move(obj);
> +       i915_gem_object_unlock(obj);
>
> +out:
>         /* i915 wants -ENXIO when out of memory region space. */
>         return (ret =3D=3D -ENOSPC) ? -ENXIO : ret;
>  }
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
