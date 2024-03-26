Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C288C5EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8D10E8CD;
	Tue, 26 Mar 2024 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJIxNQqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CAE10E8CD;
 Tue, 26 Mar 2024 14:54:06 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-29df0ca87d1so4661537a91.2; 
 Tue, 26 Mar 2024 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711464846; x=1712069646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjenLDQzUR2Yf5JbL5Wp5AkOAX3hSsM8HA7LGrjGCmg=;
 b=ZJIxNQqhG+RyWASjtpe17cVzA9g8CI4ebks6mpgoSG3PThPvjVMdz8bLWqJ50RGfbZ
 jazToDG6llhV1fs/v430gf4q1afTTXQbPK1aKVatHLdHPPQRV+iQlVdB4lKYLH8PlwSw
 L74tDZQXsQwEdO3hHgdOnVtxAAJ/pEGXyX5VrgfVzmEO4qRXOVBgabqJ6yVAvXo8KyNX
 Bk5aNvosb0y8sKrudYxqxrwd5Qt3waFX0Pl8gmlnv9n5dRTXUnCwzfhpV3ZUoKKU90Od
 YwrVsvxCddbb7sMWR2UGsJXEQ54bH/gSnSjQzp7rIE6GXwQtZ19aycsGsZnOnJo1aRax
 zFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711464846; x=1712069646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjenLDQzUR2Yf5JbL5Wp5AkOAX3hSsM8HA7LGrjGCmg=;
 b=sup5OVyZLET/x+IyLGbTLH76V5PmmmL0iOFzeg4QbWbiiMlPBCK4dRz2G4YV8vojAp
 Syp7CXIoyhgQFa3eolVSSNQHbiDDhDmt/xmyWwE1G/Zn4mt2Krdz3f0RR9v/fAvjyiCy
 3M8nvG+bPuhwnQ1WsZ/Tf4gfoB8yUj1RxI5cKRuvIjs7K3sBjdtblAdyTwQkgJ2aOMTq
 dBfmNTfVONJRbqCXaIcOFyBCepnEmEkMk82WhWviBLJUcDiYYNtgW237yjF4dZDUE2cN
 embOiYyQTX6lZUE3PjJRb1voH61O7RvYgbEneiW4SzMhIw9MTaNfam4jMQqxEA4srRIm
 nkzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlBYhCV70eQO/9IP4iqS9Aay/wMTX7oi0XPs/XWLre7jQy80FPlwD98QPZxhAmTqfbXe9X/tFFVZ2V1jO2mjqFl6cKMhpXCM8Kf76Zow==
X-Gm-Message-State: AOJu0YwEOBoCeMzLLLyv8ZnDbDKolZUZCk238K/1Ap4C8v65T6P5hxkQ
 1RM222q0G8RkarORHJRx6Jyu+ORIPxOOUZvHKnWZG7J20U1uyumqsDC8p/3cY40mfNnokkx+Ztv
 U7BQV06UJUu3UuFnahFUpvzQ+UbY=
X-Google-Smtp-Source: AGHT+IEXhp6bjt8po72/Hoawgq6iR9flLFahaprGofIIDMIgkMIjxs9NA2v+vWjYEuiGyowTmoQ2bHyea5eUiAlRvsg=
X-Received: by 2002:a17:90b:3d8b:b0:2a0:1720:f5dc with SMTP id
 pq11-20020a17090b3d8b00b002a01720f5dcmr65725pjb.9.1711464845861; Tue, 26 Mar
 2024 07:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
 <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
 <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
In-Reply-To: <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Mar 2024 10:53:53 -0400
Message-ID: <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
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

On Tue, Mar 26, 2024 at 10:01=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Tue, Mar 26, 2024 at 9:59=E2=80=AFAM Paneer Selvam, Arunpravin
> <arunpravin.paneerselvam@amd.com> wrote:
> >
> > Hi Alex,
> >
> > On 3/26/2024 7:08 PM, Alex Deucher wrote:
> > > On Mon, Mar 18, 2024 at 5:47=E2=80=AFPM Arunpravin Paneer Selvam
> > > <Arunpravin.PaneerSelvam@amd.com> wrote:
> > >> Add clear page support in vram memory region.
> > >>
> > >> v1(Christian):
> > >>    - Dont handle clear page as TTM flag since when moving the BO bac=
k
> > >>      in from GTT again we don't need that.
> > >>    - Make a specialized version of amdgpu_fill_buffer() which only
> > >>      clears the VRAM areas which are not already cleared
> > >>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
> > >>      amdgpu_object.c
> > >>
> > >> v2:
> > >>    - Modify the function name amdgpu_ttm_* (Alex)
> > >>    - Drop the delayed parameter (Christian)
> > >>    - handle amdgpu_res_cleared(&cursor) just above the size
> > >>      calculation (Christian)
> > >>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buf=
fers
> > >>      in the free path to properly wait for fences etc.. (Christian)
> > >>
> > >> v3(Christian):
> > >>    - Remove buffer clear code in VRAM manager instead change the
> > >>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
> > >>      the DRM_BUDDY_CLEARED flag.
> > >>    - Remove ! from amdgpu_res_cleared(&cursor) check.
> > >>
> > >> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd=
.com>
> > >> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
> > >>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 +++++++++++++++=
+++-
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
> > >>   6 files changed, 111 insertions(+), 13 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_object.c
> > >> index 8bc79924d171..c92d92b28a57 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > >> @@ -39,6 +39,7 @@
> > >>   #include "amdgpu.h"
> > >>   #include "amdgpu_trace.h"
> > >>   #include "amdgpu_amdkfd.h"
> > >> +#include "amdgpu_vram_mgr.h"
> > >>
> > >>   /**
> > >>    * DOC: amdgpu_object
> > >> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
> > >>          if (!amdgpu_bo_support_uswc(bo->flags))
> > >>                  bo->flags &=3D ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
> > >>
> > >> -       if (adev->ras_enabled)
> > >> -               bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEAS=
E;
> > >> +       bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> > >>
> > >>          bo->tbo.bdev =3D &adev->mman.bdev;
> > >>          if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN=
_OA |
> > >> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *ade=
v,
> > >>
> > >>          if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
> > >>              bo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM) {
> > >> -               struct dma_fence *fence;
> > >> +               struct dma_fence *fence =3D NULL;
> > >>
> > >> -               r =3D amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &=
fence, true);
> > >> +               r =3D amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv,=
 &fence);
> > >>                  if (unlikely(r))
> > >>                          goto fail_unreserve;
> > >>
> > >> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
> > >> -                                  DMA_RESV_USAGE_KERNEL);
> > >> -               dma_fence_put(fence);
> > >> +               if (fence) {
> > >> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
> > >> +                                          DMA_RESV_USAGE_KERNEL);
> > >> +                       dma_fence_put(fence);
> > >> +               }
> > >>          }
> > >>          if (!bp->resv)
> > >>                  amdgpu_bo_unreserve(bo);
> > >> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buff=
er_object *bo)
> > >>          if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
> > >>                  return;
> > >>
> > >> -       r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, =
&fence, true);
> > >> +       r =3D amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true=
);
> > >>          if (!WARN_ON(r)) {
> > >> +               struct amdgpu_vram_mgr_resource *vres;
> > >> +
> > >> +               vres =3D to_amdgpu_vram_mgr_resource(bo->resource);
> > >> +               vres->flags |=3D DRM_BUDDY_CLEARED;
> > >>                  amdgpu_bo_fence(abo, fence, false);
> > >>                  dma_fence_put(fence);
> > >>          }
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > >> index 381101d2bf05..50fcd86e1033 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > >> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgp=
u_res_cursor *cur, uint64_t size)
> > >>          }
> > >>   }
> > >>
> > >> +/**
> > >> + * amdgpu_res_cleared - check if blocks are cleared
> > >> + *
> > >> + * @cur: the cursor to extract the block
> > >> + *
> > >> + * Check if the @cur block is cleared
> > >> + */
> > >> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur=
)
> > >> +{
> > >> +       struct drm_buddy_block *block;
> > >> +
> > >> +       switch (cur->mem_type) {
> > >> +       case TTM_PL_VRAM:
> > >> +               block =3D cur->node;
> > >> +
> > >> +               if (!amdgpu_vram_mgr_is_cleared(block))
> > >> +                       return false;
> > >> +               break;
> > >> +       default:
> > >> +               return false;
> > >> +       }
> > >> +
> > >> +       return true;
> > >> +}
> > >> +
> > >>   #endif
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_ttm.c
> > >> index 8722beba494e..bcbffe909b47 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > >> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_=
object *bo,
> > >>              (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) =
{
> > >>                  struct dma_fence *wipe_fence =3D NULL;
> > >>
> > >> -               r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &=
wipe_fence,
> > >> -                                       false);
> > >> +               r =3D amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> > >> +                                      false);
> > >>                  if (r) {
> > >>                          goto error;
> > >>                  } else if (wipe_fence) {
> > >> +                       struct amdgpu_vram_mgr_resource *vres;
> > >> +
> > >> +                       vres =3D to_amdgpu_vram_mgr_resource(bo->res=
ource);
> > >> +                       vres->flags |=3D DRM_BUDDY_CLEARED;
> > >>                          dma_fence_put(fence);
> > >>                          fence =3D wipe_fence;
> > >>                  }
> > >> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_=
ring *ring, uint32_t src_data,
> > >>          return 0;
> > >>   }
> > >>
> > >> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> > >> +                           struct dma_resv *resv,
> > >> +                           struct dma_fence **fence)
> > >> +{
> > >> +       struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev)=
;
> > >> +       struct amdgpu_ring *ring =3D adev->mman.buffer_funcs_ring;
> > >> +       struct amdgpu_res_cursor cursor;
> > >> +       struct dma_fence *f =3D NULL;
> > >> +       u64 addr;
> > >> +       int r;
> > >> +
> > >> +       if (!adev->mman.buffer_funcs_enabled)
> > >> +               return -EINVAL;
> > >> +
> > >> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &c=
ursor);
> > >> +
> > >> +       mutex_lock(&adev->mman.gtt_window_lock);
> > >> +       while (cursor.remaining) {
> > >> +               struct dma_fence *next =3D NULL;
> > >> +               u64 size;
> > >> +
> > >> +               if (amdgpu_res_cleared(&cursor)) {
> > >> +                       amdgpu_res_next(&cursor, cursor.size);
> > >> +                       continue;
> > >> +               }
> > >> +
> > >> +               /* Never clear more than 256MiB at once to avoid tim=
eouts */
> > >> +               size =3D min(cursor.size, 256ULL << 20);
> > >> +
> > >> +               r =3D amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resour=
ce, &cursor,
> > >> +                                         1, ring, false, &size, &ad=
dr);
> > >> +               if (r)
> > >> +                       goto err;
> > >> +
> > >> +               r =3D amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> > >> +                                       &next, true, true);
> > >> +               if (r)
> > >> +                       goto err;
> > >> +
> > >> +               dma_fence_put(f);
> > >> +               f =3D next;
> > >> +
> > >> +               amdgpu_res_next(&cursor, size);
> > >> +       }
> > >> +err:
> > >> +       mutex_unlock(&adev->mman.gtt_window_lock);
> > >> +       if (fence)
> > >> +               *fence =3D dma_fence_get(f);
> > >> +       dma_fence_put(f);
> > >> +
> > >> +       return r;
> > >> +}
> > >> +
> > >>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> > >>                          uint32_t src_data,
> > >>                          struct dma_resv *resv,
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_ttm.h
> > >> index 65ec82141a8e..b404d89d52e5 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > >> @@ -38,8 +38,6 @@
> > >>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
> > >>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
> > >>
> > >> -#define AMDGPU_POISON  0xd0bed0be
> > >> -
> > >>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
> > >>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> > >>
> > >> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_dev=
ice *adev,
> > >>                                 uint64_t size, bool tmz,
> > >>                                 struct dma_resv *resv,
> > >>                                 struct dma_fence **f);
> > >> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> > >> +                           struct dma_resv *resv,
> > >> +                           struct dma_fence **fence);
> > >>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> > >>                          uint32_t src_data,
> > >>                          struct dma_resv *resv,
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > >> index c0c851409241..e494f5bf136a 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > >> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resour=
ce_manager *man,
> > >>   {
> > >>          struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
> > >>          struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> > >> +       struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(tbo);
> > >>          u64 vis_usage =3D 0, max_bytes, min_block_size;
> > >>          struct amdgpu_vram_mgr_resource *vres;
> > >>          u64 size, remaining_size, lpfn, fpfn;
> > >> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resour=
ce_manager *man,
> > >>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> > >>                  vres->flags |=3D DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> > >>
> > >> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> > >> +               vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> > > Is there any reason to not always do this?
> > Here we are trying to keep a pool of cleared memory which are cleared o=
n
> > free path and that can given
> > to the application which requires a zeroed memory. I think here if we
> > set always clear the memory,
> > we would go over the limit of cleared memory in that particular instanc=
e
> > and the application should wait until
> > the hardware clears the memory and this might impact the overall
> > performance.
>
> I'd like to have the driver always deliver cleared memory.

Actually, I think we can just always set the flag in the allocation IOCTLs.

Alex

>
> Alex
>
> >
> > Thanks,
> > Arun.
> > >
> > > Alex
> > >
> > >
> > >> +
> > >>          if (fpfn || lpfn !=3D mgr->mm.size)
> > >>                  /* Allocate blocks in desired range */
> > >>                  vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> > >> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resou=
rce_manager *man,
> > >>
> > >>          amdgpu_vram_mgr_do_reserve(man);
> > >>
> > >> -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > >> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > >>          mutex_unlock(&mgr->lock);
> > >>
> > >>          atomic64_sub(vis_usage, &mgr->vis_usage);
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > >> index 0e04e42cf809..8478522d7366 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > >> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(stru=
ct drm_buddy_block *block)
> > >>          return (u64)PAGE_SIZE << drm_buddy_block_order(block);
> > >>   }
> > >>
> > >> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_bloc=
k *block)
> > >> +{
> > >> +       return drm_buddy_block_is_clear(block);
> > >> +}
> > >> +
> > >>   static inline struct amdgpu_vram_mgr_resource *
> > >>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
> > >>   {
> > >> --
> > >> 2.25.1
> > >>
> >
