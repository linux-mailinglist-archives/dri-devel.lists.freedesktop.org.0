Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C163A24984E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 10:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4DD6E1D7;
	Wed, 19 Aug 2020 08:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257676E1D7;
 Wed, 19 Aug 2020 08:34:53 +0000 (UTC)
IronPort-SDR: MoOKDaxTm7RTEYODTlE9TXxlhwOWxTcfl1+VwdMkmbY0OxDjLMDPCeyrqtJbVZSaP+wOlmwxWl
 p5/vCOGaAbcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152486343"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="152486343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 01:34:53 -0700
IronPort-SDR: ojXyNQAOV54rMVE0+cGMHVvdpdBod5qvWye7l07Ii4BR6k93iFS1xC5SMRDtdAVxh2uLHyTd3u
 +b7mp3egCtIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="371175800"
Received: from fmsmsx601-2.cps.intel.com (HELO fmsmsx601.amr.corp.intel.com)
 ([10.18.84.211])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2020 01:34:53 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 01:34:51 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 14:04:49 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Wed, 19 Aug 2020 14:04:49 +0530
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
 David Airlie <airlied@linux.ie>, "Souza, Jose" <jose.souza@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, "Navare, Manasi D" <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "C, Ramalingam" <ramalingam.c@intel.com>
Subject: RE: [Intel-gfx] [PATCH v5 4/5] drm/i915/display: Add Nearest-neighbor
 based integer scaling support
Thread-Topic: [Intel-gfx] [PATCH v5 4/5] drm/i915/display: Add
 Nearest-neighbor based integer scaling support
Thread-Index: AQHWaU+GRJiA1iU9KUS6Flyaa2wIIKk/NCXg
Date: Wed, 19 Aug 2020 08:34:49 +0000
Message-ID: <72ad3e8d1071469ca647c8188d37612f@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200803042953.7626-5-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200803042953.7626-5-pankaj.laxminarayan.bharadiya@intel.com>
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Pankaj
> Bharadiya
> Sent: Monday, August 3, 2020 10:00 AM
> To: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> daniels@collabora.com; Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>; Souza, Jose
> <jose.souza@intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Chris Wilson <chris@chris-wilson.co.uk>;
> Navare, Manasi D <manasi.d.navare@intel.com>; Wambui Karuga
> <wambui.karugax@gmail.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> C, Ramalingam <ramalingam.c@intel.com>
> Subject: [Intel-gfx] [PATCH v5 4/5] drm/i915/display: Add Nearest-neighbor based
> integer scaling support
> 
> Integer scaling (IS) is a nearest-neighbor upscaling technique that simply scales
> up the existing pixels by an integer (i.e., whole number) multiplier.Nearest-
> neighbor (NN) interpolation works by filling in the missing color values in the
> upscaled image with that of the coordinate-mapped nearest source pixel value.
> 
> Both IS and NN preserve the clarity of the original image. Integer scaling is
> particularly useful for pixel art games that rely on sharp, blocky images to deliver
> their distinctive look.
> 
> Introduce functions to configure the scaler filter coefficients to enable nearest-
> neighbor filtering.
> 
> Bspec: 49247
> 
> changes since v3:
> * None
> changes since v2:
> * Move APIs from 5/5 into this patch.
> * Change filter programming related function names to cnl_*, move
>   filter select bits related code into inline function (Ville) changes since v1:
> * Rearrange skl_scaler_setup_nearest_neighbor_filter() to iterate the
>   registers directly instead of the phases and taps (Ville)
> 
> changes since RFC:
> * Refine the skl_scaler_setup_nearest_neighbor_filter() logic (Ville)
> 
> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 99 ++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_display.h |  4 +
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index db2a5a1a9b35..388999404e05 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6233,6 +6233,105 @@ void skl_scaler_disable(const struct intel_crtc_state
> *old_crtc_state)
>  		skl_detach_scaler(crtc, i);
>  }
> 
> +static int cnl_coef_tap(int i)

You can make this inline.

> +{
> +	return i % 7;
> +}
> +
> +static u16 cnl_nearest_filter_coef(int t) {

Same here.

Overall, Changes look good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>  

> +	return t == 3 ? 0x0800 : 0x3000;
> +}
> +
> +/**
> + *  Theory behind setting nearest-neighbor integer scaling:
> + *
> + *  17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + *  The letter represents the filter tap (D is the center tap) and the
> +number
> + *  represents the coefficient set for a phase (0-16).
> + *
> + *         +------------+------------------------+------------------------+
> + *         |Index value | Data value coeffient 1 | Data value coeffient 2 |
> + *         +------------+------------------------+------------------------+
> + *         |   00h      |          B0            |          A0            |
> + *         +------------+------------------------+------------------------+
> + *         |   01h      |          D0            |          C0            |
> + *         +------------+------------------------+------------------------+
> + *         |   02h      |          F0            |          E0            |
> + *         +------------+------------------------+------------------------+
> + *         |   03h      |          A1            |          G0            |
> + *         +------------+------------------------+------------------------+
> + *         |   04h      |          C1            |          B1            |
> + *         +------------+------------------------+------------------------+
> + *         |   ...      |          ...           |          ...           |
> + *         +------------+------------------------+------------------------+
> + *         |   38h      |          B16           |          A16           |
> + *         +------------+------------------------+------------------------+
> + *         |   39h      |          D16           |          C16           |
> + *         +------------+------------------------+------------------------+
> + *         |   3Ah      |          F16           |          C16           |
> + *         +------------+------------------------+------------------------+
> + *         |   3Bh      |        Reserved        |          G16           |
> + *         +------------+------------------------+------------------------+
> + *
> + *  To enable nearest-neighbor scaling:  program scaler coefficents
> +with
> + *  the center tap (Dxx) values set to 1 and all other values set to 0
> +as per
> + *  SCALER_COEFFICIENT_FORMAT
> + *
> + */
> +
> +static void cnl_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
> +					     enum pipe pipe, int id, int set) {
> +	int i;
> +
> +	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set),
> +			  PS_COEE_INDEX_AUTO_INC);
> +
> +	for (i = 0; i < 17 * 7; i += 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t = cnl_coef_tap(i);
> +		tmp = cnl_nearest_filter_coef(t);
> +
> +		t = cnl_coef_tap(i + 1);
> +		tmp |= cnl_nearest_filter_coef(t) << 16;
> +
> +		intel_de_write_fw(dev_priv, CNL_PS_COEF_DATA_SET(pipe, id,
> set),
> +				  tmp);
> +	}
> +
> +	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set), 0);
> +}
> +
> +inline u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter,
> +int set) {
> +	if (filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
> +		return (PS_FILTER_PROGRAMMED |
> +			PS_Y_VERT_FILTER_SELECT(set) |
> +			PS_Y_HORZ_FILTER_SELECT(set) |
> +			PS_UV_VERT_FILTER_SELECT(set) |
> +			PS_UV_HORZ_FILTER_SELECT(set));
> +	}
> +
> +	return PS_FILTER_MEDIUM;
> +}
> +
> +void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe pipe,
> +			     int id, int set, enum drm_scaling_filter filter) {
> +	switch (filter) {
> +	case DRM_SCALING_FILTER_DEFAULT:
> +		break;
> +	case DRM_SCALING_FILTER_NEAREST_NEIGHBOR:
> +		cnl_program_nearest_filter_coefs(dev_priv, pipe, id, set);
> +		break;
> +	default:
> +		MISSING_CASE(filter);
> +	}
> +}
> +
>  static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)  {
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index e890c8fb779b..878bb36d8322 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -28,6 +28,7 @@
>  #include <drm/drm_util.h>
> 
>  enum link_m_n_set;
> +enum drm_scaling_filter;
>  struct dpll;
>  struct drm_connector;
>  struct drm_device;
> @@ -599,6 +600,9 @@ void intel_crtc_arm_fifo_underrun(struct intel_crtc *crtc,
> 
>  u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_center);  void
> skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
> +u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int
> +set); void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
> pipe,
> +			     int id, int set, enum drm_scaling_filter filter);
>  void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state);
>  u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
>  			const struct intel_plane_state *plane_state);
> --
> 2.23.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
