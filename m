Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6274F4C41AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA8210E7BD;
	Fri, 25 Feb 2022 09:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2FD10E7A2;
 Fri, 25 Feb 2022 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645782263; x=1677318263;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g74UQn1T44RXGMjpGEpK/WyqqwQsNszOTIlFVw5SgAA=;
 b=AMNgpzet278BIxVx/JppY9+LFJ4qzl87fHDVDS3Ovyj4KFS6Mxf2hsAi
 3zUBiVLGFXAvnDqgKA56a2wLK+6bTT9Iy3yN83S9abtTuljzLzTu14ssu
 /57T5YGSR0IAA2bNvbOjGx1lP+DgyEUzmbTYlrf4x8BLLHJOD0L/9/+Kt
 HAGmXhdZ02dfK+X0myb+VHqwUJEFPobEf7GTabT+wXHEzSoXpUDSDcMlY
 gYuX6o02C4DjegyH4v37NYSVAgaYdse+XIHmeIG3zMYM2v+YpIrVDFZ4D
 QcEmxVggkflh0n3UFprgeKpOXGHrmM9h1+QaFX0Uqceh4W/13/HwjFxfV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="250044924"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="250044924"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 01:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="533515074"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga007.jf.intel.com with ESMTP; 25 Feb 2022 01:44:20 -0800
Received: from [10.249.130.178] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.178])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21P9iJsX016633; Fri, 25 Feb 2022 09:44:19 GMT
Message-ID: <0917f555-1303-dadd-6609-f719dcf0ad61@intel.com>
Date: Fri, 25 Feb 2022 10:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig table
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
 <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
 <87y21zh70p.fsf@jljusten-skl>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87y21zh70p.fsf@jljusten-skl>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25.02.2022 06:03, Jordan Justen wrote:
> John Harrison <john.c.harrison@intel.com> writes:
> 
>> On 2/22/2022 02:36, Jordan Justen wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Implement support for fetching the hardware description table from the
>>> GuC. The call is made twice - once without a destination buffer to
>>> query the size and then a second time to fill in the buffer.
>>>
>>> Note that the table is only available on ADL-P and later platforms.
>>>
>>> v5 (of Jordan's posting):
>>>   * Various changes made by Jordan and recommended by Michal
>>>     - Makefile ordering
>>>     - Adjust "struct intel_guc_hwconfig hwconfig" comment
>>>     - Set Copyright year to 2022 in intel_guc_hwconfig.c/.h
>>>     - Drop inline from hwconfig_to_guc()
>>>     - Replace hwconfig param with guc in __guc_action_get_hwconfig()
>>>     - Move zero size check into guc_hwconfig_discover_size()
>>>     - Change comment to say zero size offset/size is needed to get size
>>>     - Add has_guc_hwconfig to devinfo and drop has_table()
>>>     - Change drm_err to notice in __uc_init_hw() and use %pe
>>>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
>>> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
>>> ---
>>>   
>>> +	ret = intel_guc_hwconfig_init(&guc->hwconfig);
>>> +	if (ret)
>>> +		drm_notice(&i915->drm, "Failed to retrieve hwconfig table: %pe\n",
>> Why only drm_notice? As you are keen to point out, the UMDs won't work 
>> if the table is not available. All the failure paths in your own 
>> verification function are 'drm_err'. So why is it only a 'notice' if 
>> there is no table at all?
> 
> This was requested by Michal in my v3 posting:
> 
> https://patchwork.freedesktop.org/patch/472936/?series=99787&rev=3
> 
> I don't think that it should be a failure for i915 if it is unable to
> read the table, or if the table read is invalid. I think it should be up
> to the UMD to react to the missing hwconfig however they think is
> appropriate, but I would like the i915 to guarantee & document the
> format returned to userspace to whatever extent is feasible.
> 
> As you point out there is a discrepancy, and I think I should be
> consistent with whatever is used here in my "drm/i915/guc: Verify
> hwconfig blob matches supported format" patch.
> 
> I guess I'd tend to agree with Michal that "maybe drm_notice since we
> continue probe", but I would go along with either if you two want to
> discuss further.

having consistent message level is a clear benefit but on other hand
these other 'errors' may indicate more serious problems related to use
of wrong/incompatible firmware that returns corrupted HWconfig (or we
use wrong actions), while since we are not using this HWconfig in the
driver we don't care that much that we failed to load HWconfig and
'notice' is enough.

but I'm fine with all messages being drm_err (as we will not have to
change that once again after HWconfig will be mandatory for the driver
as well)

> 
>> Note that this function is called as part of the reset path. The reset 
>> path is not allowed to allocate memory. The table is stored in a 
>> dynamically allocated object. Hence the IGT test failure. The table 
>> query has to be done elsewhere at driver init time only.
> 
> Thanks for clearing this up. I did notice on dg2 that gpu resets were
> causing a re-read of the hwconfig from GuC, but it definitely was not
> clear to me that there would be a connection to the IGT failure that you
> pointed out.
> 
>>
>>> +			   ERR_PTR(ret));
>>> +
>>>   	ret = guc_enable_communication(guc);
>>>   	if (ret)
>>>   		goto err_log_capture;
>>> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>>   	if (intel_uc_uses_guc_submission(uc))
>>>   		intel_guc_submission_disable(guc);
>>>   
>>> +	intel_guc_hwconfig_fini(&guc->hwconfig);
>>> +
>>>   	__uc_sanitize(uc);
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>>> index 76e590fcb903..1d31e35a5154 100644
>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>> @@ -990,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
>>>   		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
>>>   	.ppgtt_size = 48,
>>>   	.dma_mask_size = 39,
>>> +	.has_guc_hwconfig = 1,
>> Who requested this change? It was previously done this way but the 
>> instruction was that i915_pci.c is for hardware features only but that 
>> this, as you seem extremely keen about pointing out at every 
>> opportunity, is a software feature.
> 
> This was requested by Michal as well. I definitely agree it is a
> software feature, but I was not aware that "i915_pci.c is for hardware
> features only".
> 
> Michal, do you agree with this and returning to the previous method for
> enabling the feature?

now I'm little confused as some arch direction was to treat FW as
extension of the HW so for me it was natural to have 'has_guc_hwconfig'
flag in device_info

if still for some reason it is undesired to mix HW and FW/SW flags
inside single group of flags then maybe we should just add separate
group of immutable flags where has_guc_hwconfig could be defined.

let our maintainers decide

Michal

> 
> -Jordan
