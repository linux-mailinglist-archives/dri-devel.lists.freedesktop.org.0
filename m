Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92EA07729
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2310EDD2;
	Thu,  9 Jan 2025 13:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rCO7myj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30F10EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=68HEodGOKWxAVoK/O+yYf/PLiLUr6IDIwTrqovByvtg=; b=rCO7myj+oBHbceLyIy+NqeEaCR
 8qCr8WbVj0JqdXBF86+ESEUbaRhmHZ5ZjpNFzcuExTOxqLMYFpkid75GN9dzdTRNgmpZUSwxlZGOC
 4GUKds3kEueV50v0aKhRyHEtxFeeAOomkkkJ6hIR7uQk0yEfhZIMa9jA3mR7gbvWcVX7Ck1IgCWFi
 wquhaDRrYRstNzvutzIGiGqvq5cmVxX13F5RnqlAg9R6ssCDLGg4qneKBxfE97yln7G5DseleY9B1
 1fSTJyIGrFz9BLPVSPBX+dogp3CQkY5Nc/KacVQazv3PcKL141eilu4V4hs2FpnizUec+ZtxswlUc
 j1FXbrPw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVsSs-00DZGh-LR; Thu, 09 Jan 2025 14:20:46 +0100
Message-ID: <b1abc40d-ebef-4426-9f81-2c3da6b08ccc@igalia.com>
Date: Thu, 9 Jan 2025 13:20:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/18] drm/sched: Remove one local variable
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-4-tvrtko.ursulin@igalia.com>
 <6fa2fd44-c01c-4c29-b3ba-3e1e36b68605@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <6fa2fd44-c01c-4c29-b3ba-3e1e36b68605@amd.com>
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


On 09/01/2025 12:49, Christian König wrote:
> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>> It is not helping readability nor it is required to keep the line length
>> in check.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 1734c17aeea5..01e0d6e686d1 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1175,7 +1175,6 @@ static void drm_sched_run_job_work(struct 
>> work_struct *w)
>>           container_of(w, struct drm_gpu_scheduler, work_run_job);
>>       struct drm_sched_entity *entity;
>>       struct dma_fence *fence;
>> -    struct drm_sched_fence *s_fence;
>>       struct drm_sched_job *sched_job;
>>       int r;
>> @@ -1194,15 +1193,13 @@ static void drm_sched_run_job_work(struct 
>> work_struct *w)
>>           return;
>>       }
>> -    s_fence = sched_job->s_fence;
>> -
>>       atomic_add(sched_job->credits, &sched->credit_count);
>>       drm_sched_job_begin(sched_job);
>>       trace_drm_run_job(sched_job, entity);
>>       fence = sched->ops->run_job(sched_job);
>>       complete_all(&entity->entity_idle);
>> -    drm_sched_fence_scheduled(s_fence, fence);
>> +    drm_sched_fence_scheduled(sched_job->s_fence, fence);
> 
> Originally that was not for readability but for correctness.
> 
> As soon as complete_all(&entity->entity_idle); was called the sched_job 
> could have been released.

And without a comment ouch.

> But we changed that so that the sched_job is released from a separate 
> worker instead, so that is most likely not necessary any more.

Very subtle. Especially given some drivers use unordered queue.

And for them sched_job is dereferenced a few more times in the block 
below so not sure how it is safe.

Move complete_all() to the end of it all?

Regards,

Tvrtko

>>       if (!IS_ERR_OR_NULL(fence)) {
>>           /* Drop for original kref_init of the fence */
> 
