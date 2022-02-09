Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4294AEE7E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A33610E58E;
	Wed,  9 Feb 2022 09:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4389410E58E;
 Wed,  9 Feb 2022 09:53:36 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id o10so1187537qkg.0;
 Wed, 09 Feb 2022 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oM4nXRsywOkUhOZRLzzJ7UtuxPYIdhcs8+ucNFGP2yY=;
 b=Pg1BIkHz+0cm3mwl5oo8/t3sn02plpXVL7cvLIhxEIVtNM+klYs9wwP+GetuKWL/DG
 k/9JdH2SjFQ4y6Ynzh4ktaKQc81++KTi9xr9/MTfxpHIuywbzumNRO/UsnI4WVwnfEzJ
 3+jy2JHnaxZ+HGPQcDE27hXeYA/sm+goHZQH1PVcOjyk2pGYbA911tusUpdo4JJnD1AE
 Z6mSxEffWuu6VsPgjieSsDkhStwJ235hk8x4Oa3qY7zmVFTRfiwPBjw3o09ZCELcN5rD
 IUzOQA+Cxj6vI6Rp+hsHaUwcQEIu3QuGNqaxKdz0BILJVnHvzhn4niGxfQ+Syk2AOuG9
 4HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oM4nXRsywOkUhOZRLzzJ7UtuxPYIdhcs8+ucNFGP2yY=;
 b=lOEMj+SylTdnQ3j4sWgYoNfCCpRn+54di8jk5iDlr91c/fH8GuOndwWggkq8g/3/wN
 LbzeRzCDfSD+0wSdJZ6MCpSWQ0UCzIPazzzKp8OLmtJjykK1vJhruWSiPW/FkVWA+f4r
 i6pZHlFnY2VAAyUG3i3rY3kKQySfSybad/2nEtGbEYmoga1rIsq8yTilHelmyxxsMA9k
 7BgYE6buFZ1i7qpwVNCqTiAKlN58uIJmwVGBBjXd/ex/iyrZR87T9PIK8A8LszGVmZse
 UfxMEBSV1yj2DhnOI8hHk/t4Moq0/05bwErglvSgNmawgPs+2vggfVL0jkm17ewMs1e3
 fz6A==
X-Gm-Message-State: AOAM533Q20/WFhYIpRIL178iFLaoLLLIwq+bl9s/QILXTDtKwZduI9R7
 rPOb31I5XuJT2TRzwfPzut9m0UBwWSPLUWX3I6/oXcsOLKc=
X-Google-Smtp-Source: ABdhPJzxIzp7H/2lOYewRRrEC2CRXPaz5Yg1hlBw6u8J8w7H4GyCVm2/xbJnjT5k9TtCGONX2De9bxtlsiER6vzBESw=
X-Received: by 2002:a05:620a:1a8d:: with SMTP id
 bl13mr574930qkb.569.1644400415212; 
 Wed, 09 Feb 2022 01:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20220209084059.1042345-1-christian.koenig@amd.com>
 <20220209084059.1042345-7-christian.koenig@amd.com>
In-Reply-To: <20220209084059.1042345-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 9 Feb 2022 09:53:08 +0000
Message-ID: <CAM0jSHOC-cLnzhUwf_fd0CcGmkOV0R+G4DVjhgw-p8n-nzuQow@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/amdgpu: remove VRAM accounting
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
 ML dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Feb 2022 at 08:41, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This is provided by TTM now.
>
> Also switch man->size to bytes instead of pages and fix the double
> printing of size and usage in debugfs.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c      |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c     |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 58 +++++++-------------
>  6 files changed, 31 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index e8440d306496..025748e9c772 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -314,7 +314,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct =
amdgpu_device *adev,
>         }
>
>         total_vram =3D adev->gmc.real_vram_size - atomic64_read(&adev->vr=
am_pin_size);
> -       used_vram =3D amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
> +       used_vram =3D ttm_resource_manager_usage(&adev->mman.vram_mgr.man=
ager);
>         free_vram =3D used_vram >=3D total_vram ? 0 : total_vram - used_v=
ram;
>
>         spin_lock(&adev->mm_stats.lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 9ff4aced5da7..0beab961b18b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -678,7 +678,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                 ui64 =3D atomic64_read(&adev->num_vram_cpu_page_faults);
>                 return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT =
: 0;
>         case AMDGPU_INFO_VRAM_USAGE:
> -               ui64 =3D amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
> +               ui64 =3D ttm_resource_manager_usage(&adev->mman.vram_mgr.=
manager);
>                 return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT =
: 0;
>         case AMDGPU_INFO_VIS_VRAM_USAGE:
>                 ui64 =3D amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
> @@ -717,6 +717,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                 struct drm_amdgpu_memory_info mem;
>                 struct ttm_resource_manager *gtt_man =3D
>                         &adev->mman.gtt_mgr.manager;
> +               struct ttm_resource_manager *vram_man =3D
> +                       &adev->mman.vram_mgr.manager;
>
>                 memset(&mem, 0, sizeof(mem));
>                 mem.vram.total_heap_size =3D adev->gmc.real_vram_size;
> @@ -724,7 +726,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                         atomic64_read(&adev->vram_pin_size) -
>                         AMDGPU_VM_RESERVED_VRAM;
>                 mem.vram.heap_usage =3D
> -                       amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
> +                       ttm_resource_manager_usage(vram_man);
>                 mem.vram.max_allocation =3D mem.vram.usable_heap_size * 3=
 / 4;
>
>                 mem.cpu_accessible_vram.total_heap_size =3D
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index d178fbec7048..5859ed0552a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1884,7 +1884,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdg=
pu_device *adev, bool enable)
>                 size =3D adev->gmc.real_vram_size;
>         else
>                 size =3D adev->gmc.visible_vram_size;
> -       man->size =3D size >> PAGE_SHIFT;
> +       man->size =3D size;
>         adev->mman.buffer_funcs_enabled =3D enable;
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index 120b69ec9885..cbee84a77331 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -44,7 +44,6 @@ struct amdgpu_vram_mgr {
>         spinlock_t lock;
>         struct list_head reservations_pending;
>         struct list_head reserved_pages;
> -       atomic64_t usage;
>         atomic64_t vis_usage;
>  };
>
> @@ -127,7 +126,6 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *a=
dev,
>  void amdgpu_vram_mgr_free_sgt(struct device *dev,
>                               enum dma_data_direction dir,
>                               struct sg_table *sgt);
> -uint64_t amdgpu_vram_mgr_usage(struct amdgpu_vram_mgr *mgr);
>  uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr);
>  int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>                                   uint64_t start, uint64_t size);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_virt.c
> index 07bc0f504713..3a25dd220786 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -575,8 +575,10 @@ static int amdgpu_virt_write_vf2pf_data(struct amdgp=
u_device *adev)
>         vf2pf_info->driver_cert =3D 0;
>         vf2pf_info->os_info.all =3D 0;
>
> -       vf2pf_info->fb_usage =3D amdgpu_vram_mgr_usage(&adev->mman.vram_m=
gr) >> 20;
> -       vf2pf_info->fb_vis_usage =3D amdgpu_vram_mgr_vis_usage(&adev->mma=
n.vram_mgr) >> 20;
> +       vf2pf_info->fb_usage =3D
> +               ttm_resource_manager_usage(&adev->mman.vram_mgr.manager) =
>> 20;
> +       vf2pf_info->fb_vis_usage =3D
> +               amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr) >> 20;
>         vf2pf_info->fb_size =3D adev->gmc.real_vram_size >> 20;
>         vf2pf_info->fb_vis_size =3D adev->gmc.visible_vram_size >> 20;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7442095f089c..e50fe25fbcb8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -96,9 +96,9 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct de=
vice *dev,
>  {
>         struct drm_device *ddev =3D dev_get_drvdata(dev);
>         struct amdgpu_device *adev =3D drm_to_adev(ddev);
> +       struct ttm_resource_manager *man =3D &adev->mman.vram_mgr.manager=
;
>
> -       return sysfs_emit(buf, "%llu\n",
> -                         amdgpu_vram_mgr_usage(&adev->mman.vram_mgr));
> +       return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man))=
;
>  }
>
>  /**
> @@ -253,7 +253,9 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_res=
ource_manager *man)
>
>                 vis_usage =3D amdgpu_vram_mgr_vis_size(adev, &rsv->mm_nod=
e);
>                 atomic64_add(vis_usage, &mgr->vis_usage);
> -               atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &mgr->usage=
);
> +               spin_lock(&man->bdev->lru_lock);
> +               man->usage +=3D rsv->mm_node.size << PAGE_SHIFT;
> +               spin_unlock(&man->bdev->lru_lock);
>                 list_move(&rsv->node, &mgr->reserved_pages);
>         }
>  }
> @@ -378,19 +380,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_=
manager *man,
>
>         lpfn =3D place->lpfn;
>         if (!lpfn)
> -               lpfn =3D man->size;
> +               lpfn =3D man->size >> PAGE_SHIFT;
>
>         max_bytes =3D adev->gmc.mc_vram_size;
>         if (tbo->type !=3D ttm_bo_type_kernel)
>                 max_bytes -=3D AMDGPU_VM_RESERVED_VRAM;
>
> -       /* bail out quickly if there's likely not enough VRAM for this BO=
 */
>         mem_bytes =3D tbo->base.size;
> -       if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
> -               r =3D -ENOSPC;
> -               goto error_sub;
> -       }
> -
>         if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>                 pages_per_node =3D ~0ul;
>                 num_nodes =3D 1;
> @@ -408,13 +404,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_=
manager *man,
>
>         node =3D kvmalloc(struct_size(node, mm_nodes, num_nodes),
>                         GFP_KERNEL | __GFP_ZERO);
> -       if (!node) {
> -               r =3D -ENOMEM;
> -               goto error_sub;
> -       }
> +       if (!node)
> +               return -ENOMEM;
>
>         ttm_resource_init(tbo, place, &node->base);
>
> +       /* bail out quickly if there's likely not enough VRAM for this BO=
 */
> +       if (ttm_resource_manager_usage(man) > max_bytes) {
> +               r =3D -ENOSPC;
> +               goto error_fini;
> +       }
> +
>         mode =3D DRM_MM_INSERT_BEST;
>         if (place->flags & TTM_PL_FLAG_TOPDOWN)
>                 mode =3D DRM_MM_INSERT_HIGH;
> @@ -472,11 +472,10 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_=
manager *man,
>         while (i--)
>                 drm_mm_remove_node(&node->mm_nodes[i]);
>         spin_unlock(&mgr->lock);
> +error_fini:
>         ttm_resource_fini(man, &node->base);
>         kvfree(node);
>
> -error_sub:
> -       atomic64_sub(mem_bytes, &mgr->usage);
>         return r;
>  }
>
> @@ -494,7 +493,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_m=
anager *man,
>         struct ttm_range_mgr_node *node =3D to_ttm_range_mgr_node(res);
>         struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
>         struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> -       uint64_t usage =3D 0, vis_usage =3D 0;
> +       uint64_t vis_usage =3D 0;
>         unsigned i, pages;
>
>         spin_lock(&mgr->lock);
> @@ -503,13 +502,11 @@ static void amdgpu_vram_mgr_del(struct ttm_resource=
_manager *man,
>                 struct drm_mm_node *mm =3D &node->mm_nodes[i];
>
>                 drm_mm_remove_node(mm);
> -               usage +=3D mm->size << PAGE_SHIFT;
>                 vis_usage +=3D amdgpu_vram_mgr_vis_size(adev, mm);
>         }
>         amdgpu_vram_mgr_do_reserve(man);
>         spin_unlock(&mgr->lock);
>
> -       atomic64_sub(usage, &mgr->usage);
>         atomic64_sub(vis_usage, &mgr->vis_usage);
>
>         ttm_resource_fini(man, res);
> @@ -627,18 +624,6 @@ void amdgpu_vram_mgr_free_sgt(struct device *dev,
>         kfree(sgt);
>  }
>
> -/**
> - * amdgpu_vram_mgr_usage - how many bytes are used in this domain
> - *
> - * @mgr: amdgpu_vram_mgr pointer
> - *
> - * Returns how many bytes are used in this domain.
> - */
> -uint64_t amdgpu_vram_mgr_usage(struct amdgpu_vram_mgr *mgr)
> -{
> -       return atomic64_read(&mgr->usage);
> -}
> -
>  /**
>   * amdgpu_vram_mgr_vis_usage - how many bytes are used in the visible pa=
rt
>   *
> @@ -664,13 +649,12 @@ static void amdgpu_vram_mgr_debug(struct ttm_resour=
ce_manager *man,
>  {
>         struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
>
> +       drm_printf(printer, "  vis usage:%llu\n",
> +                  amdgpu_vram_mgr_vis_usage(mgr));
> +
>         spin_lock(&mgr->lock);
>         drm_mm_print(&mgr->mm, printer);
>         spin_unlock(&mgr->lock);
> -
> -       drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis u=
sage:%lluMB\n",
> -                  man->size, amdgpu_vram_mgr_usage(mgr) >> 20,
> -                  amdgpu_vram_mgr_vis_usage(mgr) >> 20);
>  }
>
>  static const struct ttm_resource_manager_func amdgpu_vram_mgr_func =3D {
> @@ -692,11 +676,11 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev=
)
>         struct ttm_resource_manager *man =3D &mgr->manager;
>
>         ttm_resource_manager_init(man, &adev->mman.bdev,
> -                                 adev->gmc.real_vram_size >> PAGE_SHIFT)=
;
> +                                 adev->gmc.real_vram_size);

The kernel-doc for ttm_resource_manager_init() says that size is in
page units, should we tweak that to say that it's driver defined or
something?

Also amdgpu_bo_validate_size() looks like it is still expecting page
units for man->size? Perhaps I'm looking at the wrong tree.

>
>         man->func =3D &amdgpu_vram_mgr_func;
>
> -       drm_mm_init(&mgr->mm, 0, man->size);
> +       drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
>         spin_lock_init(&mgr->lock);
>         INIT_LIST_HEAD(&mgr->reservations_pending);
>         INIT_LIST_HEAD(&mgr->reserved_pages);
> --
> 2.25.1
>
