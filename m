Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32A7CA12D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCB510E133;
	Mon, 16 Oct 2023 08:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705B010E136;
 Mon, 16 Oct 2023 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697443362; x=1728979362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MiTMN7+aVeZzZCuXYsdQTbp19cEIK9MlBKiSyHgaK7o=;
 b=O+X4l4HjfXPACiZC1if5OlAMoIgfE/HSX+0I7JH367nTHStx3Yz04P+z
 FhWcFMFruqP0peY4keuVEl5GSryC4HjikSRUaFSkjMFT+lzr/kdodVriE
 m5SdTzMhE3Y04QVboHasjoe5lpVtU6QL+NEBAHsh81SgRvyFVU4TeZNXz
 hswPpPoKUEQw/cFp/SDnCWJvWfvFfhIKTExPWkZB6fv3bPN3f8gqJKG7w
 1xHuws+waLpnXrXvAKbcCRU4VACAviuanWhW2bVi36Axt+GBiO41NJ0BP
 QogoE1MN5Oqds8sfPRuCmNkEKBMlBfAX3K8qtHbJBmAk26gPeDUEOQVXK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375840319"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="375840319"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 01:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846314566"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="846314566"
Received: from rannouni-mobl.ger.corp.intel.com (HELO [10.213.216.40])
 ([10.213.216.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 01:02:40 -0700
Message-ID: <01fbd64b-bb38-0086-9aba-dc04a35d4bf1@linux.intel.com>
Date: Mon, 16 Oct 2023 09:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow users to disable waitboost
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
 <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
 <915a5e08-5daf-153d-cb82-b0f9e5bd3b2a@intel.com>
 <6d8c7fd2-9eca-14fd-6b44-edeb15a6e6ac@linux.intel.com>
 <ZSmt1u9fVNDyMFgz@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZSmt1u9fVNDyMFgz@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/10/2023 21:51, Rodrigo Vivi wrote:
> On Thu, Sep 28, 2023 at 01:48:34PM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/09/2023 20:34, Belgaumkar, Vinay wrote:
>>>
>>> On 9/21/2023 3:41 AM, Tvrtko Ursulin wrote:
>>>>
>>>> On 20/09/2023 22:56, Vinay Belgaumkar wrote:
>>>>> Provide a bit to disable waitboost while waiting on a gem object.
>>>>> Waitboost results in increased power consumption by requesting RP0
>>>>> while waiting for the request to complete. Add a bit in the gem_wait()
>>>>> IOCTL where this can be disabled.
>>>>>
>>>>> This is related to the libva API change here -
>>>>> Link: https://github.com/XinfengZhang/libva/commit/3d90d18c67609a73121bb71b20ee4776b54b61a7
>>>>
>>>> This link does not appear to lead to userspace code using this uapi?
>>> We have asked Carl (cc'd) to post a patch for the same.
>>
>> Ack.
> 
> I'm glad to see that we will have the end-to-end flow of the high-level API.
> 
>>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/gem/i915_gem_wait.c | 9 ++++++---
>>>>>    drivers/gpu/drm/i915/i915_request.c      | 3 ++-
>>>>>    drivers/gpu/drm/i915/i915_request.h      | 1 +
>>>>>    include/uapi/drm/i915_drm.h              | 1 +
>>>>>    4 files changed, 10 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>>>> index d4b918fb11ce..955885ec859d 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>>>> @@ -72,7 +72,8 @@ i915_gem_object_wait_reservation(struct
>>>>> dma_resv *resv,
>>>>>        struct dma_fence *fence;
>>>>>        long ret = timeout ?: 1;
>>>>>    -    i915_gem_object_boost(resv, flags);
>>>>> +    if (!(flags & I915_WAITBOOST_DISABLE))
>>>>> +        i915_gem_object_boost(resv, flags);
>>>>>          dma_resv_iter_begin(&cursor, resv,
>>>>>                    dma_resv_usage_rw(flags & I915_WAIT_ALL));
>>>>> @@ -236,7 +237,7 @@ i915_gem_wait_ioctl(struct drm_device *dev,
>>>>> void *data, struct drm_file *file)
>>>>>        ktime_t start;
>>>>>        long ret;
>>>>>    -    if (args->flags != 0)
>>>>> +    if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
>>>>>            return -EINVAL;
>>>>>          obj = i915_gem_object_lookup(file, args->bo_handle);
>>>>> @@ -248,7 +249,9 @@ i915_gem_wait_ioctl(struct drm_device *dev,
>>>>> void *data, struct drm_file *file)
>>>>>        ret = i915_gem_object_wait(obj,
>>>>>                       I915_WAIT_INTERRUPTIBLE |
>>>>>                       I915_WAIT_PRIORITY |
>>>>> -                   I915_WAIT_ALL,
>>>>> +                   I915_WAIT_ALL |
>>>>> +                   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
>>>>> +                    I915_WAITBOOST_DISABLE : 0),
>>>>>                       to_wait_timeout(args->timeout_ns));
>>>>>          if (args->timeout_ns > 0) {
>>>>> diff --git a/drivers/gpu/drm/i915/i915_request.c
>>>>> b/drivers/gpu/drm/i915/i915_request.c
>>>>> index f59081066a19..2957409b4b2a 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>>>> @@ -2044,7 +2044,8 @@ long i915_request_wait_timeout(struct
>>>>> i915_request *rq,
>>>>>         * but at a cost of spending more power processing the workload
>>>>>         * (bad for battery).
>>>>>         */
>>>>> -    if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
>>>>> +    if (!(flags & I915_WAITBOOST_DISABLE) && (flags &
>>>>> I915_WAIT_PRIORITY) &&
>>>>> +        !i915_request_started(rq))
>>>>>            intel_rps_boost(rq);
>>>>>          wait.tsk = current;
>>>>> diff --git a/drivers/gpu/drm/i915/i915_request.h
>>>>> b/drivers/gpu/drm/i915/i915_request.h
>>>>> index 0ac55b2e4223..3cc00e8254dc 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_request.h
>>>>> +++ b/drivers/gpu/drm/i915/i915_request.h
>>>>> @@ -445,6 +445,7 @@ long i915_request_wait(struct i915_request *rq,
>>>>>    #define I915_WAIT_INTERRUPTIBLE    BIT(0)
>>>>>    #define I915_WAIT_PRIORITY    BIT(1) /* small priority bump
>>>>> for the request */
>>>>>    #define I915_WAIT_ALL        BIT(2) /* used by
>>>>> i915_gem_object_wait() */
>>>>> +#define I915_WAITBOOST_DISABLE    BIT(3) /* used by
> 
> maybe name it I915_WAIT_NO_BOOST to align a bit better with the existent ones?

I thought it would be better to not mention wait boost in the uapi, but 
leave it as implementation detail.

My suggestion was along the lines of I915_GEM_WAIT_BACKGROUND/IDLE.

In essence saying allowing userspace to say this is not an important 
wait. Yes, it implies that other waits are (more) important, but I think 
this is still better than starting to mention wait boost in the uapi. 
Since that would kind of cement it exists, while we always just viewed 
it as an "go faster" driver internal heuristics and could freely decide 
not to employ it even for default waits.

Historically even we had a period when waits were getting elevated 
scheduling priority. We removed it, would have to dig through git and 
email history to remember exactly why, but probably along the lines that 
it is not always justified. Same as waitboost is not always justified 
and can be harmful.

So I think a generic name for the uapi leaves more freedom for the 
driver. Might be a wrong name that I am suggesting and should be 
something else, not sure.

[Comes back later.]

eec39e441c29 ("drm/i915: Remove wait priority boosting")

So it seems we only removed it because corner cases with the current 
scheduler were hard. Unfortunately improved deadline based scheduler 
never got in despite being ready so we can not restore this now.

>>>>> i915_gem_object_wait() */
>>>>>      void i915_request_show(struct drm_printer *m,
>>>>>                   const struct i915_request *rq,
>>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>> index 7000e5910a1d..4adee70e39cf 100644
>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>> @@ -1928,6 +1928,7 @@ struct drm_i915_gem_wait {
>>>>>        /** Handle of BO we shall wait on */
>>>>>        __u32 bo_handle;
>>>>>        __u32 flags;
>>>>> +#define I915_GEM_WAITBOOST_DISABLE      (1u<<0)
>>>>
>>>> Probably would be good to avoid mentioning waitboost in the uapi
>>>> since so far it wasn't an explicit feature/contract. Something like
>>>> I915_GEM_WAIT_BACKGROUND_PRIORITY? Low priority?
>>> sure.
>>>>
>>>> I also wonder if there could be a possible angle to help Rob (+cc)
>>>> upstream the syncobj/fence deadline code if our media driver might
>>>> make use of that somehow.
>>>>
>>>> Like if either we could wire up the deadline into GEM_WAIT (in a
>>>> backward compatible manner), or if media could use sync fd wait
>>>> instead. Assuming they have an out fence already, which may not be
>>>> true.
>>>
>>> Makes sense. We could add a SET_DEADLINE flag or something similar and
>>> pass in the deadline when appropriate.
>>
>> Rob - do you have time and motivation to think about this angle at all
>> currently? If not I guess we just proceed with the new flag for our
>> GEM_WAIT.
> 
> Well, this could be the first user for that uapi that Rob was proposing
> indeed.
> 
> The downside is probably because we should implement the deadline in i915
> and consider all the deadline as 0 (urgent) and boost, unless in this
> case where before the gem_wait the UMD would use the set_deadline to
> something higher (max?).
> 
> Well, if we have a clarity on how to proceed with the deadline we should
> probably go there. But for simplicity I would be in favor of this proposed
> gem_wait flag as is, because this already solves many real important cases.

Yes I don't think we had consensus on the semantics of when no deadline 
is set, so it does sound better to proceed with i915 specific solution 
for now. The two wouldn't be incompatible if deadlines were later added.

Regards,

Tvrtko

> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>        /** Number of nanoseconds to wait, Returns time remaining. */
>>>>>        __s64 timeout_ns;
>>>>>    };
