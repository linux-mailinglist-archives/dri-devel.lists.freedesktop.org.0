Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D34C463F014
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 13:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D36E10E5C6;
	Thu,  1 Dec 2022 12:01:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145510E5CA;
 Thu,  1 Dec 2022 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669896092; x=1701432092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2iY92oMVbNzcKZIMiXazNIgpLUm3Vx3OPA5qV7SNnHo=;
 b=gPuOxb4NN1wd3YnDIBF+YMq4RLumCAgZMW1MjZoefITwcuVVPZ2x73g8
 E4Oa5ypIjMqaVFEASewMM/6EFjn/+hymXLO7PXu9unJonpcxq0MGfTCjI
 bJv++AwTsUJCJ5fKbYzXcdw+xrRV/52pIMUQFcEVAmeGfhWzAFL6i7iH4
 jc9lna8CTm7hNQVc46SH7WLpA4omHHgiOClDpNZ0ydIuqr6uO75LYSwgl
 gt0AvbmlZOTuefPe78cfLGD83v2XMcSjBY63rGXmoHeXYVWecAR+tJ3AU
 Au1pzBqf4Oi/3T8s3TgJXb102AQiXhBkNz+b/oS7lcbsZCKJSykzU1NeJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="401939307"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="401939307"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 04:01:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="713198838"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="713198838"
Received: from aguefor-mobl.ger.corp.intel.com (HELO [10.213.229.22])
 ([10.213.229.22])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 04:01:30 -0800
Message-ID: <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
Date: Thu, 1 Dec 2022 12:01:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/12/2022 11:56, Michal Wajdeczko wrote:
> On 01.12.2022 01:41, John Harrison wrote:
>> On 11/23/2022 12:45, Michal Wajdeczko wrote:
>>> On 23.11.2022 02:25, John Harrison wrote:
>>>> On 11/22/2022 09:54, Michal Wajdeczko wrote:
>>>>> On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Re-work the existing GuC CT printers and extend as required to match
>>>>>> the new wrapping scheme.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 222
>>>>>> +++++++++++-----------
>>>>>>     1 file changed, 113 insertions(+), 109 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>>> index 2b22065e87bf9..9d404fb377637 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>>> @@ -18,31 +18,49 @@ static inline struct intel_guc *ct_to_guc(struct
>>>>>> intel_guc_ct *ct)
>>>>>>         return container_of(ct, struct intel_guc, ct);
>>>>>>     }
>>>>>>     -static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
>>>>>> -{
>>>>>> -    return guc_to_gt(ct_to_guc(ct));
>>>>>> -}
>>>>>> -
>>>>>>     static inline struct drm_i915_private *ct_to_i915(struct
>>>>>> intel_guc_ct *ct)
>>>>>>     {
>>>>>> -    return ct_to_gt(ct)->i915;
>>>>>> -}
>>>>>> +    struct intel_guc *guc = ct_to_guc(ct);
>>>>>> +    struct intel_gt *gt = guc_to_gt(guc);
>>>>>>     -static inline struct drm_device *ct_to_drm(struct intel_guc_ct
>>>>>> *ct)
>>>>>> -{
>>>>>> -    return &ct_to_i915(ct)->drm;
>>>>>> +    return gt->i915;
>>>>>>     }
>>>>>>     -#define CT_ERROR(_ct, _fmt, ...) \
>>>>>> -    drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>>>>>> +#define ct_err(_ct, _fmt, ...) \
>>>>>> +    guc_err(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>> +#define ct_warn(_ct, _fmt, ...) \
>>>>>> +    guc_warn(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>> +#define ct_notice(_ct, _fmt, ...) \
>>>>>> +    guc_notice(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>> +#define ct_info(_ct, _fmt, ...) \
>>>>>> +    guc_info(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>>     #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>>>>> -#define CT_DEBUG(_ct, _fmt, ...) \
>>>>>> -    drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>>>>>> +#define ct_dbg(_ct, _fmt, ...) \
>>>>>> +    guc_dbg(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
>>>>>>     #else
>>>>>> -#define CT_DEBUG(...)    do { } while (0)
>>>>>> +#define ct_dbg(...)    do { } while (0)
>>>>>>     #endif
>>>>>> -#define CT_PROBE_ERROR(_ct, _fmt, ...) \
>>>>>> -    i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>> +#define ct_probe_error(_ct, _fmt, ...) \
>>>>>> +    do { \
>>>>>> +        if (i915_error_injected()) \
>>>>>> +            ct_dbg(_ct, _fmt, ##__VA_ARGS__); \
>>>>>> +        else \
>>>>>> +            ct_err(_ct, _fmt, ##__VA_ARGS__); \
>>>>>> +    } while (0)
>>>>> guc_probe_error ?
>>>>>
>>>>>> +
>>>>>> +#define ct_WARN_ON(_ct, _condition) \
>>>>>> +    ct_WARN(_ct, _condition, "%s", "ct_WARN_ON("
>>>>>> __stringify(_condition) ")")
>>>>>> +
>>>>>> +#define ct_WARN(_ct, _condition, _fmt, ...) \
>>>>>> +    guc_WARN(ct_to_guc(_ct), _condition, "CT " _fmt, ##__VA_ARGS__)
>>>>>> +
>>>>>> +#define ct_WARN_ONCE(_ct, _condition, _fmt, ...) \
>>>>>> +    guc_WARN_ONCE(ct_to_guc(_ct), _condition, "CT " _fmt,
>>>>>> ##__VA_ARGS__)
>>>>>>       /**
>>>>>>      * DOC: CTB Blob
>>>>>> @@ -170,7 +188,7 @@ static int ct_control_enable(struct intel_guc_ct
>>>>>> *ct, bool enable)
>>>>>>         err = guc_action_control_ctb(ct_to_guc(ct), enable ?
>>>>>>                          GUC_CTB_CONTROL_ENABLE :
>>>>>> GUC_CTB_CONTROL_DISABLE);
>>>>>>         if (unlikely(err))
>>>>>> -        CT_PROBE_ERROR(ct, "Failed to control/%s CTB (%pe)\n",
>>>>>> +        ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n",
>>>>>>                        str_enable_disable(enable), ERR_PTR(err));
>>>>> btw, shouldn't we change all messages to start with lowercase ?
>>>>>
>>>>> was:
>>>>>       "CT0: Failed to control/%s CTB (%pe)"
>>>>> is:
>>>>>       "GT0: GuC CT Failed to control/%s CTB (%pe)"
>>>>>
>>>>> unless we keep colon (as suggested by Tvrtko) as then:
>>>>>
>>>>>       "GT0: GuC CT: Failed to control/%s CTB (%pe)"
>>>> Blanket added the colon makes it messy when a string actually wants to
>>>> start with the prefix. The rule I've been using is lower case word when
>>>> the prefix was part of the string, upper case word when the prefix is
>>> Hmm, I'm not sure that we should attempt to have such a flexible rule as
>>> we shouldn't rely too much on actual format of the prefix as it could be
>>> changed any time.  All we should know about final log message is that it
>>> _will_ properly identify the "GT" or "GuC" that this log is related to.
>>>
>>> So I would suggest to be just consistent and probably always start with
>>> upper case, as that seems to be mostly used in kernel error logs, and
>>> just make sure that any prefix will honor that (by including colon, or
>>> braces), so this will always work like:
>>>
>>> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
>>> "[drm] *ERROR* GT0: GUC: Failed to foo (-EIO)"
>>> "[drm] *ERROR* GT0: GUC: CT: Failed to foo (-EIO)"
>>>
>>> or
>>>
>>> "[drm] *ERROR* GT0: Failed to foo (-EIO)"
>>> "[drm] *ERROR* GT0: [GUC] Failed to foo (-EIO)"
>>> "[drm] *ERROR* GT0: [GUC] CT: Failed to foo (-EIO)"
>>>
>>> and even for:
>>>
>>> "[drm] *ERROR* GT(root) Failed to foo (-EIO)"
>>> "[drm] *ERROR* GuC(media) Failed to foo (-EIO)"
>>> "[drm] *ERROR* GT0 [GuC:CT] Failed to foo (-EIO)"
>> All of which are hideous/complex/verbose/inconsistent. 'GT0: GUC: CT:'?
>> Really? Or 'GT0: [GUC] CT:'? Why the random mix of separators? And how
>> would you implement '[GUC:CT]' without having a CT definition that is
>> entirely self contained and does chain on to the GuC level version?
> 
> you missed the point, as those were just examples of different possible
> prefixes that one could define, to show that actual message shall not
> make any assumption how such prefix will look like or how it will end
> (like with or w/o colon, with "GuC" or "GT" tag or whatever)
> 
>>
>> This is pointless bikeshedding. If you want to re-write every single
>> debug print (yet again) and invent much more complicated macro
> 
> the opposite, I want clear understanding how messages should be written
> to *avoid* rewriting them if (for some reason) we decide to change or
> update the prefix in the future
> 
>> definitions then feel free to take over the patch set. If not can we
>> just approve the v3 version and move on to doing some actual work?
> 
> if everyone is happy that there is inconsistency in use between gt_xxx
> messages where we shall be using messages starting with upper case
> (since prefix ends with colon) and guc/ct_xxx messages where we shall be
> using lower case message (since there is a known prefix without colon,
> either "GuC" or "CT") then I'll be also fine, but for now that bothers
> me a little, hence asking for clarifications/agreement
> 
> and while for dbg level messages it doesn't matter, I assume we should
> be consistent for err/warn/info messages (as those will eventually show
> up to the end user) so let maintainers decide here what is expectation here

Could we have some examples pasted here, of the end result of this 
series, for all message "categories" (origins, macros, whatever)?

Regards,

Tvrtko
