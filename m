Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B93DD1F1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673156E046;
	Mon,  2 Aug 2021 08:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849A36E046
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 08:29:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id n2so23306328eda.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6aHkpuAyIDGQCRBIIGyBRwILPdoJwxLXbmX0xCorBCY=;
 b=do6cLaKtZEla5eJcly1kBGdcpuen1zo9ZcFXk4EVYPOdjBsgoD5/tPMd31CJO3LVUO
 ijdz/X/FmcB7ker97+kVqWyrn+1NLX8EsY92JU8WimZRkAzsCS+oPK5DVyXU1p7L3AKY
 Wl3nhO12fPmJrJ+0foP2izSQBQRpnfKV5NmCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6aHkpuAyIDGQCRBIIGyBRwILPdoJwxLXbmX0xCorBCY=;
 b=DIJgb+TIeoJwla6gQXbeFjq0H6gRfTnYIMXfrxYAzgiCcvLxGYJ02CqkG3c8oB0PUk
 x2MDTO3k8GTfq9XDOw81FgT95KGpmuhhYhijfNx/Kp7zN/wDGiT81s49D+jZ8V8sKR//
 nhNF/3n6wc5wGYS4hBwfhDNSG0n9NkYSNGF2C+2O189nOy7vmuE/Zp6foq0F65G+Q2+K
 OZANF7ya17hqGlLC3DESS3KGKIItkp1c5zH+NSvnrpy8U9qLevH0rG/HbVpjWVAxFq4v
 WNZytdwHuNqvQZkkLRZZezAxHA0DwL0//qa47lqnUlI0AAOPbtn4tbNJFhJ/sev6fWka
 V0sA==
X-Gm-Message-State: AOAM531cpcH6KzAJ4nC9HyU/qKB30oGcrEZ0nbZ9qZ1qbnTdP/wxMhfg
 GjwZ4JxPoyqjsbO1Ose+TkjFFw==
X-Google-Smtp-Source: ABdhPJyCmz4M8/Dm0sdQP47GsUaSrldf8HX9I3exKMUlCo4gh8wgd1Q9uVoPXPyXqaRljTvzzPgb5Q==
X-Received: by 2002:a05:6402:60e:: with SMTP id
 n14mr2329075edv.142.1627892939059; 
 Mon, 02 Aug 2021 01:28:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm4143681ejg.3.2021.08.02.01.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 01:28:58 -0700 (PDT)
Date: Mon, 2 Aug 2021 10:28:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v2] drm: document drm_mode_get_property
Message-ID: <YQesyDB8kPIDzBUj@phenom.ffwll.local>
References: <20210802072826.500078-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802072826.500078-1-contact@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 02, 2021 at 07:28:35AM +0000, Simon Ser wrote:
> It's not obvious what the fields mean and how they should be used.
> The most important detail is the link to drm_property.flags, which
> describes how property types work.
> 
> v2: document enum drm_mode_property_enum, add ref to "Modeset Base
> Object Abstraction" (Daniel)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
> I couldn't figure out how to linkify that ref, so it's not linkified.
> 
>  Documentation/gpu/drm-kms.rst |  2 ++
>  include/uapi/drm/drm_mode.h   | 60 ++++++++++++++++++++++++++++++++---
>  2 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 0cc21f6aaef5..1ef7951ded5e 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -159,6 +159,8 @@ KMS Core Structures and Functions
>  .. kernel-doc:: drivers/gpu/drm/drm_mode_config.c
>     :export:
>  
> +.. _kms_base_object_abstraction:
> +
>  Modeset Base Object Abstraction
>  ===============================
>  
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 98bf130feda5..90c55383f1ee 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -541,22 +541,74 @@ struct drm_mode_get_connector {
>   */
>  #define DRM_MODE_PROP_ATOMIC        0x80000000
>  
> +/**
> + * struct drm_mode_property_enum - Description for an enum/bitfield entry.
> + * @value: numeric value for this enum entry.
> + * @name: symbolic name for this enum entry.
> + *
> + * See struct drm_property_enum for details.
> + */
>  struct drm_mode_property_enum {
>  	__u64 value;
>  	char name[DRM_PROP_NAME_LEN];
>  };
>  
> +/**
> + * struct drm_mode_get_property - Get property metadata.
> + *
> + * User-space can perform a GETPROPERTY ioctl to retrieve information about a
> + * property. The same property may be attached to multiple objects, see
> + * "Modeset Base Object Abstraction".
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
> + */
>  struct drm_mode_get_property {
> -	__u64 values_ptr; /* values and blob lengths */
> -	__u64 enum_blob_ptr; /* enum and blob id ptrs */
> +	/** @values_ptr: Pointer to a ``__u64`` array. */
> +	__u64 values_ptr;
> +	/** @enum_blob_ptr: Pointer to a struct drm_mode_property_enum array. */
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
