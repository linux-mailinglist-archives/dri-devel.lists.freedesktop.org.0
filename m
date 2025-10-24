Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEBC06E60
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BA210EAB0;
	Fri, 24 Oct 2025 15:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JA8kjrh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EB610EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:14:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso10733795e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761318863; x=1761923663; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Xb1iOk36N91mas4Cq5cRC/PrSP6DadKgPF6bPCQmBE=;
 b=JA8kjrh354vZeCwl/w/sk0CZCzpNHuijSPLEEimcYHL7vWIijjVCTyH51p1yRXuwpv
 tMD3vZv2gBOgv6Xxa+Rn6ZTHWZ0eCKaqM34nOHs3Og5e2HHe9/+7by50FJAeC9GHDQrH
 b97NVnWNqCdDji2qlYrsx8AN3h6VgUtjXhaQc6c6Sod+6LxkvlVa+fnYxU8tZYV73a4t
 ysEzOGq9F1YoDmgjrQs3GvlXgk58fopFqB1k1ahp983xONOXUGwgj3+Eir45QBCeWfja
 3zbb0dplWGXBEdc/K0e7+q5mblPCRF5HM9saXLR/dFEad3TIVT8Bs/XDKKawY9WLc6bj
 Buig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761318863; x=1761923663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Xb1iOk36N91mas4Cq5cRC/PrSP6DadKgPF6bPCQmBE=;
 b=VZPsAqxTab5f2JXYnOCbEVZC5EScSkONSfA4Kgv8P42e1RP0rdQ7FJVakz+qhdqlqw
 zpNRyq8PMZR87OYSeAKUAN61eYpJU1aEiop6fz+0Q3TgAYx3/CoA9NFH0vCmsFAwc+z6
 ZF6ofYqOekpb05WHzyIrMqD37ZfGkSIPOLnNFOoYQ9X5iJr7usGcLtU1IYsvFT6XLxeX
 j6uw/q7N04Y+TvSFJbaTGq0mTOJkIW2wD+SXDqIQYjVfVi3bsE67UlMaCA18tGmj4bgI
 c5J/JA9Fe1nKz2fwkPnZJ3qGalQSVTWBMpGS7kjjIzblN6BaVJrB+2/mQmCaSC3IviB4
 0lxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXc8HppyoaBjJoPBKA2bJXmeefw+6Ozq/7qH5SLhLDIXO8ydYtJhjlKj7auq9LeOgRrLUV7f1rBY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEG5U4FRO+auw1L3zIV9vVvkxlUiNKWmfakJcU90np4PjLbPkD
 h5eHJAlTPicJd8B/8xPusKYPGMvCPe3WOEAtR8aE5YqSt9O2xt2H14ag
X-Gm-Gg: ASbGncvTg7KFywzHvTvwZDb3lbvGQyULMdafqDTln2NH/uHMO69OSJBCleCJUriWWhr
 pEr7gzjefQIlGeajtaDIXH2gZ6Styodebjk912NQceHTkcQDriqdjc49FgEctzVPILNbfLJutt+
 iQ1iEPzLWOuDNSFCUEIVTjKCd+hjB1fbspRLa8NK/mUvkQx51XOggU2I9+gttVfJx2HZnVGw8fi
 JJ5j0Y+xF4Cgtj2v5mMT5k70FwLMsIvhgIbFyDlP/Jc6I2mGdFqDVs1F6iCZGzDlhg+VgXM/kIq
 YUZrTF59El+2FDaEozdkNFRaSexamcPxKxAp/RfXHBR48H+4VbEPw5EqfT2iVsdj5V2eyq1BAt+
 OPkVBlC4gVZhqh/2Ezd4uuGxFav6Eh/zyBrKJNppfKIjBfZKtFcsT8ZwjP6jh5HEqGs/CEGJMff
 TPbzc7pMtT2JFUQNEsIi7B
X-Google-Smtp-Source: AGHT+IE4w//uQGSAi5tqfRdUfcGhOr1Jz/5zPaPVehBcOpQFdZyB7QRU2MAgBZyfmYynLj3u+5+sTw==
X-Received: by 2002:a05:600c:1554:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-475cb044e25mr59411265e9.28.1761318862319; 
 Fri, 24 Oct 2025 08:14:22 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496c14a26sm86965605e9.4.2025.10.24.08.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 08:14:21 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:14:18 +0200
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
Subject: Re: [PATCH 05/22] drm/vkms: Introduce config for plane color encoding
Message-ID: <aPuXyp43xtlVUHTw@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-5-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-5-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:05AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the color encoding on planes, but for testing it
> can be useful to only advertise few of them. This new configuration
> interface will allow configuring the color encoding per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 15 +++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++----
>  3 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index b8cabe6f6cf8..5353719a476d 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -156,6 +156,13 @@ static bool valid_plane_properties(const struct vkms_config *config)
>  			drm_info(dev, "Configured default rotation is not supported by the plane\n");
>  			return false;
>  		}
> +
> +		if ((BIT(vkms_config_plane_get_default_color_encoding(plane_cfg)) &
> +		     vkms_config_plane_get_supported_color_encoding(plane_cfg)) !=
> +		    BIT(vkms_config_plane_get_default_color_encoding(plane_cfg))) {

Could you document what kind of value should be stored when using
vkms_config_plane_set_default_color_encoding(), please?

I'm confused by the use of BIT() here but not in the next commit
("drm/vkms: Introduce configfs for plane color encoding") during
a similar validation.

> +			drm_info(dev, "Configured default color encoding is not supported by the plane\n");
> +			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -375,6 +382,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_supported_rotations(plane_cfg));
>  		seq_printf(m, "\tdefault rotation: 0x%x\n",
>  			   vkms_config_plane_get_default_rotation(plane_cfg));
> +		seq_printf(m, "\tsupported color encoding: 0x%x\n",
> +			   vkms_config_plane_get_supported_color_encoding(plane_cfg));
> +		seq_printf(m, "\tdefault color encoding: %d\n",

Is this one expressed in decimal rather than hex on purpose?

> +			   vkms_config_plane_get_default_color_encoding(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -418,6 +429,10 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	vkms_config_plane_set_name(plane_cfg, NULL);
>  	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_MASK);
>  	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
> +	vkms_config_plane_set_supported_color_encoding(plane_cfg, BIT(DRM_COLOR_YCBCR_BT601) |
> +							BIT(DRM_COLOR_YCBCR_BT709) |
> +							BIT(DRM_COLOR_YCBCR_BT2020));
> +	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
>  
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 3c3cbefcc67f..11160c3c13bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -45,6 +45,8 @@ struct vkms_config {
>   *         It can be used to store a temporary reference to a VKMS plane during
>   *         device creation. This pointer is not managed by the configuration and
>   *         must be managed by other means.
> + * @default_color_encoding: Default color encoding that should be used by this plane
> + * @supported_color_encoding: Color encoding that this plane will support

To be consistent with "supported_rotations", should this prop
be "supported_color_encodings"?

>   */
>  struct vkms_config_plane {
>  	struct list_head link;
> @@ -54,6 +56,8 @@ struct vkms_config_plane {
>  	enum drm_plane_type type;
>  	unsigned int default_rotation;
>  	unsigned int supported_rotations;
> +	enum drm_color_encoding default_color_encoding;
> +	unsigned int supported_color_encoding;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -344,6 +348,32 @@ vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->supported_rotations = supported_rotations;
>  }
>  
> +static inline enum drm_color_encoding
> +vkms_config_plane_get_default_color_encoding(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_color_encoding;
> +}
> +
> +static inline void
> +vkms_config_plane_set_default_color_encoding(struct vkms_config_plane *plane_cfg,
> +					     enum drm_color_encoding default_color_encoding)
> +{
> +	plane_cfg->default_color_encoding = default_color_encoding;
> +}
> +
> +static inline unsigned int
> +vkms_config_plane_get_supported_color_encoding(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_color_encoding;
> +}
> +
> +static inline void
> +vkms_config_plane_set_supported_color_encoding(struct vkms_config_plane *plane_cfg,
> +					       unsigned int supported_color_encoding)
> +{
> +	plane_cfg->supported_color_encoding = supported_color_encoding;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 6e6bfe1b7400..5869000415e4 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -239,12 +239,10 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					   vkms_config_plane_get_supported_rotations(config));
>  
>  	drm_plane_create_color_properties(&plane->base,
> -					  BIT(DRM_COLOR_YCBCR_BT601) |
> -					  BIT(DRM_COLOR_YCBCR_BT709) |
> -					  BIT(DRM_COLOR_YCBCR_BT2020),
> +					  vkms_config_plane_get_supported_color_encoding(config),
>  					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> -					  DRM_COLOR_YCBCR_BT601,
> +					  vkms_config_plane_get_default_color_encoding(config),
>  					  DRM_COLOR_YCBCR_FULL_RANGE);
>  
>  	return plane;
> 
> -- 
> 2.51.0
> 
