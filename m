Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586DC490B8B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41C210E3C2;
	Mon, 17 Jan 2022 15:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8B310E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:38:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id j7so18833485edr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcNpmqqJKSmivL/+54T7t8r4vJ3w+pcIpVP06NjWKW8=;
 b=SS+O8MzxHjordoK9WXjIJX+mUwEuW3lda3jwo17zAc3qW3wQ/U1clguPH9cNdPX3SR
 kPNcg5bKbqIaSm52+b3f2EVgDXa+XmDWmThq3f+Z5I64QylrDq3h7YBPikfRe34R5+Wl
 zc4yCl4F3J+a+7PmU1b5Q5rHHqcuKD8wZGReE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcNpmqqJKSmivL/+54T7t8r4vJ3w+pcIpVP06NjWKW8=;
 b=2YRBWvQFnN8jOn2cHd1iBjC7IODXjZmFTEWbenosnoATGXrBnOVIP20U+X3f/rvj5W
 ggkEeqtvR5nJxuz4JFOMVJs6LKzzW11WLOTmsf7M30vV4E33IGiJUOm1d2qzaDgg6KDv
 7Z7hzyWzursbfewVvfzDsitT9BANiV7v1bOe/oR5/YbEZcfYEIj92Yq//UnnBiai/kjW
 GTzlW8R/8VX5kkkW32KS2TRbGhNOP+fMtmzfoXv4qPGyZn65g1LaLfL1TXJtPA7ebTSB
 4eE6B5Rpgl2/PotcEMIGWVa8Lve1lbcIWFaloGJAK9p0TmoPAXylUB5h/3XifH6cDRz0
 TGOw==
X-Gm-Message-State: AOAM530Yoj+8ECaaVbQtr2olj5DL8ggnPD8Kq237Iv8wRnXNdvS6MjuT
 5uFI45/rVmZJ+TgYNM8CuIxyLl+0hol518UseD+5jA==
X-Google-Smtp-Source: ABdhPJzTpOpufjy+nqDjy/3vJMw0IPuj6N2X/gB6UmWXw1QoYOO3HTHapeiJL6qk3kcGHKgq3qUwlFpuycuNnjiRyvU=
X-Received: by 2002:a17:906:7c50:: with SMTP id
 g16mr9103881ejp.760.1642433920780; 
 Mon, 17 Jan 2022 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-4-jagan@amarulasolutions.com>
 <20211213171757.bxu57eaqawmp5kwh@houat>
In-Reply-To: <20211213171757.bxu57eaqawmp5kwh@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Jan 2022 21:08:29 +0530
Message-ID: <CAMty3ZBXUart1GZod2v=bMv2xYxuDjkyEw-WZ8bMDsCLU1gVWA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm: sun4i: dsi: Add bridge support
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 10:48 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Dec 10, 2021 at 04:47:08PM +0530, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output, those
> > can have an option to connect the DSI host by means of interface
> > bridge converter.
> >
> > This DSI to non-DSI interface bridge converter would require
> > DSI Host to handle drm bridge functionalities in order to
> > communicate interface bridge.
> >
> > This patch adds support for bridge functionalities in Allwinner
> > DSI controller.
> >
> > Supporting down-stream bridge makes few changes in the driver.
> >
> > - It drops drm_connector and related operations as drm_bridge_attach
> >   creates connector during attachment.
> >
> > - It drop panel pointer and iterate the bridge, so-that it can operate
> >   the normal bridge and panel_bridge in constitutive callbacks.
> >
> > - It uses devm_drm_of_get_bridge for panel or bridge lookup. It uses
> >   port 0 and endpoint 0 to support I2C-based bridges eventhough the
> >   usual Allwinner DSI OF graph doesn't require this for panel and
> >   non-I2C based downstream bridges.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v6:
> > - support donwstream bridge
> > - drop bridge conversion
> > - devm_drm_of_get_bridge() require child lookup
> > https://patchwork.kernel.org/project/dri-devel/cover/20211207054747.461029-1-jagan@amarulasolutions.com/
> > Changes for v5:
> > - add atomic APIs
> > - find host and device variant DSI devices.
> > Changes for v4, v3:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 83 ++++++++++----------------
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  9 +--
> >  2 files changed, 33 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 9cf91dcac3f2..f1d612bf1a0b 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -21,6 +21,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -720,6 +721,7 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       struct mipi_dsi_device *device = dsi->device;
> >       union phy_configure_opts opts = { };
> >       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > +     struct drm_bridge *iter;
> >       u16 delay;
> >       int err;
> >
> > @@ -769,8 +771,10 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       phy_configure(dsi->dphy, &opts);
> >       phy_power_on(dsi->dphy);
> >
> > -     if (dsi->panel)
> > -             drm_panel_prepare(dsi->panel);
> > +     list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> > +             if (iter->funcs->pre_enable)
> > +                     iter->funcs->pre_enable(iter);
> > +     }
>
> Like we discussed in the previous version already, this is unnecessary,
> just like the poking at bridge_chain in the encoder.

Unlike previous patch, this patch not doing bridge conversion it is
supporting downstream bridge. Yes, it is possible to use bridge helper
for invoking downstream bridge enable when bridge functions added.

Thanks,
Jagan.
