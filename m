Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3205C061A5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A7310EA75;
	Fri, 24 Oct 2025 11:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nmc+yckx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBE10EA75
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:53:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-471066cfc2aso17971145e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761306808; x=1761911608; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jGRrEw4wcXdorFwaqi+vw3qg5PJt2Z4q8H5R7THz1J8=;
 b=nmc+yckxgXqQR3wPSNglZltCN7NKzlGmXoSUlneU3Lk/1gPGaFlRTr0+cI5h8LOojD
 t4xn2ztlqlTLFGWtXMIYaByIczkENBgIEhPZi7IDjr8JNtTzfzgnid1iMh1vTdTkDOt7
 Rc3ZW4t9cwnvsnoM4IX0MdAatLSQlWeKjuWbSNrOrUQkLLlE9UgYduEBDuYooTEfM4bm
 h0WHKhZTgfDwaKgW5gxfSq5b9ehFrx1WYVFlORBbT1mR2ndvhghqX05hcjl8OkvSX0Mr
 +avepCNDddF9XrdKLK/cLzqSxFPdwTYgDWin6wncsrYaT8PD4H975QEBjEDFOvXs5CW5
 kPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761306808; x=1761911608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jGRrEw4wcXdorFwaqi+vw3qg5PJt2Z4q8H5R7THz1J8=;
 b=MvQcKx22ILcCBN9m9jjErsy9/G52SzmWNppZSBHNIJD+NEks7tjkMg9q7rRo+4bljA
 jiiLUYpGbzv4rBgo1UE3X7SZi5McCe9L14C++TnlEDNCjw2CMhWh1Y7meHlAGkPfDdZu
 Ra6P/O1bAoiv/ob1woQqx/rNxnVbatm2fQFjlZrAO15Ox1XZvbC71z4EWQE8ebLmfoba
 DjUqEKUpZpv3euNAx52LX87h0AVLPGAhNn6kOvaYbsmr4D2flQDbrOKeznUpZ2h7VohA
 GE1iD5SwNvVuIA+o/ydABKGdKOIfo04rJ8q4vfJHncYs26EaE2zS1nnRZKpEbaomtsi0
 aqPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPPkvp1pD0hOZIdnQaTL42jf/DeZMedXRplBlr4Zf9Yv3fioVnB8WrdQ4RNe7LaEuACvy5QFvCSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2zIkL5WU2ca6lEq1YdZ4yd+7GeRxj8nB9LPRLEqFKb9NE/Veu
 Epr1ufztT4vV/rybiwVTOKi7AEQd6VZQWAE6nZ5pxpoCX5izkxB1uehg
X-Gm-Gg: ASbGncuMS5yoBmaGcA02HCVhRF7b5+4gWkDEjTMeola/8s5mxkGsNiKS9dcrVeFOebp
 SDOH+lJvIi7meWYDOzvDzc5KMw+GZyDHsptbe7rBwTa39ztL8/J6MDyg3u6wnSmlfEKTqJh6VtB
 Zy0RWwAXK4IHQ5Ffw9gyFfTwXT25j69WTF7ipTS3gVfaTfIlhKgRg+O1uTwdgE2jK3XZ0fftmtn
 GMOQYzNyn64rOga9Ei3AYx5NTug//YLUNnYmrInLwzAkWElduGNGd68mtKA7VBa90S/X6HA7Df0
 XpRhCySDCZ9TFtBzaHIu/QnIX84xoYJiAZi9UwDv9Fs6XT4TYFUJYN3ozjeaTtOyBfnB5QcEp57
 7hao4QQ9x0vkLbEwHPnpeAxuzxsnNBoY8oHDEyuGS7C3sWhBszxsG9b/1MkxPD4HDdENqkrxnwl
 s=
X-Google-Smtp-Source: AGHT+IH7HuFQMoipaAL9bwqFjfslgEwUXurZypDZoTSr0Qrn6+wEvE/TPAHcyLz7mEw9Bk37KsBong==
X-Received: by 2002:a5d:5d82:0:b0:428:4004:8226 with SMTP id
 ffacd0b85a97d-4284004ab91mr13628155f8f.34.1761306807817; 
 Fri, 24 Oct 2025 04:53:27 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e77dasm8910351f8f.2.2025.10.24.04.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:53:27 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:53:24 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/22] drm/vkms: Introduce config for plane rotation
Message-ID: <aPtotO_FnA1i1AhX@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-3-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-3-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:03AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the rotation on planes, but for testing it can be
> useful to only advertise few of them. This new configuration interface
> will allow configuring the rotation per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 26 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 54 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 +++--
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index ed172f800685..b8cabe6f6cf8 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -144,6 +144,22 @@ static bool valid_plane_number(const struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_plane_properties(const struct vkms_config *config)
> +{
> +	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
> +	struct vkms_config_plane *plane_cfg;
> +
> +	vkms_config_for_each_plane(config, plane_cfg) {
> +		if ((vkms_config_plane_get_default_rotation(plane_cfg) &
> +		     vkms_config_plane_get_supported_rotations(plane_cfg)) !=
> +		    vkms_config_plane_get_default_rotation(plane_cfg)) {
> +			drm_info(dev, "Configured default rotation is not supported by the plane\n");
> +			return false;
> +		}
> +	}
> +	return true;
> +}
> +
>  static bool valid_planes_for_crtc(const struct vkms_config *config,
>  				  struct vkms_config_crtc *crtc_cfg)
>  {
> @@ -302,6 +318,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg;
>  
> +	if (!valid_plane_properties(config))
> +		return false;
> +

I think that it makes sense to check this after we are sure that the number
of display pipeline items are correct and they are linked correctly, i.e., at
the end of the function.

Also, for testing purposes, it'd be usefull to have something like:

vkms_config_for_each_plane(config, plane_cfg) {
	if (!valid_plane_name(plane_cfg)
		return false;

	if (!valid_plane_rotation(plane_cfg)
		return false;

	// ...
}

This would allow us to have smaller functions and also write unit tests
for them easily.

What do you think?

>  	if (!valid_plane_number(config))
>  		return false;
>  
> @@ -352,6 +371,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_type(plane_cfg));
>  		seq_printf(m, "\tname=%s\n",
>  			   vkms_config_plane_get_name(plane_cfg));
> +		seq_printf(m, "\tsupported rotations: 0x%x\n",
> +			   vkms_config_plane_get_supported_rotations(plane_cfg));
> +		seq_printf(m, "\tdefault rotation: 0x%x\n",
> +			   vkms_config_plane_get_default_rotation(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -393,6 +416,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	plane_cfg->config = config;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
>  	vkms_config_plane_set_name(plane_cfg, NULL);
> +	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_MASK);
> +	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);

At the moment, drm_info returns this rotation for the default VKMS device:

"rotation": bitmask {rotate-0, rotate-90, rotate-180, rotate-270, reflect-x, reflect-y} = (rotate-0)

With this patch, this is returned:

"rotation": bitmask {rotate-0, rotate-90, rotate-180, rotate-270} = (rotate-0)

You need to add DRM_MODE_REFLECT_MASK to avoid changing the default device.

Ideally, we should add an IGT test to make sure we don't change any value
accidentally.

> +
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&plane_cfg->link, &config->planes);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index b69c35097ba0..3c3cbefcc67f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -39,6 +39,8 @@ struct vkms_config {
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> + * @default_rotation: Default rotation that should be used by this plane
> + * @supported_rotation: Rotation that this plane will support

Missing final s: @supported_rotations

>   * @plane: Internal usage. This pointer should never be considered as valid.
>   *         It can be used to store a temporary reference to a VKMS plane during
>   *         device creation. This pointer is not managed by the configuration and
> @@ -50,6 +52,8 @@ struct vkms_config_plane {
>  
>  	const char *name;
>  	enum drm_plane_type type;
> +	unsigned int default_rotation;
> +	unsigned int supported_rotations;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -290,6 +294,56 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
> + * @plane_cfg: Plane to get the default rotation from
> + *
> + * Returns:
> + * The default rotation for the plane.
> + */
> +static inline unsigned int
> +vkms_config_plane_get_default_rotation(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_rotation;
> +}
> +
> +/**
> + * vkms_config_plane_set_default_rotation() - Set the default rotation for a plane
> + * @plane_cfg: Plane to set the default rotation to
> + * @default_rotation: New default rotation for the plane
> + */
> +static inline void
> +vkms_config_plane_set_default_rotation(struct vkms_config_plane *plane_cfg,
> +				       unsigned int default_rotation)
> +{
> +	plane_cfg->default_rotation = default_rotation;
> +}
> +
> +/**
> + * vkms_config_plane_get_supported_rotations() - Get the supported rotations for a plane
> + * @plane_cfg: Plane to get the supported rotations from
> + *
> + * Returns:
> + * The supported rotations for the plane.
> + */
> +static inline unsigned int
> +vkms_config_plane_get_supported_rotations(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_rotations;
> +}
> +
> +/**
> + * vkms_config_plane_set_supported_rotations() - Set the supported rotations for a plane
> + * @plane_cfg: Plane to set the supported rotations to
> + * @supported_rotations: New supported rotations for the plane
> + */
> +static inline void
> +vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
> +					  unsigned int supported_rotations)
> +{
> +	plane_cfg->supported_rotations = supported_rotations;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 263376686794..6e6bfe1b7400 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include "vkms_config.h"

This include is already present.

>  #include <linux/iosys-map.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -233,8 +234,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  
>  	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>  
> -	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
> -					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> +	drm_plane_create_rotation_property(&plane->base,
> +					   vkms_config_plane_get_default_rotation(config),
> +					   vkms_config_plane_get_supported_rotations(config));
>  
>  	drm_plane_create_color_properties(&plane->base,
>  					  BIT(DRM_COLOR_YCBCR_BT601) |
> 
> -- 
> 2.51.0
> 
