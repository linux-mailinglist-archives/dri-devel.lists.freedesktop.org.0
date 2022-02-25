Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2A4C4D3E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42C10E8E2;
	Fri, 25 Feb 2022 18:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46410E8E2;
 Fri, 25 Feb 2022 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645812336; x=1677348336;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=secjL47AX+F2ng08BDeXCEArFyQXou3QslwIxHaNquA=;
 b=LImwsK7I62ZZ+qxl+5Qrw/QzkTEvmdQ/bIPvc/c2iBL1hmRWAkUp2KrE
 OrAIDPAcPs4oe1WXe7VtHbKiIXKbDlTa+VRJI+G+3XJGczzNzwexUkuHn
 471QP6B7MbYwRBlx0L8FKCvUSobRDk14eivM+KYqMrV66NHMKateeq7sm
 JkXC7uPRW3SEh3piI56lNnoi76ibmRLmsvEvW8v3vtzSV64Dtj71sosxM
 LUlWceDoeGf1BSm+Ih7H/SW4hbxyfXjEI+5hZSfyiHxMxp1O4cs5msEdv
 8LxcNdZs3xlKqEJlLDGgitWQoHUDV0r/0Dd1yuOzZd3zuU8qiSZsQIe4P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277186237"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="277186237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:05:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="509349046"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 25 Feb 2022 10:05:33 -0800
Received: from [10.249.130.178] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.178])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21PI5W3T012307; Fri, 25 Feb 2022 18:05:32 GMT
Message-ID: <917bb13a-ba32-ba8a-64df-5e1e8fe67128@intel.com>
Date: Fri, 25 Feb 2022 19:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig
 table
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
 <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
 <87y21zh70p.fsf@jljusten-skl>
 <0917f555-1303-dadd-6609-f719dcf0ad61@intel.com>
 <3376b185-6a70-c5e1-2c2c-18a4bdeba9a2@linux.intel.com>
 <72d84811-b769-4cae-7e18-d076c75ddfa6@intel.com>
 <5f1b714c-d0fd-a437-2de8-9ce2c6bd98a7@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5f1b714c-d0fd-a437-2de8-9ce2c6bd98a7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25.02.2022 18:18, Tvrtko Ursulin wrote:
> 
> On 25/02/2022 16:46, John Harrison wrote:
> 
>>>> driver we don't care that much that we failed to load HWconfig and
>>>> 'notice' is enough.
>>>>
>>>> but I'm fine with all messages being drm_err (as we will not have to
>>>> change that once again after HWconfig will be mandatory for the driver
>>>> as well)
>>>
>>> I would be against drm_err.
>>>
>>> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
>>> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken
>>> immediately */
>>> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
>>> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>>> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>>> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant
>>> condition */
>>> #define KERN_INFO       KERN_SOH "6"    /* informational */
>>> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>>>
>>> From the point of view of the kernel driver, this is not an error to
>>> its operation. It can at most be a warning, but notice is also fine
>>> by me. One could argue when reading "normal but significant
>>> condition" that it is not normal, when it is in fact unexpected, so
>>> if people prefer warning that is also okay by me. I still lean
>>> towards notice becuase of the hands-off nature i915 has with the
>>> pass-through of this blob.
>>  From the point of view of the KMD, i915 will load and be 'functional'
>> if it can't talk to the hardware at all. The UMDs won't work at all but 
> 
> Well this reductio ad absurdum fails I think... :)
> 
>> the driver load will be 'fine'. That's a requirement to be able to get
>> the user to a software fallback desktop in order to work out why the
>> hardware isn't working (e.g. no GuC firmware file). I would view this
>> as similar. The KMD might have loaded but the UMDs are not functional.
>> That is definitely an error condition to me.
> 
> ... If GuC fails to load there is no command submission and driver will
> obviously log that with drm_err.
> 
> If blob fails to verify it depends on the userspace stack what will
> happen. As stated before on some platforms, and/or after a certain time,
> Mesa will not look at the blob at all. So i915 is fine (it is after all
> just a conduit for opaque data!), system overall is fine, so it
> definitely isn't a KERN_ERR level event.
> 
>>>>>>> +               ERR_PTR(ret));
>>>>>>> +
>>>>>>>        ret = guc_enable_communication(guc);
>>>>>>>        if (ret)
>>>>>>>            goto err_log_capture;
>>>>>>> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>>>>>>        if (intel_uc_uses_guc_submission(uc))
>>>>>>>            intel_guc_submission_disable(guc);
>>>>>>>    +    intel_guc_hwconfig_fini(&guc->hwconfig);
>>>>>>> +
>>>>>>>        __uc_sanitize(uc);
>>>>>>>    }
>>>>>>>    diff --git a/drivers/gpu/drm/i915/i915_pci.c
>>>>>>> b/drivers/gpu/drm/i915/i915_pci.c
>>>>>>> index 76e590fcb903..1d31e35a5154 100644
>>>>>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>>>>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>>>>>> @@ -990,6 +990,7 @@ static const struct intel_device_info
>>>>>>> adl_p_info = {
>>>>>>>            BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) |
>>>>>>> BIT(VCS2),
>>>>>>>        .ppgtt_size = 48,
>>>>>>>        .dma_mask_size = 39,
>>>>>>> +    .has_guc_hwconfig = 1,
>>>>>> Who requested this change? It was previously done this way but the
>>>>>> instruction was that i915_pci.c is for hardware features only but
>>>>>> that
>>>>>> this, as you seem extremely keen about pointing out at every
>>>>>> opportunity, is a software feature.
>>>>>
>>>>> This was requested by Michal as well. I definitely agree it is a
>>>>> software feature, but I was not aware that "i915_pci.c is for hardware
>>>>> features only".
>>>>>
>>>>> Michal, do you agree with this and returning to the previous method
>>>>> for
>>>>> enabling the feature?
>>>>
>>>> now I'm little confused as some arch direction was to treat FW as
>>>> extension of the HW so for me it was natural to have 'has_guc_hwconfig'
>>>> flag in device_info
>>>>
>>>> if still for some reason it is undesired to mix HW and FW/SW flags
>>>> inside single group of flags then maybe we should just add separate
>>>> group of immutable flags where has_guc_hwconfig could be defined.
>>>>
>>>> let our maintainers decide
>>>
>>> Bah.. :)
>>>
>>> And what was the previous method?
>>>
>>> [comes back later]
>>>
>>> Okay it was:
>>>
>>> +static bool has_table(struct drm_i915_private *i915)
>>> +{
>>> +    if (IS_ALDERLAKE_P(i915))
>>> +        return true;
>>>
>>> Which sucks a bit if we want to argue it does not belong in device info.
>>>
>>> Why can't we ask the GuC if the blob exists? In fact what would
>>> happen if one would call __guc_action_get_hwconfig on any GuC platform?
>> That was how I originally wrote the code. However, other parties
>> refuse to allow a H2G call to fail. The underlying CTB layers complain
>> loudly on any CTB error. And the GuC architects insist that a call to
>> query the table on an unsupported platform is an error and should
>> return an 'unsupported' error code.

just for the background: IIRC the reason why arch didn't want 'query'
mode that wont fail was that HWconfig is not optional on these selected
platforms, so driver shall know up-front on which platforms it shall be
working (and driver shall even fail if blob is not available)

> 
> Oh well, shrug, sounds silly but I will not pretend I am familiar with H2G
> 
> In this case has_table does sound better since it indeed isn't a
> hardware feature. It is a GuC fw thing and if we don't have a way to
> probe things there at runtime, then at least limit the knowledge to GuC
> files.

note that arch expectation is that driver itself shall be using this
hwconfig (ie. will decode required data). while current approach is that
driver acts only as a proxy to UMD, this has to change and refactoring
will start (likely) soon. therefore flag has_guc_hwconfig fits better
IMHO as this wont be just 'GuC' fw thing.

Michal

> 
> Regards,
> 
> Tvrtko
