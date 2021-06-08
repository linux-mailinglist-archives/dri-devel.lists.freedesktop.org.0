Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA639F392
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277D36E10E;
	Tue,  8 Jun 2021 10:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210E6EBA8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 10:30:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r9so4288922wrz.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Y3XffWvbZ9gUt6UmWSxoD5a6n+263BhQSzzY3hg4Jok=;
 b=iuPGRKR9XdHByxvbM+SMlPnx0afK3yz+vINlWDgt0EKqboAxZczhQ5ruKKnRCDndwH
 lQFXnBo+ZSo8E2yPEwHJykoKbdppDU4kk+uFcRVmL56LvyJ1V1+wRJKWJig2LEIIayUI
 I/TsJFgAoM80e9um4OTrR251rn0spS3eWeqLt9OCAtY0bO6S2x9sPW8EOaEVO4u3H8mH
 u7oQDbtgh23/ft4riSBMPub0hAT3p4/jtzkOlNFEmJFzDIpRsPj9wlE65ike7RLDHYRM
 Fo2imq6Ny7W2J17s+krJYLfPf0NlKuamzOWyROpL+T3kMPBZAdhL4P6zz6dOfkGbz0QU
 lPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Y3XffWvbZ9gUt6UmWSxoD5a6n+263BhQSzzY3hg4Jok=;
 b=REDlpPL0UsK4EGmdcp4q1N38IMuFiXhRAc7lG7K2q4rY/6CZeBDFwyijea8sjixXOp
 iSZ53y6PpQifALDJfBtxVzaqzvNgbgFK3mfUMDhjQrZvIlB3aQ3TdzXKMWPzs8TUXeJv
 2gHTAiB9S70SDMuNb1GxCOjOJdQMK8pK1NeVLUQOh3SBVBL0KiiaX4lCrNTJ0MSkpyj5
 90foFQ6WzzUZ2jTKEKqU2HuHaMVOsyZHM0fQT7M0SQZiKx2z+hqxj1zzn5SuNiEY1QGw
 aY+ClbyeS9V3mjq9/AUjsTU9VRoURZqYISvieKU7jfbLJYL1pfrj0KTP1nxctWeh3CfO
 bTRQ==
X-Gm-Message-State: AOAM530ULrYcXlzr0ioQ/GFLn4ASj6ihPcIv8M16DOWS8SLGf+4Q51ZS
 Z6LSd71vwILHxsKqy7efURhXcg==
X-Google-Smtp-Source: ABdhPJwXk5Ok9WOT//iXPsK1UriRL2bSGzs9d2DeXvVto+EXEC6Qiwk8hYX/WJYLuMDmmj0b257Rbw==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr21642661wrr.35.1623148233596; 
 Tue, 08 Jun 2021 03:30:33 -0700 (PDT)
Received: from ?IPv6:2a02:2454:3e5:b700:cdac:cb35:5f15:3de2?
 ([2a02:2454:3e5:b700:cdac:cb35:5f15:3de2])
 by smtp.gmail.com with ESMTPSA id n7sm1902454wmq.37.2021.06.08.03.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 03:30:33 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix checkpatch --strict CHECKs
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210608095322.23644-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Message-ID: <8c2118b3-89a5-dd2e-5baa-739a7de8834f@linaro.org>
Date: Tue, 8 Jun 2021 12:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608095322.23644-1-marex@denx.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for submitting this.
> Fix ./scripts/checkpatch.pl --strict -f drivers/gpu/drm/bridge/ti-sn65dsi83.c
> CHECKs, no functional change. This is the same modification done to V7 of the
> original patch.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 36 +++++++++++++--------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index eff35611fabf..750f2172ef08 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -377,19 +377,19 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
>   
>   	/* Reference clock derived from DSI link clock. */
>   	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> -		REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
> -		REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> +		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
> +		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>   	regmap_write(ctx->regmap, REG_DSI_CLK,
> -		REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
> +		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>   	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> -		REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> +		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>   
>   	/* Set number of DSI lanes and LVDS link config. */
>   	regmap_write(ctx->regmap, REG_DSI_LANE,
> -		REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
> -		REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
> -		/* CHB is DSI85-only, set to default on DSI83/DSI84 */
> -		REG_DSI_LANE_CHB_DSI_LANES(3));
> +		     REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
> +		     REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
> +		     /* CHB is DSI85-only, set to default on DSI83/DSI84 */
> +		     REG_DSI_LANE_CHB_DSI_LANES(3));
>   	/* No equalization. */
>   	regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>   
> @@ -420,10 +420,10 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
>   	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
>   	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
>   	regmap_write(ctx->regmap, REG_LVDS_LANE,
> -		(ctx->lvds_dual_link_even_odd_swap ?
> -		 REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> -		REG_LVDS_LANE_CHA_LVDS_TERM |
> -		REG_LVDS_LANE_CHB_LVDS_TERM);
> +		     (ctx->lvds_dual_link_even_odd_swap ?
> +		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> +		     REG_LVDS_LANE_CHA_LVDS_TERM |
> +		     REG_LVDS_LANE_CHB_LVDS_TERM);
>   	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>   
>   	val = cpu_to_le16(ctx->mode.hdisplay);
> @@ -455,8 +455,8 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
>   	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
>   	usleep_range(3000, 4000);
>   	ret = regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
> -					pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
> -					1000, 100000);
> +				       pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
> +				       1000, 100000);
>   	if (ret) {
>   		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
>   		/* On failure, disable PLL again and exit. */
> @@ -513,8 +513,8 @@ static void sn65dsi83_mode_set(struct drm_bridge *bridge,
>   }
>   
>   static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
> -			       const struct drm_display_mode *mode,
> -			       struct drm_display_mode *adj)
> +				 const struct drm_display_mode *mode,
> +				 struct drm_display_mode *adj)
>   {
>   	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>   	u32 input_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> @@ -546,8 +546,8 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
>   			ctx->lvds_format_24bpp = true;
>   			ctx->lvds_format_jeida = false;
>   			dev_warn(ctx->dev,
> -				"Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
> -				connector->display_info.bus_formats[0]);
> +				 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
> +				 connector->display_info.bus_formats[0]);
>   			break;
>   		}
>   
This patch had some trivial checkpatch issues. I fixed those and 
pulled this patch into drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=96b7182d8c4ea2837df28dba6fe431b5c568ea58

