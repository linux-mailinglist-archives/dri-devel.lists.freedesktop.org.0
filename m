Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA67CBD251
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B15B10E3BF;
	Mon, 15 Dec 2025 09:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="sPNKOoZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBEB10E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:20:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so2221351f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765790449; x=1766395249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1o4Ukwhz+1DIRK/ie31cNZ2qDgxL/4NJIT90teDlHCk=;
 b=sPNKOoZ/4m+PtpcQXQZvp8+FCbIXFyn8DfINUVxz7tLJj7IgXYV/eYCaNc5gsHpIBk
 +c63s+bSP7HJcysIqBLQPYj/d3/lukYPHGgAIu01DQlHqg/7C28tILHKnqflwyPgym77
 Ub8lKW9D9ly8xdeic/uqTP9xSBI+4M6oNFg9D77mqgWkMx2MwWVELOO2+JdqsU+1fWPD
 I6+LYLYCc61JjBBUYV81ug/DB1R3SV8yY1V3SIPmO4FLdWGrxIgv7zSAgUma2F9L3E6r
 wAmovmgXh7YyoveiRHAm1DkhxIKuzPcLsa5Xdg2QH+u1TwEdeFhndMWjwabWHEozyoZo
 kk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765790449; x=1766395249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1o4Ukwhz+1DIRK/ie31cNZ2qDgxL/4NJIT90teDlHCk=;
 b=VYHZCpr8jD8dGSBLhXPPOvm9lhIi0+kos7tVEMD7zzM5krN4COhc+FwIFuaHteuluU
 j0D8CZ7XbP3A8LcTeS8VgVl6zbp+maUG+7NqUzfnjImoQ7SG+gRkYWLuCaFeQ3Uuod1e
 cgSqMSBDkRXC6KfA6Wo2fIgFomkfjlb6jpeVWO5tWSo6ZNVm0stKRCZOV29voGDPGGCn
 spLtw8qJusCSwKSUvLF6dgmxkUg5MYX/i/0QyODrenMuDEx0nkDOl33mhdXDH9V5V9Ho
 WoMTM3NLfKL+zy9dGuxLJWftpDUZ/Nozz7uE/mnshpro3GRGy4cy7iAE2AqphS5P8yQB
 IWiw==
X-Gm-Message-State: AOJu0YxM7zohmNULRC2iVrr78qSOlj3N5fX45ACjox8B/bpQ78YQjT9d
 XEYfwzkTPNk0v34W+KSK5HLUBHugA3chxxKtLbd0X/SGC+1g1TtqzgyPXljf6WF2YoM=
X-Gm-Gg: AY/fxX7pOZMWVgRLp9aOrxdIONaOuuELAZzr2FWmRyBP5+4eb8q7HGxSsN3cyXRVORq
 4PKwpBLCdzbQ9sUdSeeyh2AxDQtcOtVhJmKDzPk3iSb9Srw/3G7ZmbzXAJ+o+JtdKvHwPVHMKeS
 18bGprHsDHSjQ0dX3qLyrYiffo6C1Er2KWIAorPSiiUZFNOpjzk+janr/qkNHgRRGcPaChqlV/O
 Q8JPb2+IZ5MRUEoFv3An55Hfp+4T17lRXnSypwfPWgtttLXChvh/WpOeImnmUILnGRrsCU59T2a
 JS/e8bjIOuqAMAC2wHAFGKEtZ5Ln7ilUOFoH7Q2jpfe3cWD4u47mnSE0cwzZjllkhcMaXJnuuQa
 vkntn4s14kETSpz8XWuWthgsDEST+uiteXrPMl76yhHYhj3Ok/beS6WJn3Z/DM0sRsFycBmMwmz
 1NhO6DsA8OAsBPOdV8VXumpbhKuZjQUdIa
X-Google-Smtp-Source: AGHT+IFyXJ1T0HfnJe8lQuVzeAApVxSMprz7p6XFpEhr7U3JrRdPOjmtPXyV/Dptr1jZ0Rjmv9eRAA==
X-Received: by 2002:a05:6000:2909:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-42fb44ba107mr8549329f8f.14.1765790448487; 
 Mon, 15 Dec 2025 01:20:48 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbc6e3392sm16388637f8f.13.2025.12.15.01.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 01:20:47 -0800 (PST)
Message-ID: <e19284e2-ff38-415d-a44d-0ab610032d24@ursulin.net>
Date: Mon, 15 Dec 2025 09:20:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
 <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
 <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
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


On 12/12/2025 15:50, Christian König wrote:
> On 12/11/25 16:13, Tvrtko Ursulin wrote:
>>
>> On 11/12/2025 13:16, Christian König wrote:
>>> Using the inline lock is now the recommended way for dma_fence implementations.
>>>
>>> So use this approach for the scheduler fences as well just in case if
>>> anybody uses this as blueprint for its own implementation.
>>>
>>> Also saves about 4 bytes for the external spinlock.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>>>    include/drm/gpu_scheduler.h             | 4 ----
>>>    2 files changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 08ccbde8b2f5..47471b9e43f9 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>        /* If we already have an earlier deadline, keep it: */
>>>        if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>            ktime_before(fence->deadline, deadline)) {
>>> -        spin_unlock_irqrestore(&fence->lock, flags);
>>> +        dma_fence_unlock_irqrestore(f, flags);
>>
>> Rebase error I guess. Pull into the locking helpers patch.
> 
> No that is actually completely intentional here.
> 
> Previously we had a separate lock which protected both the DMA-fences as well as the deadline state.
> 
> Now we turn that upside down by dropping the separate lock and protecting the deadline state with the dma_fence lock instead.

I don't follow. The code is currently like this:

static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
						  ktime_t deadline)
{
	struct drm_sched_fence *fence = to_drm_sched_fence(f);
	struct dma_fence *parent;
	unsigned long flags;

	spin_lock_irqsave(&fence->lock, flags);

	/* If we already have an earlier deadline, keep it: */
	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
	    ktime_before(fence->deadline, deadline)) {
		spin_unlock_irqrestore(&fence->lock, flags);
		return;
	}

	fence->deadline = deadline;
	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);

	spin_unlock_irqrestore(&fence->lock, flags);...

The diff changes one out of the three lock/unlock operations. Other two 
are changed in 3/19. All three should surely be changed in the same patch.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>            return;
>>>        }
>>>    @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>          fence->owner = owner;
>>>        fence->drm_client_id = drm_client_id;
>>> -    spin_lock_init(&fence->lock);
>>>          return fence;
>>>    }
>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>        fence->sched = entity->rq->sched;
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>> -               &fence->lock, entity->fence_context, seq);
>>> +               NULL, entity->fence_context, seq);
>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>> -               &fence->lock, entity->fence_context + 1, seq);
>>> +               NULL, entity->fence_context + 1, seq);
>>>    }
>>>      module_init(drm_sched_fence_slab_init);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index fb88301b3c45..b77f24a783e3 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>>             * belongs to.
>>>             */
>>>        struct drm_gpu_scheduler    *sched;
>>> -        /**
>>> -         * @lock: the lock used by the scheduled and the finished fences.
>>> -         */
>>> -    spinlock_t            lock;
>>>            /**
>>>             * @owner: job owner for debugging
>>>             */
>>
> 

