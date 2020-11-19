Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8A2B8FDE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9896E5BB;
	Thu, 19 Nov 2020 10:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242166E5A9;
 Thu, 19 Nov 2020 10:07:23 +0000 (UTC)
IronPort-SDR: 1ohuiDWNf7FNMLOyJljNIIgKLq85OcGf1dmkS2PzLWomHPvM7uCyxfM4iaOu+Kl/yUexEq1FT2
 Cp6wM20uXC3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="159036329"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="159036329"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 02:07:22 -0800
IronPort-SDR: nBPrr0tajGTDKkEW7zLv/UfS7j2tCOxFT5/XhtqLP/04exlZ/DtD3dBupT59E7SEudKaSzFxey
 XzovHJSAynXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="363332416"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2020 02:07:22 -0800
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 02:07:21 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 15:37:18 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 15:37:18 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 07/13] drm/i915: Capture max frl rate for PCON in dfp
 cap structure
Thread-Topic: [PATCH v2 07/13] drm/i915: Capture max frl rate for PCON in dfp
 cap structure
Thread-Index: AQHWsDe4L7d4x6+mfUuCvMyDiUf1I6nPVvOg
Date: Thu, 19 Nov 2020 10:07:18 +0000
Message-ID: <8953a551c02d4353ae143f4c152245ec@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-8-ankit.k.nautiyal@intel.com>
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
> Subject: [PATCH v2 07/13] drm/i915: Capture max frl rate for PCON in dfp cap
> structure
> 
> HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON and by the
> sink.
> 
> This patch captures these in dfp cap structure in intel_dp and uses these to
> prune connector modes that cannot be supported by the PCON and sink FRL
> bandwidth.
> 
> v2: Addressed review comments from Uma Shankar:
> -tweaked the comparison of target bw and pcon frl bw to avoid roundup errors.
> -minor modification of field names and comments.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 38 ++++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index f6f0626649e0..282c6ee76384 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1397,6 +1397,7 @@ struct intel_dp {
>  	struct {
>  		int min_tmds_clock, max_tmds_clock;
>  		int max_dotclock;
> +		int pcon_max_frl_bw, sink_max_frl_bw;
>  		u8 max_bpc;
>  		bool ycbcr_444_to_420;
>  	} dfp;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 818daab252f3..caf7666f1892 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -684,6 +684,29 @@ intel_dp_mode_valid_downstream(struct
> intel_connector *connector,
>  	const struct drm_display_info *info = &connector->base.display_info;
>  	int tmds_clock;
> 
> +	/*
> +	 * If PCON and HDMI2.1 sink both support FRL MODE, check FRL
> +	 * bandwidth constraints.
> +	 */
> +	if (intel_dp->dfp.pcon_max_frl_bw) {
> +		int target_bw;
> +		int max_frl_bw;
> +		int bpp = intel_dp_mode_min_output_bpp(&connector->base,
> mode);
> +
> +		target_bw = bpp * target_clock;
> +
> +		max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
> +				 intel_dp->dfp.sink_max_frl_bw);
> +
> +		/* converting bw from Gbps to Kbps*/
> +		max_frl_bw = max_frl_bw * 1000000;
> +
> +		if (target_bw > max_frl_bw)
> +			return MODE_CLOCK_HIGH;
> +
> +		return MODE_OK;
> +	}
> +
>  	if (intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
> @@ -6366,13 +6389,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  						 intel_dp->downstream_ports,
>  						 edid);
> 
> +	intel_dp->dfp.pcon_max_frl_bw =
> +		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
> +					   intel_dp->downstream_ports);
> +
> +	intel_dp->dfp.sink_max_frl_bw =
> +drm_dp_get_hdmi_sink_max_frl_bw(&intel_dp->aux);
> +
>  	drm_dbg_kms(&i915->drm,
> -		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
> TMDS clock %d-%d\n",
> +		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
> TMDS clock
> +%d-%d, PCON Max FRL BW %dGbps, Sink Max FRL BW %dGbps\n",
>  		    connector->base.base.id, connector->base.name,
>  		    intel_dp->dfp.max_bpc,
>  		    intel_dp->dfp.max_dotclock,
>  		    intel_dp->dfp.min_tmds_clock,
> -		    intel_dp->dfp.max_tmds_clock);
> +		    intel_dp->dfp.max_tmds_clock,
> +		    intel_dp->dfp.pcon_max_frl_bw,
> +		    intel_dp->dfp.sink_max_frl_bw);
>  }
> 
>  static void
> @@ -6464,6 +6495,9 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
>  	intel_dp->dfp.min_tmds_clock = 0;
>  	intel_dp->dfp.max_tmds_clock = 0;
> 
> +	intel_dp->dfp.pcon_max_frl_bw = 0;
> +	intel_dp->dfp.sink_max_frl_bw = 0;
> +
>  	intel_dp->dfp.ycbcr_444_to_420 = false;
>  	connector->base.ycbcr_420_allowed = false;  }
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
