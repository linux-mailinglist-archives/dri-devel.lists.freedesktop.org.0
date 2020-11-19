Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0162B8C8E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 08:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81D26E4F9;
	Thu, 19 Nov 2020 07:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670246E4F4;
 Thu, 19 Nov 2020 07:52:16 +0000 (UTC)
IronPort-SDR: anwZT6uZY5Z4jdtq4i01XVZqmy5YA/XNvi0UPYl17yObg4lQLTP70b2k7atFeU1PQ0oIqyQZKI
 Jtzzb/lcn0dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="168677240"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="168677240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 23:52:15 -0800
IronPort-SDR: BleHxF0+Ktu9/dH9Z0PwZZOg16NEgb3lUTRRa1QwdHFK7tZGc+3YL4uYQTflQRGEqjr5+tM+2Q
 QyBH3Ee9JSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="341603929"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 18 Nov 2020 23:52:15 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Nov 2020 23:52:12 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 13:22:10 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 13:22:10 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 05/13] drm/dp_helper: Add support for link failure
 detection
Thread-Topic: [PATCH v2 05/13] drm/dp_helper: Add support for link failure
 detection
Thread-Index: AQHWsDe1cbe8e2MTsUqDZW2uVhp/HKnPMSWg
Date: Thu, 19 Nov 2020 07:52:10 +0000
Message-ID: <9f940fb62c2f44ab9fb8db2ab008f851@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-6-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-6-ankit.k.nautiyal@intel.com>
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
> Subject: [PATCH v2 05/13] drm/dp_helper: Add support for link failure detection
> 
> From: Swati Sharma <swati2.sharma@intel.com>
> 
> There are specific DPCDs defined for detecting link failures between the PCON
> and HDMI sink and check the link status. In case of link failure, PCON will
> communicate the same using an IRQ_HPD to source.
> HDMI sink would have indicated the same to PCON using SCDC interrupt
> mechanism. While source can always read final HDMI sink's status using I2C over
> AUX, it is easier and faster to read the PCONs already read HDMI sink status
> registers.
> 
> This patch adds the DPCDs required for link failure detection and provide a
> helper function for printing error count/lane which might help in debugging the
> link failure issues.
> 
> v2: Addressed comments from Uma Shankar:
> -rephrased the commit message, as per the code.
> -fixed styling issues
> -added documentation for the helper function.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 39 +++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     | 17 ++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c index b67580294c4e..05782091e7e1 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -2893,3 +2893,42 @@ int drm_dp_pcon_hdmi_link_mode(struct
> drm_dp_aux *aux, u8 *frl_trained_mask)
>  	return mode;
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_hdmi_link_mode);
> +
> +/**
> + * drm_dp_pcon_hdmi_frl_link_error_count() - print the error count per
> +lane
> + * during link failure between PCON and HDMI sink
> + * @aux: DisplayPort AUX channel
> + * @connector: DRM connector
> + * code.
> + **/
> +
> +void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
> +					   struct drm_connector *connector) {
> +	u8 buf, error_count;
> +	int i, num_error;
> +	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
> +
> +	for (i = 0; i < hdmi->max_lanes; i++) {
> +		if (drm_dp_dpcd_readb(aux,
> DP_PCON_HDMI_ERROR_STATUS_LN0 + i, &buf) < 0)
> +			return;
> +
> +		error_count = buf & DP_PCON_HDMI_ERROR_COUNT_MASK;
> +		switch (error_count) {
> +		case DP_PCON_HDMI_ERROR_COUNT_HUNDRED_PLUS:
> +			num_error = 100;
> +			break;
> +		case DP_PCON_HDMI_ERROR_COUNT_TEN_PLUS:
> +			num_error = 10;
> +			break;
> +		case DP_PCON_HDMI_ERROR_COUNT_THREE_PLUS:
> +			num_error = 3;
> +			break;
> +		default:
> +			num_error = 0;
> +		}
> +
> +		DRM_ERROR("More than %d errors since the last read for lane
> %d", num_error, i);
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
> e2ed6bfaae89..bdbe9bbdb244 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -946,6 +946,11 @@ struct drm_device;
>  # define DP_CEC_IRQ                          (1 << 2)
> 
>  #define DP_LINK_SERVICE_IRQ_VECTOR_ESI0     0x2005   /* 1.2 */
> +# define RX_CAP_CHANGED                      (1 << 0)
> +# define LINK_STATUS_CHANGED                 (1 << 1)
> +# define STREAM_STATUS_CHANGED               (1 << 2)
> +# define HDMI_LINK_STATUS_CHANGED            (1 << 3)
> +# define CONNECTED_OFF_ENTRY_REQUESTED       (1 << 4)
> 
>  #define DP_PSR_ERROR_STATUS                 0x2006  /* XXX 1.2? */
>  # define DP_PSR_LINK_CRC_ERROR              (1 << 0)
> @@ -1130,6 +1135,16 @@ struct drm_device;
>  #define DP_PROTOCOL_CONVERTER_CONTROL_2		0x3052 /* DP 1.3
> */
>  # define DP_CONVERSION_TO_YCBCR422_ENABLE	(1 << 0) /* DP 1.3 */
> 
> +/* PCON Downstream HDMI ERROR Status per Lane */
> +#define DP_PCON_HDMI_ERROR_STATUS_LN0          0x3037
> +#define DP_PCON_HDMI_ERROR_STATUS_LN1          0x3038
> +#define DP_PCON_HDMI_ERROR_STATUS_LN2          0x3039
> +#define DP_PCON_HDMI_ERROR_STATUS_LN3          0x303A
> +# define DP_PCON_HDMI_ERROR_COUNT_MASK         (0x7 << 0)
> +# define DP_PCON_HDMI_ERROR_COUNT_THREE_PLUS   (1 << 0)
> +# define DP_PCON_HDMI_ERROR_COUNT_TEN_PLUS     (1 << 1)
> +# define DP_PCON_HDMI_ERROR_COUNT_HUNDRED_PLUS (1 << 2)
> +
>  /* HDCP 1.3 and HDCP 2.2 */
>  #define DP_AUX_HDCP_BKSV		0x68000
>  #define DP_AUX_HDCP_RI_PRIME		0x68005
> @@ -2047,5 +2062,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux);
> 
>  bool drm_dp_pcon_hdmi_link_active(struct drm_dp_aux *aux);  int
> drm_dp_pcon_hdmi_link_mode(struct drm_dp_aux *aux, u8 *frl_trained_mask);
> +void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
> +					  struct drm_connector *connector);
> 
>  #endif /* _DRM_DP_HELPER_H_ */
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
