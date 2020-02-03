Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1031516C5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2F26EDDD;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0049C6ED56
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:37:14 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id f2so299970pjq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BAkzT/j0lERasGuOtU/7cTy/icSeee5cB98kOksn4lw=;
 b=MIlVCggmlu0Y79t/0IYRlqNSRtlu000Et3fAkLKNIg5Bp1Y23ifkAX8CbdwKQpuCHN
 43gzBj7uiRV2TQtZbY8WZsYKQrCjb1OzSmdhtEim6ibxCmWmEst9Z1Gm1u3cSNhmRAvm
 bXo4kkDYCbQ6Hr0gqdZbHeZLYz8WdEst1/W5ErTTs5OEdRR44UgUHDXDALA5YAZp8hw5
 MoDzjvRZBJQb/k7CcSi6pmHoshHf1KWDXb0RZ23QiO5Ze75TP5dnO8DqeP8Ex3DnGelh
 IGdWlBxvHSpBv+5UQO9hg4IT9VYIsjNPftobMKFO12q4tUDHuKZQzkdrY1kWxyABxKGu
 h+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BAkzT/j0lERasGuOtU/7cTy/icSeee5cB98kOksn4lw=;
 b=cNq54igAdORywY14E+pbKf9ui4YgyaKzOQH41higbWGYVq0GLsQkxfl1STE5/0t8ZI
 lxeOSWzQlba+O3LtFq5HgxV/925sNX/ijHyM7L6Zky5tEJ3vwxX/rPaCN5eU+ZR9HXJf
 MyQUZ2JeFkGyVS4WpvgmSSq1xfrg0T6jqFe7jTdunKRqW1/jBXAZoMvE4d0bWgmKdPZN
 3QFg/7xwmuYYYV3z6za9QldLwEVowgLTSz2caufO2lyPEjz4a1G7XicHlW/r74frXHe4
 tIynsMx5gMMo63zz79tDxSQBqhA4ypp9MNCgzyGVDWM0iOIgB3WP09UW3AJyR4zl3Wic
 lePw==
X-Gm-Message-State: APjAAAVDvv9EwJC4RDjZYw+yszdppXaQffI5z2f5OboMvatfUUDburei
 Ww5wcrlYlBHqGnfdGvw72Tp6sg==
X-Google-Smtp-Source: APXvYqy+qax4nYLUgQgeWMjozPgWVALRDlz+HY/G1hWpsRQf6U8ihJmcG7nhL7bTAUJcC72lnp8Hug==
X-Received: by 2002:a17:902:467:: with SMTP id
 94mr26827760ple.267.1580773034415; 
 Mon, 03 Feb 2020 15:37:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e16sm20752673pgk.77.2020.02.03.15.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:37:13 -0800 (PST)
Date: Mon, 3 Feb 2020 15:37:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
Message-ID: <20200203233711.GF311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
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

> The current bridge driver always forced us to use 24 bits per pixel
> over the DP link.  This is a waste if you are hooked up to a panel
> that only supports 6 bits per color or fewer, since in that case you
> ran run at 18 bits per pixel and thus end up at a lower DP clock rate.

s/ran/can/

> 
> Let's support this.
> 
> While at it, let's clean up the math in the function to avoid rounding
> errors (and round in the correct direction when we have to round).
> Numbers are sufficiently small (because mode->clock is in kHz) that we
> don't need to worry about integer overflow.
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 0fc9e97b2d98..d5990a0947b9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -51,6 +51,7 @@
>  #define SN_ENH_FRAME_REG			0x5A
>  #define  VSTREAM_ENABLE				BIT(3)
>  #define SN_DATA_FORMAT_REG			0x5B
> +#define  BPP_18_RGB				BIT(0)
>  #define SN_HPD_DISABLE_REG			0x5C
>  #define  HPD_DISABLE				BIT(0)
>  #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
> @@ -436,6 +437,14 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> +static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
> +{
> +	if (pdata->connector.display_info.bpc <= 6)
> +		return 18;
> +	else
> +		return 24;
> +}
> +
>  /**
>   * LUT index corresponds to register value and
>   * LUT values corresponds to dp data rate supported
> @@ -447,21 +456,17 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  
>  static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  {
> -	unsigned int bit_rate_mhz, dp_rate_mhz;
> +	unsigned int bit_rate_khz, dp_rate_mhz;
>  	unsigned int i;
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
> -	/*
> -	 * Calculate minimum bit rate based on our pixel clock.  At
> -	 * the moment this driver never sets the DP_18BPP_EN bit in
> -	 * register 0x5b so we hardcode 24bpp.
> -	 */
> -	bit_rate_mhz = (mode->clock / 1000) * 24;
> +	/* Calculate minimum bit rate based on our pixel clock. */
> +	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
>  
>  	/* Calculate minimum DP data rate, taking 80% as per DP spec */
> -	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
> -							DP_CLK_FUDGE_DEN;
> +	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> +				   1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
>  
>  	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
> @@ -550,6 +555,10 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
>  			   CHA_DSI_LANES_MASK, val);
>  
> +	/* Set the DP output format (18 bpp or 24 bpp) */
> +	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
> +
>  	/* DP lane config */
>  	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
