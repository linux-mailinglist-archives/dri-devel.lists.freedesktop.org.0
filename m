Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F3C0C929
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659CF10E161;
	Mon, 27 Oct 2025 09:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bMg2D/v0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E458410E161
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:12:33 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso2104887f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761556352; x=1762161152; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xkPqb6n0VoYYPtOKnpkZy8oEW25g2m8MnAPNKX/Y7Nw=;
 b=bMg2D/v0kVpJ9jBXeMDizs7W+7bXaK9nBa58Si3G9/flf3J0/Ku+/TCeONp1S/HJpG
 WwHqinxduJ1K5PkGCDE2Obw/SVvzEENSOdjBI7T+ov2KwONGqwodPerYFyehM5IYWrEi
 MSqrlYgrMUwwjIP+lAmxkCemdJOAtO+QZpOLR8NQVEFxwVmNm976SuVfr9dKe6sYNq8A
 0nQ66MVqNdJkudmIkmnv8t4yJAT5wVzEHj5liv3GCDIQyUF5Wss/BqoZWv3uQ+mxxBPB
 vBOU1UUqcBL5FuKW0C86L2CnNkL3nTX6xhz/6BuADQyTSFQi7XO61LD37u3zo2Aa04kp
 erGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761556352; x=1762161152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkPqb6n0VoYYPtOKnpkZy8oEW25g2m8MnAPNKX/Y7Nw=;
 b=w/ADHaZpG+MJpOnsreReBhqHFUbfwdT+NXIqMSgbrH8u6sG/hfr7YqEx7Dk4bAqBxB
 SfCrzPQ3lPq6qtddl4dqhNLiUX37KZClAhqkeJAoUUiDxBGQsKoeqxx82NqnZ89TrZBv
 hY/lsEmoXXErkt3qPm1fedgvpV3hoLmmT3maAWvDUUDphKPXFOFqWKcZseV2W28c6VDU
 DovD9K9BlExnyf3c4eR1S1OyCkuzPcFa4ek9jK5EX8p32ghlngBYWe9UTKNIHhwsELme
 F4JUVwMy5YSEAFi+jouK+PRFU+74TmEPrO3Cq1rk6Gj6zr8Eioa5cwJOQ9LlFZePf8QY
 OKOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtPceVTyvFxw2xDsf3ImWateezHs9/jNjUnFvlKfBJI6GeWD6zcrUm4HHDyASHhYgE+DmFtrvIo28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxsnSO0vo6M43v0fyToJO/Ube5UfCf1RDesXGjXKPT21sioVO2
 fJU4MOx9A9TKL+7XBt10NxAy6XrGPsuxtSx3LNmkInxWILym4SSb99kf
X-Gm-Gg: ASbGnctMAzefTWASQrz/mlhULWg6T+GlRT8YLRLa3fSkts3zElxk69nvsuN1Hfe5Chc
 qYlq14VEslIxlQtcl7eniSkp3PLBvX73yLCQKprcIDRxMSLOHyw8SecbMn9j6wf6KcJ6xFwJbjW
 opO7Vy3P/STGXLN8ue562RDnTC71D2sKLYv9sDbon4csNAl6gLTnvQkFGNzEkJwyG7WQh5z6jRS
 w3hVPWwNdCPy0kB1YMKBnFnaWumqym2rkHKEAg4Z0fNu6+TJYTaDH/kuvlK5uylDSVOOjUUM2E+
 N+9o4EflNyrKoEWtCb3mJMM3WR+5WS2FvE/kxzqPzYdm49fazBMa6m+ylDkia6pRAgP6STjKNQr
 u0Rcpy6vCNDk1zvcDOZtvAHXDMU3FzvAq5SOqbhK4/ocsja/+2Ei50hXtxHT6PW84Ei8TmPKs0Z
 7vDGmSRJBj
X-Google-Smtp-Source: AGHT+IGWA4kC5BvZa7/RUzgZ5XLqYQXiNk9KdxUCOVoLgrTZ1GWOwq8Cct+a07PNqvZ8XkDoH+Deaw==
X-Received: by 2002:a05:6000:220c:b0:426:fd63:bbc0 with SMTP id
 ffacd0b85a97d-42704d786c2mr30428268f8f.27.1761556352166; 
 Mon, 27 Oct 2025 02:12:32 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de4a1sm13054085f8f.37.2025.10.27.02.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 02:12:31 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:12:30 +0100
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
Subject: Re: [PATCH 12/22] drm/vkms: Introduce config for plane zpos property
Message-ID: <aP83fl899vwZKsD1@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-12-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-12-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:12AM +0200, Louis Chauvet wrote:
> VKMS can render plane in any order. Introduce the appropriate
> configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |   3 +
>  drivers/gpu/drm/vkms/vkms_config.c            |  21 ++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 142 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c             |  11 ++
>  4 files changed, 177 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index d75a6252e4d2..f2b38b436252 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -172,6 +172,9 @@ static void vkms_config_test_default_config(struct kunit *test)
>  			n_possible_crtcs++;
>  		}
>  		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
> +		KUNIT_EXPECT_EQ(test, vkms_config_plane_get_zpos_enabled(plane_cfg), false);
> +		// No need to test the other zpos configurations as they are discarded if
> +		// the zpos property is not created.
>  	}
>  
>  	/* Encoders */
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 0b975a0d47aa..5da34a3e8114 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -86,6 +86,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(plane_cfg))
>  		goto err_alloc;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
> +	vkms_config_plane_set_zpos_enabled(plane_cfg, false);
>  
>  	crtc_cfg = vkms_config_create_crtc(config);
>  	if (IS_ERR(crtc_cfg))
> @@ -103,6 +104,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  
>  			vkms_config_plane_set_type(plane_cfg,
>  						   DRM_PLANE_TYPE_OVERLAY);
> +			vkms_config_plane_set_zpos_enabled(plane_cfg, false);
>  
>  			if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
>  				goto err_alloc;
> @@ -115,6 +117,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  			goto err_alloc;
>  
>  		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
> +		vkms_config_plane_set_zpos_enabled(plane_cfg, false);
>  
>  		if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
>  			goto err_alloc;
> @@ -206,6 +209,24 @@ static bool valid_plane_properties(const struct vkms_config *config)
>  			drm_info(dev, "Configured default color range is not supported by the plane\n");
>  			return false;
>  		}
> +		if (vkms_config_plane_get_zpos_initial(plane_cfg) >
> +		    vkms_config_plane_get_zpos_max(plane_cfg)) {
> +			drm_info(dev, "Configured initial zpos value bigger than zpos max\n");
> +			return false;
> +		}
> +
> +		if (vkms_config_plane_get_zpos_max(plane_cfg) <
> +		    vkms_config_plane_get_zpos_min(plane_cfg)) {
> +			drm_info(dev, "Configured zpos max value smaller than zpos min\n");
> +			return false;
> +		}
> +
> +		if (vkms_config_plane_get_zpos_initial(plane_cfg) <
> +		    vkms_config_plane_get_zpos_min(plane_cfg)) {
> +			drm_info(dev, "Configured initial zpos value smaller than zpos min\n");
> +			return false;
> +		}
> +

Like I suggested with other validations, it'd be nice to extract this to a
helper to simplify testing.

Also, these properties are not listed in vkms_config_show().

>  	}
>  	return true;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 0b7067508e5f..267e45f5a617 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -49,6 +49,11 @@ struct vkms_config {
>   * @supported_color_encoding: Color encoding that this plane will support
>   * @default_color_range: Default color range that should be used by this plane
>   * @supported_color_range: Color range that this plane will support
> + * @zpos_enable: Enable or disable the zpos property

@zpos_enabled

> + * @zpos_mutable: Make the zpos property mutable or not (ignored if @zpos_enable is false)
> + * @zpos_initial: Initial value for zpos property (ignored if @zpos_enable is false)
> + * @zpos_min: Minimal value for zpos property (ignored if @zpos_enable is false)
> + * @zpos_max: Maximal value for zpos property (ignored if @zpos_enable is false)

For these 4 as well: "(ignored if @zpos_enabled...".

>   */
>  struct vkms_config_plane {
>  	struct list_head link;
> @@ -65,6 +70,11 @@ struct vkms_config_plane {
>  	u32 *supported_formats;
>  	unsigned int supported_formats_count;
>  	struct xarray possible_crtcs;
> +	bool zpos_enabled;
> +	bool zpos_mutable;
> +	unsigned int zpos_initial;
> +	unsigned int zpos_min;
> +	unsigned int zpos_max;
>  
>  	/* Internal usage */
>  	struct vkms_plane *plane;
> @@ -477,6 +487,138 @@ vkms_config_plane_get_name(struct vkms_config_plane *plane_cfg)
>  	return plane_cfg->name;
>  }
>  
> +/**
> + * vkms_config_plane_set_zpos_enabled() - Enable or disable zpos property for a plane
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_enabled: Whether to enable the zpos property
> + */
> +static inline
> +void vkms_config_plane_set_zpos_enabled(struct vkms_config_plane *plane_cfg,
> +					bool zpos_enabled)
> +{
> +	plane_cfg->zpos_enabled = zpos_enabled;
> +}
> +
> +/**
> + * vkms_config_plane_set_zpos_mutable() - Set whether zpos property is mutable
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_mutable: Whether the zpos property should be mutable
> + */
> +static inline
> +void vkms_config_plane_set_zpos_mutable(struct vkms_config_plane *plane_cfg,
> +					bool zpos_mutable)
> +{
> +	plane_cfg->zpos_mutable = zpos_mutable;
> +}
> +
> +/**
> + * vkms_config_plane_set_zpos_initial() - Set the initial zpos value
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_initial: Initial zpos value
> + */
> +static inline
> +void vkms_config_plane_set_zpos_initial(struct vkms_config_plane *plane_cfg,
> +					unsigned int zpos_initial)
> +{
> +	plane_cfg->zpos_initial = zpos_initial;
> +}
> +
> +/**
> + * vkms_config_plane_set_zpos_min() - Set the minimum zpos value
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_min: Minimum zpos value
> + */
> +static inline
> +void vkms_config_plane_set_zpos_min(struct vkms_config_plane *plane_cfg,
> +				    unsigned int zpos_min)
> +{
> +	plane_cfg->zpos_min = zpos_min;
> +}
> +
> +/**
> + * vkms_config_plane_set_zpos_max() - Set the maximum zpos value
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_max: Maximum zpos value
> + *
> + * Sets the maximum allowed value for the zpos property. This setting is
> + * ignored if zpos is disabled.
> + */
> +static inline
> +void vkms_config_plane_set_zpos_max(struct vkms_config_plane *plane_cfg,
> +				    unsigned int zpos_max)
> +{
> +	plane_cfg->zpos_max = zpos_max;
> +}
> +
> +/**
> + * vkms_config_plane_get_zpos_enabled() - Check if zpos property is enabled
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * True if the zpos property is enabled for this plane, false otherwise.
> + */
> +static inline
> +bool vkms_config_plane_get_zpos_enabled(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->zpos_enabled;
> +}
> +
> +/**
> + * vkms_config_plane_get_zpos_mutable() - Check if zpos property is mutable
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * True if the zpos property is mutable for this plane, false otherwise.
> + * Returns false if zpos is disabled.
> + */
> +static inline
> +bool vkms_config_plane_get_zpos_mutable(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->zpos_mutable;
> +}
> +
> +/**
> + * vkms_config_plane_get_zpos_initial() - Get the initial zpos value
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * The initial zpos value for this plane. The return value is undefined if
> + * zpos is disabled.
> + */
> +static inline
> +unsigned int vkms_config_plane_get_zpos_initial(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->zpos_initial;
> +}
> +
> +/**
> + * vkms_config_plane_get_zpos_min() - Get the minimum zpos value
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * The minimum allowed zpos value for this plane. The return value is undefined
> + * if zpos is disabled.
> + */
> +static inline
> +unsigned int vkms_config_plane_get_zpos_min(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->zpos_min;
> +}
> +
> +/**
> + * vkms_config_plane_get_zpos_max() - Get the maximum zpos value
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * The maximum allowed zpos value for this plane. The return value is undefined
> + * if zpos is disabled.
> + */
> +static inline
> +unsigned int vkms_config_plane_get_zpos_max(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->zpos_max;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 0414865915d8..51f6372a6f72 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -209,5 +209,16 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					  vkms_config_plane_get_default_color_encoding(config),
>  					  vkms_config_plane_get_default_color_range(config));
>  
> +	if (vkms_config_plane_get_zpos_enabled(config)) {
> +		if (vkms_config_plane_get_zpos_mutable(config))
> +			drm_plane_create_zpos_property(&plane->base,
> +						       vkms_config_plane_get_zpos_initial(config),
> +						       vkms_config_plane_get_zpos_min(config),
> +						       vkms_config_plane_get_zpos_max(config));
> +		else
> +			drm_plane_create_zpos_immutable_property(&plane->base,
> +								 vkms_config_plane_get_zpos_initial(config));
> +	}
> +
>  	return plane;
>  }
> 
> -- 
> 2.51.0
> 
