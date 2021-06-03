Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08D399FA1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127DE6E506;
	Thu,  3 Jun 2021 11:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A966E150;
 Thu,  3 Jun 2021 11:17:29 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 76so5442287qkn.13;
 Thu, 03 Jun 2021 04:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2ypkkOaIQMmr4XUSylFBzyegctBbWzMZkJwaTgYYlQ8=;
 b=HKDam01Rzb1JQ4ePBsb/8ZacasxSR6hdeV43czHsWfDuMlBr8veQBEh5/Ryeg03Ou/
 PCOr+JNHsOVLwFuHlyHjw0OKNsvIhS873HjHUeHRWSEmFwRjPKz2vLqpkLKCq4Rv6CEX
 Y8KnehnAcGppck/FJt7JL5Z/iWP20Va/D61X17JDmozoN7AQGdIm71zc9ieS1DwLnzfp
 OrnnWj9JRH+uMoce0sLneRjx1HDJao7TSKaA1ErDK70k6yhS6ZUN2nXYv/qkWJDJqm3u
 trbvK0c3V4W0OsnckUxgBLAvJbA80mnTafx+rCWjcO+9JEFD3+vWIRcZE90Y52do3se4
 5ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ypkkOaIQMmr4XUSylFBzyegctBbWzMZkJwaTgYYlQ8=;
 b=Py7PbZyMNskmvP68TESzo0q7WwJUSEXHFjd7+6UrgN8pzTRVt3QIPPK3Kz/LT2TiWz
 CeFfzJyLW6tfGu7GjGg5GMBxAXaObdrPj4/PNZARNylq9i6E3f3KlgQFCEDNolViFaag
 KRM4KwRTp2GrsAMqs/YxECPCIgYofLsdIFal38F5ynx/t2wPICDncgQWdQ8lyUM9jmO8
 pnhkQp1wLvLeGFoyC5mqygio8v3osQsIU4ZU4waU3szpW57CCIu7SrrRTw4Tjiqe/oVL
 4dwUUbsNfRWqFozouyaczKsOwi90fcD/hdF1u9Nym6Kx9LUKtaV8LHWWIbLuC4fwbmje
 QvTg==
X-Gm-Message-State: AOAM531KXa76mzG32yrJg0s/z3VpiQkRYdaBvutat5CR7SPBIorEpqmO
 GbI47NEC1814HnsjHS7pU5DAxwnhofYAsPKPWKMuatcYbt0=
X-Google-Smtp-Source: ABdhPJy7XTq2EkJwFsxqy03SOcvKyf2eERrK3JX/l8n5dvorbEX4jx/FGcdZweX0OPsTJcvZXGuELZFiBN6gTQukZTE=
X-Received: by 2002:a37:9a0b:: with SMTP id c11mr11831885qke.327.1622719048601; 
 Thu, 03 Jun 2021 04:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210602170716.280491-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Jun 2021 12:17:01 +0100
Message-ID: <CAM0jSHNwY8BEL1BjTqioZu3BYZ=86qkuqooaZPOgHb=03Pj+dQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Update object placement flags
 to be mutable
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

On Wed, 2 Jun 2021 at 18:08, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The object ops i915_GEM_OBJECT_HAS_IOMEM and the object
> I915_BO_ALLOC_STRUCT_PAGE flags are considered immutable by
> much of our code. Introduce a new mem_flags member to hold these
> and make sure checks for these flags being set are either done
> under the object lock or with pages properly pinned. The flags
> will change during migration under the object lock.

What are the rules for the gem_object_ops flags? Like is_shrinkable?
Can't we just move these there(IOMEM vs PAGE)?

>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  7 +++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 38 +++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    | 14 ++-----
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 20 +++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 10 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  4 +-
>  .../drm/i915/gem/selftests/huge_gem_object.c  |  4 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  5 +--
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
>  .../drm/i915/gem/selftests/i915_gem_phys.c    |  3 +-
>  14 files changed, 78 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_internal.c
> index ce6b664b10aa..13b217f75055 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -177,8 +177,8 @@ i915_gem_object_create_internal(struct drm_i915_priva=
te *i915,
>                 return ERR_PTR(-ENOMEM);
>
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
> -       i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_cl=
ass,
> -                            I915_BO_ALLOC_STRUCT_PAGE);
> +       i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_cl=
ass, 0);
> +       obj->mem_flags |=3D I915_BO_FLAG_STRUCT_PAGE;
>
>         /*
>          * Mark the object as volatile, such that the pages are marked as
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index d1de97e4adfd..171a21ca930c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -683,7 +683,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
>
>         if (mmap_type !=3D I915_MMAP_TYPE_GTT &&
>             !i915_gem_object_has_struct_page(obj) &&
> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
> +           !i915_gem_object_has_iomem(obj))
>                 return -ENODEV;
>
>         mmo =3D mmap_offset_attach(obj, mmap_type, file);
> @@ -707,7 +707,12 @@ __assign_mmap_offset_handle(struct drm_file *file,
>         if (!obj)
>                 return -ENOENT;
>
> +       err =3D i915_gem_object_lock_interruptible(obj, NULL);
> +       if (err)
> +               goto out_put;
>         err =3D __assign_mmap_offset(obj, mmap_type, offset, file);
> +       i915_gem_object_unlock(obj);
> +out_put:
>         i915_gem_object_put(obj);
>         return err;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index cf18c430d51f..07e8ff9a8aae 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -475,6 +475,44 @@ bool i915_gem_object_migratable(struct drm_i915_gem_=
object *obj)
>         return obj->mm.n_placements > 1;
>  }
>
> +/**
> + * i915_gem_object_has_struct_page - Whether the object is page-backed
> + * @obj: The object to query.
> + *
> + * This function should only be called while the object is locked or pin=
ned,
> + * otherwise the page backing may change under the caller.
> + *
> + * Return: True if page-backed, false otherwise.
> + */
> +bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *o=
bj)
> +{
> +#ifdef CONFIG_LOCKDEP
> +       if (IS_DGFX(to_i915(obj->base.dev)) &&
> +           i915_gem_object_evictable((void __force *)obj))
> +               assert_object_held_shared(obj);
> +#endif
> +       return obj->mem_flags & I915_BO_FLAG_STRUCT_PAGE;
> +}
> +
> +/**
> + * i915_gem_object_has_iomem - Whether the object is iomem-backed
> + * @obj: The object to query.
> + *
> + * This function should only be called while the object is locked or pin=
ned,
> + * otherwise the iomem backing may change under the caller.
> + *
> + * Return: True if iomem-backed, false otherwise.
> + */
> +bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
> +{
> +#ifdef CONFIG_LOCKDEP
> +       if (IS_DGFX(to_i915(obj->base.dev)) &&
> +           i915_gem_object_evictable((void __force *)obj))
> +               assert_object_held_shared(obj);
> +#endif
> +       return obj->mem_flags & I915_BO_FLAG_IOMEM;
> +}
> +
>  void i915_gem_init__objects(struct drm_i915_private *i915)
>  {
>         INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index ff59e6c640e6..23e26f6b1db9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -147,7 +147,7 @@ i915_gem_object_put(struct drm_i915_gem_object *obj)
>  /*
>   * If more than one potential simultaneous locker, assert held.
>   */
> -static inline void assert_object_held_shared(struct drm_i915_gem_object =
*obj)
> +static inline void assert_object_held_shared(const struct drm_i915_gem_o=
bject *obj)
>  {
>         /*
>          * Note mm list lookup is protected by
> @@ -261,17 +261,9 @@ i915_gem_object_type_has(const struct drm_i915_gem_o=
bject *obj,
>         return obj->ops->flags & flags;
>  }
>
> -static inline bool
> -i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
> -{
> -       return obj->flags & I915_BO_ALLOC_STRUCT_PAGE;
> -}
> +bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *o=
bj);
>
> -static inline bool
> -i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
> -{
> -       return i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
> -}
> +bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj);
>
>  static inline bool
>  i915_gem_object_is_shrinkable(const struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index 2a23b77424b3..fb9ccc3f50e7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -33,10 +33,9 @@ struct i915_lut_handle {
>
>  struct drm_i915_gem_object_ops {
>         unsigned int flags;
> -#define I915_GEM_OBJECT_HAS_IOMEM      BIT(1)
> -#define I915_GEM_OBJECT_IS_SHRINKABLE  BIT(2)
> -#define I915_GEM_OBJECT_IS_PROXY       BIT(3)
> -#define I915_GEM_OBJECT_NO_MMAP                BIT(4)
> +#define I915_GEM_OBJECT_IS_SHRINKABLE  BIT(1)
> +#define I915_GEM_OBJECT_IS_PROXY       BIT(2)
> +#define I915_GEM_OBJECT_NO_MMAP                BIT(3)
>
>         /* Interface between the GEM object and its backing storage.
>          * get_pages() is called once prior to the use of the associated =
set
> @@ -201,17 +200,18 @@ struct drm_i915_gem_object {
>         unsigned long flags;
>  #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
>  #define I915_BO_ALLOC_VOLATILE   BIT(1)
> -#define I915_BO_ALLOC_STRUCT_PAGE BIT(2)
> -#define I915_BO_ALLOC_CPU_CLEAR  BIT(3)
> -#define I915_BO_ALLOC_USER       BIT(4)
> +#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
> +#define I915_BO_ALLOC_USER       BIT(3)
>  #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>                              I915_BO_ALLOC_VOLATILE | \
> -                            I915_BO_ALLOC_STRUCT_PAGE | \
>                              I915_BO_ALLOC_CPU_CLEAR | \
>                              I915_BO_ALLOC_USER)
> -#define I915_BO_READONLY         BIT(5)
> -#define I915_TILING_QUIRK_BIT    6 /* unknown swizzling; do not release!=
 */
> +#define I915_BO_READONLY         BIT(4)
> +#define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release!=
 */
>
> +       unsigned int mem_flags:2;
> +#define I915_BO_FLAG_STRUCT_PAGE BIT(0)
> +#define I915_BO_FLAG_IOMEM       BIT(1)
>         /*
>          * Is the object to be mapped as read-only to the GPU
>          * Only honoured if hardware has relevant pte bit
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index 086005c1c7ea..f2f850e31b8e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -351,7 +351,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_obj=
ect *obj,
>         int err;
>
>         if (!i915_gem_object_has_struct_page(obj) &&
> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
> +           !i915_gem_object_has_iomem(obj))
>                 return ERR_PTR(-ENXIO);
>
>         assert_object_held(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i=
915/gem/i915_gem_phys.c
> index be72ad0634ba..7986612f48fa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -76,7 +76,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i9=
15_gem_object *obj)
>         intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
>
>         /* We're no longer struct page backed */
> -       obj->flags &=3D ~I915_BO_ALLOC_STRUCT_PAGE;
> +       obj->mem_flags &=3D ~I915_BO_FLAG_STRUCT_PAGE;
>         __i915_gem_object_set_pages(obj, st, sg->length);
>
>         return 0;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index 5d16c4462fda..3648ae1d6628 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -284,6 +284,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_o=
bject *obj,
>                                 bool needs_clflush)
>  {
>         GEM_BUG_ON(obj->mm.madv =3D=3D __I915_MADV_PURGED);
> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>
>         if (obj->mm.madv =3D=3D I915_MADV_DONTNEED)
>                 obj->mm.dirty =3D false;
> @@ -302,6 +303,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_=
gem_object *obj, struct sg_
>         struct pagevec pvec;
>         struct page *page;
>
> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>         __i915_gem_object_release_shmem(obj, pages, true);
>
>         i915_gem_gtt_finish_pages(obj, pages);
> @@ -444,7 +446,7 @@ shmem_pread(struct drm_i915_gem_object *obj,
>
>  static void shmem_release(struct drm_i915_gem_object *obj)
>  {
> -       if (obj->flags & I915_BO_ALLOC_STRUCT_PAGE)
> +       if (i915_gem_object_has_struct_page(obj))
>                 i915_gem_object_release_memory_region(obj);
>
>         fput(obj->base.filp);
> @@ -513,9 +515,8 @@ static int shmem_object_init(struct intel_memory_regi=
on *mem,
>         mapping_set_gfp_mask(mapping, mask);
>         GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>
> -       i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class,
> -                            I915_BO_ALLOC_STRUCT_PAGE);
> -
> +       i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
> +       obj->mem_flags |=3D I915_BO_FLAG_STRUCT_PAGE;
>         obj->write_domain =3D I915_GEM_DOMAIN_CPU;
>         obj->read_domains =3D I915_GEM_DOMAIN_CPU;
>
> @@ -561,6 +562,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i91=
5_private *dev_priv,
>         resource_size_t offset;
>         int err;
>
> +       GEM_WARN_ON(IS_DGFX(dev_priv));
>         obj =3D i915_gem_object_create_shmem(dev_priv, round_up(size, PAG=
E_SIZE));
>         if (IS_ERR(obj))
>                 return obj;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 3748098b42d5..ae12a2be11a2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -563,7 +563,6 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_o=
bject *obj)
>
>  const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops =3D {
>         .name =3D "i915_gem_object_ttm",
> -       .flags =3D I915_GEM_OBJECT_HAS_IOMEM,
>
>         .get_pages =3D i915_ttm_get_pages,
>         .put_pages =3D i915_ttm_put_pages,
> @@ -620,6 +619,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>         i915_gem_object_init_memory_region(obj, mem);
>         i915_gem_object_make_unshrinkable(obj);
>         obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> +       obj->mem_flags |=3D I915_BO_FLAG_IOMEM;
>         i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_N=
OWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 602f0ed983ec..41dfcb75f05b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -538,8 +538,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>                 return -ENOMEM;
>
>         drm_gem_private_object_init(dev, &obj->base, args->user_size);
> -       i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class,
> -                            I915_BO_ALLOC_STRUCT_PAGE);
> +       i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class, 0);
> +       obj->mem_flags =3D I915_BO_FLAG_STRUCT_PAGE;
>         obj->read_domains =3D I915_GEM_DOMAIN_CPU;
>         obj->write_domain =3D I915_GEM_DOMAIN_CPU;
>         i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drive=
rs/gpu/drm/i915/gem/selftests/huge_gem_object.c
> index 0c8ecfdf5405..f963b8e1e37b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> @@ -114,8 +114,8 @@ huge_gem_object(struct drm_i915_private *i915,
>                 return ERR_PTR(-ENOMEM);
>
>         drm_gem_private_object_init(&i915->drm, &obj->base, dma_size);
> -       i915_gem_object_init(obj, &huge_ops, &lock_class,
> -                            I915_BO_ALLOC_STRUCT_PAGE);
> +       i915_gem_object_init(obj, &huge_ops, &lock_class, 0);
> +       obj->mem_flags |=3D I915_BO_FLAG_STRUCT_PAGE;
>
>         obj->read_domains =3D I915_GEM_DOMAIN_CPU;
>         obj->write_domain =3D I915_GEM_DOMAIN_CPU;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gp=
u/drm/i915/gem/selftests/huge_pages.c
> index dadd485bc52f..ccc67ed1a84b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -167,9 +167,8 @@ huge_pages_object(struct drm_i915_private *i915,
>                 return ERR_PTR(-ENOMEM);
>
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
> -       i915_gem_object_init(obj, &huge_page_ops, &lock_class,
> -                            I915_BO_ALLOC_STRUCT_PAGE);
> -
> +       i915_gem_object_init(obj, &huge_page_ops, &lock_class, 0);
> +       obj->mem_flags |=3D I915_BO_FLAG_STRUCT_PAGE;
>         i915_gem_object_set_volatile(obj);
>
>         obj->write_domain =3D I915_GEM_DOMAIN_CPU;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers=
/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index ca69a29b7f2a..bfb35270a1f0 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -837,7 +837,7 @@ static bool can_mmap(struct drm_i915_gem_object *obj,=
 enum i915_mmap_type type)
>
>         if (type !=3D I915_MMAP_TYPE_GTT &&
>             !i915_gem_object_has_struct_page(obj) &&
> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
> +           !i915_gem_object_has_iomem(obj))
>                 return false;
>
>         return true;
> @@ -991,7 +991,7 @@ static const char *repr_mmap_type(enum i915_mmap_type=
 type)
>  static bool can_access(const struct drm_i915_gem_object *obj)
>  {
>         return i915_gem_object_has_struct_page(obj) ||
> -              i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
> +              i915_gem_object_has_iomem(obj);
>  }
>
>  static int __igt_mmap_access(struct drm_i915_private *i915,
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers=
/gpu/drm/i915/gem/selftests/i915_gem_phys.c
> index 3a6ce87f8b52..d43d8dae0f69 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
> @@ -25,13 +25,14 @@ static int mock_phys_object(void *arg)
>                 goto out;
>         }
>
> +       i915_gem_object_lock(obj, NULL);
>         if (!i915_gem_object_has_struct_page(obj)) {
> +               i915_gem_object_unlock(obj);
>                 err =3D -EINVAL;
>                 pr_err("shmem has no struct page\n");
>                 goto out_obj;
>         }
>
> -       i915_gem_object_lock(obj, NULL);
>         err =3D i915_gem_object_attach_phys(obj, PAGE_SIZE);
>         i915_gem_object_unlock(obj);
>         if (err) {
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
