Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEE2D8C01
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 08:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0A16E0DE;
	Sun, 13 Dec 2020 07:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9CC6E0DE;
 Sun, 13 Dec 2020 07:16:37 +0000 (UTC)
IronPort-SDR: eJnpAl/AGozH9A9Djncs/Eqv4h7zYx5uAy7AQSdAbjJBbhQCoThE5ILBBlEeB9oksXeCAk52An
 3miOxaMzBC8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9833"; a="238694412"
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="238694412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:16:36 -0800
IronPort-SDR: 57Or7OnLkjtXttxuL2QE4mMVYxA+JnTskL/nl+eCWK0xYVXVw7rfCydL9iLQqH39tGdNSTk+Cq
 DcPhloFserwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="329487010"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2020 23:16:36 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 12 Dec 2020 23:16:35 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 12:46:33 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Sun, 13 Dec 2020 12:46:33 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 14/16] drm/i915/display: Configure PCON for DSC1.1 to
 DSC1.2 encoding
Thread-Topic: [PATCH v4 14/16] drm/i915/display: Configure PCON for DSC1.1 to
 DSC1.2 encoding
Thread-Index: AQHWzTf3TcT8wIPKpkGP1RDupdwlU6n0pMxQ
Date: Sun, 13 Dec 2020 07:16:33 +0000
Message-ID: <ee4394858c4a4dbd8365caa159297f23@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-15-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201208075145.17389-15-ankit.k.nautiyal@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Kulkarni,
 Vandita" <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Tuesday, December 8, 2020 1:22 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> airlied@linux.ie; jani.nikula@linux.intel.com; ville.syrjala@linux.intel.com;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH v4 14/16] drm/i915/display: Configure PCON for DSC1.1 to
> DSC1.2 encoding
> 
> When a source supporting DSC1.1 is connected to DSC1.2 HDMI2.1 sink via DP
> HDMI2.1 PCON, the PCON can be configured to decode the
> DSC1.1 compressed stream and encode to DSC1.2. It then sends the
> DSC1.2 compressed stream to the HDMI2.1 sink.
> 
> This patch configures the PCON for DSC1.1 to DSC1.2 encoding, based on the
> PCON's DSC encoder capablities and HDMI2.1 sink's DSC decoder capabilities.
> 
> v2: Addressed review comments from Uma Shankar:
> -fixed the error in packing pps parameter values -added check for pcon in the
> pcon related function -appended display in commit message

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |   1 +
>  drivers/gpu/drm/i915/display/intel_dp.c  | 117 ++++++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp.h  |   2 +
>  3 files changed, 118 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 3ff8b18f1997..721a47bbc009 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3653,6 +3653,7 @@ static void tgl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
> 
>  	intel_dp_check_frl_training(intel_dp, crtc_state);
> +	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
> 
>  	/*
>  	 * 7.i Follow DisplayPort specification training sequence (see notes for
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4dd272a34ee8..30c76ba63232 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4039,9 +4039,21 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp
> *intel_dp)  {
>  	struct intel_connector *intel_connector = intel_dp->attached_connector;
>  	struct drm_connector *connector = &intel_connector->base;
> +	int max_frl_rate;
> +	int max_lanes, rate_per_lane;
> +	int max_dsc_lanes, dsc_rate_per_lane;
> 
> -	return (connector->display_info.hdmi.max_frl_rate_per_lane *
> -		connector->display_info.hdmi.max_lanes);
> +	max_lanes = connector->display_info.hdmi.max_lanes;
> +	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
> +	max_frl_rate = max_lanes * rate_per_lane;
> +
> +	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
> +		max_dsc_lanes = connector-
> >display_info.hdmi.dsc_cap.max_lanes;
> +		dsc_rate_per_lane = connector-
> >display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
> +		max_frl_rate = min(max_frl_rate, max_dsc_lanes *
> dsc_rate_per_lane);
> +	}
> +
> +	return max_frl_rate;
>  }
> 
>  static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp) @@ -
> 4171,6 +4183,105 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp,
>  	}
>  }
> 
> +static int
> +intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state
> +*crtc_state) {
> +
> +	int vactive = crtc_state->hw.adjusted_mode.vdisplay;
> +
> +	return intel_hdmi_dsc_get_slice_height(vactive);
> +}
> +
> +static int
> +intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
> +			     const struct intel_crtc_state *crtc_state) {
> +	struct intel_connector *intel_connector = intel_dp->attached_connector;
> +	struct drm_connector *connector = &intel_connector->base;
> +	int hdmi_throughput = connector-
> >display_info.hdmi.dsc_cap.clk_per_slice;
> +	int hdmi_max_slices = connector->display_info.hdmi.dsc_cap.max_slices;
> +	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp-
> >pcon_dsc_dpcd);
> +	int pcon_max_slice_width =
> +drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
> +
> +
> +	return intel_hdmi_dsc_get_num_slices(crtc_state, pcon_max_slices,
> +					     pcon_max_slice_width,
> +					     hdmi_max_slices, hdmi_throughput); }
> +
> +static int
> +intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
> +			  const struct intel_crtc_state *crtc_state,
> +			  int num_slices, int slice_width)
> +{
> +	struct intel_connector *intel_connector = intel_dp->attached_connector;
> +	struct drm_connector *connector = &intel_connector->base;
> +	int output_format = crtc_state->output_format;
> +	bool hdmi_all_bpp = connector->display_info.hdmi.dsc_cap.all_bpp;
> +	int pcon_fractional_bpp = drm_dp_pcon_dsc_bpp_incr(intel_dp-
> >pcon_dsc_dpcd);
> +	int hdmi_max_chunk_bytes =
> +		connector->display_info.hdmi.dsc_cap.total_chunk_kbytes *
> 1024;
> +
> +	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
> +				      num_slices, output_format, hdmi_all_bpp,
> +				      hdmi_max_chunk_bytes);
> +}
> +
> +void
> +intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
> +			    const struct intel_crtc_state *crtc_state) {
> +	u8 pps_param[6];
> +	int slice_height;
> +	int slice_width;
> +	int num_slices;
> +	int bits_per_pixel;
> +	int ret;
> +	struct intel_connector *intel_connector = intel_dp->attached_connector;
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct drm_connector *connector;
> +	bool hdmi_is_dsc_1_2;
> +
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
> +		return;
> +
> +	if (!intel_connector)
> +		return;
> +	connector = &intel_connector->base;
> +	hdmi_is_dsc_1_2 = connector->display_info.hdmi.dsc_cap.v_1p2;
> +
> +	if (!drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) ||
> +	    !hdmi_is_dsc_1_2)
> +		return;
> +
> +	slice_height = intel_dp_pcon_dsc_enc_slice_height(crtc_state);
> +	if (!slice_height)
> +		return;
> +
> +	num_slices = intel_dp_pcon_dsc_enc_slices(intel_dp, crtc_state);
> +	if (!num_slices)
> +		return;
> +
> +	slice_width = DIV_ROUND_UP(crtc_state->hw.adjusted_mode.hdisplay,
> +				   num_slices);
> +
> +	bits_per_pixel = intel_dp_pcon_dsc_enc_bpp(intel_dp, crtc_state,
> +						  num_slices, slice_width);
> +	if (!bits_per_pixel)
> +		return;
> +
> +	pps_param[0] = slice_height & 0xFF;
> +	pps_param[1] = slice_height >> 8;
> +	pps_param[2] = slice_width & 0xFF;
> +	pps_param[3] = slice_width >> 8;
> +	pps_param[4] = bits_per_pixel & 0xFF;
> +	pps_param[5] = (bits_per_pixel >> 8) & 0x3;
> +
> +	ret = drm_dp_pcon_pps_override_param(&intel_dp->aux, pps_param);
> +	if (ret < 0)
> +		drm_dbg_kms(&i915->drm, "Failed to set pcon DSC\n"); }
> +
>  static void
>  g4x_set_link_train(struct intel_dp *intel_dp,
>  		   const struct intel_crtc_state *crtc_state, @@ -4302,6 +4413,7
> @@ static void intel_enable_dp(struct intel_atomic_state *state,
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
>  	intel_dp_configure_protocol_converter(intel_dp);
>  	intel_dp_check_frl_training(intel_dp, pipe_config);
> +	intel_dp_pcon_dsc_configure(intel_dp, pipe_config);
>  	intel_dp_start_link_train(intel_dp, pipe_config);
>  	intel_dp_stop_link_train(intel_dp, pipe_config);
> 
> @@ -6261,6 +6373,7 @@ int intel_dp_retrain_link(struct intel_encoder
> *encoder,
>  			continue;
> 
>  		intel_dp_check_frl_training(intel_dp, crtc_state);
> +		intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
>  		intel_dp_start_link_train(intel_dp, crtc_state);
>  		intel_dp_stop_link_train(intel_dp, crtc_state);
>  		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index b4a14646caea..9bba920b8197 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -146,5 +146,7 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
> 
>  void intel_dp_check_frl_training(struct intel_dp *intel_dp,
>  				 const struct intel_crtc_state *crtc_state);
> +void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
> +				 const struct intel_crtc_state *crtc_state);
> 
>  #endif /* __INTEL_DP_H__ */
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
