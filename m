Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465883383F9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 03:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658996EAA6;
	Fri, 12 Mar 2021 02:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF5A6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 02:50:08 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so688835ote.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 18:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=azgagDRF6A1AHkEv1VWt0CvtZJZ+8WZJuu9UtZkruL8=;
 b=t5pR9mR0mbp1ctZReBgPN71QrSJLvICCxRRJtgVKmCe4Sn7k69DkEVakPJ6lw0Pwem
 mqIZQd/J9HdzVX2zZLRzlD/I3tKbNlhWxwkP/pBTuGrAtIZRIIsAxthk7iwxBpOWOYFP
 ip0vKzQtANMRjr/O0TQDedrdIIgWBrUMGdoG3J62L1JSP75EcWXlXV/AiJgJSPhwfydc
 Lz3t0vuxcclcYPjv+/eqEsQAGxxOxZPzWn2KG44koknf0rfSN9ChDlR9GyGpnLyznc+R
 imJnX9k5JgmsAcHeWwm5ni2uXW2COTqb/630ouO9VA7vhjSjbsjZLYOearJfJ09Kx/OD
 8O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=azgagDRF6A1AHkEv1VWt0CvtZJZ+8WZJuu9UtZkruL8=;
 b=gHaGpek+4Eq5AOzNJMK2kMv9trjVrcvx1sBQK83jy13a9HPAoRCcb/cQ67DhJ2jOpC
 jC9N3dwpTmSP6jELR6fhqJqGiokiQNrGkrUICuotLz4rEs4NaHo9k6HNPnQ2Nrhq/WOC
 LIALNVpXZ/EBg2HAY9JtQVJdg6ydX7btJ9whdpFgwwaj1vnLYtKFC7Fy/3OK4Y3kXVL2
 fqizYFlcmWUlGsmC/2YdCz0NnWoKj1xNFRUK/Bjgl8QNGzGLy44AnkqPDbqHhT4i96o3
 iJnj7Inym9OSceF7xwXP6zv4owwVDOvZgn0a/7bMa/+kg/+qc2p/QpFHuk7e8iJMLJCW
 JuqA==
X-Gm-Message-State: AOAM5323ekuupP/ivj6derXhrtugCcvywhTjw0pdS0seVYudAw2p3aoD
 OfXHpztYDFiG6Bu4PIONttMCNA==
X-Google-Smtp-Source: ABdhPJxHIaNXnkhYxbBu6bCkbtWazyZx17pl9sm0QDgqQLRXaXPmXqJpy+kd9QBZoyE5b+H0xxJRFw==
X-Received: by 2002:a9d:3f37:: with SMTP id m52mr1652759otc.92.1615517407368; 
 Thu, 11 Mar 2021 18:50:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o9sm1032572otl.39.2021.03.11.18.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 18:50:06 -0800 (PST)
Date: Thu, 11 Mar 2021 20:50:05 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
Message-ID: <YErW3cicdN4vPCkM@builder.lan>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 04 Mar 17:52 CST 2021, Douglas Anderson wrote:

> This patch is _only_ code motion to prepare for the patch
> ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> refclk") and make it easier to understand.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 196 +++++++++++++-------------
>  1 file changed, 98 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 942019842ff4..491c9c4f32d1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -345,6 +345,104 @@ static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
>  				       pdata->supplies);
>  }
>  
> +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> +{
> +	u32 bit_rate_khz, clk_freq_khz;
> +	struct drm_display_mode *mode =
> +		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> +
> +	bit_rate_khz = mode->clock *
> +			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> +
> +	return clk_freq_khz;
> +}
> +
> +/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> +static const u32 ti_sn_bridge_refclk_lut[] = {
> +	12000000,
> +	19200000,
> +	26000000,
> +	27000000,
> +	38400000,
> +};
> +
> +/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> +static const u32 ti_sn_bridge_dsiclk_lut[] = {
> +	468000000,
> +	384000000,
> +	416000000,
> +	486000000,
> +	460800000,
> +};
> +
> +static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> +{
> +	int i;
> +	u32 refclk_rate;
> +	const u32 *refclk_lut;
> +	size_t refclk_lut_size;
> +
> +	if (pdata->refclk) {
> +		refclk_rate = clk_get_rate(pdata->refclk);
> +		refclk_lut = ti_sn_bridge_refclk_lut;
> +		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> +		clk_prepare_enable(pdata->refclk);
> +	} else {
> +		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> +		refclk_lut = ti_sn_bridge_dsiclk_lut;
> +		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> +	}
> +
> +	/* for i equals to refclk_lut_size means default frequency */
> +	for (i = 0; i < refclk_lut_size; i++)
> +		if (refclk_lut[i] == refclk_rate)
> +			break;
> +
> +	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> +			   REFCLK_FREQ(i));
> +}
> +
> +static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	clk_disable_unprepare(pdata->refclk);
> +
> +	pm_runtime_put_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	pm_runtime_get_sync(pdata->dev);
> +
> +	/* configure bridge ref_clk */
> +	ti_sn_bridge_set_refclk_freq(pdata);
> +
> +	/*
> +	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> +	 * so the HPD is an internal signal that's only there to signal that
> +	 * the panel is done powering up.  ...but the bridge chip debounces
> +	 * this signal by between 100 ms and 400 ms (depending on process,
> +	 * voltage, and temperate--I measured it at about 200 ms).  One
> +	 * particular panel asserted HPD 84 ms after it was powered on meaning
> +	 * that we saw HPD 284 ms after power on.  ...but the same panel said
> +	 * that instead of looking at HPD you could just hardcode a delay of
> +	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
> +	 * delay in its prepare and always disable HPD.
> +	 *
> +	 * If HPD somehow makes sense on some future panel we'll have to
> +	 * change this to be conditional on someone specifying that HPD should
> +	 * be used.
> +	 */
> +	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +			   HPD_DISABLE);
> +
> +	drm_panel_prepare(pdata->panel);
> +}
> +
>  static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
> @@ -443,64 +541,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  	drm_panel_unprepare(pdata->panel);
>  }
>  
> -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> -{
> -	u32 bit_rate_khz, clk_freq_khz;
> -	struct drm_display_mode *mode =
> -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> -
> -	bit_rate_khz = mode->clock *
> -			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> -
> -	return clk_freq_khz;
> -}
> -
> -/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> -static const u32 ti_sn_bridge_refclk_lut[] = {
> -	12000000,
> -	19200000,
> -	26000000,
> -	27000000,
> -	38400000,
> -};
> -
> -/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> -static const u32 ti_sn_bridge_dsiclk_lut[] = {
> -	468000000,
> -	384000000,
> -	416000000,
> -	486000000,
> -	460800000,
> -};
> -
> -static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> -{
> -	int i;
> -	u32 refclk_rate;
> -	const u32 *refclk_lut;
> -	size_t refclk_lut_size;
> -
> -	if (pdata->refclk) {
> -		refclk_rate = clk_get_rate(pdata->refclk);
> -		refclk_lut = ti_sn_bridge_refclk_lut;
> -		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> -		clk_prepare_enable(pdata->refclk);
> -	} else {
> -		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> -		refclk_lut = ti_sn_bridge_dsiclk_lut;
> -		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> -	}
> -
> -	/* for i equals to refclk_lut_size means default frequency */
> -	for (i = 0; i < refclk_lut_size; i++)
> -		if (refclk_lut[i] == refclk_rate)
> -			break;
> -
> -	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> -			   REFCLK_FREQ(i));
> -}
> -
>  static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
>  {
>  	unsigned int bit_rate_mhz, clk_freq_mhz;
> @@ -821,46 +861,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	drm_panel_enable(pdata->panel);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> -{
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
> -	pm_runtime_get_sync(pdata->dev);
> -
> -	/* configure bridge ref_clk */
> -	ti_sn_bridge_set_refclk_freq(pdata);
> -
> -	/*
> -	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> -	 * so the HPD is an internal signal that's only there to signal that
> -	 * the panel is done powering up.  ...but the bridge chip debounces
> -	 * this signal by between 100 ms and 400 ms (depending on process,
> -	 * voltage, and temperate--I measured it at about 200 ms).  One
> -	 * particular panel asserted HPD 84 ms after it was powered on meaning
> -	 * that we saw HPD 284 ms after power on.  ...but the same panel said
> -	 * that instead of looking at HPD you could just hardcode a delay of
> -	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
> -	 * delay in its prepare and always disable HPD.
> -	 *
> -	 * If HPD somehow makes sense on some future panel we'll have to
> -	 * change this to be conditional on someone specifying that HPD should
> -	 * be used.
> -	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> -
> -	drm_panel_prepare(pdata->panel);
> -}
> -
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> -{
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
> -	clk_disable_unprepare(pdata->refclk);
> -
> -	pm_runtime_put_sync(pdata->dev);
> -}
> -
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.pre_enable = ti_sn_bridge_pre_enable,
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
