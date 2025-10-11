Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617BBCF7B5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 16:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D7110E30C;
	Sat, 11 Oct 2025 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PWJ5k7Lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3821810E1ED;
 Sat, 11 Oct 2025 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrbqZFtsLETuUWu1rXr928e//Cxgx2UZQ2mi8hHUwIk=; b=PWJ5k7LrQmEclzvE1R7x8t7wlZ
 6eHtBEDt4N2DkqOn6Y2W1wxsfUf1B0fFigZwS0GVuHc6tkUep4BA/8zAEG2RFgbRAJ7KZuyXrYrcY
 s3KNPT6II63Z3KODJIVXE8nwrFvA7iF7wjv/GMyaVY9gC5ETF+tImV+tzUHRQf8w//Zm3BNri1oQq
 7pBCatvc1XjXWSWJJG/TD9f/bVKZ03cL5VX/lNPYtyrko8SdDFAN2baweR9a5t+iZycazx074mm1N
 6mkoqkg96w94T8Kc/MFUo3kU49UqbABqvyUj/R8fgO34JYSOO/ze9A9IOTwCfJpbD8ZnT3fyiQ9tS
 lNh+Tglw==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v7b2t-008Gce-2r; Sat, 11 Oct 2025 16:58:07 +0200
Message-ID: <b1155268-1646-4106-8f93-c0928c91aab8@igalia.com>
Date: Sat, 11 Oct 2025 15:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/28] drm/sched: Remove drm_sched_init_args->num_rqs
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-29-tvrtko.ursulin@igalia.com>
 <c45f98141507f25e4bf7d22a99a63ac048071bd2.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c45f98141507f25e4bf7d22a99a63ac048071bd2.camel@mailbox.org>
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



On 10/10/2025 14:00, Philipp Stanner wrote:
> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>> Remove member no longer used by the scheduler core.
> 
> "scheduler core and all drivers."

Done.

Regards,

Tvrtko
> Apart from that, very nice that we can simplify the init-interface.
> 
> P.
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   include/drm/gpu_scheduler.h | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 21129c98ce56..910c43fedcb9 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -607,8 +607,6 @@ struct drm_gpu_scheduler {
>>    * @ops: backend operations provided by the driver
>>    * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>>    *	       allocated and used.
>> - * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
>> - *	     as there's usually one run-queue per priority, but may be less.
>>    * @credit_limit: the number of credits this scheduler can hold from all jobs
>>    * @hang_limit: number of times to allow a job to hang before dropping it.
>>    *		This mechanism is DEPRECATED. Set it to 0.
>> @@ -622,7 +620,6 @@ struct drm_sched_init_args {
>>   	const struct drm_sched_backend_ops *ops;
>>   	struct workqueue_struct *submit_wq;
>>   	struct workqueue_struct *timeout_wq;
>> -	u32 num_rqs;
>>   	u32 credit_limit;
>>   	unsigned int hang_limit;
>>   	long timeout;
> 

