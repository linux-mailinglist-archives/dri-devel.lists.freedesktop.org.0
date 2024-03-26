Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D588C43F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96010EFE3;
	Tue, 26 Mar 2024 14:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ES+pj+oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311510EFCE;
 Tue, 26 Mar 2024 14:01:28 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso2913349a12.3; 
 Tue, 26 Mar 2024 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711461688; x=1712066488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKHbOayjeFBZ6lOHDJayZyXPOUyeP5Z/4g4vBIkZaa8=;
 b=ES+pj+oacggUcOmzugENwN9HOQWjYS7z6lthbUkfcGrHpL5t17aZpuclNGK0m6H8By
 fA/XiROTahLk2eal/XzmX3zGjAUORkzW4BCqfzRDvoiunRC/EdCNHI5dJebuMdYWuiZN
 zkpOt0pYiFn7UURvaDcv2FV8HfdRgrB9egAh+h8Iup0PAOlRMb1Kb9K88RP0qY0fN1Vd
 JA01FF1JAFLa5EblAEE9mmzgA6qfOM7i6JvWj/3yDpUsia1kYoLP8tsd0mF1bFh/4c+h
 OPzgIq8k0LSpgpKBIp7vQW8WlyXR2veAvLLGlV7J8R+LJ8evk3slg30SWIkw/LTL0o3T
 iCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711461688; x=1712066488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKHbOayjeFBZ6lOHDJayZyXPOUyeP5Z/4g4vBIkZaa8=;
 b=Wq5vP68v0YNLN/DyDQF1Z2K1efTpiFykORXTbKxw8aDBjbwVPfH1aSNdDOtUOL8jOT
 L50d0GS0JV+2WlRxKUNPBfJ/9rfNcp15aONq9NS3StlKfC8ZSyAuoGrsdNpkhMsSYgBz
 LDLTeYTsfNQqIVgEsTXlbxNxkOucvKfZ3g06/TGWCcjCdgZ/rvj59QOkn6OnpsZ384Px
 5dSUmtgwbghPBzu5SCCS7pHRZbKMYLuOisxf8VCkna0i/kvEof8crCdtq3z8+XEMrvcQ
 H4908ink9hf+90wQ/iC5rn/YON/1IuRGvd2Rquz9uXX5nH9OdRSEY+ECKFZMQXCOhEJQ
 gLcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdwn6o2xq8Gy+4kZDuYPqCYq+OslRQAMfpBv4azS8CWh+A4X7T1om8Pz3xRlF4B7UYHJFWn3HthWloIeoOIPp010/v00uFGbqyj7EB8A==
X-Gm-Message-State: AOJu0YwlsLLVeuHbNbLSTWME+CwrC4Sd14zKvXbvwzl+YDjWIiCbJlKh
 ppwW9wg8BajGgydMZ0o/aGwqiwZg6B0aFtQrbB3Gx5Cu/NUDpm6ijaKywi3LI65sOAEAfUdBQJn
 d9YurxVVrlsxfgcwvNiqZzuiwB5w=
X-Google-Smtp-Source: AGHT+IG3Qxpt5azc63NNGHPpWOQAWC9R7cCg9lfdNNOY5+P4NQjtKPs6UN9hZNR6GworlsrNqFVov4p1RJpxJU2Q+XE=
X-Received: by 2002:a17:90a:a083:b0:2a0:3050:17ba with SMTP id
 r3-20020a17090aa08300b002a0305017bamr8349313pjp.38.1711461686281; Tue, 26 Mar
 2024 07:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
 <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
In-Reply-To: <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Mar 2024 10:01:13 -0400
Message-ID: <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 christian.koenig@amd.com, alexander.deucher@amd.com, matthew.auld@intel.com, 
 mario.limonciello@amd.com, felix.kuehling@amd.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 26, 2024 at 9:59=E2=80=AFAM Paneer Selvam, Arunpravin
<arunpravin.paneerselvam@amd.com> wrote:
>
> Hi Alex,
>
> On 3/26/2024 7:08 PM, Alex Deucher wrote:
> > On Mon, Mar 18, 2024 at 5:47=E2=80=AFPM Arunpravin Paneer Selvam
> > <Arunpravin.PaneerSelvam@amd.com> wrote:
> >> Add clear page support in vram memory region.
> >>
> >> v1(Christian):
> >>    - Dont handle clear page as TTM flag since when moving the BO back
> >>      in from GTT again we don't need that.
> >>    - Make a specialized version of amdgpu_fill_buffer() which only
> >>      clears the VRAM areas which are not already cleared
> >>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
> >>      amdgpu_object.c
> >>
> >> v2:
> >>    - Modify the function name amdgpu_ttm_* (Alex)
> >>    - Drop the delayed parameter (Christian)
> >>    - handle amdgpu_res_cleared(&cursor) just above the size
> >>      calculation (Christian)
> >>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffe=
rs
> >>      in the free path to properly wait for fences etc.. (Christian)
> >>
> >> v3(Christian):
> >>    - Remove buffer clear code in VRAM manager instead change the
> >>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
> >>      the DRM_BUDDY_CLEARED flag.
> >>    - Remove ! from amdgpu_res_cleared(&cursor) check.
> >>
> >> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.c=
om>
> >> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
> >>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 +++++++++++++++++=
+-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
> >>   6 files changed, 111 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c
> >> index 8bc79924d171..c92d92b28a57 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> @@ -39,6 +39,7 @@
> >>   #include "amdgpu.h"
> >>   #include "amdgpu_trace.h"
> >>   #include "amdgpu_amdkfd.h"
> >> +#include "amdgpu_vram_mgr.h"
> >>
> >>   /**
> >>    * DOC: amdgpu_object
> >> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
> >>          if (!amdgpu_bo_support_uswc(bo->flags))
> >>                  bo->flags &=3D ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
> >>
> >> -       if (adev->ras_enabled)
> >> -               bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> >> +       bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> >>
> >>          bo->tbo.bdev =3D &adev->mman.bdev;
> >>          if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_O=
A |
> >> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
> >>
> >>          if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
> >>              bo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM) {
> >> -               struct dma_fence *fence;
> >> +               struct dma_fence *fence =3D NULL;
> >>
> >> -               r =3D amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fe=
nce, true);
> >> +               r =3D amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &=
fence);
> >>                  if (unlikely(r))
> >>                          goto fail_unreserve;
> >>
> >> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
> >> -                                  DMA_RESV_USAGE_KERNEL);
> >> -               dma_fence_put(fence);
> >> +               if (fence) {
> >> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
> >> +                                          DMA_RESV_USAGE_KERNEL);
> >> +                       dma_fence_put(fence);
> >> +               }
> >>          }
> >>          if (!bp->resv)
> >>                  amdgpu_bo_unreserve(bo);
> >> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer=
_object *bo)
> >>          if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
> >>                  return;
> >>
> >> -       r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &f=
ence, true);
> >> +       r =3D amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
> >>          if (!WARN_ON(r)) {
> >> +               struct amdgpu_vram_mgr_resource *vres;
> >> +
> >> +               vres =3D to_amdgpu_vram_mgr_resource(bo->resource);
> >> +               vres->flags |=3D DRM_BUDDY_CLEARED;
> >>                  amdgpu_bo_fence(abo, fence, false);
> >>                  dma_fence_put(fence);
> >>          }
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> >> index 381101d2bf05..50fcd86e1033 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> >> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_=
res_cursor *cur, uint64_t size)
> >>          }
> >>   }
> >>
> >> +/**
> >> + * amdgpu_res_cleared - check if blocks are cleared
> >> + *
> >> + * @cur: the cursor to extract the block
> >> + *
> >> + * Check if the @cur block is cleared
> >> + */
> >> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> >> +{
> >> +       struct drm_buddy_block *block;
> >> +
> >> +       switch (cur->mem_type) {
> >> +       case TTM_PL_VRAM:
> >> +               block =3D cur->node;
> >> +
> >> +               if (!amdgpu_vram_mgr_is_cleared(block))
> >> +                       return false;
> >> +               break;
> >> +       default:
> >> +               return false;
> >> +       }
> >> +
> >> +       return true;
> >> +}
> >> +
> >>   #endif
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c
> >> index 8722beba494e..bcbffe909b47 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_ob=
ject *bo,
> >>              (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
> >>                  struct dma_fence *wipe_fence =3D NULL;
> >>
> >> -               r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wi=
pe_fence,
> >> -                                       false);
> >> +               r =3D amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> >> +                                      false);
> >>                  if (r) {
> >>                          goto error;
> >>                  } else if (wipe_fence) {
> >> +                       struct amdgpu_vram_mgr_resource *vres;
> >> +
> >> +                       vres =3D to_amdgpu_vram_mgr_resource(bo->resou=
rce);
> >> +                       vres->flags |=3D DRM_BUDDY_CLEARED;
> >>                          dma_fence_put(fence);
> >>                          fence =3D wipe_fence;
> >>                  }
> >> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ri=
ng *ring, uint32_t src_data,
> >>          return 0;
> >>   }
> >>
> >> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> >> +                           struct dma_resv *resv,
> >> +                           struct dma_fence **fence)
> >> +{
> >> +       struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> >> +       struct amdgpu_ring *ring =3D adev->mman.buffer_funcs_ring;
> >> +       struct amdgpu_res_cursor cursor;
> >> +       struct dma_fence *f =3D NULL;
> >> +       u64 addr;
> >> +       int r;
> >> +
> >> +       if (!adev->mman.buffer_funcs_enabled)
> >> +               return -EINVAL;
> >> +
> >> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cur=
sor);
> >> +
> >> +       mutex_lock(&adev->mman.gtt_window_lock);
> >> +       while (cursor.remaining) {
> >> +               struct dma_fence *next =3D NULL;
> >> +               u64 size;
> >> +
> >> +               if (amdgpu_res_cleared(&cursor)) {
> >> +                       amdgpu_res_next(&cursor, cursor.size);
> >> +                       continue;
> >> +               }
> >> +
> >> +               /* Never clear more than 256MiB at once to avoid timeo=
uts */
> >> +               size =3D min(cursor.size, 256ULL << 20);
> >> +
> >> +               r =3D amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource=
, &cursor,
> >> +                                         1, ring, false, &size, &addr=
);
> >> +               if (r)
> >> +                       goto err;
> >> +
> >> +               r =3D amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> >> +                                       &next, true, true);
> >> +               if (r)
> >> +                       goto err;
> >> +
> >> +               dma_fence_put(f);
> >> +               f =3D next;
> >> +
> >> +               amdgpu_res_next(&cursor, size);
> >> +       }
> >> +err:
> >> +       mutex_unlock(&adev->mman.gtt_window_lock);
> >> +       if (fence)
> >> +               *fence =3D dma_fence_get(f);
> >> +       dma_fence_put(f);
> >> +
> >> +       return r;
> >> +}
> >> +
> >>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> >>                          uint32_t src_data,
> >>                          struct dma_resv *resv,
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.h
> >> index 65ec82141a8e..b404d89d52e5 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> >> @@ -38,8 +38,6 @@
> >>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
> >>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
> >>
> >> -#define AMDGPU_POISON  0xd0bed0be
> >> -
> >>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
> >>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> >>
> >> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_devic=
e *adev,
> >>                                 uint64_t size, bool tmz,
> >>                                 struct dma_resv *resv,
> >>                                 struct dma_fence **f);
> >> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> >> +                           struct dma_resv *resv,
> >> +                           struct dma_fence **fence);
> >>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> >>                          uint32_t src_data,
> >>                          struct dma_resv *resv,
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> index c0c851409241..e494f5bf136a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> >> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource=
_manager *man,
> >>   {
> >>          struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
> >>          struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> >> +       struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(tbo);
> >>          u64 vis_usage =3D 0, max_bytes, min_block_size;
> >>          struct amdgpu_vram_mgr_resource *vres;
> >>          u64 size, remaining_size, lpfn, fpfn;
> >> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource=
_manager *man,
> >>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> >>                  vres->flags |=3D DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> >>
> >> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> >> +               vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> > Is there any reason to not always do this?
> Here we are trying to keep a pool of cleared memory which are cleared on
> free path and that can given
> to the application which requires a zeroed memory. I think here if we
> set always clear the memory,
> we would go over the limit of cleared memory in that particular instance
> and the application should wait until
> the hardware clears the memory and this might impact the overall
> performance.

I'd like to have the driver always deliver cleared memory.

Alex

>
> Thanks,
> Arun.
> >
> > Alex
> >
> >
> >> +
> >>          if (fpfn || lpfn !=3D mgr->mm.size)
> >>                  /* Allocate blocks in desired range */
> >>                  vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> >> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resourc=
e_manager *man,
> >>
> >>          amdgpu_vram_mgr_do_reserve(man);
> >>
> >> -       drm_buddy_free_list(mm, &vres->blocks, 0);
> >> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >>          mutex_unlock(&mgr->lock);
> >>
> >>          atomic64_sub(vis_usage, &mgr->vis_usage);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_vram_mgr.h
> >> index 0e04e42cf809..8478522d7366 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> >> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct=
 drm_buddy_block *block)
> >>          return (u64)PAGE_SIZE << drm_buddy_block_order(block);
> >>   }
> >>
> >> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block =
*block)
> >> +{
> >> +       return drm_buddy_block_is_clear(block);
> >> +}
> >> +
> >>   static inline struct amdgpu_vram_mgr_resource *
> >>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
> >>   {
> >> --
> >> 2.25.1
> >>
>
