Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ACBA4263E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8F10E3F5;
	Mon, 24 Feb 2025 15:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="R14mv4fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30C510E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:29:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so32481645e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1740410943; x=1741015743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gffEozykQ8vm3vt/eTUO/9qSmO4rptuqRph1HBGJlk=;
 b=R14mv4fmnVDith1vcOHm/GvN6VyCmmgjt3zk4by1zRGm+H3nlQbMcMYwtbakHH0U9u
 rOLOHfIXGS9mfvIwiWw94hj5xqhfmokLW9GhYu/xYy0WnIcIE85eS/Od1ViIvnJn/33e
 +CVZaQIHrqfjjmMttmLYbKo7+ufH8r4C+WhZvv8rEE3iChQWMc2SajwXmXcmnYp9B+q7
 psGw4t+WuBOkx28RPrG9nCRxP9LFDqavh1HD+aPLvgfxHmixSClxiNHp75IgDtY58obQ
 dPsRf+2qHQeGQ4fvlulFAB6eHPkazn5bJ0YCNNOFNMLkY6Uw0OgoOc6HtMBaIrVKgGTy
 1Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740410943; x=1741015743;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gffEozykQ8vm3vt/eTUO/9qSmO4rptuqRph1HBGJlk=;
 b=bDpdjDGn/XH4voRVXOhkw0LrQBpAU8r/n463mntsGflBfMgCQAKc2FNBjnvsUcoloi
 g+RY8IgG8N3p6Y2N6PBKwSHhAISEATItGpdLORFlJqK5/oiBbnlvmEUnipnaplGf4ogl
 hb1w2fKJgIt+4CCDSGG+37oAvcdf8AOBxViV5lSnCpxSNnW+cCqBGE2yDdv544v1dAKs
 6/rtV8tJLYp4ze1SkBn64IEV9lXSIj54MSRUCzoNjIfFL0hwleIbaLXNY5Az1n+KZAvf
 /rlUDAQhB4OPlH1n1nv/TiJU8X5QASrPAwRgOuCNbniWzxXM+OcIuEq3+6azUMbI91gI
 ceWw==
X-Gm-Message-State: AOJu0YxmU0ZsxJX/5Z/rlo3d6nnQisZcIK/TZAebABLF5xgY1sEr0RW+
 YpE9qZjyUns79JwJ9izm+/FhGmqsrVHHdycgujm/UdGfmtCZUPForx/tzW8y5Fk=
X-Gm-Gg: ASbGncsJh9szCrnJtghJpKEd9t3CFWB5xhQI2G9uka0FMi1dWU9I2aGnj9E9oSw4J6F
 HCpgXE4klnhBjBt8A4aDe1d/2Yz08tRbvKVX3QRfjznWKv0Bw2RZObGrACe8Skx+bQ6h8zjivEh
 G4+OZ09ZbYFsaMkley69b/FQy9hk7ytvUiTviU/G9/tyXnGkUW8c632rfWDlHP4zEGEA8JTHFu1
 ISEA5xhbgY58e3kR/qt6m88BpMcleh/EcpwM346nDBNu1kEb+8lOiLNAvPQdkaT+3ICyjIo5aqi
 WD/tiGAggBgwssJEwJoQmrY4IxzWtZQj7SnmIRlGDQ==
X-Google-Smtp-Source: AGHT+IFPzGRf53fjeBF7TLlTs3paKCZFdwVLTTSrhJ3Lux1wsfHkxxU1KVSOPL/QSnZGh397sTfMFA==
X-Received: by 2002:a5d:64e6:0:b0:38d:b028:d906 with SMTP id
 ffacd0b85a97d-38f6f51535amr12004060f8f.21.1740410943020; 
 Mon, 24 Feb 2025 07:29:03 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f2591513bsm32146380f8f.55.2025.02.24.07.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 07:29:02 -0800 (PST)
Message-ID: <03c8c2a3-5061-450b-a6fc-2a708a2dc4b5@ursulin.net>
Date: Mon, 24 Feb 2025 15:29:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: stop passing non struct drm_device to
 drm_err() and friends
To: Jani Nikula <jani.nikula@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
 <Z5KeZnJ4HOxs1wuk@phenom.ffwll.local> <87msfgbfjz.fsf@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <87msfgbfjz.fsf@intel.com>
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


On 24/01/2025 11:46, Jani Nikula wrote:
> On Thu, 23 Jan 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>> On Thu, Jan 23, 2025 at 05:09:10PM +0200, Jani Nikula wrote:
>>> The expectation is that the struct drm_device based logging helpers get
>>> passed an actual struct drm_device pointer rather than some random
>>> struct pointer where you can dereference the ->dev member.
>>>
>>> Convert drm_err(sched, ...) to dev_err(sched->dev, ...) and
>>> similar. This matches current usage, as struct drm_device is not
>>> available, but drops "[drm]" or "[drm] *ERROR*" prefix from logging.
>>>
>>> Unfortunately, there's no dev_WARN_ON(), so the conversion is not
>>> exactly the same.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> For the two previous patches just dev_ makes sense since they're just
>> platform drivers, but for drm/sched I wonder whether it wouldn't be better
>> to switch from struct device * to struct drm_device * instead. I guess
>> might be best to leave that decision to scheduler folks.
> 
> I had a very brief look, and it seemed like struct drm_device isn't
> passed around in sched. If use of struct drm_device is preferred, I'm
> not the best person to figure out how to do that. But the abuse of the
> drm_err() and friends macros needs to stop.

FWIW I agree it should be the DRM device and I even wanted to tidy this 
some time ago but something distracted me. Worst thing here is that 
sched->dev was apparently added exactly to enable abuse of the logging 
macros. See 8ab62eda177b ("drm/sched: Add device pointer to 
drm_gpu_scheduler"). Logging is the only use for sched->dev at the moment.

But I think it is fine to merge your patch until a more comprehensive 
cleanup happens. Only drm_sched_available_credits loses the device 
information and that one should be unreachable anyway.

Regards,

Tvrtko

>> Anyway on the series and with that caveat:
>>
>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Thanks,
> Jani.
> 
>>
>>
>>>
>>> ---
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 20 +++++++++++---------
>>>   2 files changed, 12 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 69bcf0e99d57..e29af71d4b5c 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>   		 * the lowest priority available.
>>>   		 */
>>>   		if (entity->priority >= sched_list[0]->num_rqs) {
>>> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
>>> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
>>>   				entity->priority, sched_list[0]->num_rqs);
>>>   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>>>   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a48be16ab84f..d1c1f22fd1db 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	u32 credits;
>>>   
>>> -	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
>>> -					      atomic_read(&sched->credit_count),
>>> -					      &credits));
>>> +	WARN_ON(check_sub_overflow(sched->credit_limit,
>>> +				   atomic_read(&sched->credit_count),
>>> +				   &credits));
>>>   
>>>   	return credits;
>>>   }
>>> @@ -130,9 +130,11 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>   	/* If a job exceeds the credit limit, truncate it to the credit limit
>>>   	 * itself to guarantee forward progress.
>>>   	 */
>>> -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
>>> -		     "Jobs may not exceed the credit limit, truncate.\n"))
>>> +	if (s_job->credits > sched->credit_limit) {
>>> +		dev_WARN(sched->dev,
>>> +			 "Jobs may not exceed the credit limit, truncate.\n");
>>>   		s_job->credits = sched->credit_limit;
>>> +	}
>>>   
>>>   	return drm_sched_available_credits(sched) >= s_job->credits;
>>>   }
>>> @@ -790,7 +792,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>   		 * or worse--a blank screen--leave a trail in the
>>>   		 * logs, so this can be debugged easier.
>>>   		 */
>>> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>> +		dev_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
>>>   		return -ENOENT;
>>>   	}
>>>   
>>> @@ -1280,7 +1282,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>   	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>>   		/* This is a gross violation--tell drivers what the  problem is.
>>>   		 */
>>> -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>>> +		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>>>   			__func__);
>>>   		return -EINVAL;
>>>   	} else if (sched->sched_rq) {
>>> @@ -1288,7 +1290,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>   		 * fine-tune their DRM calling order, and return all
>>>   		 * is good.
>>>   		 */
>>> -		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
>>> +		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__);
>>>   		return 0;
>>>   	}
>>>   
>>> @@ -1343,7 +1345,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>   Out_check_own:
>>>   	if (sched->own_submit_wq)
>>>   		destroy_workqueue(sched->submit_wq);
>>> -	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
>>> +	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
>>>   	return -ENOMEM;
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_init);
>>> -- 
>>> 2.39.5
>>>
> 

