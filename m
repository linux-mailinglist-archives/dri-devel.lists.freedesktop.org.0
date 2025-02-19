Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248BA3C030
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72D10E2E2;
	Wed, 19 Feb 2025 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="K5/ISyCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6109C10E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:41:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-439950a45daso12198415e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739972512; x=1740577312; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhEsWoeyFhMZ+H0YbRGARkl/BdUesonQu+oufx1Ijlo=;
 b=K5/ISyCsEKyjyU/AKdTgvNWNGXfxbs1W6bZoSsbM22R//9cHK7tD/MCblBIw8ZMv6k
 hka/gIfksid3RRQlH6feyK3oIRrdETsQN4YNqg7JJfOs8TiLpsYKo5Q4tDuapDkA3Z8c
 +kTHmxS+Zc52JOcH60jyUaAeyO8/7OTH3lpas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972512; x=1740577312;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhEsWoeyFhMZ+H0YbRGARkl/BdUesonQu+oufx1Ijlo=;
 b=izyL1jpGZhHa3PUVrMa0Bi/iH3Orq5r2qNn3d0Htxub0YK4olXszh2IXkJV+c0dMmw
 Eu38PbtmnZfd72SVGhenQ7Revwq4TyA+UQipUGpAKUSyfnmzGOlljpmbmz3dduo9RVav
 SD5q9qsChz+Qv/7uUo0yhDMgsCp7Ls8qcy3g6FXAnUZt6XE+DtoPmC37lk1jRtMTyogf
 0YzeZ/N9oN+SZKxPr9fb/N79kXyoswWu/y18GGcQAtSsSohND4qsTRzWhYlMwLEYOiIg
 GlROCgps47djcDRXA7qjXs8hnwbM+R9Xo/9jWEQDnc2Spjleyq7+fphObqZ3WOzscb0d
 60uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmTqcH++5H55k1BAe19xrdMuiubROM+uUDc3fi6Z/+aslY5AxmxhK7sDoXZ5ejhRLEuXaPBmxwwn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNNVCg9bXA+MwE/y+hb+T/SJ0SRNuHDSc4ZeKPSbwSVjmOTnB1
 7vM0CzHv+gUx0cJ3Ixgq2tkava7XBGf5mFpGV7526b33ssoXkC/4T+NMk1YW4cU=
X-Gm-Gg: ASbGnctUjAhpNsmBiPK8Ihbp+jRTFJ6rKhg34702aKkNR5gWWEIJ1//kQaBR4iYOx+T
 OPbdfRycJQS5NYlkHTTrgtkSSbiKfUuzZ0sAiNApf4hKH+cDMeRGdhkTAoTHTIxH9hS5O0wVa6y
 N4mW4TaTA1DVzOupkWB9zS/w+VAecEa6xQcei3TYKQv5briQxYYmqkkhK9kp/wnqc0iZ43M5Tt2
 nHmiD9/bpAPYeBdQeTZrPHvhSYP4+QYoEXfHWTWlNRBWdBUXbVRnpxjb8LZJ8uYbI98dZKQZ5YD
 yhmjaBWt+G+rS2soFF+VJm+rsvY=
X-Google-Smtp-Source: AGHT+IH5SPDJC9pS46sc9lnXQknme1kBqPSFPC97vyzoPEWE/sFG6YIJSWi/4TZyqRhIbFPVeJg7KA==
X-Received: by 2002:a05:600c:1c12:b0:439:9a5a:d3c4 with SMTP id
 5b1f17b1804b1-4399a5ad56amr28220925e9.2.1739972511749; 
 Wed, 19 Feb 2025 05:41:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4491sm17570552f8f.7.2025.02.19.05.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:41:51 -0800 (PST)
Date: Wed, 19 Feb 2025 14:41:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <Z7XfnPGDYspwG42y@phenom.ffwll.local>
Mail-Followup-To: Herve Codina <herve.codina@bootlin.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203145824.155869-3-herve.codina@bootlin.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Mon, Feb 03, 2025 at 03:58:21PM +0100, Herve Codina wrote:
> drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> 
> This resets all active components available between the CRTC and
> connectors.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  2 ++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 8ed186ddaeaf..cac807df8a86 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3363,6 +3363,47 @@ int drm_atomic_helper_disable_all(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_disable_all);
>  
> +/**
> + * drm_atomic_helper_reset_crtc - reset the active outputs of a CRTC
> + * @crtc: DRM CRTC
> + * @ctx: lock acquisition context
> + *
> + * Reset the active outputs by indicating that connectors have changed.
> + * This implies a reset of all active components available between the CRTC and
> + * connectors.

I think you definitely want a

	Note: This relies on resetting &drm_crtc_state.connectors_changed.
	For drivers which optimize out unnecessary modesets this will
	result in a no-op commit, achieving nothing.

> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
> +				 struct drm_modeset_acquire_ctx *ctx)

So this is pretty close to DP drivers doing link-retraining when
reconnecting a cable. Would be really nice if that could also be rolled
out there where it fits, and maybe augment the documentation accordingly
so that dp helpers point at this?

Either way would be good to extend the kerneldoc a bit to explain what
this is good for. Either way.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
> +{
> +	struct drm_atomic_state *state;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	state = drm_atomic_state_alloc(crtc->dev);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->acquire_ctx = ctx;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state)) {
> +		ret = PTR_ERR(crtc_state);
> +		goto out;
> +	}
> +
> +	crtc_state->connectors_changed = true;
> +
> +	ret = drm_atomic_commit(state);
> +out:
> +	drm_atomic_state_put(state);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
> +
>  /**
>   * drm_atomic_helper_shutdown - shutdown all CRTC
>   * @dev: DRM device
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 9aa0a05aa072..53382fe93537 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -139,6 +139,8 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
>  
>  int drm_atomic_helper_disable_all(struct drm_device *dev,
>  				  struct drm_modeset_acquire_ctx *ctx);
> +int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
> +				 struct drm_modeset_acquire_ctx *ctx);
>  void drm_atomic_helper_shutdown(struct drm_device *dev);
>  struct drm_atomic_state *
>  drm_atomic_helper_duplicate_state(struct drm_device *dev,
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
