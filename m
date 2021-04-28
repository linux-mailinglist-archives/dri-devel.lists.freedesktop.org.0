Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41A736D4FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78946EADC;
	Wed, 28 Apr 2021 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824236EADC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:49:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s15so73460027edd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGAJvruChPnYiH51fZvSk4VLl8s1I49o26Aa7OXDjYo=;
 b=oAmIX6aIdk1gnrFzBJ1HQHaRsyqnTZgmUk4jgnc0hGy6c4xdku459WyGKpTedIe/HI
 7iKa5yG1rrHMLewc6ngee1EaD8sWR5zkEuSs/eoR9T3opcdw5HIEPoJRhilXLPgkcsDr
 nKtHYsO3x8hjkO9X/y+THno4/N0LaqUmeLSVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGAJvruChPnYiH51fZvSk4VLl8s1I49o26Aa7OXDjYo=;
 b=Ttmt9/IiIG+o1DdPu0GIL/b7ajr968jmGA6oTdfYC+0Efh97KXijjgl9ooCccfyA0n
 8AvWWhiuumjH+DgLSBdL+eeeVXzibhxjinwisV4RltexWax7gu7dGdtUTgZQHWYKNccd
 MniVcg5L/0Z7fxiXWOTctyllD5Ajs/IN/0EhfMbJQ9va0/x3bRLCMOHKDZyy146DMmuo
 /UFPPEu6g6FAkQhMyiDEFLXhzHi6QQRlD33PSlpePQ/LJ1Ad++VvIpFVvPYjAjyao+VB
 X/AEhGeKOPLGMg3GKJ90Hgpm+uhh5K5wUnnGI05MAF0v4BitFpUeiL78L4mQixzdnGX6
 8b7A==
X-Gm-Message-State: AOAM533sOthyS4OofXA4QmNcZ9YFuHOo8Uxv7y+ClybD4fVufDgzlDXd
 jkV5pCmw/LdgUnGgtuKJ5arxAagrUdRlf8YDCtjeQQ==
X-Google-Smtp-Source: ABdhPJxNXaZXZWPn3glHouXP6ygKky/uJfWvoKHQvcjOyQA8YZQXj4ADDf/+5JaJUBpXw5oRfpMP8BJWL6yZzBOwF0g=
X-Received: by 2002:a05:6402:3079:: with SMTP id
 bs25mr9905258edb.369.1619603377181; 
 Wed, 28 Apr 2021 02:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
 <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
 <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
In-Reply-To: <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 28 Apr 2021 15:19:25 +0530
Message-ID: <CAMty3ZApt3y_mqjL-zNcTWEz=QXxBKM9vXM2YTvQa5Dt552TZQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Neil Armstrong <narmstrong@baylibre.com>,
 Loic Poulain <loic.poulain@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Claudius Heine <ch@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 2:54 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 28/04/2021 11:26, Loic Poulain wrote:
> > On Wed, 28 Apr 2021 at 10:13, Frieder Schrempf
> > <frieder.schrempf@kontron.de> wrote:
> >>
> >> On 28.04.21 09:51, Frieder Schrempf wrote:
> >>> On 22.04.21 00:31, Marek Vasut wrote:
> >>>> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> >>>> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> >>>> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> >>>> but easy to add.
> >>>>
> >>>> The driver operates the chip via I2C bus. Currently the LVDS clock are
> >>>> always derived from DSI clock lane, which is the usual mode of operation.
> >>>> Support for clock from external oscillator is not implemented, but it is
> >>>> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> >>>> LVDS666 is not supported, but could be added if needed.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> Cc: Douglas Anderson <dianders@chromium.org>
> >>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> >>>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>>> Cc: Stephen Boyd <swboyd@chromium.org>
> >>>> Cc: Valentin Raevsky <valentin@compulab.co.il>
> >>>> To: dri-devel@lists.freedesktop.org
> >>>> Tested-by: Loic Poulain <loic.poulain@linaro.org>
> >>>> ---
> >>>> V2: - Use dev_err_probe()
> >>>>      - Set REG_RC_RESET as volatile
> >>>>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
> >>>>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
> >>>>      - Add tested DSI84 support in dual-link mode
> >>>>      - Correctly set VCOM
> >>>>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
> >>>>        datasheets, with that all the reserved bits make far more sense
> >>>>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> >>>> ---
> >>>>   drivers/gpu/drm/bridge/Kconfig        |  10 +
> >>>>   drivers/gpu/drm/bridge/Makefile       |   1 +
> >>>>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 617 ++++++++++++++++++++++++++
> >>>>   3 files changed, 628 insertions(+)
> >>>>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>>
> >>> [...]
> >>>> +static int sn65dsi83_probe(struct i2c_client *client,
> >>>> +               const struct i2c_device_id *id)
> >>>> +{
> >>>> +    struct device *dev = &client->dev;
> >>>> +    enum sn65dsi83_model model;
> >>>> +    struct sn65dsi83 *ctx;
> >>>> +    int ret;
> >>>> +
> >>>> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> >>>> +    if (!ctx)
> >>>> +        return -ENOMEM;
> >>>> +
> >>>> +    ctx->dev = dev;
> >>>> +
> >>>> +    if (dev->of_node)
> >>>> +        model = (enum sn65dsi83_model)of_device_get_match_data(dev);
> >>>> +    else
> >>>> +        model = id->driver_data;
> >>>> +
> >>>> +    /* Default to dual-link LVDS on all but DSI83. */
> >>>> +    if (model != MODEL_SN65DSI83)
> >>>> +        ctx->lvds_dual_link = true;
> >>>
> >>> What if I use the DSI84 with a single link LVDS? I can't see any way to
> >>> configure that right now.
> >
> > I assume the simplest way would be to use the "ti,sn65dsi83"
> > compatible string in your dts, since the way you wired it is
> > 'compatible' with sn65dsi83, right?
>
> No this isn't the right way to to, if sn65dsi84 is supported and the bindings only support single lvds link,
> the driver must only support single link on sn65dsi84, or add the dual link lvds in the bindings only for sn65dsi84.
>
> >
> >>
> >> I just saw the note in the header of the driver that says that single
> >> link mode is unsupported for the DSI84.
> >>
> >> I have hardware with a single link display and if I set
> >> ctx->lvds_dual_link = false it works just fine.
> >>
> >> How is this supposed to be selected? Does it need an extra devicetree
> >> property? And would you mind adding single-link support in the next
> >> version or do you prefer adding it in a follow-up patch?
> >
> > If this has to be supported I think the proper way would be to support
> > two output ports in the dts (e.g. lvds0_out, lvds1_out), in the same
> > way as supported by the 'advantech,idk-2121wr' panel.
>
> Yes, this is why I asked to have the dual-link lvds in the bindings.

Agreed with Neil, this is what we discussed on my v3. Each of these 3
chips has its own compatible and supporting dual-link lvds and
dual-link dsi as to be done by 84/85 and 85 respectively.

Maybe I can push my configuration changes in gist if required?

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
