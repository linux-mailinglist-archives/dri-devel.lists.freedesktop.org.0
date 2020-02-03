Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626051516CA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003836EDE6;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DFE6E069
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:31:43 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g3so2969634pgs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XGNxCxtoGDp+8cXtqCNq+umjrj7BBwnr/1CarpNQDow=;
 b=Zf4BLBA33ovQTs19yyX6WoAUz8Zzi5NHrDyFtSRCEdaayqM1QIHAMeKBKdVu0zrOXq
 KnrsACkNHOl7zushehwUJ5H8+RYQpP0PpBZ/ieM61RhlNMZuzQRlnWZLJMcJj7BabDq5
 iNKAuTtqGwnSBcvmGAkIbyKMP3snJQAwnqzKlQ/3SsK0kcA9n3nSHC5F2klihcWk2j5q
 Jb3wGG1CcJVnP1nuv3Kn7xF54yrSTJc8ceuwTNYEP8eRCvP9OP+10TZKUeV96hc7Op9+
 DhDt0we2rYE0t+hXRF3YKUtbQi8ZupPG30e+jGMJ33SovSUXMtzRvEK0E14Ekxsjzb+i
 P8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XGNxCxtoGDp+8cXtqCNq+umjrj7BBwnr/1CarpNQDow=;
 b=KLb79f6tEiHgxeInvuvZf5yNMoAWvUlG8Uz2etuPrU/N1G0vdos/a4fIlxBVnBwnWG
 rKPQMO60GZsQu/G6NLIdHY7vLSQ7hqlKKKURjwrNVTPrPBCvBnJONO/RUXL/8om6Je+R
 Msn/nMyFpTiczBn6/QEd7Oqzhvm6ZtF5GhWkzvjvPQla2WhWpTzW0aMDltEXd7vNHI7U
 DHOuH2am4FblbFZKL3z4cCXLd+wVtmijhHYH/NZjeisqWnaPyF7szUORwI/kH8wXpG2K
 Ts+KH3I1gZAO7CfX1jJuEiwGMOAxT2aJMbDm5Zcv6ieWtAuh8/Xjs90QswJpfUkv2VKa
 6AzA==
X-Gm-Message-State: APjAAAV7N/fuUS+X+3PVT4oHXhmet2+V9zRm3QutnBGzBT4RxCMdUHJp
 9lMd9PXBh+o0vod7F15kKUEExg==
X-Google-Smtp-Source: APXvYqyCCGOrUZ9ASeMIJ6mqBRwpGQqSbvV3UlCvjqN3zMfGsZDYOyhgRD7u3sbBrwMLEggMT+Q29w==
X-Received: by 2002:a63:7053:: with SMTP id a19mr26365083pgn.377.1580772703136; 
 Mon, 03 Feb 2020 15:31:43 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id m101sm557380pje.13.2020.02.03.15.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:31:42 -0800 (PST)
Date: Mon, 3 Feb 2020 15:31:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/9] drm/bridge: ti-sn65dsi86: Split the setting of
 the dp and dsi rates
Message-ID: <20200203233140.GA311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
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

> These two things were in one function.  Split into two.  This looks
> like it's duplicating some code, but don't worry.  This is is just in
> preparation for future changes.
> 
> This is intended to have zero functional change and will just make
> future patches easier to understand.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 43abf01ebd4c..2fb9370a76e6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -417,6 +417,24 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
>  			   REFCLK_FREQ(i));
>  }
>  
> +static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
> +{
> +	unsigned int bit_rate_mhz, clk_freq_mhz;
> +	unsigned int val;
> +	struct drm_display_mode *mode =
> +		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> +
> +	/* set DSIA clk frequency */
> +	bit_rate_mhz = (mode->clock / 1000) *
> +			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> +
> +	/* for each increment in val, frequency increases by 5MHz */
> +	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> +		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> +	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> +}
> +
>  /**
>   * LUT index corresponds to register value and
>   * LUT values corresponds to dp data rate supported
> @@ -426,22 +444,16 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  {
> -	unsigned int bit_rate_mhz, clk_freq_mhz, dp_rate_mhz;
> -	unsigned int val, i;
> +	unsigned int bit_rate_mhz, dp_rate_mhz;
> +	unsigned int i;
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
>  	/* set DSIA clk frequency */
>  	bit_rate_mhz = (mode->clock / 1000) *
>  			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> -
> -	/* for each increment in val, frequency increases by 5MHz */
> -	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> -		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> -	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  
>  	/* set DP data rate */
>  	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> @@ -510,7 +522,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   val);
>  
>  	/* set dsi/dp clk frequency value */
> -	ti_sn_bridge_set_dsi_dp_rate(pdata);
> +	ti_sn_bridge_set_dsi_rate(pdata);
> +	ti_sn_bridge_set_dp_rate(pdata);
>  
>  	/* enable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
