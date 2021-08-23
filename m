Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322433F4822
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 12:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ED38981B;
	Mon, 23 Aug 2021 10:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975CC8981B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 10:02:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q11so25450539wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=+pQ+3Ke3Kk11hUzmHzWXc+vHp7G2TOMoXPh4Qx+6bb0=;
 b=dPXWcMYKyGvU7yU0TW+2/L+iyrN6WabS9p2fXIVcMRbtWVGyaq3ejv+2xX4osLQjyj
 l9KihuddAYZ7WIMxXlzA9/bPSm5kkIqG/QsJl6lMgIbi6qsqi9jhcZHNFV2e+8ZboHo7
 UUKKrFCCn9DBwJ8myNTVGihcteC9XV0duUmM6OJ2jNH4RAtB7fvzPusaS++3fB5tXhOq
 5wK74aqypU2508kFuYGKusm/B2R3C271f3YQbvv0rcj2v/L3hqlyqRQdmZc27AdfJC3o
 h7WxyKSd6VRy+XWzgs7ARKYk9fNpcUB2m8y0i6XVCpoplw2QINUzFKaSjjQEFWUsTsg5
 bf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+pQ+3Ke3Kk11hUzmHzWXc+vHp7G2TOMoXPh4Qx+6bb0=;
 b=gs1kkb6Y9TCqfhKYNmIee0agOQI3uK5/i2qCBTJpPa4DYzYBeDTFc6WhQYq5Uv+cSE
 JMQbwYUkn0McFf++s45mpFcInoxmidiYH74zquE4sl7YRH0F4c37bI2mt8VI52Lb1inC
 bKP+yAwj3WgL51PulMl0Nsgze2keInS+s5YbI3hqQbtr9haSxC2spfGWNvVQsHPvfMmA
 RxnNXLpOmPrASz0zu6+kXm39rsHBJsF14OUFHm3oYIKuiEA6xhZHEEiyc+9jaKpcsaY8
 kcsKXKpxtlcmdVdBbBl3nc2cCDrN0ztEBFimODYYQpvRY1YLcretf8PzXOt9bUqQ2dsv
 WcqA==
X-Gm-Message-State: AOAM533XNTf0PBrv+Qe4k5TRCM+0RwZPPJ534puoiNve1wz5B4PY5O9B
 344+eV9fCyo4LCrbwo2vNAGm6454CCRnIHXr
X-Google-Smtp-Source: ABdhPJzbT2KDcDRdRkD2OTPdKwCGNgpp1dxVJuvPdFZd6KkT7slbiyUSoMQcoxrpVj78n8NocvUD3A==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr12891430wrt.68.1629712967070; 
 Mon, 23 Aug 2021 03:02:47 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id l15sm5776117wms.38.2021.08.23.03.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:02:46 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/ttm: add a weak BO reference to the resource v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20210719115145.1260-1-christian.koenig@amd.com>
 <eb38fc76abf1a30d272ee76f6cb3ba2324297c25.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bb010e5a-6fed-914d-dbba-ae833dcf9628@gmail.com>
Date: Mon, 23 Aug 2021 12:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb38fc76abf1a30d272ee76f6cb3ba2324297c25.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am 23.08.21 um 09:56 schrieb Thomas Hellström:
> Hi, Christian,
>
> Still working through some backlog and this series appears to have
> slipped under the radar.
>
> Still I think a cover letter would benefit reviewers...
>
> On Mon, 2021-07-19 at 13:51 +0200, Christian König wrote:
>> Keep track for which BO a resource was allocated.
>> This is necessary to move the LRU handling into the resources.
> So is this needed, when looking up a resource from the LRU, to find the
> bo the resource is currently attached to?

yes, correct. The main motivation is to fix resource handling during 
allocations and moves.

Essentially we currently have the following steps during resource 
allocation:
1. Locking the BO.
2. Figuring out we need resources.
2. Allocating the resource.
3. Moving the BO to the correct LRU.
4. Unlocking the BO.

The problem is now that we have a short time where we allocated the 
resource, but can't evict it again. In other words we don't know to 
which object a resource belongs.

Buffer moves are even worse since we have an old resource as well as a 
new one at the same time and so potentially would need the BO on two 
LRUs at the same time.

This has caused a whole bunch of problems in the past because we ran 
into out of resource situations and implemented quite a number of 
workarounds for this.

>> A bit problematic is i915 since it tries to use the resource
>> interface without a BO which is illegal from the conceptional
> s/conceptional/conceptual/ ?
>> point of view.
>>
>> v2: Document that this is a weak reference and add a workaround for
>> i915
> Hmm. As pointed out in my previous review the weak pointer should
> really be cleared under a lookup lock to avoid use-after-free bugs.
> I don't see that happening here. Doesn't this series aim for a future
> direction of early destruction of bos and ditching the ghost objects?
> In that case IMHO you need to allow for a NULL bo pointer and any bo
> information needed at resource destruction needs to be copied on the
> resource... (That would also ofc help with the i915 problem).

Yes, I'm going back and force how to do this cleanly as well.

Ok going to give the NULL pointer a try.

>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
>>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 7 +++++--
>>   drivers/gpu/drm/ttm/ttm_resource.c      | 1 +
>>   include/drm/ttm/ttm_resource.h          | 2 ++
>>   4 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
>> b/drivers/gpu/drm/i915/intel_region_ttm.c
>> index 27fe0668d094..980b10a7debf 100644
>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
>> @@ -88,6 +88,7 @@ intel_region_ttm_node_reserve(struct
>> intel_memory_region *mem,
>>          place.fpfn = offset >> PAGE_SHIFT;
>>          place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
>>          mock_bo.base.size = size;
>> +       mock_bo.bdev = &mem->i915->bdev;
>>          ret = man->func->alloc(man, &mock_bo, &place, &res);
>>          if (ret == -ENOSPC)
>>                  ret = -ENXIO;
>> @@ -104,7 +105,11 @@ void intel_region_ttm_node_free(struct
>> intel_memory_region *mem,
>>                                  struct ttm_resource *res)
>>   {
>>          struct ttm_resource_manager *man = mem->region_private;
>> +       struct ttm_buffer_object mock_bo = {};
>>   
>> +       mock_bo.base.size = res->num_pages * PAGE_SIZE;
>> +       mock_bo.bdev = &mem->i915->bdev;
>> +       res->bo = &mock_bo;
>>          man->func->free(man, res);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 2f57f824e6db..a1570aa8ff56 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -239,6 +239,11 @@ static int ttm_buffer_object_transfer(struct
>> ttm_buffer_object *bo,
>>          if (bo->type != ttm_bo_type_sg)
>>                  fbo->base.base.resv = &fbo->base.base._resv;
>>   
>> +       if (fbo->base.resource) {
>> +               fbo->base.resource->bo = &fbo->base;
> This is scary: What if someone else (LRU lookup) just dereferenced the
> previous resource->bo pointer? I think this needs proper weak reference
> locking and lifetime handling, as mentioned above.

Ah, yes good point. Missed this occasion.

Thanks,
Christian.

>
>
>> +               bo->resource = NULL;
>> +       }
>> +
> /Thomas
>
>

