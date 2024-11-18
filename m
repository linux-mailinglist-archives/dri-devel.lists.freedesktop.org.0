Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E563D9D14A1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5CE10E516;
	Mon, 18 Nov 2024 15:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r3tGsDQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9010E516;
 Mon, 18 Nov 2024 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gjlj+8pI7iKltGAS+pM3XlLAUwzmQ0mgAsg2XLJWqI0=; b=r3tGsDQiKD84tfrZ+JBVStiWzD
 ovPWrIFb6THxctS2rpUIu0nwSrH/bAavv/uWOmhNIoTjajbmqx0m6NLbbF+GrJgmwKx8imKAbxZCq
 5sTQ8kk9XDmJ7ZxkzlDmIldCc391Qn7BaDWHRoQGMUwVc2RKF6wYW1Rh9HaxFwQcQXGm7X7hve+ZS
 3q0/uix0J3HEv6fpCtUHVJDDHA7FAuIIvHGCz2Pe7aIY3ZyixIQ/62uZc4mNmAbyXaeugBovxQkS5
 hE5BKvQIQVlElo93SZqLdQfgRc470M97f0MMplWw2EuTMuy7DJWNJB3Cabam0gD8Q9Y8OSqgMpi34
 YNFCNHeQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tD3ty-008ZsV-59; Mon, 18 Nov 2024 16:42:58 +0100
Message-ID: <4ce953a9-f9b1-42c2-8efd-670af35474e3@igalia.com>
Date: Mon, 18 Nov 2024 15:42:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm: make drm-active- stats optional
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>
References: <20241110154152.592-1-Yunxiang.Li@amd.com>
 <20241110154152.592-3-Yunxiang.Li@amd.com>
 <3706dc4f-db98-45e0-b870-f10368ab1ab9@igalia.com>
 <SA1PR12MB8599BD231D856C89DE4207BAED272@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <SA1PR12MB8599BD231D856C89DE4207BAED272@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 18/11/2024 15:17, Li, Yunxiang (Teddy) wrote:
> [Public]
> 
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Monday, November 11, 2024 5:30
>> On 10/11/2024 15:41, Yunxiang Li wrote:
>>> Make drm-active- optional just like drm-resident- and drm-purgeable-.
>>
>> As Jani has already commented the commit message needs some work.
>>
>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>> CC: dri-devel@lists.freedesktop.org
>>> CC: intel-gfx@lists.freedesktop.org
>>> CC: amd-gfx@lists.freedesktop.org
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  1 +
>>>    drivers/gpu/drm/drm_file.c                 | 13 +++++++------
>>>    drivers/gpu/drm/i915/i915_drm_client.c     |  1 +
>>>    drivers/gpu/drm/xe/xe_drm_client.c         |  1 +
>>>    include/drm/drm_gem.h                      | 14 ++++++++------
>>>    5 files changed, 18 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> index df2cf5c339255..7717e3e4f05b5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>> @@ -97,6 +97,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p,
>>> struct drm_file *file)
>>>
>>>              drm_print_memory_stats(p,
>>>                                     &stats[i].drm,
>>> +                                  DRM_GEM_OBJECT_ACTIVE |
>>>                                     DRM_GEM_OBJECT_RESIDENT |
>>>                                     DRM_GEM_OBJECT_PURGEABLE,
>>>                                     pl_name[i]);
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index e285fcc28c59c..fd06671054723 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -884,7 +884,9 @@ void drm_print_memory_stats(struct drm_printer *p,
>>>    {
>>>      print_size(p, "total", region, stats->private + stats->shared);
>>>      print_size(p, "shared", region, stats->shared);
>>> -   print_size(p, "active", region, stats->active);
>>> +
>>> +   if (supported_status & DRM_GEM_OBJECT_ACTIVE)
>>> +           print_size(p, "active", region, stats->active);
>>>
>>>      if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>>>              print_size(p, "resident", region, stats->resident); @@ -917,15
>>> +919,13 @@ void drm_show_memory_stats(struct drm_printer *p, struct
>>> drm_file *file)
>>>
>>>              if (obj->funcs && obj->funcs->status) {
>>>                      s = obj->funcs->status(obj);
>>> -                   supported_status = DRM_GEM_OBJECT_RESIDENT |
>>> -                                   DRM_GEM_OBJECT_PURGEABLE;
>>> +                   supported_status |= s;
>>
>> I think this is correct and I think I've raised that it should be like this when the code
>> was originally added. I only don't remember what was the argument to keep it
>> hardcoded, if there was any. Adding Rob in case he can remember.
>>
>>>              }
>>>
>>> -           if (drm_gem_object_is_shared_for_memory_stats(obj)) {
>>> +           if (drm_gem_object_is_shared_for_memory_stats(obj))
>>>                      status.shared += obj->size;
>>> -           } else {
>>> +           else
>>>                      status.private += obj->size;
>>> -           }
>>
>> Drive by cleanup, okay.
>>
>>>
>>>              if (s & DRM_GEM_OBJECT_RESIDENT) {
>>>                      status.resident += add_size;
>>> @@ -938,6 +938,7 @@ void drm_show_memory_stats(struct drm_printer *p,
>>> struct drm_file *file)
>>>
>>>              if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
>>>                      status.active += add_size;
>>> +                   supported_status |= DRM_GEM_OBJECT_ACTIVE;
>>
>> I wonder what behaviour we should have here if the driver has reported
>> DRM_GEM_OBJECT_ACTIVE via its status vfunc. Like should it be like this:
>>
>>      if ((s & DRM_GEM_OBJECT_ACTIVE) ||
>>          !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
>>          ...
>>
>> ?
>>
>> So if some driver starts reporting this flag _and_ is still calling
>> drm_show_memory_stats(), it's version of activity tracking is used instead of the
>> the dma_resv based test.
> 
> I don't think that is feasible with the current API, because there's no way to differentiate "driver thinks a BO is not active" and "driver does not implement activity tracking". I think it's probably okay to keep it like this until someone wants to do it differently and refactor then.

Ah yes, good point. I actually initially thought the same (that we would 
need additional "supports active reporting" flag) but then for some 
reason convinced myself it is possible without it. I agree it works as is.

Regards,

Tvrtko

> 
> Teddy
> 
>>>
>>>                      /* If still active, don't count as purgeable: */
>>>                      s &= ~DRM_GEM_OBJECT_PURGEABLE;
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>> index f586825054918..168d7375304bc 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>> @@ -102,6 +102,7 @@ static void show_meminfo(struct drm_printer *p, struct
>> drm_file *file)
>>>      for_each_memory_region(mr, i915, id)
>>>              drm_print_memory_stats(p,
>>>                                     &stats[id],
>>> +                                  DRM_GEM_OBJECT_ACTIVE |
>>>                                     DRM_GEM_OBJECT_RESIDENT |
>>>                                     DRM_GEM_OBJECT_PURGEABLE,
>>>                                     mr->uabi_name);
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
>>> b/drivers/gpu/drm/xe/xe_drm_client.c
>>> index 6a26923fa10e0..54941b4e850c4 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>> @@ -229,6 +229,7 @@ static void show_meminfo(struct drm_printer *p, struct
>> drm_file *file)
>>>              if (man) {
>>>                      drm_print_memory_stats(p,
>>>                                             &stats[mem_type],
>>> +                                          DRM_GEM_OBJECT_ACTIVE |
>>>                                             DRM_GEM_OBJECT_RESIDENT |
>>>                                             (mem_type != XE_PL_SYSTEM ? 0 :
>>>                                             DRM_GEM_OBJECT_PURGEABLE),
>> diff --git
>>> a/include/drm/drm_gem.h b/include/drm/drm_gem.h index
>>> bae4865b2101a..584ffdf5c2542 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -48,19 +48,21 @@ struct drm_gem_object;
>>>     * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>>>     * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not
>> unpinned)
>>>     * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by
>>> userspace
>>> + * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active
>>> + submission
>>>     *
>>>     * Bitmask of status used for fdinfo memory stats, see
>>> &drm_gem_object_funcs.status
>>> - * and drm_show_fdinfo().  Note that an object can
>>> DRM_GEM_OBJECT_PURGEABLE if
>>> - * it still active or not resident, in which case drm_show_fdinfo()
>>> will not
>>> + * and drm_show_fdinfo().  Note that an object can report
>>> + DRM_GEM_OBJECT_PURGEABLE
>>> + * and be active or not resident, in which case drm_show_fdinfo()
>>> + will not
>>>     * account for it as purgeable.  So drivers do not need to check if
>>> the buffer
>>> - * is idle and resident to return this bit.  (Ie. userspace can mark
>>> a buffer
>>> - * as purgeable even while it is still busy on the GPU.. it does not
>>> _actually_
>>> - * become puregeable until it becomes idle.  The status gem object
>>> func does
>>> - * not need to consider this.)
>>> + * is idle and resident to return this bit, i.e. userspace can mark a
>>> + buffer as
>>> + * purgeable even while it is still busy on the GPU. It whill not get
>>> + reported
>>
>> Good cleanup.
>>
>> s/whill/will/
>>
>>> + * in the puregeable stats until it becomes idle.  The status gem
>>> + object func
>>> + * does not need to consider this.
>>>     */
>>>    enum drm_gem_object_status {
>>>      DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>>>      DRM_GEM_OBJECT_PURGEABLE = BIT(1),
>>> +   DRM_GEM_OBJECT_ACTIVE = BIT(2),
>>>    };
>>>
>>>    /**
>>
>> Regards,
>>
>> Tvrtko
