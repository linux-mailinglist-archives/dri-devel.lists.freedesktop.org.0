Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91E28F8A5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 20:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531E6E270;
	Thu, 15 Oct 2020 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0406E222;
 Thu, 15 Oct 2020 18:31:29 +0000 (UTC)
IronPort-SDR: eJR7aiJlhJVaY4itvF0NghpFbFjoU8ujFjdk3kKSqUh8XOqFTWIkX6ORjxJHAnATqxVeqc9dXb
 QDBkxISZgrbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="165644555"
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="165644555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:31:28 -0700
IronPort-SDR: 7GROFgBE4RCUigGB05d/0MNJRDcpjwBMp4DVTVwplIO3V8PkOlnsbghRcKmOUpz3ruAKKgNhWi
 h436yIC/KcPg==
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="531365435"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:31:28 -0700
Date: Thu, 15 Oct 2020 14:33:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [RFC v2 4/8] drm/i915/dp: Rename eDP VESA backlight
 interface functions
Message-ID: <20201015183313.GD2616619@intel.com>
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916171855.129511-5-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Vasily Khoruzhick <anarsoul@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 01:18:51PM -0400, Lyude Paul wrote:
> Since we're about to add support for a second type of backlight control
> interface over DP AUX (specifically, Intel's proprietary HDR backlight
> controls) let's rename all of the current backlight hooks we have for
> vesa to make it clear that they're specific to the VESA interface and
> not Intel's.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 51 ++++++++++---------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index acbd7eb66cbe3..f601bcbe8ee46 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -25,7 +25,7 @@
>  #include "intel_display_types.h"
>  #include "intel_dp_aux_backlight.h"
>  
> -static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
> +static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	u8 reg_val = 0;
> @@ -56,7 +56,7 @@ static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
>   * Read the current backlight value from DPCD register(s) based
>   * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
>   */
> -static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
> +static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> @@ -99,7 +99,8 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
>   * 8-bit or 16 bit value (MSB and LSB)
>   */
>  static void
> -intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
> +				u32 level)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -129,7 +130,7 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
>   * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
>   *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
>   */
> -static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
> +static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -165,8 +166,8 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
>  	return true;
>  }
>  
> -static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
> -					  const struct drm_connector_state *conn_state)
> +static void intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
> +					       const struct drm_connector_state *conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -206,7 +207,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  	}
>  
>  	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
> -		if (intel_dp_aux_set_pwm_freq(connector))
> +		if (intel_dp_aux_vesa_set_pwm_freq(connector))
>  			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
>  
>  	if (new_dpcd_buf != dpcd_buf) {
> @@ -217,18 +218,18 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  		}
>  	}
>  
> -	intel_dp_aux_set_backlight(conn_state,
> -				   connector->panel.backlight.level);
> -	set_aux_backlight_enable(intel_dp, true);
> +	intel_dp_aux_vesa_set_backlight(conn_state,
> +					connector->panel.backlight.level);
> +	set_vesa_backlight_enable(intel_dp, true);
>  }
>  
> -static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
> +static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state)
>  {
> -	set_aux_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
> -				 false);
> +	set_vesa_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
> +				  false);
>  }
>  
> -static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
> +static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -308,24 +309,24 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
>  	return max_backlight;
>  }
>  
> -static int intel_dp_aux_setup_backlight(struct intel_connector *connector,
> -					enum pipe pipe)
> +static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
> +					     enum pipe pipe)
>  {
>  	struct intel_panel *panel = &connector->panel;
>  
> -	panel->backlight.max = intel_dp_aux_calc_max_backlight(connector);
> +	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
>  	if (!panel->backlight.max)
>  		return -ENODEV;
>  
>  	panel->backlight.min = 0;
> -	panel->backlight.level = intel_dp_aux_get_backlight(connector);
> +	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector);
>  	panel->backlight.enabled = panel->backlight.level != 0;
>  
>  	return 0;
>  }
>  
>  static bool
> -intel_dp_aux_display_control_capable(struct intel_connector *connector)
> +intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> @@ -349,7 +350,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  
>  	if (i915->params.enable_dpcd_backlight == 0 ||
> -	    !intel_dp_aux_display_control_capable(intel_connector))
> +	    !intel_dp_aux_supports_vesa_backlight(intel_connector))
>  		return -ENODEV;
>  
>  	/*
> @@ -371,11 +372,11 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
>  		return -ENODEV;
>  	}
>  
> -	panel->backlight.setup = intel_dp_aux_setup_backlight;
> -	panel->backlight.enable = intel_dp_aux_enable_backlight;
> -	panel->backlight.disable = intel_dp_aux_disable_backlight;
> -	panel->backlight.set = intel_dp_aux_set_backlight;
> -	panel->backlight.get = intel_dp_aux_get_backlight;
> +	panel->backlight.setup = intel_dp_aux_vesa_setup_backlight;
> +	panel->backlight.enable = intel_dp_aux_vesa_enable_backlight;
> +	panel->backlight.disable = intel_dp_aux_vesa_disable_backlight;
> +	panel->backlight.set = intel_dp_aux_vesa_set_backlight;
> +	panel->backlight.get = intel_dp_aux_vesa_get_backlight;
>  
>  	return 0;
>  }
> -- 
> 2.26.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
