Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B737B4ED949
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 14:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407210EA73;
	Thu, 31 Mar 2022 12:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502010EA73
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 12:07:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b15so27922378edn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vJTyhKNO23hGTZpJbaiqO1xUp8UIKgIQDptV+5hg0ec=;
 b=V61fXB/K1jmB62VPnsP/sq37ex2+gSP+ua80YY1Kehh5MQwnsVtCD/E9iZv9GdbnZ8
 WuqGIvWbBHraIraUkOZus4DxZIVm7BKlf6AU1+DiyGPtgX+s0HohCvbNzKZIyQogt2Iy
 LR2AFWlpvIcmKLAs7VcKL2NyHcjISGWaavXzbJfOxQ3xBMLmf4gOFlMcZN3hRwBtGn0G
 1yGdom0oLqeQ1u741RVNK7bpYyZ/s/3xXiGu+QvWiZBZ15wVoJrwF+L99Tj4ZTB0zLmu
 KZ8U5ZhCB1hqZB+Xl7CbnCKsjca8n6uIQzP7YFjJ9XzYaESXsksIlWXiBGCSzykVdqQ7
 g/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vJTyhKNO23hGTZpJbaiqO1xUp8UIKgIQDptV+5hg0ec=;
 b=hfPp9Q8aahr9Dz8lhr9wdPIkJX0WgNxKI4HxwmooH45nSjAVjwKZPP/XN3pVeybLQi
 pUFvbmUgUfHBcCZ6Ffu4ATdlxc8nRtovNRIJsLPNg/4cCdHyX3ntEAvazJlywwpcFKpi
 FYLN/6Nvm+yUF4+7bKyT56uejhGzgcLHJyKkeKxdXwu1sMKgd0/4mKS+uP6quFw0q5mA
 eK0yiBKdvm1poiuDT0yGN9d8mveKrAZ69XBNgeYeutEDT3E1dtXH/3+9PUjOlrTrBr1f
 t3b9whOYCOPaTne/S1DMZCtyiAQ0/i95sII5DDxWOHH31+FMgdJVYopbfIvDEX5zesuY
 5INA==
X-Gm-Message-State: AOAM5309jwIaU+St3wwDMqpTejVAv6jeZU+GeybQJfSlDjevp1zbUJKq
 ug4ut5UCJj2omzsM04U75sk=
X-Google-Smtp-Source: ABdhPJzijaAPo3lAWD7HeuM/zfRK7saxR+qjA5mySDtsCYZ54HzYS8s5PZNfJskwjMgSSRmOafvNUw==
X-Received: by 2002:aa7:c3ce:0:b0:41b:679c:adc3 with SMTP id
 l14-20020aa7c3ce000000b0041b679cadc3mr8065450edr.344.1648728432850; 
 Thu, 31 Mar 2022 05:07:12 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906748a00b006dfaff31e88sm9433871ejl.125.2022.03.31.05.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 05:07:12 -0700 (PDT)
Message-ID: <8c3bb3ba-1c30-7323-2be0-870b9633b406@gmail.com>
Date: Thu, 31 Mar 2022 14:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/23] dma-buf/drivers: make reserving a shared slot
 mandatory v3
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-12-christian.koenig@amd.com>
 <YkHs7tKWtzBpRE/a@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YkHs7tKWtzBpRE/a@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.03.22 um 19:14 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:58:45PM +0100, Christian König wrote:
>> [SNIP]
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index ea0cde4904f0..2f808decd8d9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1384,6 +1384,14 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
>>   		     bool shared)
>>   {
>>   	struct dma_resv *resv = bo->tbo.base.resv;
>> +	int r;
>> +
>> +	r = dma_resv_reserve_fences(resv, 1);
> This is quite a hack, but I did scroll through all the callers of
> amdgpu_bo_fence and I think it's fine - i.e. no recursion into the
> shrinker from a calling context where recursion into shrinker/memalloc
> isn't allowed.
>
> But it aint pretty :-/

Yeah, but one long term goal of this is to remove all the hacky handling 
of manually adding fences to the resv object using this function. I 
could add a TODO if that helps.

> [SNIP]
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index ee9612a3ee5e..4de6500f3c55 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -596,7 +596,11 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>>   	assert_object_held(src);
>>   	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>>   
>> -	ret = dma_resv_reserve_shared(src_bo->base.resv, 1);
>> +	ret = dma_resv_reserve_fences(src_bo->base.resv, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dma_resv_reserve_fences(dst_bo->base.resv, 1);
> Can't we just reserve 2 slots instead of doing this 2x?

*handing you some coffee* We reserve one one slot on the source and one 
on the destination buffer :)

> [SNIP]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a6925dbb6224..c34114560e49 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -247,6 +247,10 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
>   	int i, ret;
>   
>   	for (i = 0; i < bo_count; i++) {
> +		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
> +		if (ret)
> +			return ret;
> +
>   		/* panfrost always uses write mode in its current uapi */
>   		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
> I wonder whether we shouldn't move the dma-resv reserving into some shared
> helpers eventually ...

I was going back and forth adding this to 
drm_sched_job_add_implicit_dependencies(), but then decided against that 
because it is really two independent functionalities.

>> [SNIP]
>> @@ -120,9 +119,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>>   			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
>>   		}
>>   
>> -		if (!ret && entry->num_shared)
>> -			ret = dma_resv_reserve_shared(bo->base.resv,
>> -								entry->num_shared);
>> +		if (!ret)
>> +			ret = dma_resv_reserve_fences(bo->base.resv,
>> +						      num_fences);
>>   
>>   		if (unlikely(ret != 0)) {
>>   			if (ticket) {
> I didn't fine the corresponding reserve for the dma_resv_add_excl_fence()
> in ttm_bo_move_accel_cleanup(). Was that an oversight?

Mhm, need to double check as well. Could be that I missed that one.

>> [SNIP]
>> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
>> index 4abf10b66fe8..594bd6bb00d2 100644
>> --- a/drivers/gpu/drm/vc4/vc4_gem.c
>> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
>> @@ -644,7 +644,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>>   	for (i = 0; i < exec->bo_count; i++) {
>>   		bo = &exec->bo[i]->base;
>>   
>> -		ret = dma_resv_reserve_shared(bo->resv, 1);
>> +		ret = dma_resv_reserve_fences(bo->resv, 1);
>>   		if (ret) {
>>   			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>>   			return ret;
> v3d and vc4 are missing in the conversion. I think for both you need to
> add it before the call to  like
> with etnaviv.

Both drivers already have the necessary calls. See 
vc4_lock_bo_reservations() and v3d_lock_bo_reservations().

>> [SNIP]
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
>> index 48d3c9955f0d..1820ca6cf673 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
>> @@ -214,6 +214,7 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
>>   
>>   int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>>   {
>> +	unsigned int i;
>>   	int ret;
>>   
>>   	if (objs->nents == 1) {
>> @@ -222,6 +223,14 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>>   		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
>>   						&objs->ticket);
>>   	}
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < objs->nents; ++i) {
>> +		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
> I think you could stuff this into the same loop, but also probably doesn't
> matter.

Na, that loop is inside drm_gem_lock_reservations().

> [SNIP]
>
> I found a few things, but with those (vc4 and v3d plus the ttm question,
> the other stuff is just comments) corrected this gets my

Going to double check the TTM case once more, but apart from that I 
think its solid.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>> -- 
>> 2.25.1
>>

