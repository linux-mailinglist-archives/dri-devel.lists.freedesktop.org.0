Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C82249867
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 10:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7651A89B22;
	Wed, 19 Aug 2020 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C721089B22;
 Wed, 19 Aug 2020 08:45:43 +0000 (UTC)
IronPort-SDR: j1956RPhGu9DAYaODOy5IbTnnmOYegi+v7x2+SNilg0rdEMN1tXJrEQ7DYjE0Zr/wIQxP+dr5+
 5Z1Oel4rlJxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135140240"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="135140240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 01:45:43 -0700
IronPort-SDR: 0gPRntbZoT8AVRUAqd4L9A6T6Lky85lLCQsL3q5PHnJMutHgLX991Tu3YN06j2dgQEF9ByxHWQ
 fTqduX3CQD3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="371178018"
Received: from unknown (HELO fmsmsx604.amr.corp.intel.com) ([10.18.84.214])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2020 01:45:42 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 01:45:40 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 14:15:38 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Wed, 19 Aug 2020 14:15:38 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, 
 "Deak, Imre" <imre.deak@intel.com>, "Lisovskiy, Stanislav"
 <stanislav.lisovskiy@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "Navare, Manasi D" <manasi.d.navare@intel.com>, Wambui Karuga
 <wambui.karugax@gmail.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Pandiyan, Dhinakaran"
 <dhinakaran.pandiyan@intel.com>
Subject: RE: [PATCH v5 5/5] drm/i915: Enable scaling filter for plane and CRTC
Thread-Topic: [PATCH v5 5/5] drm/i915: Enable scaling filter for plane and CRTC
Thread-Index: AQHWaU+PzBm1wLt6CUOLPIoQJ92zVak/Nb1g
Date: Wed, 19 Aug 2020 08:45:38 +0000
Message-ID: <be1b89f53b064318b9478a1bc30c3675@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200803042953.7626-6-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200803042953.7626-6-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Sent: Monday, August 3, 2020 10:00 AM
> To: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> daniels@collabora.com; Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Chris Wilson <chris@chris-wilson.co.uk>;
> Deak, Imre <imre.deak@intel.com>; Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>; Lisovskiy, Stanislav
> <stanislav.lisovskiy@intel.com>; Souza, Jose <jose.souza@intel.com>; Navare,
> Manasi D <manasi.d.navare@intel.com>; Wambui Karuga
> <wambui.karugax@gmail.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Roper,
> Matthew D <matthew.d.roper@intel.com>; Pandiyan, Dhinakaran
> <dhinakaran.pandiyan@intel.com>
> Subject: [PATCH v5 5/5] drm/i915: Enable scaling filter for plane and CRTC
> 
> GEN >= 10 hardware supports the programmable scaler filter.
> 
> Attach scaling filter property for CRTC and plane for GEN >= 10 hardwares and
> program scaler filter based on the selected filter type.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>  

> changes since v3:
> * None
> changes since v2:
> * Use updated functions
> * Add ps_ctrl var to contain the full PS_CTRL register value (Ville)
> * Duplicate the scaling filter in crtc and plane hw state (Ville) changes since v1:
> * None
> Changes since RFC:
> * Enable properties for GEN >= 10 platforms (Ville)
> * Do not round off the crtc co-ordinate (Danial Stone, Ville)
> * Add new functions to handle scaling filter setup (Ville)
> * Remove coefficient set 0 hardcoding.
> 
> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_display.c   | 18 ++++++++++++++++--
>  .../gpu/drm/i915/display/intel_display_types.h |  2 ++
>  drivers/gpu/drm/i915/display/intel_sprite.c    | 15 +++++++++++++--
>  4 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 79032701873a..415d41b21915 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -262,6 +262,7 @@ void intel_plane_copy_uapi_to_hw_state(struct
> intel_plane_state *plane_state,
>  	plane_state->hw.rotation = from_plane_state->uapi.rotation;
>  	plane_state->hw.color_encoding = from_plane_state-
> >uapi.color_encoding;
>  	plane_state->hw.color_range = from_plane_state->uapi.color_range;
> +	plane_state->hw.scaling_filter =
> +from_plane_state->uapi.scaling_filter;
>  }
> 
>  void intel_plane_set_invisible(struct intel_crtc_state *crtc_state, diff --git
> a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 388999404e05..507932099b8d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6352,6 +6352,7 @@ static void skl_pfit_enable(const struct intel_crtc_state
> *crtc_state)
>  	int hscale, vscale;
>  	unsigned long irqflags;
>  	int id;
> +	u32 ps_ctrl;
> 
>  	if (!crtc_state->pch_pfit.enabled)
>  		return;
> @@ -6368,10 +6369,16 @@ static void skl_pfit_enable(const struct
> intel_crtc_state *crtc_state)
> 
>  	id = scaler_state->scaler_id;
> 
> +	ps_ctrl = skl_scaler_get_filter_select(crtc_state->hw.scaling_filter, 0);
> +	ps_ctrl |=  PS_SCALER_EN | scaler_state->scalers[id].mode;
> +
>  	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> 
> -	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), PS_SCALER_EN |
> -			  PS_FILTER_MEDIUM | scaler_state->scalers[id].mode);
> +	skl_scaler_setup_filter(dev_priv, pipe, id, 0,
> +				crtc_state->hw.scaling_filter);
> +
> +	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
> +
>  	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
>  			  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vphase));
>  	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id), @@ -13332,6
> +13339,7 @@ intel_crtc_copy_uapi_to_hw_state(struct intel_crtc_state
> *crtc_state)
>  	crtc_state->hw.active = crtc_state->uapi.active;
>  	crtc_state->hw.mode = crtc_state->uapi.mode;
>  	crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;
> +	crtc_state->hw.scaling_filter = crtc_state->uapi.scaling_filter;
>  	intel_crtc_copy_uapi_to_hw_state_nomodeset(crtc_state);
>  }
> 
> @@ -13343,6 +13351,7 @@ static void intel_crtc_copy_hw_to_uapi_state(struct
> intel_crtc_state *crtc_state
>  		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi,
> &crtc_state->hw.mode) < 0);
> 
>  	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
> +	crtc_state->uapi.scaling_filter = crtc_state->hw.scaling_filter;
> 
>  	/* copy color blobs to uapi */
>  	drm_property_replace_blob(&crtc_state->uapi.degamma_lut,
> @@ -16810,6 +16819,11 @@ static int intel_crtc_init(struct drm_i915_private
> *dev_priv, enum pipe pipe)
>  		dev_priv->plane_to_crtc_mapping[i9xx_plane] = crtc;
>  	}
> 
> +	if (INTEL_GEN(dev_priv) >= 10)
> +		drm_crtc_create_scaling_filter_property(&crtc->base,
> +
> 	BIT(DRM_SCALING_FILTER_DEFAULT) |
> +
> 	BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
> +
>  	intel_color_init(crtc);
> 
>  	intel_crtc_crc_init(crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index f581260e8dbf..670ab317134b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -518,6 +518,7 @@ struct intel_plane_state {
>  		unsigned int rotation;
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
> +		enum drm_scaling_filter scaling_filter;
>  	} hw;
> 
>  	struct i915_ggtt_view view;
> @@ -808,6 +809,7 @@ struct intel_crtc_state {
>  		bool active, enable;
>  		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>  		struct drm_display_mode mode, adjusted_mode;
> +		enum drm_scaling_filter scaling_filter;
>  	} hw;
> 
>  	/**
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c
> b/drivers/gpu/drm/i915/display/intel_sprite.c
> index c26ca029fc0a..8f1a6b6061af 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -429,6 +429,7 @@ skl_program_scaler(struct intel_plane *plane,
>  	u16 y_hphase, uv_rgb_hphase;
>  	u16 y_vphase, uv_rgb_vphase;
>  	int hscale, vscale;
> +	u32 ps_ctrl;
> 
>  	hscale = drm_rect_calc_hscale(&plane_state->uapi.src,
>  				      &plane_state->uapi.dst,
> @@ -455,8 +456,13 @@ skl_program_scaler(struct intel_plane *plane,
>  		uv_rgb_vphase = skl_scaler_calc_phase(1, vscale, false);
>  	}
> 
> -	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id),
> -			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler-
> >mode);
> +	ps_ctrl = skl_scaler_get_filter_select(plane_state->hw.scaling_filter, 0);
> +	ps_ctrl |= PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler->mode;
> +
> +	skl_scaler_setup_filter(dev_priv, pipe, scaler_id, 0,
> +				plane_state->hw.scaling_filter);
> +
> +	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id), ps_ctrl);
>  	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, scaler_id),
>  			  PS_Y_PHASE(y_vphase) |
> PS_UV_RGB_PHASE(uv_rgb_vphase));
>  	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, scaler_id), @@ -
> 3161,6 +3167,11 @@ skl_universal_plane_create(struct drm_i915_private
> *dev_priv,
>  	if (INTEL_GEN(dev_priv) >= 12)
>  		drm_plane_enable_fb_damage_clips(&plane->base);
> 
> +	if (INTEL_GEN(dev_priv) >= 10)
> +		drm_plane_create_scaling_filter_property(&plane->base,
> +
> 	BIT(DRM_SCALING_FILTER_DEFAULT) |
> +
> 	BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
> +
>  	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
> 
>  	return plane;
> --
> 2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
