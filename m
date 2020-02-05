Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F8153559
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 17:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E626F8A3;
	Wed,  5 Feb 2020 16:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C99F6F89D;
 Wed,  5 Feb 2020 16:38:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 08:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="378788003"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2020 08:38:28 -0800
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:38:28 -0800
Received: from bgsmsx110.gar.corp.intel.com (10.223.4.212) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 08:38:27 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX110.gar.corp.intel.com ([169.254.11.43]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:08:24 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 07/17] drm: Add logging function for DP
 VSC SDP
Thread-Topic: [Intel-gfx] [PATCH v3 07/17] drm: Add logging function for DP
 VSC SDP
Thread-Index: AQHV2uiXR3iQR04AgUW19jaJznUaHqgMzw9A
Date: Wed, 5 Feb 2020 16:38:24 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD029@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-8-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-8-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWZjMGUwY2MtOWEzYi00ZTM0LTk5YmMtYjViYWJhMmMyNGY5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiN0JvWFIyck9GazN6T1FjcjkyamQ4TmtJOGVOOHZCV2ptV3FvazVlbkFvTjJkeFhpMmMwVHFYcHljbHZcLzVEcSsifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v3 07/17] drm: Add logging function for DP VSC SDP
> 
> When receiving video it is very useful to be able to log DP VSC SDP.
> This greatly simplifies debugging.
> 
> v2: Minor style fix
> v3: Move logging functions to drm core [Jani N]

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 174 ++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     |   3 +
>  2 files changed, 177 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 5a103e9b3c86..5e3aef8c32e0 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1395,3 +1395,177 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8
> dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  	return num_bpc;
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> +
> +static const char *dp_colorspace_get_name(enum dp_colorspace
> +colorspace) {
> +	if (colorspace < 0 || colorspace > DP_COLORSPACE_RESERVED)
> +		return "Invalid";
> +
> +	switch (colorspace) {
> +	case DP_COLORSPACE_RGB:
> +		return "RGB";
> +	case DP_COLORSPACE_YUV444:
> +		return "YUV444";
> +	case DP_COLORSPACE_YUV422:
> +		return "YUV422";
> +	case DP_COLORSPACE_YUV420:
> +		return "YUV420";
> +	case DP_COLORSPACE_Y_ONLY:
> +		return "Y_ONLY";
> +	case DP_COLORSPACE_RAW:
> +		return "RAW";
> +	default:
> +		return "Reserved";
> +	}
> +}
> +
> +static const char *dp_colorimetry_get_name(enum dp_colorspace colorspace,
> +					   enum dp_colorimetry colorimetry) {
> +	if (colorspace < 0 || colorspace > DP_COLORSPACE_RESERVED)
> +		return "Invalid";
> +
> +	switch (colorimetry) {
> +	case DP_COLORIMETRY_DEFAULT:
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "sRGB";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "BT.601";
> +		case DP_COLORSPACE_Y_ONLY:
> +			return "DICOM PS3.14";
> +		case DP_COLORSPACE_RAW:
> +			return "Custom Color Profile";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_RGB_WIDE_FIXED: /* and
> DP_COLORIMETRY_BT709_YCC */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "Wide Fixed";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "BT.709";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_RGB_WIDE_FLOAT: /* and
> DP_COLORIMETRY_XVYCC_601 */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "Wide Float";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "xvYCC 601";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_OPRGB: /* and DP_COLORIMETRY_XVYCC_709 */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "OpRGB";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "xvYCC 709";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_DCI_P3_RGB: /* and DP_COLORIMETRY_SYCC_601
> */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "DCI-P3";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "sYCC 601";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_RGB_CUSTOM: /* and
> DP_COLORIMETRY_OPYCC_601 */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "Custom Profile";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "OpYCC 601";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_BT2020_RGB: /* and
> DP_COLORIMETRY_BT2020_CYCC */
> +		switch (colorspace) {
> +		case DP_COLORSPACE_RGB:
> +			return "BT.2020 RGB";
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "BT.2020 CYCC";
> +		default:
> +			return "Reserved";
> +		}
> +	case DP_COLORIMETRY_BT2020_YCC:
> +		switch (colorspace) {
> +		case DP_COLORSPACE_YUV444:
> +		case DP_COLORSPACE_YUV422:
> +		case DP_COLORSPACE_YUV420:
> +			return "BT.2020 YCC";
> +		default:
> +			return "Reserved";
> +		}
> +	default:
> +		return "Invalid";
> +	}
> +}
> +
> +static const char *dp_dynamic_range_get_name(enum dp_dynamic_range
> +dynamic_range) {
> +	switch (dynamic_range) {
> +	case DP_DYNAMIC_RANGE_VESA:
> +		return "VESA range";
> +	case DP_DYNAMIC_RANGE_CTA:
> +		return "CTA range";
> +	default:
> +		return "Invalid";
> +	}
> +}
> +
> +static const char *dp_content_type_get_name(enum dp_content_type
> +content_type) {
> +	switch (content_type) {
> +	case DP_CONTENT_TYPE_NOT_DEFINED:
> +		return "Not defined";
> +	case DP_CONTENT_TYPE_GRAPHICS:
> +		return "Graphics";
> +	case DP_CONTENT_TYPE_PHOTO:
> +		return "Photo";
> +	case DP_CONTENT_TYPE_VIDEO:
> +		return "Video";
> +	case DP_CONTENT_TYPE_GAME:
> +		return "Game";
> +	default:
> +		return "Reserved";
> +	}
> +}
> +
> +void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> +			const struct drm_dp_vsc_sdp *vsc)
> +{
> +#define DP_SDP_LOG(fmt, ...) dev_printk(level, dev, fmt, ##__VA_ARGS__)
> +	DP_SDP_LOG("DP SDP: %s, revision %u, length %u\n", "VSC",
> +		   vsc->revision, vsc->length);
> +	DP_SDP_LOG("    colorspace: %s\n",
> +		   dp_colorspace_get_name(vsc->colorspace));
> +	DP_SDP_LOG("    colorimetry: %s\n",
> +		   dp_colorimetry_get_name(vsc->colorspace, vsc->colorimetry));
> +	DP_SDP_LOG("    bpc: %u\n", vsc->bpc);
> +	DP_SDP_LOG("    dynamic range: %s\n",
> +		   dp_dynamic_range_get_name(vsc->dynamic_range));
> +	DP_SDP_LOG("    content type: %s\n",
> +		   dp_content_type_get_name(vsc->content_type));
> +#undef DP_SDP_LOG
> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> c098727681fa..00b775df6241 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1266,6 +1266,9 @@ struct drm_dp_vsc_sdp {
>  	enum dp_content_type content_type;
>  };
> 
> +void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> +			const struct drm_dp_vsc_sdp *vsc);
> +
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> 
>  static inline int
> --
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
