Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E869FB0C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 19:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB0410E2D7;
	Wed, 22 Feb 2023 18:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADBA10E2D7;
 Wed, 22 Feb 2023 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677090846; x=1708626846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pSpDIXkOj86kch7YS0hNdWS/klFWUTDfIOJxfhNbC4o=;
 b=c6wF5Zj5BeFrp+5lrmqMjP1b4Xqw6tgZcA/IZvychQHAbNkZOh+GMa1A
 UVTMgZlBBa4vki86H5FbnFpLXBKkAw/bSPAtVCAyEmeYwTYKt7hM0oRYF
 tQ9YClLvy3SXOWAYomVfpF1I3ZMRVM0KqhRYVo385C7RxMlRQIRfL1gCa
 nyLWkKabaz3pMmoonc0OT7OS+NB8xfuC7jGPIPTgFCK5rYoDNlkInnOO5
 wn3n6lsNC1lO1rwTkkkU1DCbArglj8miVQy95a6RCgx/r4+bYgy/Ii785
 5eNSZ7I6nD1VhjOyG9WPJHdLsmd5EGLqHj9jb5cwsIIwN3MQexlCIYmUx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="333010800"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="333010800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 10:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="702481605"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="702481605"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga008.jf.intel.com with SMTP; 22 Feb 2023 10:34:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Feb 2023 20:34:00 +0200
Date: Wed, 22 Feb 2023 20:34:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <Y/ZgGHPU656QE7Uk@intel.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <Y+UAN7V+kA58yMfn@redhat.com> <Y+tTpH1nfHIG/Dxg@intel.com>
 <Y+taU+zDiTO9aA0U@redhat.com> <Y+tiXJglfpzgUEFD@intel.com>
 <Y+tqHZQ/sg3u/VxR@redhat.com> <Y+tuV91XeDoXXp3t@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+tuV91XeDoXXp3t@intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 01:19:51PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 14, 2023 at 12:01:49PM +0100, Jonas Ådahl wrote:
> > On Tue, Feb 14, 2023 at 12:28:44PM +0200, Ville Syrjälä wrote:
> > > On Tue, Feb 14, 2023 at 10:54:27AM +0100, Jonas Ådahl wrote:
> > > > On Tue, Feb 14, 2023 at 11:25:56AM +0200, Ville Syrjälä wrote:
> > > > > On Thu, Feb 09, 2023 at 03:16:23PM +0100, Jonas Ådahl wrote:
> > > > > > On Wed, Feb 08, 2023 at 11:10:16PM +0200, Ville Syrjala wrote:
> > > > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > 
> > > > > > > Add a new immutable plane property by which a plane can advertise
> > > > > > > a handful of recommended plane sizes. This would be mostly exposed
> > > > > > > by cursor planes as a slightly more capable replacement for
> > > > > > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > > > > > a one size fits all limit for the whole device.
> > > > > > > 
> > > > > > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > > > > > size via the cursor size caps. But always using the max sized
> > > > > > > cursor can waste a surprising amount of power, so a better
> > > > > > > stragey is desirable.
> > > > > > > 
> > > > > > > Most other drivers don't specify any cursor size at all, in
> > > > > > > which case the ioctl code just claims that 64x64 is a great
> > > > > > > choice. Whether that is actually true is debatable.
> > > > > > > 
> > > > > > > A poll of various compositor developers informs us that
> > > > > > > blindly probing with setcursor/atomic ioctl to determine
> > > > > > > suitable cursor sizes is not acceptable, thus the
> > > > > > > introduction of the new property to supplant the cursor
> > > > > > > size caps. The compositor will now be free to select a
> > > > > > > more optimal cursor size from the short list of options.
> > > > > > > 
> > > > > > > Note that the reported sizes (either via the property or the
> > > > > > > caps) make no claims about things such as plane scaling. So
> > > > > > > these things should only really be consulted for simple
> > > > > > > "cursor like" use cases.
> > > > > > > 
> > > > > > > v2: Try to add some docs
> > > > > > > 
> > > > > > > Cc: Simon Ser <contact@emersion.fr>
> > > > > > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > > > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > > > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_mode_config.c |  7 +++++
> > > > > > >  drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++++
> > > > > > >  include/drm/drm_mode_config.h     |  5 ++++
> > > > > > >  include/drm/drm_plane.h           |  4 +++
> > > > > > >  include/uapi/drm/drm_mode.h       | 11 +++++++
> > > > > > >  5 files changed, 75 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > > > > index 87eb591fe9b5..21860f94a18c 100644
> > > > > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > > > > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> > > > > > >  		return -ENOMEM;
> > > > > > >  	dev->mode_config.modifiers_property = prop;
> > > > > > >  
> > > > > > > +	prop = drm_property_create(dev,
> > > > > > > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > > > > > > +				   "SIZE_HINTS", 0);
> > > > > > > +	if (!prop)
> > > > > > > +		return -ENOMEM;
> > > > > > > +	dev->mode_config.size_hints_property = prop;
> > > > > > > +
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >  
> > > > > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > > > > > index 24e7998d1731..ae51b1f83755 100644
> > > > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > > > @@ -140,6 +140,21 @@
> > > > > > >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> > > > > > >   *     various bugs in this area with inconsistencies between the capability
> > > > > > >   *     flag and per-plane properties.
> > > > > > > + *
> > > > > > > + * SIZE_HINTS:
> > > > > > > + *     Blob property which contains the set of recommended plane size
> > > > > > > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > > > > > > + *     Using these hints frees userspace from extensive probing of
> > > > > > > + *     supported plane sizes through atomic/setcursor ioctls.
> > > > > > > + *
> > > > > > > + *     For optimal usage userspace should pick the smallest size
> > > > > > > + *     that satisfies its own requirements.
> > > > > > > + *
> > > > > > > + *     The blob contains an array of struct drm_plane_size_hint.
> > > > > > > + *
> > > > > > > + *     Drivers should only attach this property to planes that
> > > > > > > + *     support a very limited set of sizes (eg. cursor planes
> > > > > > > + *     on typical hardware).
> > > > > > 
> > > > > > This is a bit awkward since problematic drivers would only expose
> > > > > > this property if they are new enough.
> > > > > > 
> > > > > > A way to avoid this is for all new drivers expose this property, but
> > > > > > special case the size 0x0 as "everything below the max limit goes". Then
> > > > > > userspace can do (ignoring the missing cap fallback).
> > > > > 
> > > > > I don't think there are any drivers that need that.
> > > > > So I'm thinking we can just ignore that for now.
> > > > 
> > > > None the less, userspace not seeing SIZE_HINTS will be required to
> > > > indefinitely use the existing "old" behavior using the size cap as the
> > > > buffer size with a fallback, and drivers without any size limitations
> > > > that, i.e. details that are hard to express with a set of accepted
> > > > sizes, will still use the inoptimal buffer sizes.
> > > > 
> > > > If I read [1] correctly, AMD has no particular size limitations other
> > > > than a size limit, but without a SIZE_HINTS, userspace still needs to
> > > > use the maximum size.
> > > 
> > > Simon pointed out they have pretty much the same exact limits as i915.
> > > Ie. only a few power of two sizes, and stride must match width.
> > 
> > How about various ARM drivers, where the cursor plane is a regular
> > overlay plane with an artificial 'cursor' stamp on it?
> 
> They don't even bother with the size cap currently. So the
> generic ioctl code currently just decides that 64x64 is good
> enough for them.
> 
> > 
> > Either way, the documentation creates an impossible expectation -
> > drivers, existing of future, that does not "support for a very limited
> > set of sizes" but actually any size below a limit, can't communicate to
> > userspace that it can handle cursor buffers with an arbitrary sizes,
> > without userspace breaking on todays kernels.
> 
> I don't see how anything would break. You just won't get a 100%
> optimal result potentially if you don't declare any smaller
> sizes. And I think we can always specify that magic 0x0 value
> later (or a new cap/etc) should an actual user for it appear.

Or maybe better than the 0x0 magic value inside the blob would
be to just have the property with value 0 (ie. no blob at all)?

-- 
Ville Syrjälä
Intel
