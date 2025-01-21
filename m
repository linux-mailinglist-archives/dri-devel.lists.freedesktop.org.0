Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D555A17EF8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 14:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EDD10E59E;
	Tue, 21 Jan 2025 13:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mc6AGytz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA07310E592;
 Tue, 21 Jan 2025 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737466827; x=1769002827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WBmnldHfdBRkGsbeSgtmkh5O2QPNuQLqpHOfumaajEw=;
 b=mc6AGytzenNjkHYU3XxImrgekwoLrcKxHSsa/a+4809tydnZcEjlaNFW
 9P5fzuFbEExeI8/qQFA1+bjqaugQPM0XBQ7zCj8rA/1hhyH+f3Gd+ebka
 TazCQkbx0NbbBuiCmw/xX3YnAf3V9RWK7IKRBULcvzK20KL+w9aB6Sacx
 4wf2UsTrn7cqtJkZ0oFphWw6uHPT8w2NwZSpYn26daQPwiXJXT4ySrM6g
 8ijyMIpFinNJ3e7G5lqfgAYNMyeeXpkToXXLdkq40xxWADWbu+RkRqYuv
 P9Tar5KOu79OPg60c/mlSCVd5OPH3u8K8716rKiC3uSj0XnI3GVHa5VxN A==;
X-CSE-ConnectionGUID: 5631eRlASj+oc10YF54FGw==
X-CSE-MsgGUID: xtmSZuFyQSCJkbb+DoUS9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37793473"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37793473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:40:26 -0800
X-CSE-ConnectionGUID: 8HPENCmKSWmnhwq0GaJgzw==
X-CSE-MsgGUID: 7bHHzFaMS1OL4alY/u8QuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106922408"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 21 Jan 2025 05:40:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Jan 2025 15:40:23 +0200
Date: Tue, 21 Jan 2025 15:40:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/5] drm/i915/display: Populate list of async
 supported formats/modifiers
Message-ID: <Z4-jxyzDQfE3hzxY@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-4-f4399635eec9@intel.com>
 <Z462TS-6qRPz7eOb@intel.com>
 <IA0PR11MB7307C0119A52004DC634EC00BAE62@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB7307C0119A52004DC634EC00BAE62@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Tue, Jan 21, 2025 at 03:34:20AM +0000, Murthy, Arun R wrote:
> > On Wed, Jan 08, 2025 at 11:09:02AM +0530, Arun R Murthy wrote:
> > > Populate the list of formats/modifiers supported by async flip.
> > > Register a async property and expose the same to user through blob.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 51
> > > ++++++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > index
> > >
> > ff9764cac1e71959e56283f61b5192ea261cec7a..e5e47f2219dae62e76cbde2e
> > fb40
> > > 266b047ab2b2 100644
> > > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > @@ -170,6 +170,44 @@ static const u32 icl_hdr_plane_formats[] = {
> > >  	DRM_FORMAT_XVYU16161616,
> > >  };
> > >
> > > +static u64 tgl_asyn_modifiers[] = {
> > > +	DRM_FORMAT_MOD_LINEAR,
> > > +	I915_FORMAT_MOD_X_TILED,
> > > +	I915_FORMAT_MOD_Y_TILED,
> > > +	I915_FORMAT_MOD_4_TILED,
> > > +	I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > > +	I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> > > +	I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> > > +	I915_FORMAT_MOD_4_TILED_BMG_CCS,
> > > +	I915_FORMAT_MOD_4_TILED_LNL_CCS,
> > > +};
> > > +
> > > +static u64 icl_async_modifiers[] = {
> > > +	I915_FORMAT_MOD_X_TILED,
> > > +	I915_FORMAT_MOD_Y_TILED,
> > > +	I915_FORMAT_MOD_Yf_TILED,
> > > +	I915_FORMAT_MOD_Y_TILED_CCS,
> > > +	I915_FORMAT_MOD_Yf_TILED_CCS,
> > > +};
> > > +
> > > +static u64 skl_async_modifiers[] = {
> > > +	I915_FORMAT_MOD_X_TILED,
> > > +	I915_FORMAT_MOD_Y_TILED,
> > > +	I915_FORMAT_MOD_Yf_TILED,
> > > +};
> > > +
> > > +static u32 intel_async_formats[] = {
> > > +	DRM_FORMAT_RGB565,
> > > +	DRM_FORMAT_XRGB8888,
> > > +	DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_ARGB8888,
> > > +	DRM_FORMAT_ABGR8888,
> > > +	DRM_FORMAT_XRGB2101010,
> > > +	DRM_FORMAT_XBGR2101010,
> > > +	DRM_FORMAT_XRGB16161616F,
> > > +	DRM_FORMAT_XBGR16161616F,
> > > +};
> > 
> > I've just pushed my .can_async_flip() thing. I'm thinking with that all this can
> > just disappear and we can have a completely generic implementation. Eg
> > something like:
> > 
> Thanks, will rebase and push!
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> > intel_plane_format_mod_supported_async()
> > {
> > 	// some generic checks here (eg. reject planar formats)
> > 
> > 	return plane->format_mod_supported() &&
> > 		plane->can_async_flip();
> > }

Actually for this one I think it'd probably make sense to call the 
normal format_mod_supported() before doing any other checks, just 
in case we ever get situations where the parameters come directly
from userspace. It's better to filter out completely bogus values
as early as possible, and the normal format_mod_supported() already
has to be prepared for garbage values.

> > 
> > > +
> > >  int skl_format_to_fourcc(int format, bool rgb_order, bool alpha)  {
> > >  	switch (format) {
> > > @@ -2613,6 +2651,7 @@ skl_universal_plane_create(struct
> > drm_i915_private *dev_priv,
> > >  	unsigned int supported_rotations;
> > >  	unsigned int supported_csc;
> > >  	const u64 *modifiers;
> > > +	u64 *async_modifiers;
> > >  	const u32 *formats;
> > >  	int num_formats;
> > >  	int ret;
> > > @@ -2715,6 +2754,18 @@ skl_universal_plane_create(struct
> > drm_i915_private *dev_priv,
> > >  	if (ret)
> > >  		goto fail;
> > >
> > > +	if (DISPLAY_VER(dev_priv) >= 12)
> > > +		async_modifiers = tgl_asyn_modifiers;
> > > +	else if (DISPLAY_VER(dev_priv) == 11)
> > > +		async_modifiers = icl_async_modifiers;
> > > +	else
> > > +		async_modifiers = skl_async_modifiers;
> > > +
> > > +	drm_plane_create_format_blob(&dev_priv->drm, &plane->base,
> > > +				     async_modifiers, sizeof(async_modifiers),
> > > +				     intel_async_formats,
> > > +				     sizeof(intel_async_formats), true);
> > > +
> > >  	if (DISPLAY_VER(dev_priv) >= 13)
> > >  		supported_rotations = DRM_MODE_ROTATE_0 |
> > DRM_MODE_ROTATE_180;
> > >  	else
> > >
> > > --
> > > 2.25.1
> > 
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
