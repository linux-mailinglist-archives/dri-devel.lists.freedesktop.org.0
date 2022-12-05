Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280FA64291A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939E10E1CB;
	Mon,  5 Dec 2022 13:17:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04B710E1CB;
 Mon,  5 Dec 2022 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670246223; x=1701782223;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PhzcUf+BCXPcynxchIXFaUvHLsMRtor1jZuCMr3zFVc=;
 b=EohWgYuCaFEEjOKkI90zxXfoOYxPzOP4R0m5xndmtwDDzuwxT5F1fXVC
 WsQf4WuPiwdp2Uv4VcDm+TN7Vjp8s9B1a20jI41DXSyDSKEoNK3iCnLnv
 qDjBnxNMuQbTq9+5Xd0AMpRmFt/7xdcqs2NXvpvIeyskuzEXsPE4FA5n2
 jRUju+Xkj9jzrKYM2keFCbdHUKhr2LRGkexLUGanMZgf5IKfacq6we3Uk
 YjQBTgjAROdNUQLajB5eJFLUbDfZasWZAERW+/5pcDBXaN2AvAUhPjUEl
 XoKHkalAzQ99VSXwObA81bZK/FAtrFyXcoFJ1iPMEdxqaIo9/GGXAq5ig w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="299770043"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="299770043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 05:17:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="714393987"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="714393987"
Received: from naumanha-mobl.ger.corp.intel.com (HELO [10.213.231.131])
 ([10.213.231.131])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 05:17:01 -0800
Message-ID: <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
Date: Mon, 5 Dec 2022 13:16:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/12/2022 20:14, John Harrison wrote:

>>> and while for dbg level messages it doesn't matter, I assume we should
>>> be consistent for err/warn/info messages (as those will eventually show
>>> up to the end user) so let maintainers decide here what is 
>>> expectation here
>>
>> Could we have some examples pasted here, of the end result of this 
>> series, for all message "categories" (origins, macros, whatever)?
> 
> GT initialisation:
> gt_err(gt, "Failed to allocate scratch page\n");
> i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page
> 
> G2H notification handler:
> guc_err(guc, "notification: Invalid length %u for deregister done\n", len);
> i915 0000:00:02.0: [drm] GT0: GuC notification: Invalid length 0 for 
> deregister done

I'm not liking the inconsistency between gt_err and guc_err where with latter callers either need to start the message with lower case because of the unstructured "GuC " prefix added. Which then reads bad if callers do guc_err(guc, "Error X happend").

Looks like Michal was pointing out the same thing, AFAIU at least when re-reading the thread now.

Why wouldn't this work:

guc_err(guc, "Invalid length %u for deregister done notification\n", len);
i915 0000:00:02.0: [drm] GT0: GuC: Invalid length 0 for deregister done notification

Or if the use case for adding custom prefixes is strong then maybe consider:

guc_err(guc, "notification", "Invalid length 0 for deregister done");
i915 0000:00:02.0: [drm] GT0: GuC notification: Invalid length 0 for deregister done

guc_err(guc, "", "Error X");
i915 0000:00:02.0: [drm] GT0: GuC: Error X

> CTB initialisation:
> ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n", 
> str_enable_disable(enable), ERR_PTR(err));
> i915 0000:00:02.0: [drm] GT0: GuC CT Failed to control/enable CTB (EINVAL)

Okay same as above.

> Random meaningless (to me) message that is apparently a display thing:
> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling PORT 
> PLL B

Plan is to not touch outside gt/.

> I'm sure you can extrapolate to all other forms of dbg, notice, info, 
> etc. without me having to manually type each one out, given that they 
> are all identical.
> 
> Personally, I think the above should be just:
> gt_err(gt, "Failed to allocate scratch page\n");
> i915 0000:00:02.0: [drm] GT0: Failed to allocate scratch page
> 
> gt_err(guc_to_gt(guc), "G2H: Invalid length for deregister done: %u\n", 
> len);
> i915 0000:00:02.0: [drm] GT0: G2H: Invalid length for deregister done: 0
> 
> gt_probe_error(ct_to_gt(ct), "Failed to %s CT %d buffer (%pe)\n", 
> str_enable_disable(enable), send ? "SEND" : "RECV", ERR_PTR(err));
> i915 0000:00:02.0: [drm] GT0: Failed to enable CT SEND buffer (EINVAL)

We could but it seems we agreed some weeks ago to consolidate the existing CT_ERROR macros and such in this exercise. At least no objections were raised to that plan.

If now we want to go back on that, and if you want to have guc_to_gt(guc) in all gt/uc/ call sites that's fine by me, but please get some acks and consensus from people who work in that area. And under that option someone would also need to convert the CT code to new macros.

Regards,

Tvrtko

> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915-KMS]] disabling 
> PORT PLL B
> But presumably that requires finishing the plan of splitting out the 
> display code into a separate driver. So for now, something like this 
> would still be a massive improvement:
> kms_dbg(dev_priv, "disabling %s\n", pll->info->name);
> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] KMS: disabling 
> PORT PLL B
> 
> John.
> 
>>
>> Regards,
>>
>> Tvrtko
> 
