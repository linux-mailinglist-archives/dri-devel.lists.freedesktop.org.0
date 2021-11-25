Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12745DE89
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 17:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E212A6E02E;
	Thu, 25 Nov 2021 16:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675326E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:18:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so27975839edd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKugvJ9n3GOzSEfIVIDLjT9SObFLEev7/VUbg0QYI60=;
 b=jA6Xwz7o3Pn6kf+x2K76koDJIp9P++8Dv6IOOgkLw/RaocYYxu6YVqn59oDBSxww8M
 Fw4ouBfXwYS58c60SeHKAmXYQ9ct9XOKrIGAJcZy+p2U09UrL8DeU2FqOq+9NMPxYiAa
 6QiEmYhmArSnXQ3q8ct9h42asOQnzb2DUG3wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKugvJ9n3GOzSEfIVIDLjT9SObFLEev7/VUbg0QYI60=;
 b=wJbj6GjvSmjkBRKG32znkpXc+e1+aHHfBoWTmA6OvmRITs2ZFMnZTK1sC3YPBjop0T
 Uly7bnWfXq9bHPbWZIu06rbImix8vKXW4rouqwAdQ15LXOKW6T3bk4fkmA7BmfDRq1xf
 KesJrfRql/hCO7fWAvcXUE/tcr5EhH3f49w2o9ad5AiEtNstg9uxV/ibLtWz47yW2X/i
 svpOaphxis7gXeevmMgQI+CxoIM3GBDq6BaNKhRSum2tNTXOhSTL9KACW6oqxUFjq8BP
 O+i/NBOGsKQMRMXlAUAhzPQ2aJfful56ITOUDm19Mn90mQHxgETvmT75dTaT99HKVNl9
 Xzgg==
X-Gm-Message-State: AOAM531I1FWSq/Yjx4gpBB/+0kLefc9pYI+/N5bnE98ajPSDMdYn8lo/
 i/eEm55Iim0F0vquoBDqqlX8iOeU8uEDQUvSwnWueA==
X-Google-Smtp-Source: ABdhPJw8tf9VDwxLIGm78KbWrvmESJLpuEDI0VtEziVrAxqCC0bOMV84LAgFzaKuiQNTggkENJWpqZZD9DDyK3+IxYo=
X-Received: by 2002:a05:6402:445:: with SMTP id
 p5mr41030370edw.110.1637857082791; 
 Thu, 25 Nov 2021 08:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <20211122150449.4nqblhdidb5742x3@gilmour>
In-Reply-To: <20211122150449.4nqblhdidb5742x3@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 25 Nov 2021 21:47:51 +0530
Message-ID: <CAMty3ZD=9HN-e2LSVhHK4RHp5MLn7Qre6DGrqLraXNYNXwTf8w@mail.gmail.com>
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

On Mon, Nov 22, 2021 at 8:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 07:49:26PM +0530, Jagan Teki wrote:
> > On Mon, Nov 22, 2021 at 7:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Mon, Nov 22, 2021 at 07:18:13PM +0530, Jagan Teki wrote:
> > > > On Mon, Nov 22, 2021 at 3:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> > > > > > Some display panels would come up with a non-DSI output, those
> > > > > > can have an option to connect the DSI host by means of interface
> > > > > > bridge converter.
> > > > > >
> > > > > > This DSI to non-DSI interface bridge converter would requires
> > > > > > DSI Host to handle drm bridge functionalities in order to DSI
> > > > > > Host to Interface bridge.
> > > > >
> > > > > In order to do this you would need to use the DRM bridge API...
> > > >
> > > > Sorry, which bridge API do you mean?
> > >
> > > Any variant of of_drm_find_bridge, and drm_bridge_attach. Just like
> > > we're doing in sun4i_rgb.c
> >
> > Yes, we have drm_bridge_attach in bind and bridge_function.attach
> > calls in this patch and of_drm_find_bridge in sun6i_mipi_dsi_attach.
> > Not sure which API's I've missed.
>
> None, that's my point, you don't need anything else in order to do what
> you wanted to achieve.

Correct, the order is some how confused in this patch. I will fix it
in next version.

>
> > >
> > > > > > This patch convert the existing to a drm bridge driver with a
> > > > > > built-in encoder support for compatibility with existing
> > > > > > component drivers.
> > > > >
> > > > > ... but changing the encoder driver to a bridge is completely
> > > > > unnecessary to do so. Why did you need to make that change?
> > > >
> > > > Idea of this series is to convert the driver to bridge and use the
> > > > latest bridge function from the v1 series.
> > >
> > > Ok, but it's not at all what you mention in your commit log? You don't
> > > need any of that in order to support a bridge downstream.
> >
> > I've mentioned "Converting to bridge driver" and thought it has
> > meaning of converting encoder related function to bridge functions as
> > well. Not think about specific description to describe on commit
> > message. Will update this.
>
> But you provided no reason to do so. The only one you did mention was
> that you wanted to support downstream bridges, but you don't need to
> convert the DSI driver to a bridge in order to do that.

Okay. Look like I've combined both downstream bridge support and
converting bridge together. This what it totally confused, I will fix
it.

>
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > >
> > > > > > ---
> > > > > > Changes for v5:
> > > > > > - add atomic APIs
> > > > > > - find host and device variant DSI devices.
> > > > > > Changes for v4, v3:
> > > > > > - none
> > > > > >
> > > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
> > > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> > > > > >  2 files changed, 96 insertions(+), 23 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > > index 43d9c9e5198d..a6a272b55f77 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > > @@ -21,6 +21,7 @@
> > > > > >
> > > > > >  #include <drm/drm_atomic_helper.h>
> > > > > >  #include <drm/drm_mipi_dsi.h>
> > > > > > +#include <drm/drm_of.h>
> > > > > >  #include <drm/drm_panel.h>
> > > > > >  #include <drm/drm_print.h>
> > > > > >  #include <drm/drm_probe_helper.h>
> > > > > > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > > > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > > > +                                        struct drm_bridge_state *old_bridge_state)
> > > > > >  {
> > > > > > -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> > > > > > -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > > > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > > > > +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> > > > > >       struct mipi_dsi_device *device = dsi->device;
> > > > > >       union phy_configure_opts opts = { };
> > > > > >       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > > > > > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > > >       if (dsi->panel)
> > > > > >               drm_panel_prepare(dsi->panel);
> > > > > >
> > > > > > +     if (dsi->next_bridge)
> > > > > > +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> > > > > > +
> > > > >
> > > > > Please use the proper helpers.
> > > >
> > > > If we use bridge_functions we need to take atomic functions as
> > > > precedence as the next bridge functions might convert atomic calls.
> > >
> > > We've had this discussion over and over again, but this is something
> > > that needs to be documented and / or in your commit log.
> > >
> > > You must not deviate from the standard (and expected) behavior without
> > > any kind of justification.
> >
> > Not exactly sure about what you mean, sorry. All these atomic bridge
> > functions are already documented if I'm not wrong and Laurent have
> > patches to switch the normal functions to atomic. Not sure what else
> > need to document here and need justification for it if the driver is
> > converting to bridge.
>
> There's two separate bridge in that discussion: the DSI controller
> itself that you convert to a bridge, and the downstream DSI -> whatever
> bridge.
>
> The atomic functions in the "DSI controller bridge" are fine. But that
> comment was about calling the downstream bridge ops directly from the
> driver, which is something that no other driver is doing, deviates from
> the expectations, and you didn't provide any explanation for that.

Clear for me now. Agreed what you are saying.

>
> > >
> > > > >
> > > > > >       /*
> > > > > >        * FIXME: This should be moved after the switch to HS mode.
> > > > > >        *
> > > > > > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > > >       if (dsi->panel)
> > > > > >               drm_panel_enable(dsi->panel);
> > > > > >
> > > > > > +     if (dsi->next_bridge)
> > > > > > +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> > > > > > +
> > > > >
> > > > > Ditto
> > > > >
> > > > > >       sun6i_dsi_start(dsi, DSI_START_HSC);
> > > > > >
> > > > > >       udelay(1000);
> > > > > > @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > > >       sun6i_dsi_start(dsi, DSI_START_HSD);
> > > > > >  }
> > > > > >
> > > > > > -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> > > > > > +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> > > > > > +                                         struct drm_bridge_state *old_bridge_state)
> > > > > >  {
> > > > > > -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > > > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > > > >
> > > > > >       DRM_DEBUG_DRIVER("Disabling DSI output\n");
> > > > > >
> > > > > >       if (dsi->panel) {
> > > > > >               drm_panel_disable(dsi->panel);
> > > > > >               drm_panel_unprepare(dsi->panel);
> > > > > > +     } else if (dsi->next_bridge) {
> > > > > > +             dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_state);
> > > > > > +             dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bridge_state);
> > > > >
> > > > > Ditto
> > > > >
> > > > > >       }
> > > > > >
> > > > > >       phy_power_off(dsi->dphy);
> > > > > > @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
> > > > > >       .atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
> > > > > >  };
> > > > > >
> > > > > > -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
> > > > > > -     .disable        = sun6i_dsi_encoder_disable,
> > > > > > -     .enable         = sun6i_dsi_encoder_enable,
> > > > > > +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> > > > > > +                                enum drm_bridge_attach_flags flags)
> > > > > > +{
> > > > > > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > > > > > +
> > > > > > +     if (dsi->next_bridge)
> > > > > > +             return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> > > > > > +                                      NULL, 0);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
> > > > > > +     .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > > > > +     .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > > > > > +     .atomic_reset           = drm_atomic_helper_bridge_reset,
> > > > > > +     .atomic_enable          = sun6i_dsi_bridge_atomic_enable,
> > > > > > +     .atomic_disable         = sun6i_dsi_bridge_atomic_disable,
> > > > > > +     .attach                 = sun6i_dsi_bridge_attach,
> > > > > >  };
> > > > > >
> > > > > >  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> > > > > > @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> > > > > >       struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > > > > >       int ret;
> > > > > >
> > > > > > -     drm_encoder_helper_add(&dsi->encoder,
> > > > > > -                            &sun6i_dsi_enc_helper_funcs);
> > > > > >       ret = drm_simple_encoder_init(drm, &dsi->encoder,
> > > > > >                                     DRM_MODE_ENCODER_DSI);
> > > > > >       if (ret) {
> > > > > > @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> > > > > >       }
> > > > > >       dsi->encoder.possible_crtcs = BIT(0);
> > > > > >
> > > > > > -     drm_connector_helper_add(&dsi->connector,
> > > > > > -                              &sun6i_dsi_connector_helper_funcs);
> > > > > > -     ret = drm_connector_init(drm, &dsi->connector,
> > > > > > -                              &sun6i_dsi_connector_funcs,
> > > > > > -                              DRM_MODE_CONNECTOR_DSI);
> > > > > > +     ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> > > > > >       if (ret) {
> > > > > > -             dev_err(dsi->dev,
> > > > > > -                     "Couldn't initialise the DSI connector\n");
> > > > > > +             dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> > > > > >               goto err_cleanup_connector;
> > > > > >       }
> > > > > >
> > > > > > -     drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > > > > > +     if (dsi->panel) {
> > > > > > +             drm_connector_helper_add(&dsi->connector,
> > > > > > +                                      &sun6i_dsi_connector_helper_funcs);
> > > > > > +             ret = drm_connector_init(drm, &dsi->connector,
> > > > > > +                                      &sun6i_dsi_connector_funcs,
> > > > > > +                                      DRM_MODE_CONNECTOR_DSI);
> > > > > > +             if (ret) {
> > > > > > +                     dev_err(dsi->dev,
> > > > > > +                             "Couldn't initialise the DSI connector\n");
> > > > > > +                     goto err_cleanup_connector;
> > > > > > +             }
> > > > > > +
> > > > > > +             drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > > > > > +     }
> > > > > >
> > > > > >       return 0;
> > > > > >
> > > > > > @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > > > >                           struct mipi_dsi_device *device)
> > > > > >  {
> > > > > >       struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> > > > > > -     struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
> > > > > > +     struct device_node *remote = device->dev.of_node;
> > > > > >       int ret;
> > > > > >
> > > > > > -     if (IS_ERR(panel))
> > > > > > -             return PTR_ERR(panel);
> > > > > > +     if (!of_device_is_available(remote)) {
> > > > > > +             /**
> > > > > > +              * I2C interfaced DSI bridges will register DSI host on the
> > > > > > +              * bridge drivers instead of conventional device.
> > > > > > +              *
> > > > > > +              * Those are probed via host of_node instead of device of_node.
> > > > > > +              */
> > > > >
> > > > > I have no idea what you mean here. Can you expand on what issue you've
> > > > > tried to solve here?
> > > >
> > > > I2C interface DSI bridges will register DSI host on the bridge
> > > > drivers.
> > >
> > > DSI bridges don't register a DSI host.
> >
> > Please check what I mean here,
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/bridge/ti-sn65dsi83.c#n623
> >
> > I've tested it anyway, if you have any relevant one please check as well.
>
> That driver doesn't register a DSI Host though? It registers a DSI
> device

Correct.

Thanks,
Jagan.
