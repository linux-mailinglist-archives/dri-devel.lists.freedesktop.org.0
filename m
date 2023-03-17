Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A36BE6E7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 11:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A59E10EEC8;
	Fri, 17 Mar 2023 10:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E254110EEC8;
 Fri, 17 Mar 2023 10:34:20 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bi9so5859527lfb.12;
 Fri, 17 Mar 2023 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679049259;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dKIcPjerwo9Qxhcf4rruTzBCBqvgWlgWq1SyhjCF46U=;
 b=VbvFgLA5ylxCZVO0FYIh6rQzx9zwNTVYuydIgL5Za4303a+iLVXbdC9Q8U/lRm1IiL
 RYBAs7RpkiWX+Uu4XXExHo4NC3qbsVtrafJvcEN1xYdN+CAh3XlYhK+cwaNvqtNjZiJd
 g45vbh1c1K9jeA6HztbxcibHKFLWzzNGzp+A3gGrV7eIswn78SKGMaXD82A6Y6ZmIBAD
 LcXHHxBbJ3qYpLsL69vZL/+iyOPCYlwXI4vuwrVjcA0YwiEsTxhIBZivcbxpaUNpGUZu
 m/nATpUu42/VH5blaHFD2TjglMTT581J5zUSUonWhu6pcFiYs80gGe4iOVQadb02O9qH
 90OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679049259;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKIcPjerwo9Qxhcf4rruTzBCBqvgWlgWq1SyhjCF46U=;
 b=PAzlmC1g1OkTBRWqLMRVG6iwXXIXOhhaIzE1fH2QRN6zTb4BLAK8b06l3EQ9sob0i2
 SvY72Pf7JfekSDwizEA3q5DCRvEOY7fSmnc6kDR6AbdeS8YURy6n7x2KTZFp3+cwPGuo
 3s4M0o0qngsGTj4SLSOtlQCWlPLeI8BRJskLquF27FUampuGmxgNc9X1Ns5QfrEPDSgB
 Mb5R/5Q+TTnXKdptTVdiYZKBRGjR0ApV8zdbGsK7LGKUQtJD0DZ0FqEUJjJiW46Y4UsO
 EwYw6+lv3lUKr+9vcPXRUZd4UqJrsXOCq/jcdT94WaNy7I+rVK6RuDBLtHalPlnzN/Ar
 Xa/w==
X-Gm-Message-State: AO0yUKWdeXbXNTkh9XWNLeM0NxlmnNOEi8d51MnM/ZOGPij8ZgmdpJYC
 Z11+tOhFA9vVQPj7zV77TAg=
X-Google-Smtp-Source: AK7set+s3bOyPdw6FeEEkGZztjF4eHnQIYMzlFq2JIy+eymHSZfHxt47k/QdPVYXpT9e2JZ6RbwTuA==
X-Received: by 2002:a19:740f:0:b0:4e6:3e36:cb35 with SMTP id
 v15-20020a19740f000000b004e63e36cb35mr3706366lfe.41.1679049258893; 
 Fri, 17 Mar 2023 03:34:18 -0700 (PDT)
Received: from gmail.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac24c97000000b004d61af6771dsm325098lfl.41.2023.03.17.03.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 03:34:18 -0700 (PDT)
Date: Fri, 17 Mar 2023 11:34:16 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <ZBRCKIl+jdkohbVB@gmail.com>
References: <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230313163311.11379-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313163311.11379-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 06:33:11PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add a new immutable plane property by which a plane can advertise
> a handful of recommended plane sizes. This would be mostly exposed
> by cursor planes as a slightly more capable replacement for
> the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> a one size fits all limit for the whole device.
> 
> Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> size via the cursor size caps. But always using the max sized
> cursor can waste a surprising amount of power, so a better
> stragey is desirable.
> 
> Most other drivers don't specify any cursor size at all, in
> which case the ioctl code just claims that 64x64 is a great
> choice. Whether that is actually true is debatable.
> 
> A poll of various compositor developers informs us that
> blindly probing with setcursor/atomic ioctl to determine
> suitable cursor sizes is not acceptable, thus the
> introduction of the new property to supplant the cursor
> size caps. The compositor will now be free to select a
> more optimal cursor size from the short list of options.
> 
> Note that the reported sizes (either via the property or the
> caps) make no claims about things such as plane scaling. So
> these things should only really be consulted for simple
> "cursor like" use cases.
> 
> v2: Try to add some docs
> v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
>     Drop the note about typical hardware (Pekka)
> 
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c |  7 ++++
>  drivers/gpu/drm/drm_plane.c       | 53 +++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  5 +++
>  include/drm/drm_plane.h           |  4 +++
>  include/uapi/drm/drm_mode.h       | 11 +++++++
>  5 files changed, 80 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 87eb591fe9b5..21860f94a18c 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.modifiers_property = prop;
>  
> +	prop = drm_property_create(dev,
> +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +				   "SIZE_HINTS", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.size_hints_property = prop;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..d2a6fdff1a57 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -140,6 +140,26 @@
>   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
>   *     various bugs in this area with inconsistencies between the capability
>   *     flag and per-plane properties.
> + *
> + * SIZE_HINTS:
> + *     Blob property which contains the set of recommended plane size
> + *     which can used for simple "cursor like" use cases (eg. no scaling).
> + *     Using these hints frees userspace from extensive probing of
> + *     supported plane sizes through atomic/setcursor ioctls.
> + *
> + *     For optimal usage userspace should pick the smallest size
> + *     that satisfies its own requirements.
> + *
> + *     The blob contains an array of struct drm_plane_size_hint.
> + *
> + *     Drivers should only attach this property to planes that
> + *     support a very limited set of sizes.
> + *
> + *     Note that property value 0 (ie. no blob) is reserved for potential
> + *     future use. Current userspace is expected to ignore the property
> + *     if the value is 0, and fall back to some other means (eg.
> + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> + *     the appropriate plane size to use.

Does this intend to mean userspace has the kernel's blessing on choosing
an arbitrary size as long as it's smaller than &DRM_CAP_CURSOR_WIDTH x
&DRM_CAP_CURSOR_HEIGHT?

It's a bit to vague for me to make a confident interpretation whether I
can, or whether I should pretend I didn't see SIZE_HINTS and apply the
old logic, meaning only using the exact cap size.


Jonas

>   */
>  
>  static unsigned int drm_num_planes(struct drm_device *dev)
> @@ -1582,3 +1602,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +/**
> + * drm_plane_add_size_hint_property - create a size hint property
> + *
> + * @plane: drm plane
> + * @hints: size hints
> + * @num_hints: number of size hints
> + *
> + * Create a size hints property for the plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_property_blob *blob;
> +
> +	blob = drm_property_create_blob(dev,
> +					array_size(sizeof(hints[0]), num_hints),
> +					hints);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	drm_object_attach_property(&plane->base, config->size_hints_property,
> +				   blob->base.id);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22..5bc8aed9b445 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -949,6 +949,11 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *modifiers_property;
>  
> +	/**
> +	 * @size_hints_propertty: Plane SIZE_HINTS property.
> +	 */
> +	struct drm_property *size_hints_property;
> +
>  	/* cursor size */
>  	uint32_t cursor_width, cursor_height;
>  
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..1997d7d64b69 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -32,6 +32,7 @@
>  #include <drm/drm_util.h>
>  
>  struct drm_crtc;
> +struct drm_plane_size_hint;
>  struct drm_printer;
>  struct drm_modeset_acquire_ctx;
>  
> @@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
>  
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints);
>  
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..9d7c5967264f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -849,6 +849,17 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
>  
> +/**
> + * struct drm_plane_size_hint - Plane size hints
> + *
> + * The plane SIZE_HINTS property blob contains an
> + * array of struct drm_plane_size_hint.
> + */
> +struct drm_plane_size_hint {
> +	__u16 width;
> +	__u16 height;
> +};
> +
>  /**
>   * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
>   *
> -- 
> 2.39.2
> 
