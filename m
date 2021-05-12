Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51337B8B5
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AB96EB67;
	Wed, 12 May 2021 08:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7096EB66;
 Wed, 12 May 2021 08:57:32 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id f8so12513449qth.6;
 Wed, 12 May 2021 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W5P8g4Pc38D1sNHTnDBbTc0RyHb9MjEQwZgdmU+u4Sg=;
 b=TS2FS7X/N5bnLrAJMMUfQZKJkOLWGrZUIIjhoPRKtDprJqZhAxPyCtY3yzBI/psTif
 00mVCGzM/khOm3qcg23OHcb4LjiF7bwJIytyBFUM2uOVwBRLfZGSAMiDZeRdVabeTBM1
 HPD57gM+08kS6GeAee/L1lSFSk3AoGSKj8s84jTQtzOcNEyGYrv1v3yu83iTjpqgU5E1
 sNz/JSNWcSpckOH5c/WUixek84coC/TqDhijOBM5NBUFzYctwh0iy49cd8RIf5oK717k
 wfTpY9uY/DKsy7JIfU5NvEK5u2hZn3DQtCJ1HnLyB7cQ1tXtL9jOvIrBTLCCSqJ4GJbz
 0HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W5P8g4Pc38D1sNHTnDBbTc0RyHb9MjEQwZgdmU+u4Sg=;
 b=t2uTuuOwtrXoW9AfvjNEiCMXeTgx6hXdP92yVkSlXD2Yulh5tbvCHcH4nPY9hG3cNY
 Pgu3QZX8c6PtfpXTBNgdJZlfD/MV38ZJhrN/ls4mRb+uKIazilDUVkVRn0mePSEyqHFS
 R3yx8Iqs+ovXKtkGukPpv/TTaKeoFPneDV8uiELyCuaOOQRdxc1b+8evv/hykpMnbBx4
 8cd8mNVH9LI0XzZlX0c0+R0NkA9F4cjXzWCWQrZhWq8QxdLKRsG5K9lUs3gw2/y5x837
 Sm3gD0bos50mves6N/O7E0XJlHowZQXc2B71lYWolUCcALEPZHkPBoKbj/U/f3JbQRhj
 vF2g==
X-Gm-Message-State: AOAM531QE0GZleksneMSkgQJUUw0wnLABfdc692SDl9BrflIj6+p4XNp
 IAGAYPy6ATR6o5mJjiTEUWZNd6dt3oRu+YdwH70=
X-Google-Smtp-Source: ABdhPJzXHiuFXccvR7pg8z08AJ8F1qLCW0YwsPYj2DdQHjYBUkS5YW71SPONj+WYB2Hgs6jEARXAJm+Gb1cGCw46L3c=
X-Received: by 2002:a05:622a:89:: with SMTP id
 o9mr7856635qtw.339.1620809851476; 
 Wed, 12 May 2021 01:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210511132525.377190-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 12 May 2021 09:57:04 +0100
Message-ID: <CAM0jSHN4iuq+nYkWq0aZ-K8q9NBbQy7TLc1Zp6=DEV_fCaAN3A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/ttm, drm/ttm: Initialize the ttm
 device and memory managers.
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
> Temporarily remove the buddy allocator and related selftests
> and hook up the TTM range manager for i915 regions.
>
> In order to support some of the mock region-related selftests, we need to
> be able to initialize the TTM range-manager standalone without a struct
> ttm_device. Add two functions to allow that to the TTM api.
>
> Finally modify the mock region selftests somewhat to account for a
> fragmenting manager.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig                  |   1 +
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  58 +-
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_region.c    | 120 ---
>  drivers/gpu/drm/i915/gem/i915_gem_region.h    |   4 -
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  10 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |   9 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            |   2 -
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  27 +-
>  drivers/gpu/drm/i915/i915_buddy.c             | 435 ----------
>  drivers/gpu/drm/i915/i915_buddy.h             | 131 ---
>  drivers/gpu/drm/i915/i915_drv.c               |   8 +
>  drivers/gpu/drm/i915/i915_drv.h               |   7 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   1 +
>  drivers/gpu/drm/i915/i915_globals.c           |   1 -
>  drivers/gpu/drm/i915/i915_globals.h           |   1 -
>  drivers/gpu/drm/i915/i915_scatterlist.c       |  70 ++
>  drivers/gpu/drm/i915/i915_scatterlist.h       |  35 +
>  drivers/gpu/drm/i915/intel_memory_region.c    | 180 ++--
>  drivers/gpu/drm/i915/intel_memory_region.h    |  44 +-
>  drivers/gpu/drm/i915/intel_region_ttm.c       | 246 ++++++
>  drivers/gpu/drm/i915/intel_region_ttm.h       |  29 +
>  drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ------------------
>  .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
>  .../drm/i915/selftests/intel_memory_region.c  | 133 +--
>  drivers/gpu/drm/i915/selftests/mock_region.c  |  51 +-
>  drivers/gpu/drm/ttm/ttm_range_manager.c       |  55 +-
>  include/drm/ttm/ttm_bo_driver.h               |  23 +
>  31 files changed, 715 insertions(+), 1771 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
>  delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
>  create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
>  create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
>  delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 1e1cb245fca7..b63d374dff23 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -26,6 +26,7 @@ config DRM_I915
>         select SND_HDA_I915 if SND_HDA_CORE
>         select CEC_CORE if CEC_NOTIFIER
>         select VMAP_PFN
> +       select DRM_TTM
>         help
>           Choose this option if you have a system that has "Intel Graphic=
s
>           Media Accelerator" or "HD Graphics" integrated graphics,
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index d0d936d9137b..cb8823570996 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -50,6 +50,7 @@ i915-y +=3D i915_drv.o \
>           intel_memory_region.o \
>           intel_pch.o \
>           intel_pm.o \
> +         intel_region_ttm.o \
>           intel_runtime_pm.o \
>           intel_sideband.o \
>           intel_step.o \
> @@ -160,7 +161,6 @@ gem-y +=3D \
>  i915-y +=3D \
>           $(gem-y) \
>           i915_active.o \
> -         i915_buddy.o \
>           i915_cmd_parser.o \
>           i915_gem_evict.o \
>           i915_gem_gtt.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i=
915/gem/i915_gem_lmem.c
> index f44bdd08f7cb..f42803ea48f2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -4,16 +4,70 @@
>   */
>
>  #include "intel_memory_region.h"
> +#include "intel_region_ttm.h"
>  #include "gem/i915_gem_region.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "i915_drv.h"
>
> +static void lmem_put_pages(struct drm_i915_gem_object *obj,
> +                                 struct sg_table *pages)
> +{
> +       intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
> +       obj->mm.dirty =3D false;
> +       sg_free_table(pages);
> +       kfree(pages);
> +}
> +
> +static int lmem_get_pages(struct drm_i915_gem_object *obj)
> +{
> +       unsigned int flags;
> +       struct sg_table *pages;
> +
> +       flags =3D I915_ALLOC_MIN_PAGE_SIZE;
> +       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
> +               flags |=3D I915_ALLOC_CONTIGUOUS;
> +
> +       obj->mm.st_mm_node =3D intel_region_ttm_node_alloc(obj->mm.region=
,
> +                                                        obj->base.size,
> +                                                        flags);
> +       if (IS_ERR(obj->mm.st_mm_node))
> +               return PTR_ERR(obj->mm.st_mm_node);
> +
> +       /* Range manager is always contigous */
> +       if (obj->mm.region->is_range_manager)
> +               obj->flags |=3D I915_BO_ALLOC_CONTIGUOUS;
> +       pages =3D intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_=
mm_node);
> +       if (IS_ERR(pages))
> +               return PTR_ERR(pages);

error unwind?

> +
> +       __i915_gem_object_set_pages(obj, pages,
> +                                   i915_sg_dma_page_sizes(pages->sgl));
> +
> +       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
> +               void __iomem *vaddr =3D
> +                       i915_gem_object_lmem_io_map(obj, 0, obj->base.siz=
e);
> +
> +               if (!vaddr) {
> +                       struct sg_table *pages =3D
> +                               __i915_gem_object_unset_pages(obj);
> +
> +                       if (!IS_ERR_OR_NULL(pages))
> +                               lmem_put_pages(obj, pages);
> +               }
> +
> +               memset_io(vaddr, 0, obj->base.size);
> +               io_mapping_unmap(vaddr);
> +       }
> +
> +       return 0;
> +}

<snip>

> +/**
> + * i915_sg_dma_page_sizes - Calculate page sizes from a scatterlist
> + * @sg: The scatterlist from which to calculate page sizes
> + *
> + * Return: a value with bits sets for relevant page sizes.
> + */
> +static inline unsigned int i915_sg_dma_page_sizes(struct scatterlist *sg=
)
> +{
> +       unsigned int page_sizes;
> +
> +       page_sizes =3D 0;
> +       while (sg) {
> +               GEM_BUG_ON(sg->offset);
> +               GEM_BUG_ON(!IS_ALIGNED(sg->dma_length, PAGE_SIZE));
> +               page_sizes |=3D sg->dma_length;
> +               sg =3D __sg_next(sg);
> +       }
> +
> +       /*
> +        * Is this necessary to support building large GPU pages from
> +        * even larger segments?
> +        */

We just need to know the above sg page_sizes, which is the mask of
sg->dma_length for each sg. Later in __i915_gem_object_set_pages() we
use this to determine the potential GPU page sizes for the object,
depending on what the device supports. So the below stuff shouldn't be
needed. Also we can just use i915_sg_page_sizes() here.

Although since we do have control over building the sg, we should
ideally just pass in the sg_page_sizes to say i915_sg_from_mm_node()
for it to fill in, instead of looping over the whole thing again, but
that can be something to do in the future.
