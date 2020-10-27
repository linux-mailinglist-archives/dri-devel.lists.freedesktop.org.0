Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE429A4A9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9889D6EB09;
	Tue, 27 Oct 2020 06:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53366EB08;
 Tue, 27 Oct 2020 06:30:52 +0000 (UTC)
IronPort-SDR: 2AaOGuN8GfWmI8BpaaGvYGfpfWiQFRLUnx2H79p+T7bzXB6Wva4KycxGe8d+ImLwJWXe2mV8/D
 E2PJeJI8IoaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168159504"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="168159504"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 23:30:49 -0700
IronPort-SDR: c2vVEJA+DzWOYY0MgOsWg9KT+DVryxr0FFvNQChj0w/sS0sfaRFC/SjL2VOBXE7V2xiYV2rsK7
 3N7fiJLMHaIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="303781481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 26 Oct 2020 23:30:46 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 23:30:44 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 12:00:42 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 12:00:42 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 08/16] drm/i915/hdcp: Pass dig_port to intel_hdcp_init
Thread-Topic: [PATCH v3 08/16] drm/i915/hdcp: Pass dig_port to intel_hdcp_init
Thread-Index: AQHWqTj/gHz5WpvpY02KWGrm9D1J4amrAsPQ
Date: Tue, 27 Oct 2020 06:30:42 +0000
Message-ID: <0ffe14f719e143088a68093d0de2285b@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-9-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-9-anshuman.gupta@intel.com>
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
> Subject: [PATCH v3 08/16] drm/i915/hdcp: Pass dig_port to intel_hdcp_init
> 
> Pass dig_port as an argument to intel_hdcp_init() and intel_hdcp2_init().
> This will be required for HDCP 2.2 stream encryption.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c |  4 ++--
>  drivers/gpu/drm/i915/display/intel_hdcp.c    | 12 +++++++-----
>  drivers/gpu/drm/i915/display/intel_hdcp.h    |  4 +++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c    |  2 +-
>  4 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 652d4645f255..384e384cb9e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -751,10 +751,10 @@ int intel_dp_init_hdcp(struct intel_digital_port
> *dig_port,
>  		return 0;
> 
>  	if (intel_connector->mst_port)
> -		return intel_hdcp_init(intel_connector, port,
> +		return intel_hdcp_init(intel_connector, dig_port,
>  				       &intel_dp_mst_hdcp_shim);
>  	else if (!intel_dp_is_edp(intel_dp))
> -		return intel_hdcp_init(intel_connector, port,
> +		return intel_hdcp_init(intel_connector, dig_port,
>  				       &intel_dp_hdcp_shim);
> 
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 46c9bd588db1..10770bf0e85e 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1985,12 +1985,13 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum
> transcoder cpu_transcoder)  }
> 
>  static int initialize_hdcp_port_data(struct intel_connector *connector,
> -				     enum port port,
> +				     struct intel_digital_port *dig_port,
>  				     const struct intel_hdcp_shim *shim)  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	struct hdcp_port_data *data = &hdcp->port_data;
> +	enum port port = dig_port->base.port;
> 
>  	if (INTEL_GEN(dev_priv) < 12)
>  		data->fw_ddi = intel_get_mei_fw_ddi_index(port); @@ -2063,14
> +2064,15 @@ void intel_hdcp_component_init(struct drm_i915_private
> *dev_priv)
>  	}
>  }
> 
> -static void intel_hdcp2_init(struct intel_connector *connector, enum port port,
> +static void intel_hdcp2_init(struct intel_connector *connector,
> +			     struct intel_digital_port *dig_port,
>  			     const struct intel_hdcp_shim *shim)  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
> 
> -	ret = initialize_hdcp_port_data(connector, port, shim);
> +	ret = initialize_hdcp_port_data(connector, dig_port, shim);
>  	if (ret) {
>  		drm_dbg_kms(&i915->drm, "Mei hdcp data init failed\n");
>  		return;
> @@ -2080,7 +2082,7 @@ static void intel_hdcp2_init(struct intel_connector
> *connector, enum port port,  }
> 
>  int intel_hdcp_init(struct intel_connector *connector,
> -		    enum port port,
> +		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *shim)  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev); @@ -
> 2091,7 +2093,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  		return -EINVAL;
> 
>  	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> -		intel_hdcp2_init(connector, port, shim);
> +		intel_hdcp2_init(connector, dig_port, shim);
> 
>  	ret =
>  	drm_connector_attach_content_protection_property(&connector->base,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index b912a3a0f5b8..8f53b0c7fe5c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -18,13 +18,15 @@ struct intel_connector;  struct intel_crtc_state;  struct
> intel_encoder;  struct intel_hdcp_shim;
> +struct intel_digital_port;
>  enum port;
>  enum transcoder;
> 
>  void intel_hdcp_atomic_check(struct drm_connector *connector,
>  			     struct drm_connector_state *old_state,
>  			     struct drm_connector_state *new_state); -int
> intel_hdcp_init(struct intel_connector *connector, enum port port,
> +int intel_hdcp_init(struct intel_connector *connector,
> +		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *hdcp_shim);  int
> intel_hdcp_enable(struct intel_connector *connector,
>  		      const struct intel_crtc_state *pipe_config, u8 content_type);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index f58469226694..0788de04711b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3302,7 +3302,7 @@ void intel_hdmi_init_connector(struct
> intel_digital_port *dig_port,
>  	intel_hdmi->attached_connector = intel_connector;
> 
>  	if (is_hdcp_supported(dev_priv, port)) {
> -		int ret = intel_hdcp_init(intel_connector, port,
> +		int ret = intel_hdcp_init(intel_connector, dig_port,
>  					  &intel_hdmi_hdcp_shim);
>  		if (ret)
>  			drm_dbg_kms(&dev_priv->drm,
> --
> 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
