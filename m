Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A523BE82
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 19:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6596E25B;
	Tue,  4 Aug 2020 17:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262146E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:04:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f1so37554887wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SJmkw0nSLw4m3B98dhc6CnT8NG6TGxfacruv3nV7TWU=;
 b=lg5GIsimCkxV7EjRYy8NYITfC9QhMBu3RqWboYBTGvhFuEImNVBwDL+dV4HsekGAuU
 auGMXxfRHXJBILOHQHfN8LY6Mrr8PJlm4CVMfyxFVMSSGANeI0uKnLOEPxOAnAKHhsgu
 bnIvvx6n6m2aWIaVLQyhagT+fJ2D858sHuyr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SJmkw0nSLw4m3B98dhc6CnT8NG6TGxfacruv3nV7TWU=;
 b=merhOY/Xbx0F9T/h03h86VmjAtGh6azF9KDCGofpmNepZYs4ODdI1Z0mCpBEqxwBCS
 saA/2NF5qb/7IzuRpV1UWVQ+bLfwLedcG0doMFIG2Sr3nzgK8rZFELTR1+nIXiIkp2dx
 G55WpZ95WbgunGkEfEGMjOiEKkOEr4ZbqqCS6lGgih5JuSgPOmj476FpvR/97GhBiZgL
 9aawrFpAdlDo+HvHcqFrq3oqlq7KtH9RsL44AQC8Rwj9xDkzpZaiuaq5VeSB5J+VR9w7
 vGFgxLZGRRUGRyzrHBWUiZ2TZxvQUaSgIVer5KHuPE5MaLfjyYgo9msJ/XeJsabYQIIA
 rP7g==
X-Gm-Message-State: AOAM532CIihpeysuiYBK0+Si2rRZIkv7igKfKV93eamnnGpyh5i1mYBe
 vVAJmbZybqPC5aee0Zkrs6OJcg==
X-Google-Smtp-Source: ABdhPJw1rUyWxj/rQ7s0pO1/ZBzj/DtAE619tC7a39yGBjBSweJ42T83q5rRWfVBHySS3qfqj7D1pA==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr19803357wrr.353.1596560653827; 
 Tue, 04 Aug 2020 10:04:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k204sm5489228wma.21.2020.08.04.10.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 10:04:13 -0700 (PDT)
Date: Tue, 4 Aug 2020 19:04:11 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 10/22] drm/panel: raydium-rm67191: Backlight update
Message-ID: <20200804170411.GO6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-11-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 02, 2020 at 01:06:24PM +0200, Sam Ravnborg wrote:
> - Replace direct access to backlight_properties with
>   backlight_get_brightness().
> - Use macro for initialization
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> index 313637d53d28..5553db385dd5 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> @@ -479,7 +479,7 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
>  	if (ret < 0)
>  		return ret;
>  
> -	bl->props.brightness = brightness;
> +	backlight_set_brightness(bl, brightness);

This sounds like a bad idea, again because this overrides the software
brightness value potentially when the backlight is off. Althought that's
checked a bit higher up, so not too terrible.

I'm also feeling like a helper for standard mipi dsi panel backlight would
be great, it's pretty much all the same code.
-Daniel

>  
>  	return brightness & 0xff;
>  }
> @@ -495,7 +495,7 @@ static int rad_bl_update_status(struct backlight_device *bl)
>  
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, backlight_get_brightness(bl));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -539,10 +539,10 @@ static int rad_init_regulators(struct rad_panel *rad)
>  
>  static int rad_panel_probe(struct mipi_dsi_device *dsi)
>  {
> +	DECLARE_BACKLIGHT_INIT_RAW(bl_props, 255, 255);
>  	struct device *dev = &dsi->dev;
>  	struct device_node *np = dev->of_node;
>  	struct rad_panel *panel;
> -	struct backlight_properties bl_props;
>  	int ret;
>  	u32 video_mode;
>  
> @@ -588,11 +588,6 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
>  	if (IS_ERR(panel->reset))
>  		return PTR_ERR(panel->reset);
>  
> -	memset(&bl_props, 0, sizeof(bl_props));
> -	bl_props.type = BACKLIGHT_RAW;
> -	bl_props.brightness = 255;
> -	bl_props.max_brightness = 255;
> -
>  	panel->backlight = devm_backlight_device_register(dev, dev_name(dev),
>  							  dev, dsi, &rad_bl_ops,
>  							  &bl_props);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
