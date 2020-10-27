Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5229A573
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 08:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18FC6E086;
	Tue, 27 Oct 2020 07:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA986E086;
 Tue, 27 Oct 2020 07:24:59 +0000 (UTC)
IronPort-SDR: fbTUo71WEi/JwvWi2Uw219M92XYuB7DjVO6aUukJ16yejQnM1Sg0dB4PYzyY9joN6+/Fw57dZi
 eBhxx7M8QtHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="155817937"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="155817937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 00:24:59 -0700
IronPort-SDR: dZj9xM11wm/oZdGGmnWZbJq7UCxdur635IGjd8xkYYQpDye4m1CBMiJHLpVqtOGysCzbGBzTUl
 Er7PM8N7xUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="334308063"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 27 Oct 2020 00:24:58 -0700
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 00:24:57 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:54:55 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:54:55 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 16/16] drm/i915/hdcp: Enable HDCP 2.2 MST support
Thread-Topic: [PATCH v3 16/16] drm/i915/hdcp: Enable HDCP 2.2 MST support
Thread-Index: AQHWqTkMTxxzBppC40+S1rLDje76SqmrEfHA
Date: Tue, 27 Oct 2020 07:24:55 +0000
Message-ID: <dafd9984c0a14274ba7ec42f50ba94ad@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-17-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-17-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 16/16] drm/i915/hdcp: Enable HDCP 2.2 MST support
> 
> Enable HDCP 2.2 over DP MST.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 46 ++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 9dd08e2636e9..621c1a94c5ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1698,6 +1698,32 @@ static int hdcp2_authenticate_sink(struct
> intel_connector *connector)
>  	return ret;
>  }
> 
> +static int hdcp2_enable_stream_encryption(struct intel_connector
> +*connector) {
> +	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_hdcp *hdcp = &connector->hdcp;
> +	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> +	enum port port = dig_port->base.port;
> +	int ret = 0;
> +
> +	if (!(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder,
> port)) &
> +			    LINK_ENCRYPTION_STATUS)) {
> +		drm_err(&dev_priv->drm, "HDCP 2.2 Link is not encrypted\n");
> +		return -EPERM;
> +	}
> +
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(dig_port, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to enable HDCP 2.2
> stream enc\n");
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int hdcp2_enable_encryption(struct intel_connector *connector)  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -1836,7 +1862,7 @@ static int hdcp2_authenticate_and_encrypt(struct
> intel_connector *connector)
>  			drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
>  	}
> 
> -	if (!ret) {
> +	if (!ret && !dig_port->port_auth) {
>  		/*
>  		 * Ensuring the required 200mSec min time interval between
>  		 * Session Key Exchange and encryption.
> @@ -1851,6 +1877,8 @@ static int hdcp2_authenticate_and_encrypt(struct
> intel_connector *connector)
>  		}
>  	}
> 
> +	ret = hdcp2_enable_stream_encryption(connector);
> +
>  	return ret;
>  }
> 
> @@ -1896,11 +1924,23 @@ static int _intel_hdcp2_disable(struct
> intel_connector *connector)
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct hdcp_port_data *data = &dig_port->port_data;
> +	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
> 
>  	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
>  		    connector->base.name, connector->base.base.id);
> 
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(dig_port, false);
> +		if (ret) {
> +			drm_err(&i915->drm, "Failed to disable HDCP 2.2 stream
> enc\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (dig_port->num_hdcp_streams > 0)
> +		return ret;
> +
>  	ret = hdcp2_disable_encryption(connector);
> 
>  	if (hdcp2_deauthenticate_port(connector) < 0) @@ -1924,6 +1964,7 @@
> static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	int ret = 0;
> 
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&dig_port->hdcp_mutex);
>  	cpu_transcoder = hdcp->cpu_transcoder;
> 
>  	/* hdcp2_check_link is expected only when HDCP2.2 is Enabled */ @@ -
> 2001,6 +2042,7 @@ static int intel_hdcp2_check_link(struct intel_connector
> *connector)
>  	}
> 
>  out:
> +	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
> @@ -2182,7 +2224,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  	if (!shim)
>  		return -EINVAL;
> 
> -	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> +	if (is_hdcp2_supported(dev_priv))
>  		intel_hdcp2_init(connector, dig_port, shim);
> 
>  	ret =
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
