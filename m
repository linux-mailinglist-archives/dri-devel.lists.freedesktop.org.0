Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6170808DB8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7753210E927;
	Thu,  7 Dec 2023 16:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089110E927;
 Thu,  7 Dec 2023 16:46:16 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1fa26074783so763554fac.1; 
 Thu, 07 Dec 2023 08:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701967575; x=1702572375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qhxN638Oq89dtoHWzvso5iUp/vyK6u6hdBP426dbQk=;
 b=GLx4NQrAOkTOEysCrOsBBsut9OvWzbx6cIXLKc2FWqVqV5jA7hjNC+Px5qv429arYu
 0qQlkMddf1QCA21YCHpEHbhHdWuWxMvQFt5F6DxiEBVN0+TpmhwLY8db3zUoWh8OIv7j
 cpQmG9Y57xQVxYXonxrQBgRvO8XAgCYVQruYq7EasHgXCEhk4q5Mstw9ZkX9CzlwfJf4
 rjEcwzFt11tyBkYU/qhmyCVz/AGyE952WVHYQEJlX0aHsmJmIbyxNAkH7uhoiiauVkSo
 8/u8Jdn90Tv9QPdFvHKRLqnemEvybV7ryUEm73EQj0h/O9VsCRolMghUBIKf8QyWTLms
 p4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701967575; x=1702572375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qhxN638Oq89dtoHWzvso5iUp/vyK6u6hdBP426dbQk=;
 b=eY5iws1ICs/96EEhg63lT6hQsovClyISf6dw5tnxJb+9Nllw7o7eqzGAGcMF62vWtQ
 E8DSsoKIzTPqGXBcS/fRqyBgOr/1owyGqb7JnMu8V08URb86mubeAyr28FmcEMhN6rU1
 BsPJogf35tX6eHFFFxz3rj16mvvI3WUioqEC/dtiTpppn3VJV6c8LHqKPNAqSpIlUeIf
 dKL9u4lEpbDX37ABN4Kz0gzZW9qwnH+VdXLCQVmt0IK6q789+SaSvKFPda/8jNv0yr6s
 8km54MmBrG9GqSd1go3z3t8dMWJGtTHIIm8DLVemyJOPbDA2U+IW3yz1oeT4yH+nSKQ7
 kBzQ==
X-Gm-Message-State: AOJu0YyZtDp3XMLCBlfOX99FH7PSqCBLDmKLHkfP2ROG2bLs/vak+THZ
 ci9HfXTJbPPD5VKOXnfY++85H5ggb9TBnTPVaYoKaOGQ
X-Google-Smtp-Source: AGHT+IFVFWHbEXX2+2H4HNUF8DXogj+TzNZybrL4oWCdX3QCCFvb8mhTgp+WBiVKdihVu+YBUmNAJej9qja+LJTjXsM=
X-Received: by 2002:a05:6870:9690:b0:1fb:75a:de65 with SMTP id
 o16-20020a056870969000b001fb075ade65mr3357758oaq.83.1701967575238; Thu, 07
 Dec 2023 08:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Dec 2023 11:46:03 -0500
Message-ID: <CADnq5_O7Hxw8JipFmgDhqTSfAD9y=zRJXMRVeowm-EVBRxHDVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 7, 2023 at 10:12=E2=80=AFAM Arunpravin Paneer Selvam
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> Add clear page support in vram memory region.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 +++--
>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 50 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>  6 files changed, 105 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index cef920a93924..bc4ea87f8b5e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -39,6 +39,7 @@
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_amdkfd.h"
> +#include "amdgpu_vram_mgr.h"
>
>  /**
>   * DOC: amdgpu_object
> @@ -629,15 +630,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>
>         if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>             bo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM) {
> -               struct dma_fence *fence;
> +               struct dma_fence *fence =3D NULL;
>
> -               r =3D amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence=
, true);
> +               r =3D amdgpu_clear_buffer(bo, bo->tbo.base.resv, &fence, =
true);
>                 if (unlikely(r))
>                         goto fail_unreserve;
>
> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
> -                                  DMA_RESV_USAGE_KERNEL);
> -               dma_fence_put(fence);
> +               if (fence) {
> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
> +                                          DMA_RESV_USAGE_KERNEL);
> +                       dma_fence_put(fence);
> +               }
>         }
>         if (!bp->resv)
>                 amdgpu_bo_unreserve(bo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 381101d2bf05..50fcd86e1033 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res=
_cursor *cur, uint64_t size)
>         }
>  }
>
> +/**
> + * amdgpu_res_cleared - check if blocks are cleared
> + *
> + * @cur: the cursor to extract the block
> + *
> + * Check if the @cur block is cleared
> + */
> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> +{
> +       struct drm_buddy_block *block;
> +
> +       switch (cur->mem_type) {
> +       case TTM_PL_VRAM:
> +               block =3D cur->node;
> +
> +               if (!amdgpu_vram_mgr_is_cleared(block))
> +                       return false;
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 05991c5c8ddb..6d7514e8f40c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2222,6 +2222,56 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring =
*ring, uint32_t src_data,
>         return 0;
>  }
>
> +int amdgpu_clear_buffer(struct amdgpu_bo *bo,

amdgpu_ttm_clear_buffer() for naming consistency.

Alex

> +                       struct dma_resv *resv,
> +                       struct dma_fence **fence,
> +                       bool delayed)
> +{
> +       struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> +       struct amdgpu_ring *ring =3D adev->mman.buffer_funcs_ring;
> +       struct amdgpu_res_cursor cursor;
> +       struct dma_fence *f =3D NULL;
> +       u64 addr;
> +       int r;
> +
> +       if (!adev->mman.buffer_funcs_enabled)
> +               return -EINVAL;
> +
> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor=
);
> +
> +       mutex_lock(&adev->mman.gtt_window_lock);
> +       while (cursor.remaining) {
> +               struct dma_fence *next =3D NULL;
> +               u64 size;
> +
> +               /* Never clear more than 256MiB at once to avoid timeouts=
 */
> +               size =3D min(cursor.size, 256ULL << 20);
> +
> +               if (!amdgpu_res_cleared(&cursor)) {
> +                       r =3D amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.res=
ource, &cursor,
> +                                                 1, ring, false, &size, =
&addr);
> +                       if (r)
> +                               goto err;
> +
> +                       r =3D amdgpu_ttm_fill_mem(ring, 0, addr, size, re=
sv,
> +                                               &next, true, delayed);
> +                       if (r)
> +                               goto err;
> +               }
> +               dma_fence_put(f);
> +               f =3D next;
> +
> +               amdgpu_res_next(&cursor, size);
> +       }
> +err:
> +       mutex_unlock(&adev->mman.gtt_window_lock);
> +       if (fence)
> +               *fence =3D dma_fence_get(f);
> +       dma_fence_put(f);
> +
> +       return r;
> +}
> +
>  int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>                         uint32_t src_data,
>                         struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index 65ec82141a8e..838251166883 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -155,6 +155,10 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device =
*adev,
>                                uint64_t size, bool tmz,
>                                struct dma_resv *resv,
>                                struct dma_fence **f);
> +int amdgpu_clear_buffer(struct amdgpu_bo *bo,
> +                       struct dma_resv *resv,
> +                       struct dma_fence **fence,
> +                       bool delayed);
>  int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>                         uint32_t src_data,
>                         struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.c
> index d0e199cc8f17..ff74c324b5b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_ma=
nager *man,
>  {
>         struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
>         struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> +       struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(tbo);
>         u64 vis_usage =3D 0, max_bytes, min_block_size;
>         struct amdgpu_vram_mgr_resource *vres;
>         u64 size, remaining_size, lpfn, fpfn;
> @@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_ma=
nager *man,
>         if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>                 vres->flags |=3D DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>
> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> +               vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> +
>         if (fpfn || lpfn !=3D mgr->mm.size)
>                 /* Allocate blocks in desired range */
>                 vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> @@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_m=
anager *man,
>         struct amdgpu_vram_mgr_resource *vres =3D to_amdgpu_vram_mgr_reso=
urce(res);
>         struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
>         struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> +       struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(res->bo);
>         struct drm_buddy *mm =3D &mgr->mm;
> +       struct dma_fence *fence =3D NULL;
>         struct drm_buddy_block *block;
>         uint64_t vis_usage =3D 0;
>
> @@ -589,7 +595,13 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_=
manager *man,
>
>         amdgpu_vram_mgr_do_reserve(man);
>
> -       drm_buddy_free_list(mm, &vres->blocks, 0);
> +       /* Clear all the blocks in free path */
> +       if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
> +               vres->flags |=3D DRM_BUDDY_CLEARED;
> +               dma_fence_put(fence);
> +       }
> +
> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>         mutex_unlock(&mgr->lock);
>
>         atomic64_sub(vis_usage, &mgr->vis_usage);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.h
> index 0e04e42cf809..8478522d7366 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct dr=
m_buddy_block *block)
>         return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>  }
>
> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *bl=
ock)
> +{
> +       return drm_buddy_block_is_clear(block);
> +}
> +
>  static inline struct amdgpu_vram_mgr_resource *
>  to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>  {
> --
> 2.25.1
>
