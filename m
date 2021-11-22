Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40487458FF0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F5589C84;
	Mon, 22 Nov 2021 14:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFC689C86
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:05:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 789DC5C007B;
 Mon, 22 Nov 2021 09:05:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Nov 2021 09:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=f
 MW5I4R56XafrmfewzYmHHThG/mTaZkexy5+7Gv4cKU=; b=gvTURLNFMGjlqNRBw
 X1hjASQLG7YQ86L0kMp+EFbYKBlhUSO1z3jG46bkR6OTZR4r4pvHC3Xl7zXAFA0u
 Y0j1irGLCPGqjJjF515gTWudobWOWU+63e6enlA1qk57U2v+29rv+oG0z2oYZlVa
 bnxePszEP6j67LK1FrRg1i24PvLnDDqIpE9JTP5vp/aXRw1SA4Ven187WV6jB4BD
 jnhzUBKd9GOWsIOJbp14oRIxSwdwY3e4a5UaW4ha/6pwU8bzJJT8rFFDLCxN6/FD
 r4GwsoDUlcYUARzOP3bYYrEC0NmUiM8MT1TosuPdo9nEngGAAZMfRrORcj6EkMY2
 4Ohcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=fMW5I4R56XafrmfewzYmHHThG/mTaZkexy5+7Gv4c
 KU=; b=X9Kh0I1mjpizp6aZV5zvCUG9IZnkQDDfNGS2RAJ2eCzQno0teB9xOlqKM
 Y9i5ha/vD9ejTHXp6pbFJyTvhJnzPEojri85ElII2fWBH0ehBkn/qOSjAoHEL2D2
 GROwq11EmReMbUzHmGI6XFXxV9S1BG7SQ7eakBOZMRoQEOptpUeLDIWOE/mQoYyK
 jL6bYEN0yQmub8ejTHQruEDbzfiAhmyyCeWSbSwnkZ4SG1+CHnz5Rg2Rf0BaRJOf
 JfMwfrzGKMggycMUran5c5fRbXdhIbRtQCgbBSeEon6eSUALhwxJSealDi9rean+
 RPj0+MajTyATu3pru8bzuvVs2tl3A==
X-ME-Sender: <xms:i6ObYb5nTznUfm0Hh1Z-HL0e9KhaCurxnavUfa62E7QwuYAqTdybNA>
 <xme:i6ObYQ78IW2A9ClU4CsXd_j3r1WWdx52bsrfJx4Ibmx8A8so_3DLDJV-F8ZE6TEcW
 oubfNIivJpkoz-WXS0>
X-ME-Received: <xmr:i6ObYSc-NXiIk_nXGOn-TdIEVXD1tB50zbBmSkVIdcI_Om2zrTGfDWK5LZ4lnNMzUzf3mAI67F_Kwmm832MPi_dRb2AsprODgus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkeeileetveejffegueetjeeigffgfefgkeeuueetfffhheegveefhfekheev
 kedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:i6ObYcLsWWcnW8T5CMYm4KNhl0v7zlLonnJAxsiMkPMmZ7R6VXWrSQ>
 <xmx:i6ObYfLeG4eDLnaHFEwAIVDFaW0m9DPfpBUeDqhRBAq0JBvs0oJ7cg>
 <xmx:i6ObYVz1KXV4zHU_J9eSKd7-CzByHzMDZEtXHdzmsBr4pkRlFWiYfA>
 <xmx:jKObYW_-W_ES2QKB_Y2WWYcAM7qx9Db_NGRZ8hg2fTMWY1ClNiEj9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 09:04:59 -0500 (EST)
Date: Mon, 22 Nov 2021 15:04:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
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

On Mon, Nov 22, 2021 at 07:18:13PM +0530, Jagan Teki wrote:
> Hi Maxime,
>=20
> On Mon, Nov 22, 2021 at 3:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> > > Some display panels would come up with a non-DSI output, those
> > > can have an option to connect the DSI host by means of interface
> > > bridge converter.
> > >
> > > This DSI to non-DSI interface bridge converter would requires
> > > DSI Host to handle drm bridge functionalities in order to DSI
> > > Host to Interface bridge.
> >
> > In order to do this you would need to use the DRM bridge API...
>=20
> Sorry, which bridge API do you mean?

Any variant of of_drm_find_bridge, and drm_bridge_attach. Just like
we're doing in sun4i_rgb.c

> > > This patch convert the existing to a drm bridge driver with a
> > > built-in encoder support for compatibility with existing
> > > component drivers.
> >
> > ... but changing the encoder driver to a bridge is completely
> > unnecessary to do so. Why did you need to make that change?
>=20
> Idea of this series is to convert the driver to bridge and use the
> latest bridge function from the v1 series.

Ok, but it's not at all what you mention in your commit log? You don't
need any of that in order to support a bridge downstream.

> >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > ---
> > > Changes for v5:
> > > - add atomic APIs
> > > - find host and device variant DSI devices.
> > > Changes for v4, v3:
> > > - none
> > >
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++---=
--
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> > >  2 files changed, 96 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm=
/sun4i/sun6i_mipi_dsi.c
> > > index 43d9c9e5198d..a6a272b55f77 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -21,6 +21,7 @@
> > >
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > >  #include <drm/drm_print.h>
> > >  #include <drm/drm_probe_helper.h>
> > > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *ds=
i,
> > >       return 0;
> > >  }
> > >
> > > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                        struct drm_bridge_state *old=
_bridge_state)
> > >  {
> > > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjust=
ed_mode;
> > > -     struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > > +     struct drm_display_mode *mode =3D &bridge->encoder->crtc->state=
->adjusted_mode;
> > >       struct mipi_dsi_device *device =3D dsi->device;
> > >       union phy_configure_opts opts =3D { };
> > >       struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dphy;
> > > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_e=
ncoder *encoder)
> > >       if (dsi->panel)
> > >               drm_panel_prepare(dsi->panel);
> > >
> > > +     if (dsi->next_bridge)
> > > +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_br=
idge, old_bridge_state);
> > > +
> >
> > Please use the proper helpers.
>=20
> If we use bridge_functions we need to take atomic functions as
> precedence as the next bridge functions might convert atomic calls.

We've had this discussion over and over again, but this is something
that needs to be documented and / or in your commit log.

You must not deviate from the standard (and expected) behavior without
any kind of justification.

> >
> > >       /*
> > >        * FIXME: This should be moved after the switch to HS mode.
> > >        *
> > > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_e=
ncoder *encoder)
> > >       if (dsi->panel)
> > >               drm_panel_enable(dsi->panel);
> > >
> > > +     if (dsi->next_bridge)
> > > +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge=
, old_bridge_state);
> > > +
> >
> > Ditto
> >
> > >       sun6i_dsi_start(dsi, DSI_START_HSC);
> > >
> > >       udelay(1000);
> > > @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm=
_encoder *encoder)
> > >       sun6i_dsi_start(dsi, DSI_START_HSD);
> > >  }
> > >
> > > -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> > > +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridg=
e,
> > > +                                         struct drm_bridge_state *ol=
d_bridge_state)
> > >  {
> > > -     struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > >
> > >       DRM_DEBUG_DRIVER("Disabling DSI output\n");
> > >
> > >       if (dsi->panel) {
> > >               drm_panel_disable(dsi->panel);
> > >               drm_panel_unprepare(dsi->panel);
> > > +     } else if (dsi->next_bridge) {
> > > +             dsi->next_bridge->funcs->atomic_disable(dsi->next_bridg=
e, old_bridge_state);
> > > +             dsi->next_bridge->funcs->atomic_post_disable(dsi->next_=
bridge, old_bridge_state);
> >
> > Ditto
> >
> > >       }
> > >
> > >       phy_power_off(dsi->dphy);
> > > @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_ds=
i_connector_funcs =3D {
> > >       .atomic_destroy_state   =3D drm_atomic_helper_connector_destroy=
_state,
> > >  };
> > >
> > > -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_fu=
ncs =3D {
> > > -     .disable        =3D sun6i_dsi_encoder_disable,
> > > -     .enable         =3D sun6i_dsi_encoder_enable,
> > > +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> > > +                                enum drm_bridge_attach_flags flags)
> > > +{
> > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > > +
> > > +     if (dsi->next_bridge)
> > > +             return drm_bridge_attach(bridge->encoder, dsi->next_bri=
dge,
> > > +                                      NULL, 0);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs =3D {
> > > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_=
state,
> > > +     .atomic_destroy_state   =3D drm_atomic_helper_bridge_destroy_st=
ate,
> > > +     .atomic_reset           =3D drm_atomic_helper_bridge_reset,
> > > +     .atomic_enable          =3D sun6i_dsi_bridge_atomic_enable,
> > > +     .atomic_disable         =3D sun6i_dsi_bridge_atomic_disable,
> > > +     .attach                 =3D sun6i_dsi_bridge_attach,
> > >  };
> > >
> > >  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> > > @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, str=
uct device *master,
> > >       struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> > >       int ret;
> > >
> > > -     drm_encoder_helper_add(&dsi->encoder,
> > > -                            &sun6i_dsi_enc_helper_funcs);
> > >       ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
> > >                                     DRM_MODE_ENCODER_DSI);
> > >       if (ret) {
> > > @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, =
struct device *master,
> > >       }
> > >       dsi->encoder.possible_crtcs =3D BIT(0);
> > >
> > > -     drm_connector_helper_add(&dsi->connector,
> > > -                              &sun6i_dsi_connector_helper_funcs);
> > > -     ret =3D drm_connector_init(drm, &dsi->connector,
> > > -                              &sun6i_dsi_connector_funcs,
> > > -                              DRM_MODE_CONNECTOR_DSI);
> > > +     ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> > >       if (ret) {
> > > -             dev_err(dsi->dev,
> > > -                     "Couldn't initialise the DSI connector\n");
> > > +             dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> > >               goto err_cleanup_connector;
> > >       }
> > >
> > > -     drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > > +     if (dsi->panel) {
> > > +             drm_connector_helper_add(&dsi->connector,
> > > +                                      &sun6i_dsi_connector_helper_fu=
ncs);
> > > +             ret =3D drm_connector_init(drm, &dsi->connector,
> > > +                                      &sun6i_dsi_connector_funcs,
> > > +                                      DRM_MODE_CONNECTOR_DSI);
> > > +             if (ret) {
> > > +                     dev_err(dsi->dev,
> > > +                             "Couldn't initialise the DSI connector\=
n");
> > > +                     goto err_cleanup_connector;
> > > +             }
> > > +
> > > +             drm_connector_attach_encoder(&dsi->connector, &dsi->enc=
oder);
> > > +     }
> > >
> > >       return 0;
> > >
> > > @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_h=
ost *host,
> > >                           struct mipi_dsi_device *device)
> > >  {
> > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_no=
de);
> > > +     struct device_node *remote =3D device->dev.of_node;
> > >       int ret;
> > >
> > > -     if (IS_ERR(panel))
> > > -             return PTR_ERR(panel);
> > > +     if (!of_device_is_available(remote)) {
> > > +             /**
> > > +              * I2C interfaced DSI bridges will register DSI host on=
 the
> > > +              * bridge drivers instead of conventional device.
> > > +              *
> > > +              * Those are probed via host of_node instead of device =
of_node.
> > > +              */
> >
> > I have no idea what you mean here. Can you expand on what issue you've
> > tried to solve here?
>=20
> I2C interface DSI bridges will register DSI host on the bridge
> drivers.

DSI bridges don't register a DSI host.

> Those can be found using host->dev->of_node and cannot be find using
> device->dev.of_node
>=20
> >
> > > +             remote =3D of_graph_get_remote_node(host->dev->of_node,=
 0, 0);
> > > +             if (!remote)
> > > +                     return -ENODEV;
> > > +     }
> > > +
> > > +     dsi->panel =3D of_drm_find_panel(remote);
> > > +     if (IS_ERR(dsi->panel)) {
> > > +             dsi->panel =3D NULL;
> > > +
> > > +             dsi->next_bridge =3D of_drm_find_bridge(remote);
> > > +             if (IS_ERR(dsi->next_bridge)) {
> > > +                     dev_err(dsi->dev, "failed to find bridge\n");
> > > +                     return PTR_ERR(dsi->next_bridge);
> > > +             }
> > > +     } else {
> > > +             dsi->next_bridge =3D NULL;
> > > +     }
> > > +
> > > +     of_node_put(remote);
> >
> > Using devm_drm_of_get_bridge would greatly simplify the driver
>=20
> I'm aware of this and this would break the existing sunxi dsi binding,
> we are not using ports based pipeline in dsi node. Of-course you have
> pointed the same before, please check below
> https://patchwork.kernel.org/project/dri-devel/patch/20210322140152.10170=
9-2-jagan@amarulasolutions.com/

Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
bindings and look for a panel or bridge not only through the OF graph,
but also on the child nodes

Maxime
