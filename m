Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A42D8BFE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 08:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E216E0B8;
	Sun, 13 Dec 2020 07:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2ED6E0AF;
 Sun, 13 Dec 2020 07:10:39 +0000 (UTC)
IronPort-SDR: 1/FcgHr37nrlgjzmH2NdMHuT56wRE9E3XyMj1paijumAclKZrvyoTgnH7Un7O9Cqfn3nWB+XUL
 KwpUgU/zzNMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9833"; a="236182519"
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="236182519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:10:37 -0800
IronPort-SDR: rog/kyOgyUU1z9fW0u0fRDU5d0e1efC9zn8z1Pz8O8CBvSddNFvytTdGZpUph351Q/53kaKokV
 +/64jwe/7j9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="379166714"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2020 23:10:36 -0800
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 12 Dec 2020 23:10:35 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 12:40:33 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Sun, 13 Dec 2020 12:40:33 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 07/16] drm/dp_helper: Add helpers to configure PCONs
 RGB-YCbCr Conversion
Thread-Topic: [PATCH v4 07/16] drm/dp_helper: Add helpers to configure PCONs
 RGB-YCbCr Conversion
Thread-Index: AQHWzTfnjYeyk30AfUC/Fs7RQhTAHqn0oHHw
Date: Sun, 13 Dec 2020 07:10:33 +0000
Message-ID: <84fd6863339d4737a67decd2a9787a23@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201208075145.17389-8-ankit.k.nautiyal@intel.com>
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
> Subject: [PATCH v4 07/16] drm/dp_helper: Add helpers to configure PCONs RGB-
> YCbCr Conversion
> 
> DP Specification for DP2.0 to HDMI2.1 Pcon specifies support for conversion of
> colorspace from RGB to YCbCr.
> https://groups.vesa.org/wg/DP/document/previewpdf/15651
> 
> This patch adds the relavant registers and helper functions to get the capability
> and set the color conversion bits for rgb->ycbcr conversion through PCON.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 59 +++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     | 10 +++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c index d0626f57f99c..344662d5c295 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -949,6 +949,35 @@ bool
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
> + *
> + * Returns: whether the downstream facing port can convert RGB->YCbCr
> +*/ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8
> +dpcd[DP_RECEIVER_CAP_SIZE],
> +					       const u8 port_cap[4])
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
> +		return port_cap[3] & DP_DS_HDMI_BT601_RGB_YCBCR_CONV;

I guess there are other conversions also possible, like BT709 and 2020. Update those
as well here.

> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_downstream_rgb_to_ycbcr_conversion);
> +
>  /**
>   * drm_dp_downstream_mode() - return a mode for downstream facing port
>   * @dev: DRM device
> @@ -3140,3 +3169,33 @@ int drm_dp_pcon_pps_override_param(struct
> drm_dp_aux *aux, u8 pps_param[6])
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
> +
> +/*
> + * drm_dp_pcon_convert_rgb_to_ycbcr() - Configure the PCon to convert
> +RGB to Ycbcr
> + * @aux: displayPort AUX channel
> + * @color_spc: Color space conversion type
> + *
> + * Returns 0 on success, else returns negative error code.
> + */
> +int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8
> +color_spc) {
> +	int ret;
> +	u8 buf;
> +
> +	if (color_spc != DP_CONVERSION_BT601_RGB_YCBCR_ENABLE ||
> +	    color_spc != DP_CONVERSION_BT709_RGB_YCBCR_ENABLE ||
> +	    color_spc != DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE)
> +		return -EINVAL;

Yeah this is wrong, fix it.

> +
> +	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2,
> &buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf |= color_spc;
> +	ret = drm_dp_dpcd_writeb(aux,
> DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> 347b4e1a55b4..1b3d54ed7a78 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -431,6 +431,9 @@ struct drm_device;
>  # define DP_DS_HDMI_YCBCR420_PASS_THROUGH   (1 << 2)
>  # define DP_DS_HDMI_YCBCR444_TO_422_CONV    (1 << 3)
>  # define DP_DS_HDMI_YCBCR444_TO_420_CONV    (1 << 4)
> +# define DP_DS_HDMI_BT601_RGB_YCBCR_CONV    (1 << 5)
> +# define DP_DS_HDMI_BT709_RGB_YCBCR_CONV    (1 << 6)
> +# define DP_DS_HDMI_BT2020_RGB_YCBCR_CONV   (1 << 7)

I think it would be good to mention the location in spec (section or table),
will make it easier to understand/review by directly going to relevant sections in spec.

> 
>  #define DP_MAX_DOWNSTREAM_PORTS		    0x10
> 
> @@ -1217,7 +1220,9 @@ struct drm_device;
>  # define DP_PCON_ENC_PPS_OVERRIDE_DISABLED      0
>  # define DP_PCON_ENC_PPS_OVERRIDE_EN_PARAMS     1
>  # define DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER     2
> -
> +# define DP_CONVERSION_BT601_RGB_YCBCR_ENABLE  (1 << 4) # define
> +DP_CONVERSION_BT709_RGB_YCBCR_ENABLE  (1 << 5) # define
> +DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE (1 << 6)
> 
>  /* PCON Downstream HDMI ERROR Status per Lane */
>  #define DP_PCON_HDMI_ERROR_STATUS_LN0          0x3037
> @@ -2178,5 +2183,8 @@ int drm_dp_pcon_dsc_bpp_incr(const u8
> pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE
>  int drm_dp_pcon_pps_default(struct drm_dp_aux *aux);  int
> drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128]);  int
> drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6]);
> +bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8
> dpcd[DP_RECEIVER_CAP_SIZE],
> +					       const u8 port_cap[4]);
> +int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8
> +color_spc);
> 
>  #endif /* _DRM_DP_HELPER_H_ */
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
