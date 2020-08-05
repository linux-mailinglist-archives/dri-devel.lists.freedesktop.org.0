Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202523C550
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421B96E4E6;
	Wed,  5 Aug 2020 05:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2286E4E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:54:49 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id q3so3737363ybp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qbnAEYDwuAnkoYSaLXCpup9tOA3d4Ii61es49ApNVUY=;
 b=Z7iB/x5xph6nXNMA3nt6mAgad7V2Ze/0PWIrY+FBsJeWBy+WKHe+M8t8yu5dRROcYU
 8ig3y0xTAJJ3m/tC2uZdCpPHRS1t3h2iDGhIsqYCC16g0qTFDJx1/Dg8fPyUDsEcnwdX
 wVGEGo329FsopLvOfb+GFip6LXDNTOdu+/w9KINsY1d3xkU+fsb1kUpRe22P1TgWPBx4
 C8DellLBO3MD0cQnMPDc8OWSfOiZLrCX/f0r2fE/HqrQqrCNGpOHwOJkp9zKgLLbKINR
 P50mgyIj7XrJiZHHkfi/Wm7Brs+Gyhb/orAsoYiWLyqmRCV1BhfFKQexJgS2sipdbFAP
 /jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qbnAEYDwuAnkoYSaLXCpup9tOA3d4Ii61es49ApNVUY=;
 b=dSjpyU4PfLvnpjYWzyfhaWR3GC0P7Kz9az5/W/j7rnaJrUbwXIplemYPlKSo1ckzOT
 K6vjoj/XTU+CE+5iPtDmGursdPnEsGsc1IA+wRDSpmiAgF1VXLrDvCCslO7lg7fljZ63
 t6/mGJrlPuarOsd7Mix/0JItfxNaaESdC6ORgghPpE3FS+XClDHKrv8/VZ3bIiRxX8rk
 g0jPLpyv9TAuFKU3HhgG6KlH47VLRCiyP9y89LsaMn2GfOqJ1Gi1o2iT5dMcG2o+HWHY
 vowaY+zXwfu15O968bAeaUJgOXn8qdMR3ftyfSvxDFcR9bOVkAwSpFDx2Z2UWKjMc1BF
 JLgA==
X-Gm-Message-State: AOAM531Jk66twHUFAj4dydRH0BOLas5nA7qyU1yUuZ83vwOL9evyNXmj
 bpLwxaCbgT17t7kBFbhla1paAhiTwU5R6NxA3cI=
X-Google-Smtp-Source: ABdhPJyin6SHCOjY32vJG5T9xU4UgRhX5+gw2ZvD/tbClJ7ecLhapjWhDhw1Sh0LIEDbipBeq3LXy8zgfjZbDUoMOrA=
X-Received: by 2002:a25:3803:: with SMTP id f3mr2311921yba.470.1596606887785; 
 Tue, 04 Aug 2020 22:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-54-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-54-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:54:36 +1000
Message-ID: <CACAvsv5WbDPhrOU57Dmo0aXQOdSDRPA8C-cAN_rJG4Bw7tjO6w@mail.gmail.com>
Subject: Re: [PATCH 53/59] drm/ttm: drop man->bdev link.
To: Dave Airlie <airlied@gmail.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 12:58, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This link isn't needed anymore, drop it from the init interface.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         | 6 ++----
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 6 ++----
>  drivers/gpu/drm/ttm/ttm_bo_manager.c          | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
>  include/drm/ttm/ttm_bo_api.h                  | 6 ++----
>  include/drm/ttm/ttm_bo_driver.h               | 2 --
>  9 files changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index b664c5cb13ce..9fc3d876ed38 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -108,7 +108,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>         man->available_caching = TTM_PL_MASK_CACHING;
>         man->default_caching = TTM_PL_FLAG_CACHED;
>
> -       ttm_mem_type_manager_init(&adev->mman.bdev, man, gtt_size >> PAGE_SHIFT);
> +       ttm_mem_type_manager_init(man, gtt_size >> PAGE_SHIFT);
>
>         start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>         size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index bbc528c0ed3e..684698cdf772 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -190,7 +190,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>         man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>         man->default_caching = TTM_PL_FLAG_WC;
>
> -       ttm_mem_type_manager_init(&adev->mman.bdev, man, adev->gmc.real_vram_size >> PAGE_SHIFT);
> +       ttm_mem_type_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
>
>         man->func = &amdgpu_vram_mgr_func;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 58d9bd708e95..d408e1485cce 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -175,7 +175,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>                 man->func = &nouveau_vram_manager;
>                 man->use_io_reserve_lru = true;
>
> -               ttm_mem_type_manager_init(&drm->ttm.bdev, man,
> +               ttm_mem_type_manager_init(man,
>                                           drm->gem.vram_available >> PAGE_SHIFT);
>                 ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>                 ttm_mem_type_manager_set_used(man, true);
> @@ -237,9 +237,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>         man->available_caching = available_caching;
>         man->default_caching = default_caching;
>         man->use_tt = true;
> -       ttm_mem_type_manager_init(&drm->ttm.bdev, man,
> -                                 size_pages);
> -
> +       ttm_mem_type_manager_init(man, size_pages);
>         ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>         ttm_mem_type_manager_set_used(man, true);
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3a3a4dfb0fff..78b72443a9ef 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1471,8 +1471,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>  }
>  EXPORT_SYMBOL(ttm_bo_evict_mm);
>
> -void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
> -                              struct ttm_mem_type_manager *man,
> +void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
>                                unsigned long p_size)
>  {
>         unsigned i;
> @@ -1482,7 +1481,6 @@ void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
>         mutex_init(&man->io_reserve_mutex);
>         spin_lock_init(&man->move_lock);
>         INIT_LIST_HEAD(&man->io_reserve_lru);
> -       man->bdev = bdev;
>         man->size = p_size;
>
>         for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> @@ -1595,7 +1593,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
>         man->available_caching = TTM_PL_MASK_CACHING;
>         man->default_caching = TTM_PL_FLAG_CACHED;
>
> -       ttm_mem_type_manager_init(bdev, man, 0);
> +       ttm_mem_type_manager_init(man, 0);
>         ttm_mem_type_manager_set_used(man, true);
>  }
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> index 01d41c6f2f7b..1b7245ce3356 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> @@ -133,7 +133,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
>
>         man->func = &ttm_bo_manager_func;
>
> -       ttm_mem_type_manager_init(bdev, man, p_size);
> +       ttm_mem_type_manager_init(man, p_size);
>
>         drm_mm_init(&rman->mm, 0, p_size);
>         spin_lock_init(&rman->lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index bc51b7773084..c3fa25161fd0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>         man->default_caching = TTM_PL_FLAG_CACHED;
>         /* TODO: This is most likely not correct */
>         man->use_tt = true;
> -       ttm_mem_type_manager_init(&dev_priv->bdev, man, 0);
> +       ttm_mem_type_manager_init(man, 0);
>         spin_lock_init(&gman->lock);
>         gman->used_gmr_pages = 0;
>         ida_init(&gman->gmr_ida);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 1cefd9c1e8ea..0b9c29249393 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -134,7 +134,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>         man->available_caching = TTM_PL_FLAG_CACHED;
>         man->default_caching = TTM_PL_FLAG_CACHED;
>
> -       ttm_mem_type_manager_init(&dev_priv->bdev, man,
> +       ttm_mem_type_manager_init(man,
>                                   dev_priv->vram_size >> PAGE_SHIFT);
>
>         drm_mm_init(&rman->mm, 0, man->size);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 9c55eafd0e7d..eb465e9ca0c1 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -536,14 +536,12 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>  /**
>   * ttm_mem_type_manager_init
>   *
> - * @bdev: Pointer to a ttm_bo_device struct.
>   * @man: memory manager object to init
>   * @p_size: size managed area in pages.
>   *
> - * Initialise core parts of a a manager object.
> + * Initialise core parts of a manager object.
>   */
> -void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
> -                              struct ttm_mem_type_manager *man,
> +void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
>                                unsigned long p_size);
>
>  /**
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index b477c1ad5c3e..bfd19400372f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -138,8 +138,6 @@ struct ttm_mem_type_manager_func {
>
>
>  struct ttm_mem_type_manager {
> -       struct ttm_bo_device *bdev;
> -
>         /*
>          * No protection. Constant from start.
>          */
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
