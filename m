Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696929A450
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 06:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547C46EAD4;
	Tue, 27 Oct 2020 05:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21A56EAD4;
 Tue, 27 Oct 2020 05:49:17 +0000 (UTC)
IronPort-SDR: khisEuQRDeEoj9GbaEFLilvM/rgXYPhKJn1TFhUmkgw61alHpZWPMrPHnXsFyK4ep23blRC5/E
 zr9UFJ233hnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="164530715"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="164530715"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:49:17 -0700
IronPort-SDR: rJESlUjeAor7XhQbLLmbh291e2X6Zas/EvfVzEJMKab6ssYIby7LfRVJvETVO+Bj3fgkJxwSiN
 PYrgZ6App19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="535653791"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 26 Oct 2020 22:49:17 -0700
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 22:49:13 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 11:19:11 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 11:19:11 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 04/16] drm/i915/hdcp: DP MST transcoder for link and
 stream
Thread-Topic: [PATCH v3 04/16] drm/i915/hdcp: DP MST transcoder for link and
 stream
Thread-Index: AQHWqTj46d97wtcHNkyeUXFO3GxwzKmq9uQQ
Date: Tue, 27 Oct 2020 05:49:11 +0000
Message-ID: <2318e05be0e84deaa3ad58e25d9ff021@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-5-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-5-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 04/16] drm/i915/hdcp: DP MST transcoder for link and stream
> 
> Gen12 has H/W delta with respect to HDCP{1.x,2.x} display engine instances lies
> in Transcoder instead of DDI as in Gen11.
> 
> This requires hdcp driver to use mst_master_transcoder for link authentication
> and stream transcoder for stream encryption separately.
> 
> This will be used for both HDCP 1.4 and HDCP 2.2 over DP MST on Gen12.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c          |  2 +-
>  .../gpu/drm/i915/display/intel_display_types.h    |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c       |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c         | 15 +++++++++++----
>  drivers/gpu/drm/i915/display/intel_hdcp.h         |  2 +-
>  5 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 09811be08cfe..bf8730267cfd 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4059,7 +4059,7 @@ static void intel_enable_ddi(struct intel_atomic_state
> *state,
>  	if (conn_state->content_protection ==
>  	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
>  		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> -				  crtc_state->cpu_transcoder,
> +				  crtc_state,
>  				  (u8)conn_state->hdcp_content_type);
>  }
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index f6f0626649e0..c47124a679b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -432,6 +432,8 @@ struct intel_hdcp {
>  	 * Hence caching the transcoder here.
>  	 */
>  	enum transcoder cpu_transcoder;
> +	/* Only used for DP MST stream encryption */
> +	enum transcoder stream_transcoder;
>  };
> 
>  struct intel_connector {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index c8fcec4d0788..16865b200062 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -568,7 +568,7 @@ static void intel_mst_enable_dp(struct
> intel_atomic_state *state,
>  	if (conn_state->content_protection ==
>  	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
>  		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> -				  pipe_config->cpu_transcoder,
> +				  pipe_config,
>  				  (u8)conn_state->hdcp_content_type);
>  }
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 42cf91cf4f20..a9b652c6e742 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2095,7 +2095,7 @@ int intel_hdcp_init(struct intel_connector *connector,
> }
> 
>  int intel_hdcp_enable(struct intel_connector *connector,
> -		      enum transcoder cpu_transcoder, u8 content_type)
> +		      const struct intel_crtc_state *pipe_config, u8 content_type)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -2111,10 +2111,17 @@ int intel_hdcp_enable(struct intel_connector
> *connector,
>  	drm_WARN_ON(&dev_priv->drm,
>  		    hdcp->value ==
> DRM_MODE_CONTENT_PROTECTION_ENABLED);
>  	hdcp->content_type = content_type;
> -	hdcp->cpu_transcoder = cpu_transcoder;
> +
> +	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
> +		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
> +		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
> +	} else {
> +		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
> +		hdcp->stream_transcoder = INVALID_TRANSCODER;
> +	}
> 
>  	if (INTEL_GEN(dev_priv) >= 12)
> -		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(cpu_transcoder);
> +		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(hdcp-
> >cpu_transcoder);
> 
>  	/*
>  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
> @@ -2231,7 +2238,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state
> *state,
> 
>  	if (desired_and_not_enabled || content_protection_type_changed)
>  		intel_hdcp_enable(connector,
> -				  crtc_state->cpu_transcoder,
> +				  crtc_state,
>  				  (u8)conn_state->hdcp_content_type);
>  }
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 1bbf5b67ed0a..bc51c1e9b481 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -25,7 +25,7 @@ void intel_hdcp_atomic_check(struct drm_connector
> *connector,  int intel_hdcp_init(struct intel_connector *connector, enum port
> port,
>  		    const struct intel_hdcp_shim *hdcp_shim);  int
> intel_hdcp_enable(struct intel_connector *connector,
> -		      enum transcoder cpu_transcoder, u8 content_type);
> +		      const struct intel_crtc_state *pipe_config, u8 content_type);
>  int intel_hdcp_disable(struct intel_connector *connector);  void
> intel_hdcp_update_pipe(struct intel_atomic_state *state,
>  			    struct intel_encoder *encoder,
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
