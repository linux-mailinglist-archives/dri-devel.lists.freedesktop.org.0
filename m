Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07F61F8CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63F10E44E;
	Mon,  7 Nov 2022 16:17:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35410E44D;
 Mon,  7 Nov 2022 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667837865; x=1699373865;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=anPJ13R2Jy5slLY3MyBenW/5twlWQ6cZ/1Q5m+G32LA=;
 b=MwAxhYBM4bevoWSx0JsTJlFP26nzGxKwtkuQ+aY4zmlwvNoHaj2MiP+S
 YXtr75ts7foz0MyCoV0tXAl4HoHc2/s1zLbaeDBJLcp/vHWGHgy482QeA
 SHYEpDhrrHrKda6aDVmLt2K/IBj/EvliLXtsXCCpOjv3L+6Y7Bm/NtDcI
 4IcBdS5/zwF2w0kkO6QMKy5dHWUiN7Kt7jj7EwH7tcWU8N58qBCP7TR+u
 tDYohQcCAQKcLUZNhQcvWu2mkvK9GoxzWFg130y6nPMCJRsgyDO/x5I/i
 kM21bmm9WBglwXbkZAwcpKB29Icxk82z4cUpB9HLX3iL2cTgP0hWOK0Wr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337172608"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="337172608"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:17:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699530450"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="699530450"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO [10.213.226.227])
 ([10.213.226.227])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:17:08 -0800
Message-ID: <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
Date: Mon, 7 Nov 2022 16:17:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
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


On 07/11/2022 09:33, Tvrtko Ursulin wrote:
> 
> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>
>>
>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> When trying to analyse bug reports from CI, customers, etc. it can be
>>> difficult to work out exactly what is happening on which GT in a
>>> multi-GT system. So add GT oriented debug/error message wrappers. If
>>> used instead of the drm_ equivalents, you get the same output but with
>>> a GT# prefix on it.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>> The only downside to this is that we'll print "GT0: " even on 
>> single-GT devices. We could introduce a gt->info.name and print that, 
>> so we could have it different per-platform, but IMO it's not worth the 
>> effort.
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> I think it might be worth getting an ack from one of the maintainers 
>> to make sure we're all aligned on transitioning to these new logging 
>> macro for gt code.
> 
> Idea is I think a very good one. First I would suggest standardising to 
> lowercase GT in logs because:
> 
> $ grep "GT%" i915/ -r
> $ grep "gt%" i915/ -r
> i915/gt/intel_gt_sysfs.c:                                
> gt->i915->sysfs_gt, "gt%d", gt->info.id))
> i915/gt/intel_gt_sysfs.c:                "failed to initialize gt%d 
> sysfs root\n", gt->info.id);
> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u 
> RC6 sysfs files (%pe)\n",
> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
> create gt%u RC6p sysfs files (%pe)\n",
> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u 
> RPS sysfs files (%pe)",
> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create gt%u 
> punit_req_freq_mhz sysfs (%pe)",
> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
> create gt%u throttle sysfs files (%pe)",
> i915/gt/intel_gt_sysfs_pm.c:                             "failed to 
> create gt%u media_perf_power_attrs sysfs (%pe)\n",
> i915/gt/intel_gt_sysfs_pm.c:                     "failed to add gt%u rps 
> defaults (%pe)\n",
> i915/i915_driver.c:                     drm_err(&gt->i915->drm, "gt%d: 
> intel_pcode_init failed %d\n", id, ret);
> i915/i915_hwmon.c:              snprintf(ddat_gt->name, 
> sizeof(ddat_gt->name), "i915_gt%u", i);
> 
> Then there is a question of naming. Are we okay with GT_XXX or, do we 
> want intel_gt_, or something completely different. I don't have a strong 
> opinion at the moment so I'll add some more folks to Cc.

There was a maintainer level mini-discussion on this topic which I will 
try to summarise.

Main contention point was the maintenance cost and generally an 
undesirable pattern of needing to add many subsystem/component/directory 
specific macros. Which then typically need extra flavours and so on. But 
over verbosity of the code is obviously also bad, so one compromise idea 
was to add a macro which builds the GT string and use drm logging 
helpers directly. This would be something like:

  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
  drm_info(GT_LOG(...same...));

Whether or not to put the gt as parameter to the helper macro or outside 
wasn't really decided upon. Anyway the macro would be adding the magic 
"gt%u: " prefix, drm device and all.

Also the name GT_LOG (or case) is just for illustration, that part 
wasn't really discussed.

If agreeable this pattern could then be used to consolidate some other 
macros that we have. Although apart from CT_DEBUG/ERROR I don't know if 
we have any others.

I hope I have transferred the idea correctly. Please shout if I have not.

Regards,

Tvrtko


> What I'd would like to see tried is to converting all of i915/gt within 
> one kernel release so we don't have a mish-mash of log formats.
> 
> Regards,
> 
> Tvrtko
> 
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt.h | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h 
>>> b/drivers/gpu/drm/i915/gt/intel_gt.h
>>> index e0365d5562484..1e016fb0117a4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>>> @@ -13,6 +13,21 @@
>>>   struct drm_i915_private;
>>>   struct drm_printer;
>>> +#define GT_ERR(_gt, _fmt, ...) \
>>> +    drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>> ##__VA_ARGS__)
>>> +
>>> +#define GT_WARN(_gt, _fmt, ...) \
>>> +    drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>> ##__VA_ARGS__)
>>> +
>>> +#define GT_NOTICE(_gt, _fmt, ...) \
>>> +    drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>> ##__VA_ARGS__)
>>> +
>>> +#define GT_INFO(_gt, _fmt, ...) \
>>> +    drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>> ##__VA_ARGS__)
>>> +
>>> +#define GT_DBG(_gt, _fmt, ...) \
>>> +    drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, 
>>> ##__VA_ARGS__)
>>> +
>>>   #define GT_TRACE(gt, fmt, ...) do {                    \
>>>       const struct intel_gt *gt__ __maybe_unused = (gt);        \
>>>       GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),        \
>>
