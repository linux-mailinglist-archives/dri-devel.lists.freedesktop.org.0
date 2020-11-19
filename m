Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AF2B9004
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79D66E59B;
	Thu, 19 Nov 2020 10:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0BF6E59B;
 Thu, 19 Nov 2020 10:23:52 +0000 (UTC)
IronPort-SDR: hTdplzQBW6KUjgPsvk65oW9WBOWylfzYYA9NpeXXzAUQ3DWWVYnlgwOIRsTi1g1aI4SetCbAGJ
 a054ziuhAhew==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="159037819"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="159037819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 02:23:51 -0800
IronPort-SDR: 3KQHzzmTYQZlQinpzNdU/vTG91JRqSjqMbVbb+oUajpRI+a2naaK0IONSHjy0EWw8E2Mb55lbb
 141qLjtCwLhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="401473541"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 19 Nov 2020 02:23:51 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 02:23:50 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 15:53:47 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 15:53:47 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 08/13] drm/i915: Add support for starting FRL training
 for HDMI2.1 via PCON
Thread-Topic: [PATCH v2 08/13] drm/i915: Add support for starting FRL training
 for HDMI2.1 via PCON
Thread-Index: AQHWsDe5hDntDBW61kuHro1Ov4TMu6nPW48w
Date: Thu, 19 Nov 2020 10:23:47 +0000
Message-ID: <f1a4c9a7959e47ef8e4e5060ba366e56@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Sunday, November 1, 2020 3:37 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH v2 08/13] drm/i915: Add support for starting FRL training for
> HDMI2.1 via PCON
> 
> This patch adds functions to start FRL training for an HDMI2.1 sink, connected via
> a PCON as a DP branch device.
> This patch also adds a new structure for storing frl training related data, when
> FRL training is completed.
> 
> v2: As suggested by Uma Shankar:
> -renamed couple of variables for better clarity -tweaked the macros used for
> correct semantics for true/false -fixed other styling issues.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   7 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 189 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
>  3 files changed, 198 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 282c6ee76384..2c58d63928b8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1286,6 +1286,11 @@ struct intel_dp_compliance {
>  	u8 test_lane_count;
>  };
> 
> +struct intel_dp_pcon_frl {
> +	bool is_trained;
> +	int trained_rate_gbps;
> +};
> +
>  struct intel_dp {
>  	i915_reg_t output_reg;
>  	u32 DP;
> @@ -1407,6 +1412,8 @@ struct intel_dp {
> 
>  	bool hobl_failed;
>  	bool hobl_active;
> +
> +	struct intel_dp_pcon_frl frl;
>  };
> 
>  enum lspcon_vendor {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index caf7666f1892..7feee2adf9b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2871,6 +2871,9 @@ static void intel_dp_prepare(struct intel_encoder
> *encoder,
>  			intel_dp->DP |= DP_PIPE_SEL_CHV(crtc->pipe);
>  		else
>  			intel_dp->DP |= DP_PIPE_SEL(crtc->pipe);
> +
> +		intel_dp->frl.is_trained = false;
> +		intel_dp->frl.trained_rate_gbps = 0;
>  	}
>  }
> 
> @@ -3769,6 +3772,8 @@ static void intel_disable_dp(struct intel_atomic_state
> *state,
>  	intel_edp_backlight_off(old_conn_state);
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
>  	intel_edp_panel_off(intel_dp);
> +	intel_dp->frl.is_trained = false;
> +	intel_dp->frl.trained_rate_gbps = 0;
>  }
> 
>  static void g4x_disable_dp(struct intel_atomic_state *state, @@ -3864,6
> +3869,190 @@ cpt_set_link_train(struct intel_dp *intel_dp,
>  	intel_de_posting_read(dev_priv, intel_dp->output_reg);  }
> 
> +static int intel_dp_get_max_rate_gbps(struct intel_dp *intel_dp) {
> +	int max_link_clock, max_lanes, max_rate_khz, max_rate_gbps;
> +
> +	max_link_clock = intel_dp_max_link_rate(intel_dp);
> +	max_lanes = intel_dp_max_lane_count(intel_dp);
> +	max_rate_khz = intel_dp_max_data_rate(max_link_clock, max_lanes);
> +	max_rate_gbps = 8 * DIV_ROUND_UP(max_rate_khz, 1000000);
> +
> +	return max_rate_gbps;
> +}
> +
> +static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask) {
> +	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
> +	int i;
> +
> +	for (i = ARRAY_SIZE(bw_gbps) - 1; i >= 0; i--) {
> +		if (frl_bw_mask & (1 << i))
> +			return bw_gbps[i];
> +	}
> +	return 0;
> +}
> +
> +static int intel_dp_pcon_set_frl_mask(int max_frl) {
> +
> +	switch (max_frl) {
> +	case 48:
> +		return DP_PCON_FRL_BW_MASK_48GBPS;
> +	case 40:
> +		return DP_PCON_FRL_BW_MASK_40GBPS;
> +	case 32:
> +		return DP_PCON_FRL_BW_MASK_32GBPS;
> +	case 24:
> +		return DP_PCON_FRL_BW_MASK_24GBPS;
> +	case 18:
> +		return DP_PCON_FRL_BW_MASK_18GBPS;
> +	case 9:
> +		return DP_PCON_FRL_BW_MASK_9GBPS;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp) {
> +	struct intel_connector *intel_connector = intel_dp->attached_connector;
> +	struct drm_connector *connector = &intel_connector->base;
> +
> +	return (connector->display_info.hdmi.max_frl_rate_per_lane *
> +		connector->display_info.hdmi.max_lanes);
> +}
> +
> +static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
> +{ #define PCON_EXTENDED_TRAIN_MODE (1 > 0) #define
> PCON_CONCURRENT_MODE
> +(1 > 0) #define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE #define
> +PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE #define
> +TIMEOUT_FRL_READY_MS 500 #define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
> +
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	int max_frl_bw, max_pcon_frl_bw, max_sink_frl_bw, max_rate_gbps,
> max_edid_frl_bw, ret;
> +	u8 max_frl_bw_mask = 0, frl_trained_mask;
> +	bool is_active;
> +
> +	ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
> +	if (ret < 0)
> +		return ret;
> +
> +	max_rate_gbps = intel_dp_get_max_rate_gbps(intel_dp);
> +	drm_dbg(&i915->drm, "Source max rate = %d Gbps\n", max_rate_gbps);
> +
> +	max_pcon_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
> +	drm_dbg(&i915->drm, "PCON max rate = %d Gbps\n", max_pcon_frl_bw);
> +
> +	/* Double Check from HDMI SINK EDID */
> +	max_edid_frl_bw = intel_dp_hdmi_sink_max_frl(intel_dp);
> +	drm_dbg(&i915->drm, "Sink max rate from EDID = %d Gbps\n",
> +max_edid_frl_bw);
> +
> +	max_sink_frl_bw = intel_dp->dfp.sink_max_frl_bw;
> +	drm_dbg(&i915->drm, "Sink max rate from PCON = %d Gbps\n",
> +max_sink_frl_bw);
> +
> +	/*
> +	 * TODO MAX SINK FRL from PCON is not enumerated. Using MAX FRL
> value
> +	 * directly from EDID. Need to confirm from Spec.
> +	 */
> +	max_frl_bw = min(max_rate_gbps, min(max_edid_frl_bw,
> +max_pcon_frl_bw));
> +
> +	if (max_frl_bw <= 0)
> +		return -EINVAL;
> +
> +	ret = drm_dp_pcon_frl_prepare(&intel_dp->aux, false);
> +	if (ret < 0)
> +		return ret;
> +	/* Wait for PCON to be FRL Ready */
> +	wait_for(is_active = drm_dp_pcon_is_frl_ready(&intel_dp->aux) == true,
> +TIMEOUT_FRL_READY_MS);
> +
> +	if (!is_active)
> +		return -ETIMEDOUT;
> +
> +	max_frl_bw_mask = intel_dp_pcon_set_frl_mask(max_frl_bw);
> +	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw,
> PCON_SEQUENTIAL_MODE);
> +	if (ret < 0)
> +		return ret;
> +	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask,
> PCON_NORMAL_TRAIN_MODE);
> +	if (ret < 0)
> +		return ret;
> +	ret = drm_dp_pcon_frl_enable(&intel_dp->aux);
> +	if (ret < 0)
> +		return ret;
> +	/*
> +	 * Wait for FRL to be completed
> +	 * Check if the HDMI Link is up and active.
> +	 */
> +	wait_for(is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux) ==
> +true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
> +
> +	if (!is_active)
> +		return -ETIMEDOUT;
> +
> +	/* Verify HDMI Link configuration shows FRL Mode */
> +	if (DP_PCON_HDMI_MODE_FRL !=
> drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, &frl_trained_mask)) {
> +		drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL
> Mode\n");
> +		return -EINVAL;
> +	}
> +	drm_dbg(&i915->drm, "MAX_FRL_MASK = %u, FRL_TRAINED_MASK =
> %u\n",
> +max_frl_bw_mask, frl_trained_mask);
> +
> +	/*
> +	 * Read HDMI_LINK_STATUS_TRAINED 0x2005 bit 5
> +	 * TODO: Details not mentioned in spec. Need to check.
> +	 */
> +
> +	intel_dp->frl.trained_rate_gbps =
> intel_dp_pcon_get_frl_mask(frl_trained_mask);
> +	intel_dp->frl.is_trained = true;
> +	drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n",
> +intel_dp->frl.trained_rate_gbps);
> +
> +	return 0;
> +}
> +
> +static bool intel_dp_is_frl_required(struct intel_dp *intel_dp) {
> +	if (!intel_dp->frl.is_trained)
> +		return true;
> +	/*
> +	 * #TODO check if the mode really required FRL or can work
> +	 * with TMDS mode.
> +	 */
> +
> +	return false;
> +}
> +
> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp) {
> +	if (drm_dp_is_branch(intel_dp->dpcd) &&
> +	    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
> +		return true;
> +
> +	return false;
> +}
> +
> +void intel_dp_check_frl_training(struct intel_dp *intel_dp) {
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> +
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
> +	    !intel_dp_is_frl_required(intel_dp))
> +		return;
> +
> +	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
> +		int ret, mode;
> +
> +		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing
> with TMDS mode\n");
> +		ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
> +		mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);
> +
> +		if (ret < 0 || mode != DP_PCON_HDMI_MODE_TMDS)
> +			drm_dbg(&dev_priv->drm, "Issue with PCON, cannot set
> TMDS mode\n");
> +	} else {
> +		drm_dbg(&dev_priv->drm, "FRL training Completed\n");
> +	}
> +}
> +
>  static void
>  g4x_set_link_train(struct intel_dp *intel_dp,
>  		   const struct intel_crtc_state *crtc_state, diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 3f862b4fd34f..a667d3f578d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -143,4 +143,6 @@ bool intel_dp_initial_fastset_check(struct intel_encoder
> *encoder,  void intel_dp_sync_state(struct intel_encoder *encoder,
>  			 const struct intel_crtc_state *crtc_state);
> 
> +void intel_dp_check_frl_training(struct intel_dp *intel_dp);
> +
>  #endif /* __INTEL_DP_H__ */
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
