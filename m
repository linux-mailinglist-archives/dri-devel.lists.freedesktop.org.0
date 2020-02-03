Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6D1516CE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CD06EDEF;
	Tue,  4 Feb 2020 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8BB6E069
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:33:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y8so6446807pll.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3aYiPA/gJeoBo48Ys9UapQ0Ubna55Q+Eek/KSnN7OTE=;
 b=qn+mnqQCcbYJ1bVCJ8S5wTj0A3XX0kEYmXBHZW3Kgk5qO4J5y//6RudPCe7dXAu7Ib
 hIhfJTwxvYvManjAqfpkaQD98RZLUOVNnKIDg+XAsu1sBG76SUtLqROV5wZ6zadciVIu
 qv+l47h4wY6J1pdEE0/MHCZNwdp78fVhVd6VFqbuvxnj6EFGR41fISlFiJ3ODoZygnsr
 1SMpiUb6uJvJAAgdqYakM+EBWXDsmTJNK7diOSh/ShytwskMDfdVkZEkNgDwQrD1m0WZ
 C85QhxfahubgbydPcrjyJATx6LkFSjpB4yCP8BPnCxnKR2bi6FTGWNGNXx+qYtruHpKq
 oRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3aYiPA/gJeoBo48Ys9UapQ0Ubna55Q+Eek/KSnN7OTE=;
 b=rcFMEZXKsFvbiyrIA4U6vCFrkWb/Iixqv2LtI3ompA2tKsqPgHe3G8z33rz5XiABFb
 d51LIyRyzw5eFAg9LdJXnLMSKfJS+yquVUFpcguS5+B4ijverUaJ1bDCYI8QEhF6vHSG
 8c5L3mqcXhrJ0z6kSR8MhwBeacYJdHdZMlWheXOepp8GIm/0wFnsmT0SxoijYAANVc6w
 hd+elxT2to6UIU15Ro0AyNdGUNQsjl7nZSMMX5aNdoYpmSadewGNwHBSC1/i0D/snVhu
 YUehq5ijSYsBAQ/fah1T/+727gnnfrY0T9cRtMJktm5HVYdPKOwhqLiiIcrA/w0D3bPH
 etxQ==
X-Gm-Message-State: APjAAAXmHVm1RXrr7XUpN2VjxYGNj2QgRjhMSXw41G52/oaJJHmdv6Bu
 Rz7+6F7KvNfvokVuORO2ZxBxoQ==
X-Google-Smtp-Source: APXvYqyYv/3WZZoQ1fH4Z0rd/mToMYgxMof6syF+b8Indkq9ll0Hb4RbBOj0ZiJq6oVriYm0cFF+Vw==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
 d11mr2003878pjr.22.1580772794291; 
 Mon, 03 Feb 2020 15:33:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q29sm9637390pgc.15.2020.02.03.15.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:33:13 -0800 (PST)
Date: Mon, 3 Feb 2020 15:33:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/9] drm/bridge: ti-sn65dsi86: Don't use MIPI
 variables for DP link
Message-ID: <20200203233311.GC311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> The ti-sn65dsi86 is a bridge from MIPI to DP and thus has two links:
> the MIPI link and the DP link.  The two links do not need to have the
> same format or number of lanes.  Stop using MIPI variables when
> talking about the DP link.
> 
> This has zero functional change because:
> * currently we are hardcoding the MIPI link as unpacked RGB888 which
>   requires 24 bits and currently we are not changing the DP link rate
>   from the bridge's default of 8 bits per pixel.
> * currently we are hardcoding both the MIPI and DP as being 4 lanes.
> 
> This is all in prep for fixing some of the above.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 7b596af265e4..ab644baaf90c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -100,6 +100,7 @@ struct ti_sn_bridge {
>  	struct drm_panel		*panel;
>  	struct gpio_desc		*enable_gpio;
>  	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
> +	int				dp_lanes;
>  };
>  
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -313,6 +314,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
>  	}
>  
>  	/* TODO: setting to 4 lanes always for now */
> +	pdata->dp_lanes = 4;
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> @@ -451,13 +453,17 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
> -	/* set DSIA clk frequency */
> -	bit_rate_mhz = (mode->clock / 1000) *
> -			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	/*
> +	 * Calculate minimum bit rate based on our pixel clock.  At
> +	 * the moment this driver never sets the DP_18BPP_EN bit in
> +	 * register 0x5b so we hardcode 24bpp.
> +	 */
> +	bit_rate_mhz = (mode->clock / 1000) * 24;
>  
> -	/* set DP data rate */
> -	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> +	/* Calculate minimum DP data rate, taking 80% as per DP spec */
> +	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
>  							DP_CLK_FUDGE_DEN;
> +
>  	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
>  			break;
> @@ -517,7 +523,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   CHA_DSI_LANES_MASK, val);
>  
>  	/* DP lane config */
> -	val = DP_NUM_LANES(pdata->dsi->lanes - 1);
> +	val = DP_NUM_LANES(pdata->dp_lanes - 1);
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>  			   val);
>  
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
