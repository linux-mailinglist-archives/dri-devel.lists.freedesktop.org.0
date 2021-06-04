Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040339B93C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 14:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70976E418;
	Fri,  4 Jun 2021 12:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5906E418;
 Fri,  4 Jun 2021 12:53:20 +0000 (UTC)
IronPort-SDR: AubuWmhDw3Yo6rQO5zJT7sD3pvpMkSGEovvKqPjf8vKU9J4ZtPZK3mF93VHZJ39w9RJ+SciA+x
 8OaTq9xdiA4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204261142"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="204261142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 05:53:19 -0700
IronPort-SDR: 6164XZxGRCG/sRuFoQKNG1Z4imWGj8+18dzLn8D1q13mkBJ3KdctpmJUdKEsF6Rkt3VxdmU5ah
 ZRxtXk2hhRAg==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="480624846"
Received: from seanmc5x-mobl5.ger.corp.intel.com (HELO [10.213.231.164])
 ([10.213.231.164])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 05:53:18 -0700
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
 <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
 <8cf2c5f4-87a3-ce6b-150c-65fa054586a4@linux.intel.com>
 <YK9wrCayUwSDzMWG@phenom.ffwll.local>
 <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <036d1a59-e78a-3eb2-c9e7-ff6909002124@linux.intel.com>
Date: Fri, 4 Jun 2021 13:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mahesh.meena@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/05/2021 11:22, Tvrtko Ursulin wrote:
> 
> On 27/05/2021 11:13, Daniel Vetter wrote:
>> On Wed, May 26, 2021 at 11:20:13AM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 25/05/2021 15:47, Daniel Vetter wrote:
>>>> On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> + dri-devel as per process
>>>>>
>>>>> On 25/05/2021 14:55, Tejas Upadhyay wrote:
>>>>>> v2: Only declare timeslicing if we can safely preempt userspace.
>>>>>
>>>>> Commit message got butchered up somehow so you'll need to fix that 
>>>>> at some
>>>>> point.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
>>>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
>>>>>>     include/uapi/drm/i915_drm.h                 | 1 +
>>>>>>     2 files changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>> index 3cca7ea2d6ea..12d165566ed2 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>> @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct 
>>>>>> drm_i915_private *i915)
>>>>>>             MAP(HAS_PREEMPTION, PREEMPTION),
>>>>>>             MAP(HAS_SEMAPHORES, SEMAPHORES),
>>>>>>             MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
>>>>>> +        MAP(TIMESLICE_BIT, TIMESLICING),
>>>>>>     #undef MAP
>>>>>>         };
>>>>>>         struct intel_engine_cs *engine;
>>>>>> diff --git a/include/uapi/drm/i915_drm.h 
>>>>>> b/include/uapi/drm/i915_drm.h
>>>>>> index c2c7759b7d2e..af2212d6113c 100644
>>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>>> @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
>>>>>>     #define   I915_SCHEDULER_CAP_PREEMPTION    (1ul << 2)
>>>>>>     #define   I915_SCHEDULER_CAP_SEMAPHORES    (1ul << 3)
>>>>>>     #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS    (1ul << 4)
>>>>>> +#define   I915_SCHEDULER_CAP_TIMESLICING    (1ul << 5)
>>>>
>>>> Since this is uapi I think we should at least have some nice kerneldoc
>>>> that explains what exactly this is, what for (link to userspace) and 
>>>> all
>>>> that. Ideally also minimally filing in the gaps in our uapi docs for 
>>>> stuff
>>>> this references.
>>>
>>> IIUC there is no userspace apart from IGT needing it not to fail 
>>> scheduling
>>> tests on ADL.
>>>
>>> Current tests use "has preemption + has semaphores" as a proxy to 
>>> answer the
>>> "does the kernel support timeslicing" question. This stops working 
>>> with the
>>> Guc backend because GuC decided not to support semaphores (for 
>>> reasons yet
>>> unknown, see other thread), so explicit "has timeslicing" flag is 
>>> needed in
>>> order for tests to know that GuC is supposed to support timeslicing, 
>>> even if
>>> it doesn't use semaphores for inter-ring synchronisation.
>>
>> Since this if for igt only: Cant we do just extend the check in igt with
>> an || GEN >= 12? I really hope that our future hw will continue to 
>> support
>> timeslicing ...
> 
> Not the gen 12 check, but possible I think. Explicit feature test would 
> be better, but if definitely not allowed then along the lines of:
> 
> has_timeslicing =
>      (has_preemption && has_semaphores) || uses_guc_submission;

One catch is that timeslicing in GuC will be disabled both if at compile 
time CONFIG_DRM_I915_TIMESLICE_DURATION is set to zero, or if at runtime 
engine->props.timeslice_duration_ms is equally set to zero.

So I think what is needed on top of the above check is to walk all 
engines in sysfs and check that timeslicing hasn't explicitly been 
disabled for any one of them.

If we are talking about the global flag at least. Per engine tests could 
do better I guess, but I don't think that complication is worth the effort.

Regards,

Tvrtko
