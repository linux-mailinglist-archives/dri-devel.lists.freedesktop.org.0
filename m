Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A581D3D0DE6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8729F6E8CB;
	Wed, 21 Jul 2021 11:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB19F6E8CB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 11:39:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c17so1123194wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=prTKXXkdJ+IAQFudGbZqYsmmfDKA9FNwV7upevuCRRg=;
 b=XDM0In7OzIhIkztmBqvoGlQDCmH7V8Gh+iSllOPsRdEaX32YuitwPdf0M8232qY2D1
 QN1If3Njcv2cYHBYBwwCFstxmppauJaNPTcHaEoZHgyE3Gi42HqgwT4DJmNacBYWRM5c
 FelUVk/GylDJ3kepmxkWw0fm3Raca4R4Kv09k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=prTKXXkdJ+IAQFudGbZqYsmmfDKA9FNwV7upevuCRRg=;
 b=J81+dFzt5Uv5jO+Gd7u9rHIJOM/LruLcabRTK2vRQY83ISRUNXTLbqcNFx6GS1tJui
 qha4gm20T2agFc3WqTDKdGNRlxw3eH92c1//JgoNi3HIL46D+fWK9NYtt28BTviflkQY
 oWa80k/ythOaKubvGvjzfNvIHWDIKcYJjmHWEW0TK7I9JKxNw/7LOmVLg0BOqwmOlSzs
 7zklcjlC2v1kGFaTVZseNL/q4obc77bpTaRbtqLdy2YQfG0y6G3LPg4i0HEjdRMCKUe7
 N2GMfOxRGexeMh15yvL6NVAR3xrJMqbOZ6SBxXObtEFA598V1+g2PCXOuCoUGfJzXRuD
 u1xA==
X-Gm-Message-State: AOAM532N8XjGpoO7SCJZocHuuZFwB0L/qLjxRIvaQmwFV8vxv4Idh7vz
 ZPWgkXZnyb2DrDi3+VPzo6cmtvXzjHaFGA==
X-Google-Smtp-Source: ABdhPJxec399HiuXnzJxle5IrJBOasFbRnKNbuI2zAlXkav1SRCniPeWj/0egXtGfUI2qnVUiNg/lw==
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr3655041wme.188.1626867578444; 
 Wed, 21 Jul 2021 04:39:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m4sm3876460wmq.7.2021.07.21.04.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:39:37 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:39:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_property
Message-ID: <YPgHeJ4gcKI1YaUa@phenom.ffwll.local>
References: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 06:49:32AM +0000, Simon Ser wrote:
> It's not obvious what the fields mean and how they should be used.
> The most important detail is the link to drm_property.flags, which
> describes how property types work.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 52 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 98bf130feda5..dfdb595875aa 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -546,17 +546,61 @@ struct drm_mode_property_enum {
>  	char name[DRM_PROP_NAME_LEN];
>  };
>  
> +/**
> + * struct drm_mode_get_property - Get property metadata.
> + *
> + * User-space can perform a GETPROPERTY ioctl to retrieve information about a
> + * property.
> + *
> + * The meaning of the @values_ptr field changes depending on the property type.
> + * See &drm_property.flags for more details.
> + *
> + * The @enum_blob_ptr and @count_enum_blobs fields are only meaningful when the
> + * property has the type &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK. For
> + * backwards compatibility, the kernel will always set @count_enum_blobs to
> + * zero when the property has the type &DRM_MODE_PROP_BLOB. User-space must
> + * ignore these two fields if the property has a different type.
> + *
> + * User-space is expected to retrieve values and enums by performing this ioctl
> + * at least twice: the first time to retrieve the number of elements, the
> + * second time to retrieve the elements themselves.
> + *
> + * To retrieve the number of elements, set @count_values and @count_enum_blobs
> + * to zero, then call the ioctl. @count_values will be updated with the number
> + * of elements. If the property has the type &DRM_MODE_PROP_ENUM or
> + * &DRM_MODE_PROP_BITMASK, @count_enum_blobs will be updated as well.
> + *
> + * To retrieve the elements themselves, allocate an array for @values_ptr and
> + * set @count_values to its capacity. If the property has the type
> + * &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK, allocate an array for
> + * @enum_blob_ptr and set @count_enum_blobs to its capacity. Calling the ioctl
> + * again will fill the arrays.

I think it would be really good to link to

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#modeset-base-object-abstraction

for all the property related ioctl. That entire class vs instance
confusion is pretty common I think, which is why I even made a nice
picture about it :-)

> + */
>  struct drm_mode_get_property {
> -	__u64 values_ptr; /* values and blob lengths */
> -	__u64 enum_blob_ptr; /* enum and blob id ptrs */
> +	/** @values_ptr: Pointer to a ``__u64`` array. */
> +	__u64 values_ptr;
> +	/** @enum_blob_ptr: Pointer to a struct drm_mode_property_enum array. */

I guess would be nice to also document that drm_mode_property_enum.
Especially whether we also have this nice confusion between value and
bitmask there too (I guess so).

> +	__u64 enum_blob_ptr;
>  
> +	/**
> +	 * @prop_id: Object ID of the property which should be retrieved. Set
> +	 * by the caller.
> +	 */
>  	__u32 prop_id;
> +	/**
> +	 * @flags: ``DRM_MODE_PROP_*`` bitfield. See &drm_property.flags for
> +	 * a definition of the flags.
> +	 */
>  	__u32 flags;
> +	/**
> +	 * @name: Symbolic property name. User-space should use this field to
> +	 * recognize properties.
> +	 */
>  	char name[DRM_PROP_NAME_LEN];
>  
> +	/** @count_values: Number of elements in @values_ptr. */
>  	__u32 count_values;
> -	/* This is only used to count enum values, not blobs. The _blobs is
> -	 * simply because of a historical reason, i.e. backwards compat. */
> +	/** @count_enum_blobs: Number of elements in @enum_blob_ptr. */
>  	__u32 count_enum_blobs;

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  };
>  
> -- 
> 2.32.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
