Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693B4590DC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B0B89F5B;
	Mon, 22 Nov 2021 15:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850C589F5B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:04:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD3B95C0196;
 Mon, 22 Nov 2021 10:04:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Nov 2021 10:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=Q
 MHIi6Jui8h8WySORrxmZ5bJlgdth3QsG6DIf8sauPA=; b=EmQiSz61u8fBGFnYf
 rgibWl/nD37wYJc/q0F3HtbfwE+Qdxxrnpq8DxrOTXRYxXjccCyUlQ7FTi7GDitc
 ViLNs283nsAWvj5qaDdaDxMTtyfrNjggFzVs5Yh7iB47Y3sxtGtJZdFN9GXiQVMY
 xUOEIyAdpEPtnN7ZdGHRxXbgU1Z2m+IwuPO4Wg258T6WnbBh5YSAIOae7En156i9
 k/fZshrgGZbQ4gwnaHxny48cuHCb8VfGs8sXMhXRWhu/GEIjDoMl0XmRiPneLKUQ
 LmkkVABg2XsBbn8kG3/ZZKZcJsOnVBvyJ4CcsfLaHxbvHUaVVFqAUzhXbn0tj5Mr
 BULVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=QMHIi6Jui8h8WySORrxmZ5bJlgdth3QsG6DIf8sau
 PA=; b=DoZogmu5Vxm0Ojlp3c2urks9B+idbIJ+ksok6dvXYEMM9JfQy2Kh68yxe
 G3F9eliTHK6oyddh4melUlDofuF2raytr1ElHmSGU4xPXEYQO3SkdPBJr76K5kGa
 wt/VoIWDgEfWBc9xJ+8WoNZeiy6z9E6OVGG8TOvCF/Vz1PeKGM71H37Xr+TtJv8u
 3Y7mBU51unPJVYpQPtSzXH3OVgMNkobugadWb45E89B2kfA9MAH6mP13pA3nK/nT
 LW9h/wrcJCz4rYSpIvlGtFPVUiMbaSMevjoOEVJxukJZv9L32xaBYi4VQS4X2wcw
 f5NBpSVd3jWeNyUCzZBBbvllPPL+A==
X-ME-Sender: <xms:k7GbYTmEh2ELJO-waVbWOSESQezY7pLTNacgWNfnEleELZAuXDfKuw>
 <xme:k7GbYW2eAOLIazsz4m5nvcwu84ELsziT_9bbJObWbRKHmcrtasfDyHonTrokCQFK6
 2tcYY1OBUHJH5kLDNs>
X-ME-Received: <xmr:k7GbYZq6dVIKvht7ytCgfPdvoyJE1FOwX1H01ABxzHCDNX4ImBESaeYegYtzPGYjTaHTKLNy_t7SHn3RumSMd0PAc8zTHf21vdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkeeileetveejffegueetjeeigffgfefgkeeuueetfffhheegveefhfekheev
 kedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k7GbYbk7orjc9DhlPrasSYq0_-uifVZ0gmBNUaEQR4Ip0_F3ZBcjhw>
 <xmx:k7GbYR1oixc1vxiRWR9U02-ECl153fj0IbJwNek875IYRiySq24-0Q>
 <xmx:k7GbYav-h-ezuSPzKBjiGOm5HASRZXS7QR1LHatm8-Ubqu0l35LImA>
 <xmx:lLGbYaJ90GAr-w1bnqiVwKKrLQWrAVOBqq_UpeM9rD2GOyG7GxD35g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 10:04:51 -0500 (EST)
Date: Mon, 22 Nov 2021 16:04:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211122150449.4nqblhdidb5742x3@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
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

On Mon, Nov 22, 2021 at 07:49:26PM +0530, Jagan Teki wrote:
> On Mon, Nov 22, 2021 at 7:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Mon, Nov 22, 2021 at 07:18:13PM +0530, Jagan Teki wrote:
> > > On Mon, Nov 22, 2021 at 3:37 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> > > > > Some display panels would come up with a non-DSI output, those
> > > > > can have an option to connect the DSI host by means of interface
> > > > > bridge converter.
> > > > >
> > > > > This DSI to non-DSI interface bridge converter would requires
> > > > > DSI Host to handle drm bridge functionalities in order to DSI
> > > > > Host to Interface bridge.
> > > >
> > > > In order to do this you would need to use the DRM bridge API...
> > >
> > > Sorry, which bridge API do you mean?
> >
> > Any variant of of_drm_find_bridge, and drm_bridge_attach. Just like
> > we're doing in sun4i_rgb.c
>=20
> Yes, we have drm_bridge_attach in bind and bridge_function.attach
> calls in this patch and of_drm_find_bridge in sun6i_mipi_dsi_attach.
> Not sure which API's I've missed.

None, that's my point, you don't need anything else in order to do what
you wanted to achieve.

> >
> > > > > This patch convert the existing to a drm bridge driver with a
> > > > > built-in encoder support for compatibility with existing
> > > > > component drivers.
> > > >
> > > > ... but changing the encoder driver to a bridge is completely
> > > > unnecessary to do so. Why did you need to make that change?
> > >
> > > Idea of this series is to convert the driver to bridge and use the
> > > latest bridge function from the v1 series.
> >
> > Ok, but it's not at all what you mention in your commit log? You don't
> > need any of that in order to support a bridge downstream.
>=20
> I've mentioned "Converting to bridge driver" and thought it has
> meaning of converting encoder related function to bridge functions as
> well. Not think about specific description to describe on commit
> message. Will update this.

But you provided no reason to do so. The only one you did mention was
that you wanted to support downstream bridges, but you don't need to
convert the DSI driver to a bridge in order to do that.

> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > >
> > > > > ---
> > > > > Changes for v5:
> > > > > - add atomic APIs
> > > > > - find host and device variant DSI devices.
> > > > > Changes for v4, v3:
> > > > > - none
> > > > >
> > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 +++++++++++++++++++=
+-----
> > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> > > > >  2 files changed, 96 insertions(+), 23 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu=
/drm/sun4i/sun6i_mipi_dsi.c
> > > > > index 43d9c9e5198d..a6a272b55f77 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > @@ -21,6 +21,7 @@
> > > > >
> > > > >  #include <drm/drm_atomic_helper.h>
> > > > >  #include <drm/drm_mipi_dsi.h>
> > > > > +#include <drm/drm_of.h>
> > > > >  #include <drm/drm_panel.h>
> > > > >  #include <drm/drm_print.h>
> > > > >  #include <drm/drm_probe_helper.h>
> > > > > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi=
 *dsi,
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > > > > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *br=
idge,
> > > > > +                                        struct drm_bridge_state =
*old_bridge_state)
> > > > >  {
> > > > > -     struct drm_display_mode *mode =3D &encoder->crtc->state->ad=
justed_mode;
> > > > > -     struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> > > > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > > > > +     struct drm_display_mode *mode =3D &bridge->encoder->crtc->s=
tate->adjusted_mode;
> > > > >       struct mipi_dsi_device *device =3D dsi->device;
> > > > >       union phy_configure_opts opts =3D { };
> > > > >       struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dph=
y;
> > > > > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct d=
rm_encoder *encoder)
> > > > >       if (dsi->panel)
> > > > >               drm_panel_prepare(dsi->panel);
> > > > >
> > > > > +     if (dsi->next_bridge)
> > > > > +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->nex=
t_bridge, old_bridge_state);
> > > > > +
> > > >
> > > > Please use the proper helpers.
> > >
> > > If we use bridge_functions we need to take atomic functions as
> > > precedence as the next bridge functions might convert atomic calls.
> >
> > We've had this discussion over and over again, but this is something
> > that needs to be documented and / or in your commit log.
> >
> > You must not deviate from the standard (and expected) behavior without
> > any kind of justification.
>=20
> Not exactly sure about what you mean, sorry. All these atomic bridge
> functions are already documented if I'm not wrong and Laurent have
> patches to switch the normal functions to atomic. Not sure what else
> need to document here and need justification for it if the driver is
> converting to bridge.

There's two separate bridge in that discussion: the DSI controller
itself that you convert to a bridge, and the downstream DSI -> whatever
bridge.

The atomic functions in the "DSI controller bridge" are fine. But that
comment was about calling the downstream bridge ops directly from the
driver, which is something that no other driver is doing, deviates from
the expectations, and you didn't provide any explanation for that.

> >
> > > >
> > > > >       /*
> > > > >        * FIXME: This should be moved after the switch to HS mode.
> > > > >        *
> > > > > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct d=
rm_encoder *encoder)
> > > > >       if (dsi->panel)
> > > > >               drm_panel_enable(dsi->panel);
> > > > >
> > > > > +     if (dsi->next_bridge)
> > > > > +             dsi->next_bridge->funcs->atomic_enable(dsi->next_br=
idge, old_bridge_state);
> > > > > +
> > > >
> > > > Ditto
> > > >
> > > > >       sun6i_dsi_start(dsi, DSI_START_HSC);
> > > > >
> > > > >       udelay(1000);
> > > > > @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct=
 drm_encoder *encoder)
> > > > >       sun6i_dsi_start(dsi, DSI_START_HSD);
> > > > >  }
> > > > >
> > > > > -static void sun6i_dsi_encoder_disable(struct drm_encoder *encode=
r)
> > > > > +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *b=
ridge,
> > > > > +                                         struct drm_bridge_state=
 *old_bridge_state)
> > > > >  {
> > > > > -     struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> > > > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > > > >
> > > > >       DRM_DEBUG_DRIVER("Disabling DSI output\n");
> > > > >
> > > > >       if (dsi->panel) {
> > > > >               drm_panel_disable(dsi->panel);
> > > > >               drm_panel_unprepare(dsi->panel);
> > > > > +     } else if (dsi->next_bridge) {
> > > > > +             dsi->next_bridge->funcs->atomic_disable(dsi->next_b=
ridge, old_bridge_state);
> > > > > +             dsi->next_bridge->funcs->atomic_post_disable(dsi->n=
ext_bridge, old_bridge_state);
> > > >
> > > > Ditto
> > > >
> > > > >       }
> > > > >
> > > > >       phy_power_off(dsi->dphy);
> > > > > @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6=
i_dsi_connector_funcs =3D {
> > > > >       .atomic_destroy_state   =3D drm_atomic_helper_connector_des=
troy_state,
> > > > >  };
> > > > >
> > > > > -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helpe=
r_funcs =3D {
> > > > > -     .disable        =3D sun6i_dsi_encoder_disable,
> > > > > -     .enable         =3D sun6i_dsi_encoder_enable,
> > > > > +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> > > > > +                                enum drm_bridge_attach_flags fla=
gs)
> > > > > +{
> > > > > +     struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> > > > > +
> > > > > +     if (dsi->next_bridge)
> > > > > +             return drm_bridge_attach(bridge->encoder, dsi->next=
_bridge,
> > > > > +                                      NULL, 0);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs =3D {
> > > > > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplic=
ate_state,
> > > > > +     .atomic_destroy_state   =3D drm_atomic_helper_bridge_destro=
y_state,
> > > > > +     .atomic_reset           =3D drm_atomic_helper_bridge_reset,
> > > > > +     .atomic_enable          =3D sun6i_dsi_bridge_atomic_enable,
> > > > > +     .atomic_disable         =3D sun6i_dsi_bridge_atomic_disable,
> > > > > +     .attach                 =3D sun6i_dsi_bridge_attach,
> > > > >  };
> > > > >
> > > > >  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> > > > > @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev,=
 struct device *master,
> > > > >       struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> > > > >       int ret;
> > > > >
> > > > > -     drm_encoder_helper_add(&dsi->encoder,
> > > > > -                            &sun6i_dsi_enc_helper_funcs);
> > > > >       ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
> > > > >                                     DRM_MODE_ENCODER_DSI);
> > > > >       if (ret) {
> > > > > @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *d=
ev, struct device *master,
> > > > >       }
> > > > >       dsi->encoder.possible_crtcs =3D BIT(0);
> > > > >
> > > > > -     drm_connector_helper_add(&dsi->connector,
> > > > > -                              &sun6i_dsi_connector_helper_funcs);
> > > > > -     ret =3D drm_connector_init(drm, &dsi->connector,
> > > > > -                              &sun6i_dsi_connector_funcs,
> > > > > -                              DRM_MODE_CONNECTOR_DSI);
> > > > > +     ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL=
, 0);
> > > > >       if (ret) {
> > > > > -             dev_err(dsi->dev,
> > > > > -                     "Couldn't initialise the DSI connector\n");
> > > > > +             dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> > > > >               goto err_cleanup_connector;
> > > > >       }
> > > > >
> > > > > -     drm_connector_attach_encoder(&dsi->connector, &dsi->encoder=
);
> > > > > +     if (dsi->panel) {
> > > > > +             drm_connector_helper_add(&dsi->connector,
> > > > > +                                      &sun6i_dsi_connector_helpe=
r_funcs);
> > > > > +             ret =3D drm_connector_init(drm, &dsi->connector,
> > > > > +                                      &sun6i_dsi_connector_funcs,
> > > > > +                                      DRM_MODE_CONNECTOR_DSI);
> > > > > +             if (ret) {
> > > > > +                     dev_err(dsi->dev,
> > > > > +                             "Couldn't initialise the DSI connec=
tor\n");
> > > > > +                     goto err_cleanup_connector;
> > > > > +             }
> > > > > +
> > > > > +             drm_connector_attach_encoder(&dsi->connector, &dsi-=
>encoder);
> > > > > +     }
> > > > >
> > > > >       return 0;
> > > > >
> > > > > @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_d=
si_host *host,
> > > > >                           struct mipi_dsi_device *device)
> > > > >  {
> > > > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.o=
f_node);
> > > > > +     struct device_node *remote =3D device->dev.of_node;
> > > > >       int ret;
> > > > >
> > > > > -     if (IS_ERR(panel))
> > > > > -             return PTR_ERR(panel);
> > > > > +     if (!of_device_is_available(remote)) {
> > > > > +             /**
> > > > > +              * I2C interfaced DSI bridges will register DSI hos=
t on the
> > > > > +              * bridge drivers instead of conventional device.
> > > > > +              *
> > > > > +              * Those are probed via host of_node instead of dev=
ice of_node.
> > > > > +              */
> > > >
> > > > I have no idea what you mean here. Can you expand on what issue you=
've
> > > > tried to solve here?
> > >
> > > I2C interface DSI bridges will register DSI host on the bridge
> > > drivers.
> >
> > DSI bridges don't register a DSI host.
>=20
> Please check what I mean here,
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/bridge/ti-sn65dsi83.c#n623
>=20
> I've tested it anyway, if you have any relevant one please check as well.

That driver doesn't register a DSI Host though? It registers a DSI
device

Maxime
