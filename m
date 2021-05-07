Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8A376577
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 14:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98836E046;
	Fri,  7 May 2021 12:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1A6E046
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 12:48:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so4829350wmv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXHnDMb7PdtZKua2KC9Vg3iB+aP57ySos/nJeqmPBtw=;
 b=Ot8GfJ5cuP98oyV0U2QTIjP+JHJghdAT8vq//FnXA5MDqKbOEbVEEfgHiDDRGyI+Up
 ax+QmiRLileTVerCjGFO9DvuXYVcHqlkYdOhEId+dulKJwHgMx6wrltTZ/sC8gPqixyR
 MjIxi6ZgfBybXNNQOFuM9BOFPfC+vdTfpVhEEHCEExTc2rgPaV5JLNXhmk5tPRNbYZRy
 659WNqgZdSs+Ct20WHTtG1kZrdsQG6HuEbZjakW3riZvC2MUTVPTbV/Eyhf6hYraCLFT
 VNij48rAMXcXe5v1pD9LMj4q2eyso49KiOddufVMfDPsJOem5OddelnBj/rH2KdI9yAt
 2frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXHnDMb7PdtZKua2KC9Vg3iB+aP57ySos/nJeqmPBtw=;
 b=U39ZrFWseMFsfWYT9CGqJwFB/Nv2GFFi3zN8EVAz78he3t5uK3ovYNBBpELUE/N+bO
 U8LwEkpNev4L88OkIu/9Oq7Y/beCAv0aHeEamJo0pmrpQJ1dPg/opbpnGG3WAu0VR7Ui
 AUjjvSkQ5fw7Wtt9DNvglcCxkYCpw0hPt8kEjj9U6Wvu5sZttIww0fs9gTSyJVSfrlje
 COwT6fz1Q3u5gqpu3Ipf/AKlQAXQiY6sfgD22cka4r8l9nLkYcOFeHsYQSRJt/lGZEe8
 r503P8PNzqRmUKUxiTl/+h77Q0JsYzuY5dfJUE9Nb+ykBrrx6Ld+hHpz2OTr4kyWQqUr
 xABg==
X-Gm-Message-State: AOAM5310btNNdSlrFpg28mDyTwxXrozgxGAMeOywUPZEV5wXFDHGexPH
 zWuVDGgt4XhPlCZ2yDTzR6T+mHfyPofE0QsZ99wifA==
X-Google-Smtp-Source: ABdhPJwSUsCea0JwG19gdgTrEOh7NmYQatLZPYgfz2OFzPcy7vjKKaI9eUZUBmvltDziaUc7ex5m/dyRAopzyljWph4=
X-Received: by 2002:a1c:2786:: with SMTP id n128mr21497542wmn.82.1620391698310; 
 Fri, 07 May 2021 05:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
In-Reply-To: <20210505100218.108024-2-marex@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 7 May 2021 13:48:01 +0100
Message-ID: <CAPY8ntCzu6=uBqRfQ+9QJWH-zqy0K9FD8XWdC8NZxJZiUBfYfg@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 May 2021 at 11:03, Marek Vasut <marex@denx.de> wrote:
>
> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
>
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> ---
<snip>
> +
> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +
> +       /*
> +        * Reset the chip, pull EN line low for t_reset=10ms,
> +        * then high for t_en=1ms.
> +        */
> +       regcache_mark_dirty(ctx->regmap);
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(10000, 11000);
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(1000, 1100);
> +}
> +
<snip>
> +
> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +       unsigned int pval;
> +       u16 val;
> +       int ret;
> +
> +       /* Clear reset, disable PLL */
> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);

Sorry, a further thread of discussion coming from the investigations
I've been involved with.

You've powered up in pre_enable, and are sending the I2C writes in enable.

From the docs for drm_bridge_funcs->enable[1]

 * The bridge can assume that the display pipe (i.e. clocks and timing
 * signals) feeding it is running when this callback is called. This
 * callback must enable the display link feeding the next bridge in the
 * chain if there is one.

So video is running when enable is called, and the DSI data lanes may
be HS. (Someone correct me if that is an incorrect reading of the
text).

The SN65DSI84 datasheet table 7-2 Initialization Sequence gives init
seq 8 as being "Change DSI data lanes to HS state and start DSI video
stream", AFTER all the I2C has been completed except reading back
registers and checking for errors.
With video running you don't fulfil the second part of init seq 2 "the
DSI data lanes MUST be driven to LP11 state"

My investigations have been over delaying starting the DSI video
stream until after enable, but reading the descriptive text for enable
I believe the Pi is correct to be sending video at that point.
I guess there is some ambiguity as to whether the clock lane is going
to be in HS mode during pre_enable. On the Pi the PHY and clocks will
be enabled prior to pre_enable to allow for sending DSI commands
during pre_enable, but it may not be true on other platforms.

  Dave

[1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_bridge.h#L256

> +
> +       /* Reference clock derived from DSI link clock. */
> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> +       regmap_write(ctx->regmap, REG_DSI_CLK,
> +               REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
> +       regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> +               REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> +
> +       /* Set number of DSI lanes and LVDS link config. */
> +       regmap_write(ctx->regmap, REG_DSI_LANE,
> +               REG_DSI_LANE_LVDS_LINK_CFG_DUAL |
> +               REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
> +               /* CHB is DSI85-only, set to default on DSI83/DSI84 */
> +               REG_DSI_LANE_CHB_DSI_LANES(3));
> +       /* No equalization. */
> +       regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
> +
> +       /* RGB888 is the only format supported so far. */
> +       val = (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
> +              REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
> +             (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
> +              REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
> +             REG_LVDS_FMT_CHA_24BPP_MODE;
> +       if (ctx->lvds_dual_link)
> +               val |= REG_LVDS_FMT_CHB_24BPP_MODE;
> +       else
> +               val |= REG_LVDS_FMT_LVDS_LINK_CFG;
> +
> +       regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> +       regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> +       regmap_write(ctx->regmap, REG_LVDS_LANE,
> +               (ctx->lvds_dual_link_even_odd_swap ?
> +                REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> +               REG_LVDS_LANE_CHA_LVDS_TERM |
> +               REG_LVDS_LANE_CHB_LVDS_TERM);
> +       regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> +
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +                         &ctx->mode.hdisplay, 2);
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +                         &ctx->mode.vdisplay, 2);
> +       val = 32 + 1;   /* 32 + 1 pixel clock to ensure proper operation */
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
> +       val = ctx->mode.hsync_end - ctx->mode.hsync_start;
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +                         &val, 2);
> +       val = ctx->mode.vsync_end - ctx->mode.vsync_start;
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +                         &val, 2);
> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +                    ctx->mode.htotal - ctx->mode.hsync_end);
> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
> +                    ctx->mode.vtotal - ctx->mode.vsync_end);
> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +                    ctx->mode.hsync_start - ctx->mode.hdisplay);
> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +                    ctx->mode.vsync_start - ctx->mode.vdisplay);
> +       regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
> +
> +       /* Enable PLL */
> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
> +       usleep_range(3000, 4000);
> +       ret = regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
> +                                       pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
> +                                       1000, 100000);
> +       if (ret) {
> +               dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
> +               /* On failure, disable PLL again and exit. */
> +               regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +               return;
> +       }
> +
> +       /* Trigger reset after CSR register update. */
> +       regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
> +
> +       /* Clear all errors that got asserted during initialization. */
> +       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +       regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> +}
> +
