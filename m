Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEFBDFF5E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 19:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86410E8A9;
	Wed, 15 Oct 2025 17:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMztGpic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758D10E8A4;
 Wed, 15 Oct 2025 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760551101; x=1792087101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qGRE2a2aPEBbdLydC4NVLxOgjdg1tLpUJqzeD3dJgpQ=;
 b=eMztGpic7GzoRjM7sRSu1OQaTxSmPSfsMOmLglH39rz2bjwtfw5mCAI1
 hrbM7nOk4cYaBRsaJfCJ7Uhy5AXY89r2NVIToeYFr/hzcWa8iDqZADACN
 Em0ebwoM+19OC3ezifGVfMZQoTFkWU4CFqVK8DZMi2PhjurhzW2E+nIWc
 EWe2Fa/BV73I6+wTk8z+9++wmyZNsnYJx5fewLRPaMLvfBmXuABAVUR4Q
 WoQMILj3zyzESQa2zND6NYSKiynMnCw8L7sVa3cIY9qzCu91NoN0rdQYr
 z+WRdVc1gOeD9u7fFvzT4sL7e3PMEj829o/21vVCO8pSVknAZ/CcfhQw3 A==;
X-CSE-ConnectionGUID: /00le8FJS1aEsDFG955Ayg==
X-CSE-MsgGUID: gEl+yaB2SpO47iPOPMSsYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62775633"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62775633"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:57:57 -0700
X-CSE-ConnectionGUID: qyB5UVDHR1+77R2mKXH1bQ==
X-CSE-MsgGUID: a6+i5oIRQZ+ZNPm7WfjM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182698170"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:57:55 -0700
Date: Wed, 15 Oct 2025 20:57:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>
Cc: intel-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/i915/dmc: Use drm_WARN_ONCE()
Message-ID: <aO_goOiwQwo41tQW@intel.com>
References: <20251015135042.16744-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015135042.16744-1-pvorel@suse.cz>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 15, 2025 at 03:50:42PM +0200, Petr Vorel wrote:
> assert_dmc_loaded() removed in 43175c92d4038 used drm_WARN_ONCE(),
> but new assert_dmc_loaded() use drm_WARN().
> 
> Log is already noise quite a lot due loop over dmc->dmc_info[dmc_id]
> array (76 logs on my machine), therefore use drm_WARN_ONCE().
> 
> Fixes: 43175c92d4038 ("drm/i915/dmc: Assert DMC is loaded harder")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Ville, am I wrong and it's really needed to see all the oops for the
> threads?

Kinda irrelevant because this should never happen. So the real
question we need to ask is why are you seeing this at all?

Please file a bug at
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
and attch the full dmesg with drm.debug=0xe passed to the kernel
cmdline.

> 
> Kind regards,
> Petr
> 
>  drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 517bebb0b4aac..53db7279c7c99 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -626,7 +626,7 @@ static void assert_dmc_loaded(struct intel_display *display,
>  	found = intel_de_read(display, DMC_PROGRAM(dmc->dmc_info[dmc_id].start_mmioaddr, 0));
>  	expected = dmc->dmc_info[dmc_id].payload[0];
>  
> -	drm_WARN(display->drm, found != expected,
> +	drm_WARN_ONCE(display->drm, found != expected,
>  		 "DMC %d program storage start incorrect (expected 0x%x, current 0x%x)\n",
>  		 dmc_id, expected, found);
>  
> @@ -642,7 +642,7 @@ static void assert_dmc_loaded(struct intel_display *display,
>  			expected &= ~DMC_EVT_CTL_ENABLE;
>  		}
>  
> -		drm_WARN(display->drm, found != expected,
> +		drm_WARN_ONCE(display->drm, found != expected,
>  			 "DMC %d mmio[%d]/0x%x incorrect (expected 0x%x, current 0x%x)\n",
>  			 dmc_id, i, i915_mmio_reg_offset(reg), expected, found);
>  	}
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
