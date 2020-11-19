Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703A2B90E6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C130A89A1F;
	Thu, 19 Nov 2020 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471089A1F;
 Thu, 19 Nov 2020 11:29:33 +0000 (UTC)
IronPort-SDR: Al8B74i2U15l7W7k9MVNcAOLbuwSw+8XAvTF+7szUC1ZuYgYZRdsDfN33K8PsdV7prIt/AgXvk
 ObVqVVCNy3AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="150542737"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="150542737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 03:29:32 -0800
IronPort-SDR: L4cEPObnkK6VyFCATmMMb0WqTLmDHTDm55lDeB+Wgj1LVcnizksBD2t8UyFfgYrNjJq4K0FzdA
 yyEkm3zdCrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="330902743"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 19 Nov 2020 03:29:32 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 03:29:31 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 16:59:28 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 16:59:28 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 11/13] drm/i915: Read DSC capabilities of the HDMI2.1
 PCON encoder
Thread-Topic: [PATCH v2 11/13] drm/i915: Read DSC capabilities of the HDMI2.1
 PCON encoder
Thread-Index: AQHWsDe+QkZ9JTA55keeGWt424qgvKnPbRgA
Date: Thu, 19 Nov 2020 11:29:28 +0000
Message-ID: <cffc77289b9d41078dc4049ad5d5866a@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-12-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-12-ankit.k.nautiyal@intel.com>
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
> Subject: [PATCH v2 11/13] drm/i915: Read DSC capabilities of the HDMI2.1 PCON
> encoder
> 
> This patch adds support to read and store the DSC capabilities of the
> HDMI2.1 PCon encoder. It also adds a new field to store these caps, The caps are
> read during dfp update and can later be used to get the PPS parameters for
> PCON-HDMI2.1 sink pair. Which inturn will be used to take a call to override the
> existing PPS-metadata, by either writing the entire new PPS metadata, or by
> writing only the PPS override parameters.
> 
> v2: Restructured the code to read all capability DPCDs at once and store in an
> array in intel_dp structure.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 2c58d63928b8..f43ded030c14 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1309,6 +1309,7 @@ struct intel_dp {
>  	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
>  	u8 lttpr_phy_caps[DP_MAX_LTTPR_COUNT][DP_LTTPR_PHY_CAP_SIZE];
>  	u8 fec_capable;
> +	u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE];
>  	/* source rates */
>  	int num_source_rates;
>  	const int *source_rates;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6177169c4401..2e7ddb062efe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3869,6 +3869,24 @@ cpt_set_link_train(struct intel_dp *intel_dp,
>  	intel_de_posting_read(dev_priv, intel_dp->output_reg);  }
> 
> +static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp) {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	/* Clear the cached register set to avoid using stale values */
> +

Drop this extra line. With this fixed
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> +	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
> +
> +	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
> +				     intel_dp->pcon_dsc_dpcd,
> +				     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
> +		drm_err(&i915->drm, "Failed to read DPCD register 0x%x\n",
> +			DP_PCON_DSC_ENCODER);
> +
> +	drm_dbg_kms(&i915->drm, "PCON ENCODER DSC DPCD: %*ph\n",
> +		   (int)sizeof(intel_dp->pcon_dsc_dpcd), intel_dp-
> >pcon_dsc_dpcd); }
> +
>  static int intel_dp_get_max_rate_gbps(struct intel_dp *intel_dp)  {
>  	int max_link_clock, max_lanes, max_rate_khz, max_rate_gbps; @@ -
> 6645,6 +6663,8 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  		    intel_dp->dfp.max_tmds_clock,
>  		    intel_dp->dfp.pcon_max_frl_bw,
>  		    intel_dp->dfp.sink_max_frl_bw);
> +
> +	intel_dp_get_pcon_dsc_cap(intel_dp);
>  }
> 
>  static void
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
