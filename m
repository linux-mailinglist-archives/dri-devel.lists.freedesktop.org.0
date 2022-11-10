Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5232623F1D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EED10E6B6;
	Thu, 10 Nov 2022 09:55:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BB410E12A;
 Thu, 10 Nov 2022 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668074111; x=1699610111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r2ikZK2r8f+DD7YfVaZQ2215g8rtTBRl2xEPkvt/D7g=;
 b=jjNBgLsgpUbVIymbpYxmhv8BWb4SjMYZYHrX9idaIzokUUqENqBNRYrO
 HAu8Ka+hPSUXPMwekxTUPRDlVEB7qg+j1FWc24oWk9l8lY5dqq8XQcbP0
 GKFZtlDbVuh62oyRa+gOLYcGykNPJmYYrQms9cT3A6nnEuT8yxYGCMBFu
 En3+Sq1pMQxmQH1TcGgpZ0Y1+U1yPmlyG+t6cIJFs9powdpM/BEXCTtLT
 UYWpwDe2UlY96wg6DB6ehEtsooRHMgIozqvhCvIo8dXfNrS/8J9/iA6AV
 BMSwjBgw5oZHdSkFT8IqsHC9RZk00NB/aPUEEvLsTpsUS8MhBq7Zcn6m7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="294617040"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="294617040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 01:55:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="615042249"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="615042249"
Received: from salmasha-mobl.ger.corp.intel.com (HELO [10.213.230.214])
 ([10.213.230.214])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 01:55:02 -0800
Message-ID: <7f420032-fe96-4d19-886d-b333668e4c5b@linux.intel.com>
Date: Thu, 10 Nov 2022 09:55:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
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
 <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
 <67d18d17-8a01-32a1-1ff6-099c708ab290@intel.com>
 <02454937-4213-c558-590f-e1e7c83083e3@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <02454937-4213-c558-590f-e1e7c83083e3@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/11/2022 19:57, Michal Wajdeczko wrote:

[snip]

>> Is it really a problem to merge this patch now to get the process
>> started? And other sub-components get updated as and when people get the
>> time to do them? You could maybe even help rather than posting
>> completely conflicting patch sets that basically duplicate all the
>> effort for no actual benefit.
> 
> Instead of merging this patch now, oriented on GT only, I would rather
> wait until we discuss and plan solution for the all sub-components.

Yes, agreed.

> Once that's done (with agreement on naming and output) we can start
> converting exiting messages.
> 
> My proposal would be:
>   - use wrappers per component

This is passable to me but Jani has raised a concern on IRC that it 
leads to a lot of macro duplication. Which is I think a valid point, but 
which does not have a completely nice solution. Best I heard so far was 
a suggestion from Joonas to add just a single component formatter macro 
and use the existing drm_xxx helpers.

>   - use lower case names

I prefer this as well. Even though usual argument is for macros to be 
upper case, I find the improved readability of lower case trumps that.

>   - don't add colon

Not sure, when I look at it below it looks a bit not structured enough 
without the colon, but maybe it is just me.

> #define i915_xxx(_i915, _fmt, ...) \
> 	drm_xxx(&(_i915)->drm, _fmt, ##__VA_ARGS__)
> 
> #define gt_xxx(_gt, _fmt, ...) \
> 	i915_xxx((_gt)->i915, "GT%u " _fmt, (_gt)->info.id, ..
> 
> #define guc_xxx(_guc, _fmt, ...) \
> 	gt_xxx(guc_to_gt(_guc), "GuC " _fmt, ..
> 
> #define ct_xxx(_ct, _fmt, ...) \
> 	guc_xxx(ct_to_guc(_ct), "CTB " _fmt, ..
> 
> where
> 	xxx = { err, warn, notice, info, dbg }
> 
> and then for calls like:
> 
> 	i915_err(i915, "Foo failed (%pe)\n", ERR_PTR(err));
> 	  gt_err(gt,   "Foo failed (%pe)\n", ERR_PTR(err));
> 	 guc_err(guc,  "Foo failed (%pe)\n", ERR_PTR(err));
> 	  ct_err(ct,   "Foo failed (%pe)\n", ERR_PTR(err));

So the macro idea would be like this:

   drm_err(I915_LOG("Foo failed (%pe)\n", i915), ERR_PTR(err));
   drm_err(GT_LOG("Foo failed (%pe)\n", gt), ERR_PTR(err));
   drm_err(GUC_LOG("Foo failed (%pe)\n", guc), ERR_PTR(err));
   drm_err(CT_LOG("Foo failed (%pe)\n", ct), ERR_PTR(err));

Each component would just need to define a single macro and not have to 
duplicate all the err, info, warn, notice, ratelimited, once, whatever 
versions. Which is a benefit but it's a quite a bit uglier to read in 
the code.

Perhaps macro could be called something other than XX_LOG to make it 
more readable, don't know.

Regards,

Tvrtko
