Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324B39F2AA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DDE6EB80;
	Tue,  8 Jun 2021 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DF66EB80
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:42:13 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d16so15253101pfn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vhy5MlQm07Oph4hMAMoEWQEl366GPQVgpoLXrSn256E=;
 b=dJ7iA1lXBJYeJUJUDF+rbz/7017YH5ZpYFshwEMlg90UfRPHEulvL3vae5t2Jg+rgC
 bpuaXN3kJkJPkGnKjNcvXHFYVqiqwep/NiYT/bwkSaDepH5gRDIEp127zpF3mmP+mtRC
 9IACXQ714dBfGe8nJgadcodIWD6ORmhGgN3MYEGA35vMQCpQhps5MzJDtTu4PU3tDMDl
 jP1V5XCiYorGJMtrEoyiGVGIOeVhW079SYGfNWgmAWmYk+cjWxUnBWi7Mk1sPhwmPrEw
 xuGCriXCWdk7YJJ1sVB1sJlnkCVgbtIMzBWkD2soZ5BUjhuOCpJTXEnQXjeQM+Iq2MRy
 Pe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vhy5MlQm07Oph4hMAMoEWQEl366GPQVgpoLXrSn256E=;
 b=WoEGkDWm0GfRJ0Pjnj8BQf20KMAefrmMSCsSv9y0YJiwLb2hGoNOTLAheP/wOmA4v1
 322FI8QTKs1CgXouGKefP6WNX6jdhf+dW/TE2zDRHhZ6bBUT1jNFLQS4/mqp6hbDtYJ9
 bMhwkp5/bCKB8ePWz+80B1ebSpSamLYNYlvXgcdVHvfM7ABbbro8j8H2GR5kuCeDf+mN
 ZQ2+6GHYtYQtC0276/7tqC3dZDs7Qds0l9YFZEqHfSflJtBtNvJy2rEQTDdgHXHDi2OS
 MHaCbkTgJoao/6ApnVv1jR45sE1q+96Oxu65+wgj7ssbYWYEWf7aul14g+AiUBPv4mKZ
 F1ow==
X-Gm-Message-State: AOAM532/YCOQ6Ag0sKQGuXXZVCDtEDowjawWDn1iFuE61b/j4abiLS/5
 0vbzX71OiLqu1vm/jmRxXJYy8rqyFDLlTpuItekJuQ==
X-Google-Smtp-Source: ABdhPJzX5WIfIIwC6GALp75EEyd9a0dpbXKi0jCl6+TBcsRCusux+5TDgMxdURKTjij8ECvwK9VXt2SE43DcmVkgXEY=
X-Received: by 2002:a62:8fc8:0:b029:2ec:9b7a:f59e with SMTP id
 n191-20020a628fc80000b02902ec9b7af59emr17850263pfd.39.1623145332791; Tue, 08
 Jun 2021 02:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210607174258.16300-1-marex@denx.de>
 <20210607174258.16300-2-marex@denx.de>
 <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
 <CAG3jFys9F5Nt5cTEUKF7yaMAL5pyW6Kn73h4P2SDFhiBDb6pRg@mail.gmail.com>
 <c518ba40-31d4-7418-b921-577388af3acc@denx.de>
In-Reply-To: <c518ba40-31d4-7418-b921-577388af3acc@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 8 Jun 2021 11:42:02 +0200
Message-ID: <CAG3jFyvCxfzK1UrgapDZvota-DFmmuowaiBoLOXB_y2Gb2-1GA@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
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
 Neil Armstrong <narmstrong@baylibre.com>, Adam Ford <aford173@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Jun 2021 at 11:34, Marek Vasut <marex@denx.de> wrote:
>
> On 6/8/21 10:51 AM, Robert Foss wrote:
> > Hey Neil,
> >
> > On Tue, 8 Jun 2021 at 10:10, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Hi,
> >>
> >> On 07/06/2021 19:42, Marek Vasut wrote:
> >>> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> >>> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> >>> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> >>> but easy to add.
> >>>
> >>> The driver operates the chip via I2C bus. Currently the LVDS clock are
> >>> always derived from DSI clock lane, which is the usual mode of operation.
> >>> Support for clock from external oscillator is not implemented, but it is
> >>> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> >>> LVDS666 is not supported, but could be added if needed.
> >>>
> >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>> Tested-by: Adam Ford <aford173@gmail.com>
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>> Cc: Douglas Anderson <dianders@chromium.org>
> >>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>> Cc: Loic Poulain <loic.poulain@linaro.org>
> >>> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> >>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>> Cc: Stephen Boyd <swboyd@chromium.org>
> >>> Cc: Valentin Raevsky <valentin@compulab.co.il>
> >>> To: dri-devel@lists.freedesktop.org
> >>> ---
> >>> V2: - Use dev_err_probe()
> >>>      - Set REG_RC_RESET as volatile
> >>>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
> >>>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
> >>>      - Add tested DSI84 support in dual-link mode
> >>>      - Correctly set VCOM
> >>>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
> >>>        datasheets, with that all the reserved bits make far more sense
> >>>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> >>> V3: - Handle the dual-link LVDS with two port panel or bridge
> >>> V4: - Add RB from Linus Walleij
> >>>      - Rename REG_DSI_LANE_LVDS_LINK_CFG_DUAL to
> >>>        REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE and fill in the remaining
> >>>        DSI link options from DSI85 datasheet. DSI85 can do dual and 2x
> >>>        single DSI mode, but DSI85 is currently unsupported by the
> >>>        driver. Add a comment about DSI85, so that all the places which
> >>>        need to be adjusted for DSI85 are marked accordingly.
> >>>      - Add REG_DSI_LANE_LEFT_RIGHT_PIXELS bit for DSI
> >>>      - Add handling for JEIDA18/JEIDA24/SPWG24 LVDS formats. Use SPWG24
> >>>        as fallback on output bridges until they are all fixed.
> >>>      - Patch DSI bus format to fixed RGB888_1X24 instead of passing
> >>>        through the LVDS bus format.
> >>> V5: - Move bus format patching to mode_fixup
> >>>      - Use cpu_to_le16() to guarantee endianness in regmap_bulk_write()
> >>> V6: - Cast of_device_get_match_data() output to uintptr_t first
> >>> ---
> >>>   drivers/gpu/drm/bridge/Kconfig        |  10 +
> >>>   drivers/gpu/drm/bridge/Makefile       |   1 +
> >>>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 709 ++++++++++++++++++++++++++
> >>>   3 files changed, 720 insertions(+)
> >>>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>
> >>
> >> Looks complete & well reviewed, LGTM
> >>
> >> Rob, Laurent ? is it ok for you ?
> >
> > This does look like it is ready. I was just about to merge it, but
> > found some checkpatch --strict formatting warnings. Do you mind fixing
> > those in a real quick v7?
>
> We already discussed this thing with open parenthesis alignment before
> in one of the previous versions of this series, and the readability of
> the driver was worse with that change in place.
>
> Is this change now a blocker ?

Ah, sorry I missed that part of the conversation. In that case no.
Let's go ahead.
