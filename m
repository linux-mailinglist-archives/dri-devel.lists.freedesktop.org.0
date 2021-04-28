Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB136D4A2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3A6EAD5;
	Wed, 28 Apr 2021 09:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A6C6EAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:17:44 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so5063390pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VWnJhFJs5PcapKOl8wPoWCcR0ioSFVj/tMjHlFjqGj8=;
 b=mrxvpO+cWUL1aies2Z+tSUfNvUR+D+S9OE05lgnrLN9ZzFh5+mkRIbgUOtZdGiSOcf
 JS7PdA2bj3GKa2K2O9avvLMRoVEe7X7i+JaKmt1wEskjh+NXZ26EbTU91oxYK6zBUKVq
 BgnmAfuQ0bsRTamW8q+36Eir0Z6dHo1i6EIT8o/oH28rWEPb60kA/cjUsviWGrfOuRrj
 KPZwbMbEjm+aMSn2RFzDj3zlUF6YeMwnoLVUIPvTKUId2NtM63YeKGowDQiVQ7SWXh8x
 pygBOFLorXL6cmkY0XH8NsFVUVn73hrXHQqK6C54O1dM+8ceP6v4edlIew7Di+ZP2cpQ
 zqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWnJhFJs5PcapKOl8wPoWCcR0ioSFVj/tMjHlFjqGj8=;
 b=gk0R0emX3U4Pcxq92liJnHtitEal/CZUuxP0HBGLzyQJqJZ0bGQJFaEP1STq4/CT9t
 3UUXLXUKNQk7cUkBYKVMFKKLLspgmC0rDp1B2RONjQVTNI/XOxAJTdWDXRe0GcJv/3fS
 687qOSAnW+yd7D1i4n+o9+6AHdv8nyz5WOF9E6tJZ8TQk86uYLkT0X1YT35XoKfAYBL2
 VEENm4NFc0fYZI5Wc3NDaa0Nt7RwM8ueAgz5ZkjRCQCmegqqEHMfiEAyf+XS3Ak5noVP
 PoA6bc2YBAWEdgrF7zvzmmHuC7cEFs1T/cz9pKwAd1UC3EGiHpYNChnqvtA7LgXXuH5F
 v/pQ==
X-Gm-Message-State: AOAM533m9gcPzhFImZWYicThnPsWI21iVJAOj7CvL/c0vivZ3XfD4Yzi
 0mo1txyewobuqnBGkqtc5eAr1QuvNvub6jiG7c+XLw==
X-Google-Smtp-Source: ABdhPJxnnMw/coc/h6SQazDPLA9OWbo7UJvOUY2+VbOhsvj74p1j9i+W/eQW7gec8kuS/9BXe3eFXSUa2wiWImIhKAs=
X-Received: by 2002:a17:902:ea09:b029:ed:6f42:18c5 with SMTP id
 s9-20020a170902ea09b02900ed6f4218c5mr3189259plg.49.1619601463494; Wed, 28 Apr
 2021 02:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
In-Reply-To: <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 28 Apr 2021 11:26:23 +0200
Message-ID: <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Apr 2021 at 10:13, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 28.04.21 09:51, Frieder Schrempf wrote:
> > On 22.04.21 00:31, Marek Vasut wrote:
> >> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> >> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> >> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> >> but easy to add.
> >>
> >> The driver operates the chip via I2C bus. Currently the LVDS clock are
> >> always derived from DSI clock lane, which is the usual mode of operation.
> >> Support for clock from external oscillator is not implemented, but it is
> >> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> >> LVDS666 is not supported, but could be added if needed.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Douglas Anderson <dianders@chromium.org>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Stephen Boyd <swboyd@chromium.org>
> >> Cc: Valentin Raevsky <valentin@compulab.co.il>
> >> To: dri-devel@lists.freedesktop.org
> >> Tested-by: Loic Poulain <loic.poulain@linaro.org>
> >> ---
> >> V2: - Use dev_err_probe()
> >>      - Set REG_RC_RESET as volatile
> >>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
> >>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
> >>      - Add tested DSI84 support in dual-link mode
> >>      - Correctly set VCOM
> >>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
> >>        datasheets, with that all the reserved bits make far more sense
> >>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> >> ---
> >>   drivers/gpu/drm/bridge/Kconfig        |  10 +
> >>   drivers/gpu/drm/bridge/Makefile       |   1 +
> >>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 617 ++++++++++++++++++++++++++
> >>   3 files changed, 628 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>
> > [...]
> >> +static int sn65dsi83_probe(struct i2c_client *client,
> >> +               const struct i2c_device_id *id)
> >> +{
> >> +    struct device *dev = &client->dev;
> >> +    enum sn65dsi83_model model;
> >> +    struct sn65dsi83 *ctx;
> >> +    int ret;
> >> +
> >> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> >> +    if (!ctx)
> >> +        return -ENOMEM;
> >> +
> >> +    ctx->dev = dev;
> >> +
> >> +    if (dev->of_node)
> >> +        model = (enum sn65dsi83_model)of_device_get_match_data(dev);
> >> +    else
> >> +        model = id->driver_data;
> >> +
> >> +    /* Default to dual-link LVDS on all but DSI83. */
> >> +    if (model != MODEL_SN65DSI83)
> >> +        ctx->lvds_dual_link = true;
> >
> > What if I use the DSI84 with a single link LVDS? I can't see any way to
> > configure that right now.

I assume the simplest way would be to use the "ti,sn65dsi83"
compatible string in your dts, since the way you wired it is
'compatible' with sn65dsi83, right?

>
> I just saw the note in the header of the driver that says that single
> link mode is unsupported for the DSI84.
>
> I have hardware with a single link display and if I set
> ctx->lvds_dual_link = false it works just fine.
>
> How is this supposed to be selected? Does it need an extra devicetree
> property? And would you mind adding single-link support in the next
> version or do you prefer adding it in a follow-up patch?

If this has to be supported I think the proper way would be to support
two output ports in the dts (e.g. lvds0_out, lvds1_out), in the same
way as supported by the 'advantech,idk-2121wr' panel.

Regards,
Loic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
