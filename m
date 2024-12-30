Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C79FE622
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 14:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BC310E4BB;
	Mon, 30 Dec 2024 13:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vZ2U3zGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5B810E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 13:00:45 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aa692211331so1756306766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 05:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735563584; x=1736168384; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
 b=vZ2U3zGQUjWZAGBQGPSxo8iYYx0ZLSVPD+WKQlrx7hVZWfK42GpyFkyFnblKO/Mr60
 Q1HK8f3wmnDSRECPb4CeBszFfoQZat1b/XA91E/E24f2HplkXvxY0Rl0AtTPk/ton9fF
 44MthOISK1aBdU0YeSFg4BZPdnVKqpWLfcJc7H/wX7Jhqtq035En2KeUsmZnTvUYAza7
 lF0vLTSOLNDH0Nc8kfniZZCiWk8r6JmxPJQl00ygULAXrB+YbyZhx/JQHte9l1Ini5Or
 haYuh3DxDygQ91fnk5npTfbwnEBp/xLKDaBX1OWbZeQpFg6/WnYGtj8QQHcp2ClNmpyD
 USPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735563584; x=1736168384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwalPoVfhXMCQGFYr9ryIpasntXwzfLlG4s9wl797Go=;
 b=krpLVkKXgJXNpGsRPe4GhDCtzKya+FGl5OckbHXBVS2IIxkAqw+zNR3QZODiVUrIhW
 xq+EYzFUKd4UmdMKlAOr091rtkHn2y8WqwKCRhhldpflH5g1F1poY7NFYaNdQLGFIQBB
 Krw1hlsjmV2MlVOJNGHD5O0a3Wq6HL3QdOqmE4kXJr/94N8K2RuBCDY0/Aa25uQu9da2
 KJNhR7uaMGrKKSInPR3KWp2IMZhyWKIPoEqmCM2HKxAWzb5t2/96t5bMphvSZvSVF6lo
 /2VNixmBb1UfaAfJF1H3J2apsxZljoEXjhQCZvY2VgjINTP7rQDLHU4yk7v5C8c+6onh
 xqtQ==
X-Gm-Message-State: AOJu0Yy0ByMqJydQKQtocHXLxbrIvWROrwqW7stNZKJiWrV1xZ4MPWh8
 92papRKrRZTRqzlYSnhUzTPINQp21vQ6xHsvgi4r1ktWPjIsvb+Gisg10BXUYrIuN4BrymRbW6r
 P
X-Gm-Gg: ASbGnctOKbypQc1PhCa3EqWDJGyTv37w2lOO9qjfUt2ztFE6rTpfUWgi7TqC26o1wMG
 V4y1Bn3avWidSiPKZDzVJRTcolAGhWUE4BIP18Bp1db/kiQ5rpXozJaB0we67WoJhmwe4rdC+rV
 QzR+KJeTgu8CCTCZCmyBqgft/ar/pXuO9laPmwPoBZHZtlgxWrnsrVzykSUcQytWXYKIcPbjRfC
 dv8pyT4aiFmqZAMVRWKhPQjmEDAzuvBS+2jKjxIOiTYf6Lr0rXoYnGs4DKyLX+Qg8FSsvhKv0s8
 QcxnSNa++LV72+tqpBp3OAWr+65HM5q0lj2V
X-Google-Smtp-Source: AGHT+IGs664Z6a1VXnL1IU1qIYV7pMmpsbWRxTp2wEqrbi2vMMk6KM7ZX9fIIcaItp6yhkS4k5KJrg==
X-Received: by 2002:a05:6512:10ce:b0:540:2fbb:22fe with SMTP id
 2adb3069b0e04-54229474ebcmr9865558e87.26.1735561841796; 
 Mon, 30 Dec 2024 04:30:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6073sm3157778e87.27.2024.12.30.04.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:30:40 -0800 (PST)
Date: Mon, 30 Dec 2024 14:30:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v8 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <kwipz3wzydihroelii6enzxv63yyfuidmrua2fzhdvjdbjpqqp@s66fwhbbvcs5>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-10-victor.liu@nxp.com>
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

On Mon, Dec 30, 2024 at 10:11:57AM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * Get DE/FG/TC device instance numbers through register start addresses of the
>   devices, instead of compatible strings. (Dmitry)
> * s/shdld/shdload/ for DE IRQs. (Dmitry)
> * Drop id member from struct dc_de. (Dmitry)
> * Add dc_de_post_bind(), to avoid dependency on the component helper's way of
>   implementing component binding order. (Dmitry)
> 
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> * Select REGMAP and REGMAP_MMIO Kconfig options.
> * Fix commit message to state that display engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>   KMS routine to initialization stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 177 +++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  56 +++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  57 +++++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 376 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 141 ++++++++++++
>  10 files changed, 853 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
