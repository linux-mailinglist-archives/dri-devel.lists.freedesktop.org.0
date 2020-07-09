Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7F219E6E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 12:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36BB6EA36;
	Thu,  9 Jul 2020 10:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEE26EA36;
 Thu,  9 Jul 2020 10:56:27 +0000 (UTC)
IronPort-SDR: 64SDDuTuMhUI8YUzEGtO/PPvV9GE17mi/L1Id6f76Ne56grxrM3iS2y8YSMSP3tp/kg/geKUvS
 As4PubjqUOxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="136199613"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="136199613"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 03:56:26 -0700
IronPort-SDR: MpD/Nj0uJFiPkA+qpdMwLrYCO4jOnnVtprA67Dzt/QQNXHgu8Q/UN/oaD8hFLYUjG1795+c4en
 4Cilpvzk9cuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="298031977"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2020 03:56:26 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jul 2020 03:56:25 -0700
Received: from bgsmsx101.gar.corp.intel.com (10.223.4.170) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 9 Jul 2020 03:56:25 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.234]) by
 BGSMSX101.gar.corp.intel.com ([169.254.1.200]) with mapi id 14.03.0439.000;
 Thu, 9 Jul 2020 16:26:21 +0530
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 14/17] drm/i915: Add connector to
 hdcp_shim->check_link()
Thread-Topic: [PATCH v7 14/17] drm/i915: Add connector to
 hdcp_shim->check_link()
Thread-Index: AQHWSXdTQA9cTX7xl0GHio3wWonrh6j/LAEQ
Date: Thu, 9 Jul 2020 10:56:19 +0000
Message-ID: <3E576CE581B70742841A8994F80CE2EE4E5B0F81@BGSMSX104.gar.corp.intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-15-sean@poorly.run>
In-Reply-To: <20200623155907.22961-15-sean@poorly.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, "Li, Juston" <juston.li@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Sean Paul <sean@poorly.run>
> Sent: Tuesday, June 23, 2020 9:29 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Li, Juston <juston.li@intel.com>; C, Ramalingam
> <ramalingam.c@intel.com>; ville.syrjala@linux.intel.com;
> jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; daniel.vetter@ffwll.ch; Sean Paul
> <seanpaul@chromium.org>
> Subject: [PATCH v7 14/17] drm/i915: Add connector to hdcp_shim->check_link()
> 
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently we derive the connector from digital port in check_link(). For MST, this
> isn't sufficient since the digital port passed into the function can have multiple
> connectors downstream. This patch adds connector to the check_link()
> arguments so we have it when we need it.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-13-
> sean@poorly.run #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-14-
> sean@poorly.run #v5
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-
> 14-sean@poorly.run #v6
> 
> Changes in v4:
> -Added to the set
> Changes in v5:
> -None
> Changes in v6:
> -None
> Changes in v7:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 5 ++---
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 811085ef3fba..94211b8fc159 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -318,7 +318,8 @@ struct intel_hdcp_shim {
>  				 bool enable);
> 
>  	/* Ensures the link is still protected */
> -	bool (*check_link)(struct intel_digital_port *intel_dig_port);
> +	bool (*check_link)(struct intel_digital_port *intel_dig_port,
> +			   struct intel_connector *connector);
> 
>  	/* Detects panel's hdcp capability. This is optional for HDMI. */
>  	int (*hdcp_capable)(struct intel_digital_port *intel_dig_port, diff --git
> a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index e26a45f880cb..43446a6cae8d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -223,7 +223,8 @@ int intel_dp_hdcp_toggle_signalling(struct
> intel_digital_port *intel_dig_port,  }
> 
>  static
> -bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
> +bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> +			      struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(intel_dig_port-
> >base.base.dev);
>  	ssize_t ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index d79d4142aea7..6bd0e4616ee1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -953,7 +953,7 @@ static int intel_hdcp_check_link(struct intel_connector
> *connector)
>  		goto out;
>  	}
> 
> -	if (hdcp->shim->check_link(intel_dig_port)) {
> +	if (hdcp->shim->check_link(intel_dig_port, connector)) {
>  		if (hdcp->value !=
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>  			intel_hdcp_update_value(connector,
> 
> 	DRM_MODE_CONTENT_PROTECTION_ENABLED, true); diff --git
> a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index ca71ee3dd1c7..b12f1af0611d 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1546,11 +1546,10 @@ int intel_hdmi_hdcp_toggle_signalling(struct
> intel_digital_port *intel_dig_port,  }
> 
>  static
> -bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port)
> +bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> +				struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(intel_dig_port-
> >base.base.dev);
> -	struct intel_connector *connector =
> -		intel_dig_port->hdmi.attached_connector;
>  	enum port port = intel_dig_port->base.port;
>  	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
>  	int ret;
> --
> Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
