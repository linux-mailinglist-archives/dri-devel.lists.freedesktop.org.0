Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3096E0D0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 19:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09110E91C;
	Thu,  5 Sep 2024 17:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyoifxrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7710E3E3;
 Thu,  5 Sep 2024 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725556136; x=1757092136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JmeXQUT9HbpmFGVggW1RK1uQUfAvZVDA7KqXV8sMAGI=;
 b=lyoifxrQeFI+GePykx/eX98GXgvhBGEgPEVePqbwtNAHjggBG64uRvyW
 7Jfo04mnOKAkFiOMkhQXZMKVYZlD/Xe9+mwdGjAhGPrYVM7BZrp0/I6xw
 n7MKu4of0KnDe9Q53QXMP3hzIa4YiBOvUecZBm2p0Jggv+Hl9LVqm9OCK
 2T/VRjvREp9sdfWqZLMy88J06h1iAiyQiHxCw/tuWd/t6L9WGmZmkPHzn
 ayyLxuc4zhcVW1E8+LJ+Dic4dB1m+y0ShQn9s1Fm5RMAVMT5J2nJ7Gd70
 HEVMwu04ie0H/lsvdPErsC90g5Dczz1SuseDqj2oDrqAz1Zc3msdBGPKJ w==;
X-CSE-ConnectionGUID: CmHRKjJMQUC4QsgXTrs/tA==
X-CSE-MsgGUID: ynb6VnvKQmWT3YUYpCx4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24454065"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24454065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 10:08:55 -0700
X-CSE-ConnectionGUID: 4LKqwEo4Sz6Rzlc/rfhfXQ==
X-CSE-MsgGUID: nMVqxy8ESjyrD06QwCHuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65724284"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 10:08:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, He Lugang <helugang@uniontech.com>
Cc: joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915:Remove unused parameter in marco.
In-Reply-To: <Ztnkt8guUcY8hg3h@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <F84191BE8AA4A690+20240831135114.497043-1-helugang@uniontech.com>
 <Ztnkt8guUcY8hg3h@intel.com>
Date: Thu, 05 Sep 2024 20:08:48 +0300
Message-ID: <87le06ownz.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Sep 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Sat, Aug 31, 2024 at 09:51:14PM +0800, He Lugang wrote:
>> The parameter dev_priv is actually not used in macro PORT_ALPM_CTL
>> and PORT_ALPM_LFPS_CTL,so remove it to simplify the code.
>
> It is magically used on our back... hence the build failures that CI got.
> Jani is doing a great clean-up work on the display code to get rid
> of this 'dev_priv' usages in favor of a better display code separation
> and using intel_display struct.

I actually think this should(tm) work. It's just that it needs a rebase.

BR,
Jani.

>
> But thanks for the patch and the interest to help.
>
>> 
>> Signed-off-by: He Lugang <helugang@uniontech.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_alpm.c     | 4 ++--
>>  drivers/gpu/drm/i915/display/intel_psr.c      | 2 +-
>>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
>> index 82ee778b2efe..7a93ba627aa6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
>> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
>> @@ -330,7 +330,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>>  			ALPM_CTL_AUX_LESS_WAKE_TIME(intel_dp->alpm_parameters.aux_less_wake_lines);
>>  
>>  		intel_de_write(display,
>> -			       PORT_ALPM_CTL(display, port),
>> +			       PORT_ALPM_CTL(port),
>>  			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
>>  			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
>>  			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
>> @@ -338,7 +338,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>>  				       intel_dp->alpm_parameters.silence_period_sym_clocks));
>>  
>>  		intel_de_write(display,
>> -			       PORT_ALPM_LFPS_CTL(display, port),
>> +			       PORT_ALPM_LFPS_CTL(port),
>>  			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
>>  			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
>>  				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
>> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
>> index 257526362b39..d66dbb529e1d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_psr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
>> @@ -2076,7 +2076,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
>>  			     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>>  
>>  		intel_de_rmw(dev_priv,
>> -			     PORT_ALPM_CTL(dev_priv, cpu_transcoder),
>> +			     PORT_ALPM_CTL(cpu_transcoder),
>>  			     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
>> index 642bb15fb547..b4984e589d7e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
>> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
>> @@ -295,7 +295,7 @@
>>  
>>  #define _PORT_ALPM_CTL_A			0x16fa2c
>>  #define _PORT_ALPM_CTL_B			0x16fc2c
>> -#define PORT_ALPM_CTL(dev_priv, port)		_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>> +#define PORT_ALPM_CTL(port)			_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>>  #define  PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE	REG_BIT(31)
>>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(23, 20)
>>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)
>> @@ -306,7 +306,7 @@
>>  
>>  #define _PORT_ALPM_LFPS_CTL_A					0x16fa30
>>  #define _PORT_ALPM_LFPS_CTL_B					0x16fc30
>> -#define PORT_ALPM_LFPS_CTL(dev_priv, port)			_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
>> +#define PORT_ALPM_LFPS_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
>>  #define  PORT_ALPM_LFPS_CTL_LFPS_START_POLARITY			REG_BIT(31)
>>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK		REG_GENMASK(27, 24)
>>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN		7
>> -- 
>> 2.45.2
>> 

-- 
Jani Nikula, Intel
