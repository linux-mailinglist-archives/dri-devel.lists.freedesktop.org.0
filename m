Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6C87D22D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C4510F0FE;
	Fri, 15 Mar 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyO4NAjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB92210EB7D;
 Fri, 15 Mar 2024 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710522242; x=1742058242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P6W/w9zKDBQLBgJseM6RmW3C5Jx0KmgMq3kWL9C7OXY=;
 b=RyO4NAjDr36cHO5wByusks8+sjZ5T7NhDOMBzaaqyfpFOpjqaiRSg8A5
 qjTazDX17xGTcu1fENc1YirwWpDvb+5yKrbKog9xmPG1UwodNb+6zjKLt
 9XB9rraq3ZGKRMPsZGRO43kVnGoclFbm+W0TSSMbEhA2ZpaPS9zbVl2IQ
 eHfhdhvw42rkfwSKJUPxZ8Qjk4/phut5zEguvUdlyUGCa6AI/rzOvO5Z3
 xotjanbEowFnBBopNffkSOh58XrFdi8tnGmdNdvVdO33XeukaK5qIg1Q4
 mkyhML7Xyt7J9/8KWWOyK5gx3zsAS10eVMBbgMDM8cnNLWZBMS7XEhpqg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9214323"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9214323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780725"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="827780725"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 10:03:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 19:03:56 +0200
Date: Fri, 15 Mar 2024 19:03:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <ZfR_fIhfAZxDe3c6@intel.com>
References: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
 <20240227193523.5601-2-ville.syrjala@linux.intel.com>
 <O9gQXFus9B2-UW8q8mGIm3IjY7CnWe315W6WrTAhUZTxaSjcaCFCh9xYSXnDL7jXaMHE_p_84F4X9E2S09ZQ-3qbSj-gtZsfSKt7OhMX8VU=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <O9gQXFus9B2-UW8q8mGIm3IjY7CnWe315W6WrTAhUZTxaSjcaCFCh9xYSXnDL7jXaMHE_p_84F4X9E2S09ZQ-3qbSj-gtZsfSKt7OhMX8VU=@emersion.fr>
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

On Wed, Feb 28, 2024 at 10:12:28AM +0000, Simon Ser wrote:
> On Tuesday, February 27th, 2024 at 20:35, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Add a new immutable plane property by which a plane can advertise
> > a handful of recommended plane sizes. This would be mostly exposed
> > by cursor planes as a slightly more capable replacement for
> > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > a one size fits all limit for the whole device.
> > 
> > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > size via the cursor size caps. But always using the max sized
> > cursor can waste a surprising amount of power, so a better
> > stragey is desirable.
> 
> Typo: strategy
> 
> > Most other drivers don't specify any cursor size at all, in
> > which case the ioctl code just claims that 64x64 is a great
> > choice. Whether that is actually true is debatable.
> > 
> > A poll of various compositor developers informs us that
> > blindly probing with setcursor/atomic ioctl to determine
> > suitable cursor sizes is not acceptable, thus the
> > introduction of the new property to supplant the cursor
> > size caps. The compositor will now be free to select a
> > more optimal cursor size from the short list of options.
> > 
> > Note that the reported sizes (either via the property or the
> > caps) make no claims about things such as plane scaling. So
> > these things should only really be consulted for simple
> > "cursor like" use cases.
> > 
> > Userspace consumer in the form of mutter seems ready:
> > https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165
> 
> Do we need an IGT as well to merge this new uAPI?

At least for i915 the current igts already cover a superset of
what the property reports. But I guess we could add another
test that explicitly tests the sizes reported by the hint
as well, if not already covered by other tests.

> 
> > v2: Try to add some docs
> > v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
> >     Drop the note about typical hardware (Pekka)
> > v4: Update the docs to indicate the list is "in order of preference"
> >     Add a a link to the mutter MR
> > 
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c |  7 +++++
> >  drivers/gpu/drm/drm_plane.c       | 52 +++++++++++++++++++++++++++++++
> >  include/drm/drm_mode_config.h     |  5 +++
> >  include/drm/drm_plane.h           |  4 +++
> >  include/uapi/drm/drm_mode.h       | 11 +++++++
> >  5 files changed, 79 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 48fd2d67f352..568972258222 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -372,6 +372,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> >  		return -ENOMEM;
> >  	dev->mode_config.modifiers_property = prop;
> > 
> > +	prop = drm_property_create(dev,
> > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > +				   "SIZE_HINTS", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.size_hints_property = prop;
> > +
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index 672c655c7a8e..4135ce16e608 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -140,6 +140,25 @@
> >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> >   *     various bugs in this area with inconsistencies between the capability
> >   *     flag and per-plane properties.
> > + *
> > + * SIZE_HINTS:
> > + *     Blob property which contains the set of recommended plane size
> > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > + *     Using these hints frees userspace from extensive probing of
> > + *     supported plane sizes through atomic/setcursor ioctls.
> > + *
> > + *     The blob contains an array of struct drm_plane_size_hint, in
> > + *     order of preference. For optimal usage userspace should pick
> > + *     the first size that satisfies its own requirements.
> > + *
> > + *     Drivers should only attach this property to planes that
> > + *     support a very limited set of sizes.
> > + *
> > + *     Note that property value 0 (ie. no blob) is reserved for potential
> > + *     future use. Current userspace is expected to ignore the property
> > + *     if the value is 0, and fall back to some other means (eg.
> > + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> > + *     the appropriate plane size to use.
> >   */
> > 
> >  static unsigned int drm_num_planes(struct drm_device *dev)
> > @@ -1729,3 +1748,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> > +
> > +/**
> > + * drm_plane_add_size_hint_property - create a size hint property
> > + *
> > + * @plane: drm plane
> > + * @hints: size hints
> > + * @num_hints: number of size hints
> > + *
> > + * Create a size hints property for the plane.
> > + *
> > + * RETURNS:
> > + * Zero for success or -errno
> > + */
> > +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> > +				      const struct drm_plane_size_hint *hints,
> > +				      int num_hints)
> > +{
> 
> Can we add a plane type check here, to make sure this is only attached to
> cursor planes? If there is a use-case for other plane types, I'd prefer to
> discuss about it first before expanding the property's scope.

Sure. I don't have a specific usecase for other plane types right now.
But I could imagine some hardware having multiple fixed/limited size
planes. Not sure if there are assumptions in userspace regarding
the number of cursor planes per-crtc, so not sure all such planes
can be declared as cursors.

> 
> With that:
> Reviewed-by: Simon Ser <contact@emersion.fr>
> 
> > +	struct drm_device *dev = plane->dev;
> > +	struct drm_mode_config *config = &dev->mode_config;
> > +	struct drm_property_blob *blob;
> > +
> > +	blob = drm_property_create_blob(dev,
> > +					array_size(sizeof(hints[0]), num_hints),
> > +					hints);
> > +	if (IS_ERR(blob))
> > +		return PTR_ERR(blob);
> > +
> > +	drm_object_attach_property(&plane->base, config->size_hints_property,
> > +				   blob->base.id);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_plane_add_size_hints_property);

-- 
Ville Syrjälä
Intel
