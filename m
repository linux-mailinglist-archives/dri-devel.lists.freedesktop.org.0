Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FB5AB4B7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 17:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957610E871;
	Fri,  2 Sep 2022 15:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B7E10E871;
 Fri,  2 Sep 2022 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662131401; x=1693667401;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wWMpqvCncpQ0igL6EgTNw46yovYs+LC364xY615QjDA=;
 b=mnuYJwdfOqV+UDh9YODfzn1jmhI/Ip0WcL0e8TCyYqNR0h8YJcPTgsym
 vocXPUlqZqKbemjDjmLzXGfdJki3Cr3rXTtcpSUomZptyKD/fM2wd5aST
 Ew4reSf+vGaffGg3Mg9EdvAdjscznmdMUdzTs4uw6bqejHa4EIZwiAsca
 hWKj1V8rL+gXzyJiWTCxfILRaOOse+VTTPlEe5i30gCeFNMORnTNDkurC
 kfKEalPfPmC2RY70s/w9FzDZWHgOnI77uUzCYAUpLjBI0DA80wcrequNo
 CbjEuN8xHcjp7ocLReSJubFoa7+enBTydc2nEjAUYO2MiN9knSSoiJTwj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="322159231"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="322159231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 08:10:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="642937799"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 08:09:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: cgel.zte@gmail.com, joonas.lahtinen@linux.intel.com
Subject: Re: [PATCH linux-next] drm/i915: Remove the unneeded result variables
In-Reply-To: <87bkrxddgu.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220902092027.320738-1-zhang.songyi@zte.com.cn>
 <87bkrxddgu.fsf@intel.com>
Date: Fri, 02 Sep 2022 18:09:46 +0300
Message-ID: <878rn1dd8l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>, zhang songyi <zhang.songyi@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Sep 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 02 Sep 2022, cgel.zte@gmail.com wrote:
>> From: zhang songyi <zhang.songyi@zte.com.cn>
>>
>> Return the mul_u32_fixed16() and div_fixed16() directly instead of
>>  redundant variables.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
>
> NAK.

And to explain this rude reply to our friendly community:

There's never *any* response to my review comments from
cgel.zte@gmail.com, so I can't be bothered to write anything more than
just "NAK".


>
>
> BR,
> Jani.
>
>
>> ---
>>  drivers/gpu/drm/i915/intel_pm.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
>> index 210c1f78cc90..a6757ed9081a 100644
>> --- a/drivers/gpu/drm/i915/intel_pm.c
>> +++ b/drivers/gpu/drm/i915/intel_pm.c
>> @@ -5272,7 +5272,6 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
>>  	       uint_fixed_16_16_t plane_blocks_per_line)
>>  {
>>  	u32 wm_intermediate_val;
>> -	uint_fixed_16_16_t ret;
>>  
>>  	if (latency == 0)
>>  		return FP_16_16_MAX;
>> @@ -5280,8 +5279,8 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
>>  	wm_intermediate_val = latency * pixel_rate;
>>  	wm_intermediate_val = DIV_ROUND_UP(wm_intermediate_val,
>>  					   pipe_htotal * 1000);
>> -	ret = mul_u32_fixed16(wm_intermediate_val, plane_blocks_per_line);
>> -	return ret;
>> +
>> +	return mul_u32_fixed16(wm_intermediate_val, plane_blocks_per_line);
>>  }
>>  
>>  static uint_fixed_16_16_t
>> @@ -5290,7 +5289,6 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
>>  	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
>>  	u32 pixel_rate;
>>  	u32 crtc_htotal;
>> -	uint_fixed_16_16_t linetime_us;
>>  
>>  	if (!crtc_state->hw.active)
>>  		return u32_to_fixed16(0);
>> @@ -5301,9 +5299,8 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
>>  		return u32_to_fixed16(0);
>>  
>>  	crtc_htotal = crtc_state->hw.pipe_mode.crtc_htotal;
>> -	linetime_us = div_fixed16(crtc_htotal * 1000, pixel_rate);
>>  
>> -	return linetime_us;
>> +	return div_fixed16(crtc_htotal * 1000, pixel_rate);
>>  }
>>  
>>  static int

-- 
Jani Nikula, Intel Open Source Graphics Center
