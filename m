Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D18ACE6AA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80D10E91C;
	Wed,  4 Jun 2025 22:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SssvpTtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111B910E91C;
 Wed,  4 Jun 2025 22:35:55 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-adb5cb6d8f1so60507166b.3; 
 Wed, 04 Jun 2025 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749076553; x=1749681353; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgQLb4SOHttsI1eeFitmuQgdYnSZ+mfOgqR9z02rcac=;
 b=SssvpTtPKtnQKR2qF0WbwtPxOXmAZf5MN2oeGpB1LX2e8NRgfYHQK4m1NUXJ8Th2NL
 i11lom0MiJ/uQl4nvCxkUV/0jSjXomaLNcAUq1yZWDIU5C1cP2lB/CHBf9yxuyM/yHxa
 wr/qAt7dSzVCKVetI/xsAwu88BXDyso4KihX+euIn45am9dbADw4d5pGmswL1lC/jnOL
 3eoqgieJLKmTBn3FXu5YBl0LaQM9Os4uHLDS22c+O46ksc/13FRIAuIDVskv3kaDd+E2
 sRj0yNxf4qLfyQ8IGDRhwCiadEecl5oC9pX27KKI1p/4QInaB22TErN5+j9aYJQ1dKBG
 IYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749076553; x=1749681353;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgQLb4SOHttsI1eeFitmuQgdYnSZ+mfOgqR9z02rcac=;
 b=CQDgOEskWVHKJcFwm5+WELNNGxtw1C8t2LkoosiFjbg9y1DW9lDrMKZmP0CN1hpFhc
 t4ygnCG9qji1RxyjO2USxnAO9a1kWsyiNCl0CMkaQJ/g+OA9BkAMB2eZc8Ex33Qllc01
 mtTAoPPptLFH3Z/nbRgCyoisZ7d/mKBPD70uwdQg5+79eEsQ2tzPqxtvS+KGCLWZSPaW
 EC2nDdnCDKhTDHF1zo+pz4P1clkM2nyareVHsl1ElOiRvvJJ17/5kb4SC0FMJEVQSQE+
 DV7tf5IvtqjjgOg2nJz+Umnb/+wprisDnSj/J64VsJs1/Ya7diIljOCcKDVHR93nGudd
 c9mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaWQq+4cebw8faRQmVthR9MESx8oKGTEqAXhQss0KdB1meoMaUVjwk7EgnpeudM4wTcIEcSxqZgKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8w0o9a+bKazZxp8deGmUXtID+20o5ftON0NFpAbRGynWf5cnW
 VZKwQcISqbmVSkusf3oFCAosE2Jm+eXWH6yJngpbsNWtPwCb2m//Q95VzTfr3PB+pvLYpd3H1U/
 yVFOw4Rtg3LOI06BvvcbW92T1mzZNjwhz33es
X-Gm-Gg: ASbGnctcsn2YG62DNmbP7Cca+6ncUFAQ6nGPUE4PKTg873IdDYpma/DqYSIQX/AIPbK
 EAak44RW6C0Uihbub+gh2IXnM97nSYt7vNZZssugdVV1bwOwiaicQcBiyxiVKpjd4NCRzORquop
 oqV6UXDDn1UqG/gTYMDFx6krXa9QjWR/Q=
X-Google-Smtp-Source: AGHT+IGQeG11nrjiLBMqvMSW7jcg+fuohQcLGSFWuw298JY4o14iJOHIDlxEv9CXGoWbotiBfhc1HNZNu1eCB9J8w+s=
X-Received: by 2002:a17:906:7315:b0:ad8:8efe:31fb with SMTP id
 a640c23a62f3a-addf8ff40f9mr453018966b.54.1749076552871; Wed, 04 Jun 2025
 15:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250521194831.314835-1-airlied@gmail.com>
In-Reply-To: <20250521194831.314835-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Jun 2025 08:35:40 +1000
X-Gm-Features: AX0GCFtYi9Y30qyb3j6qdN1L2bQx8u8OOCrnB6-vhom8y4gJ267oefwfjdMkLqk
Message-ID: <CAPM=9tzGqNQhGgZj-yNRcM751bR8bF4yigX1i26iH8pY28m5sA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: don't store the xe device pointer inside xe_ttm_tt
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

Just realised I hadn't cc'ed some people.

ping,

Dave.

On Thu, 22 May 2025 at 05:48, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This device pointer is nearly always available without storing
> an extra copy for each tt in the system.
>
> Just noticed this while reading over the xe shrinker code.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c |  4 +--
>  drivers/gpu/drm/xe/xe_bo.c       | 59 ++++++++++++++++----------------
>  2 files changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 378dcd0fb414..77ca1ab527ec 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -514,9 +514,9 @@ static int shrink_test_run_device(struct xe_device *xe)
>                  * other way around, they may not be subject to swapping...
>                  */
>                 if (alloced < purgeable) {
> -                       xe_ttm_tt_account_subtract(&xe_tt->ttm);
> +                       xe_ttm_tt_account_subtract(xe, &xe_tt->ttm);
>                         xe_tt->purgeable = true;
> -                       xe_ttm_tt_account_add(&xe_tt->ttm);
> +                       xe_ttm_tt_account_add(xe, &xe_tt->ttm);
>                         bo->ttm.priority = 0;
>                         spin_lock(&bo->ttm.bdev->lru_lock);
>                         ttm_bo_move_to_lru_tail(&bo->ttm);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..4074e6f64fd0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -336,15 +336,13 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  /* struct xe_ttm_tt - Subclassed ttm_tt for xe */
>  struct xe_ttm_tt {
>         struct ttm_tt ttm;
> -       /** @xe - The xe device */
> -       struct xe_device *xe;
>         struct sg_table sgt;
>         struct sg_table *sg;
>         /** @purgeable: Whether the content of the pages of @ttm is purgeable. */
>         bool purgeable;
>  };
>
> -static int xe_tt_map_sg(struct ttm_tt *tt)
> +static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
>  {
>         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>         unsigned long num_pages = tt->num_pages;
> @@ -359,13 +357,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>         ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
>                                                 num_pages, 0,
>                                                 (u64)num_pages << PAGE_SHIFT,
> -                                               xe_sg_segment_size(xe_tt->xe->drm.dev),
> +                                               xe_sg_segment_size(xe->drm.dev),
>                                                 GFP_KERNEL);
>         if (ret)
>                 return ret;
>
>         xe_tt->sg = &xe_tt->sgt;
> -       ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
> +       ret = dma_map_sgtable(xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
>                               DMA_ATTR_SKIP_CPU_SYNC);
>         if (ret) {
>                 sg_free_table(xe_tt->sg);
> @@ -376,12 +374,12 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>         return 0;
>  }
>
> -static void xe_tt_unmap_sg(struct ttm_tt *tt)
> +static void xe_tt_unmap_sg(struct xe_device *xe, struct ttm_tt *tt)
>  {
>         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>
>         if (xe_tt->sg) {
> -               dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> +               dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
>                                   DMA_BIDIRECTIONAL, 0);
>                 sg_free_table(xe_tt->sg);
>                 xe_tt->sg = NULL;
> @@ -400,24 +398,24 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
>   * Account ttm pages against the device shrinker's shrinkable and
>   * purgeable counts.
>   */
> -static void xe_ttm_tt_account_add(struct ttm_tt *tt)
> +static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
>  {
>         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>
>         if (xe_tt->purgeable)
> -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
> +               xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
>         else
> -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
> +               xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0);
>  }
>
> -static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
> +static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
>  {
>         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>
>         if (xe_tt->purgeable)
> -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
> +               xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
>         else
> -               xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
> +               xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>  }
>
>  static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> @@ -436,7 +434,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>                 return NULL;
>
>         tt = &xe_tt->ttm;
> -       xe_tt->xe = xe;
>
>         extra_pages = 0;
>         if (xe_bo_needs_ccs_pages(bo))
> @@ -527,21 +524,23 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>                 return err;
>
>         xe_tt->purgeable = false;
> -       xe_ttm_tt_account_add(tt);
> +       xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
>
>         return 0;
>  }
>
>  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  {
> +       struct xe_device *xe = ttm_to_xe_device(ttm_dev);
> +
>         if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
>             !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
>                 return;
>
> -       xe_tt_unmap_sg(tt);
> +       xe_tt_unmap_sg(xe, tt);
>
>         ttm_pool_free(&ttm_dev->pool, tt);
> -       xe_ttm_tt_account_subtract(tt);
> +       xe_ttm_tt_account_subtract(xe, tt);
>  }
>
>  static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> @@ -789,7 +788,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>         /* Bo creation path, moving to system or TT. */
>         if ((!old_mem && ttm) && !handle_system_ccs) {
>                 if (new_mem->mem_type == XE_PL_TT)
> -                       ret = xe_tt_map_sg(ttm);
> +                       ret = xe_tt_map_sg(xe, ttm);
>                 if (!ret)
>                         ttm_bo_move_null(ttm_bo, new_mem);
>                 goto out;
> @@ -812,7 +811,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>                 (!ttm && ttm_bo->type == ttm_bo_type_device);
>
>         if (new_mem->mem_type == XE_PL_TT) {
> -               ret = xe_tt_map_sg(ttm);
> +               ret = xe_tt_map_sg(xe, ttm);
>                 if (ret)
>                         goto out;
>         }
> @@ -973,7 +972,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>                 if (timeout < 0)
>                         ret = timeout;
>
> -               xe_tt_unmap_sg(ttm_bo->ttm);
> +               xe_tt_unmap_sg(xe, ttm_bo->ttm);
>         }
>
>         return ret;
> @@ -983,6 +982,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
>                                struct ttm_buffer_object *bo,
>                                unsigned long *scanned)
>  {
> +       struct xe_device *xe = ttm_to_xe_device(bo->bdev);
>         long lret;
>
>         /* Fake move to system, without copying data. */
> @@ -997,7 +997,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
>                 if (lret)
>                         return lret;
>
> -               xe_tt_unmap_sg(bo->ttm);
> +               xe_tt_unmap_sg(xe, bo->ttm);
>                 ttm_bo_move_null(bo, new_resource);
>         }
>
> @@ -1008,7 +1008,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
>                               .allow_move = false});
>
>         if (lret > 0)
> -               xe_ttm_tt_account_subtract(bo->ttm);
> +               xe_ttm_tt_account_subtract(xe, bo->ttm);
>
>         return lret;
>  }
> @@ -1039,7 +1039,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>         struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>         struct ttm_place place = {.mem_type = bo->resource->mem_type};
>         struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
> -       struct xe_device *xe = xe_tt->xe;
> +       struct xe_device *xe = ttm_to_xe_device(bo->bdev);
>         bool needs_rpm;
>         long lret = 0L;
>
> @@ -1076,7 +1076,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>                 xe_pm_runtime_put(xe);
>
>         if (lret > 0)
> -               xe_ttm_tt_account_subtract(tt);
> +               xe_ttm_tt_account_subtract(xe, tt);
>
>  out_unref:
>         xe_bo_put(xe_bo);
> @@ -1377,7 +1377,8 @@ int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
>                         ttm_bo->sg = NULL;
>                         xe_tt->sg = NULL;
>                 } else if (xe_tt->sg) {
> -                       dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> +                       dma_unmap_sgtable(ttm_to_xe_device(ttm_bo->bdev)->drm.dev,
> +                                         xe_tt->sg,
>                                           DMA_BIDIRECTIONAL, 0);
>                         sg_free_table(xe_tt->sg);
>                         xe_tt->sg = NULL;
> @@ -2289,7 +2290,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
>
>         ttm_bo_pin(&bo->ttm);
>         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> -               xe_ttm_tt_account_subtract(bo->ttm.ttm);
> +               xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
>
>         /*
>          * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -2337,7 +2338,7 @@ int xe_bo_pin(struct xe_bo *bo)
>
>         ttm_bo_pin(&bo->ttm);
>         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> -               xe_ttm_tt_account_subtract(bo->ttm.ttm);
> +               xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
>
>         /*
>          * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -2373,7 +2374,7 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>
>         ttm_bo_unpin(&bo->ttm);
>         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> -               xe_ttm_tt_account_add(bo->ttm.ttm);
> +               xe_ttm_tt_account_add(xe, bo->ttm.ttm);
>
>         /*
>          * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -2405,7 +2406,7 @@ void xe_bo_unpin(struct xe_bo *bo)
>         }
>         ttm_bo_unpin(&bo->ttm);
>         if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> -               xe_ttm_tt_account_add(bo->ttm.ttm);
> +               xe_ttm_tt_account_add(xe, bo->ttm.ttm);
>  }
>
>  /**
> --
> 2.49.0
>
