Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2F2A258B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 08:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2F6E3FC;
	Mon,  2 Nov 2020 07:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047616E3F9;
 Mon,  2 Nov 2020 07:47:49 +0000 (UTC)
IronPort-SDR: 8k+RYMPGChYq+0vUZornZouJn2sLWYWLaWBsh+vkK6G5TlHeEoAP2l+6w5TRc2K8j9PpAvd+yF
 zz1bnsQ3bcNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="165344421"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="165344421"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 23:47:49 -0800
IronPort-SDR: bZmLlJPi6o1h7reX+dJMhjkWpXLARx+299fRw5sVwUqoo41dn4+jiDKeFd1dd4843CLfVjQ77h
 nrbChZglQHlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="527850578"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2020 23:47:49 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 1 Nov 2020 23:47:48 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 13:17:46 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 2 Nov 2020 13:17:46 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 07/16] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
 support
Thread-Topic: [PATCH v4 07/16] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
 support
Thread-Index: AQHWrIIadd2Ii288BUWEDElFR7+Ea6m0f9YQ
Date: Mon, 2 Nov 2020 07:47:46 +0000
Message-ID: <2e9ba4ad3cd943ef909a7e3015b785e9@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-8-anshuman.gupta@intel.com>
In-Reply-To: <20201027164208.10026-8-anshuman.gupta@intel.com>
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
> Subject: [PATCH v4 07/16] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
> support
> 
> Enable HDCP 1.4 over DP MST for Gen12.
> This also enable the stream encryption support for older generations, which was
> missing earlier.
> 
> v2:
> - Added debug print for stream encryption.
> - Disable the hdcp on port after disabling last stream
>   encryption.
> v3:
> - Cosmetic change, removed the value less comment. [Uma]

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++---
>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 43 ++++++++++++++-------
>  2 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 16865b200062..f00e12fc83e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -826,13 +826,9 @@ static struct drm_connector
> *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  	intel_attach_force_audio_property(connector);
>  	intel_attach_broadcast_rgb_property(connector);
> 
> -
> -	/* TODO: Figure out how to make HDCP work on GEN12+ */
> -	if (INTEL_GEN(dev_priv) < 12) {
> -		ret = intel_dp_init_hdcp(dig_port, intel_connector);
> -		if (ret)
> -			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> -	}
> +	ret = intel_dp_init_hdcp(dig_port, intel_connector);
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
> 
>  	/*
>  	 * Reuse the prop from the SST connector because we're diff --git
> a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0322a83c151d..937af4aeaac2 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -612,7 +612,12 @@ int intel_hdcp_auth_downstream(struct intel_connector
> *connector)
>  	return ret;
>  }
> 
> -/* Implements Part 1 of the HDCP authorization procedure */
> +/*
> + * Implements Part 1 of the HDCP authorization procedure.
> + * Authentication Part 1 steps for Multi-stream DisplayPort.
> + * Step 1. Auth Part 1 sequence on the driving MST Trasport Link.
> + * Step 2. Enable encryption for each stream that requires encryption.
> + */
>  static int intel_hdcp_auth(struct intel_connector *connector)  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -766,10 +771,16 @@ static int intel_hdcp_auth(struct intel_connector
> *connector)
>  		return -ETIMEDOUT;
>  	}
> 
> -	/*
> -	 * XXX: If we have MST-connected devices, we need to enable encryption
> -	 * on those as well.
> -	 */
> +	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
> +	if (shim->stream_encryption) {
> +		ret = shim->stream_encryption(dig_port, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to enable HDCP 1.4
> stream enc\n");
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 tras %s stream
> encrypted\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> 
>  	if (repeater_present)
>  		return intel_hdcp_auth_downstream(connector);
> @@ -791,18 +802,22 @@ static int _intel_hdcp_disable(struct intel_connector
> *connector)
>  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
>  		    connector->base.name, connector->base.base.id);
> 
> +	if (hdcp->shim->stream_encryption) {
> +		ret = hdcp->shim->stream_encryption(dig_port, false);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to disable HDCP 1.4
> stream enc\n");
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 trans %s stream
> encryption disabled\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> +
>  	/*
> -	 * If there are other connectors on this port using HDCP, don't disable
> -	 * it. Instead, toggle the HDCP signalling off on that particular
> -	 * connector/pipe and exit.
> +	 * If there are other connectors on this port using HDCP, don't disable it.
> +	 * Repeat steps 1-2 for each stream that no longer requires encryption.
>  	 */
> -	if (dig_port->num_hdcp_streams > 0) {
> -		ret = hdcp->shim->toggle_signalling(dig_port,
> -						    cpu_transcoder, false);
> -		if (ret)
> -			DRM_ERROR("Failed to disable HDCP signalling\n");
> +	if (dig_port->num_hdcp_streams > 0)
>  		return ret;
> -	}
> 
>  	hdcp->hdcp_encrypted = false;
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
