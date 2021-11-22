Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4A459013
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226C89D61;
	Mon, 22 Nov 2021 14:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FDD89D63
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:19:39 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r25so40727027edq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExLVcm8t4PX+UHPWH3X57MO6JYmQBBOJFtv5rpLtGc8=;
 b=SWxqxjDKt9JErPEH3RLcvo3/3wwyV7XXkJEMUtP3QOvEMIysUDgUDqp8GfxpSQz4ev
 mK9gZS9AaqL1FaM046SNxc40MtmNDAmSsHKCHbFgT4eSVSEjw9A+apqcVEfa08/a/BFc
 G75yAD2jJ+KI0h5WzEkP0rPHADh/eE0XzorOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExLVcm8t4PX+UHPWH3X57MO6JYmQBBOJFtv5rpLtGc8=;
 b=SCvD1zgtuOW81BRKv0tqJhnxUuvJ4ff838MybsQM2DULWSctljLrgYLF/YieqfPcsM
 zWeSlq9bMV1+7hCu7sp/2C/krmy2pO9XP7f8vggzhIHuo/PPbD1or1YyOc3S6ovYuMEE
 J93/ihkSbeG7oGS3VtFg4XlZVSgdsY1N+Ll+9gx1vIjFbza0Widt3qLNqwiJ9noNjar9
 EpG4ER7gPLhyKjxKx+8INf4KuDzVNRyFRueSXpLrPMJ/mWxkRNxeNzckIFmAicKtPMfT
 2Wh+8P0clUH2cEGCqI1YhjkKf5x6t9Jf63v93sXXB81vn1pjEV89RcQ3c3ZSZPrKZ3XQ
 jhkQ==
X-Gm-Message-State: AOAM533/aZuLheFSnrQbH2uDCWK/CRZMgfyUOGOp06F2Bsez0eYwHCVy
 GD2k+FEWkDLs3pamnz2h5wxG+3BsecD87I2IBVj8q/HZdEXH/w==
X-Google-Smtp-Source: ABdhPJwdam8PCtweCHLUYtK9+s+QizRsZftsENKdPxQEDKQz1RoMCzjGav75eg/266o0q1bmzZiQT7dBHXybLAD0934=
X-Received: by 2002:a17:907:250f:: with SMTP id
 y15mr40869188ejl.0.1637590777276; 
 Mon, 22 Nov 2021 06:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
In-Reply-To: <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 19:49:26 +0530
Message-ID: <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
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

Hi Maxime,

On Mon, Nov 22, 2021 at 7:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 07:18:13PM +0530, Jagan Teki wrote:
> > Hi Maxime,
> >
> > On Mon, Nov 22, 2021 at 3:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> > > > Some display panels would come up with a non-DSI output, those
> > > > can have an option to connect the DSI host by means of interface
> > > > bridge converter.
> > > >
> > > > This DSI to non-DSI interface bridge converter would requires
> > > > DSI Host to handle drm bridge functionalities in order to DSI
> > > > Host to Interface bridge.
> > >
> > > In order to do this you would need to use the DRM bridge API...
> >
> > Sorry, which bridge API do you mean?
>
> Any variant of of_drm_find_bridge, and drm_bridge_attach. Just like
> we're doing in sun4i_rgb.c

Yes, we have drm_bridge_attach in bind and bridge_function.attach
calls in this patch and of_drm_find_bridge in sun6i_mipi_dsi_attach.
Not sure which API's I've missed.

>
> > > > This patch convert the existing to a drm bridge driver with a
> > > > built-in encoder support for compatibility with existing
> > > > component drivers.
> > >
> > > ... but changing the encoder driver to a bridge is completely
> > > unnecessary to do so. Why did you need to make that change?
> >
> > Idea of this series is to convert the driver to bridge and use the
> > latest bridge function from the v1 series.
>
> Ok, but it's not at all what you mention in your commit log? You don't
> need any of that in order to support a bridge downstream.

I've mentioned "Converting to bridge driver" and thought it has
meaning of converting encoder related function to bridge functions as
well. Not think about specific description to describe on commit
message. Will update this.

>
> > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > >
> > > > ---
> > > > Changes for v5:
> > > > - add atomic APIs
> > > > - find host and device variant DSI devices.
> > > > Changes for v4, v3:
> > > > - none
> > > >
> > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
> > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> > > >  2 files changed, 96 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > index 43d9c9e5198d..a6a272b55f77 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > @@ -21,6 +21,7 @@
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_mipi_dsi.h>
> > > > +#include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > > >  #include <drm/drm_print.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
> > > >       return 0;
> > > >  }
> > > >
> > > > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > +                                        struct drm_bridge_state *old_bridge_state)
> > > >  {
> > > > -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> > > > -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > > +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> > > >       struct mipi_dsi_device *device = dsi->device;
> > > >       union phy_configure_opts opts = { };
> > > >       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > > > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > >       if (dsi->panel)
> > > >               drm_panel_prepare(dsi->panel);
> > > >
> > > > +     if (dsi->next_bridge)
> > > > +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> > > > +
> > >
> > > Please use the proper helpers.
> >
> > If we use bridge_functions we need to take atomic functions as
> > precedence as the next bridge functions might convert atomic calls.
>
> We've had this discussion over and over again, but this is something
> that needs to be documented and / or in your commit log.
>
> You must not deviate from the standard (and expected) behavior without
> any kind of justification.

Not exactly sure about what you mean, sorry. All these atomic bridge
functions are already documented if I'm not wrong and Laurent have
patches to switch the normal functions to atomic. Not sure what else
need to document here and need justification for it if the driver is
converting to bridge.

>
> > >
> > > >       /*
> > > >        * FIXME: This should be moved after the switch to HS mode.
> > > >        *
> > > > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > >       if (dsi->panel)
> > > >               drm_panel_enable(dsi->panel);
> > > >
> > > > +     if (dsi->next_bridge)
> > > > +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> > > > +
> > >
> > > Ditto
> > >
> > > >       sun6i_dsi_start(dsi, DSI_START_HSC);
> > > >
> > > >       udelay(1000);
> > > > @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > >       sun6i_dsi_start(dsi, DSI_START_HSD);
> > > >  }
> > > >
> > > > -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> > > > +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> > > > +                                         struct drm_bridge_state *old_bridge_state)
> > > >  {
> > > > -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > >
> > > >       DRM_DEBUG_DRIVER("Disabling DSI output\n");
> > > >
> > > >       if (dsi->panel) {
> > > >               drm_panel_disable(dsi->panel);
> > > >               drm_panel_unprepare(dsi->panel);
> > > > +     } else if (dsi->next_bridge) {
> > > > +             dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_state);
> > > > +             dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bridge_state);
> > >
> > > Ditto
> > >
> > > >       }
> > > >
> > > >       phy_power_off(dsi->dphy);
> > > > @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
> > > >       .atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
> > > >  };
> > > >
> > > > -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
> > > > -     .disable        = sun6i_dsi_encoder_disable,
> > > > -     .enable         = sun6i_dsi_encoder_enable,
> > > > +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> > > > +                                enum drm_bridge_attach_flags flags)
> > > > +{
> > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > > +
> > > > +     if (dsi->next_bridge)
> > > > +             return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> > > > +                                      NULL, 0);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
> > > > +     .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > > +     .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > > > +     .atomic_reset           = drm_atomic_helper_bridge_reset,
> > > > +     .atomic_enable          = sun6i_dsi_bridge_atomic_enable,
> > > > +     .atomic_disable         = sun6i_dsi_bridge_atomic_disable,
> > > > +     .attach                 = sun6i_dsi_bridge_attach,
> > > >  };
> > > >
> > > >  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> > > > @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> > > >       struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > > >       int ret;
> > > >
> > > > -     drm_encoder_helper_add(&dsi->encoder,
> > > > -                            &sun6i_dsi_enc_helper_funcs);
> > > >       ret = drm_simple_encoder_init(drm, &dsi->encoder,
> > > >                                     DRM_MODE_ENCODER_DSI);
> > > >       if (ret) {
> > > > @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> > > >       }
> > > >       dsi->encoder.possible_crtcs = BIT(0);
> > > >
> > > > -     drm_connector_helper_add(&dsi->connector,
> > > > -                              &sun6i_dsi_connector_helper_funcs);
> > > > -     ret = drm_connector_init(drm, &dsi->connector,
> > > > -                              &sun6i_dsi_connector_funcs,
> > > > -                              DRM_MODE_CONNECTOR_DSI);
> > > > +     ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> > > >       if (ret) {
> > > > -             dev_err(dsi->dev,
> > > > -                     "Couldn't initialise the DSI connector\n");
> > > > +             dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> > > >               goto err_cleanup_connector;
> > > >       }
> > > >
> > > > -     drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > > > +     if (dsi->panel) {
> > > > +             drm_connector_helper_add(&dsi->connector,
> > > > +                                      &sun6i_dsi_connector_helper_funcs);
> > > > +             ret = drm_connector_init(drm, &dsi->connector,
> > > > +                                      &sun6i_dsi_connector_funcs,
> > > > +                                      DRM_MODE_CONNECTOR_DSI);
> > > > +             if (ret) {
> > > > +                     dev_err(dsi->dev,
> > > > +                             "Couldn't initialise the DSI connector\n");
> > > > +                     goto err_cleanup_connector;
> > > > +             }
> > > > +
> > > > +             drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > > > +     }
> > > >
> > > >       return 0;
> > > >
> > > > @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > >                           struct mipi_dsi_device *device)
> > > >  {
> > > >       struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> > > > -     struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
> > > > +     struct device_node *remote = device->dev.of_node;
> > > >       int ret;
> > > >
> > > > -     if (IS_ERR(panel))
> > > > -             return PTR_ERR(panel);
> > > > +     if (!of_device_is_available(remote)) {
> > > > +             /**
> > > > +              * I2C interfaced DSI bridges will register DSI host on the
> > > > +              * bridge drivers instead of conventional device.
> > > > +              *
> > > > +              * Those are probed via host of_node instead of device of_node.
> > > > +              */
> > >
> > > I have no idea what you mean here. Can you expand on what issue you've
> > > tried to solve here?
> >
> > I2C interface DSI bridges will register DSI host on the bridge
> > drivers.
>
> DSI bridges don't register a DSI host.

Please check what I mean here,
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/bridge/ti-sn65dsi83.c#n623

I've tested it anyway, if you have any relevant one please check as well.

>
> > Those can be found using host->dev->of_node and cannot be find using
> > device->dev.of_node
> >
> > >
> > > > +             remote = of_graph_get_remote_node(host->dev->of_node, 0, 0);
> > > > +             if (!remote)
> > > > +                     return -ENODEV;
> > > > +     }
> > > > +
> > > > +     dsi->panel = of_drm_find_panel(remote);
> > > > +     if (IS_ERR(dsi->panel)) {
> > > > +             dsi->panel = NULL;
> > > > +
> > > > +             dsi->next_bridge = of_drm_find_bridge(remote);
> > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > +                     dev_err(dsi->dev, "failed to find bridge\n");
> > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > +             }
> > > > +     } else {
> > > > +             dsi->next_bridge = NULL;
> > > > +     }
> > > > +
> > > > +     of_node_put(remote);
> > >
> > > Using devm_drm_of_get_bridge would greatly simplify the driver
> >
> > I'm aware of this and this would break the existing sunxi dsi binding,
> > we are not using ports based pipeline in dsi node. Of-course you have
> > pointed the same before, please check below
> > https://patchwork.kernel.org/project/dri-devel/patch/20210322140152.101709-2-jagan@amarulasolutions.com/
>
> Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> bindings and look for a panel or bridge not only through the OF graph,
> but also on the child nodes

Okay. I need to check this.

Thanks,
Jagan.
