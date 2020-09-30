Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2027E731
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 12:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1026E5CE;
	Wed, 30 Sep 2020 10:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF6C6E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 10:52:14 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id 4so344011ooh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpcU89S5Ux9tBMpanFmngTzmFm3m98w9Yf7xEvIIz3c=;
 b=ACMukddV6jQF6EC8v9mnEtXO/2ciwcIO9RVhHv4fwXGwFzZ27AUHNPeerChHna/GwI
 bW9AvDaas8lmvaM2cPAYORYFpW6kYXkT1/8gFXwBbCiblDWKaDqg46/+FbG/0bFv9Mrx
 zKts+H6SXCqEVglatTms0ZuSMoLfYiL6XtWWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpcU89S5Ux9tBMpanFmngTzmFm3m98w9Yf7xEvIIz3c=;
 b=QQ5XqxpJvFrtnplgPYA1kRJvEYS4md4+5kJVWpeBeEiGMmX0T7BLBuN+eJn0jarN3L
 /FFIQBrXIS7rcI+m5a5G4vB42pmZnY1gSdZ25amNan0IcmB8dbeQ9Z5LLuaPIX8VtGeJ
 XnZTBFmhq6ch18ARSKH74ChN/n2cXmbBBAh42JPyxrDVwHg6lyJOUzVx2EZSXQfPWqiw
 2LUOtVAJuipBV6QVazT2BtLedAsN5cI1GWCC/YfImtiweq9DFJcSMfZwSl6oEIERuobL
 8laXXgWae2fX+tndmrc1oIfTvAcXVUACrhr4FheK6wiYYiy2EIdQLfBuu9lYdrjEjWYE
 3gQw==
X-Gm-Message-State: AOAM5336osnyexnhJWpIv3PE3GOE20wn3wrM9CP/EVVnhKouBBEtTQqb
 fLPwBGHM6Af9Ss+xylpTFUQ8PVlEzcNd6P+8/nM6rQ==
X-Google-Smtp-Source: ABdhPJxjuC7yFDm3GPomsZaQG3obqncM3taf4NoWbXWtdITlI3R7/Hig7C3U8nOUZJep6U7oybu8ikwLnL7Hp+qM3AE=
X-Received: by 2002:a4a:3b44:: with SMTP id s65mr1485298oos.85.1601463133335; 
 Wed, 30 Sep 2020 03:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200924083156eucas1p14406128445a655393013effe719f2228@eucas1p1.samsung.com>
 <20200924083145.23312-1-m.szyprowski@samsung.com>
 <1f62b659-4534-c4de-28c1-07043b6468a7@samsung.com>
 <CAKMK7uENE3LroHkiYOX08M1g-dj4gb2JW_DJaDPW12gOPPaz6w@mail.gmail.com>
In-Reply-To: <CAKMK7uENE3LroHkiYOX08M1g-dj4gb2JW_DJaDPW12gOPPaz6w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 12:52:02 +0200
Message-ID: <CAKMK7uGgXQosdfrM7MYmy5hU3EYr1MGwuk=q3o4nj1iXD22tWA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358764: restore connector support
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 12:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 30, 2020 at 12:13 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >
> >
> > W dniu 24.09.2020 o 10:31, Marek Szyprowski pisze:
> > > This patch restores DRM connector registration in the TC358764 bridge
> > > driver and restores usage of the old drm_panel_* API, thus allows dynamic
> > > panel registration. This fixes panel operation on Exynos5250-based
> > > Arndale board.
> > >
> > > This is equivalent to the revert of the following commits:
> > > 1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
> > > 385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
> > > and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
> > > were no-ops and has been removed in meanwhile.
> > >
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> >
> > Regards
> > Andrzej
> > > ---
> > > As I've reported and Andrzej Hajda pointed, the reverted patches break
> > > operation of the panel on the Arndale board. Noone suggested how to fix
> > > the regression, I've decided to send a revert until a new solution is
> > > found.
> > >
> > > The issues with tc358764 might be automatically resolved once the Exynos
> > > DSI itself is converted to DRM bridge:
> > > https://patchwork.kernel.org/cover/11770683/
> > > but that approach has also its own issues so far.
>
> I'm ok with the revert to fix the regression, but I'd kinda like to
> see a bit more than "maybe we fix this in the future". Otherwise this
> nice idea of having a common drm_bridge abstraction is just leading
> towards a complete disaster where every combination of bridge/driver
> works slightly differently. And we're half-way there in that mess
> already I think.

I think minimally it would be good to at least cc tha author of the
commit you're reverting, and getting their ack.

Adding Sam.
-Daniel

>
> Cheers, Daniel
>
> > >
> > > Best regards,
> > > Marek Szyprowski
> > > ---
> > >   drivers/gpu/drm/bridge/tc358764.c | 107 +++++++++++++++++++++++++-----
> > >   1 file changed, 92 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> > > index d89394bc5aa4..c1e35bdf9232 100644
> > > --- a/drivers/gpu/drm/bridge/tc358764.c
> > > +++ b/drivers/gpu/drm/bridge/tc358764.c
> > > @@ -153,9 +153,10 @@ static const char * const tc358764_supplies[] = {
> > >   struct tc358764 {
> > >       struct device *dev;
> > >       struct drm_bridge bridge;
> > > +     struct drm_connector connector;
> > >       struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
> > >       struct gpio_desc *gpio_reset;
> > > -     struct drm_bridge *panel_bridge;
> > > +     struct drm_panel *panel;
> > >       int error;
> > >   };
> > >
> > > @@ -209,6 +210,12 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
> > >       return container_of(bridge, struct tc358764, bridge);
> > >   }
> > >
> > > +static inline
> > > +struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
> > > +{
> > > +     return container_of(connector, struct tc358764, connector);
> > > +}
> > > +
> > >   static int tc358764_init(struct tc358764 *ctx)
> > >   {
> > >       u32 v = 0;
> > > @@ -271,11 +278,43 @@ static void tc358764_reset(struct tc358764 *ctx)
> > >       usleep_range(1000, 2000);
> > >   }
> > >
> > > +static int tc358764_get_modes(struct drm_connector *connector)
> > > +{
> > > +     struct tc358764 *ctx = connector_to_tc358764(connector);
> > > +
> > > +     return drm_panel_get_modes(ctx->panel, connector);
> > > +}
> > > +
> > > +static const
> > > +struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
> > > +     .get_modes = tc358764_get_modes,
> > > +};
> > > +
> > > +static const struct drm_connector_funcs tc358764_connector_funcs = {
> > > +     .fill_modes = drm_helper_probe_single_connector_modes,
> > > +     .destroy = drm_connector_cleanup,
> > > +     .reset = drm_atomic_helper_connector_reset,
> > > +     .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > +     .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > +};
> > > +
> > > +static void tc358764_disable(struct drm_bridge *bridge)
> > > +{
> > > +     struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > > +     int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
> > > +
> > > +     if (ret < 0)
> > > +             dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
> > > +}
> > > +
> > >   static void tc358764_post_disable(struct drm_bridge *bridge)
> > >   {
> > >       struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > >       int ret;
> > >
> > > +     ret = drm_panel_unprepare(ctx->panel);
> > > +     if (ret < 0)
> > > +             dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
> > >       tc358764_reset(ctx);
> > >       usleep_range(10000, 15000);
> > >       ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > @@ -296,28 +335,71 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
> > >       ret = tc358764_init(ctx);
> > >       if (ret < 0)
> > >               dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> > > +     ret = drm_panel_prepare(ctx->panel);
> > > +     if (ret < 0)
> > > +             dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
> > > +}
> > > +
> > > +static void tc358764_enable(struct drm_bridge *bridge)
> > > +{
> > > +     struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > > +     int ret = drm_panel_enable(ctx->panel);
> > > +
> > > +     if (ret < 0)
> > > +             dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
> > >   }
> > >
> > >   static int tc358764_attach(struct drm_bridge *bridge,
> > >                          enum drm_bridge_attach_flags flags)
> > > +{
> > > +     struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > > +     struct drm_device *drm = bridge->dev;
> > > +     int ret;
> > > +
> > > +     if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > > +             DRM_ERROR("Fix bridge driver to make connector optional!");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > > +     ret = drm_connector_init(drm, &ctx->connector,
> > > +                              &tc358764_connector_funcs,
> > > +                              DRM_MODE_CONNECTOR_LVDS);
> > > +     if (ret) {
> > > +             DRM_ERROR("Failed to initialize connector\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     drm_connector_helper_add(&ctx->connector,
> > > +                              &tc358764_connector_helper_funcs);
> > > +     drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> > > +     ctx->connector.funcs->reset(&ctx->connector);
> > > +     drm_connector_register(&ctx->connector);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void tc358764_detach(struct drm_bridge *bridge)
> > >   {
> > >       struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > >
> > > -     return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> > > -                              bridge, flags);
> > > +     drm_connector_unregister(&ctx->connector);
> > > +     ctx->panel = NULL;
> > > +     drm_connector_put(&ctx->connector);
> > >   }
> > >
> > >   static const struct drm_bridge_funcs tc358764_bridge_funcs = {
> > > +     .disable = tc358764_disable,
> > >       .post_disable = tc358764_post_disable,
> > > +     .enable = tc358764_enable,
> > >       .pre_enable = tc358764_pre_enable,
> > >       .attach = tc358764_attach,
> > > +     .detach = tc358764_detach,
> > >   };
> > >
> > >   static int tc358764_parse_dt(struct tc358764 *ctx)
> > >   {
> > > -     struct drm_bridge *panel_bridge;
> > >       struct device *dev = ctx->dev;
> > > -     struct drm_panel *panel;
> > >       int ret;
> > >
> > >       ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > @@ -326,16 +408,12 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
> > >               return PTR_ERR(ctx->gpio_reset);
> > >       }
> > >
> > > -     ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > -     if (IS_ERR(panel_bridge))
> > > -             return PTR_ERR(panel_bridge);
> > > +     ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> > > +                                       NULL);
> > > +     if (ret && ret != -EPROBE_DEFER)
> > > +             dev_err(dev, "cannot find panel (%d)\n", ret);
> > >
> > > -     ctx->panel_bridge = panel_bridge;
> > > -     return 0;
> > > +     return ret;
> > >   }
> > >
> > >   static int tc358764_configure_regulators(struct tc358764 *ctx)
> > > @@ -381,7 +459,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
> > >               return ret;
> > >
> > >       ctx->bridge.funcs = &tc358764_bridge_funcs;
> > > -     ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> > >       ctx->bridge.of_node = dev->of_node;
> > >
> > >       drm_bridge_add(&ctx->bridge);
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
