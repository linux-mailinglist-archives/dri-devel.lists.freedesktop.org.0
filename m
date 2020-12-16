Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D62DC6F0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 20:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579B89C09;
	Wed, 16 Dec 2020 19:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A8B89BFE;
 Wed, 16 Dec 2020 19:15:43 +0000 (UTC)
IronPort-SDR: ST7M/37w+BRzw3d+ZrNEzr7oJnRJhIMtFK2LVykMgiFQdKfLetcfO3OJAu8MXrzfQYYwZFoekn
 ivC375FYuAZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="162172280"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; d="scan'208";a="162172280"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 11:15:42 -0800
IronPort-SDR: B9Ql2ozU13/LNQhpQp4RqemDQL4xtPrhm/OyuNoIg10ACs19lLsYu1EkdMHqqpjWKHJA5VeveC
 SUjsPLdgS0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; d="scan'208";a="333494451"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2020 11:15:41 -0800
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Dec 2020 11:15:40 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Dec 2020 00:45:38 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 17 Dec 2020 00:45:38 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 07/15] drm/dp_helper: Add helpers to configure PCONs
 RGB-YCbCr Conversion
Thread-Topic: [PATCH v5 07/15] drm/dp_helper: Add helpers to configure PCONs
 RGB-YCbCr Conversion
Thread-Index: AQHW022ZTUEdZOGlmUSDFJ7sQz68oKn6F9Eg
Date: Wed, 16 Dec 2020 19:15:38 +0000
Message-ID: <5d8bccad8ff14659b496129496b4a189@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
 <20201216053121.18819-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201216053121.18819-8-ankit.k.nautiyal@intel.com>
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
> Sent: Wednesday, December 16, 2020 11:01 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> airlied@linux.ie; jani.nikula@linux.intel.com; ville.syrjala@linux.intel.com;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH v5 07/15] drm/dp_helper: Add helpers to configure PCONs RGB-
> YCbCr Conversion
> 
> DP Specification for DP2.0 to HDMI2.1 Pcon specifies support for conversion of
> colorspace from RGB to YCbCr.
> https://groups.vesa.org/wg/DP/document/previewpdf/15651
> 
> This patch adds the relavant registers and helper functions to get the capability
> and set the color conversion bits for rgb->ycbcr conversion through PCON.
> 
> v2: As suggested in review comments:
> -Fixed bug in the check condition in a drm_helper as reported by  Dan Carpenter
> and Kernel test robot. (Dan Carepenter) -Modified the color-conversion cap
> helper function, to accomodate
>  BT709 and BT2020 colorspace. (Uma Shankar) -Added spec details for the new
> cap for color conversion. (Uma Shankar)

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     | 19 +++++++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c index 689fd0d5f6c5..9abd65c694ab 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -949,6 +949,38 @@ bool
> drm_dp_downstream_444_to_420_conversion(const u8
> dpcd[DP_RECEIVER_CAP_SIZE]  }
> EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
> 
> +/**
> + * drm_dp_downstream_rgb_to_ycbcr_conversion() - determine downstream
> facing port
> + *                                               RGB->YCbCr conversion capability
> + * @dpcd: DisplayPort configuration data
> + * @port_cap: downstream facing port capabilities
> + * @colorspc: Colorspace for which conversion cap is sought
> + *
> + * Returns: whether the downstream facing port can convert RGB->YCbCr
> +for a given
> + * colorspace.
> + */
> +bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8
> dpcd[DP_RECEIVER_CAP_SIZE],
> +					       const u8 port_cap[4],
> +					       u8 color_spc)
> +{
> +	if (!drm_dp_is_branch(dpcd))
> +		return false;
> +
> +	if (dpcd[DP_DPCD_REV] < 0x13)
> +		return false;
> +
> +	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
> +	case DP_DS_PORT_TYPE_HDMI:
> +		if ((dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> DP_DETAILED_CAP_INFO_AVAILABLE) == 0)
> +			return false;
> +
> +		return port_cap[3] & color_spc;
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_downstream_rgb_to_ycbcr_conversion);
> +
>  /**
>   * drm_dp_downstream_mode() - return a mode for downstream facing port
>   * @dev: DRM device
> @@ -3101,3 +3133,32 @@ int drm_dp_pcon_pps_override_param(struct
> drm_dp_aux *aux, u8 pps_param[6])
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
> +
> +/*
> + * drm_dp_pcon_convert_rgb_to_ycbcr() - Configure the PCon to convert
> +RGB to Ycbcr
> + * @aux: displayPort AUX channel
> + * @color_spc: Color-space/s for which conversion is to be enabled, 0 for
> disable.
> + *
> + * Returns 0 on success, else returns negative error code.
> + */
> +int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8
> +color_spc) {
> +	int ret;
> +	u8 buf;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2,
> &buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (color_spc & DP_CONVERSION_RGB_YCBCR_MASK)
> +		buf |= (color_spc & DP_CONVERSION_RGB_YCBCR_MASK);
> +	else
> +		buf &= ~DP_CONVERSION_RGB_YCBCR_MASK;
> +
> +	ret = drm_dp_dpcd_writeb(aux,
> DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> baad87fe6b0a..e096ee98842b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -432,6 +432,17 @@ struct drm_device;
>  # define DP_DS_HDMI_YCBCR444_TO_422_CONV    (1 << 3)
>  # define DP_DS_HDMI_YCBCR444_TO_420_CONV    (1 << 4)
> 
> +/*
> + * VESA DP-to-HDMI PCON Specification adds caps for colorspace
> + * conversion in DFP cap DPCD 83h. Sec6.1 Table-3.
> + * Based on the available support the source can enable
> + * color conversion by writing into PROTOCOL_COVERTER_CONTROL_2
> + * DPCD 3052h.
> + */
> +# define DP_DS_HDMI_BT601_RGB_YCBCR_CONV    (1 << 5)
> +# define DP_DS_HDMI_BT709_RGB_YCBCR_CONV    (1 << 6)
> +# define DP_DS_HDMI_BT2020_RGB_YCBCR_CONV   (1 << 7)
> +
>  #define DP_MAX_DOWNSTREAM_PORTS		    0x10
> 
>  /* DP Forward error Correction Registers */ @@ -1207,7 +1218,10 @@ struct
> drm_device;
>  # define DP_PCON_ENC_PPS_OVERRIDE_DISABLED      0
>  # define DP_PCON_ENC_PPS_OVERRIDE_EN_PARAMS     1
>  # define DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER     2
> -
> +# define DP_CONVERSION_RGB_YCBCR_MASK	       (7 << 4)
> +# define DP_CONVERSION_BT601_RGB_YCBCR_ENABLE  (1 << 4) # define
> +DP_CONVERSION_BT709_RGB_YCBCR_ENABLE  (1 << 5) # define
> +DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE (1 << 6)
> 
>  /* PCON Downstream HDMI ERROR Status per Lane */
>  #define DP_PCON_HDMI_ERROR_STATUS_LN0          0x3037
> @@ -2167,5 +2181,8 @@ int drm_dp_pcon_dsc_bpp_incr(const u8
> pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE
>  int drm_dp_pcon_pps_default(struct drm_dp_aux *aux);  int
> drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128]);  int
> drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6]);
> +bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8
> dpcd[DP_RECEIVER_CAP_SIZE],
> +					       const u8 port_cap[4], u8 color_spc);
> int
> +drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
> 
>  #endif /* _DRM_DP_HELPER_H_ */
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
