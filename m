Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD44D30D4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9BF10EACB;
	Wed,  9 Mar 2022 14:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CCD10EAD1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:10:17 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 17so1171126lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 06:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Smifyrfv9jyEVKFWKzabWjhSqV66oj/syrNkMX3RnQ=;
 b=XAGMDJQcpiWsweioTlr+pTKrcSdKllVXRIrC7VRDLVcT+kMBrFXcocSTau1OfrtUeV
 ioA1aekDdbZQHclCPbC8vyDNbAqTy8EkfpRS1Trj5nyfcZ4wBnd2uP+gFbd6oljQA6Td
 4yl2eHaYmZETNPGqIPJjiDhz44eGv6DFtJAwFZAww9mYwzwNfLD2jEUbMdftQPmSF4DP
 46UYssVBAgV/H67NAXwDW3ontoSLLGy54feUbo4FNxuA2jZdNZBkAAGi7uIiCyQAIfqW
 3RgxgFm6j0yimZ2l7lz3w6/CmH8AkuOkUp5ULE2WNgSXv5U7IsF3wO+39OVFkH+PHuEo
 aptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Smifyrfv9jyEVKFWKzabWjhSqV66oj/syrNkMX3RnQ=;
 b=ic8L1D5cLaRI/prbhDczOn/bGjW+l7k3it/ylhPNgP6rF+XFtCZ1cd6eTQlVxDLgQY
 OvfYVOECQVqIBYNn7Ox8DndWDzW+nAdGEm5sDqzHx1cgaMDHf3bxXd7pAI9Y+orRCMbV
 fZy9DqWhtB3V0BicmBuZBuy+4tnI0bDVbuWc7S1xwQYvGOn1vMSPwLP2+y5O39/RWQT6
 niZbVUSky+KjL6c0wbmCdaJaLCYvwJ+GGxyeS5fPhNKOhrCZh5yNmXis30DUIJIja5Xk
 eTQhvpUiZOWeGILInYARwu+Xe7UnBWRtwoU5momAbHTpnL074SKSGNMMFPucb62bV1hD
 HUcQ==
X-Gm-Message-State: AOAM5309J19b10ktiqmoTITdx5SHo9gb4kQJXoGIW5W1YwUo3+QYmPV/
 A13gzMH7L8p7M7y4Mgxl1/hXkwHWgmdtggmLwChMAA==
X-Google-Smtp-Source: ABdhPJy7V/OKyyaOwfjAPioqybsnIjE8c/Rj7tRt5tIDZdseT3VO6JNha7WxGFpeTx1rfRb7lhOdL1k3XYVyOCxwq24=
X-Received: by 2002:a2e:3004:0:b0:246:f56:e62d with SMTP id
 w4-20020a2e3004000000b002460f56e62dmr14102976ljw.6.1646835015337; Wed, 09 Mar
 2022 06:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-6-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-6-christian.koenig@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 9 Mar 2022 14:10:04 +0000
Message-ID: <CAHbf0-H=VtC3xDnUfNfFDf6c3xrqx3evrQyE0jsbnZ8pQWpCFw@mail.gmail.com>
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
Cc: thomas.hellstrom@linux.intel.com, Felix.Kuehling@amd.com,
 matthew.william.auld@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

This patch seems to be causing me problems

https://gitlab.freedesktop.org/drm/amd/-/issues/1927

There are 3 issues I'm experiencing, two kernel bugs and a mesa bug

Cheers

Mike

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
