Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0A679499
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 10:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538110E63C;
	Tue, 24 Jan 2023 09:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D174510E63A;
 Tue, 24 Jan 2023 09:56:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so12400536wml.3; 
 Tue, 24 Jan 2023 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n97t1okUG8OmaoDW5vshpq+6YlKDiRy2hTN3sQIpcdM=;
 b=e2wdjMHdf5aDi+Y3gypfdxO2L4LVvPz3JHtZBnnw6SeAmM0Q++naQSVsepGBXJokUv
 XADUcdWQ7kNLU3RNkwCJ6KPwrwJwSNg8iHF8CPqMyuwO/gPwwak5f3U6lrHghSX+tJdA
 L5t0Tjw2+qYwjXzytIuHWvCW6xd9ChalKSFGFy4s/BF7D/51nmUzBUbPD76AaX4lDvRg
 s6y8NFRj1Wf2gLXOPTnEcvmKvB/GY7Ya5PA2nb6pmm+28woEBA7g2gZzi1m/BsOh69Kk
 PGuV7lU9DYXR9Be9AlGY4lLV5VCMCCIAtOXA3yqLl2X9h21jpurMjFypivxZKY83JpEp
 K0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n97t1okUG8OmaoDW5vshpq+6YlKDiRy2hTN3sQIpcdM=;
 b=L9JoA1bCUWchCBS+GLSv3dgNLvx9i2/dzbjn/wNgJJNbwVFX+Q4dSs0MHV+yAjp4rk
 4rPeUYRllNdGUnsWJa8aPhLe6wFOPpg6eKd5XdB/41dDXQBty1dU9EVCtPMSIb3izqWp
 l/LfGVfQLmlV5hDl9tsM8o5My3mkmfDN0VGZ8QNjGVsMBRx5wZqoHKOSo3bxkCXSuVtq
 RJArQXwXIuAVwiwy1lNDrW840Evmg6xC0ujx2syXmXzzo9RRXe3PPa+bkan24m+FDH9w
 EdEQgJpNaeLqHmzwF3lJCggq7cH//nbrvvxJU6jX3WA3k/kJXS/hgKCox4c+Y0YfBa6N
 yiOQ==
X-Gm-Message-State: AFqh2koP+FmXH8RGu2k1wtj0A94BRHbITX82ThgHwGJ5ObSS6owJQIwV
 QADCD8owapMkIOiP8mJsj5NRWvkbHpA=
X-Google-Smtp-Source: AMrXdXvHCDOpiui01ULRE4dBTvsibIz40Rge7X533dBcBclVvJgq5jzVPfA2rE5EK4ReiJ1VPC4KYQ==
X-Received: by 2002:a7b:c4d0:0:b0:3d1:f6b3:2ce3 with SMTP id
 g16-20020a7bc4d0000000b003d1f6b32ce3mr28288491wmk.35.1674554161107; 
 Tue, 24 Jan 2023 01:56:01 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003daf6e3bc2fsm1656758wmc.1.2023.01.24.01.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 01:56:00 -0800 (PST)
Message-ID: <866d5540-74b4-f57f-5da9-739bab3e8e3e@gmail.com>
Date: Tue, 24 Jan 2023 10:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/ttm: replace busy placement with flags
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <20230111114256.72669-2-christian.koenig@amd.com>
 <CAM0jSHP=LT5mXEFvXWJGPOotgRBBLFe-Pw=4TTHYWo=Maov_uA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHP=LT5mXEFvXWJGPOotgRBBLFe-Pw=4TTHYWo=Maov_uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 14:03 schrieb Matthew Auld:
> On Wed, 11 Jan 2023 at 11:43, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Instead of a list of separate busy placement add flags which indicate
>> that a placement should only be used when there is room or if we need to
>> evict.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  11 +-
>>   drivers/gpu/drm/drm_gem_vram_helper.c      |   2 -
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  36 +++---
>>   drivers/gpu/drm/nouveau/nouveau_bo.c       |  59 ++++------
>>   drivers/gpu/drm/nouveau/nouveau_bo.h       |   1 -
>>   drivers/gpu/drm/qxl/qxl_object.c           |   2 -
>>   drivers/gpu/drm/qxl/qxl_ttm.c              |   2 -
>>   drivers/gpu/drm/radeon/radeon_object.c     |   2 -
>>   drivers/gpu/drm/radeon/radeon_ttm.c        |   8 +-
>>   drivers/gpu/drm/radeon/radeon_uvd.c        |   1 -
>>   drivers/gpu/drm/ttm/ttm_bo.c               |  21 ++--
>>   drivers/gpu/drm/ttm/ttm_resource.c         |  73 +++----------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   2 -
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 121 ++++++++++-----------
>>   include/drm/ttm/ttm_placement.h            |  10 +-
>>   include/drm/ttm/ttm_resource.h             |   8 +-
>>   17 files changed, 134 insertions(+), 231 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 974e85d8b6cc..0995a2f41305 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -201,9 +201,6 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>>
>>          placement->num_placement = c;
>>          placement->placement = places;
>> -
>> -       placement->num_busy_placement = c;
>> -       placement->busy_placement = places;
>>   }
>>
>>   /**
>> @@ -1369,8 +1366,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>>                                          AMDGPU_GEM_DOMAIN_GTT);
>>
>>          /* Avoid costly evictions; only set GTT as a busy placement */
>> -       abo->placement.num_busy_placement = 1;
>> -       abo->placement.busy_placement = &abo->placements[1];
>> +       abo->placements[0].flags |= TTM_PL_FLAG_IDLE;
>>
>>          r = ttm_bo_validate(bo, &abo->placement, &ctx);
>>          if (unlikely(r == -EBUSY || r == -ERESTARTSYS))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 677cd7d91687..33cf6e835a68 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -104,23 +104,19 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>>          /* Don't handle scatter gather BOs */
>>          if (bo->type == ttm_bo_type_sg) {
>>                  placement->num_placement = 0;
>> -               placement->num_busy_placement = 0;
>>                  return;
>>          }
>>
>>          /* Object isn't an AMDGPU object so ignore */
>>          if (!amdgpu_bo_is_amdgpu_bo(bo)) {
>>                  placement->placement = &placements;
>> -               placement->busy_placement = &placements;
>>                  placement->num_placement = 1;
>> -               placement->num_busy_placement = 1;
>>                  return;
>>          }
>>
>>          abo = ttm_to_amdgpu_bo(bo);
>>          if (abo->flags & AMDGPU_GEM_CREATE_DISCARDABLE) {
>>                  placement->num_placement = 0;
>> -               placement->num_busy_placement = 0;
>>                  return;
>>          }
>>
>> @@ -129,13 +125,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>>          case AMDGPU_PL_GWS:
>>          case AMDGPU_PL_OA:
>>                  placement->num_placement = 0;
>> -               placement->num_busy_placement = 0;
>>                  return;
>>
>>          case TTM_PL_VRAM:
>>                  if (!adev->mman.buffer_funcs_enabled) {
>>                          /* Move to system memory */
>>                          amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_CPU);
>> +
>>                  } else if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>>                             !(abo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) &&
>>                             amdgpu_bo_in_cpu_visible_vram(abo)) {
>> @@ -150,8 +146,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>>                                                          AMDGPU_GEM_DOMAIN_CPU);
>>                          abo->placements[0].fpfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
>>                          abo->placements[0].lpfn = 0;
>> -                       abo->placement.busy_placement = &abo->placements[1];
>> -                       abo->placement.num_busy_placement = 1;
>> +                       abo->placements[0].flags |= TTM_PL_FLAG_IDLE;
>>                  } else {
>>                          /* Move to GTT memory */
>>                          amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
>> @@ -923,8 +918,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>>          /* allocate GART space */
>>          placement.num_placement = 1;
>>          placement.placement = &placements;
>> -       placement.num_busy_placement = 1;
>> -       placement.busy_placement = &placements;
>>          placements.fpfn = 0;
>>          placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
>>          placements.mem_type = TTM_PL_TT;
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index d40b3edb52d0..f46792b757f9 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -147,7 +147,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>>                  invariant_flags = TTM_PL_FLAG_TOPDOWN;
>>
>>          gbo->placement.placement = gbo->placements;
>> -       gbo->placement.busy_placement = gbo->placements;
>>
>>          if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
>>                  gbo->placements[c].mem_type = TTM_PL_VRAM;
>> @@ -160,7 +159,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>>          }
>>
>>          gbo->placement.num_placement = c;
>> -       gbo->placement.num_busy_placement = c;
>>
>>          for (i = 0; i < c; ++i) {
>>                  gbo->placements[i].fpfn = 0;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index d409a77449a3..dc483d601cf9 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -65,8 +65,6 @@ static const struct ttm_place sys_placement_flags = {
>>   static struct ttm_placement i915_sys_placement = {
>>          .num_placement = 1,
>>          .placement = &sys_placement_flags,
>> -       .num_busy_placement = 1,
>> -       .busy_placement = &sys_placement_flags,
>>   };
>>
>>   /**
>> @@ -154,32 +152,27 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
>>
>>   static void
>>   i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
>> -                           struct ttm_place *requested,
>> -                           struct ttm_place *busy,
>> +                           struct ttm_place *places,
>>                              struct ttm_placement *placement)
>>   {
>>          unsigned int num_allowed = obj->mm.n_placements;
>>          unsigned int flags = obj->flags;
>>          unsigned int i;
>>
>> -       placement->num_placement = 1;
>>          i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
>> -                                  obj->mm.region, requested, obj->bo_offset,
>> +                                  obj->mm.region, &places[0], obj->bo_offset,
>>                                     obj->base.size, flags);
> Do we also need places[0].flags |= TTM_PL_FLAG_IDLE somewhere here?

Oh, yes indeed. Thanks!

> Series doesn't seem to apply to drm-tip, so no intel-gfx CI. Would it
> be possible to have a version that applies to drm-tip, just so we can
> verify the i915 bits? We could send it to trybot[1] just to get some
> CI results?

It took me a while to figure out what was wrong and then update git 
everywhere. But I think that should work now.

Going to fix this issue here and re-send it in a minute.

Thanks,
Christian.

>
> [1] https://patchwork.freedesktop.org/project/intel-gfx-trybot/series/?ordering=-last_updated

