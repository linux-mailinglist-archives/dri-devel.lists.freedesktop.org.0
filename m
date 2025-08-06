Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A276B1BED4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 04:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC53B10E28A;
	Wed,  6 Aug 2025 02:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0X3I6rX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B84210E28A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 02:40:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6f6so8345707a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754448005; x=1755052805; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4tl6AWO4NGvDLUg53CSdZNaGpmRhmHGKVlO75uYRRw4=;
 b=V0X3I6rX3FIvU0+NKXY5ss0eRGdy1vcC1DihfmL0UWe7bUBfDHuTB0AVu9ndKJNIbq
 C/drId1/lT71uhhPw8lSWtOXOBwXh/JbYnjXno0VEN0v5CvDONUBZRTgcLjx6n3r9mER
 jC6E56ubC/C8oCmAyh1XMx/S7Rmu4BzL6mzpGqL02uUGnxYRbiG0nOw2I05SBFXIe3XP
 et4b7PpPXJ+5XxQSXjVPAOkyQni1IwjPjwQTVHEv6EXv0XPHU7fRWDdi/3Jh4XB82btw
 IYjnXEeEUixme0i81Y412Me+iaEfJzIXOQiZPPK53Dv6NUR4dyhULdWf6+947dbdp/Tz
 349w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754448005; x=1755052805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4tl6AWO4NGvDLUg53CSdZNaGpmRhmHGKVlO75uYRRw4=;
 b=U3RW274Tq0LjeZTLFc0BxR9Drhx+JTKcFboAM7Av1FDKaCx8pSjzIl5xLNVHN9weWm
 xiRfp0FXW8wTBSi5+g1ENAIdqoOw+bcxHm5T5GzGGWPOT6XTlfYpfgGn5LSKs8eyVszs
 BbpFkUZKOyg2U+3DK75t+/ot46o1x04VLvPYIS4RLiEd8Vibo5ngKBVkJ+zngl0FtqvC
 Z0CA6eUBqjHnzd+j56DuOoeFwyWx0cd/g+vgGBeKilTZs0UJSSZmneLSz5Gftmvp2/gY
 vmQl5AeDN2UgYpNV235+prlZsQT7cizE00l6Gsh65u8opjHQoUPGYvSUcwTKE8yCVPYV
 SRCQ==
X-Gm-Message-State: AOJu0YwORsstVtY7gi2Sj/mbnA9dJnt6Yhk7BRS+Z0J5a/cP5HXsgXSd
 5lKaHJYVXvCDBVASWeBB1z6YUyFA9aFk403k7q+N/+6lReAMBm90we8dl/zEJ+rZx/HDVfnvLs5
 wRotuVyd4eBdfwKDPEj1ZT+6/OSOdRIc=
X-Gm-Gg: ASbGnctT/sdBJSR1CpyZGu4nFrKVDDKi8HYWRfLVSAq32DVyKqrziJQNjdj0joILVfr
 RG+ylJgHtu3UyH/41SX2995LaPLJylXhKWdh/5wWHVkYFLoqJMzZeez/bjIe9C76AtsWQS+Ib90
 n73c6wAJC+h2OQQzcXvrkLUY904nGfjbb9Jq9ch1+6ifxW0I7pru0XEKo0ErtyVnN15TTZpYSSW
 78RJA==
X-Google-Smtp-Source: AGHT+IHUzPbhB+FsQo4ANKDBYpp5HH5S5LbgXu/87fhfM0uHKzU9yHSpGAIZ6vcgqmgxjPqDBMDO8JnPWJHBL15tH/A=
X-Received: by 2002:a17:906:4795:b0:ae3:a812:a780 with SMTP id
 a640c23a62f3a-af9904f1929mr97244466b.61.1754448005387; Tue, 05 Aug 2025
 19:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250714052243.1149732-1-airlied@gmail.com>
 <4a45548a-ad37-4778-b6de-1cda7ce258dc@linux.intel.com>
In-Reply-To: <4a45548a-ad37-4778-b6de-1cda7ce258dc@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Aug 2025 12:39:51 +1000
X-Gm-Features: Ac12FXwIIk5wOVAGQikb4QIyJi-Rq9qSLmr6bSZoudOrhD8r0vAFxIPLW0ONur0
Message-ID: <CAPM=9twKRN=GXNhyUZEd4b7StCN8WuhG_h6BCZX+ONgSW268=g@mail.gmail.com>
Subject: Re: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu
 driver (complete series v2)
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
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

On Tue, 5 Aug 2025 at 20:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Hey,
>
> Den 2025-07-14 kl. 07:18, skrev Dave Airlie:
> > Hi all,
> >
> > This is a repost with some fixes and cleanups.
> >
> > Differences since last posting:
> > 1. Added patch 18: add a module option to allow pooled pages to not be stored in the lru per-memcg
> >    (Requested by Christian Konig)
> > 2. Converged the naming and stats between vmstat and memcg (Suggested by Shakeel Butt)
> > 3. Cleaned up the charge/uncharge code and some other bits.
> >
> > Dave.
> >
> > Original cover letter:
> > tl;dr: start using list_lru/numa/memcg in GPU driver core and amdgpu driver for now.
> >
> > This is a complete series of patches, some of which have been sent before and reviewed,
> > but I want to get the complete picture for others, and try to figure out how best to land this.
> >
> > There are 3 pieces to this:
> > 01->02: add support for global gpu stat counters (previously posted, patch 2 is newer)
> > 03->07: port ttm pools to list_lru for numa awareness
> > 08->14: add memcg stats + gpu apis, then port ttm pools to memcg aware list_lru and shrinker
> > 15->17: enable amdgpu to use new functionality.
> >
> > The biggest difference in the memcg code from previously is I discovered what
> > obj cgroups were designed for and I'm reusing the page/objcg intergration that
> > already exists, to avoid reinventing that wheel right now.
> >
> > There are some igt-gpu-tools tests I've written at:
> > https://gitlab.freedesktop.org/airlied/igt-gpu-tools/-/tree/amdgpu-cgroups?ref_type=heads
> >
> > One problem is there are a lot of delayed action, that probably means the testing
> > needs a bit more robustness, but the tests validate all the basic paths.
> >
> > Regards,
> > Dave.
> >
> Patch below to enable on xe as well, I ran into some issues though when testing.
> After shutting down gdm3/sddm, I ran into a null dereference in mem_cgroup_uncharge_gpu_page()
> from ttm_pool_free_page(), presumably because of the objects that were created without a
> cgroup set. I tried to fix it in mem_cgroup_uncharge_gpu_page() by conditionally calling
> refill_stock(), but that ran into an underflow instead.

there should be a check if memcg is not NULL before calling into
refill, where are you seeing the underflow?

Thanks for the patch, I've booted one of my meteorlake systems with
this applied to forcing xe, and it seems to be working in my basic
testing so far.

Dave.

>
> Anyway, patch for xe below:
> ----->8-----------
> drm/xe: Enable memcg accounting for TT/system
>
> Create a flag to enable memcg accounting for XE as well.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 867087c2d1534..fd93374967c9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -54,6 +54,7 @@ static const struct ttm_place sys_placement_flags = {
>         .flags = 0,
>  };
>
> +/* TTM_PL_FLAG_MEMCG is not set, those placements are used for eviction */
>  static struct ttm_placement sys_placement = {
>         .num_placement = 1,
>         .placement = &sys_placement_flags,
> @@ -188,6 +189,7 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>
>                 bo->placements[*c] = (struct ttm_place) {
>                         .mem_type = XE_PL_TT,
> +                       .flags = TTM_PL_FLAG_MEMCG,
>                 };
>                 *c += 1;
>         }
> @@ -1696,6 +1698,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>
>  static void xe_gem_object_free(struct drm_gem_object *obj)
>  {
> +       struct xe_bo *bo = gem_to_xe_bo(obj);
> +
>         /* Our BO reference counting scheme works as follows:
>          *
>          * The gem object kref is typically used throughout the driver,
> @@ -1709,8 +1713,9 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>          * driver ttm callbacks is allowed to use the ttm_buffer_object
>          * refcount directly if needed.
>          */
> -       __xe_bo_vunmap(gem_to_xe_bo(obj));
> -       ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> +       __xe_bo_vunmap(bo);
> +       obj_cgroup_put(bo->ttm.objcg);
> +       ttm_bo_put(&bo->ttm);
>  }
>
>  static void xe_gem_object_close(struct drm_gem_object *obj,
> @@ -1951,6 +1956,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>         placement = (type == ttm_bo_type_sg ||
>                      bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
>                 &bo->placement;
> +
> +       if (bo->flags & XE_BO_FLAG_ACCOUNTED)
> +               bo->ttm.objcg = get_obj_cgroup_from_current();
>         err = ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
>                                    placement, alignment,
>                                    &ctx, NULL, resv, xe_ttm_bo_destroy);
> @@ -2726,7 +2734,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>         if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
>                 return -EINVAL;
>
> -       bo_flags = 0;
> +       bo_flags = XE_BO_FLAG_ACCOUNTED;
>         if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
>                 bo_flags |= XE_BO_FLAG_DEFER_BACKING;
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6134d82e80554..e44fc58d9a00f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -48,6 +48,7 @@
>  #define XE_BO_FLAG_GGTT2               BIT(22)
>  #define XE_BO_FLAG_GGTT3               BIT(23)
>  #define XE_BO_FLAG_CPU_ADDR_MIRROR     BIT(24)
> +#define XE_BO_FLAG_ACCOUNTED           BIT(25)
>
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST       BIT(30)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 540f044bf4255..4db3227d65c04 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1266,7 +1266,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>         bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
>                    XE_BO_FLAG_GGTT_INVALIDATE;
>         if (vm && vm->xef) /* userspace */
> -               bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> +               bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE |
> +                           XE_BO_FLAG_ACCOUNTED;
>
>         lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>                                        ttm_bo_type_kernel,
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 5729e7d3e3356..569035630ffdf 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -885,7 +885,7 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>
>         bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
>                                   size, ttm_bo_type_kernel,
> -                                 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
> +                                 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT | XE_BO_FLAG_ACCOUNTED);
>         if (IS_ERR(bo))
>                 return PTR_ERR(bo);
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 330cc0f54a3f4..efcd54ab75e92 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -120,7 +120,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>                    XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>                    XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
>         if (vm->xef) /* userspace */
> -               bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> +               bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE |
> +                           XE_BO_FLAG_ACCOUNTED;
>
>         pt->level = level;
>         bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e8..fdf845bb717e0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -700,6 +700,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>         bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
>                                  ttm_bo_type_device,
>                                  (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> +                                XE_BO_FLAG_ACCOUNTED |
>                                  XE_BO_FLAG_CPU_ADDR_MIRROR);
>         if (IS_ERR(bo)) {
>                 err = PTR_ERR(bo);
>
