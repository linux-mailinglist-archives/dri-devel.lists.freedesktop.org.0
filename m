Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9968CE3A5
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F810E212;
	Fri, 24 May 2024 09:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gWFmVtE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36D410E212
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:41:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso10459756e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 02:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716543681; x=1717148481; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+oY7M7YZjt3nSc9aAtwKQQ6ONpLbdvzagMOQYIR5S90=;
 b=gWFmVtE0lA/El64FUMbdtYP6A4gyKVH6+ducNr+h7DHWNrGyQ5QbNu2YqIXL/88bZa
 5eIM2DwZoZUNvnG7/5xLKK+nCGaijwzHoPo592VkrScMa71tWpNxEJt+ZEgiTnAQ4onF
 uq+mG2CYLcZ8cVAT7aRsu/fK/XDbWdHp4wvI6IAoMoMZLpyJYnkr3upvtldzVS3mDvXu
 BCLhuU7BT855N+96XU3rqKKrVJ9WTK1NAJIniT3qI3rW9zplZ+Rk9WI4jjdgHy2LWiE7
 qO2uWKOWx6jexlTjBSQPQ248rLxRiy4nsqTevPsBPEqW1g/o8xDFD1VtODtawXXsvLPQ
 v4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716543681; x=1717148481;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oY7M7YZjt3nSc9aAtwKQQ6ONpLbdvzagMOQYIR5S90=;
 b=V4b558/up2Qh9yFA/LbZ7wqnYa1ONkJRygwx0s901KxlYmNDuH8U2od4iNellL8sHX
 gJrxqOphSofAbnpz98Uw6FoMUyowPKol/QxkgiCc4kEOor42yzwV0Bp3lIgmgkam9Ijp
 yBaHrY3CJDVBvu9MVCjA5o5gGzU+uTFt97XzIAH7q59RTLbTfOBb1TvlayiKb9Xg5gaV
 SoWBP+G6485zQo/PButmHkh5Wb87M5UsFlM4Dman5Bhxn05yAB6pD4RBdyON9grFS6qM
 yenCyHhp0D12Z3CFJEf85gnzMtgQ+vi0tZJY2W0K5q/Z62HKTNzUXKyxd5HXgwBzJcex
 CKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXws+Yv+FhDAeSZ8atRF8TqTk3cz4KrT83UKDmtzLG3snqNZxFfcG7AJC9y9r/qJsUed9jsN0vyLG5lapzwi1/BLNJho15GFR70NlOHpHc
X-Gm-Message-State: AOJu0Yw1XQAOG3nKOvcQcaIDJ4Mg58yrHHpmj1ldPesfpToMS0i+vI3s
 7LQUTHK3ES2OJqeW0dPMpzEvRTgLPWFDI4K0UYCi/GpsVsMg48YFG5wZwwv9KeE=
X-Google-Smtp-Source: AGHT+IFphI7dLNDBXoZCYGKNm7IhUn6LAbs1T5hWe8EjxPXqehUTVm8QYNnVsSO9sqL42C2JsYW2rw==
X-Received: by 2002:a05:6512:36d3:b0:51b:18f7:6a9e with SMTP id
 2adb3069b0e04-529666d5df3mr886961e87.45.1716543680630; 
 Fri, 24 May 2024 02:41:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529712f0a9asm137698e87.273.2024.05.24.02.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 02:41:20 -0700 (PDT)
Date: Fri, 24 May 2024 12:41:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org, mripard@kernel.org, dri-devel@lists.freedesktop.org, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com
Subject: Re: [PATCH v3 1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <y6ersd72tp2d6k4i2hja7bg37lahnvye2qion67urxeakw6rju@dher7oomt2ks>
References: <20240524093509.127189-1-j-choudhary@ti.com>
 <20240524093509.127189-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524093509.127189-2-j-choudhary@ti.com>
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

On Fri, May 24, 2024 at 03:05:08PM +0530, Jayesh Choudhary wrote:
> Currently, mode_valid hook returns all mode as valid and it is
> defined only in drm_connector_helper_funcs. With the introduction of
> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
> bridge_attach call for cases when the encoder has this flag enabled.
> So add the mode_valid hook in drm_bridge_funcs as well with proper
> clock checks for maximum and minimum pixel clock supported by the
> bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 37 ++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 2fbeda9025bf..bae551e107f9 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -163,6 +163,14 @@
>  
>  #define SII902X_AUDIO_PORT_INDEX		3
>  
> +/*
> + * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
> + * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
> + * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
> + */
> +#define SII902X_MIN_PIXEL_CLOCK_KHZ		25000
> +#define SII902X_MAX_PIXEL_CLOCK_KHZ		165000
> +
>  struct sii902x {
>  	struct i2c_client *i2c;
>  	struct regmap *regmap;
> @@ -310,12 +318,26 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	return num;
>  }
>  
> +static enum
> +drm_mode_status sii902x_validate(struct sii902x *sii902x,
> +				 const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>  					       struct drm_display_mode *mode)
>  {
> -	/* TODO: check mode */
> +	struct sii902x *sii902x = connector_to_sii902x(connector);
> +	const struct drm_display_mode *mod = mode;
>  
> -	return MODE_OK;
> +	return sii902x_validate(sii902x, mod);

There is no need to. The drm_bridge_chain_mode_valid() should take care
of calling bridge's mode_valid callback and rejecting the mode if it is
not accepted.

>  }
>  
>  static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
> @@ -504,6 +526,16 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> +static enum drm_mode_status
> +sii902x_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{
> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +
> +	return sii902x_validate(sii902x, mode);
> +}
> +
>  static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.attach = sii902x_bridge_attach,
>  	.mode_set = sii902x_bridge_mode_set,
> @@ -516,6 +548,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
>  	.atomic_check = sii902x_bridge_atomic_check,
> +	.mode_valid = sii902x_bridge_mode_valid,
>  };
>  
>  static int sii902x_mute(struct sii902x *sii902x, bool mute)
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
