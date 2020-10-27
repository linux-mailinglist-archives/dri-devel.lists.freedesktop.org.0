Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579C29A567
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 08:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251C26E1B5;
	Tue, 27 Oct 2020 07:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BE46E1B4;
 Tue, 27 Oct 2020 07:20:48 +0000 (UTC)
IronPort-SDR: L4FvyW/tmPNW45RyrNerv0MZMzcRN7UOjogAoDFNMz8eev+XB/kitm+9iOsrOIaJ4mQvMvd9m4
 cFJRqbwSvnFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="167257329"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="167257329"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 00:20:47 -0700
IronPort-SDR: /UhpDJad84wp8dvoAr9uQkw659R9/gyf8M/imFfh4ejXLe4nRqmga9JJhmNn52npyh6eyv7Ocy
 rzpy/0jjt2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="303668377"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 27 Oct 2020 00:20:47 -0700
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 00:20:46 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:50:44 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:50:44 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
 callbacks
Thread-Topic: [PATCH v3 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
 callbacks
Thread-Index: AQHWqTkLqhbHHHsPfkyao+XoVdcuA6mrD2uA
Date: Tue, 27 Oct 2020 07:20:44 +0000
Message-ID: <d4546c9b7ac94ba4bb93c30638d50bc8@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-16-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-16-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 15/16] drm/i915/hdcp: Support for HDCP 2.2 MST shim
> callbacks
> 
> Add support for HDCP 2.2 DP MST shim callback.
> This adds existing DP HDCP shim callback for Link Authentication and Encryption
> and HDCP 2.2 stream encryption callback.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  4 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 81 +++++++++++++++++--
>  2 files changed, 77 insertions(+), 8 deletions(-)
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
> index a0c62e363c39..d57ece74c300 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -698,18 +698,14 @@ intel_dp_mst_hdcp_strem_encryption(struct
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
> @@ -722,6 +718,70 @@ bool intel_dp_mst_hdcp_check_link(struct
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
> +intel_dp_mst_hdcp2_strem_encryption(struct intel_digital_port *dig_port,
> +				    bool enable)
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
> +	if (enable && !!(intel_de_read(i915, HDCP2_AUTH_STREAM(i915,
> cpu_transcoder, port)) &
> +	    AUTH_STREAM_TYPE) != data->streams[0].stream_type) {
> +		drm_err(&i915->drm, "Seurity f/w didn't set correct auth
> strem_type\n");.

Typo in stream. Also, Lets add a WARN here.

> +	}
> +
> +	ret = intel_dp_mst_toggle_select_hdcp_stream(dig_port, enable);
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
> + * DP v2.0 I.3.3 ignore the stream signature L' is QSES reply msg reply.

s/is/in

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
> @@ -735,7 +795,12 @@ static const struct intel_hdcp_shim
> intel_dp_mst_hdcp_shim = {
>  	.stream_encryption = intel_dp_mst_hdcp_strem_encryption,
>  	.check_link = intel_dp_mst_hdcp_check_link,
>  	.hdcp_capable = intel_dp_hdcp_capable,
> -
> +	.write_2_2_msg = intel_dp_hdcp2_write_msg,
> +	.read_2_2_msg = intel_dp_hdcp2_read_msg,
> +	.config_stream_type = intel_dp_hdcp2_config_stream_type,
> +	.stream_2_2_encryption = intel_dp_mst_hdcp2_strem_encryption,

Typo in stream.

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
