Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB38D391A
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2184410E1EF;
	Wed, 29 May 2024 14:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5q6BNb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CD010E1EF;
 Wed, 29 May 2024 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716992719; x=1748528719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vQ50rCjgqYFBmHMBm5jv/4wrCT91ByUTipD4LruLnNw=;
 b=i5q6BNb8cS25RDUxykNhxb31Fx+1AIgSKCINPp7kaYUNjDcC96wDyu8V
 kqxFBxcUpwiiFfDtNAuCTHHTJhDm9TVFEy+GUbyo4he+5lgB9snaQDyA1
 qtHbv4phO0qJtbCIbWQFeu8BtRHizm+i3fw+2PVFbhRwLCCOLlD/HCWwc
 cz8isPJ2k3aj2NpmcGENNVyDRuovnDAYXi9XTCQ+i3wq/0VKqXQkOtEaV
 SqHJ93UhVfSk0wZo+NkrYuOXl6C8/dM1ecZJKh1T9nBPGzTq9j1PYlrvg
 46ozRgq3N8Xw5GUPb9ZxMk573sOTKRAHIXPfIZYEjNIz2KSJpXihZXS7W Q==;
X-CSE-ConnectionGUID: n5IkqpFST7yRvWI1mB8Hkw==
X-CSE-MsgGUID: GryQL/hnTEKcHNjCqCj9DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13347775"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13347775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:25:17 -0700
X-CSE-ConnectionGUID: sx06G/L/RF2Lkl3vcOfzIQ==
X-CSE-MsgGUID: xSyvcUOdSPOiZlOcGq+cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35423084"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 29 May 2024 07:25:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 May 2024 17:25:14 +0300
Date: Wed, 29 May 2024 17:25:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/i915: Introduce fb->min_alignment
Message-ID: <Zlc6yuQ111Os-CFh@intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-5-ville.syrjala@linux.intel.com>
 <ZlW/uMCDFles0dyv@ideak-desk.fi.intel.com>
 <ZlYynhN6QJoAkTDm@intel.com>
 <ZlZOmp3618kpi+zz@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlZOmp3618kpi+zz@ideak-desk.fi.intel.com>
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

On Wed, May 29, 2024 at 12:37:30AM +0300, Imre Deak wrote:
> On Tue, May 28, 2024 at 10:38:06PM +0300, Ville Syrjälä wrote:
> > On Tue, May 28, 2024 at 02:27:52PM +0300, Imre Deak wrote:
> > > On Mon, May 13, 2024 at 08:59:37PM +0300, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > Different planes could have different alignment requirements
> > > > even for the same format/modifier. Collect the alignment
> > > > requirements across all planes capable of scanning out the
> > > > fb such that the alignment used when pinning the normal ggtt
> > > > view is satisfactory to all those planes.
> > > > 
> > > > When pinning per-plane views we only have to satisfy the
> > > > alignment requirements of the specific plane.
> > > > 
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  .../drm/i915/display/intel_display_types.h    |  2 ++
> > > >  drivers/gpu/drm/i915/display/intel_fb.c       | 23 ++++++++++++++++
> > > >  drivers/gpu/drm/i915/display/intel_fb_pin.c   | 27 +++++++++++++++++--
> > > >  drivers/gpu/drm/i915/display/intel_fbdev.c    | 18 +------------
> > > >  4 files changed, 51 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > > index 40d6e5f4c350..58bb65832adf 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > > @@ -145,6 +145,8 @@ struct intel_framebuffer {
> > > >  	};
> > > >  
> > > >  	struct i915_address_space *dpt_vm;
> > > > +
> > > > +	unsigned int min_alignment;
> > > >  };
> > > >  
> > > >  enum intel_hotplug_state {
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > > > index 3f3a9cd534f4..c5bae05cbbc3 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/dma-resv.h>
> > > >  
> > > >  #include "i915_drv.h"
> > > > +#include "intel_atomic_plane.h"
> > > >  #include "intel_display.h"
> > > >  #include "intel_display_types.h"
> > > >  #include "intel_dpt.h"
> > > > @@ -1616,6 +1617,26 @@ bool intel_fb_supports_90_270_rotation(const struct intel_framebuffer *fb)
> > > >  	       fb->base.modifier == I915_FORMAT_MOD_Yf_TILED;
> > > >  }
> > > >  
> > > > +static unsigned int intel_fb_min_alignment(const struct drm_framebuffer *fb)
> > > > +{
> > > > +	struct drm_i915_private *i915 = to_i915(fb->dev);
> > > > +	struct intel_plane *plane;
> > > > +	unsigned int min_alignment = 0;
> > > > +
> > > > +	for_each_intel_plane(&i915->drm, plane) {
> > > > +		if (!drm_plane_has_format(&plane->base, fb->format->format, fb->modifier))
> > > > +			continue;
> > > > +
> > > > +		if (intel_plane_needs_physical(plane))
> > > > +			continue;
> > > > +
> > > > +		min_alignment = max(min_alignment,
> > > > +				    plane->min_alignment(plane, fb, 0));
> > > > +	}
> > > > +
> > > > +	return min_alignment;
> > > > +}
> > > > +
> > > >  int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *fb)
> > > >  {
> > > >  	struct drm_i915_gem_object *obj = intel_fb_obj(&fb->base);
> > > > @@ -1698,6 +1719,8 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
> > > >  		return -EINVAL;
> > > >  	}
> > > >  
> > > > +	fb->min_alignment = intel_fb_min_alignment(&fb->base);
> > > > +
> > > >  	return 0;
> > > >  }
> > > >  
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> > > > index 9b0f1ea41b70..1ae02de906f5 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> > > > @@ -230,13 +230,36 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
> > > >  	i915_vma_put(vma);
> > > >  }
> > > >  
> > > > +static bool gtt_view_is_per_plane(const struct intel_plane_state *plane_state)
> > > > +{
> > > > +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
> > > > +
> > > > +	if (plane_state->view.gtt.type == I915_GTT_VIEW_REMAPPED &&
> > > > +	    intel_fb_needs_pot_stride_remap(fb))
> > > > +		return false;
> > > 
> > > The above view is created only once for the FB, I suppose this is how
> > > you differentiate it from views created each time due to a stride
> > > limit (based on intel_plane_needs_remap()).
> > > 
> > > > +
> > > > +	return plane_state->view.gtt.type != I915_GTT_VIEW_NORMAL;
> > > 
> > > So the rotated and remapped views created for a stride limit are
> > > per-plane based on the above. There is also a rotated view created only
> > > once for the FB, is it intentional to regard this kind of view as
> > > per-plane as well?
> > 
> > No. Forgot those exist. I guess I should just remove this per-plane
> > alignment logic for now. Need to think of a proper way to add it back,
> > or just quietly bury the whole idea.
> 
> Another variation is that intel_fb_pin_to_ggtt() etc. tries to bind the
> vma in max -> min alignment order considering all the plane types here
> always, though that's almost the opposite to what you want to solve
> I suppose (avoid to overalign?).
> 
> > > > +}
> > > > +
> > > >  static unsigned int
> > > >  intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
> > > >  {
> > > >  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> > > > -	const struct drm_framebuffer *fb = plane_state->hw.fb;
> > > > +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
> > > >  
> > > > -	return plane->min_alignment(plane, fb, 0);
> > > > +	/*
> > > > +	 * Only use plane specific alignment for binding
> > > > +	 * a per-plane gtt view (remapped or rotated),
> > > > +	 * otherwise make sure the alignment is suitable
> > > > +	 * for all planes.
> > > > +	 */
> > > > +	if (!gtt_view_is_per_plane(plane_state))
> > > > +		return fb->min_alignment;
> > > > +
> > > > +	if (intel_plane_needs_physical(plane))
> > > > +		return 0;
> > > 
> > > I guess the above is ok, though looks like an unrelated change: the
> > > cursor plane min_alignment() for relevant platforms is <= 4k, which will
> > > be rounded up to 4k anyway when binding the vma.
> > 
> > When intel_plane_needs_physical()==true the alignment declared
> > by the plane only applies to the physical/dma address, as that
> > is what the hardware will consume. Doesn't actually matter
> > where it gets bound in the ggtt.
> 
> Ok, it's unclear why the same physical alignment was used then to bind
> the vma as well, but didn't probably matter in practice since the
> alignment was small. The commit log could still mention this change.

I guess if I just drop the per-plane tricks then we should just 
always use fb->min_alignment for the ggtt. Although I think that
is going to be end up being 0 since currently we expose the ARGB
format only for cursor planes on these platforms.

-- 
Ville Syrjälä
Intel
