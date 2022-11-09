Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28959622985
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9E10E558;
	Wed,  9 Nov 2022 11:05:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EC710E558;
 Wed,  9 Nov 2022 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667991941; x=1699527941;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bvRtap0DBclewQGTkB/tDvygLDnMmDkjLffF2w97Dvs=;
 b=TMm1AsC5DHzsUAqmvWiez16rPa+0qxAye3vzKKf+P5tncJmgt6RgCJ8d
 iwTWcxYwn+sbYLS6fobCl/+i9oAtOLw9FiwPTEKR24ATM8NJ29qOdlp+t
 wLkO1FCQ7/3WLWl8jClNDs6N9VIUrNfpknt3jgMCSPcPxMgS95N0kGGmc
 BCEnJ5QogPSYV1WNbhDTpnRQsmA9O/u1WaCH7fhr3Tzh+8Uz8zUjpG0GB
 2WpLKXr1uglz8TRPyNmQF5y1zcc8+qMzMY9f79yd24ObNoxTlHWiSq5kY
 raoIayT0B64GJ6BbGIuXAHQ2hNET4BuZ3Pjj/gkVFWlO6PVN47BVAdBrb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="310945500"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="310945500"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 03:05:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="636701866"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="636701866"
Received: from smurnane-mobl.ger.corp.intel.com (HELO [10.213.196.238])
 ([10.213.196.238])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 03:05:38 -0800
Message-ID: <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
Date: Wed, 9 Nov 2022 11:05:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
 <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
 <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
 <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/11/2022 20:15, John Harrison wrote:
> On 11/8/2022 01:01, Tvrtko Ursulin wrote:
>> On 07/11/2022 19:14, John Harrison wrote:
>>> On 11/7/2022 08:17, Tvrtko Ursulin wrote:
>>>> On 07/11/2022 09:33, Tvrtko Ursulin wrote:
>>>>> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>>>>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> When trying to analyse bug reports from CI, customers, etc. it 
>>>>>>> can be
>>>>>>> difficult to work out exactly what is happening on which GT in a
>>>>>>> multi-GT system. So add GT oriented debug/error message wrappers. If
>>>>>>> used instead of the drm_ equivalents, you get the same output but 
>>>>>>> with
>>>>>>> a GT# prefix on it.
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The only downside to this is that we'll print "GT0: " even on 
>>>>>> single-GT devices. We could introduce a gt->info.name and print 
>>>>>> that, so we could have it different per-platform, but IMO it's not 
>>>>>> worth the effort.
>>>>>>
>>>>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>
>>>>>> I think it might be worth getting an ack from one of the 
>>>>>> maintainers to make sure we're all aligned on transitioning to 
>>>>>> these new logging macro for gt code.
>>>>>
>>>>> Idea is I think a very good one. First I would suggest 
>>>>> standardising to lowercase GT in logs because:
>>>>>
>>>>> $ grep "GT%" i915/ -r
>>>>> $ grep "gt%" i915/ -r
>>>>> i915/gt/intel_gt_sysfs.c: gt->i915->sysfs_gt, "gt%d", gt->info.id))
>>>>> i915/gt/intel_gt_sysfs.c:                "failed to initialize gt%d 
>>>>> sysfs root\n", gt->info.id);
>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>>> gt%u RC6 sysfs files (%pe)\n",
>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RC6p sysfs 
>>>>> files (%pe)\n",
>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>>> gt%u RPS sysfs files (%pe)",
>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>>> gt%u punit_req_freq_mhz sysfs (%pe)",
>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u throttle sysfs 
>>>>> files (%pe)",
>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u 
>>>>> media_perf_power_attrs sysfs (%pe)\n",
>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to add 
>>>>> gt%u rps defaults (%pe)\n",
>>>>> i915/i915_driver.c: drm_err(&gt->i915->drm, "gt%d: intel_pcode_init 
>>>>> failed %d\n", id, ret);
>>>>> i915/i915_hwmon.c:              snprintf(ddat_gt->name, 
>>>>> sizeof(ddat_gt->name), "i915_gt%u", i);
>>>>>
>>>
>>> Just because there are 11 existing instances of one form doesn't mean 
>>> that the 275 instances that are waiting to be converted should be 
>>> done incorrectly. GT is an acronym and should be capitalised.
>>
>> Okay just make it consistent then.
>>
>>> Besides:
>>> grep -r "GT " i915 | grep '"'
>>> i915/vlv_suspend.c:             drm_err(&i915->drm, "timeout 
>>> disabling GT waking\n");
>>> i915/vlv_suspend.c:                     "timeout waiting for GT wells 
>>> to go %s\n",
>>> i915/vlv_suspend.c:     drm_dbg(&i915->drm, "GT register access while 
>>> GT waking disabled\n");
>>> i915/i915_gpu_error.c:  err_printf(m, "GT awake: %s\n", 
>>> str_yes_no(gt->awake));
>>> i915/i915_debugfs.c:    seq_printf(m, "GT awake? %s [%d], %llums\n",
>>> i915/selftests/i915_gem_evict.c: pr_err("Failed to idle GT (on %s)", 
>>> engine->name);
>>> i915/intel_uncore.c:                  "GT thread status wait timed 
>>> out\n");
>>> i915/gt/uc/selftest_guc_multi_lrc.c: drm_err(&gt->i915->drm, "GT 
>>> failed to idle: %d\n", ret);
>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>> idle: %d\n", ret);
>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>> idle: %d\n", ret);
>>> i915/gt/intel_gt_mcr.c: * Some GT registers are designed as 
>>> "multicast" or "replicated" registers:
>>> i915/gt/selftest_rps.c:                 pr_info("%s: rps counted %d 
>>> C0 cycles [%lldns] in %lldns [%d cycles], using GT clock frequency of 
>>> %uKHz\n",
>>> i915/gt/selftest_hangcheck.c:                   pr_err("[%s] GT is 
>>> wedged!\n", engine->name);
>>> i915/gt/selftest_hangcheck.c:           pr_err("GT is wedged!\n");
>>> i915/gt/intel_gt_clock_utils.c:                 "GT clock frequency 
>>> changed, was %uHz, now %uHz!\n",
>>> i915/gt/selftest_engine_pm.c:           pr_err("Unable to flush GT pm 
>>> before test\n");
>>> i915/gt/selftest_engine_pm.c: pr_err("GT failed to idle\n");
>>> i915/i915_sysfs.c:                       "failed to register GT sysfs 
>>> directory\n");
>>> i915/intel_uncore.h:     * of the basic non-engine GT registers 
>>> (referred to as "GSI" on
>>> i915/intel_uncore.h:     * newer platforms, or "GT block" on older 
>>> platforms)?  If so, we'll
>>>
>>>
>>>
>>>>> Then there is a question of naming. Are we okay with GT_XXX or, do 
>>>>> we want intel_gt_, or something completely different. I don't have 
>>>>> a strong opinion at the moment so I'll add some more folks to Cc.
>>>>
>>> You mean GT_ERR("msg") vs intel_gt_err("msg")? Personally, I would 
>>> prefer just gt_err("msg") to keep it as close to the official drm_* 
>>> versions as possible. Print lines tend to be excessively long 
>>> already. Taking a 'gt' parameter instead of a '&gt->i915->drm' 
>>> parameter does help with that but it seems like calling the wrapper 
>>> intel_gt_* is shooting ourselves in the foot on that one. And GT_ERR 
>>> vs gt_err just comes down to the fact that it is a macro wrapper and 
>>> therefore is required to be in upper case.
>>>
>>>> There was a maintainer level mini-discussion on this topic which I 
>>>> will try to summarise.
>>>>
>>>> Main contention point was the maintenance cost and generally an 
>>>> undesirable pattern of needing to add many 
>>>> subsystem/component/directory specific macros. Which then typically 
>>>> need extra flavours and so on. But over verbosity of the 
>>> How many versions are you expecting to add? Beyond the tile instance, 
>>> what further addressing requirements are there? The card instance is 
>>> already printed as part of the PCI address. The only other reason to 
>>> add per component wrappers would be to wrap the mechanism for getting 
>>> from some random per component object back to the intel_gt structure. 
>>> But that is hardware a new issue being added by this wrapper. It is 
>>> also not a requirement. Much of the code has a gt pointer already. 
>>> For the parts that don't, some of it would be a trivial engine->gt 
>>> type dereference, some of it is a more complex container_of type 
>>> construction. But for those, the given file will already have 
>>> multiple instances of that already (usually as the first or second 
>>> line of the function - 'intel_gt *gt = fancy_access_method(my_obj)' 
>>> so adding one or two more of those as necessary is not making the 
>>> code harder to read.
>>>
>>>> code is obviously also bad, so one compromise idea was to add a 
>>>> macro which builds the GT string and use drm logging helpers 
>>>> directly. This would be something like:
>>>>
>>>>  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
>>>>  drm_info(GT_LOG(...same...));
>>> Seriously? As above, some of these lines are already way too long, 
>>> this version makes them even longer with no obvious benefit. Worse, 
>>> it makes it harder to read what is going on. It is much less 
>>> intuitive to read than just replacing the drm_err itself. And having 
>>> two sets of parenthesis with some parameters inside the first and 
>>> some only inside the second is really horrid! Also, putting the 'gt' 
>>> parameter in the middle just confuses it with the rest of the printf 
>>> arguments even though there is no %d in the string for it. So now a 
>>> quick glances tells you that your code is wrong because you have 
>>> three format specifiers but four parameters.
>>>
>>> Whereas, just replacing drm_err with gt_err (or GT_ERR or 
>>> intel_gt_err) keeps everything else consistent. The first parameter 
>>> changes from 'drm' to 'gt' but is still the master object parameter 
>>> and it matches the function/macro prefix so inherently looks correct. 
>>> Then you have your message plus parameters. No confusing orders, no 
>>> confusing parenthesis, no excessive macro levels, no confusion at 
>>> all. Just nice simple, easy to read, easy to maintain code.
>>
>> I am personally okay with gt_err/GT_ERR some other folks might object 
>> though. And I can also understand the argument why it is better to not 
>> have to define gt_err, gt_warn, gt_info, gt_notice, gt_debug, 
>> gt_err_ratelimited, gt_warn_once.. and instead have only one macro.
> A small set of trivial macro definitions vs a complicated and unreadable 
> construct on every single print? Erm, isn't that the very definition of 
> abstracting to helpers as generally required by every code review ever?
> 
> And what 'other folks might object'? People already CC'd? People outside 
> of i915?
> 
> 
>>
>> Because of that I was passing on to you the compromise option.
>>
>> It maybe still has net space savings since we wouldn't have to be 
>> repeating the gt->i915->drm whatever and gt->info.id on every line.
>>
>> You are free to try the most compact one and see how hard those 
>> objections will be.
> Um. I already did. This patch. And you are the only person to have 
> objected in any manner at all.

Where I have objected?

I was a) asking to convert all gt/ within one kernel release, b) 
transferring the maintainer discussion from IRC to this email chain to 
outlay one alternative, for which I said I could see the pros and cons 
of both, and c) raised the naming question early since that can usually 
become a churn point later on when we have large scale code transformations.

As said, FWIW you have my ack for GT_XXX naming and approach, but please 
do convert the whole of gt/ so we don't ship with a mish-mash of log 
messages.

Regards,

Tvrtko
