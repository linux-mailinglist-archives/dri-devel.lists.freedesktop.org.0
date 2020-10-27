Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1DD29A48D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0E26EAF0;
	Tue, 27 Oct 2020 06:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2936EAF0;
 Tue, 27 Oct 2020 06:20:17 +0000 (UTC)
IronPort-SDR: OvBlmnGkX7l/mTs8NAhl/TD3GsXtYm1oDHE/XoYzydqQqE2p0MQHLpoIjsB6kFrG5N15rz4jnl
 4TtoZ1OLil4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="252732164"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="252732164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 23:20:17 -0700
IronPort-SDR: 4crDWa5Ip+1v+yzDkNcTDa3BUBtd1/7oZPgJ5YKNSlibUS0KciX9vObQr0S67JpzKFjFZxxyFU
 /RqgigIdWcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="334288625"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 26 Oct 2020 23:20:16 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 23:20:15 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 11:50:13 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 11:50:13 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 06/16] drm/i915/hdcp: HDCP stream encryption support
Thread-Topic: [PATCH v3 06/16] drm/i915/hdcp: HDCP stream encryption support
Thread-Index: AQHWqTj7vgrFxSGmEkqaxCyy4E5erqmq+hVw
Date: Tue, 27 Oct 2020 06:20:13 +0000
Message-ID: <18153aa8f6144bb181927a88edc744fc@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-7-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-7-anshuman.gupta@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li, 
 Juston" <juston.li@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> Sent: Friday, October 23, 2020 5:51 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH v3 06/16] drm/i915/hdcp: HDCP stream encryption support
> 
> Both HDCP_{1.x,2.x} requires to select/deselect Multistream HDCP bit in
> TRANS_DDI_FUNC_CTL in order to enable/disable stream HDCP encryption over
> DP MST Transport Link.
> 
> HDCP 1.4 stream encryption requires to validate the stream encryption status in
> HDCP_STATUS_{TRANSCODER,PORT} register driving that link in order to
> enable/disable the stream encryption.
> 
> Both of above requirement are same for all Gen with respect to B.Spec
> Documentation.
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 10 +--
>  drivers/gpu/drm/i915/display/intel_ddi.h      |  6 +-
>  .../drm/i915/display/intel_display_types.h    |  4 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 80 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++--
>  drivers/gpu/drm/i915/i915_reg.h               |  1 +
>  6 files changed, 90 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bf8730267cfd..fbeffdfd1a0d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -1948,9 +1948,9 @@ void intel_ddi_disable_transcoder_func(const struct
> intel_crtc_state *crtc_state
>  	}
>  }
> 
> -int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
> -				     enum transcoder cpu_transcoder,
> -				     bool enable)
> +int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
> +			       enum transcoder cpu_transcoder,
> +			       bool enable, u32 hdcp_mask)
>  {
>  	struct drm_device *dev = intel_encoder->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev); @@ -1965,9 +1965,9
> @@ int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
> 
>  	tmp = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder));
>  	if (enable)
> -		tmp |= TRANS_DDI_HDCP_SIGNALLING;
> +		tmp |= hdcp_mask;
>  	else
> -		tmp &= ~TRANS_DDI_HDCP_SIGNALLING;
> +		tmp &= ~hdcp_mask;
>  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder), tmp);
>  	intel_display_power_put(dev_priv, intel_encoder->power_domain,
> wakeref);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.h
> b/drivers/gpu/drm/i915/display/intel_ddi.h
> index dcc711cfe4fe..a4dd815c0000 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.h
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.h
> @@ -50,9 +50,9 @@ u32 bxt_signal_levels(struct intel_dp *intel_dp,
>  		      const struct intel_crtc_state *crtc_state);
>  u32 ddi_signal_levels(struct intel_dp *intel_dp,
>  		      const struct intel_crtc_state *crtc_state); -int
> intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
> -				     enum transcoder cpu_transcoder,
> -				     bool enable);
> +int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
> +			       enum transcoder cpu_transcoder,
> +			       bool enable, u32 hdcp_mask);
>  void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder);
> 
>  #endif /* __INTEL_DDI_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c47124a679b6..59b8fc21e3e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -339,6 +339,10 @@ struct intel_hdcp_shim {
>  				 enum transcoder cpu_transcoder,
>  				 bool enable);
> 
> +	/* Enable/Disable stream encryption on DP MST Transport Link */
> +	int (*stream_encryption)(struct intel_digital_port *dig_port,
> +				 bool enable);
> +
>  	/* Ensures the link is still protected */
>  	bool (*check_link)(struct intel_digital_port *dig_port,
>  			   struct intel_connector *connector); diff --git
> a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 03424d20e9f7..652d4645f255 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -16,6 +16,30 @@
>  #include "intel_dp.h"
>  #include "intel_hdcp.h"
> 
> +static unsigned int transcoder_to_stream_enc_status(enum transcoder
> +cpu_transcoder) {
> +	u32 stream_enc_mask;
> +
> +	switch (cpu_transcoder) {
> +	case TRANSCODER_A:
> +		stream_enc_mask = HDCP_STATUS_STREAM_A_ENC;
> +		break;
> +	case TRANSCODER_B:
> +		stream_enc_mask = HDCP_STATUS_STREAM_B_ENC;
> +		break;
> +	case TRANSCODER_C:
> +		stream_enc_mask = HDCP_STATUS_STREAM_C_ENC;
> +		break;
> +	case TRANSCODER_D:
> +		stream_enc_mask = HDCP_STATUS_STREAM_D_ENC;
> +		break;
> +	default:
> +		stream_enc_mask = 0;
> +	}
> +
> +	return stream_enc_mask;
> +}
> +
>  static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
> {
>  	long ret;
> @@ -622,24 +646,57 @@ static const struct intel_hdcp_shim
> intel_dp_hdcp_shim = {  };
> 
>  static int
> -intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
> -				    enum transcoder cpu_transcoder,
> -				    bool enable)
> +intel_dp_mst_toggle_select_hdcp_stream(struct intel_digital_port *dig_port,
> +				       bool enable)

I feel ....toggle_hdcp_stream_select will look better.

>  {
>  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	struct intel_dp *dp = &dig_port->dp;
> +	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
>  	int ret;
> 
> -	if (!enable)
> -		usleep_range(6, 60); /* Bspec says >= 6us */

Should we not keep this delay.

> -	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base,
> -					       cpu_transcoder, enable);
> +	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base,
> +					 hdcp->stream_transcoder, enable,
> +					 TRANS_DDI_HDCP_SELECT);
>  	if (ret)
> -		drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> -			      enable ? "Enable" : "Disable", ret);
> +		drm_err(&i915->drm, "%s Multistream HDCP select failed

This print doesn't sound good, refine it.

> (%d)\n",
> +			enable ? "Enable" : "Disable", ret);
>  	return ret;
>  }
> 
> +static int
> +intel_dp_mst_hdcp_strem_encryption(struct intel_digital_port *dig_port,
> +				   bool enable)
> +{
> +	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	struct intel_dp *dp = &dig_port->dp;
> +	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
> +	enum port port = dig_port->base.port;
> +	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> +	u32 stream_enc_status;
> +	int ret;
> +
> +	ret = intel_dp_mst_toggle_select_hdcp_stream(dig_port, enable);
> +	if (ret)
> +		return ret;
> +
> +	stream_enc_status =  transcoder_to_stream_enc_status(hdcp-
> >stream_transcoder);
> +	if (!stream_enc_status)
> +		return -EINVAL;
> +
> +	/* Wait for encryption confirmation */
> +	if (intel_de_wait_for_register(i915,
> +				       HDCP_STATUS(i915, cpu_transcoder, port),
> +				       stream_enc_status,
> +				       enable ? stream_enc_status : 0,
> +
> HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
> +		drm_err(&i915->drm, "Timed out waiting for stream encryption
> %s\n",
> +			enable ? "enabled" : "disabled");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static
>  bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
>  				  struct intel_connector *connector) @@ -673,7
> +730,8 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
>  	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
>  	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
>  	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> -	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> +	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
> +	.stream_encryption = intel_dp_mst_hdcp_strem_encryption,

Typo in stream.

>  	.check_link = intel_dp_mst_hdcp_check_link,
>  	.hdcp_capable = intel_dp_hdcp_capable,
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index f90838bc74fb..f58469226694 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1495,15 +1495,16 @@ static int kbl_repositioning_enc_en_signal(struct
> intel_connector *connector,
>  		usleep_range(25, 50);
>  	}
> 
> -	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
> -					       false);
> +	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base, cpu_transcoder,
> +					 false, TRANS_DDI_HDCP_SIGNALLING);
>  	if (ret) {
>  		drm_err(&dev_priv->drm,
>  			"Disable HDCP signalling failed (%d)\n", ret);
>  		return ret;
>  	}
> -	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
> -					       true);
> +
> +	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base, cpu_transcoder,
> +					 true, TRANS_DDI_HDCP_SIGNALLING);
>  	if (ret) {
>  		drm_err(&dev_priv->drm,
>  			"Enable HDCP signalling failed (%d)\n", ret); @@ -1526,8
> +1527,9 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port
> *dig_port,
>  	if (!enable)
>  		usleep_range(6, 60); /* Bspec says >= 6us */
> 
> -	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
> -					       enable);
> +	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base,
> +					 cpu_transcoder, enable,
> +					 TRANS_DDI_HDCP_SIGNALLING);
>  	if (ret) {
>  		drm_err(&dev_priv->drm, "%s HDCP signalling failed (%d)\n",
>  			enable ? "Enable" : "Disable", ret); diff --git
> a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h index
> d4952c9875fb..86a9a5145e47 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9970,6 +9970,7 @@ enum skl_power_gate {
>  #define  TRANS_DDI_DP_VC_PAYLOAD_ALLOC	(1 << 8)
>  #define  TRANS_DDI_HDMI_SCRAMBLER_CTS_ENABLE (1 << 7)  #define
> TRANS_DDI_HDMI_SCRAMBLER_RESET_FREQ (1 << 6)
> +#define  TRANS_DDI_HDCP_SELECT		REG_BIT(5)
>  #define  TRANS_DDI_BFI_ENABLE		(1 << 4)
>  #define  TRANS_DDI_HIGH_TMDS_CHAR_RATE	(1 << 4)
>  #define  TRANS_DDI_HDMI_SCRAMBLING	(1 << 0)
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
