Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B3219E32
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 12:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAD86E1E2;
	Thu,  9 Jul 2020 10:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72416E1E2;
 Thu,  9 Jul 2020 10:49:21 +0000 (UTC)
IronPort-SDR: SzcjPMk8BIvKGcPf/aoeXrOie/+PLwDpmno/myHxxdwOANWTrFRKK2CzmwQj4CCZMDMBU13Qxx
 FeDJMmdqITmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="166068548"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="166068548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 03:49:17 -0700
IronPort-SDR: dnHFoC1fu6GeIY3AreT1e0erckVoGM2gPxAEHtoZ3JG+LIyQzEw/gXMTwT4Z8koac5UkwW1r2R
 yeIspiEm3fIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="324184605"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga007.jf.intel.com with ESMTP; 09 Jul 2020 03:49:16 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 9 Jul 2020 03:49:15 -0700
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 9 Jul 2020 03:49:15 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.234]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.207]) with mapi id 14.03.0439.000;
 Thu, 9 Jul 2020 16:19:11 +0530
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 11/17] drm/i915: Use ddi_update_pipe in intel_dp_mst
Thread-Topic: [PATCH v7 11/17] drm/i915: Use ddi_update_pipe in intel_dp_mst
Thread-Index: AQHWSXdTs2HXjD/pzkm4z548YqIw1aj/KfKw
Date: Thu, 9 Jul 2020 10:49:10 +0000
Message-ID: <3E576CE581B70742841A8994F80CE2EE4E5B0E3A@BGSMSX104.gar.corp.intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-12-sean@poorly.run>
In-Reply-To: <20200623155907.22961-12-sean@poorly.run>
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
> Subject: [PATCH v7 11/17] drm/i915: Use ddi_update_pipe in intel_dp_mst
> 
> From: Sean Paul <seanpaul@chromium.org>
> 
> In order to act upon content_protection property changes, we'll need to
> implement the .update_pipe() hook. We can re-use intel_ddi_update_pipe for
> this
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-
> 10-sean@poorly.run #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-11-
> sean@poorly.run #v2
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-11-
> sean@poorly.run #v3
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-11-
> sean@poorly.run #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-11-
> sean@poorly.run #v5
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-
> 11-sean@poorly.run #v6
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -None
> Changes in v7:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c    | 11 ++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  6 ++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
>  3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 536299f902b9..29f1f552e8d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3907,13 +3907,14 @@ static void intel_ddi_update_pipe_dp(struct
> intel_atomic_state *state,
>  	intel_panel_update_backlight(state, encoder, crtc_state, conn_state);  }
> 
> -static void intel_ddi_update_pipe(struct intel_atomic_state *state,
> -				  struct intel_encoder *encoder,
> -				  const struct intel_crtc_state *crtc_state,
> -				  const struct drm_connector_state
> *conn_state)
> +void intel_ddi_update_pipe(struct intel_atomic_state *state,
> +			   struct intel_encoder *encoder,
> +			   const struct intel_crtc_state *crtc_state,
> +			   const struct drm_connector_state *conn_state)
>  {
> 
> -	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> +	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
> +	    !intel_encoder_is_mst(encoder))
>  		intel_ddi_update_pipe_dp(state, encoder, crtc_state,
>  					 conn_state);
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 0a8950f744f6..6352c7e97e3b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -17,6 +17,7 @@ struct drm_encoder;
>  struct drm_i915_private;
>  struct drm_modeset_acquire_ctx;
>  struct drm_dp_vsc_sdp;
> +struct intel_atomic_state;
>  struct intel_connector;
>  struct intel_crtc_state;
>  struct intel_digital_port;
> @@ -128,4 +129,9 @@ static inline unsigned int intel_dp_unused_lane_mask(int
> lane_count)
> 
>  u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
> 
> +void intel_ddi_update_pipe(struct intel_atomic_state *state,
> +			   struct intel_encoder *encoder,
> +			   const struct intel_crtc_state *crtc_state,
> +			   const struct drm_connector_state *conn_state);
> +
>  #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 9308b5920780..0675825dcc20 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -836,6 +836,7 @@ intel_dp_create_fake_mst_encoder(struct
> intel_digital_port *intel_dig_port, enum
>  	intel_encoder->compute_config_late =
> intel_dp_mst_compute_config_late;
>  	intel_encoder->disable = intel_mst_disable_dp;
>  	intel_encoder->post_disable = intel_mst_post_disable_dp;
> +	intel_encoder->update_pipe = intel_ddi_update_pipe;
>  	intel_encoder->pre_pll_enable = intel_mst_pre_pll_enable_dp;
>  	intel_encoder->pre_enable = intel_mst_pre_enable_dp;
>  	intel_encoder->enable = intel_mst_enable_dp;
> --
> Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
