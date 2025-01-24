Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22649A1B4BF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B4310E7F8;
	Fri, 24 Jan 2025 11:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edSYDMOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8503810E3CD;
 Fri, 24 Jan 2025 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737717910; x=1769253910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cu3oFqG8ECuEBdSPXcSaJmFMBwV1fOx6flBvyyfBqgs=;
 b=edSYDMOeHjokpBFHyVF1qpuyfWF0+e1hVJ338q90+F5M5YcjhfPZU7e3
 pljVpmzlkR8NjmFCm5u0rvaMpB8AF5UwgFuK9+C85QaR6z2DAZcF7HhI1
 csCYm32oN9bjphiqBWKI/ZKGmrNqkinDsfoxF2UhYuPTkH2wcFIaw8Sab
 TcFPoy6IZ5+YWyd/Uyky9LpHb9GCnNni8cPktf1HJzPnoZbkIZ0o57KtE
 r71DcuUG2YFJVwRlA/q5szIWd45BIoe+s4R49Mt12ec71Y5LM7JFq7mqA
 V/nLXNeXugpYr8l5civtCagFdGJ4LFnOxqnCbojcEb2Gmt5ODKulepTwh Q==;
X-CSE-ConnectionGUID: hebeVutvQGKaUq/o1BoyWg==
X-CSE-MsgGUID: z2svaUvrQVGWiVkUJj0nDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38391705"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38391705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:25:10 -0800
X-CSE-ConnectionGUID: SbDtusCkRfuB47fGEk7yDQ==
X-CSE-MsgGUID: E5I2DoWrTS6TdGvm0+P+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107870768"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Jan 2025 03:25:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2025 13:25:06 +0200
Date: Fri, 24 Jan 2025 13:25:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Message-ID: <Z5N4ko2GqOhCvdMJ@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com>
 <Z461PqtBPu2z9GPh@intel.com>
 <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
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

On Thu, Jan 23, 2025 at 07:47:14AM +0000, Murthy, Arun R wrote:
> > > On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote:
> > > > Expose drm plane function to create formats/modifiers blob. This
> > > > function can be used to expose list of supported formats/modifiers
> > > > for sync/async flips.
> > > >
> > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_plane.c | 44
> > > > +++++++++++++++++++++++++++++-------
> > > --------
> > > >  include/drm/drm_plane.h     |  4 ++++
> > > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > b/drivers/gpu/drm/drm_plane.c index
> > > >
> > >
> > 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a906
> > > 8
> > > > b31c0563a4c0 100644
> > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob
> > > *blob)
> > > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > > blob->modifiers_offset);  }
> > > >
> > > > -static int create_in_format_blob(struct drm_device *dev, struct
> > > > drm_plane *plane)
> > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > +				 struct drm_plane *plane, u64 *modifiers,
> > > > +				 unsigned int modifier_count, u32 *formats,
> > > > +				 unsigned int format_count, bool is_async)
> > > >  {
> > > >  	const struct drm_mode_config *config = &dev->mode_config;
> > > >  	struct drm_property_blob *blob;
> > > > @@ -200,14 +203,14 @@ static int create_in_format_blob(struct
> > > > drm_device
> > > *dev, struct drm_plane *plane
> > > >  	struct drm_format_modifier_blob *blob_data;
> > > >  	unsigned int i, j;
> > > >
> > > > -	formats_size = sizeof(__u32) * plane->format_count;
> > > > +	formats_size = sizeof(__u32) * format_count;
> > > >  	if (WARN_ON(!formats_size)) {
> > > >  		/* 0 formats are never expected */
> > > >  		return 0;
> > > >  	}
> > > >
> > > >  	modifiers_size =
> > > > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > > >
> > > >  	blob_size = sizeof(struct drm_format_modifier_blob);
> > > >  	/* Modifiers offset is a pointer to a struct with a 64 bit field
> > > > so it @@ -223,37 +226,45 @@ static int create_in_format_blob(struct
> > > > drm_device *dev, struct drm_plane *plane
> > > >
> > > >  	blob_data = blob->data;
> > > >  	blob_data->version = FORMAT_BLOB_CURRENT;
> > > > -	blob_data->count_formats = plane->format_count;
> > > > +	blob_data->count_formats = format_count;
> > > >  	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
> > > > -	blob_data->count_modifiers = plane->modifier_count;
> > > > +	blob_data->count_modifiers = modifier_count;
> > > >
> > > >  	blob_data->modifiers_offset =
> > > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > > >
> > > > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> > > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > > >
> > > >  	mod = modifiers_ptr(blob_data);
> > > > -	for (i = 0; i < plane->modifier_count; i++) {
> > > > -		for (j = 0; j < plane->format_count; j++) {
> > > > -			if (!plane->funcs->format_mod_supported ||
> > > > +	for (i = 0; i < modifier_count; i++) {
> > > > +		for (j = 0; j < format_count; j++) {
> > > > +			if (is_async ||
> > > > +			    !plane->funcs->format_mod_supported ||
> > > >  			    plane->funcs->format_mod_supported(plane,
> > > > -							       plane-
> > > >format_types[j],
> > > > -							       plane-
> > > >modifiers[i])) {
> > > > +							       formats[j],
> > > > +							       modifiers[i])) {
> > > >  				mod->formats |= 1ULL << j;
> > > >  			}
> > > >  		}
> > > >
> > > > -		mod->modifier = plane->modifiers[i];
> > > > +		mod->modifier = modifiers[i];
> > > >  		mod->offset = 0;
> > > >  		mod->pad = 0;
> > > >  		mod++;
> > > >  	}
> > > >
> > > > -	drm_object_attach_property(&plane->base, config-
> > > >modifiers_property,
> > > > -				   blob->base.id);
> > > > +	if (is_async)
> > > > +		drm_object_attach_property(&plane->base,
> > > > +					   config->async_modifiers_property,
> > > > +					   blob->base.id);
> > > > +	else
> > > > +		drm_object_attach_property(&plane->base,
> > > > +					   config->modifiers_property,
> > > > +					   blob->base.id);
> > >
> > > IMO the function should only create the blob. Leave it to the caller to attach
> > it.
> > >
> > Prior to this change for sync formats/modifiers the property attach was also
> > done in the same function. So retained it as it.
> > 
> > > The 'is_async' parameter could also be replaced with with a function
> > > pointer to the appropriate format_mod_supported() function. That makes
> > > the implementation entirely generic.
> > >
> > If the list of formats/modifiers for sync and async is passed to this function, then
> > based on the list the corresponding function pointer can be called.
> > This was done in the earlier patchset.
> > 
> > > >
> > > >  	return 0;
> > > >  }
> > > > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> > > >
> > > >  /**
> > > >   * DOC: hotspot properties
> > > > @@ -476,7 +487,10 @@ static int __drm_universal_plane_init(struct
> > > drm_device *dev,
> > > >  	}
> > > >
> > > >  	if (format_modifier_count)
> > > > -		create_in_format_blob(dev, plane);
> > > > +		drm_plane_create_format_blob(dev, plane, plane->modifiers,
> > > > +					     format_modifier_count,
> > > > +					     plane->format_types,
> > > format_count,
> > > > +					     false);
> > > >
> > > >  	return 0;
> > > >  }
> > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > > >
> > >
> > e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> > > 369
> > > > 894a5657cd45 100644
> > > > --- a/include/drm/drm_plane.h
> > > > +++ b/include/drm/drm_plane.h
> > > > @@ -1008,5 +1008,9 @@ int
> > > > drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> > > > int
> > > drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > >  				      const struct drm_plane_size_hint *hints,
> > > >  				      int num_hints);
> > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > +				 struct drm_plane *plane, u64 *modifiers,
> > > > +				 unsigned int modifier_count, u32 *formats,
> > > > +				 unsigned int format_count, bool is_async);
> > >
> > > I don't think this needs to be exposed to anyone.
> > > __drm_universal_plane_init() should just populate both the normal
> > > blob, and and the async blob (iff
> > > .format_mod_supported_async() is provided).
> > >
> > Ok!
> > 
> For __drm_universal_plane_init() to have both the sync/async format/modifiers list we will have to add new elements to struct drm_plane to hold the async formats/modifiers.

No, you can just use the already existing format/modifier lists.
.format_mod_supported_async() will filter out what's not wanted.

> Then upon adding new elements in struct drm_plane we may not need to pass a function pointer instead of is_async as commented above as well as this new elements added in the struct drm_plane helps out over here.
> 
> New elements to be added to the struct drm_plane 
> Struct drm_plane {
> 	U32 * formats_async;
> 	U32 format_async_count;
> 	U64 *async_modifiers,
> 	U32 async_modifier_count
> }
> 
> Then the functionwith below changes it will be generic and no exporting of the func would be required
>  create_format_blob()
> {
> 	If(plane->format_count)
> 		/* Create blob for sync and call the format_mod_supported()  */
> 
> 	If(plane->format_async_count)
> 		/* Create blob for async and call the format_mod_async_supported()  */
> }
> 
> Is my understanding correct?
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

-- 
Ville Syrjälä
Intel
