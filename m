Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721389E2972
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984A10E474;
	Tue,  3 Dec 2024 17:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TD39L6sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3536710E474
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:37:07 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so5146875e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733247425; x=1733852225; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0ycjfZzwnPcCeUDtH0/9f2OzsKqNdVBQ5imE6kMpyI=;
 b=TD39L6sfQBM9nBXd2KB2r9T5Wh363aJDzRNQmZqx+vh9Dy5N9dS+gb6mZFLjE+8PMA
 9PU05mw1rzLvvJoxe7PG+D0lsikzpbH8u9Zmwu+Pt3R0QiJt5Hk+MirbtSEgCX8stf40
 AgiXX9sAlR3bjx/QQPVe3BwQtHpAANBdsxd3G4tIWkOesgCa8DqWo8bPRGf1XEHVo/Ey
 iNIchj6+K3vbq6ZQaTaKBn9MBJaSxqcY0lgMHv3eSDWtomW8kI/k36i77z92+y9NFFG3
 gQGHyKtyc9mjEWmOCe03gz5K0VSsThUx19/bTNHtjt/w3DalmyG2FRC2SJum3wn72MQf
 ISlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733247425; x=1733852225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0ycjfZzwnPcCeUDtH0/9f2OzsKqNdVBQ5imE6kMpyI=;
 b=ElSgTI4dNNH1xNXxzfNOjj76FWMq6SqCN0r/gbCXpoYk/HQVwRQGuFeaiyeH00U7uv
 VOuDGq0qTFiuWnhswsKhE+8zRXdXbrA7WrIRoMiUTF9Fj+gfJsBQ4i7yUVISyLtOwKa3
 N9ftKw936i3b10lP0QpO0cfE8HSA5jhU4wr4GXp2swDS1sVCjhUbSCVNCvkVfM6tYa0B
 +1raZiM6CFsdBFKN3WidguMcaS1ZEuz0Da6EoMTaT9vz3qQnjPzTiTgth7UKP+Pd1xOk
 pBgnMCl+r2zKW8F/Ce+QO2RIzcU5zjNmhXOxXsy2X6VwxCqbX8inlWHgy+h7s43I7nrL
 OVgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBJu7yQbIzTbQdS0mIZrwO9yx/Bs4gX36yDIgyJgJ7spv9j32No190jie9nK4ATd06O0p8d3gPzUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx46kIEHUvf7394md3PnTEFwMqvaFrTg4Ql0nUs+3ZBk91zSbfG
 sdCh2MbgJHgTkbru4sb27gRXOHz2PO2qS6EGIFbkBA25lNqZ+36Y8OP0n85ZJOo=
X-Gm-Gg: ASbGnctJsdLh0EiuvSAFxy6VVqG6TJN70jsFmJ2HwfSuiDbGEOCU9Wzn0YbYybyZgNw
 AMsbCkK9nyJc1xeyiGWJXWhaWKE1/iMzPcK4KMIkErLgYginOwoCPEBi/iX7b+UC9Uh72xhmigE
 6Y/wI9GAww8ljipGG0M+AAkHwJVIJPVgRfkcSmhKuUyCtwiTe885T5FJyMhgdt0s46tx1UD+3KE
 8mejPGFXm0SiL+Ou5kIVwP61iZVFBbq556o28MVvH2md2NLWsNRcYDXD4yNvIHBlM9dbOU/eSfB
 L1n6d4j75nXMn2MMoNz+nhnlJPg3yw==
X-Google-Smtp-Source: AGHT+IE+iThB2rDkPXhvDwKDCV995m9FRY0n6NLKd/YWSdF2FKr6uqn66k8o0X2h8rNCUXaQsEfXfg==
X-Received: by 2002:a05:6512:4028:b0:53d:ec9a:4e6d with SMTP id
 2adb3069b0e04-53e1b8b6f05mr505370e87.46.1733247425267; 
 Tue, 03 Dec 2024 09:37:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443385sm1916238e87.95.2024.12.03.09.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:37:04 -0800 (PST)
Date: Tue, 3 Dec 2024 19:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 biju.das.jz@bp.renesas.com, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
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

On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA and VESA input formats.

For the patch itself,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A more generic question: is the bridge limited to 4 lanes or does it
support 3-lane or 5-lane configurations?

> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index cbabd4e20d3e..83d1db29157a 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -48,6 +48,7 @@
>  #define  REG_COL_DEP			GENMASK(1, 0)
>  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
>  #define  OUT_MAP			BIT(4)
> +#define  VESA				BIT(4)
>  #define  JEIDA				0
>  #define  REG_DESSC_ENB			BIT(6)
>  #define  DMODE				BIT(7)
> @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
>  	fsleep(10000);
>  }
>  
> +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
> +{
> +	switch (input_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		return true;
> +	}
> +	return false;
> +}
> +

-- 
With best wishes
Dmitry
