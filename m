Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29993B039
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 13:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F3110E5B0;
	Wed, 24 Jul 2024 11:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E0m/O2Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42F10E45A;
 Wed, 24 Jul 2024 11:16:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so49778405e9.1; 
 Wed, 24 Jul 2024 04:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721819774; x=1722424574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nbZ27IdWEojiSB+Eu+ZPwskJer/a7rMdIjPzx40l3N0=;
 b=E0m/O2RcblGSLGEO3xzvjlzuzLDjbSVHCUz4hGlHy99clgyzyfxETf9/0dn4Lx3V7a
 6TGxvfKyhuHNCqufoXQfUVI0i8UmYLZMS7l5VwePEDahkxi2jz44HIL6ppNJs5EZrwWD
 FrezkKur/uU4/zZweClcdnvgxv6jd/O5ucj4ch+8IAyMgOlXpNjUJnmRZ+NC/i76vSbr
 fAixs5nYhM4Sub/N/EjVm5CbJ7bTxM2bGGReqJ1OpFpN3aKFQDljRC6GPgRmKXhI1S0y
 /wDFOrpUtac8/xboqF0j+eaQ2SAd/NC9TkftCIQpL+0fYt2CeUAOcWh7WCwIURnrHNdq
 R2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721819774; x=1722424574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nbZ27IdWEojiSB+Eu+ZPwskJer/a7rMdIjPzx40l3N0=;
 b=HOWKULAcy+pwccAXE7egx6HI22uFTElo7fFFGh3FHvmCxaR1GgFCWdQKgXsP6scHEr
 cIb76SLtajiWLXucP9KaNJeZCUa/nsoxpzq+ow1H/JQF+eO9/EZVXactQiuL6RjRnkp5
 MXdevhTzo5PHl9K6q407h2YFLPrJRsiUWDHZwAcCBAFIZgXxpwQ/6wMwH90h88SE4nAe
 m66x3oO60N2CSkvXUu4IwRowmLOvaiq9JZdyXYoK7J75DkPbUNlB1xHDCRWzYyoFqA5p
 5Xpm070OZk3zlwERueMfbMVeqOhap9D6nUoo3Vx8VqeGOkSsjJpi/3lofpaBXFkmOp+3
 is3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/KVG5YL+4zY8uGhmYcF+FmNLu5rsmzwgNeMexCnAeXR/jsGCr9a30eQyAgPRRCvm7rDzrPizLL5R7Z9WuJ1SvDOxwxBpVRO2x+N7Lly/evLv71GXQYBVWCa9hJw/zWv4oddsHnSY4oUPBOZ/Nuw==
X-Gm-Message-State: AOJu0YxLl9neUqFAOrbxmK38ZaqJWRYhV5D+B4k2XRNqdbryYrXPP1p2
 lZSH30kv0WmI1zsth6xsR2aMLCgey4oSTmWe27AAH+z1d8pLAkR/
X-Google-Smtp-Source: AGHT+IGjucIe7OxIbRHeviaZDakUyTLR2YSb3H/cuXMxwuLWRehwios9zXznp7Jx4gKXyjCq/rrljw==
X-Received: by 2002:a05:600c:4e91:b0:426:607c:1863 with SMTP id
 5b1f17b1804b1-427dc524df2mr85624315e9.21.1721819773702; 
 Wed, 24 Jul 2024 04:16:13 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f935946dsm26136045e9.4.2024.07.24.04.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 04:16:13 -0700 (PDT)
Message-ID: <fb7b7ce4-294e-463b-93b7-565099e1c2d8@gmail.com>
Date: Wed, 24 Jul 2024 13:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240719094730.55301-1-tursulin@igalia.com>
 <61bd1b84-a7f3-46fd-8511-27e306806c8d@gmail.com>
 <bd1f203f-d8c4-4c93-8074-79c3df4fe159@gmail.com>
 <8f977694-eb15-4b64-97f7-f2b8921de5cf@igalia.com>
 <eb8a2ce7-223f-4518-8d72-fac875a51f98@amd.com>
 <9867a2b2-6729-424f-abc9-e1d1b81bab41@igalia.com>
 <6b254b3d-a6d9-4b12-9a5e-dacb32d41ee9@amd.com>
 <ecc032cd-d595-4f4d-a96a-bee51f290547@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ecc032cd-d595-4f4d-a96a-bee51f290547@igalia.com>
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

Am 24.07.24 um 10:16 schrieb Tvrtko Ursulin:
> [SNIP]
>>
>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
>>
>> Absolutely.
>
> Absolutely good and absolutely me, or absolutely you? :)

You, I don't even have time to finish all the stuff I already started :/

>
> These are the TODO points and their opens:
>
> - Adjust amdgpu_ctx_set_entity_priority() to call 
> drm_sched_entity_modify_sched() regardless of the hw_type - to fix 
> priority changes on a single sched other than gfx or compute.

Either that or to stop using the scheduler priority to implement 
userspace priorities and always use different HW queues for that.

>
> - Document sched_list array lifetime must align with the entity and 
> adjust the callers.
>
> Open:
>
> Do you still oppose keeping sched_list for num_scheds == 1?

Not if you can fix up all callers.

> If so do you propose drm_sched_entity_modify_sched() keeps disagreeing 
> with drm_sched_entity_init() on this detail? And keep the "one shot 
> single sched_list" quirk in? Why is that nicer than simply keeping the 
> list and remove that quirk? Once lifetime rules are clear it IMO is 
> okay to always keep the list.

Yeah if every caller of drm_sched_entity_init() can be fixed I'm fine 
with that as well.

>
> - Remove drm_sched_entity_set_priority().
>
> Open:
>
> Should we at this point also modify amdgpu_device_init_schedulers() to 
> stop initialising schedulers with DRM_SCHED_PRIORITY_COUNT run queues?

One step at a time.

>
> Once drm_sched_entity_set_priority() is gone there is little point. 
> Unless there are some non-obvious games with the kernel priority or 
> something.
>
>>>>>> In general scheduler priorities were meant to be used for things 
>>>>>> like kernel queues which would always have higher priority than 
>>>>>> user space submissions and using them for userspace turned out to 
>>>>>> be not such a good idea.
>>>>>
>>>>> Out of curiousity what were the problems? I cannot think of 
>>>>> anything fundamental since there are priorities at the backend 
>>>>> level after all, just fewer levels.
>>>>
>>>> A higher level queue can starve lower level queues to the point 
>>>> that they never get a chance to get anything running.
>>>
>>> Oh that.. well I call that implementation details. :) Because 
>>> nowhere in the uapi is I think guaranteed execution ordering needs 
>>> to be strictly in descending priority. This potentially goes back to 
>>> what you said above that a potential larger rewrite might be 
>>> beneficial. Implementing some smarter scheduling. Although the issue 
>>> will be it is just frontend scheduling after all. So a bit 
>>> questionable to invest in making it too smart.
>>
>> +1 and we have a bug report complaining that RR is in at least one 
>> situation better than FIFO. So it is actually quite hard to remove.
>>
>> On the other hand FIFO has some really nice properties as well. E.g. 
>> try to run >100 glxgears instances (on weaker hw) and just visually 
>> compare the result differences between RR and FIFO. FIFO is baby 
>> smooth and RR is basically stuttering all the time.
>>
>>> I think this goes more back to what I was suggesting during early xe 
>>> days, that potentially drm scheduler should be split into dependency 
>>> handling part and the scheduler part. Drivers with 1:1 
>>> entity:scheduler and full hardware/firmware scheduling do not really 
>>> need neither fifo or rr.
>>
>> Yeah that's my thinking as well and I also suggested that multiple 
>> times in discussions with Sima and others.
>>
>>>
>>>> This basically means that userspace gets a chance to submit 
>>>> infinity fences with all the bad consequences.
>>>>
>>>>>
>>>>> I mean one problem unrelated to this discussion is this:
>>>>>
>>>>> void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>> {
>>>>>     struct dma_fence *fence;
>>>>>     struct drm_gpu_scheduler *sched;
>>>>>     struct drm_sched_rq *rq;
>>>>>
>>>>>     /* queue non-empty, stay on the same engine */
>>>>>     if (spsc_queue_count(&entity->job_queue))
>>>>>         return;
>>>>>
>>>>> Which makes it look like the entity with a constant trickle of 
>>>>> jobs will never actually manage to change it's run queue. Neither 
>>>>> today, nor after the potential drm_sched_entity_set_priority() 
>>>>> removal.
>>>>
>>>> That's intentional and based on how the scheduler load balancing 
>>>> works.
>>>
>>> I see that it is intentional but if it can silently prevent priority 
>>> changes (even hw priority) it is not very solid. Unless I am missing 
>>> something here.
>>
>> IIRC the GSoC student who implemented this (with me as mentor) 
>> actually documented that behavior somewhere.
>>
>> And to be honest it kind of makes sense because switching priorities 
>> would otherwise be disruptive, e.g. you have a moment were you need 
>> to drain all previous submissions with the old priority before you 
>> can do new ones with the new priority.
>
> Hmmm I don't see how it makes sense. Perhaps a test case for 
> AMDGPU_SCHED_OP_*_PRIORITY_OVERRIDE is missing to show how it doesn't 
> work. Or at least how easy it can be defeated with callers none the 
> wiser.

Ok, that needs a bit longer explanation. You don't by any chance have teams?

>
> For context I am kind of interested because I wired up amdgpu to the 
> DRM cgroup controller and use priority override to de-prioritize 
> certain cgroups and it kind of works. But again, it will not be great 
> if a client with a constant trickle of submissions can just defeat it.

Yeah, exactly that use case is currently not possible :(

Regards,
Christian.


>
> Regards,
>
> Tvrtko

