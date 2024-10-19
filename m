Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A359A4E8C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBBD10E29F;
	Sat, 19 Oct 2024 14:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WHnTcBfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760AF10E29F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:14:25 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb5a9c7420so30579691fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729347264; x=1729952064; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sZQKGhids4Q82uDym0yxnTsBolQaUr1BmnikbSV6eUY=;
 b=WHnTcBfHeB+STZ9UNs6cZbbnEQufEYi7hgWbb/UdzMfKDzsxgH4+Jy21zwW1UPEbO3
 428pOL1Gf61m438cYh5sxfRmUUo74upW6qX35xTk5ASsDIa3eXMZiGZk42FS8jqZw9hS
 cmIjrZQ6Vpg+HdHe98IQ3C0YtE3kjic7mbA4NPI16Dv6EYQKMaI7ao4Dhm/yFSj3nTco
 3h13rxMQqYKgdL4q/zAPDoRUuWK+GWyD01F/xL7zEsc8/YwZrdNP28Ck28aFx0tXM8jG
 9bCSnhTf8CnLYydrHDqgi+kDnoes/GrwJ1YyPmy7qEmaiHbDloj9ihp8k51ZbDSaHQNR
 QuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729347264; x=1729952064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZQKGhids4Q82uDym0yxnTsBolQaUr1BmnikbSV6eUY=;
 b=QZQekaQvHWoeLGHx7kbqhCjnRWwRkl5AZ3TYLQvBXdIa32uhss/cr8WsuXzUDyaDkC
 XFlqcdF+asMCZyqaDPFFbd9DGHkfQP98TX1/VLEEBTp9s5FHxnEJmwsSXLqWDdgYtw/Y
 tOniBk7sEItR41M1qnGPmZZqtkQ+qp6Wm56Eg9sh9S7ADAoa3yBTKugyCT3rHi07+6Ms
 m3gd1e89tHmqm5iHzV9HcE7qcHAuE+vJy+3lxPHk7YQNAmSdE2Qo9rpSUw4AN+RcMz+f
 KC0WWoYPM26TU8KbCfXbZu2PwHiKscb4dZzVBzQZMGkQgZDzS2exqhKWDwvSLsaln1KV
 cHyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF8CmA6ma9O/4SEcM7lpC85WYOE+P5VTkxsMyhZYHpzaOsluzvWO3z/31rYw8pddQYUkG8AL1Gi7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkJJZjzqialC63rcPNQDv4VegiLrhoi9Jn5Ws3/AjIyAXTEzny
 Kz+X2fHwuzMM1YQ4G0YfBbZQKbKNOAzNyXfR2HGh4IUzBZyYIIhCyLU/2g1fdrY=
X-Google-Smtp-Source: AGHT+IGzHb1rffWyHrZTm2xiGlwmytyCfNCauniR0HmfW31srODVd8fWJi7jNSl4XxdH6Wu9L+Un6g==
X-Received: by 2002:a2e:1309:0:b0:2fb:8df3:2291 with SMTP id
 38308e7fff4ca-2fb8df322ddmr11397241fa.16.1729347263486; 
 Sat, 19 Oct 2024 07:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb80a082b8sm5061001fa.101.2024.10.19.07.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:14:23 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:14:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Message-ID: <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-9-ryan@testtoast.com>
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

On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The mixer in the DE3 display engine supports YUV 8 and 10 bit
> formats in addition to 8-bit RGB. Add the required register
> configuration and format enumeration callback functions to the mixer,
> and store the in-use output format (defaulting to RGB) and color
> encoding in engine variables.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v4..v5:
> - Remove trailing whitespace
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c  | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sunxi_engine.h |  5 +++
>  2 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 252827715de1d..a50c583852edf 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -23,7 +23,10 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#include <uapi/linux/media-bus-format.h>
> +
>  #include "sun4i_drv.h"
> +#include "sun50i_fmt.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
>  
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> +
> +	if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
> +		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
> +	else
> +		val = 0xff108080;
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +
> +	if (mixer->cfg->has_formatter)
> +		sun50i_fmt_setup(mixer, mode->hdisplay,
> +				 mode->vdisplay, mixer->engine.format);
> +}
> +
> +static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
> +{
> +	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> +	u32 *formats, count;
> +
> +	count = 0;
> +
> +	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
> +
> +	if (mixer->cfg->has_formatter) {
> +		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +	}
> +
> +	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num = count;
> +
> +	return formats;
>  }
>  
>  static const struct sunxi_engine_ops sun8i_engine_ops = {
> -	.commit		= sun8i_mixer_commit,
> -	.layers_init	= sun8i_layers_init,
> -	.mode_set	= sun8i_mixer_mode_set,
> +	.commit			= sun8i_mixer_commit,
> +	.layers_init		= sun8i_layers_init,
> +	.mode_set		= sun8i_mixer_mode_set,
> +	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
>  };
>  
>  static const struct regmap_config sun8i_mixer_regmap_config = {
> @@ -456,6 +499,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	dev_set_drvdata(dev, mixer);
>  	mixer->engine.ops = &sun8i_engine_ops;
>  	mixer->engine.node = dev->of_node;
> +	/* default output format, supported by all mixers */
> +	mixer->engine.format = MEDIA_BUS_FMT_RGB888_1X24;
> +	/* default color encoding, ignored with RGB I/O */
> +	mixer->engine.encoding = DRM_COLOR_YCBCR_BT601;
>  
>  	if (of_property_present(dev->of_node, "iommus")) {
>  		/*
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
> index c48cbc1aceb80..ffafc29b3a0c3 100644
> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -6,6 +6,8 @@
>  #ifndef _SUNXI_ENGINE_H_
>  #define _SUNXI_ENGINE_H_
>  
> +#include <drm/drm_color_mgmt.h>
> +
>  struct drm_plane;
>  struct drm_crtc;
>  struct drm_device;
> @@ -151,6 +153,9 @@ struct sunxi_engine {
>  
>  	int id;
>  
> +	u32				format;
> +	enum drm_color_encoding		encoding;

Should these be a part of the state instead of being a part of the
sunxi_engine?

> +
>  	/* Engine list management */
>  	struct list_head		list;
>  };
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry
