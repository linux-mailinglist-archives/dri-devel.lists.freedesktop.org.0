Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F4586D52
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEF111B3BB;
	Mon,  1 Aug 2022 14:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7F0112247
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 14:56:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z22so14081002edd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ECWbBaHkZs9J1S0N5JScglb2hCZdGmluc3XrIhFKN00=;
 b=rVcXcMOrSxa08RXKnpFNMpBHPPsPIQM5f+nW3w3iWddmUPEd4k+AJBWcgFeGkLF1l1
 p8eSuQf/wgN1nFnTwlS7Axavinryf8qzx18aioGJOsqNqoJuBBcf+RLRiIC6lXWZ/1ew
 h3Im8gmI/wtUxrYsGkSviEEB8bHrKpa4VfBVaDin4AaLMWY6uURPOyC3g5nweN6j7EM0
 9ADIiew3Y4D5wm8+d5SZrJfJayYmAQoTO0J8Dri+/iwlreEkWiZlWlMyAaVCAwFKkTEy
 rnhp5l+Y4l3QAHBYFg5YgD4x72KL5wghZ4ltRqkf8xDNi+P6hiiiorQSWsZapest8yJT
 Z7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ECWbBaHkZs9J1S0N5JScglb2hCZdGmluc3XrIhFKN00=;
 b=7fFbBHB4EO9veatyXOrXdupWAHxQUsQ1Jz3fl5YAjSUsCXltuaEdYVoZ1t5pY/tlaT
 yN+M9FQP/fa8var1Y6RlSI0GfKrJTCSZN74gE863B5EF0MNBnQ9eujanHty3n0a5Te1O
 cJF8BZL9d1P5OG1ohxFnF3vbK0cz2cZUcRpbQQp9ZBT+YYDz/mM3zVUGRwFkiLLjRaRh
 vLyRFdbR1TblR4LBpyPG/QUh/zQNL+bgyzMOQmBk9yt//+Q8/oLeFWz/5As9o0/8iXxk
 zo6ZZV5hsAw+1/CrBIhNje4yRX/m+ad792uTH0IKvefabQgJQ+sKGkT9Y05C5+mYJrl8
 UiUQ==
X-Gm-Message-State: AJIora//insNndttFLvBOP26eObxohsDg9MpxpHda/i001u23CNEJS+Y
 BxbOXEBVfLmc/eezISsXzupt9lwaj8cdUzuFjJfUwQ==
X-Google-Smtp-Source: AGRyM1tntz3eziALAkPCu6tccuM24ozU9m66PGZQO3x+GPRbcZTSy62uhWN2tM0aCtWwB4vY1JySRUGuEmxaJE+6plc=
X-Received: by 2002:a05:6402:194f:b0:43a:298f:f39c with SMTP id
 f15-20020a056402194f00b0043a298ff39cmr16378949edz.106.1659365760316; Mon, 01
 Aug 2022 07:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131113.182487-1-marex@denx.de>
In-Reply-To: <20220801131113.182487-1-marex@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Aug 2022 15:55:43 +0100
Message-ID: <CAPY8ntCowWODtQtSHoPkjL2_XjVQCW8Fduutt3rYAZ=e9MZT_A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Mon, 1 Aug 2022 at 14:12, Marek Vasut <marex@denx.de> wrote:
>
> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
> adjust DSI input frequency calculations such that they expect the DSI host
> to configure HS clock according to hs_rate.

I think this falls into another of the areas that is lacking in the DSI support.
hs_rate is defined as the *maximum* lane frequency in high speed
mode[1]. As documented there is no obligation on the DSI host to
choose this specific rate, just some frequency below it and above or
equal to that required by the pixel clock. At a system level, the link
frequency is often prescribed for EMC purposes.

The issue is then that the SN65DSI83 is configured to use the DSI
clock lane as the source for the PLL generating the LVDS clock,
therefore with no route for the DSI peripheral to query the link
frequency chosen by the host, you're stuck.

SN65DSI83 also supports non-burst mode (as currently), so how would
this be configured now?
Does MIPI_DSI_MODE_VIDEO_BURST [2] oblige the DSI host to run in burst
mode, or say that burst mode is supported by the peripheral? What if
your DSI host doesn't support burst mode and it is optional on your
peripheral?
I raised these questions and others at [3], but largely got no real answers.


The patch does exactly what you describe and has value, but without
definition in the frameworks of exactly how burst mode must be
implemented by the DSI host, I would say that it's going to cause
issues.
I am aware of users of your driver with the Raspberry Pi, but your
expectation isn't currently valid on the Pi as there is no definition
of the correct thing for the host to do.

Cheers.
  Dave

[1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_mipi_dsi.h#L176
[2] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_mipi_dsi.h#L119
[3] start of thread at
https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html
and specifically hs_rate/burst at
https://lists.freedesktop.org/archives/dri-devel/2021-October/326732.html

> This is an optimization for the DSI burst mode case. In case the DSI device
> supports DSI burst mode, it is recommended to operate the DSI interface at
> the highest possible HS clock frequency which the DSI device supports. This
> permits the DSI host to send as short as possible bursts of data on the DSI
> link and keep the DSI data lanes in LP mode otherwise, which reduces power
> consumption.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 14e7aa77e7584..b161f25c3a2f5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
>         return (mode_clock - 12500) / 25000;
>  }
>
> -static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
> -                                 const struct drm_display_mode *mode)
> +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
>  {
>         /*
>          * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> @@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
>          *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
>          * the 2 is there because the bus is DDR.
>          */
> -       return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
> -                           mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
> -                           ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
> +       return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
>  }
>
> -static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
> +                               const struct drm_display_mode *mode)
>  {
>         /* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> -       unsigned int dsi_div = mipi_dsi_pixel_format_to_bpp(ctx->dsi->format);
> +       unsigned int dsi_div;
> +       int mode_clock = mode->clock;
>
> -       dsi_div /= ctx->dsi->lanes;
> +       if (ctx->lvds_dual_link)
> +               mode_clock /= 2;
>
> -       if (!ctx->lvds_dual_link)
> -               dsi_div /= 2;
> +       dsi_div = (ctx->dsi->hs_rate / mode_clock) / 1000;
>
>         return dsi_div - 1;
>  }
> @@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>                      REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, mode)) |
>                      REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>         regmap_write(ctx->regmap, REG_DSI_CLK,
> -                    REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode)));
> +                    REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>         regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> -                    REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> +                    REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, mode)));
>
>         /* Set number of DSI lanes and LVDS link config. */
>         regmap_write(ctx->regmap, REG_DSI_LANE,
> @@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>         dsi->lanes = dsi_lanes;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +       dsi->hs_rate = 500000000;
> +       dsi->lp_rate = 16000000;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
> --
> 2.35.1
>
