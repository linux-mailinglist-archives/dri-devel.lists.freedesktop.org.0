Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406839CE33
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 10:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F2E6E0D9;
	Sun,  6 Jun 2021 08:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CA16E0D9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 08:53:26 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f5so11405699eds.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CfhPhD5RbGN6mlcmRnf55HWfPrWP4zw1vt8iUADDyD0=;
 b=Ipil1jfSXz/tsNIOUmfcOT1uW7sNLqsc0ex2IOUJd7QaCUkWKgdTi+c2IOeMSvVfzO
 sRBC8aV0/gVwcG97uk46ov+TdaWN2jDaicst4qXbu1DqcrcIcI7hdGMgAxKoIiRXy8lQ
 hZfn6S1R/W1/CHGg//MCweAIo+X2Ucic6A7RBeqjPHNIu0ekeqVJiHr8ce/HKUOe/7+2
 61PE5EuKnw4o2S5hUKeB5v1UdDC+BmEdHUb72mW95ySS0XUSWPki3vNK16TiWFddhn5o
 fjYW8bxKpIg5zMLd6e9XWMGbLg2rd384VJ6RlbSf+4X+BHezUBhp3f7bVurFrQYmSHk8
 /7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CfhPhD5RbGN6mlcmRnf55HWfPrWP4zw1vt8iUADDyD0=;
 b=X8hAqrwlK984pLTyGyYZg/cmDv2qAmXJaaUMNW+6diPMdhxGQCtW2Fjnlb7ddUuBBt
 3rqc7fl1U+ZRj5jRN8xJ18ZiNjq4H/o733DrYTtPvyHfaiByTaF9FS1Y9xr3h8Hh0UiF
 1O3woyuDTlDvI7Ph1pMvfWqyPEE1YgmVEHQnyk2zgCYWXvajJxXmM6lGZKUH7dxS+IuI
 58HZ7R71MvszZAi6S+z4rvvIbqWDoKeamAum1fdKeq4YYb01PJ6cGxWvqRl8bLkbzdTS
 naLz7oPnbDy5CK2TVsVrXRt3zP1pgikcV18+UzWRN6Cax/OCKlD23fzwxpGq/hYDM4Rj
 h6oQ==
X-Gm-Message-State: AOAM530u9hGyBmx1MgMyewepiHhBmFCNVzZPLsFMZXRtZRRcdo9pxSFv
 wyDsxe5K6BZWJhE7SEhQykildG5IDWk=
X-Google-Smtp-Source: ABdhPJzUEMmZH6sQ04o8ZcndTttnS6dmtSWSno2pSe33E7GGNC+GXeBMuaLoMlefqUlXV5ZBQcxChg==
X-Received: by 2002:a05:6402:1559:: with SMTP id
 p25mr14491607edx.343.1622969604713; 
 Sun, 06 Jun 2021 01:53:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:893f:dd2c:6437:a229?
 ([2a02:908:1252:fb60:893f:dd2c:6437:a229])
 by smtp.gmail.com with ESMTPSA id v21sm6036205edt.48.2021.06.06.01.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 01:53:23 -0700 (PDT)
Subject: Re: [PATCH 5/7] dma-buf: rename and cleanup dma_resv_get_list
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-5-christian.koenig@amd.com>
 <CAOFGe96ZUA6JM5oJF4p6B6XB6=xyjPg13wv8X4qkAAvJUCXNbg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e5719101-c393-3ab0-3917-ee32b7a54668@gmail.com>
Date: Sun, 6 Jun 2021 10:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe96ZUA6JM5oJF4p6B6XB6=xyjPg13wv8X4qkAAvJUCXNbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.21 um 22:22 schrieb Jason Ekstrand:
> On Wed, Jun 2, 2021 at 6:17 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> When the comment needs to state explicitly that this is doesn't get a reference
>> to the object then the function is named rather badly.
>>
>> Rename the function and use it in even more places.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c                    | 32 +++++++++----------
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  2 +-
>>   drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
>>   drivers/gpu/drm/nouveau/nouveau_fence.c       |  2 +-
>>   drivers/gpu/drm/qxl/qxl_debugfs.c             |  2 +-
>>   drivers/gpu/drm/radeon/radeon_sync.c          |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
>>   include/linux/dma-resv.h                      | 25 +++++++--------
>>   13 files changed, 39 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 81b032b43457..b1a1a31dc009 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -149,8 +149,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
>>
>>          dma_resv_assert_held(obj);
>>
>> -       old = dma_resv_get_list(obj);
>> -
>> +       old = dma_resv_shared(obj);
>>          if (old && old->shared_max) {
>>                  if ((old->shared_count + num_fences) <= old->shared_max)
>>                          return 0;
>> @@ -217,12 +216,13 @@ EXPORT_SYMBOL(dma_resv_reserve_shared);
>>    */
>>   void dma_resv_reset_shared_max(struct dma_resv *obj)
>>   {
>> -       /* Test shared fence slot reservation */
>> -       if (rcu_access_pointer(obj->fence)) {
>> -               struct dma_resv_list *fence = dma_resv_get_list(obj);
>> +       struct dma_resv_list *fences = dma_resv_shared(obj);
>>
>> -               fence->shared_max = fence->shared_count;
>> -       }
>> +       dma_resv_assert_held(obj);
> Does it make sense to assert we hold the lock *before* we touch it
> with something that requires that we do?  Maybe it doesn't matter?

As far as I can see that shouldn't matter.

>
>> +
>> +       /* Test shared fence slot reservation */
>> +       if (fences)
>> +               fences->shared_max = fences->shared_count;
>>   }
>>   #endif
>>
>> @@ -244,7 +244,7 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>>
>>          dma_resv_assert_held(obj);
>>
>> -       fobj = dma_resv_get_list(obj);
>> +       fobj = dma_resv_shared(obj);
>>          count = fobj->shared_count;
>>
>>          write_seqcount_begin(&obj->seq);
>> @@ -287,7 +287,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>
>>          dma_resv_assert_held(obj);
>>
>> -       old = dma_resv_get_list(obj);
>> +       old = dma_resv_shared(obj);
>>          if (old)
>>                  i = old->shared_count;
>>
>> @@ -326,7 +326,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>          dma_resv_assert_held(dst);
>>
>>          rcu_read_lock();
>> -       src_list = rcu_dereference(src->fence);
>> +       src_list = dma_resv_shared(src);
>>
>>   retry:
>>          if (src_list) {
>> @@ -339,7 +339,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>                          return -ENOMEM;
>>
>>                  rcu_read_lock();
>> -               src_list = rcu_dereference(src->fence);
>> +               src_list = dma_resv_shared(src);
>>                  if (!src_list || src_list->shared_count > shared_count) {
>>                          kfree(dst_list);
>>                          goto retry;
>> @@ -357,7 +357,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>
>>                          if (!dma_fence_get_rcu(fence)) {
>>                                  dma_resv_list_free(dst_list);
>> -                               src_list = rcu_dereference(src->fence);
>> +                               src_list = dma_resv_shared(src);
>>                                  goto retry;
>>                          }
>>
>> @@ -376,7 +376,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>          new = dma_fence_get_rcu_safe(&src->fence_excl);
>>          rcu_read_unlock();
>>
>> -       src_list = dma_resv_get_list(dst);
>> +       src_list = dma_resv_shared(dst);
>>          old = dma_resv_exclusive(dst);
>>
>>          write_seqcount_begin(&dst->seq);
>> @@ -429,7 +429,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>>                  if (fence_excl && !dma_fence_get_rcu(fence_excl))
>>                          goto unlock;
>>
>> -               fobj = rcu_dereference(obj->fence);
>> +               fobj = dma_resv_shared(obj);
>>                  if (fobj)
>>                          sz += sizeof(*shared) * fobj->shared_max;
>>
>> @@ -535,7 +535,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>>          }
>>
>>          if (wait_all) {
>> -               struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>> +               struct dma_resv_list *fobj = dma_resv_shared(obj);
>>
>>                  if (fobj)
>>                          shared_count = fobj->shared_count;
>> @@ -620,7 +620,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>          seq = read_seqcount_begin(&obj->seq);
>>
>>          if (test_all) {
>> -               struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>> +               struct dma_resv_list *fobj = dma_resv_shared(obj);
>>                  unsigned int i;
>>
>>                  if (fobj)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index d5e6519bdea1..e90495ca49fd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -247,7 +247,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>>          if (!ef)
>>                  return -EINVAL;
>>
>> -       old = dma_resv_get_list(resv);
>> +       old = dma_resv_shared(resv);
>>          if (!old)
>>                  return 0;
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 6dd0ea6e9e24..3b13c8a38c4e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -49,7 +49,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
>>          unsigned int count;
>>          int r;
>>
>> -       if (!dma_resv_get_list(obj)) /* no shared fences to convert */
>> +       if (!dma_resv_shared(obj)) /* no shared fences to convert */
>>                  return 0;
>>
>>          r = dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> index c84d5b843985..c50d9f92a0cd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> @@ -213,7 +213,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>>          f = dma_resv_exclusive(resv);
>>          r = amdgpu_sync_fence(sync, f);
>>
>> -       flist = dma_resv_get_list(resv);
>> +       flist = dma_resv_shared(resv);
>>          if (!flist || r)
>>                  return r;
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 663aa7d2e2ea..ddb6ce7d48bc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1338,7 +1338,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>           * If true, then return false as any KFD process needs all its BOs to
>>           * be resident to run successfully
>>           */
>> -       flist = dma_resv_get_list(bo->base.resv);
>> +       flist = dma_resv_shared(bo->base.resv);
>>          if (flist) {
>>                  for (i = 0; i < flist->shared_count; ++i) {
>>                          f = rcu_dereference_protected(flist->shared[i],
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index d4f54dea8ac1..4d43b8630f0e 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -461,7 +461,7 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>>                          off, etnaviv_obj->vaddr, obj->size);
>>
>>          rcu_read_lock();
>> -       fobj = rcu_dereference(robj->fence);
>> +       fobj = dma_resv_shared(robj);
>>          if (fobj) {
>>                  unsigned int i, shared_count = fobj->shared_count;
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 02312a0c3a36..3f94becac541 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> @@ -116,7 +116,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>>          args->busy = busy_check_writer(dma_resv_exclusive(obj->base.resv));
>>
>>          /* Translate shared fences to READ set of engines */
>> -       list = rcu_dereference(obj->base.resv->fence);
>> +       list = dma_resv_shared(obj->base.resv);
>>          if (list) {
>>                  unsigned int shared_count = list->shared_count, i;
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
>> index 54c1b53426d6..43af91df552e 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -817,7 +817,7 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>>          struct dma_fence *fence;
>>          int i, ret;
>>
>> -       fobj = dma_resv_get_list(obj->resv);
>> +       fobj = dma_resv_shared(obj->resv);
>>          if (!fobj || (fobj->shared_count == 0)) {
>>                  fence = dma_resv_exclusive(obj->resv);
>>                  /* don't need to wait on our own fences, since ring is fifo */
>> @@ -1025,7 +1025,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>>          }
>>
>>          rcu_read_lock();
>> -       fobj = rcu_dereference(robj->fence);
>> +       fobj = dma_resv_shared(robj);
>>          if (fobj) {
>>                  unsigned int i, shared_count = fobj->shared_count;
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> index a6cb35181aee..5ce441c655ea 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -355,7 +355,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>>                          return ret;
>>          }
>>
>> -       fobj = dma_resv_get_list(resv);
>> +       fobj = dma_resv_shared(resv);
>>          fence = dma_resv_exclusive(resv);
>>
>>          if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
>> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
>> index 183d15e2cf58..0acc70a6d3dd 100644
>> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
>> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
>> @@ -61,7 +61,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>>                  int rel;
>>
>>                  rcu_read_lock();
>> -               fobj = rcu_dereference(bo->tbo.base.resv->fence);
>> +               fobj = dma_resv_shared(bo->tbo.base.resv);
>>                  rel = fobj ? fobj->shared_count : 0;
>>                  rcu_read_unlock();
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
>> index e476f90ef1c1..a9cdb88da173 100644
>> --- a/drivers/gpu/drm/radeon/radeon_sync.c
>> +++ b/drivers/gpu/drm/radeon/radeon_sync.c
>> @@ -105,7 +105,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
>>          else if (f)
>>                  r = dma_fence_wait(f, true);
>>
>> -       flist = dma_resv_get_list(resv);
>> +       flist = dma_resv_shared(resv);
>>          if (shared || !flist || r)
>>                  return r;
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 92361556bf0b..c41ef0caa492 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -261,7 +261,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>>          int i;
>>
>>          rcu_read_lock();
>> -       fobj = rcu_dereference(resv->fence);
>> +       fobj = dma_resv_shared(resv);
>>          fence = dma_resv_exclusive(resv);
>>          if (fence && !fence->ops->signaled)
>>                  dma_fence_enable_sw_signaling(fence);
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index 7549ec5eb35c..98ac66fecb71 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -78,20 +78,6 @@ struct dma_resv {
>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>>
>> -/**
>> - * dma_resv_get_list - get the reservation object's
>> - * shared fence list, with update-side lock held
>> - * @obj: the reservation object
>> - *
>> - * Returns the shared fence list.  Does NOT take references to
>> - * the fence.  The obj->lock must be held.
>> - */
>> -static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *obj)
>> -{
>> -       return rcu_dereference_protected(obj->fence,
>> -                                        dma_resv_held(obj));
>> -}
>> -
>>   #ifdef CONFIG_DEBUG_MUTEXES
>>   void dma_resv_reset_shared_max(struct dma_resv *obj);
>>   #else
>> @@ -267,6 +253,17 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
>>          return fence;
>>   }
>>
>> +/**
>> + * dma_resv_shared - get the reservation object's shared fence list
>> + * @obj: the reservation object
>> + *
>> + * Returns the shared fence list. The obj->lock or rcu read side must be held.
>> + */
>> +static inline struct dma_resv_list *dma_resv_shared(struct dma_resv *obj)
> Maybe dma_resv_shared_list() just to be a little more clear what's
> being returned?

Ok, renamed this one and dma_resv_exclusive into dma_resv_excl_fence as 
well.

Christian.

>
> --Jason
>
>> +{
>> +       return rcu_dereference_check(obj->fence, dma_resv_held(obj));
>> +}
>> +
>>   void dma_resv_init(struct dma_resv *obj);
>>   void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>> --
>> 2.25.1
>>

