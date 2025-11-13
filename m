Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B9C57E13
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE38B10E83C;
	Thu, 13 Nov 2025 14:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PNiUeiX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F010E830
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:18:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47755a7652eso6360615e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763043479; x=1763648279; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ieqda0G4yVO5G82YHI1y7YhCqMKEjUvALjT+1Xp4wgc=;
 b=PNiUeiX7oQNwp5Fm9NNdc45UB9TEEl+KPsTTv1Ior1gA3rh9e3JdJOJ1AnsxlvYDDX
 Dhlfd1FSN0VI0G6b5ubt/yIwkySthugkDYOvfjYMr5V/rEu3rGhO1CEaihoh68uM+pUk
 tkYY4RolCP7gDUZKqgxZ98VLFg2HiZjAnxlW9S5JyYek+IvLTknJF8VCzQDNaSeR/G1Y
 jaZSN2J1phlKxSv0XRrdwZOapP0g9W/Bm4s8Vw1Gzv4wEAaMvB1jwXMQpz/1ZYUxFySt
 Rl3ygQ9avUy2CVmi2m0DMWCXrMB8SBLg39x6RBCFjEBqaJZ7/BAtf1a87GsKIJM5qp9y
 XFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763043479; x=1763648279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieqda0G4yVO5G82YHI1y7YhCqMKEjUvALjT+1Xp4wgc=;
 b=iO9tBSQL5mO3lpsY6YSfcjf1pmst809idnim+xisrT5gbdlPIVHYX2gZc5KJi3ioaM
 J7gPrSATEellaUrtoJXmLNXS74CNoFYmv0kp5TnmFiUAwssUVfDRjUMXjCeMZZCt1OQc
 8KMSMN/t2RUupeTklNlJuL32a1RO0KMVwe/4JTtex8pZzSt8W/pyxKCzHfo14QHr2kAa
 w5idjboFfPwOCdEJfMY2eTmlKZjo4gHyfAEarHj3ZqsQjUCY2NSkH2vpMaBU0giBNaFI
 St26drYaUVAWMaJH1btpiLOzVsChXcfHsHiZTPRTcnTuOByPeip208Q5+I5F596gK56Z
 IQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7UWloTEwANaxf51BG0HQDshrdJKzrmBuME90HOXt1XCfH0Im9laqKYaMhmNR9bLnUCZ3gl5Q8oQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2s2Mah9422+EJL0aC5PLwEmarhJPFLyjLgnZV75pGXMIYJzHq
 uK5OfAeelnXx8JsHB+egzHEuLRbPX/rBOnHkpX4zYdR3HR4+BPEyfFQX
X-Gm-Gg: ASbGncu29gx4E5JnuU8P365e1Y31C3gHnzfgojtJMdo9CCLLpr3fO5WNWkh37L4WEiv
 1fhPuBaYc8d2WpHHXRvSBbbK+dQ2lQuYmRYEv/hnh3qjes0xvpbiQSOszLaSPctgMzEFgxKohsn
 UM4LHiNfIdJOc646fEsHnhCV0t75/ZxtSOEti+OASBwZVGU+uKfQRFKq686DlDSLvNo/GHy37G3
 SdBd5dXHdXp+5PAfIEX4VQgyFRr2jy8SE90IO216x8tdN+D4hPBcD3V+6P7bJ+j7wFDUwN6QTNE
 uDZps/gCgnffi0LCeui3vLDZrrvFE1xrORtRYPuMG+GhWU+z9It9L6JchRJkfUcbnYqFNeZ8JcH
 hOwjB5ewKHTGAOMZrdsmzw3cR/ajA3PmFPuc9S2nv4hcSED0SyE/1jlC6jzXg8jr5wYbCbtPxDg
 ==
X-Google-Smtp-Source: AGHT+IEBW5aSjQneMUjCfuvdpLmeox+7YNbLpupeAo1lDdWVn7x/zJucaYxSBLZECcpaAE8Pc1DIIQ==
X-Received: by 2002:a05:600c:3546:b0:475:da13:257c with SMTP id
 5b1f17b1804b1-477871c37b4mr65109075e9.27.1763043479023; 
 Thu, 13 Nov 2025 06:17:59 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2bcf9sm94362625e9.3.2025.11.13.06.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:17:58 -0800 (PST)
Date: Thu, 13 Nov 2025 15:17:56 +0100
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
Subject: Re: [PATCH RESEND v2 05/32] drm/vkms: Introduce config for plane name
Message-ID: <aRXolNJJ5caay_H1@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-5-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vkms-all-config-v2-5-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:42PM +0100, Louis Chauvet wrote:
> As planes can have a name in DRM, prepare VKMS to configure it using
> ConfigFS.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c |  4 ++++
>  drivers/gpu/drm/vkms/vkms_config.h | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h    |  5 +++--
>  drivers/gpu/drm/vkms/vkms_output.c |  6 +-----
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++++--
>  5 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 858bec2d1312..bfafb5d2504d 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -352,6 +352,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_puts(m, "plane:\n");
>  		seq_printf(m, "\ttype=%s\n",
>  			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
> +		seq_printf(m, "\tname=%s\n",
> +			   vkms_config_plane_get_name(plane_cfg));

I discovered this while working on some basic IGT tests to validate
your changes.

I think that this triggers undefined behavior. printf() and friends
expect a non NULL value for %s:
https://stackoverflow.com/a/11589479

In my Fedora system, this prints "name=(null)", instead of an empty
string.

The same happens with the ConfigFS API:

$ cat /sys/kernel/config/vkms/test_plane_default_values/planes/plane0/name
(null)

We'd need to return in both places an empty string instead.

>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -392,6 +394,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  
>  	plane_cfg->config = config;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
> +	vkms_config_plane_set_name(plane_cfg, NULL);
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&plane_cfg->link, &config->planes);
> @@ -404,6 +407,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>  {
>  	xa_destroy(&plane_cfg->possible_crtcs);
>  	list_del(&plane_cfg->link);
> +	kfree_const(plane_cfg->name);
>  	kfree(plane_cfg);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 4c8d668e7ef8..57342db5795a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -35,6 +35,7 @@ struct vkms_config {
>   *
>   * @link: Link to the others planes in vkms_config
>   * @config: The vkms_config this plane belongs to
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> @@ -47,6 +48,7 @@ struct vkms_config_plane {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	const char *name;
>  	enum drm_plane_type type;
>  	struct xarray possible_crtcs;
>  
> @@ -288,6 +290,30 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_plane_set_name() - Set the plane name
> + * @plane_cfg: Plane to set the name to
> + * @name: New plane name. The name is copied.
> + */
> +static inline void
> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
> +			   const char *name)
> +{
> +	if (plane_cfg->name)
> +		kfree_const(plane_cfg->name);
> +	plane_cfg->name = kstrdup_const(name, GFP_KERNEL);
> +}
> +
> +/**
> + * vkms_config_plane_get_name - Get the plane name
> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->name;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index db260df1d4f6..9ad286f043b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -225,6 +225,7 @@ struct vkms_output {
>  };
>  
>  struct vkms_config;
> +struct vkms_config_plane;
>  
>  /**
>   * struct vkms_device - Description of a VKMS device
> @@ -298,10 +299,10 @@ int vkms_output_init(struct vkms_device *vkmsdev);
>   * vkms_plane_init() - Initialize a plane
>   *
>   * @vkmsdev: VKMS device containing the plane
> - * @type: type of plane to initialize
> + * @config: plane configuration
>   */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type);
> +				   struct vkms_config_plane *config);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 2ee3749e2b28..22208d02afa4 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -19,11 +19,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		return -EINVAL;
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
> -		enum drm_plane_type type;
> -
> -		type = vkms_config_plane_get_type(plane_cfg);
> -
> -		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
> +		plane_cfg->plane = vkms_plane_init(vkmsdev, plane_cfg);
>  		if (IS_ERR(plane_cfg->plane)) {
>  			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>  			return PTR_ERR(plane_cfg->plane);
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e592e47a5736..73180cbb78b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
> +#include "vkms_config.h"
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
>  
> @@ -217,7 +218,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type)
> +				   struct vkms_config_plane *config)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
> @@ -225,7 +226,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
> -					   NULL, type, NULL);
> +					   NULL, vkms_config_plane_get_type(config),
> +					   vkms_config_plane_get_name(config));
>  	if (IS_ERR(plane))
>  		return plane;
>  
> 
> -- 
> 2.51.0
> 
