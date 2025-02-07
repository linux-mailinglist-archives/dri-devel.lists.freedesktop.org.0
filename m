Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9149A2C040
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4463110EA92;
	Fri,  7 Feb 2025 10:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TxQ/SjK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145A10EA92
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PSTkU+CEocSqONqUugQkAMa6ZlqATx1rEBdBxtzeRoA=; b=TxQ/SjK2wvGs++L5R37/74ulrg
 K96HMhiVU8ufN2c7uZpRhUueYGN9CfNo2Fn9JilliwwglXc9TEB0CxoomszYIrFvyGdfXpX+/7TmP
 1GT/5vSNqG7vb9z0Dvd8b6zOID0z4kP99koLwK2JDJGFWv0weSi14pxN6dAQKvFUNvpS5+Y9qLBSM
 mQE2BiQSZS/kB2GDMVL3VmzQo2fvYztwE1Ga2ADUc2O195rCNN6xwniztSZz+ueBv5MlFwFJEcX3q
 sNWrDd/0jhXT2ue5L3hIFdev0T59gEXjrg1kakJBiSH2jSDd9BjBEjhNhiD38fkMysi+SrzqDBYx4
 IzRvnpnA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tgLJP-005kOM-9p; Fri, 07 Feb 2025 11:10:21 +0100
Message-ID: <908a2c8f-8245-44b5-88f1-e3865f1fa7c5@igalia.com>
Date: Fri, 7 Feb 2025 10:10:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Remove some unused prototypes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250205110410.7941-1-tvrtko.ursulin@igalia.com>
 <c0d4fa1a-6efe-4de1-b799-435d37313d0a@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c0d4fa1a-6efe-4de1-b799-435d37313d0a@amd.com>
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


On 05/02/2025 12:22, Christian König wrote:
> Am 05.02.25 um 12:04 schrieb Tvrtko Ursulin:
>> As far as I can tell some removed prototypes were introduced by probably
>> bad conflict resolution in
>> fc58764bbf60 ("Merge tag 'amd-drm-next-6.2-2022-11-18' of 
>> https://gitlab.freedesktop.org/agd5f/linux into drm-next").
>>
>> Remove them.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks, pushed to drm-misc-next!

Regards,

Tvrtko

>> ---
>>   include/drm/gpu_scheduler.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index bc573ee8c2be..666968cf505d 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -581,10 +581,6 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>> *sched, struct drm_sched_job *bad);
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>>   void drm_sched_increase_karma(struct drm_sched_job *bad);
>> -void drm_sched_reset_karma(struct drm_sched_job *bad);
>> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
>> -bool drm_sched_dependency_optimized(struct dma_fence* fence,
>> -                    struct drm_sched_entity *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> 
