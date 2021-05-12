Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B276837BC05
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 13:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EA86EB7F;
	Wed, 12 May 2021 11:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9476EB7C;
 Wed, 12 May 2021 11:46:06 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 76so21781157qkn.13;
 Wed, 12 May 2021 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYC6If7bdJFOq0ZNHHPwbaDr3dD6LtLxdpO2ak9v1KM=;
 b=pbRCm/hNXli3iflQhlbBrr/5C5OK/p02o1Pu7nEQZuZBHIPvth6xFDyWLpMntZ32Pq
 cvYNUEJaw0G2SRqf80PeXJGM/4I6N4wPXZkzlrwbGhptOWiiRXSL+xbD/9Q437ZsDnDh
 YqbTXOLWmNGI/I8jJOW+1XwNX2CRqxTsJ7VKaD2hbXlTF8dc8wsPwKBOh39J2C+H0lNq
 SAr0WTwGcA70L1b2mS06eSxdUV1DYKcx3b8fUndtHreh3bibaegtX4lHx8JrGZw5KCs7
 1vBRjpjl4+ZjXGro5ehGzKrXvdvSfdkPWb8Xf7UBZPAvM/ZfPj32mshMGkd4lbr3zCVm
 UPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYC6If7bdJFOq0ZNHHPwbaDr3dD6LtLxdpO2ak9v1KM=;
 b=R7dAQylv5UROBy4EYwbnZVPCW3jAG+XCjfrHPCHCwPEk5ckbdCWxauuNFoqs64RCT9
 64PNoZO7xWD3rRVpuAGuD/8KG11+Hk9TfNJsC4bpaJoZox/uycyo9e276rPqAsfJ+KvZ
 Zvx+Bfb+YqSJEGb225PJioL7gamnOpMSYhCikYeezdwMiCyHBs+jXUVQvIYi8DV/KprM
 YmCZpSzDgZvhUjV0TfDhwvIixNh/LlvGKghoIaYibwMXkC2ZWYeU3Vy7bRoUjgR+sS9q
 HF9oOfHhPbNUbkpqtsm67WsKsBEKHvx+kBynyU9miVt+o1LGn26EeugH5nD5e6/nnCKx
 Nt7A==
X-Gm-Message-State: AOAM5329kGLUL5ol9DdjUrHvr6Tv/OLXztyk7T7FULvUme4N59XGS8sv
 lPPqt0s5Z4ZHP7NIWx5SmlQEiUhfhxNyKrCR6So=
X-Google-Smtp-Source: ABdhPJxMwABs6c3LItu5lK8IE1nPIqfa9p7vHGvx1fdKWmTpafVCq0HUttS2wLCg0I+gUfyAbeBw7VlGdkAJJPen9io=
X-Received: by 2002:a37:9d58:: with SMTP id g85mr32561584qke.426.1620819965497; 
 Wed, 12 May 2021 04:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 12 May 2021 12:45:38 +0100
Message-ID: <CAM0jSHOwVB+1p9Rfx65N9C0wZmdmTV9z=guqagqfvdhDUDyLKw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM
 i915 gem object backend
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 May 2021 at 14:26, Thomas Hellstr=C3=B6m
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
> There are some changes to TTM to allow for purging system memory buffer
> objects and to refuse swapping of some objects: Unfortunately i915 gem
> still relies heavily on short-term object pinning, and we've chosen to
> keep short-term-pinned buffer objects on the TTM LRU lists for now,
> meaning that we need some sort of mechanism to tell TTM they are not
> swappable. A longer term goal is to get rid of the short-term pinning.
>
> Remove the old lmem backend.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  83 ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 126 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  18 +
>  drivers/gpu/drm/i915/gem/i915_gem_region.c    |   6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 534 ++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>  drivers/gpu/drm/i915/intel_memory_region.c    |   1 -
>  drivers/gpu/drm/i915/intel_memory_region.h    |   1 -
>  drivers/gpu/drm/i915/intel_region_ttm.c       |   5 +-
>  drivers/gpu/drm/i915/intel_region_ttm.h       |   7 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  |  12 +
>  include/drm/ttm/ttm_device.h                  |   9 +
>  17 files changed, 733 insertions(+), 140 deletions(-)
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
> index f42803ea48f2..2b8cd15de1d9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -4,73 +4,10 @@
>   */
>
>  #include "intel_memory_region.h"
> -#include "intel_region_ttm.h"
>  #include "gem/i915_gem_region.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "i915_drv.h"
>
> -static void lmem_put_pages(struct drm_i915_gem_object *obj,
> -                                 struct sg_table *pages)
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
> -       if (IS_ERR(pages))
> -               return PTR_ERR(pages);
> -
> -       __i915_gem_object_set_pages(obj, pages,
> -                                   i915_sg_dma_page_sizes(pages->sgl));
> -
> -       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
> -               void __iomem *vaddr =3D
> -                       i915_gem_object_lmem_io_map(obj, 0, obj->base.siz=
e);

Where did the object clearing go? I'm not seeing it in the new code.

<snip>

> +
> +static struct sg_table *
> +i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
> +                        struct ttm_resource *res)
> +{
> +       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> +       struct ttm_resource_manager *man =3D
> +               ttm_manager_type(bo->bdev, res->mem_type);
> +       struct sg_table *st;
> +
> +       if (man->use_tt)
> +               return i915_ttm_tt_get_st(bo->ttm);
> +
> +       st =3D kzalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               return ERR_PTR(-ENOMEM);

The st is already allocated below.

<snip>

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
> +
> +       ret =3D ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> +                         ttm_bo_type_kernel, &i915_sys_placement, alignm=
ent,
> +                         true, NULL, NULL, i915_ttm_bo_destroy);

Handle the error?

> +
> +       obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> +
> +       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
> +       return 0;
> +}
