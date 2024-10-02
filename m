Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F074898D408
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD410E168;
	Wed,  2 Oct 2024 13:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5Yp8qS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D610E168;
 Wed,  2 Oct 2024 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727874632; x=1759410632;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EVvOVZeqKfwfQu2S2IjyDJYpv9U75yqfdu3Ax5ulq08=;
 b=A5Yp8qS5vC8q61GTWFAvnbFjhOV3SoWfdWlasNQxsJ2e5ZTwHtvIJ/W+
 RpfnzJ5nGZn/CKxZA6mnosXJMQNcus1L/uQ+PhcWjL7Ji3GcvNr0FEV1w
 P9m1rhGhyln8NZ5r5KaYvxJWu8H+kYJcIIkWGRTE7RhBHLHfZKMd3cjBR
 ZLQEKJ9b+4dtiBvnD8zpPdbQRVRTFt+/pQS4rqVtRE9/h4tsB4LMxTfXe
 myni4GhgSvCMJH3inm4TS6fGprhixbyqqFErc+gwVqjDQHg4ZruJNTte1
 Uhs5k7/ayAF73GA3bdws9UOKi3nkZoCjrIRcfvdT07Nmoq+8TOBJE6Yyk A==;
X-CSE-ConnectionGUID: ls9K5DsTS8ybRsa0/WUIJA==
X-CSE-MsgGUID: qEHatqasTyqCe+cJF7l/tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="52441349"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="52441349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:10:32 -0700
X-CSE-ConnectionGUID: 3tSxcKqYTVSEkzJo/o/9PA==
X-CSE-MsgGUID: Y5S8CYSATkyAt0OluVnGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78530993"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:10:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: He Lugang <helugang@uniontech.com>, rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, He
 Lugang <helugang@uniontech.com>
Subject: Re: [RESEND PATCH] drm/i915:Remove unused parameter in marco
In-Reply-To: <6C2E07E089F0CB73+20240925064016.733173-1-helugang@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <6C2E07E089F0CB73+20240925064016.733173-1-helugang@uniontech.com>
Date: Wed, 02 Oct 2024 16:10:27 +0300
Message-ID: <871q0ytzuk.fsf@intel.com>
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

On Wed, 25 Sep 2024, He Lugang <helugang@uniontech.com> wrote:
> The parameter dev_priv is actually not used in macro PORT_ALPM_CTL
> and PORT_ALPM_LFPS_CTL,so remove it to simplify the code.
>
> Reviewed-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 4 ++--
>  drivers/gpu/drm/i915/display/intel_psr.c      | 2 +-
>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 186cf4833f71..57afb25191bd 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -330,7 +330,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  			ALPM_CTL_AUX_LESS_WAKE_TIME(intel_dp->alpm_parameters.aux_less_wake_lines);
>  
>  		intel_de_write(display,
> -			       PORT_ALPM_CTL(display, port),
> +			       PORT_ALPM_CTL(port),
>  			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
>  			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
>  			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
> @@ -338,7 +338,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  				       intel_dp->alpm_parameters.silence_period_sym_clocks));
>  
>  		intel_de_write(display,
> -			       PORT_ALPM_LFPS_CTL(display, port),
> +			       PORT_ALPM_LFPS_CTL(port),
>  			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
>  			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
>  				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 136a0d6ca970..3468a8b55e2b 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -2114,7 +2114,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
>  			     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>  
>  		intel_de_rmw(display,
> -			     PORT_ALPM_CTL(display, cpu_transcoder),
> +			     PORT_ALPM_CTL(cpu_transcoder),
>  			     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 642bb15fb547..98814868d26c 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -295,7 +295,7 @@
>  
>  #define _PORT_ALPM_CTL_A			0x16fa2c
>  #define _PORT_ALPM_CTL_B			0x16fc2c
> -#define PORT_ALPM_CTL(dev_priv, port)		_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
> +#define  PORT_ALPM_CTL(port)		_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>  #define  PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE	REG_BIT(31)
>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(23, 20)
>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)
> @@ -306,7 +306,7 @@
>  
>  #define _PORT_ALPM_LFPS_CTL_A					0x16fa30
>  #define _PORT_ALPM_LFPS_CTL_B					0x16fc30
> -#define PORT_ALPM_LFPS_CTL(dev_priv, port)			_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
> +#define  PORT_ALPM_LFPS_CTL(port) _MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)

Thanks for the patch, pushed drm-intel-next with the indentation changes
fixed while applying.

BR,
Jani.


>  #define  PORT_ALPM_LFPS_CTL_LFPS_START_POLARITY			REG_BIT(31)
>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK		REG_GENMASK(27, 24)
>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN		7

-- 
Jani Nikula, Intel
