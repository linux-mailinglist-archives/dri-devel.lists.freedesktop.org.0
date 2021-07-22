Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2253D20B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887156E9FD;
	Thu, 22 Jul 2021 09:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F836EC6C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:19:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g12so2911727wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K9kJ8oAP/vIFlxhmYdcyHOKWDZvhl4uI9msvbpN45Xc=;
 b=gdd0shAJRSoBeZraPxmvRsTWynaNYUcyoZUuCDNDcaWdAvAuAo1XjW9TskmvuH6Tmr
 k3gwhhzBcNMMqL+DJCUiPEctbol77hCGpA5WQtvk1v3l5NzF8OAnYPPDKrOMxfvk2iU4
 Sil5AOb8lCsyadHFg2m7V6CerIEdrVkvksQi5jbxlDeiMoyY+TOPblTklosq346zmY7i
 Y4qyFz8PcSz0+SlodDR4ohpXS9Kc+WTKKQGpKHtmsybgxeIK5yyxIFSLoOpQ6MyGXPdD
 /WVvSpa9bYQddgYfOczj5IK+bfDZpKeQgsxJlRmS7jkbwxTMCK+HznyPomTcIX+RcKMW
 ehoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K9kJ8oAP/vIFlxhmYdcyHOKWDZvhl4uI9msvbpN45Xc=;
 b=G4U291sklTQNQCxkCrgcCOEtwVwI3BhG/owv17t8zSnfPnlexIiADd0aQEeZgacc5x
 AMbaVumUtCJlqu2L4JbXD9iyCKJ5e/ggbMUh+hgcE1f+d/+Dg2oU1QA32OX10ZwmvM4w
 q8i9cwq6Qz9SWdUTaa+Nhy5xw1cdzawTzsw2edvgMeZHiJbdDFwLLwsTIJecZKdJ1PAx
 ClQs+HilMksQrbddQO4CcgNSil+adz4R+6zArPL2V/o7w660mp6VKv4VGARaqm4rybE3
 xYwDLzPtEio+xt6yjurr4Kwg/vgvyJu8JehRWUYvHCgUJpGtNZ+OFIbeTZkru7FhsOF/
 2WGw==
X-Gm-Message-State: AOAM531uM9cspIDdUuYgerHVyp1XaeddbZl2uBWYtFafz9GhGB9gCPVy
 EWxWjFoHqqZTcKvf4fmokdJf0bIJZK0=
X-Google-Smtp-Source: ABdhPJyeVJBmseyd1YeZ02+pAekjs5wofcFvk1NufTcfevJ93xC8RVN9VmJwFVT8cRERe7gW4CS/sg==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr3281562wms.80.1626945545006; 
 Thu, 22 Jul 2021 02:19:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee?
 ([2a02:908:1252:fb60:b706:b115:9c6f:aeee])
 by smtp.gmail.com with ESMTPSA id f130sm29985990wmf.23.2021.07.22.02.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:19:04 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm/ttm: revert "flip tt destroy ordering."
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210722085554.1537-1-christian.koenig@amd.com>
 <20210722085554.1537-5-christian.koenig@amd.com>
 <YPk2PE6w9a6+54gO@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b10a8746-c6db-fd27-df1f-ed5bbeeb0e45@gmail.com>
Date: Thu, 22 Jul 2021 11:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPk2PE6w9a6+54gO@phenom.ffwll.local>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.07.21 um 11:11 schrieb Daniel Vetter:
> On Thu, Jul 22, 2021 at 10:55:54AM +0200, Christian König wrote:
>> It turned out that this is not a good idea at all because it leaves pointers
>> to freed up system memory pages in the GART tables of the drivers.
>>
>> Instead change the drivers to unbind their page tables during unpopulate and
>> merge those things back into ttm_tt_destroy() again.
>>
>> This reverts commit 7626168fd132009c79a0457bccc58014abc738f5.
> Can you pls duplicate this in each of the driver commit messages so it's a
> bit clearer what is going on?
>
> Usually the cover letter is first, not last :-)

Ah, yes of course. Actually wanted to do this, but then forgot about it.

Christian.

> -Daniel
>   
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 1 -
>>   drivers/gpu/drm/drm_gem_vram_helper.c      | 1 -
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 1 -
>>   drivers/gpu/drm/nouveau/nouveau_bo.c       | 1 -
>>   drivers/gpu/drm/nouveau/nouveau_sgdma.c    | 1 -
>>   drivers/gpu/drm/qxl/qxl_ttm.c              | 1 -
>>   drivers/gpu/drm/radeon/radeon_ttm.c        | 2 --
>>   drivers/gpu/drm/ttm/ttm_tt.c               | 7 +------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 -
>>   include/drm/ttm/ttm_tt.h                   | 7 -------
>>   10 files changed, 1 insertion(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 42b5162814b1..6a6e04b64a80 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1070,7 +1070,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
>>   {
>>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>>   
>> -	ttm_tt_destroy_common(bdev, ttm);
>>   	if (gtt->usertask)
>>   		put_task_struct(gtt->usertask);
>>   
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 1e9b82e51a07..cc81fbac1a13 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -846,7 +846,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
>>   
>>   static void bo_driver_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
>>   {
>> -	ttm_tt_destroy_common(bdev, tt);
>>   	ttm_tt_fini(tt);
>>   	kfree(tt);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index bf33724bed5c..e646aac9d7a4 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -118,7 +118,6 @@ static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   {
>>   	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>>   
>> -	ttm_tt_destroy_common(bdev, ttm);
>>   	kfree(i915_tt);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 5f309a4ec211..3177f89cf000 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -1291,7 +1291,6 @@ nouveau_ttm_tt_destroy(struct ttm_device *bdev,
>>   #if IS_ENABLED(CONFIG_AGP)
>>   	struct nouveau_drm *drm = nouveau_bdev(bdev);
>>   	if (drm->agp.bridge) {
>> -		ttm_tt_destroy_common(bdev, ttm);
>>   		ttm_agp_destroy(ttm);
>>   		return;
>>   	}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> index bde92a9dae7a..85c03c83259b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> @@ -21,7 +21,6 @@ nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
>>   
>>   	if (ttm) {
>> -		ttm_tt_destroy_common(bdev, ttm);
>>   		ttm_tt_fini(&nvbe->ttm);
>>   		kfree(nvbe);
>>   	}
>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
>> index 19fd39d9a00c..e91d8154143e 100644
>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>> @@ -101,7 +101,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
>>    */
>>   static void qxl_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   {
>> -	ttm_tt_destroy_common(bdev, ttm);
>>   	ttm_tt_fini(ttm);
>>   	kfree(ttm);
>>   }
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index ee343b76db54..7793249bc549 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -488,7 +488,6 @@ static void radeon_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_tt *t
>>   {
>>   	struct radeon_ttm_tt *gtt = (void *)ttm;
>>   
>> -	ttm_tt_destroy_common(bdev, ttm);
>>   	ttm_tt_fini(&gtt->ttm);
>>   	kfree(gtt);
>>   }
>> @@ -651,7 +650,6 @@ static void radeon_ttm_tt_destroy(struct ttm_device *bdev,
>>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
>>   
>>   	if (rdev->flags & RADEON_IS_AGP) {
>> -		ttm_tt_destroy_common(bdev, ttm);
>>   		ttm_agp_destroy(ttm);
>>   		return;
>>   	}
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 24031a8acd2d..41f38d9c3e1c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -123,7 +123,7 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>   	return 0;
>>   }
>>   
>> -void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
>> +void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   {
>>   	ttm_tt_unpopulate(bdev, ttm);
>>   
>> @@ -131,11 +131,6 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   		fput(ttm->swap_storage);
>>   
>>   	ttm->swap_storage = NULL;
>> -}
>> -EXPORT_SYMBOL(ttm_tt_destroy_common);
>> -
>> -void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>> -{
>>   	bdev->funcs->ttm_tt_destroy(bdev, ttm);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index 904031d03dbe..f35bdc1cb197 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -526,7 +526,6 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   	struct vmw_ttm_tt *vmw_be =
>>   		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
>>   
>> -	ttm_tt_destroy_common(bdev, ttm);
>>   	vmw_ttm_unmap_dma(vmw_be);
>>   	ttm_tt_fini(ttm);
>>   	if (vmw_be->mob)
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index 818680c6a8ed..e402dab1d0f6 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -134,13 +134,6 @@ void ttm_tt_fini(struct ttm_tt *ttm);
>>    */
>>   void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
>>   
>> -/**
>> - * ttm_tt_destroy_common:
>> - *
>> - * Called from driver to destroy common path.
>> - */
>> -void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm);
>> -
>>   /**
>>    * ttm_tt_swapin:
>>    *
>> -- 
>> 2.25.1
>>

