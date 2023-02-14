Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CC6960E9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 11:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A633D10E0E5;
	Tue, 14 Feb 2023 10:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A310E044;
 Tue, 14 Feb 2023 10:37:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j23so15165564wra.0;
 Tue, 14 Feb 2023 02:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c+FgAM2zQihbUDCEzgVPfNMhJLbCAQDmEX5LWRcNqM8=;
 b=pNP1G6An3F3qCMAO2IHkI5csTryWkXLx/oQD3UH/1EnfU2xs1a5I/u7GqBsEgop+OX
 +8K5Jr8MZcIfNPkWIH6Bbdz7k04OoVDSIjoiJaSdYSyPQ8gJCxyzhW5PjbKfMIOWqSbN
 jRXpJ3JrSDgSKs1sIWxlgV/d7BASHSdbGt5oaBr0kZMGnK6J8z1eh4KKvUcFJf+urpO5
 bc77KHFbOUtGi5+Y2T5DVNwBKXwHFWcd5BWuJ2m+NCWWBQQZMgDTy0cN/fCEfwmMltoW
 ORlm9G0Vkk75wVCk+Dl3hMgu3IuNqhFWXL5l/pPdkpM0BNZMp0PpZDTid1RkpE4qKx5J
 IwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c+FgAM2zQihbUDCEzgVPfNMhJLbCAQDmEX5LWRcNqM8=;
 b=0/92XTWnEDoGr0rBX+RJjDiI+kORyElOK2IwI3jYxwJmlnyFijV+HoWCf1R/DNwEHH
 25LTGbRTgzc7nLzsjPhGC7Nsac6jM7ZrhiPbMK8gAv1Sac0+5n8nPWPeHt5KilQp3sr+
 EDKzRjgHjtH3q6jNZp+G5eZVczd5EVWMytjPrOcA6oivtuLRPp0SJ+fYziOVaNE4ab1n
 3dCMPlaPIzMh/9Fyyz6RjAOeaA0wF6RAXZneqL5qkgzm12RqM+npTqvyxNMzm4uHeVrx
 gAOYwppyNQqGWyjS2rR6mRdRPHL8TGs+me+ohb1kgZqOYePpstLS1NobJKkyPKKf2muf
 mLRg==
X-Gm-Message-State: AO0yUKUichpwB734dYAOc/hPR/uxjad1ZtQPi1K9BV234HTkfgSYspTh
 7cch0KKqlfbxNNOmHBDQG58=
X-Google-Smtp-Source: AK7set+5ecJzIhF4RpKQBgRwhhkcUkLSyECkOblEKKoy/iTBT9UHI8YpK0rrL1tEd5EVRmhvq286LQ==
X-Received: by 2002:a05:6000:48:b0:2c3:f021:da5d with SMTP id
 k8-20020a056000004800b002c3f021da5dmr1452876wrx.51.1676371031022; 
 Tue, 14 Feb 2023 02:37:11 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6d42000000b002c4061a687bsm12850151wri.31.2023.02.14.02.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 02:37:10 -0800 (PST)
Message-ID: <d1ed2e0b-35fb-71c9-da4f-744eee26413d@gmail.com>
Date: Tue, 14 Feb 2023 11:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/ttm: Change the meaning of the fields
 in the drm_mm_nodes structure from pfn to bytes v2
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230214074238.65865-1-christian.koenig@amd.com>
 <20230214074238.65865-4-christian.koenig@amd.com>
 <CAM0jSHNv32grp=Q7VdTo6EjQQLUV7Bcqw1+KwuwWjBDHCDYa+g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHNv32grp=Q7VdTo6EjQQLUV7Bcqw1+KwuwWjBDHCDYa+g@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, Amaranath.Somalapuram@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.02.23 um 11:31 schrieb Matthew Auld:
> On Tue, 14 Feb 2023 at 07:43, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>
>> Change the ttm_range_man_alloc() allocation from pages to size in bytes.
>> Fix the dependent drm_mm_nodes start and size from pages to bytes.
>>
>> v2 (chk): Change the drm_mm_node usage in amdgpu as well. re-order the
>>            patch to be independent of the resource->start change.
>>
>> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 15 ++++++++-------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  8 ++++----
>>   drivers/gpu/drm/i915/i915_scatterlist.c        |  6 +++---
>>   drivers/gpu/drm/ttm/ttm_range_manager.c        | 17 ++++++++---------
>>   4 files changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> index 44367f03316f..c90423cd1292 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> @@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>>                                struct ttm_resource **res)
>>   {
>>          struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>> -       uint32_t num_pages = PFN_UP(tbo->base.size);
>>          struct ttm_range_mgr_node *node;
>>          int r;
>>
>> @@ -134,17 +133,19 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>>          if (place->lpfn) {
>>                  spin_lock(&mgr->lock);
>>                  r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
>> -                                               num_pages, tbo->page_alignment,
>> -                                               0, place->fpfn, place->lpfn,
>> +                                               tbo->base.size,
>> +                                               tbo->page_alignment << PAGE_SHIFT, 0,
>> +                                               place->fpfn << PAGE_SHIFT,
>> +                                               place->lpfn << PAGE_SHIFT,
>>                                                  DRM_MM_INSERT_BEST);
>>                  spin_unlock(&mgr->lock);
>>                  if (unlikely(r))
>>                          goto err_free;
>>
>> -               node->base.start = node->mm_nodes[0].start;
>> +               node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
>>          } else {
>>                  node->mm_nodes[0].start = 0;
>> -               node->mm_nodes[0].size = PFN_UP(node->base.size);
>> +               node->mm_nodes[0].size = node->base.size;
>>                  node->base.start = AMDGPU_BO_INVALID_OFFSET;
>>          }
>>
>> @@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>>
>>          ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>>
>> -       start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>> -       size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>> +       start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
>> +       size = adev->gmc.gart_size - start;
>>          drm_mm_init(&mgr->mm, start, size);
>>          spin_lock_init(&mgr->lock);
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> index 5c4f93ee0c57..5c78f0b09351 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>>                  while (start >= node->size << PAGE_SHIFT)
>>                          start -= node++->size << PAGE_SHIFT;
>>
>> -               cur->start = (node->start << PAGE_SHIFT) + start;
>> -               cur->size = min((node->size << PAGE_SHIFT) - start, size);
>> +               cur->start = node->start + start;
>> +               cur->size = min(node->size - start, size);
>>                  cur->remaining = size;
>>                  cur->node = node;
>>                  break;
>> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>>                  node = cur->node;
>>
>>                  cur->node = ++node;
>> -               cur->start = node->start << PAGE_SHIFT;
>> -               cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
>> +               cur->start = node->start;
>> +               cur->size = min(node->size, cur->remaining);
>>                  break;
>>          default:
>>                  return;
>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
>> index 756289e43dff..7defda1219d0 100644
>> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
>> @@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>          if (!rsgt)
>>                  return ERR_PTR(-ENOMEM);
>>
>> -       i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
>> +       i915_refct_sgt_init(rsgt, node->size);
>>          st = &rsgt->table;
>>          /* restricted by sg_alloc_table */
>>          if (WARN_ON(overflows_type(DIV_ROUND_UP_ULL(node->size, segment_pages),
>> @@ -110,8 +110,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>          sg = st->sgl;
>>          st->nents = 0;
>>          prev_end = (resource_size_t)-1;
>> -       block_size = node->size << PAGE_SHIFT;
>> -       offset = node->start << PAGE_SHIFT;
>> +       block_size = node->size;
>> +       offset = node->start;
>>
>>          while (block_size) {
>>                  u64 len;
>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index 62fddcc59f02..9da6054f2955 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>>
>>          spin_lock(&rman->lock);
>>          ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
>> -                                         PFN_UP(node->base.size),
>> -                                         bo->page_alignment, 0,
>> -                                         place->fpfn, lpfn, mode);
>> +                                         node->base.size,
>> +                                         bo->page_alignment << PAGE_SHIFT, 0,
>> +                                         place->fpfn << PAGE_SHIFT,
> place->fpfn is only u32. I assume we need some (u64) cast or so?

Good point. I've already found a couple of those, but looks like I 
missed that one.

Going to fix that.

Thanks,
Christian.

>
>> +                                         lpfn << PAGE_SHIFT, mode);
>>          spin_unlock(&rman->lock);
>>
>>          if (unlikely(ret)) {
>> @@ -94,7 +95,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>>                  return ret;
>>          }
>>
>> -       node->base.start = node->mm_nodes[0].start;
>> +       node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
>>          *res = &node->base;
>>          return 0;
>>   }
>> @@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
>>                                       size_t size)
>>   {
>>          struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
>> -       u32 num_pages = PFN_UP(size);
>>
>>          /* Don't evict BOs outside of the requested placement range */
>> -       if (place->fpfn >= (node->start + num_pages) ||
>> -           (place->lpfn && place->lpfn <= node->start))
>> +       if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
>> +           (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
> Same here.
>
>>                  return false;
>>
>>          return true;
>> @@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
>>                                       size_t size)
>>   {
>>          struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
>> -       u32 num_pages = PFN_UP(size);
>>
>>          if (node->start < place->fpfn ||
>> -           (place->lpfn && (node->start + num_pages) > place->lpfn))
>> +           (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
> And here.
>
>>                  return false;
>>
>>          return true;
>> --
>> 2.34.1
>>

