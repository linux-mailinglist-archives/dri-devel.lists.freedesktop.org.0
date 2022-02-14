Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50F4B4CD3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD410E159;
	Mon, 14 Feb 2022 11:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1610E159
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:11:00 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id b35so14001376qkp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qAZx/9h5Evpv0WlKPboGldOY6/EgsMmfYnD1geFBOXc=;
 b=GNAMsm05F5nEsJJKj9DwTYsAQqTJr10qm6h2nubZhd0vbTuST/Uxd7MC2aUXCj/DZH
 Isw+QYtaLRt8Gwt6Hqpjrvh2PO1g7/hCi9cyIUS8SHv6wO6kclKddU9nv43mDxtCVtam
 oOaRODNl1h2OYrEmZR8SrcBL2VANsPSUs2bBVwibbZVPfuek8NYBgyusTV+NCJeqmxp7
 O1RX4yHRZna/3TUppSJZ24SPgJ0+e/PknymV4BqFwWu/qvx5KS6lfXVR8Jw4Eb5mUDu6
 a257hCyW5vGv/2itgHCXPRAo0w80cfiHU/Xga16+8i9mdo+Tl7EOs+HSIlK3K46TRpMj
 mkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qAZx/9h5Evpv0WlKPboGldOY6/EgsMmfYnD1geFBOXc=;
 b=g5vdrpZiou0oSk/X333OcDJBeVNOfRqAqjc/xTgCDnU2i371H/K5k1wLs949kV6W9j
 HF+EnaVTmfEn63LILYjvQWv8I3kZSg3dNUx5xqyOyqqEUz4uJy3BBwP2sJIDpsQXYLvr
 K64ZL4UeRMTpfU1/EjX3d60xMBwG1XgXni+Un698rYu1LPI7Qp1An+u+7kVywjW1T7LO
 Ggt88eQkdEAPAHpvNlfsUbQ/eb5j27OxRnzUJt08taqo3++lPe5twLdjLqXo3euzM0ox
 s+wVWvDhMoqAYSyylwbXYBOCizxhyrbVFaRqnz5FtHL4brJr2aKrE0BnslDkvomNSWc0
 KHfA==
X-Gm-Message-State: AOAM532Mo36E+PJFQ1uCIsrRr8NuJ0GjrJvgXMEXSsuk6w7POwmlDqS/
 xOM3X7kj5icjoOspYddJgoNsSIfMH0Fm4JonDBs=
X-Google-Smtp-Source: ABdhPJzYU8zJOZslGJ4X3W8S32jISQJsfp6mzWfuf/iO1xClsZAN23qyiS8RttReWKJEprpyupzE0PFY+Zhm/TiwmEs=
X-Received: by 2002:ae9:e211:: with SMTP id c17mr205038qkc.7.1644837059828;
 Mon, 14 Feb 2022 03:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-6-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-6-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 11:10:33 +0000
Message-ID: <CAM0jSHMGb940wgBdddrS7DZL7XKPEzDi7xPmM-Nb5cfYqqtM7Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/amdgpu: remove GTT accounting v2
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
> This is provided by TTM now.
>
> Also switch man->size to bytes instead of pages and fix the double
> printing of size and usage in debugfs.
>
> v2: fix size checking as well
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 +++++----------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  8 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 -
>  4 files changed, 16 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gtt_mgr.c
> index e0c7fbe01d93..3bcd27ae379d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -60,7 +60,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct de=
vice *dev,
>         struct ttm_resource_manager *man;
>
>         man =3D ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> -       return sysfs_emit(buf, "%llu\n", man->size * PAGE_SIZE);
> +       return sysfs_emit(buf, "%llu\n", man->size);
>  }
>
>  /**
> @@ -77,8 +77,9 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct dev=
ice *dev,
>  {
>         struct drm_device *ddev =3D dev_get_drvdata(dev);
>         struct amdgpu_device *adev =3D drm_to_adev(ddev);
> +       struct ttm_resource_manager *man =3D &adev->mman.gtt_mgr.manager;
>
> -       return sysfs_emit(buf, "%llu\n", amdgpu_gtt_mgr_usage(&adev->mman=
.gtt_mgr));
> +       return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man))=
;
>  }
>
>  static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
> @@ -130,20 +131,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_m=
anager *man,
>         struct amdgpu_gtt_node *node;
>         int r;
>
> -       if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> -           atomic64_add_return(num_pages, &mgr->used) >  man->size) {
> -               atomic64_sub(num_pages, &mgr->used);

I guess this behaviour is now slightly different, since TEMPORARY will
now get accounted like everything else. Hopefully that is not a
concern.

Otherwise seems mechanical,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> -               return -ENOSPC;
> -       }
> -
>         node =3D kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL)=
;
> -       if (!node) {
> -               r =3D -ENOMEM;
> -               goto err_out;
> -       }
> +       if (!node)
> +               return -ENOMEM;
>
>         node->tbo =3D tbo;
>         ttm_resource_init(tbo, place, &node->base.base);
> +       if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> +           ttm_resource_manager_usage(man) > man->size) {
> +               r =3D -ENOSPC;
> +               goto err_free;
> +       }
>
>         if (place->lpfn) {
>                 spin_lock(&mgr->lock);
> @@ -169,11 +167,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_ma=
nager *man,
>  err_free:
>         ttm_resource_fini(man, &node->base.base);
>         kfree(node);
> -
> -err_out:
> -       if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
> -               atomic64_sub(num_pages, &mgr->used);
> -
>         return r;
>  }
>
> @@ -196,25 +189,10 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_=
manager *man,
>                 drm_mm_remove_node(&node->base.mm_nodes[0]);
>         spin_unlock(&mgr->lock);
>
> -       if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
> -               atomic64_sub(res->num_pages, &mgr->used);
> -
>         ttm_resource_fini(man, res);
>         kfree(node);
>  }
>
> -/**
> - * amdgpu_gtt_mgr_usage - return usage of GTT domain
> - *
> - * @mgr: amdgpu_gtt_mgr pointer
> - *
> - * Return how many bytes are used in the GTT domain
> - */
> -uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr)
> -{
> -       return atomic64_read(&mgr->used) * PAGE_SIZE;
> -}
> -
>  /**
>   * amdgpu_gtt_mgr_recover - re-init gart
>   *
> @@ -260,9 +238,6 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_=
manager *man,
>         spin_lock(&mgr->lock);
>         drm_mm_print(&mgr->mm, printer);
>         spin_unlock(&mgr->lock);
> -
> -       drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n"=
,
> -                  man->size, atomic64_read(&mgr->used));
>  }
>
>  static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func =3D {
> @@ -288,14 +263,12 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev,=
 uint64_t gtt_size)
>         man->use_tt =3D true;
>         man->func =3D &amdgpu_gtt_mgr_func;
>
> -       ttm_resource_manager_init(man, &adev->mman.bdev,
> -                                 gtt_size >> PAGE_SHIFT);
> +       ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>
>         start =3D AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_=
WINDOWS;
>         size =3D (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>         drm_mm_init(&mgr->mm, start, size);
>         spin_lock_init(&mgr->lock);
> -       atomic64_set(&mgr->used, 0);
>
>         ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager=
);
>         ttm_resource_manager_set_used(man, true);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 1ebb91db2274..9ff4aced5da7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -684,7 +684,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                 ui64 =3D amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
>                 return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT =
: 0;
>         case AMDGPU_INFO_GTT_USAGE:
> -               ui64 =3D amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
> +               ui64 =3D ttm_resource_manager_usage(&adev->mman.gtt_mgr.m=
anager);
>                 return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT =
: 0;
>         case AMDGPU_INFO_GDS_CONFIG: {
>                 struct drm_amdgpu_info_gds gds_info;
> @@ -716,7 +716,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>         case AMDGPU_INFO_MEMORY: {
>                 struct drm_amdgpu_memory_info mem;
>                 struct ttm_resource_manager *gtt_man =3D
> -                       ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> +                       &adev->mman.gtt_mgr.manager;
> +
>                 memset(&mem, 0, sizeof(mem));
>                 mem.vram.total_heap_size =3D adev->gmc.real_vram_size;
>                 mem.vram.usable_heap_size =3D adev->gmc.real_vram_size -
> @@ -741,8 +742,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                 mem.gtt.total_heap_size *=3D PAGE_SIZE;
>                 mem.gtt.usable_heap_size =3D mem.gtt.total_heap_size -
>                         atomic64_read(&adev->gart_pin_size);
> -               mem.gtt.heap_usage =3D
> -                       amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
> +               mem.gtt.heap_usage =3D ttm_resource_manager_usage(gtt_man=
);
>                 mem.gtt.max_allocation =3D mem.gtt.usable_heap_size * 3 /=
 4;
>
>                 return copy_to_user(out, &mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 5661b82d84d4..514754142f69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -451,7 +451,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_dev=
ice *adev,
>         if (domain & AMDGPU_GEM_DOMAIN_GTT) {
>                 man =3D ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
>
> -               if (size < (man->size << PAGE_SHIFT))
> +               if (size < man->size)
>                         return true;
>                 else
>                         goto fail;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index f8f48be16d80..120b69ec9885 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -52,7 +52,6 @@ struct amdgpu_gtt_mgr {
>         struct ttm_resource_manager manager;
>         struct drm_mm mm;
>         spinlock_t lock;
> -       atomic64_t used;
>  };
>
>  struct amdgpu_preempt_mgr {
> @@ -114,7 +113,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
>  void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
>
>  bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem);
> -uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr);
>  int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr);
>
>  uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man);
> --
> 2.25.1
>
