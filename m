Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205BC90330
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 22:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2921910E8BF;
	Thu, 27 Nov 2025 21:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gov4Gva5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50FA10E853;
 Thu, 27 Nov 2025 21:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764279660; x=1795815660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WnN83mCaafJox+zBKDVGUYk7Inwux9T4I2nQLsrJr5U=;
 b=Gov4Gva57JBXwKxLWFVETkEPli7qLcwho3qXUQITaWf6cZJ2l3TUg7Yj
 nZZ1IkGAO5LcXEvpksS4FzGdlvRZjnNPCasRNbCmTPiIxHvMqn8WQtQ/+
 xuDm/2thnsQIug+T2W0ctvTVzk5favQ+Sd6Iy8OcQRmR0JC9BQ17xysda
 XNIdln3Ja8OTayZg/2rF9x8F3eFDKYATxc/VGH+9b4VBUoxm2bWH+lBnu
 jecQq+4QMdacNHW4eogcjeUok3IaZfTXM3TmbMMdVUNUDmCZpB+UnWCz+
 bcBd6/Oiertwk5sDgfARouXvUprhyyswOApojdmliogBbHdYpQgpuNjw+ Q==;
X-CSE-ConnectionGUID: dsE3diVgT2KvSGAmMKtYAw==
X-CSE-MsgGUID: 6rb8kzHgQ0y6VPMda3ZC9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66285056"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66285056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 13:41:00 -0800
X-CSE-ConnectionGUID: Uv65/nuDSWisXOcygyCIKw==
X-CSE-MsgGUID: Ok4RRYFYTAecC+KLOTwRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="192439915"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 13:40:57 -0800
Date: Thu, 27 Nov 2025 23:40:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/dp: Add byte-by-byte fallback for broken USB-C
 adapters
Message-ID: <aSjFZhZQLVb7czsh@intel.com>
References: <20251127044406.618543-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127044406.618543-1-acelan.kao@canonical.com>
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

On Thu, Nov 27, 2025 at 12:44:06PM +0800, Chia-Lin Kao (AceLan) wrote:
> Some USB-C hubs and adapters have buggy firmware where multi-byte AUX
> reads from DPCD address 0x00000 consistently timeout, while single-byte
> reads from the same address work correctly.
> 
> Known affected devices that exhibit this issue:
> - Lenovo USB-C to VGA adapter (VIA VL817 chipset)
>   idVendor=17ef, idProduct=7217
> - Dell DA310 USB-C mobile adapter hub
>   idVendor=413c, idProduct=c010
> 
> Analysis of the failure pattern shows:
> - Single-byte probes to 0xf0000 (LTTPR) succeed
> - Single-byte probes to 0x00102 (TRAINING_AUX_RD_INTERVAL) succeed
> - 15-byte reads from 0x00000 (DPCD capabilities) timeout with -ETIMEDOUT
> - Retrying does not help - the failure is consistent across all attempts

I thought we changed that to the more sensible 16 bytes.
Anyone know what happened to that patch?

Anyways, does 16 bytes work better than 15 bytes?

> 
> The issue appears to be a firmware bug in the AUX transaction handling
> that specifically affects multi-byte reads from the base DPCD address.
> 
> Add a fallback mechanism that attempts byte-by-byte reading when the
> normal multi-byte drm_dp_read_dpcd_caps() fails. This workaround only
> activates for adapters that fail the standard read path, ensuring no
> impact on correctly functioning hardware.
> 
> The byte-by-byte read uses drm_dp_dpcd_readb() to read each of the 15
> DPCD capability bytes individually, working around the firmware bug
> while maintaining compatibility with all other adapters.
> 
> Tested with:
> - Lenovo USB-C to VGA adapter (VIA VL817) - now works with fallback
> - Dell DA310 USB-C hub - now works with fallback
> - Dell/Analogix Slimport adapter - continues to work with normal path
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index aad5fe14962f..738a5bb4adb3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -213,6 +213,7 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
>  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
> +	int ret, i;
>  
>  	if (intel_dp_is_edp(intel_dp))
>  		return 0;
> @@ -226,7 +227,25 @@ int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_S
>  				      DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
>  			return -EIO;
>  
> -	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
> +	ret = drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd);
> +	if (ret == 0)
> +		return 0;
> +
> +	/*
> +	 * Workaround for USB-C hubs/adapters with buggy firmware that fail
> +	 * multi-byte AUX reads from DPCD address 0x00000 but work with
> +	 * single-byte reads. Known affected devices:
> +	 * - Lenovo USB-C to VGA adapter (VIA VL817, idVendor=17ef, idProduct=7217)
> +	 * - Dell DA310 USB-C hub (idVendor=413c, idProduct=c010)
> +	 * Read the DPCD capabilities byte-by-byte as a fallback.
> +	 */
> +	for (i = 0; i < DP_RECEIVER_CAP_SIZE; i++) {
> +		ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_DPCD_REV + i, &dpcd[i]);
> +		if (ret < 0)
> +			return -EIO;
> +	}

Doing this in i915 specific code doesn't make sense.

> +
> +	if (dpcd[DP_DPCD_REV] == 0)
>  		return -EIO;
>  
>  	return 0;
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
