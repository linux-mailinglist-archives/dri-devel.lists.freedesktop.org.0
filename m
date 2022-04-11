Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF04FC17A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F155A10E1B4;
	Mon, 11 Apr 2022 15:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4534610E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:51:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so3809190wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YS8EHgwmMuCqhyig1rAaWaRxXw3QqtoY27L8Jll0TfY=;
 b=As31xpNOOXW4cOL7/qqPuWMExguKMbXyka+Vh9C9W/8PbSFivYI75aVr2GVZmJcjgr
 kV8l4qy2Tg7yf0ZL0HMf5UlajwgEf/6IO/yB2BV/rekMrDTVP6T54LENY+PjKv515hDK
 ZulGZCIDUpMCpb47TlwyOwE+tf8P1n0XEh5rwPXgJlJVevhJ/jqjrXGRRzT3fvG8b2KJ
 fYzEnlx7I+/Lhth6iiZHjNNVJEmdTdiiMSUZ0YhWi1SfgfKAuAC/pvQ0gPD0kQRLB5k4
 WGwwSqF83vJ73SX0VyHlRTH15XOHjv+7fdr0/gn9Z0trOGwQ9wpZUIlh8rozIZsSrxgX
 wqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YS8EHgwmMuCqhyig1rAaWaRxXw3QqtoY27L8Jll0TfY=;
 b=oRX0aG4PWseR+/PHwcU9qpjoP7lsdIDMn3xfmi1kzNorxY9SK8j56iI6pvEiCkECZo
 Zv/khO3d0N0b2H5lU+2dBRPgdQYUI6D3O4LxROy1svt/ZLqXsSysAHh+6sFiyKpbSYRF
 F1OjSt0ZTLanlswSVsvhoo83kiteah9MIQ/maNY2+Pf/DRAsurYyA3IsyjOjpixwFhAy
 qJ1kSsGDDTRS2mzoIptKKXWsZgwBGxQqi970Du6gEK7lB3KIdbdCvi40Y0y0E2m5uIuH
 LEQ+vemN9SmGAz8st63qKCFtxnZ9xDT33OG7774pqlM+JmAj1zMM2Sie0DvGTt/98DcP
 nkXA==
X-Gm-Message-State: AOAM5327pb6Uxb4rI4ngUII0KzNF0xh9ZHgY/lXqcdRdvI9dgptZk4o/
 sA2X3I7GxTDZtfsd+bqPAJ8=
X-Google-Smtp-Source: ABdhPJxvtJQJT9jI/s9bYQuO90GNiVMlLPs03qEqheRFSe8rV0SXjb9P9bAhHpKdX5WiBso6FB1JZw==
X-Received: by 2002:a7b:cb05:0:b0:38c:7910:d935 with SMTP id
 u5-20020a7bcb05000000b0038c7910d935mr29586332wmj.170.1649692310794; 
 Mon, 11 Apr 2022 08:51:50 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 u1-20020a056000038100b00207a578e9d4sm4140041wrf.89.2022.04.11.08.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:51:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 07/10] drm/sun4i: Add support for D1 mixers
Date: Mon, 11 Apr 2022 17:51:49 +0200
Message-ID: <1721354.VLH7GnMWUR@kista>
In-Reply-To: <20220411043423.37333-8-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-8-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 11. april 2022 ob 06:34:19 CEST je Samuel Holland napisal(a):
> D1 has a display engine with the usual pair of mixers, albeit with
> relatively few layers. In fact, D1 appears to be the first SoC to have
> a mixer without any UI layers. Add support for these new variants.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/
sun8i_mixer.c
> index f5e8aeaa3cdf..49c0d17c6f0a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -585,6 +585,24 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg 
= {
>  	.mod_rate = 150000000,
>  };
>  
> +static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
> +	.ccsc		= 2,
> +	.mod_rate	= 297000000,
> +	.scaler_mask	= 0x3,
> +	.scanline_yuv	= 2048,
> +	.ui_num		= 1,
> +	.vi_num		= 1,
> +};
> +
> +static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
> +	.ccsc		= 1,
> +	.mod_rate	= 297000000,
> +	.scaler_mask	= 0x1,
> +	.scanline_yuv	= 1024,
> +	.ui_num		= 0,
> +	.vi_num		= 1,
> +};
> +
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  	.ccsc		= 0,
>  	.mod_rate	= 297000000,
> @@ -638,6 +656,14 @@ static const struct of_device_id sun8i_mixer_of_table[] 
= {
>  		.compatible = "allwinner,sun8i-v3s-de2-mixer",
>  		.data = &sun8i_v3s_mixer_cfg,
>  	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-de2-mixer-0",
> +		.data = &sun20i_d1_mixer0_cfg,
> +	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-de2-mixer-1",
> +		.data = &sun20i_d1_mixer1_cfg,
> +	},
>  	{
>  		.compatible = "allwinner,sun50i-a64-de2-mixer-0",
>  		.data = &sun50i_a64_mixer0_cfg,
> -- 
> 2.35.1
> 
> 


