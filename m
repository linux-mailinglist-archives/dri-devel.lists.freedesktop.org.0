Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631109A0BFD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF99910E719;
	Wed, 16 Oct 2024 13:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcgVm471";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B8110E716;
 Wed, 16 Oct 2024 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729086854; x=1760622854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EUIm2XAzdihz8Oqlsfz4PGZPCk7vw4ZrmNpFdOqNdVM=;
 b=GcgVm471OTvqjZim4TwTCDrWGlk2l47NeixDuPC7Qq7aB8crPwgSJkq4
 9dGlv0eQTYPTCmxG3bgAszykOxuzoNHXmyrCHWSy83rqPhDkIXrbhG+Mw
 PYfZio6Ft4JrarMfUyp3EBMJB2atg34Stm4QCTOVHqhTrLPXYh6Gkle8m
 wyHYn5A6iTKxLRDV4j8ao+X8xZtQiuk2hi2wnV3ugvEiQRSG785wk5mTv
 FmqK/iOmtcAQcwRt8fpEuk0snxLdnBHSfnCc/nBuiTPhwQdMrqmivT8qP
 mu4UoA1LPkHJBhdkuVrAhWbL5pdINqRJ1nZhghvCsQg4lBfbV5hSA2PuT A==;
X-CSE-ConnectionGUID: FJjsTzyjQAGR6NU6urKqnw==
X-CSE-MsgGUID: ZGlSjSE/RK2SjOXWwck9yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32335562"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="32335562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:54:14 -0700
X-CSE-ConnectionGUID: RSIPBGHfTK+PsVGooMGiiw==
X-CSE-MsgGUID: 5mreLMFWTvq6Y7Fg+cG/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78283739"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Oct 2024 06:54:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Oct 2024 16:54:09 +0300
Date: Wed, 16 Oct 2024 16:54:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Message-ID: <Zw_FgeZFATAk-aMf@intel.com>
References: <20241016053626.2850384-1-arun.r.murthy@intel.com>
 <Zw-_6yuy139Zmir3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zw-_6yuy139Zmir3@intel.com>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 16, 2024 at 04:30:19PM +0300, Ville Syrjälä wrote:
> On Wed, Oct 16, 2024 at 11:06:26AM +0530, Arun R Murthy wrote:
> > Create a i915 private plane property for sharing the async supported
> > modifiers to the user.
> > UMD related discussion requesting the same
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
> > 
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +++
> >  .../drm/i915/display/intel_display_types.h    |  4 ++
> >  .../drm/i915/display/skl_universal_plane.c    | 49 ++++++++++++++++++-
> 
> This whole thing belongs in the drm core.

And I don't even see an actual implementation of anything here.
Why did you even post this when it doesn't do anything?

Anyways, thinking about how we might actually implement this,
we can probably leverage
https://patchwork.freedesktop.org/patch/619047/?series=139807&rev=3

> >  3 files changed, 58 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index b7e462075ded..ef41b50cc765 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -117,6 +117,9 @@ intel_plane_duplicate_state(struct drm_plane *plane)
> >  	intel_state->dpt_vma = NULL;
> >  	intel_state->flags = 0;
> >  
> > +	if (intel_state->async_sup_modifiers)
> > +		drm_property_blob_get(intel_state->async_sup_modifiers);
> > +
> >  	/* add reference to fb */
> >  	if (intel_state->hw.fb)
> >  		drm_framebuffer_get(intel_state->hw.fb);
> > @@ -141,6 +144,9 @@ intel_plane_destroy_state(struct drm_plane *plane,
> >  	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
> >  	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
> >  
> > +	if (plane_state->async_sup_modifiers)
> > +		drm_property_blob_put(plane_state->async_sup_modifiers);
> > +
> >  	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
> >  	if (plane_state->hw.fb)
> >  		drm_framebuffer_put(plane_state->hw.fb);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 2bb1fa64da2f..a5a301ca521a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -683,6 +683,8 @@ struct intel_plane_state {
> >  	u64 ccval;
> >  
> >  	const char *no_fbc_reason;
> > +
> > +	struct drm_property_blob *async_sup_modifiers;
> >  };
> >  
> >  struct intel_initial_plane_config {
> > @@ -1435,6 +1437,8 @@ struct intel_plane {
> >  
> >  	struct intel_fbc *fbc;
> >  
> > +	struct drm_property *async_modifiers_property;
> > +
> >  	/*
> >  	 * NOTE: Do not place new plane state fields here (e.g., when adding
> >  	 * new plane properties).  New runtime state should now be placed in
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 9557b08ca2e2..6790bdf00c8f 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -2383,6 +2383,29 @@ static bool icl_plane_format_mod_supported(struct drm_plane *_plane,
> >  	}
> >  }
> >  
> > +static int intel_plane_get_property(struct drm_plane *plane,
> > +				    const struct drm_plane_state *state,
> > +				    struct drm_property *property,
> > +				    uint64_t *val)
> > +{
> > +	struct drm_i915_private *i915 = to_i915(plane->dev);
> > +	const struct intel_plane_state *intel_plane_state =
> > +		to_intel_plane_state(state);
> > +	struct intel_plane *intel_plane = to_intel_plane(plane);
> > +
> > +	if (property == intel_plane->async_modifiers_property) {
> > +		*val = intel_plane_state->async_sup_modifiers ?
> > +			intel_plane_state->async_sup_modifiers->base.id : 0;
> > +	} else {
> > +		drm_err(&i915->drm,
> > +			"Unknown property [PROP:%d:%s]\n",
> > +			property->base.id, property->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
> >  					   u32 format, u64 modifier)
> >  {
> > @@ -2442,6 +2465,7 @@ static const struct drm_plane_funcs skl_plane_funcs = {
> >  	.atomic_duplicate_state = intel_plane_duplicate_state,
> >  	.atomic_destroy_state = intel_plane_destroy_state,
> >  	.format_mod_supported = skl_plane_format_mod_supported,
> > +	.atomic_get_property = intel_plane_get_property,
> >  };
> >  
> >  static const struct drm_plane_funcs icl_plane_funcs = {
> > @@ -2451,6 +2475,7 @@ static const struct drm_plane_funcs icl_plane_funcs = {
> >  	.atomic_duplicate_state = intel_plane_duplicate_state,
> >  	.atomic_destroy_state = intel_plane_destroy_state,
> >  	.format_mod_supported = icl_plane_format_mod_supported,
> > +	.atomic_get_property = intel_plane_get_property,
> >  };
> >  
> >  static const struct drm_plane_funcs tgl_plane_funcs = {
> > @@ -2460,6 +2485,7 @@ static const struct drm_plane_funcs tgl_plane_funcs = {
> >  	.atomic_duplicate_state = intel_plane_duplicate_state,
> >  	.atomic_destroy_state = intel_plane_destroy_state,
> >  	.format_mod_supported = tgl_plane_format_mod_supported,
> > +	.atomic_get_property = intel_plane_get_property,
> >  };
> >  
> >  static void
> > @@ -2549,6 +2575,25 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
> >  	return caps;
> >  }
> >  
> > +static void intel_plane_attach_async_modifiers_property(struct intel_plane *intel_plane)
> > +{
> > +	struct drm_plane *plane = &intel_plane->base;
> > +	struct drm_device *dev = plane->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop = intel_plane->async_modifiers_property;
> > +	if (!prop) {
> > +		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_ATOMIC,
> > +					   "Async Supported Modifiers", 0);
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_plane->async_modifiers_property = prop;
> > +	}
> > +
> > +	drm_object_attach_property(&plane->base, prop, 0);
> > +}
> > +
> >  struct intel_plane *
> >  skl_universal_plane_create(struct drm_i915_private *dev_priv,
> >  			   enum pipe pipe, enum plane_id plane_id)
> > @@ -2694,10 +2739,12 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
> >  	if (DISPLAY_VER(dev_priv) >= 12)
> >  		drm_plane_enable_fb_damage_clips(&plane->base);
> >  
> > -	if (DISPLAY_VER(dev_priv) >= 11)
> > +	if (DISPLAY_VER(dev_priv) >= 11) {
> >  		drm_plane_create_scaling_filter_property(&plane->base,
> >  						BIT(DRM_SCALING_FILTER_DEFAULT) |
> >  						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
> > +		intel_plane_attach_async_modifiers_property(plane);
> > +	}
> >  
> >  	intel_plane_helper_add(plane);
> >  
> > -- 
> > 2.25.1
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
