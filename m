Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D95B362E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1510EC7E;
	Fri,  9 Sep 2022 11:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3F210EC7E;
 Fri,  9 Sep 2022 11:18:23 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id lc7so3309749ejb.0;
 Fri, 09 Sep 2022 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bi30GtiBRj8YIdaZuMYarDamS3N+BqLzVGq0ZkN4HLc=;
 b=EQmpQrZIw0G65juYjN8IEFor3dP+UOEDk5alLbLLhZJ/P+9fmmb61FXYBIYw73I9xW
 OWzTh7nOMxfSHumSEzrSSqBZ8057Luaimlg9AdzmWbVQe96HHFX/IHtAhsD0ubX5UV2Y
 maiqazEY80hVqsIa8lfNxWuu0o/frNq6QeM2CTETqHa4b2AJu7axGGT/20QrFXN3b8Y/
 vNVEm0H7AM+/H2hUG2505yGDZi4GiE3GXkNf1tzY145XkbgTyU+37085k00iqv2c9H29
 QacTFmMA8dq11v226HYi6gxYC0w9PTn7+a1KR4OM/PkDy+489OWB4Sanooh7gnWnr7QC
 7L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bi30GtiBRj8YIdaZuMYarDamS3N+BqLzVGq0ZkN4HLc=;
 b=yUuBf7uvn/sYNEuZsU0A9Ch7QP3ltBAb1xgX17FnMWfYULDQI7nEo920DtcpjbbdDX
 oxvMHQmOrjowGwJt+4agQWG00qEPHy9sor3qUJN+iQjF1bVjgTSufytyrfqYJ8/4bdSL
 5md5Y8i5Xh0hWqyqqJRQA5FKa52WirW/zddvJKRKm7UmwqZtlVLo4Xig08nGsf0t6NYp
 /pu2p336jngvEc83tq+TYgYgb7LFYwZ4rbzzUXXAtW37+nyWzb22ex//f0uZCBL8dZ9X
 HaCBVc020CQ1Cl2w8UoqzABctATy7s7LhJr0O42NaaJfp2pR0LzSwL7M8zfEs4M8IpzS
 h20w==
X-Gm-Message-State: ACgBeo176Aadc78QYRrmWk4259V4g0HZaDEh8l0lLGb9J/XkCXqmGsBW
 kOqyIevLI6nLUHYYie+cdPcYe6FFE4Y=
X-Google-Smtp-Source: AA6agR4hCXJTObYhuJQLJIzIineQPc6soaZe8PNULcRoLt+JbEXzG+80knK9f7/S1tGUSZt8OeXmXA==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr9596960ejc.762.1662722302165; 
 Fri, 09 Sep 2022 04:18:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2ad1:9592:69ea:f12b?
 ([2a02:908:1256:79a0:2ad1:9592:69ea:f12b])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170906278700b007324aa2ca77sm141198ejc.85.2022.09.09.04.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:18:21 -0700 (PDT)
Message-ID: <09634d14-a257-e1fb-5304-ec6d0e2b8eb8@gmail.com>
Date: Fri, 9 Sep 2022 13:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] drm/sched: always keep selecetd ring sched list in
 ctx entity
Content-Language: en-US
To: James Zhu <jamesz@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <20220907205705.934688-3-James.Zhu@amd.com>
 <facee8f2-b674-5893-10fc-ef58ebd76358@amd.com>
 <3a30e256-7966-6f53-8ada-db4c27087259@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <3a30e256-7966-6f53-8ada-db4c27087259@amd.com>
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi James,

please use to_amdgpu_ring(entity->rq->sched) for this.

That's the scheduler which was actually picked for this entity.

Regards,
Christian.

Am 08.09.22 um 15:19 schrieb James Zhu:
> Hi Christian
>
> I need use entity->sched_list to track ring (ring = 
> container_of(sched, struct amdgpu_ring, sched))
>
> during amdgpu_ctx_fini_entity.
>
> I think change here to keep selected ring sched list in 
> entity->sched_list won't change the original logic too much.
>
> Best Regards!
>
> James
>
>
> On 2022-09-08 2:15 a.m., Christian König wrote:
>> Am 07.09.22 um 22:57 schrieb James Zhu:
>>> Always keep selecetd ring sched list in ctx entity.
>>
>> I have no idea what you are doing here, but this certainly doesn't 
>> make sense.
>>
>> Please explain a bit more.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++-----
>>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index f5595607995b..39dca9cb8e0d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -71,7 +71,7 @@ int drm_sched_entity_init(struct drm_sched_entity 
>>> *entity,
>>>       entity->guilty = guilty;
>>>       entity->num_sched_list = num_sched_list;
>>>       entity->priority = priority;
>>> -    entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>> +    entity->sched_list = sched_list;
>>>       entity->last_scheduled = NULL;
>>>         if(num_sched_list)
>>> @@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct 
>>> drm_sched_entity *entity)
>>>       struct drm_sched_rq *rq;
>>>         /* single possible engine and already selected */
>>> -    if (!entity->sched_list)
>>> +    if (entity->num_sched_list <= 1)
>>>           return;
>>>         /* queue non-empty, stay on the same engine */
>>> @@ -482,9 +482,6 @@ void drm_sched_entity_select_rq(struct 
>>> drm_sched_entity *entity)
>>>           entity->rq = rq;
>>>       }
>>>       spin_unlock(&entity->rq_lock);
>>> -
>>> -    if (entity->num_sched_list == 1)
>>> -        entity->sched_list = NULL;
>>>   }
>>>     /**
>>

