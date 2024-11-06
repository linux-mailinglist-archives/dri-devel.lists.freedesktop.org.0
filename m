Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2829BF0A3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C818410E6FC;
	Wed,  6 Nov 2024 14:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyWiBxmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367AC10E1FB;
 Wed,  6 Nov 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730904437; x=1762440437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C7dwBqLAVEAR/w0GzMaFZR5yOuZSPb0I3R6wkXNKnmY=;
 b=eyWiBxmXbia1KT3jAtDkdAeQ7kUC9mIZXVEIZLdX3YBxL/EfiuUQhuqo
 khNauNWVswRC4xk8lYBz6soOQx7cJOHu+i3omjsFtXFscIM7hqReF6j0h
 X+xx7KtUNOvLRhjaqQn58E+WSwvTUDO26h4rTnjVaQ0rOCUiiPwW5gbeN
 pth8pKz7jzxiTGEPjKwBfol900QA3HRsJnd45dueRpuMdynqu1n7LUacJ
 22JWnC+yBNe+Oof1SNfSBp8hxlzhtRip7KVVJJBA6wjDFw+1ZC9g47T1r
 xJEDYLsY/1B7zvQ6EeHWkBAOBhgoEmiKrknDhQzIXERhjSztD4vJODPTm g==;
X-CSE-ConnectionGUID: 2mZg8SDuTtyMLng4JS2W+g==
X-CSE-MsgGUID: WN67zJ5gSi+Xpo/hjjChTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="18328978"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="18328978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:47:16 -0800
X-CSE-ConnectionGUID: pHEA9BuoT4iNJG4uD+JtTw==
X-CSE-MsgGUID: 51cgJJKVSLyFFMVd2nom2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84672898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Nov 2024 06:47:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2024 16:47:13 +0200
Date: Wed, 6 Nov 2024 16:47:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/plane: Add new plane property IN_FORMATS_ASYNC
Message-ID: <ZyuBcUwDT8j2dh85@intel.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
 <20241105102608.3912133-2-arun.r.murthy@intel.com>
 <Zyt2lLQZca4FzbXo@intel.com>
 <IA0PR11MB73075C7117AC1F0CF0344C29BA532@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB73075C7117AC1F0CF0344C29BA532@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Wed, Nov 06, 2024 at 02:32:28PM +0000, Murthy, Arun R wrote:
> > -----Original Message-----
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Sent: Wednesday, November 6, 2024 7:31 PM
> > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org
> > Subject: Re: [PATCH 1/4] drm/plane: Add new plane property
> > IN_FORMATS_ASYNC
> > 
> > On Tue, Nov 05, 2024 at 03:56:05PM +0530, Arun R Murthy wrote:
> > > There exists a property IN_FORMATS which exposes the plane supported
> > > modifiers/formats to the user. In some platforms when asynchronous
> > > flips are used all of modifiers/formats mentioned in IN_FORMATS are
> > > not supported. This patch adds a new plane property IN_FORMATS_ASYNC
> > > to expose the async flips supported modifiers/formats so that user can
> > > use this information ahead and done flips with unsupported
> > > formats/modifiers. This will save flips failures.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_mode_config.c |  7 +++
> > >  drivers/gpu/drm/drm_plane.c       | 73
> > +++++++++++++++++++++++++++++++
> > >  include/drm/drm_mode_config.h     |  6 +++
> > >  include/drm/drm_plane.h           | 10 +++++
> > >  4 files changed, 96 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c
> > > b/drivers/gpu/drm/drm_mode_config.c
> > > index 37d2e0a4ef4b..cff189a2e751 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -379,6 +379,13 @@ static int
> > drm_mode_create_standard_properties(struct drm_device *dev)
> > >  		return -ENOMEM;
> > >  	dev->mode_config.size_hints_property = prop;
> > >
> > > +	prop = drm_property_create(dev,
> > > +				   DRM_MODE_PROP_IMMUTABLE |
> > DRM_MODE_PROP_BLOB,
> > > +				   "IN_FORMATS_ASYNC", 0);
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +	dev->mode_config.async_modifiers_property = prop;
> > > +
> > >  	return 0;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index a28b22fdd7a4..01b8e6932fda 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -141,6 +141,12 @@
> > >   *     various bugs in this area with inconsistencies between the capability
> > >   *     flag and per-plane properties.
> > >   *
> > > + * IN_FORMATS_ASYNC:
> > > + *     Blob property which contains the set of buffer format and modifier
> > > + *     pairs supported by this plane for asynchronous flips. The blob is a struct
> > > + *     drm_format_modifier_blob. Without this property the plane doesn't
> > > + *     support buffers with modifiers. Userspace cannot change this property.
> > > + *
> > >   * SIZE_HINTS:
> > >   *     Blob property which contains the set of recommended plane size
> > >   *     which can used for simple "cursor like" use cases (eg. no scaling).
> > > @@ -249,6 +255,70 @@ static int create_in_format_blob(struct drm_device
> > *dev, struct drm_plane *plane
> > >  	return 0;
> > >  }
> > >
> > > +static int create_in_format_async_blob(struct drm_device *dev, struct
> > > +drm_plane *plane) {
> > > +	const struct drm_mode_config *config = &dev->mode_config;
> > > +	struct drm_property_blob *blob;
> > > +	struct drm_format_modifier *async_mod;
> > > +	size_t blob_size, async_formats_size, async_modifiers_size;
> > > +	struct drm_format_modifier_blob *blob_data;
> > > +	unsigned int i, j;
> > > +
> > > +	async_formats_size = sizeof(__u32) * plane->async_format_count;
> > > +	if (WARN_ON(!async_formats_size)) {
> > > +		/* 0 formats are never expected */
> > > +		return 0;
> > > +	}
> > > +
> > > +	async_modifiers_size =
> > > +		sizeof(struct drm_format_modifier) * plane-
> > >async_modifier_count;
> > > +
> > > +	blob_size = sizeof(struct drm_format_modifier_blob);
> > > +	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
> > > +	 * should be naturally aligned to 8B.
> > > +	 */
> > > +	BUILD_BUG_ON(sizeof(struct drm_format_modifier_blob) % 8);
> > > +	blob_size += ALIGN(async_formats_size, 8);
> > > +	blob_size += async_modifiers_size;
> > > +
> > > +	blob = drm_property_create_blob(dev, blob_size, NULL);
> > > +	if (IS_ERR(blob))
> > > +		return -1;
> > > +
> > > +	blob_data = blob->data;
> > > +	blob_data->version = FORMAT_BLOB_CURRENT;
> > > +	blob_data->count_formats = plane->async_format_count;
> > > +	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
> > > +	blob_data->count_modifiers = plane->async_modifier_count;
> > > +
> > > +	blob_data->modifiers_offset =
> > > +		ALIGN(blob_data->formats_offset + async_formats_size, 8);
> > > +
> > > +	memcpy(formats_ptr(blob_data), plane->async_format_types,
> > > +async_formats_size);
> > > +
> > > +	async_mod = modifiers_ptr(blob_data);
> > > +	for (i = 0; i < plane->async_modifier_count; i++) {
> > > +		for (j = 0; j < plane->async_format_count; j++) {
> > > +			if (!plane->funcs->format_mod_supported ||
> > > +			    plane->funcs->format_mod_supported(plane,
> > > +							       plane-
> > >async_format_types[j],
> > > +							       plane-
> > >async_modifiers[i])) {
> > > +				async_mod->formats |= 1ULL << j;
> > > +			}
> > > +		}
> > > +
> > > +		async_mod->modifier = plane->async_modifiers[i];
> > > +		async_mod->offset = 0;
> > > +		async_mod->pad = 0;
> > > +		async_mod++;
> > > +	}
> > > +
> > > +	drm_object_attach_property(&plane->base, config-
> > >async_modifiers_property,
> > > +				   blob->base.id);
> > > +
> > > +	return 0;
> > > +}
> > 
> > That is a verbatim copy of the existing code. Please refactor the current code so
> > that it can be reused.
> > 
> Ok will look into it in the next revision.
> 
> > > +
> > >  /**
> > >   * DOC: hotspot properties
> > >   *
> > > @@ -472,6 +542,9 @@ static int __drm_universal_plane_init(struct
> > drm_device *dev,
> > >  	if (format_modifier_count)
> > >  		create_in_format_blob(dev, plane);
> > >
> > > +	if (plane->async_modifier_count)
> > > +		create_in_format_async_blob(dev, plane);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > diff --git a/include/drm/drm_mode_config.h
> > > b/include/drm/drm_mode_config.h index 271765e2e9f2..0c116d6dfd27
> > > 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -936,6 +936,12 @@ struct drm_mode_config {
> > >  	 */
> > >  	struct drm_property *modifiers_property;
> > >
> > > +	/**
> > > +	 * @async_modifiers_property: Plane property to list support
> > modifier/format
> > > +	 * combination for asynchronous flips.
> > > +	 */
> > > +	struct drm_property *async_modifiers_property;
> > > +
> > >  	/**
> > >  	 * @size_hints_property: Plane SIZE_HINTS property.
> > >  	 */
> > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > > dd718c62ac31..d9571265251a 100644
> > > --- a/include/drm/drm_plane.h
> > > +++ b/include/drm/drm_plane.h
> > > @@ -658,11 +658,21 @@ struct drm_plane {
> > >  	 */
> > >  	bool format_default;
> > >
> > > +	/** @format_types: array of formats supported by this plane */
> > > +	uint32_t *async_format_types;
> > > +	/** @format_count: Size of the array pointed at by @format_types. */
> > > +	unsigned int async_format_count;
> > > +
> > >  	/** @modifiers: array of modifiers supported by this plane */
> > >  	uint64_t *modifiers;
> > >  	/** @modifier_count: Size of the array pointed at by @modifier_count.
> > */
> > >  	unsigned int modifier_count;
> > >
> > > +	/** @modifiers: array of modifiers supported by this plane */
> > > +	uint64_t *async_modifiers;
> > > +	/** @modifier_count: Size of the array pointed at by @modifier_count.
> > */
> > > +	unsigned int async_modifier_count;
> > 
> > I'm not sure adding any of this is really useful. I think we could just add a new
> > .format_mod_supported_async() hook instead (which could be implemented in
> > terms of the current thing + something like
> > https://patchwork.freedesktop.org/patch/619047/?series=139807&rev=3
> > 
> > That would also be more flexible since it can allow specific
> > format+modifier combinations to be either accepted or rejected.
> > 
> This would not serve the purpose. The purpose here is to expose the supported list to the user so that user can have this ahead and check for the modifier/format before sending the flip. This would avoid async flip failures due to unsupported modifier/format.

It would work just fine, and wouldn't affect the uapi at all.
The difference is that you don't have to bloat the plane struct
with those mostly unnecessary format/modifier lists.

> 
> This approach has been acknowledged from the userspace which can be located @ https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
> > > +
> > >  	/**
> > >  	 * @crtc:
> > >  	 *
> > > --
> > > 2.25.1
> > 
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
