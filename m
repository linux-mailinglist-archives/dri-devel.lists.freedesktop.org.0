Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965277BB60E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CA410E185;
	Fri,  6 Oct 2023 11:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354610E105;
 Fri,  6 Oct 2023 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696590754; x=1728126754;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SuNlBiVK+SPKAMPFvukbCS5PhpbXFDeZZSysLM+NkMQ=;
 b=aoO17q3Mh8+fZ6I14xSY4CN6wDMXSPfgHzAeEIZt9IfD3JoMWySznT9Q
 YBe7HuT834q3ikzgBAGIdx1djqJPOimJfISF98+SmxBMezfs9/Kt8prVN
 E+53SGzanCZae+GGpqLAzdJawx0SKfVXdr8JAteNSyFTwupy21gORwr1H
 NEmANNMEb3yvzeeNo+IgPChLiEOAFyTKj7y7Vu7d3P/WatFdyAAtlrQLe
 c3RA3LGmb9LHvgMHmzC5Je/rleM+uSEqFX0GbHT9ctfKXr6u1gkkwCAPj
 xBoo0+R2A+F+GD8METyzQ1Pk4to3dmQeUUievn2H7WfeeVKFgW8VDQ8JF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383620192"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="383620192"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 04:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="702036454"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="702036454"
Received: from stevegr-mobl3.ger.corp.intel.com (HELO [10.213.210.79])
 ([10.213.210.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 04:12:18 -0700
Message-ID: <73148b09-3bce-9a3d-b4dd-99a8b6886105@linux.intel.com>
Date: Fri, 6 Oct 2023 12:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Remove early/pre-production
 Haswell code
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
 <ZR_lkR7naHjjuc99@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZR_lkR7naHjjuc99@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/10/2023 11:46, Ville Syrjälä wrote:
> On Fri, Oct 06, 2023 at 09:31:01AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> It is not our policy to keep pre-production hardware support for this long
>> so I guess this one was just forgotten.
> 
> This is about detecting pre-prod hw, not supporting it. I think keeping
> the detection forever is a good idea since otherwise we may end up
> mistakenly debugging pre-prod hw without even realizing it.

Hmm it was before my time, but surely HSW SDVs never left the company 
and you don't expect any internal systems to be using them after what 
10+ years?

Regards,

Tvrtko

>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_driver.c | 1 -
>>   drivers/gpu/drm/i915/i915_drv.h    | 2 --
>>   2 files changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index ccbb2834cde0..78a42c8a8509 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -175,7 +175,6 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
>>   {
>>   	bool pre = false;
>>   
>> -	pre |= IS_HASWELL_EARLY_SDV(dev_priv);
>>   	pre |= IS_SKYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x6;
>>   	pre |= IS_BROXTON(dev_priv) && INTEL_REVID(dev_priv) < 0xA;
>>   	pre |= IS_KABYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x1;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index cb60fc9cf873..9d493ff1685a 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -590,8 +590,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>   	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
>>   #define IS_RAPTORLAKE_U(i915) \
>>   	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
>> -#define IS_HASWELL_EARLY_SDV(i915) (IS_HASWELL(i915) && \
>> -				    (INTEL_DEVID(i915) & 0xFF00) == 0x0C00)
>>   #define IS_BROADWELL_ULT(i915) \
>>   	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT)
>>   #define IS_BROADWELL_ULX(i915) \
>> -- 
>> 2.39.2
> 
