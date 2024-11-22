Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035009D64C2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 21:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48510EC81;
	Fri, 22 Nov 2024 20:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKEMCYiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A5210EC7A;
 Fri, 22 Nov 2024 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732305977; x=1763841977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=quf/aHCrDUMN6A1sphmog419aQyVAnorwBIDOPZ2V7c=;
 b=gKEMCYiwWB9xvuokuat9mMn39wvQtZipz+F56wFibFiA5ZFB54QEkvi+
 v9IcF/z6HVcbnQwo+i//5dpsNcyyjUuidUKP8Cw5OOSWyqDj3hwP26sNu
 ThhCvMlNw+BzHXcbNvn8hRGoO9inYVd2qrocDQ8lASoaIcFPzH5BlgLQu
 aLRCNiEzh4KOEhodAfA+IoktLdK0h29IKuAaT/THP/5F2Pur0iEgrTT4Y
 LjUhj3aJz3D2558ADO4MabDef0SCinv0y/YwjV3Bp1L45VkDpFCb7mHB4
 1V+//7vkuUxmkTKi9m2a0I8dKTnH73aiH1it6x4vtbLHYK8Ax7u0nssdj w==;
X-CSE-ConnectionGUID: YBYfJ4HCQs2dK7K4/WF1Ig==
X-CSE-MsgGUID: 4V9LTuV6SluFz+8PPcRIGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="54980401"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="54980401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 12:06:17 -0800
X-CSE-ConnectionGUID: fDMtAL79QQO7jkplfHSoBw==
X-CSE-MsgGUID: 4q4YmiwbT1e/e2oJbnhT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90850571"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Nov 2024 12:06:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2024 22:06:13 +0200
Date: Fri, 22 Nov 2024 22:06:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv2 2/3] drm/plane: Expose function to create
 format/modifier blob
Message-ID: <Z0DkNcS-qLgoArml@intel.com>
References: <20241118075315.466009-1-arun.r.murthy@intel.com>
 <20241118075315.466009-3-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118075315.466009-3-arun.r.murthy@intel.com>
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

On Mon, Nov 18, 2024 at 01:23:14PM +0530, Arun R Murthy wrote:
> Expose drm plane function to create formats/modifiers blob. This
> function can be used to expose list of supported formats/modifiers for
> sync/async flips.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 44 ++++++++++++++++++++++++-------------
>  include/drm/drm_plane.h     |  4 ++++
>  2 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 416818e54ccf..4f35eec2b777 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
>  	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
>  }
>  
> -static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
> +int drm_plane_create_format_blob(struct drm_device *dev,
> +				 struct drm_plane *plane, u64 *modifiers,
> +				 unsigned int modifier_count, u32 *formats,
> +				 unsigned int format_count, bool is_async)
>  {
>  	const struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_property_blob *blob;
> @@ -200,14 +203,14 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  	struct drm_format_modifier_blob *blob_data;
>  	unsigned int i, j;
>  
> -	formats_size = sizeof(__u32) * plane->format_count;
> +	formats_size = sizeof(__u32) * format_count;
>  	if (WARN_ON(!formats_size)) {
>  		/* 0 formats are never expected */
>  		return 0;
>  	}
>  
>  	modifiers_size =
> -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> +		sizeof(struct drm_format_modifier) * modifier_count;
>  
>  	blob_size = sizeof(struct drm_format_modifier_blob);
>  	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
> @@ -223,37 +226,45 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  
>  	blob_data = blob->data;
>  	blob_data->version = FORMAT_BLOB_CURRENT;
> -	blob_data->count_formats = plane->format_count;
> +	blob_data->count_formats = format_count;
>  	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
> -	blob_data->count_modifiers = plane->modifier_count;
> +	blob_data->count_modifiers = modifier_count;
>  
>  	blob_data->modifiers_offset =
>  		ALIGN(blob_data->formats_offset + formats_size, 8);
>  
> -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> +	memcpy(formats_ptr(blob_data), formats, formats_size);
>  
>  	mod = modifiers_ptr(blob_data);
> -	for (i = 0; i < plane->modifier_count; i++) {
> -		for (j = 0; j < plane->format_count; j++) {
> -			if (!plane->funcs->format_mod_supported ||
> +	for (i = 0; i < modifier_count; i++) {
> +		for (j = 0; j < format_count; j++) {
> +			if (is_async ||

I asked for a format_mod_supported_async(). This is not that.

> +			    !plane->funcs->format_mod_supported ||
>  			    plane->funcs->format_mod_supported(plane,
> -							       plane->format_types[j],
> -							       plane->modifiers[i])) {
> +							       formats[j],
> +							       modifiers[i])) {
>  				mod->formats |= 1ULL << j;
>  			}
>  		}
>  
> -		mod->modifier = plane->modifiers[i];
> +		mod->modifier = modifiers[i];
>  		mod->offset = 0;
>  		mod->pad = 0;
>  		mod++;
>  	}
>  
> -	drm_object_attach_property(&plane->base, config->modifiers_property,
> -				   blob->base.id);
> +	if (is_async)
> +		drm_object_attach_property(&plane->base,
> +					   config->async_modifiers_property,
> +					   blob->base.id);
> +	else
> +		drm_object_attach_property(&plane->base,
> +					   config->modifiers_property,
> +					   blob->base.id);
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(drm_plane_create_format_blob);
>  
>  /**
>   * DOC: hotspot properties
> @@ -476,7 +487,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  	}
>  
>  	if (format_modifier_count)
> -		create_in_format_blob(dev, plane);
> +		drm_plane_create_format_blob(dev, plane, plane->modifiers,
> +					     format_modifier_count,
> +					     plane->format_types, format_count,
> +					     false);
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index dd718c62ac31..3c5c2c614af8 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -988,5 +988,9 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  int drm_plane_add_size_hints_property(struct drm_plane *plane,
>  				      const struct drm_plane_size_hint *hints,
>  				      int num_hints);
> +int drm_plane_create_format_blob(struct drm_device *dev,
> +				 struct drm_plane *plane, u64 *modifiers,
> +				 unsigned int modifier_count, u32 *formats,
> +				 unsigned int format_count, bool is_async);
>  
>  #endif
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
