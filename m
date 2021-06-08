Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A740039F0BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAE26EB2C;
	Tue,  8 Jun 2021 08:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6D6EB2C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:22:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFEFD3E6;
 Tue,  8 Jun 2021 10:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623140563;
 bh=Dn4741oh9pt5dOB5B+XzS7cURT9AnSlP1+ISJqSmg9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tgwP7W+pI4+3B+xE+CteunOH71ZqZ8nm0fZd0inimkZbh2hJyNJvW7UVvOkvxbUfs
 NVKdu2xRuFosXYgn7iXKXmoi7AfX31Q8pcqyGQYm2M1m0llcQ2uf7I43U8xA2Cdoa3
 rvoUYe44sGsqipSzdihVso5qsPo6gRg8TcPaudqo=
Date: Tue, 8 Jun 2021 11:22:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH V6 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
Message-ID: <YL8ow4Bck1KTxjhd@pendragon.ideasonboard.com>
References: <20210607174258.16300-1-marex@denx.de>
 <20210607174258.16300-2-marex@denx.de>
 <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 ch@denx.de, Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Jun 08, 2021 at 10:10:05AM +0200, Neil Armstrong wrote:
> On 07/06/2021 19:42, Marek Vasut wrote:
> > Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> > and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> > bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> > but easy to add.
> > 
> > The driver operates the chip via I2C bus. Currently the LVDS clock are
> > always derived from DSI clock lane, which is the usual mode of operation.
> > Support for clock from external oscillator is not implemented, but it is
> > easy to add if ever needed. Only RGB888 pixel format is implemented, the
> > LVDS666 is not supported, but could be added if needed.
> > 
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Adam Ford <aford173@gmail.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Loic Poulain <loic.poulain@linaro.org>
> > Cc: Philippe Schenker <philippe.schenker@toradex.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Valentin Raevsky <valentin@compulab.co.il>
> > To: dri-devel@lists.freedesktop.org
> > ---
> > V2: - Use dev_err_probe()
> >     - Set REG_RC_RESET as volatile
> >     - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
> >     - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
> >     - Add tested DSI84 support in dual-link mode
> >     - Correctly set VCOM
> >     - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
> >       datasheets, with that all the reserved bits make far more sense
> >       as the DSI83 and DSI84 seems to be reduced version of DSI85
> > V3: - Handle the dual-link LVDS with two port panel or bridge
> > V4: - Add RB from Linus Walleij
> >     - Rename REG_DSI_LANE_LVDS_LINK_CFG_DUAL to
> >       REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE and fill in the remaining
> >       DSI link options from DSI85 datasheet. DSI85 can do dual and 2x
> >       single DSI mode, but DSI85 is currently unsupported by the
> >       driver. Add a comment about DSI85, so that all the places which
> >       need to be adjusted for DSI85 are marked accordingly.
> >     - Add REG_DSI_LANE_LEFT_RIGHT_PIXELS bit for DSI
> >     - Add handling for JEIDA18/JEIDA24/SPWG24 LVDS formats. Use SPWG24
> >       as fallback on output bridges until they are all fixed.
> >     - Patch DSI bus format to fixed RGB888_1X24 instead of passing
> >       through the LVDS bus format.
> > V5: - Move bus format patching to mode_fixup
> >     - Use cpu_to_le16() to guarantee endianness in regmap_bulk_write()
> > V6: - Cast of_device_get_match_data() output to uintptr_t first
> > ---
> >  drivers/gpu/drm/bridge/Kconfig        |  10 +
> >  drivers/gpu/drm/bridge/Makefile       |   1 +
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 709 ++++++++++++++++++++++++++
> >  3 files changed, 720 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > 
> 
> Looks complete & well reviewed, LGTM
> 
> Rob, Laurent ? is it ok for you ?

No objection.

-- 
Regards,

Laurent Pinchart
