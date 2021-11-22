Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0F458C11
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6F6E5CE;
	Mon, 22 Nov 2021 10:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C56E5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:07:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E962632019BD;
 Mon, 22 Nov 2021 05:07:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 22 Nov 2021 05:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1TriUcfasu1PgDvtl5BaufHUYH2
 l74K3uOBvr4kVXy0=; b=NF+y7iYK0TbeJTdar2d2GTOWyZ44J7z/tSf+vuyRWYM
 cv7AejCF9lHTQYODiET0UQWlUKRA4yWgoIQChgc92MUVE5nv2dyQdwqTIc0BejdP
 nB1WfvmgmzRMRioAQtGYIU+iZyi5eO0e6IP7eyqH38NcR7iV4Vg8ntyvU7M4qCLw
 kd0pFRvSOdyI91XEcSMhQeL/NaFw2xDKCBQDShiIue23jqVJdVAPQfuTBKrGDF9p
 GhlrWRbheo02Fadvze2Aske6zrVd5GHxjwD6sP2gOgzv55pxBB+3iJ8aVUMjTTFG
 ug0xnWZsAMwRr6T0yomw1eBauhzL7NhRXBBeHkC/GVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1TriUc
 fasu1PgDvtl5BaufHUYH2l74K3uOBvr4kVXy0=; b=bPVPAerJiXjTJvea1DfRFU
 2zpQqDuJ13L2kO+JfahqyTOAZs31rDUnyNwYsEeaCz/f3H4KIJQ1v2l+IlLvp+ct
 AfdVAOkc1ysGNtvdHO7WgpJ+cBmNVbXAV/hHE/dZVMRU7JB5FLEwQSw/fnEtP7D+
 w4/L6GDbxIj+Q6URIs6jbBusJ59/xXV/9LlWT7SkYRvn4NfA8ntAS1xfNIlHOBFX
 AVNfsbsjPOa0p6ppexUusGKzricwbN9mzKeDTaQ6FRQDogv+LUQWaN6vi3Rjjexc
 dEI6f2FG53LhQlCXcO4RKwG55dvk2SWsvCMygY2VvgCv5vLNuc6NhmteVE8Y3RdA
 ==
X-ME-Sender: <xms:02ubYb_t3RpmAz0dqasRqZVynAuIeuYFYN6-FR7ixGOOHJEO1csxdQ>
 <xme:02ubYXvwIeoCF_K78D5KwTxjIYinKN8TqX9q_OvokcuAVhRQDWahAQMWvKzJV4fob
 Iqt1Tb9cMw90pqhcE0>
X-ME-Received: <xmr:02ubYZA-RoFZ_Ad1v1CuYANgpdorWFmvtq-Y4-96THFHVPWdgHtvvSWdUp4smzbhS9lagxCxzoKDl7hasBqmWRnPDedWBV-d1P8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:02ubYXdvwfjPJEMl-37ckat04NVqJ4H3LUMgFKat2Jgb-M1pko-CKQ>
 <xmx:02ubYQMkeeTib9wcCtzPsxg4C3eEM0Cw9t-cekENO8gPYcnQY7COog>
 <xmx:02ubYZmjmWtaIrhqe8NMHKXEk-AASWOrZhbkGgOXg_BLw6_1eCp8fQ>
 <xmx:02ubYRjrQfBsMeoEC3iLafMTTh6AOd9zUAmVjB3_vtr3Kxhcre7KXw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 05:07:14 -0500 (EST)
Date: Mon, 22 Nov 2021 11:07:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211122100712.dls4eqsu6o5gcc5k@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="42fc7ultclqjs44o"
Content-Disposition: inline
In-Reply-To: <20211122065223.88059-4-jagan@amarulasolutions.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--42fc7ultclqjs44o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output, those
> can have an option to connect the DSI host by means of interface
> bridge converter.
>=20
> This DSI to non-DSI interface bridge converter would requires
> DSI Host to handle drm bridge functionalities in order to DSI
> Host to Interface bridge.

In order to do this you would need to use the DRM bridge API...

> This patch convert the existing to a drm bridge driver with a
> built-in encoder support for compatibility with existing
> component drivers.

=2E.. but changing the encoder driver to a bridge is completely
unnecessary to do so. Why did you need to make that change?

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> ---
> Changes for v5:
> - add atomic APIs
> - find host and device variant DSI devices.
> Changes for v4, v3:
> - none
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
>  2 files changed, 96 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 43d9c9e5198d..a6a272b55f77 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -21,6 +21,7 @@
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
>  	return 0;
>  }
> =20
> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
> -	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
> -	struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> +	struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> +	struct drm_display_mode *mode =3D &bridge->encoder->crtc->state->adjust=
ed_mode;
>  	struct mipi_dsi_device *device =3D dsi->device;
>  	union phy_configure_opts opts =3D { };
>  	struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dphy;
> @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encod=
er *encoder)
>  	if (dsi->panel)
>  		drm_panel_prepare(dsi->panel);
> =20
> +	if (dsi->next_bridge)
> +		dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridg=
e_state);
> +

Please use the proper helpers.

>  	/*
>  	 * FIXME: This should be moved after the switch to HS mode.
>  	 *
> @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encod=
er *encoder)
>  	if (dsi->panel)
>  		drm_panel_enable(dsi->panel);
> =20
> +	if (dsi->next_bridge)
> +		dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_st=
ate);
> +

Ditto

>  	sun6i_dsi_start(dsi, DSI_START_HSC);
> =20
>  	udelay(1000);
> @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_enc=
oder *encoder)
>  	sun6i_dsi_start(dsi, DSI_START_HSD);
>  }
> =20
> -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_bridge_state)
>  {
> -	struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> +	struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> =20
>  	DRM_DEBUG_DRIVER("Disabling DSI output\n");
> =20
>  	if (dsi->panel) {
>  		drm_panel_disable(dsi->panel);
>  		drm_panel_unprepare(dsi->panel);
> +	} else if (dsi->next_bridge) {
> +		dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_s=
tate);
> +		dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bri=
dge_state);

Ditto

>  	}
> =20
>  	phy_power_off(dsi->dphy);
> @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_co=
nnector_funcs =3D {
>  	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs =
=3D {
> -	.disable	=3D sun6i_dsi_encoder_disable,
> -	.enable		=3D sun6i_dsi_encoder_enable,
> +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> +
> +	if (dsi->next_bridge)
> +		return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> +					 NULL, 0);
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs =3D {
> +	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +	.atomic_enable		=3D sun6i_dsi_bridge_atomic_enable,
> +	.atomic_disable		=3D sun6i_dsi_bridge_atomic_disable,
> +	.attach			=3D sun6i_dsi_bridge_attach,
>  };
> =20
>  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct =
device *master,
>  	struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	drm_encoder_helper_add(&dsi->encoder,
> -			       &sun6i_dsi_enc_helper_funcs);
>  	ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
>  				      DRM_MODE_ENCODER_DSI);
>  	if (ret) {
> @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, stru=
ct device *master,
>  	}
>  	dsi->encoder.possible_crtcs =3D BIT(0);
> =20
> -	drm_connector_helper_add(&dsi->connector,
> -				 &sun6i_dsi_connector_helper_funcs);
> -	ret =3D drm_connector_init(drm, &dsi->connector,
> -				 &sun6i_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> +	ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
>  	if (ret) {
> -		dev_err(dsi->dev,
> -			"Couldn't initialise the DSI connector\n");
> +		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
>  		goto err_cleanup_connector;
>  	}
> =20
> -	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +	if (dsi->panel) {
> +		drm_connector_helper_add(&dsi->connector,
> +					 &sun6i_dsi_connector_helper_funcs);
> +		ret =3D drm_connector_init(drm, &dsi->connector,
> +					 &sun6i_dsi_connector_funcs,
> +					 DRM_MODE_CONNECTOR_DSI);
> +		if (ret) {
> +			dev_err(dsi->dev,
> +				"Couldn't initialise the DSI connector\n");
> +			goto err_cleanup_connector;
> +		}
> +
> +		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +	}
> =20
>  	return 0;
> =20
> @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host =
*host,
>  			    struct mipi_dsi_device *device)
>  {
>  	struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> -	struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_node);
> +	struct device_node *remote =3D device->dev.of_node;
>  	int ret;
> =20
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> +	if (!of_device_is_available(remote)) {
> +		/**
> +		 * I2C interfaced DSI bridges will register DSI host on the
> +		 * bridge drivers instead of conventional device.
> +		 *
> +		 * Those are probed via host of_node instead of device of_node.
> +		 */

I have no idea what you mean here. Can you expand on what issue you've
tried to solve here?

> +		remote =3D of_graph_get_remote_node(host->dev->of_node, 0, 0);
> +		if (!remote)
> +			return -ENODEV;
> +	}
> +
> +	dsi->panel =3D of_drm_find_panel(remote);
> +	if (IS_ERR(dsi->panel)) {
> +		dsi->panel =3D NULL;
> +
> +		dsi->next_bridge =3D of_drm_find_bridge(remote);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			dev_err(dsi->dev, "failed to find bridge\n");
> +			return PTR_ERR(dsi->next_bridge);
> +		}
> +	} else {
> +		dsi->next_bridge =3D NULL;
> +	}
> +
> +	of_node_put(remote);

Using devm_drm_of_get_bridge would greatly simplify the driver

Maxime

--42fc7ultclqjs44o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZtr0AAKCRDj7w1vZxhR
xbLlAP9FrypT0NGd2g7ftqjU2wQWy/rQ+s0C8605AUk0eBm4ZgD+N6141yYMvugu
R6XbqoqWIG4pSNYpITi82lkFrR+X3QE=
=1xtI
-----END PGP SIGNATURE-----

--42fc7ultclqjs44o--
