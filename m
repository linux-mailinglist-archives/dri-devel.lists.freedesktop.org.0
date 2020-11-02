Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB462A2593
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 08:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77296E40D;
	Mon,  2 Nov 2020 07:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C956E409;
 Mon,  2 Nov 2020 07:50:03 +0000 (UTC)
IronPort-SDR: Fle/cfTm4HGnfzDZDRA3XFCN2BGTebn/AJVveYIwkIbLbqUvNx1GmSI9ENJiWNmWuD5rwBT4By
 YMP7VvoPjODQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="233018934"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="233018934"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 23:50:03 -0800
IronPort-SDR: zBjH5DaTB0FkPzFodZg4D9FILn0AYFBAEpAb8Gvs54kglDfVJd0w+a1bZhiU/Tp5sbNvQVfsLR
 Oi/83z0V2MeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="305613133"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2020 23:50:02 -0800
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 1 Nov 2020 23:50:02 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 13:19:59 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 2 Nov 2020 13:19:59 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
 callbacks
Thread-Topic: [PATCH v4 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
 callbacks
Thread-Index: AQHWrIInQO1/USXn40SxlmfnwrVtJqm0gHOA
Date: Mon, 2 Nov 2020 07:49:59 +0000
Message-ID: <f8d198b6d1804fab85b0e08808a4b38c@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-16-anshuman.gupta@intel.com>
In-Reply-To: <20201027164208.10026-16-anshuman.gupta@intel.com>
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
> Sent: Tuesday, October 27, 2020 10:12 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH v4 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
> callbacks
> 
> Add support for HDCP 2.2 DP MST shim callback.
> This adds existing DP HDCP shim callback for Link Authentication and Encryption
> and HDCP 2.2 stream encryption callback.
> 
> v2:
> Added a WARN_ON() instead of drm_err. [Uma] Cosmetic chnages. [Uma]

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  4 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 80 +++++++++++++++++--
>  2 files changed, 76 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index dfb5be64e03a..4cbb151ff3cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -374,6 +374,10 @@ struct intel_hdcp_shim {
>  	int (*config_stream_type)(struct intel_digital_port *dig_port,
>  				  bool is_repeater, u8 type);
> 
> +	/* Enable/Disable HDCP 2.2 stream encryption on DP MST Transport Link
> */
> +	int (*stream_2_2_encryption)(struct intel_digital_port *dig_port,
> +				     bool enable);
> +
>  	/* HDCP2.2 Link Integrity Check */
>  	int (*check_2_2_link)(struct intel_digital_port *dig_port,
>  			      struct intel_connector *connector); diff --git
> a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 4be61e7fde4e..35c1543fe0e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -698,18 +698,14 @@ intel_dp_mst_hdcp_stream_encryption(struct
> intel_digital_port *dig_port,
>  	return 0;
>  }
> 
> -static
> -bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
> -				  struct intel_connector *connector)
> +static bool intel_dp_mst_get_qses_status(struct intel_digital_port *dig_port,
> +					 struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> -	struct intel_dp *intel_dp = &dig_port->dp;
>  	struct drm_dp_query_stream_enc_status_ack_reply reply;
> +	struct intel_dp *intel_dp = &dig_port->dp;
>  	int ret;
> 
> -	if (!intel_dp_hdcp_check_link(dig_port, connector))
> -		return false;
> -
>  	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
>  						  connector->port, &reply);
>  	if (ret) {
> @@ -722,6 +718,69 @@ bool intel_dp_mst_hdcp_check_link(struct
> intel_digital_port *dig_port,
>  	return reply.auth_completed && reply.encryption_enabled;  }
> 
> +static
> +bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
> +				  struct intel_connector *connector) {
> +	if (!intel_dp_hdcp_check_link(dig_port, connector))
> +		return false;
> +
> +	return intel_dp_mst_get_qses_status(dig_port, connector); }
> +
> +static int
> +intel_dp_mst_hdcp2_stream_encryption(struct intel_digital_port *dig_port,
> +				     bool enable)
> +{
> +	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	struct hdcp_port_data *data = &dig_port->port_data;
> +	struct intel_dp *dp = &dig_port->dp;
> +	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
> +	enum port port = dig_port->base.port;
> +	/* HDCP2.x register uses stream transcoder */
> +	enum transcoder cpu_transcoder = hdcp->stream_transcoder;
> +	int ret;
> +
> +	drm_WARN_ON(&i915->drm, enable &&
> +		    !!(intel_de_read(i915, HDCP2_AUTH_STREAM(i915,
> cpu_transcoder, port))
> +		    & AUTH_STREAM_TYPE) != data->streams[0].stream_type);
> +
> +	ret = intel_dp_mst_toggle_hdcp_stream_select(dig_port, enable);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for encryption confirmation */
> +	if (intel_de_wait_for_register(i915,
> +				       HDCP2_STREAM_STATUS(i915,
> cpu_transcoder, port),
> +				       STREAM_ENCRYPTION_STATUS,
> +				       enable ? STREAM_ENCRYPTION_STATUS : 0,
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
> +/*
> + * DP v2.0 I.3.3 ignore the stream signature L' in QSES reply msg reply.
> + * I.3.5 MST source device may use a QSES msg to query downstream
> +status
> + * for a particular stream.
> + */
> +static
> +int intel_dp_mst_hdcp2_check_link(struct intel_digital_port *dig_port,
> +				  struct intel_connector *connector) {
> +	int ret;
> +
> +	ret = intel_dp_hdcp2_check_link(dig_port, connector);
> +	if (ret)
> +		return ret;
> +
> +	return intel_dp_mst_get_qses_status(dig_port, connector) ? 0 :
> +-EINVAL; }
> +
>  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
>  	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
>  	.read_bksv = intel_dp_hdcp_read_bksv,
> @@ -735,7 +794,12 @@ static const struct intel_hdcp_shim
> intel_dp_mst_hdcp_shim = {
>  	.stream_encryption = intel_dp_mst_hdcp_stream_encryption,
>  	.check_link = intel_dp_mst_hdcp_check_link,
>  	.hdcp_capable = intel_dp_hdcp_capable,
> -
> +	.write_2_2_msg = intel_dp_hdcp2_write_msg,
> +	.read_2_2_msg = intel_dp_hdcp2_read_msg,
> +	.config_stream_type = intel_dp_hdcp2_config_stream_type,
> +	.stream_2_2_encryption = intel_dp_mst_hdcp2_stream_encryption,
> +	.check_2_2_link = intel_dp_mst_hdcp2_check_link,
> +	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
>  	.protocol = HDCP_PROTOCOL_DP,
>  };
> 
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
