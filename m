Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF7648F73
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 16:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2087610E0FB;
	Sat, 10 Dec 2022 15:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7E610E0FA;
 Sat, 10 Dec 2022 15:33:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk9so18090127ejc.3;
 Sat, 10 Dec 2022 07:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcYtQgPyVe5cOQnfMYQ81tOcEt5K+C9MLDszC4So/5g=;
 b=FC9k2XdX7NDaV5C9yTvU0av0Zb/Lh6Tl3msyQ2oo2sugBNRFpps4/e+0VeJ8DDtGWy
 9hQ7Yts3GQIXVjz6wm8th2s0fYdggpW+J0be6scKnUsFj4Q9VraULaTVze100LITPjTi
 qPaQyPOyMp2xD775lE4fcyU4WZLFw6haF+FoYCvp65NA6ZHUHLDXllfji2EMuh+8EAxG
 17lJoJvy/RfKVsSeUMjaoLl9MYaQGb9UNeGVtTrIsDB699r5WQ4yx9PXqVIk6suFJw98
 XaBri6hHr3CS1tFFtRFDpon7fe/yt87Z4XSy65pxMZ7nBrXsf7lbue7mFkzG1QNzhDXn
 8o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcYtQgPyVe5cOQnfMYQ81tOcEt5K+C9MLDszC4So/5g=;
 b=bTiF3KSJ1koXaOWAf7lblBpR9YGHNskthYfaHstyVW0Xsk0uMZvhplBkyqX/BGyfX6
 pfkNPHUr6puwqnocMw6+DWHQLffpWiTQezisR4f8YiOF0BOoIlCY7CXcgICGfs2B7Hwc
 l/BqzgJGn2SOiwc/uhcnHGxOl9VZWk63ZxdhucGTzgtDi1RZ6YoXB4AmC1zoGmPZKBV9
 CuxJ9J4zyBlxghl/t2qGM86MVx0gLMf4A/Y0vM1yPwhsVRJ5QlEFiRVizqjx/d4Ti/b3
 KnOSUd7r89GUzEPp6OHIKpSe0ZhgSNDdri5FYLmwDqy5GED78kSrejHbZPGL0H3DVBAx
 lEHA==
X-Gm-Message-State: ANoB5pkdnMSyle05XvB+/rr0OSqCZvvf7bh+ePhNTlTXJ8kaEwYs8VJ3
 RMk1zeu9/j0bSPxRXnEpWRzwQKMMrpk=
X-Google-Smtp-Source: AA0mqf6DjReJEf5aBMTb4P0KvZZcxV6I+aEcrAMvT+kU3mpy5iZ8xOTgxBOkgI1Ok1IOFkGrnSmSFg==
X-Received: by 2002:a05:6402:4006:b0:46c:d5e8:30e4 with SMTP id
 d6-20020a056402400600b0046cd5e830e4mr9989433eda.23.1670681548132; 
 Sat, 10 Dec 2022 06:12:28 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:9e54:3ab5:354f:e689?
 ([2a02:908:1256:79a0:9e54:3ab5:354f:e689])
 by smtp.gmail.com with ESMTPSA id
 ov4-20020a170906fc0400b007c0dacbe00bsm1023863ejb.115.2022.12.10.06.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 06:12:27 -0800 (PST)
Message-ID: <c9243d99-2a02-2e95-82f6-c70db9a08641@gmail.com>
Date: Sat, 10 Dec 2022 15:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <5ad09c47-1f50-07ce-7b8b-f8e4195f2256@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5ad09c47-1f50-07ce-7b8b-f8e4195f2256@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.12.22 um 07:15 schrieb Felix Kuehling:
> On 2022-11-25 05:21, Christian König wrote:
>> We already fallback to a dummy BO with no backing store when we
>> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>>
>> Drop all those workarounds and generalize this for GTT as well. This
>> fixes ENOMEM issues with runaway applications which try to allocate/free
>> GTT in a loop and are otherwise only limited by the CPU speed.
>>
>> The CS will wait for the cleanup of freed up BOs to satisfy the
>> various domain specific limits and so effectively throttle those
>> buggy applications down to a sane allocation behavior again.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>
> This patch causes some regressions in KFDTest. KFDMemoryTest.MMBench 
> sees a huge VRAM allocation slow-down. And 
> KFDMemoryTest.LargestVramBufferTest can only allocate half the 
> available memory.

Mhm, I wasn't expecting that we use this for the KFD as well.

>
> This seems to be caused by initially validating VRAM BOs in the CPU 
> domain, which allocates a ttm_tt. A subsequent validation in the VRAM 
> domain involves a copy from GTT to VRAM.

The idea was to initially create the BOs without any backing store.

>
> After that, freeing of BOs can get delayed by the ghost object of a 
> previous migration, which delays calling release notifiers and causes 
> problems for KFDs available memory accounting.
>
> I experimented with a workaround that validates BOs immediately after 
> allocation, but that only moves around the delays and doesn't solve 
> the problem. During those experiments I may also have stumbled over a 
> bug in ttm_buffer_object_transfer: It calls ttm_bo_set_bulk_move 
> before initializing and locking fbo->base.base._resv. This results in 
> a flood of warnings because ttm_bo_set_bulk_move expects the 
> reservation to be locked.
>
> Right now I'd like to remove the bp.domain = initial_domain | 
> AMDGPU_GEM_DOMAIN_CPU change in amdgpu_gem_object_create to fix this.

Yeah, let's revert and investigate this first.

Thanks,
Christian.

>
> Regards,
>   Felix
>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index a0780a4e3e61..62e98f1ad770 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device 
>> *adev, unsigned long size,
>>       bp.resv = resv;
>>       bp.preferred_domain = initial_domain;
>>       bp.flags = flags;
>> -    bp.domain = initial_domain;
>> +    bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>>       bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>>         r = amdgpu_bo_create_user(adev, &bp, &ubo);
>> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device 
>> *dev, void *data,
>>       }
>>         initial_domain = (u32)(0xffffffff & args->in.domains);
>> -retry:
>>       r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>> -                     initial_domain,
>> -                     flags, ttm_bo_type_device, resv, &gobj);
>> +                     initial_domain, flags, ttm_bo_type_device,
>> +                     resv, &gobj);
>>       if (r && r != -ERESTARTSYS) {
>> -        if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>> -            flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>> -            goto retry;
>> -        }
>> -
>> -        if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>> -            initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>> -            goto retry;
>> -        }
>>           DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, 
>> %d)\n",
>>                   size, initial_domain, args->in.alignment, r);
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 974e85d8b6cc..919bbea2e3ac 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>           bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>         bo->tbo.bdev = &adev->mman.bdev;
>> -    if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>> -              AMDGPU_GEM_DOMAIN_GDS))
>> -        amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>> -    else
>> -        amdgpu_bo_placement_from_domain(bo, bp->domain);
>> +    amdgpu_bo_placement_from_domain(bo, bp->domain);
>>       if (bp->type == ttm_bo_type_kernel)
>>           bo->tbo.priority = 1;

