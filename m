Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CF4B4CC1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB9D10E54F;
	Mon, 14 Feb 2022 11:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700510E54F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:00:12 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id d7so14415108qvk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PWTey/ASCzrl8lIwtr+IReb8M1kLImhQELg3GYcnAfg=;
 b=HYgj/1MxpM28rZgkoYH/eosbLo/yeXTWVvZY+kj9YHQ1Oc8Y2YmGTVnxpDoqXhLISO
 Z9WDFheWZtvaC3QlMlty+VYNqYC2gnrcX1EVp1cIyi3m4FWkiGFgQzfxnbAzRvBNXDQn
 H4pDHNgDLBS10nUZRYU7yqds0UcFvDjvUIH2trtX6+VZKdkXuFc0EvZWEtkRk6fm/yyo
 KRBdnbkzwgTWcArYKoNkm1ZmPs4rY8a97swTQ77sT8GCboW+gpw5XjmFvllubgKBgHp7
 MgFPOZGT6xlLT9f2fYgjrNv3cuTHzP1AefwDer5P+erhuEcDpdpeDHOXW0cjp/3RCKHQ
 Ff2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PWTey/ASCzrl8lIwtr+IReb8M1kLImhQELg3GYcnAfg=;
 b=0caKmHyFfjugUXCeeZyrEm1chv0+utiVTaCFo8h8tJWNOOZ2P0EM4F9q6gjf2Nu64n
 TYlF5A2FTM/FFh3MliGJ0D2Aqc1ndEuMqM04joYWZJxntDbYPzL0rkSTVviCdJcvhE4o
 /JT4ELM9vgXE39Zmlsr5IEUw+4WZdIqnziELuCkjKIg0g3oYWDFkGtsRwhJNo+xH7Npn
 bCkBZQ0duFywFU2E7udKMopdpHniHz4tr5lyBwBRAoQ88iW4/51vYwdz4NuP++MDtPcy
 d6CpFTFJB8ZGHPt2Mx4Cx4dWsjWJp0v4OHRG246UC0IIstLl3a44AIo5hsmf5QyncaAr
 gHcw==
X-Gm-Message-State: AOAM532qpl9rfXfoMkWeTW31MA/gW6RqjDIRDM8IWK0zO1SzMsFY2Y9g
 wHmur7HVOvpr4+hwNV5aOTRKq/2vO2YNfrX57vo=
X-Google-Smtp-Source: ABdhPJyE4BDUnS5lIM36QSYEkPVc94kqn7036WeiuGmUI+W3LkbUsGU+CTNXxzfRBsBmEUWuEnPDPGvIGT1lwe+rsZ8=
X-Received: by 2002:ad4:4ee9:: with SMTP id dv9mr8865519qvb.41.1644836411092; 
 Mon, 14 Feb 2022 03:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-5-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-5-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 10:59:44 +0000
Message-ID: <CAM0jSHNtKnTDZddn9aPkuwZNETK_x86RCfaZkJhNQekvqQ+YgA@mail.gmail.com>
Subject: Re: [PATCH 05/11] drm/radeon: remove resource accounting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Use the one provided by TTM instead.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/radeon/radeon.h        |  2 --
>  drivers/gpu/drm/radeon/radeon_kms.c    |  7 ++++--
>  drivers/gpu/drm/radeon/radeon_object.c | 30 +++-----------------------
>  drivers/gpu/drm/radeon/radeon_object.h |  1 -
>  drivers/gpu/drm/radeon/radeon_ttm.c    | 18 ++--------------
>  5 files changed, 10 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index 895776c421d4..08f83bf2c330 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2462,8 +2462,6 @@ struct radeon_device {
>         struct radeon_vm_manager        vm_manager;
>         struct mutex                    gpu_clock_mutex;
>         /* memory stats */
> -       atomic64_t                      vram_usage;
> -       atomic64_t                      gtt_usage;
>         atomic64_t                      num_bytes_moved;
>         atomic_t                        gpu_reset_counter;
>         /* ACPI interface */
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon=
/radeon_kms.c
> index 11ad210919c8..965161b8565b 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -241,6 +241,7 @@ int radeon_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>         struct drm_radeon_info *info =3D data;
>         struct radeon_mode_info *minfo =3D &rdev->mode_info;
>         uint32_t *value, value_tmp, *value_ptr, value_size;
> +       struct ttm_resource_manager *man;
>         uint64_t value64;
>         struct drm_crtc *crtc;
>         int i, found;
> @@ -550,12 +551,14 @@ int radeon_info_ioctl(struct drm_device *dev, void =
*data, struct drm_file *filp)
>         case RADEON_INFO_VRAM_USAGE:
>                 value =3D (uint32_t*)&value64;
>                 value_size =3D sizeof(uint64_t);
> -               value64 =3D atomic64_read(&rdev->vram_usage);
> +               man =3D ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
> +               value64 =3D ttm_resource_manager_usage(man);
>                 break;
>         case RADEON_INFO_GTT_USAGE:
>                 value =3D (uint32_t*)&value64;
>                 value_size =3D sizeof(uint64_t);
> -               value64 =3D atomic64_read(&rdev->gtt_usage);
> +               man =3D ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
> +               value64 =3D ttm_resource_manager_usage(man);
>                 break;
>         case RADEON_INFO_ACTIVE_CU_COUNT:
>                 if (rdev->family >=3D CHIP_BONAIRE)
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/rad=
eon/radeon_object.c
> index 56ede9d63b12..c9bbed2a25ad 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -49,27 +49,6 @@ static void radeon_bo_clear_surface_reg(struct radeon_=
bo *bo);
>   * function are calling it.
>   */
>
> -static void radeon_update_memory_usage(struct ttm_buffer_object *bo,
> -                                      unsigned int mem_type, int sign)
> -{
> -       struct radeon_device *rdev =3D radeon_get_rdev(bo->bdev);
> -
> -       switch (mem_type) {
> -       case TTM_PL_TT:
> -               if (sign > 0)
> -                       atomic64_add(bo->base.size, &rdev->gtt_usage);
> -               else
> -                       atomic64_sub(bo->base.size, &rdev->gtt_usage);
> -               break;
> -       case TTM_PL_VRAM:
> -               if (sign > 0)
> -                       atomic64_add(bo->base.size, &rdev->vram_usage);
> -               else
> -                       atomic64_sub(bo->base.size, &rdev->vram_usage);
> -               break;
> -       }
> -}
> -
>  static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>  {
>         struct radeon_bo *bo;
> @@ -434,7 +413,9 @@ void radeon_bo_fini(struct radeon_device *rdev)
>  static u64 radeon_bo_get_threshold_for_moves(struct radeon_device *rdev)
>  {
>         u64 real_vram_size =3D rdev->mc.real_vram_size;
> -       u64 vram_usage =3D atomic64_read(&rdev->vram_usage);
> +       struct ttm_resource_manager *man =3D
> +               ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
> +       u64 vram_usage =3D ttm_resource_manager_usage(man);
>
>         /* This function is based on the current VRAM usage.
>          *
> @@ -725,15 +706,10 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bo=
ol has_moved,
>  }
>
>  void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -                          unsigned int old_type,
>                            struct ttm_resource *new_mem)

new_mem looks to also be unused now?

>  {
>         struct radeon_bo *rbo;
>
> -       radeon_update_memory_usage(bo, old_type, -1);
> -       if (new_mem)
> -               radeon_update_memory_usage(bo, new_mem->mem_type, 1);
> -
>         if (!radeon_ttm_bo_is_radeon_bo(bo))
>                 return;
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/rad=
eon/radeon_object.h
> index 1afc7992ef91..0b64e202577b 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -161,7 +161,6 @@ extern void radeon_bo_get_tiling_flags(struct radeon_=
bo *bo,
>  extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>                                 bool force_drop);
>  extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -                                 unsigned int old_type,
>                                   struct ttm_resource *new_mem);
>  extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_objec=
t *bo);
>  extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 0d1283cdc8fb..ae09a91a486a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>         struct ttm_resource *old_mem =3D bo->resource;
>         struct radeon_device *rdev;
>         struct radeon_bo *rbo;
> -       int r, old_type;
> +       int r;
>
>         if (new_mem->mem_type =3D=3D TTM_PL_TT) {
>                 r =3D radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
> @@ -216,9 +216,6 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>         if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
>                 return -EINVAL;
>
> -       /* Save old type for statistics update */
> -       old_type =3D old_mem->mem_type;
> -
>         rdev =3D radeon_get_rdev(bo->bdev);
>         if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D NULL=
) {
>                 ttm_bo_move_null(bo, new_mem);
> @@ -264,7 +261,7 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  out:
>         /* update statistics */
>         atomic64_add(bo->base.size, &rdev->num_bytes_moved);
> -       radeon_bo_move_notify(bo, old_type, new_mem);
> +       radeon_bo_move_notify(bo, new_mem);
>         return 0;
>  }
>
> @@ -679,16 +676,6 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device =
*rdev,
>         return !!(gtt->userflags & RADEON_GEM_USERPTR_READONLY);
>  }
>
> -static void
> -radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
> -{
> -       unsigned int old_type =3D TTM_PL_SYSTEM;
> -
> -       if (bo->resource)
> -               old_type =3D bo->resource->mem_type;
> -       radeon_bo_move_notify(bo, old_type, NULL);

Can we really drop the entire move_notify() here? It looks like it
does more than just accounting?

Otherwise changes look mechanical,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> -}
> -
>  static struct ttm_device_funcs radeon_bo_driver =3D {
>         .ttm_tt_create =3D &radeon_ttm_tt_create,
>         .ttm_tt_populate =3D &radeon_ttm_tt_populate,
> @@ -697,7 +684,6 @@ static struct ttm_device_funcs radeon_bo_driver =3D {
>         .eviction_valuable =3D ttm_bo_eviction_valuable,
>         .evict_flags =3D &radeon_evict_flags,
>         .move =3D &radeon_bo_move,
> -       .delete_mem_notify =3D &radeon_bo_delete_mem_notify,
>         .io_mem_reserve =3D &radeon_ttm_io_mem_reserve,
>  };
>
> --
> 2.25.1
>
