Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJu9N2XlcWngMwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:52:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93922637AD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0E10E944;
	Thu, 22 Jan 2026 08:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QaYXlM0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22A10E02E;
 Thu, 22 Jan 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7oK8Ef8/F27RzkcoKhaNWoiKkhqg7pKmCD8zxWO5OY=; b=QaYXlM0NZ7HTTGnooWS44gfjQj
 ppXp5p7Z1EGlFz+d8mOjboI5zOtjJHYNFerIQHj2Z91F7I1RFKZI0cmz4xRezFSmHCxr3WdebbT+C
 dAC1dhyqaJx+Dj75tadHpQIfOKzEjRGACnxiSOBMpsu/nW22RHEa3TlbmyWd2bDGAgX09y+g9HeQW
 1HaCZj32Sn6GMh5D5SY3UIOxW1vAZe0s07KZZTkjGsHRMwoIOdFXW+dlVXF8qdblGs35x03sz7ZgB
 +YXP8jqu2e9C3PtD+7ZNwZibEmonKlhcT1KLrbPeYj85LI2sUhH49efAO5eOplHy4vzyvdUvM3Ge+
 PG7kn4sw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1viqQj-008NBQ-Nj; Thu, 22 Jan 2026 09:52:41 +0100
Message-ID: <3d880b9c-e00a-40f5-8043-57240c6b9cd4@igalia.com>
Date: Thu, 22 Jan 2026 08:52:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] drm/sched: Disallow initializing entities with no
 schedulers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
 <a763700944ed4ccfe2f36ae805e4a348dd3fd10f.camel@mailbox.org>
 <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
 <87d5ab37bb3594ee8b1707ffaa28f4937a7f0ad4.camel@mailbox.org>
 <207265df-4caf-4899-83be-ecd5b21d95cc@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <207265df-4caf-4899-83be-ecd5b21d95cc@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-]
X-Rspamd-Queue-Id: 93922637AD
X-Rspamd-Action: no action


On 12/01/2026 12:51, Christian König wrote:
> On 1/12/26 13:49, Philipp Stanner wrote:
>> On Mon, 2026-01-12 at 10:29 +0000, Tvrtko Ursulin wrote:
>>>
>>> On 08/01/2026 13:54, Philipp Stanner wrote:
>>>> What's the merge plan for this series? Christian?
>>>
>>> It sounds that staged merge would be safest. First two patches could go
>>> to amd-next and if everything will look fine, I would follow up by
>>> sending the DRM scheduler patch once amdgpu patches land to drm-next.
>>
>> Works for me.
> 
> Sounds like a plan to me as well.

Would you be able to test the first two patches with the AMD test suite? 
Or put it into amd-staging-next if it would be automatically validated 
there?

Or even all three patches.

On the overall I am keen to get a clear picture whether last patch will 
be a go or no-go because my fair scheduler rewrite conflicts with it.

Regards,

Tvrtko

>>> Or if DRM scheduler maintainers are happy for the DRM scheduler patch to
>>> also go via amd-next that is another option.
>>>    > On Wed, 2026-01-07 at 12:43 +0000, Tvrtko Ursulin wrote:
>>>>> Since we have removed the case where amdgpu was initializing entitites
>>>>> with either no schedulers on the list, or with a single NULL scheduler,
>>>>> and there appears no other drivers which rely on this, we can simplify the
>>>>> scheduler by explictly rejecting that early.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++---------
>>>>>    1 file changed, 4 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index fe174a4857be..bb7e5fc47f99 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -61,32 +61,27 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>>    			  unsigned int num_sched_list,
>>>>>    			  atomic_t *guilty)
>>>>>    {
>>>>> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
>>>>> +	if (!entity || !sched_list || !num_sched_list || !sched_list[0])
>>>>
>>>> I personally am a fan of checking integers explicitly against a number,
>>>> which would make the diff a bit more straightforward, too. But I accept
>>>> that like that is common kernel practice.
>>>>
>>>>>    		return -EINVAL;
>>>>>    
>>>>>    	memset(entity, 0, sizeof(struct drm_sched_entity));
>>>>>    	INIT_LIST_HEAD(&entity->list);
>>>>>    	entity->rq = NULL;
>>>>>    	entity->guilty = guilty;
>>>>> -	entity->num_sched_list = num_sched_list;
>>>>>    	entity->priority = priority;
>>>>>    	entity->last_user = current->group_leader;
>>>>> -	/*
>>>>> -	 * It's perfectly valid to initialize an entity without having a valid
>>>>> -	 * scheduler attached. It's just not valid to use the scheduler before it
>>>>> -	 * is initialized itself.
>>>>> -	 */
>>>>> +	entity->num_sched_list = num_sched_list;
>>>>
>>>> Why do you move that line downwards? Just leave it where it was?
>>>> num_sched_list isn't changed or anything, so I don't see a logical
>>>> connection to the line below so that grouping would make sense.
>>>
>>> It looks completely logical to me to have both lines dealing with the
>>> same scheduler list, accessing the same input parameter even, next to
>>> each other:
>>>
>>>     entity->num_sched_list = num_sched_list;
>>>     entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>
>>> No? In other words, I can respin if you insist but I don't see the need.
>>
>> Fine by me. Though a little sentence about that cosmetical change in
>> the commit message would have made that clearer.
>>
>>
>> Greetings
>> P.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> With that:
>>>> Acked-by: Philipp Stanner <phasta@kernel.org>
>>>>
>>>>
>>>> P.
>>>>
>>>>>    	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>>    	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>>>    	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>>    
>>>>> -	if (num_sched_list && !sched_list[0]->sched_rq) {
>>>>> +	if (!sched_list[0]->sched_rq) {
>>>>>    		/* Since every entry covered by num_sched_list
>>>>>    		 * should be non-NULL and therefore we warn drivers
>>>>>    		 * not to do this and to fix their DRM calling order.
>>>>>    		 */
>>>>>    		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>>>> -	} else if (num_sched_list) {
>>>>> +	} else {
>>>>>    		/* The "priority" of an entity cannot exceed the number of run-queues of a
>>>>>    		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
>>>>>    		 * the lowest priority available.
>>>>
>>>
>>
> 

