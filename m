Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C651C5844E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79010E859;
	Thu, 13 Nov 2025 15:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="lwwG7N31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331A10E85C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:15:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47755a7652eso6869285e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 07:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1763046917; x=1763651717; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WIyx4FoiIJ0CWUrLGPOpWyxSuEUcoWV0c7Rxw2upNw=;
 b=lwwG7N31XTSlptGAZLAaX+X8R+4YwKWekNh9gqhMtdaKdn5uUZ/Ibt6+wdCxjBv47b
 YjThGqvojvpzleJTY1gtBMPExfFIGkf7zQM0EvsYcXey2Qhr9/DaSLK5rinnsMtwEsXH
 3SqtdF5ElRrTFVHqCjahoYB5e6MoZm+Q3FV+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763046917; x=1763651717;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1WIyx4FoiIJ0CWUrLGPOpWyxSuEUcoWV0c7Rxw2upNw=;
 b=FVHNwks4EeJn/Ex97QMakx6M2CSslbxCU/xFyPvg4uma7lpOd4xPs3D4THfgSj7+wr
 ckxC2m+d3F5fn0EDfN3ORjvXkjZgmvBRqpuYmsrWnpdRp6qDq0MRm16syU9SQAf+ZUIY
 W2izc/HJzG6ex+uYmamU9eSR+hFn17U8GbqPUe1IaSOGmZ1Ev2l1pF7bdtPjMeyK2h7D
 bcDUSHRE0PuC+62v7Dw8wh90XFbWolyNqX/MfUix1svnOUFPwnheaWPQs5bEsB8THhq+
 0cFzMP5/XzMMGxKSpidw44mCpd5kiBgf1yVogCH20z9crBqX7LDwfuPZzyFfkj4TGXUE
 dMxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8ekpSY9c7QnOcMFmDs37gVV4axd0feLHTPrUgeJgRzzXzxy6NxA62RYeVr3Q+52amimJFSCmBvCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgEUTr1JcmwZFeCkTfe0/Xr2qX+YVXuUbI4lgPMfBpomV+02lk
 JBzaPNIfWzXouPCj3BJMz2MTvDWgxbRXsTZ9966KjoFmumhT3r7ir1rXGp4aBWOZGvg=
X-Gm-Gg: ASbGncsM1FaZF8CnMTMrYnzzG9uZRDSZg1itWdR3jiNCMUokSfK/I3p/NQenXsnXsZJ
 p1XRrUjKnDRZ5Vg3joDvQuFJLTuH0yU7GLw+vUsFCEGLy0j5vvXl+1LKooatc3Rmsm570TN/rS8
 FgdTv3p8SufUDtjlgDs0O/zo/hLlV6l7Sc93BYiVhqF/TdPMJVzyQKUbkxdyJuTxjX5BK129pTx
 j3vlPQp62TtXPKOcwRaWv0Co6BvQCjklzFN9o8FiHh2jU5AxKUjOX5Z1OBdvFV+8JheFokzXhAd
 cgf/52VrrGydh8iYCXuz/FUAYMBl29czFSQzyDll+ZXozLALnIVC1Tgf/jcHypDHdketsj3cK1A
 5iRbPC0zx6+XWeYplEfng+CJBF99UUVf3kYJ/emcbJUtqWp0DPxg+MevpI/bYgyJh4aAUQaeAK9
 1LZFYMgNg86gs=
X-Google-Smtp-Source: AGHT+IFoRg+d+pL391Nz1AIVvXRJX3r10NwZrLU28XXz89idaEZx0Ay9ePoKh9ZhXKLOg5pBzi9jlw==
X-Received: by 2002:a05:6000:2086:b0:42b:4247:b07e with SMTP id
 ffacd0b85a97d-42b4bd90a34mr6567401f8f.25.1763046916668; 
 Thu, 13 Nov 2025 07:15:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f21948sm4476270f8f.43.2025.11.13.07.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 07:15:15 -0800 (PST)
Date: Thu, 13 Nov 2025 16:15:13 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Harry Wentland <Harry.Wentland@amd.com>
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
Message-ID: <aRX2AQYIX-FZ_xrE@phenom.ffwll.local>
Mail-Followup-To: Mario Limonciello <mario.limonciello@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Harry Wentland <Harry.Wentland@amd.com>
References: <20251112222646.495189-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112222646.495189-1-mario.limonciello@amd.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Wed, Nov 12, 2025 at 04:26:46PM -0600, Mario Limonciello wrote:
> The adaptive backlight modulation property is supported on AMD hardware but
> compositors should be aware of it in standard DRM property documentation.
> 
> Move the helper to create the property and documentation into DRM.
> 
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 69 +++------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h |  7 ---
>  drivers/gpu/drm/drm_connector.c             | 63 +++++++++++++++++++
>  include/drm/drm_connector.h                 |  8 +++
>  4 files changed, 80 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index f8b35c487b6c..3d840bef77bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1363,67 +1363,9 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
>  	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
>  };
>  
> -/**
> - * DOC: property for adaptive backlight modulation
> - *
> - * The 'adaptive backlight modulation' property is used for the compositor to
> - * directly control the adaptive backlight modulation power savings feature
> - * that is part of DCN hardware.
> - *
> - * The property will be attached specifically to eDP panels that support it.
> - *
> - * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
> - * to be able to control it.
> - * If set to 'off' the compositor will ensure it stays off.
> - * The other values 'min', 'bias min', 'bias max', and 'max' will control the
> - * intensity of the power savings.
> - *
> - * Modifying this value can have implications on color accuracy, so tread
> - * carefully.
> - */
> -static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
> -{
> -	const struct drm_prop_enum_list props[] = {
> -		{ ABM_SYSFS_CONTROL, "sysfs" },
> -		{ ABM_LEVEL_OFF, "off" },
> -		{ ABM_LEVEL_MIN, "min" },
> -		{ ABM_LEVEL_BIAS_MIN, "bias min" },
> -		{ ABM_LEVEL_BIAS_MAX, "bias max" },
> -		{ ABM_LEVEL_MAX, "max" },
> -	};
> -	struct drm_property *prop;
> -	int i;
> -
> -	if (!adev->dc_enabled)
> -		return 0;
> -
> -	prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
> -				"adaptive backlight modulation",
> -				6);
> -	if (!prop)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < ARRAY_SIZE(props); i++) {
> -		int ret;
> -
> -		ret = drm_property_add_enum(prop, props[i].type,
> -						props[i].name);
> -
> -		if (ret) {
> -			drm_property_destroy(adev_to_drm(adev), prop);
> -
> -			return ret;
> -		}
> -	}
> -
> -	adev->mode_info.abm_level_property = prop;
> -
> -	return 0;
> -}
> -
>  int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  {
> -	int sz;
> +	int ret, sz;
>  
>  	adev->mode_info.coherent_mode_property =
>  		drm_property_create_range(adev_to_drm(adev), 0, "coherent", 0, 1);
> @@ -1467,7 +1409,14 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  					 "dither",
>  					 amdgpu_dither_enum_list, sz);
>  
> -	return amdgpu_display_setup_abm_prop(adev);
> +	adev->mode_info.abm_level_property = drm_create_abm_property(adev_to_drm(adev));
> +	if (IS_ERR(adev->mode_info.abm_level_property)) {
> +		ret = PTR_ERR(adev->mode_info.abm_level_property);
> +		adev->mode_info.abm_level_property = NULL;
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  void amdgpu_display_update_priority(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> index 2b1536a16752..dfa0d642ac16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> @@ -54,11 +54,4 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
>  int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
>  				      struct drm_scanout_buffer *sb);
>  
> -#define ABM_SYSFS_CONTROL	-1
> -#define ABM_LEVEL_OFF		0
> -#define ABM_LEVEL_MIN		1
> -#define ABM_LEVEL_BIAS_MIN	2
> -#define ABM_LEVEL_BIAS_MAX	3
> -#define ABM_LEVEL_MAX		4
> -
>  #endif
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..376169dac247 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2603,6 +2603,69 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>  	return 0;
>  }
>  
> +/**
> + * DOC: integrated panel properties

Thanks for doing this, but just moving the function isn't enough. Aside
from what Jani said there's a few more things that are more about the
technicallities of making good docs for uabi.

- We want proper kerneldoc for the function drm_create_abm_property() like
  for any other function the drm core/helper code exports to drivers.

- The property documentation needs to be moved (or included, but I think
  moving is better) so it shows up in the generated html docs at the right
  place with all the other connector properties.

- We need a mention from the 2nd place to the function (which should
  result in a working hyperlink in the generated docs, please check that
  by generating the docs and confirming with the output) so that driver
  authors can find this. Als the function needs to link to the enum (which
  also needs kerneldoc) and the other direction so that docs are easily
  discoverable.

Thanks a lot!

Cheers, Sima

> + *
> + * adaptive backlight modulation:
> + *	Adaptive backlight modulation (ABM) is a power savings feature that
> + *	dynamically adjusts the backlight brightness based on the content
> + *	displayed on the screen. By reducing the backlight brightness for
> + *	darker images and increasing it for brighter images, ABM helps to
> + *	conserve energy and extend battery life on devices with integrated
> + *	displays.  This feature is part of AMD DCN hardware.
> + *
> + *	sysfs
> + *		The ABM property is exposed to userspace via sysfs interface
> + *		located at 'amdgpu/panel_power_savings' under the DRM device.
> + *	off
> + *		Adaptive backlight modulation is disabled.
> + *	min
> + *		Adaptive backlight modulation is enabled at minimum intensity.
> + *	bias min
> + *		Adaptive backlight modulation is enabled at a more intense
> + *		level than 'min'.
> + *	bias max
> + *		Adaptive backlight modulation is enabled at a more intense
> + *		level than 'bias min'.
> + *	max
> + *		Adaptive backlight modulation is enabled at maximum intensity.
> + */
> +struct drm_property *drm_create_abm_property(struct drm_device *dev)
> +{
> +	const struct drm_prop_enum_list props[] = {
> +		{ ABM_SYSFS_CONTROL, "sysfs" },
> +		{ ABM_LEVEL_OFF, "off" },
> +		{ ABM_LEVEL_MIN, "min" },
> +		{ ABM_LEVEL_BIAS_MIN, "bias min" },
> +		{ ABM_LEVEL_BIAS_MAX, "bias max" },
> +		{ ABM_LEVEL_MAX, "max" },
> +	};
> +	struct drm_property *prop;
> +	int i;
> +
> +	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				"adaptive backlight modulation",
> +				6);
> +	if (!prop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		ret = drm_property_add_enum(prop, props[i].type,
> +						props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	return prop;
> +}
> +EXPORT_SYMBOL(drm_create_abm_property);
> +
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
>   * @connector: connector to create the Colorspace property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..644c0d49500f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2454,6 +2454,7 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
>  					     struct drm_connector_state *new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> +struct drm_property *drm_create_abm_property(struct drm_device *dev);
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>  					     u32 supported_colorspaces);
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
> @@ -2563,4 +2564,11 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>  	drm_for_each_encoder_mask(encoder, (connector)->dev, \
>  				  (connector)->possible_encoders)
>  
> +#define ABM_SYSFS_CONTROL	-1
> +#define ABM_LEVEL_OFF		0
> +#define ABM_LEVEL_MIN		1
> +#define ABM_LEVEL_BIAS_MIN	2
> +#define ABM_LEVEL_BIAS_MAX	3
> +#define ABM_LEVEL_MAX		4
> +
>  #endif
> -- 
> 2.51.2
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
