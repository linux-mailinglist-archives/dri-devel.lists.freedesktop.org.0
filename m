Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E56430B6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 19:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D2610E108;
	Mon,  5 Dec 2022 18:44:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575A010E108;
 Mon,  5 Dec 2022 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670265856; x=1701801856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XVgAD4d9aUxplm9aftUj/bDrAO4aXqIlkc5wwYfjbb0=;
 b=fgRG2hI95unjBdRNp8SN5siyVDQYsNDXVHtoPvxKW3FgrOjC/7NVHDMM
 nJSGWtlg0md7UZSHV3dhdqLVr/IBQzg8Vsxs5sSi62d6Ho0Zv8mGmZPVW
 cKhTEito03m03vYmdmrwaaNRKeMB9+At0Vt7lCfc6xE4At3BxcLDrtTtU
 1MJVuVB4c0uuo8vb95/YWd29KNMVo+dZ4piWLJ8LDsHsCz0RxdVTIhbFb
 4KUwmcC2YrGIL/vob6+HslxsbM8HRfCEHTQtADvlyiya1Nrl2NHapBps5
 tTZH/M5P8zb10l1AuykfBY7ek4Q2Z5bR3pJWKiGz/2DU1v830a8+DByR5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="315135470"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="315135470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 10:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="891074028"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="891074028"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2022 10:44:13 -0800
Received: from [10.249.148.172] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.148.172])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2B5IiCQu010959; Mon, 5 Dec 2022 18:44:12 GMT
Message-ID: <467f47f4-c30f-16ba-3330-a3d4752366a8@intel.com>
Date: Mon, 5 Dec 2022 19:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
 <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05.12.2022 14:16, Tvrtko Ursulin wrote:
> 
> On 02/12/2022 20:14, John Harrison wrote:
> 
>>>> and while for dbg level messages it doesn't matter, I assume we should
>>>> be consistent for err/warn/info messages (as those will eventually show
>>>> up to the end user) so let maintainers decide here what is
>>>> expectation here
>>>
>>> Could we have some examples pasted here, of the end result of this
>>> series, for all message "categories" (origins, macros, whatever)?
>>
>> GT initialisation:
>> gt_err(gt, "Failed to allocate scratch page\n");
>> i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page
>>
>> G2H notification handler:
>> guc_err(guc, "notification: Invalid length %u for deregister done\n",
>> len);
>> i915 0000:00:02.0: [drm] GT0: GuC notification: Invalid length 0 for
>> deregister done

please note that today this message is coded as:

drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
-> i915 0000:00:02.0: [drm] Invalid length %u

which makes this rather an example of meaningless log

> 
> I'm not liking the inconsistency between gt_err and guc_err where with
> latter callers either need to start the message with lower case because
> of the unstructured "GuC " prefix added. Which then reads bad if callers
> do guc_err(guc, "Error X happend").
> 
> Looks like Michal was pointing out the same thing, AFAIU at least when
> re-reading the thread now.
> 
> Why wouldn't this work:
> 
> guc_err(guc, "Invalid length %u for deregister done notification\n", len);
> i915 0000:00:02.0: [drm] GT0: GuC: Invalid length 0 for deregister done
> notification

+1

> 
> Or if the use case for adding custom prefixes is strong then maybe
> consider:
> 
> guc_err(guc, "notification", "Invalid length 0 for deregister done");
> i915 0000:00:02.0: [drm] GT0: GuC notification: Invalid length 0 for
> deregister done
> 
> guc_err(guc, "", "Error X");
> i915 0000:00:02.0: [drm] GT0: GuC: Error X

-1

this will make logging macros too different from others (unless we
hide/use prefixes inside macros only, but I'm not sure there is any ROI)

> 
>> CTB initialisation:
>> ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n",
>> str_enable_disable(enable), ERR_PTR(err));
>> i915 0000:00:02.0: [drm] GT0: GuC CT Failed to control/enable CTB
>> (EINVAL)
> 
> Okay same as above.
> 
>> Random meaningless (to me) message that is apparently a display thing:
>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>> PORT PLL B
> 
> Plan is to not touch outside gt/.
> 
>> I'm sure you can extrapolate to all other forms of dbg, notice, info,
>> etc. without me having to manually type each one out, given that they
>> are all identical.
>>
>> Personally, I think the above should be just:
>> gt_err(gt, "Failed to allocate scratch page\n");
>> i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page
>>
>> gt_err(guc_to_gt(guc), "G2H: Invalid length for deregister done:
>> %u\n", len);
>> i915 0000:00:02.0: [drm] GT0: G2H: Invalid length for deregister done: 0

that's probably should be:

	"Invalid length for G2H deregister done: %u\n

and it will still just look fine if we auto append the 'GuC' prefix:

i915 0000:00:02.0: [drm] GT0: GuC: Invalid length for G2H deregister

>>
>> gt_probe_error(ct_to_gt(ct), "Failed to %s CT %d buffer (%pe)\n",
>> str_enable_disable(enable), send ? "SEND" : "RECV", ERR_PTR(err));
>> i915 0000:00:02.0: [drm] GT0: Failed to enable CT SEND buffer (EINVAL)

having "GuC/CT" prefix here will also look fine:

i915 0000:00:02.0: [drm] GT0: GuC: Failed to enable CT SEND buffer
i915 0000:00:02.0: [drm] GT0: GuC: CT: Failed to enable SEND buffer
i915 0000:00:02.0: [drm] GT0: CT: Failed to enable SEND buffer

> 
> We could but it seems we agreed some weeks ago to consolidate the
> existing CT_ERROR macros and such in this exercise. At least no
> objections were raised to that plan.
> 
> If now we want to go back on that, and if you want to have
> guc_to_gt(guc) in all gt/uc/ call sites that's fine by me, but please
> get some acks and consensus from people who work in that area. And under
> that option someone would also need to convert the CT code to new macros.

while the main goal of this series was to have GT# appended to the log
messages but we also wanted to simplify the use of the logging macros by
passing the component pointer directly (with extra *bonus* that allows
to auto append component specific prefix, if any, like CT macros do)

IMHO adding guc_xxx() macros with "GuC:" prefix will do the trick and
since many of the existing GuC related logs are already broken or
incomplete, we might fix them accordingly.

In other words in addition to gt_xxx() I still want additional guc_xxx()
macros (as it will allow us to fix related messages) and ct_xxx() macros
(as we already have CT_xxx so no need to change anything)

Michal

> 
> Regards,
> 
> Tvrtko
> 
>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915-KMS]]
>> disabling PORT PLL B
>> But presumably that requires finishing the plan of splitting out the
>> display code into a separate driver. So for now, something like this
>> would still be a massive improvement:
>> kms_dbg(dev_priv, "disabling %s\n", pll->info->name);
>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] KMS:
>> disabling PORT PLL B
>>
>> John.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>
