Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4522B8B99
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 07:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE806E4F3;
	Thu, 19 Nov 2020 06:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9E36E4F3;
 Thu, 19 Nov 2020 06:27:08 +0000 (UTC)
IronPort-SDR: jeRPWVie4Zf7YUPg5tWT9d1gm4Fiw7fsVJW2WmhK9NkpPXjCrOllDp3MZ5AyTkN/N0FmuT41UP
 sL0GSa4PuSOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171408965"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="171408965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 22:27:07 -0800
IronPort-SDR: LQ7UQdlwXL5fMAt4ik2ZoO05LoO7zOhboEBeKBva8HlyfALKq6wc4kYwN/rQIKEimempznQQU2
 x7lBTIZPpEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="476689172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 18 Nov 2020 22:27:07 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Nov 2020 22:27:06 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 11:57:03 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 11:57:03 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 03/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB
 block
Thread-Topic: [PATCH v2 03/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB
 block
Thread-Index: AQHWsDeymPdg7GPhcE2pFgLZt87h7qnPF4Mw
Date: Thu, 19 Nov 2020 06:27:03 +0000
Message-ID: <645c6c9e094c4e19a6b0c44f6e6c903e@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-4-ankit.k.nautiyal@intel.com>
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
> Subject: [PATCH v2 03/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB block
> 
> This patch parses HFVSDB fields for DSC1.2 capabilities of an
> HDMI2.1 sink. These fields are required by a source to understand the DSC
> capability of the sink, to set appropriate PPS parameters, before transmitting
> compressed data stream.
> 
> v2: Addressed following issues as suggested by Uma Shankar:
> -Added a new struct for hdmi dsc cap
> -Fixed bugs in macros usage.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 59 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h | 43 +++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
> 26797868ea5b..feaf2d7659a4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4939,11 +4939,70 @@ static void drm_parse_hdmi_forum_vsdb(struct
> drm_connector *connector,
> 
>  	if (hf_vsdb[7]) {
>  		u8 max_frl_rate;
> +		u8 dsc_max_frl_rate;
> +		u8 dsc_max_slices;
> +		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
> 
>  		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>  		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK)
> >> 4;
>  		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>  				&hdmi->max_frl_rate_per_lane);
> +		hdmi_dsc->v_1p2 = hf_vsdb[11] & DRM_EDID_DSC_1P2;
> +
> +		if (hdmi_dsc->v_1p2) {
> +			hdmi_dsc->native_420 = hf_vsdb[11] &
> DRM_EDID_DSC_NATIVE_420;
> +			hdmi_dsc->all_bpp = hf_vsdb[11] &
> DRM_EDID_DSC_ALL_BPP;
> +
> +			if (hf_vsdb[11] & DRM_EDID_DSC_16BPC)
> +				hdmi_dsc->bpc_supported = 16;
> +			else if (hf_vsdb[11] & DRM_EDID_DSC_12BPC)
> +				hdmi_dsc->bpc_supported = 12;
> +			else if (hf_vsdb[11] & DRM_EDID_DSC_10BPC)
> +				hdmi_dsc->bpc_supported = 10;
> +			else
> +				hdmi_dsc->bpc_supported = 0;
> +
> +			dsc_max_frl_rate = (hf_vsdb[12] &
> DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
> +			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc-
> >max_lanes,
> +					&hdmi_dsc->max_frl_rate_per_lane);
> +			hdmi_dsc->total_chunk_kbytes = hf_vsdb[13] &
> +DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
> +
> +			dsc_max_slices = hf_vsdb[12] &
> DRM_EDID_DSC_MAX_SLICES;
> +			switch (dsc_max_slices) {
> +			case 1:
> +				hdmi_dsc->max_slices = 1;
> +				hdmi_dsc->clk_per_slice = 340;
> +				break;
> +			case 2:
> +				hdmi_dsc->max_slices = 2;
> +				hdmi_dsc->clk_per_slice = 340;
> +				break;
> +			case 3:
> +				hdmi_dsc->max_slices = 4;
> +				hdmi_dsc->clk_per_slice = 340;
> +				break;
> +			case 4:
> +				hdmi_dsc->max_slices = 8;
> +				hdmi_dsc->clk_per_slice = 340;
> +				break;
> +			case 5:
> +				hdmi_dsc->max_slices = 8;
> +				hdmi_dsc->clk_per_slice = 400;
> +				break;
> +			case 6:
> +				hdmi_dsc->max_slices = 12;
> +				hdmi_dsc->clk_per_slice = 400;
> +				break;
> +			case 7:
> +				hdmi_dsc->max_slices = 16;
> +				hdmi_dsc->clk_per_slice = 400;
> +				break;
> +			case 0:
> +			default:
> +				hdmi_dsc->max_slices = 0;
> +				hdmi_dsc->clk_per_slice = 0;
> +			}
> +		}
>  	}
> 
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb); diff --git
> a/include/drm/drm_connector.h b/include/drm/drm_connector.h index
> f351bf10c076..06d24e36268e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -175,6 +175,46 @@ struct drm_scdc {
>  	struct drm_scrambling scrambling;
>  };
> 
> +/**
> + * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
> + *
> + * Describes the DSC support provided by HDMI 2.1 sink.
> + * The information is fetched fom additional HFVSDB blocks defined
> + * for HDMI 2.1.
> + */
> +struct drm_hdmi_dsc_cap {
> +	/** @v_1p2: flag for dsc1.2 version support by sink */
> +	bool v_1p2;
> +
> +	/** @native_420: Does sink support DSC with 4:2:0 compression */
> +	bool native_420;
> +
> +	/**
> +	 * @all_bpp: Does sink support all bpp with 4:4:4: or 4:2:2
> +	 * compressed formats
> +	 */
> +	bool all_bpp;
> +
> +	/**
> +	 * @bpc_supported: compressed bpc supported by sink : 10, 12 or 16 bpc
> +	 */
> +	u8 bpc_supported;
> +
> +	/** @max_slices: maximum number of Horizontal slices supported by */
> +	u8 max_slices;
> +
> +	/** @clk_per_slice : max pixel clock in MHz supported per slice */
> +	int clk_per_slice;
> +
> +	/** @max_lanes : dsc max lanes supported for Fixed rate Link training */
> +	u8 max_lanes;
> +
> +	/** @max_frl_rate_per_lane : maximum frl rate with DSC per lane */
> +	u8 max_frl_rate_per_lane;
> +
> +	/** @total_chunk_kbytes: max size of chunks in KBs supported per line*/
> +	u8 total_chunk_kbytes;
> +};
> 
>  /**
>   * struct drm_hdmi_info - runtime information about the connected HDMI sink
> @@ -213,6 +253,9 @@ struct drm_hdmi_info {
> 
>  	/** @max_lanes: supported by sink */
>  	u8 max_lanes;
> +
> +	/** @dsc_cap: DSC capabilities of the sink */
> +	struct drm_hdmi_dsc_cap dsc_cap;
>  };
> 
>  /**
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
