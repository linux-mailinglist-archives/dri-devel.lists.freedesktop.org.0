Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBAA865D1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A3710EC65;
	Fri, 11 Apr 2025 18:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfA59Bk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E92310EC5F;
 Fri, 11 Apr 2025 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744397775; x=1775933775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qlHieP8DaVNW8lrL5uvlr4SjrRnHzg2sewvLqUqfRaw=;
 b=RfA59Bk8fXmySAA1x0LnadxSR4Dq23MnCO1C4690kqEHwIqLl2dVFyj0
 pxWNtqsnKeUnl8Iq7AsPeTaK1qIffwyv9YUlHFmX8zj0Ke45mxhMJFrAz
 7x55GV2WzlQjnCkz15bXO7wvo8reMcthWieCjyWXKrUgpC33ZmbkLKBCF
 2DLM4pKIOr7y9O2EnYyy1UiTaLmtXOV3GaF5+RZdK2+KxQ3eyjDAGKRdc
 3vu5NlLvl/SCzejaR0VWUc6uPCjDBHCtOMHnFb42S3Tw76603Nvtc7lds
 Twufv/veoyUEQhemnkGAtCFkYMqWcugOI/FOaOSJERJgZZXtQpEdqhsaP A==;
X-CSE-ConnectionGUID: nvlcp2m6QgeVxnW9UX2wKw==
X-CSE-MsgGUID: FAHMKNjxQpCnP1XIrqB2BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63362100"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="63362100"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 11:56:14 -0700
X-CSE-ConnectionGUID: uLQkN6/HRn+jKRtnXg42mA==
X-CSE-MsgGUID: 3jFYN+TYSdSGgdBEHkNUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134427149"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 11 Apr 2025 11:56:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 21:56:09 +0300
Date: Fri, 11 Apr 2025 21:56:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/i915/display: Add quirk to force backlight type
 on some TUXEDO devices
Message-ID: <Z_llydAABYIueYA6@intel.com>
References: <20250411171756.142777-1-wse@tuxedocomputers.com>
 <20250411171756.142777-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411171756.142777-2-wse@tuxedocomputers.com>
X-Patchwork-Hint: comment
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

On Fri, Apr 11, 2025 at 05:55:08PM +0200, Werner Sembach wrote:
> The display backlight on TUXEDO DX1708 and InsanityBook 15 v1 with panels
> AUO 12701 and AUO 12701 must be forced to INTEL_DP_AUX_BACKLIGHT_ON to be
> able to control the brightness.
> 
> This could already be archived via a module parameter, but this patch adds
> a quirk to apply this by default on the mentioned device + panel
> combinations.

Why aren't you fixing the VBT to be correct in the first place?

> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 14 ++++++-
>  drivers/gpu/drm/i915/display/intel_quirks.c   | 42 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
>  3 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c846ef4acf5b2..0cac04c98a3e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -34,12 +34,14 @@
>   * for some reason.
>   */
>  
> +#include <drm/drm_edid.h>
>  #include "i915_utils.h"
>  #include "intel_backlight.h"
>  #include "intel_display_core.h"
>  #include "intel_display_types.h"
>  #include "intel_dp.h"
>  #include "intel_dp_aux_backlight.h"
> +#include "intel_quirks.h"
>  
>  /*
>   * DP AUX registers for Intel's proprietary HDR backlight interface. We define
> @@ -607,11 +609,21 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	struct drm_device *dev = connector->base.dev;
>  	struct intel_panel *panel = &connector->panel;
>  	bool try_intel_interface = false, try_vesa_interface = false;
> +	int enable_dpcd_backlight;
> +	u32 pnl_id;
>  
>  	/* Check the VBT and user's module parameters to figure out which
>  	 * interfaces to probe
>  	 */
> -	switch (display->params.enable_dpcd_backlight) {
> +	enable_dpcd_backlight = display->params.enable_dpcd_backlight;
> +	if (enable_dpcd_backlight == INTEL_DP_AUX_BACKLIGHT_AUTO &&
> +	    intel_has_quirk(display, QUIRK_AUO_12701_21229_ENABLE_DPCD_BACKLIGHT)) {
> +		pnl_id = drm_edid_get_panel_id(panel->fixed_edid);
> +		if (pnl_id == drm_edid_encode_panel_id('A', 'U', 'O', 0x319d) ||
> +		    pnl_id == drm_edid_encode_panel_id('A', 'U', 'O', 0x52ed))
> +			enable_dpcd_backlight = INTEL_DP_AUX_BACKLIGHT_ON;
> +	}
> +	switch (enable_dpcd_backlight) {
>  	case INTEL_DP_AUX_BACKLIGHT_OFF:
>  		return -ENODEV;
>  	case INTEL_DP_AUX_BACKLIGHT_AUTO:
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index 8b30e9fd936e7..6f724e5712664 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel_dp)
>  	drm_info(display->drm, "Applying Fast Wake sync pulse count quirk\n");
>  }
>  
> +static void quirk_auo_12701_21229_enable_dpcd_backlight(struct intel_display *display)
> +{
> +	intel_set_quirk(display, QUIRK_AUO_12701_21229_ENABLE_DPCD_BACKLIGHT);
> +	drm_info(display->drm, "Applying Display AUO Model 12701 and 21229 Enable DPCD Backlight quirk\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -118,6 +124,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
>  	return 1;
>  }
>  
> +static int intel_dmi_auo_12701_21229_enable_dpcd_backlight(const struct dmi_system_id *id)
> +{
> +	DRM_INFO("Display AUO model 12701 and 21229 DPCD backlight control on %s\n", id->ident);
> +	return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  	{
>  		.dmi_id_list = &(const struct dmi_system_id[]) {
> @@ -164,6 +176,36 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  		},
>  		.hook = quirk_no_pps_backlight_power_hook,
>  	},
> +	{
> +		.dmi_id_list = &(const struct dmi_system_id[]) {
> +			{
> +				.callback = intel_dmi_auo_12701_21229_enable_dpcd_backlight,
> +				.ident = "TUXEDO DX1708",
> +				.matches = {DMI_MATCH(DMI_BOARD_NAME, "N8xEJEK"),
> +				},
> +			},
> +			{
> +				.callback = intel_dmi_auo_12701_21229_enable_dpcd_backlight,
> +				.ident = "TUXEDO InsanityBook 15 v1",
> +				.matches = {DMI_MATCH(DMI_BOARD_NAME, "P95_HP"),
> +				},
> +			},
> +			{
> +				.callback = intel_dmi_auo_12701_21229_enable_dpcd_backlight,
> +				.ident = "TUXEDO InsanityBook 15 v1",
> +				.matches = {DMI_MATCH(DMI_BOARD_NAME, "P95_HR"),
> +				},
> +			},
> +			{
> +				.callback = intel_dmi_auo_12701_21229_enable_dpcd_backlight,
> +				.ident = "TUXEDO InsanityBook 15 v1",
> +				.matches = {DMI_MATCH(DMI_BOARD_NAME, "P95_HP,HR,HQ"),
> +				},
> +			},
> +			{ }
> +		},
> +		.hook = quirk_auo_12701_21229_enable_dpcd_backlight,
> +	},
>  };
>  
>  static struct intel_quirk intel_quirks[] = {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
> index cafdebda75354..38bdbd65d7efb 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -20,6 +20,7 @@ enum intel_quirk_id {
>  	QUIRK_LVDS_SSC_DISABLE,
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>  	QUIRK_FW_SYNC_LEN,
> +	QUIRK_AUO_12701_21229_ENABLE_DPCD_BACKLIGHT,
>  };
>  
>  void intel_init_quirks(struct intel_display *display);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
