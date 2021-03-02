Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460832A618
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A9A6E081;
	Tue,  2 Mar 2021 16:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2BB6E081
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:35:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EAC371400;
 Tue,  2 Mar 2021 11:35:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 02 Mar 2021 11:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vuIY4u0JZta9sUcBiLwawr0Tdij
 dW51uliU5N7yOuuo=; b=SiiE0UT/Jp8eV53mNX4Z66LwYb53fRTlwF9yo7exHaj
 GZ8l86OTUZBqhjruAgwvNtKVN1PQfqd/bgsbLY6YDnsGYAaFNguXoBRPWIMQVHqS
 719AsWv/ISjB/qEG0MlUaARE45SX4f2UftonuTBclyJv7VjxbWoGdVMgp+Lgai8U
 BvweBfWWKzd+8IqLy9QGDKf5Y/ag+bBvH4NWr5j8kLVJRQgeyT3XaBBYok5pU3Tb
 QfBYCtULQnczvXOzd0CRBeLueW8c0TVyJ6hBBj5WI2bu9TD5FJZOMTAmx+dZFsI9
 8CzogwGPxM3FzqXpol4R/Q2Fba2RB+iYa8n4SpIx5Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vuIY4u
 0JZta9sUcBiLwawr0TdijdW51uliU5N7yOuuo=; b=HTeRmuM1NDzmmBPiSK8gF3
 Hry3iDJukX2IedJhmMjJpt53XgArBlWo5hbQdSRlGseyk9MSEEoqnu2oNP8sHtkW
 QQJOD0W1ZR+uV6jTO5o1NyjT9EakXIzCg+tffjCpgcGsDWYFANwYDgZ0wTeoRQxF
 Dar9H4/jCVvGC2pmyJWSdU/Ih/FRHUoQ4wIMZG2xN/odUOwReAHqNLar7uA457hq
 nYeeRDn96pHPd1V2T0jHyCctiArKCLPxSKcbBqNzBtfY2Tfc97gc0JpwXN7KREo/
 H4xo/Xd/lW48pz5b8Xf4X0LrMfydNblIn/EY4+wEsbqJ0C7seRKNT1eoExiNPKUQ
 ==
X-ME-Sender: <xms:PGk-YLDbtZp5OnAJlNfzd0yPLdDqyddIEveFF4RCwH6QMiX2A0rkrw>
 <xme:PGk-YBjGBLGYNPJu62MqDGc5hZ-1rg0Eb4nOJ1-bxTwLdkJ2CfiCKxRRxOZu8mCA_
 EGaA4i042QGjIfx5Rk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PGk-YGlAgg5KSusc6V9yXE3I8i88tejCcJp-igdloo7-6ARPCw_eqg>
 <xmx:PGk-YNwuA-cf46mNjvqObZ0vFw9floq3QxTSbF7rsoq87afTiHMJ5A>
 <xmx:PGk-YARgiG_xt1fj-nczfTEgTl9BhccO2fQy5QPukIGJFlmLG6OGiQ>
 <xmx:P2k-YFIpZicm13XP16nLylmEHsd9l26rK3DJdVIcbS252hm-QCoLng>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA2551080066;
 Tue,  2 Mar 2021 11:35:07 -0500 (EST)
Date: Tue, 2 Mar 2021 17:35:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 6/7] drm: sun4i: dsi: Use drm_panel_bridge, connector
 API
Message-ID: <20210302163505.2d42x364qsm26jo7@gilmour>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
 <20210214194102.126146-7-jagan@amarulasolutions.com>
 <20210226165723.szblbiswz5vgapq2@hendrix>
 <CAMty3ZC0ynvk3qnWDSnpMD-_hJiP-edga6+HfqhRH_g0BkAqgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZC0ynvk3qnWDSnpMD-_hJiP-edga6+HfqhRH_g0BkAqgg@mail.gmail.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0892801145=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0892801145==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ub7ojtsuyl5akr4c"
Content-Disposition: inline


--ub7ojtsuyl5akr4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 10:40:24PM +0530, Jagan Teki wrote:
> On Fri, Feb 26, 2021 at 10:27 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Mon, Feb 15, 2021 at 01:11:01AM +0530, Jagan Teki wrote:
> > > Use drm_panel_bridge to replace manual panel handling code.
> > >
> > > This simplifies the driver to allows all components in the
> > > display pipeline to be treated as bridges, paving the way
> > > to generic connector handling.
> > >
> > > Use drm_bridge_connector_init to create a connector for display
> > > pipelines that use drm_bridge.
> > >
> > > This allows splitting connector operations across multiple bridges
> > > when necessary, instead of having the last bridge in the chain
> > > creating the connector and handling all connector operations
> > > internally.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Most of the code removed in that patch was actually introduced earlier
> > which feels a bit weird. Is there a reason we can't do that one first,
> > and then introduce the bridge support?
>=20
> This patch adds new bridge API's which requires the driver has to
> support the bridge first.

I'm not sure what you're saying, you can definitely have a bridge
without support for a downstream bridge.

Anyway, my point is that:

> ---
> Changes for v3:
> - new patch
>
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 108 +++++++------------------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 --
>  2 files changed, 27 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 3cdc14daf25c..5e5d3789b3df 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -769,12 +770,6 @@ static void sun6i_dsi_bridge_pre_enable(struct drm_b=
ridge *bridge)
>  	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
>  	phy_configure(dsi->dphy, &opts);
>  	phy_power_on(dsi->dphy);
> -
> -	if (dsi->panel)
> -		drm_panel_prepare(dsi->panel);
> -
> -	if (dsi->panel_bridge)
> -		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);

This is added in patch 2

>  }
>
>  static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
> @@ -793,12 +788,6 @@ static void sun6i_dsi_bridge_enable(struct drm_bridg=
e *bridge)
>  	 * ordering on the panels I've tested it with, so I guess this
>  	 * will do for now, until that IP is better understood.
>  	 */
> -	if (dsi->panel)
> -		drm_panel_enable(dsi->panel);
> -
> -	if (dsi->panel_bridge)
> -		dsi->panel_bridge->funcs->enable(dsi->panel_bridge);
> -

This is added in patch 2

>  	sun6i_dsi_start(dsi, DSI_START_HSC);
>
>  	udelay(1000);
> @@ -812,14 +801,6 @@ static void sun6i_dsi_bridge_disable(struct drm_brid=
ge *bridge)
>
>  	DRM_DEBUG_DRIVER("Disabling DSI output\n");
>
> -	if (dsi->panel) {
> -		drm_panel_disable(dsi->panel);
> -		drm_panel_unprepare(dsi->panel);
> -	} else if (dsi->panel_bridge) {
> -		dsi->panel_bridge->funcs->disable(dsi->panel_bridge);
> -		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
> -	}
> -

This is added in patch 2

>  	phy_power_off(dsi->dphy);
>  	phy_exit(dsi->dphy);
>
> @@ -828,63 +809,13 @@ static void sun6i_dsi_bridge_disable(struct drm_bri=
dge *bridge)
>  	regulator_disable(dsi->regulator);
>  }
>
> -static int sun6i_dsi_get_modes(struct drm_connector *connector)
> -{
> -	struct sun6i_dsi *dsi =3D connector_to_sun6i_dsi(connector);
> -
> -	return drm_panel_get_modes(dsi->panel, connector);
> -}
> -
> -static const struct drm_connector_helper_funcs sun6i_dsi_connector_helpe=
r_funcs =3D {
> -	.get_modes	=3D sun6i_dsi_get_modes,
> -};
> -
> -static enum drm_connector_status
> -sun6i_dsi_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	struct sun6i_dsi *dsi =3D connector_to_sun6i_dsi(connector);
> -
> -	return dsi->panel ? connector_status_connected :
> -			    connector_status_disconnected;
> -}
> -
> -static const struct drm_connector_funcs sun6i_dsi_connector_funcs =3D {
> -	.detect			=3D sun6i_dsi_connector_detect,
> -	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> -	.destroy		=3D drm_connector_cleanup,
> -	.reset			=3D drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
> -};
> -
>  static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
>  				   enum drm_bridge_attach_flags flags)
>  {
>  	struct sun6i_dsi *dsi =3D bridge_to_sun6i_dsi(bridge);
> -	int ret;
> -
> -	if (dsi->panel_bridge)
> -		return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, NULL, 0);

This is added in patch 2

> -	if (dsi->panel) {
> -		drm_connector_helper_add(&dsi->connector,
> -					 &sun6i_dsi_connector_helper_funcs);
> -		ret =3D drm_connector_init(bridge->dev, &dsi->connector,
> -					 &sun6i_dsi_connector_funcs,
> -					 DRM_MODE_CONNECTOR_DSI);
> -		if (ret) {
> -			dev_err(dsi->dev, "Couldn't initialise the DSI connector\n");
> -			goto err_cleanup_connector;
> -		}
> -
> -		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> -	}

This has been added (through a rework) in patch 3

Surely we can do better?

Maxime

--ub7ojtsuyl5akr4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYD5pOQAKCRDj7w1vZxhR
xfVtAP9wMe7RvNvrSVuQdpWX/DrKN7q5fRUj7rXwkXAIEmLrnAD/Ss+8/iUbeEhs
DnzERuMkDyrT9yxxKfbDbnnc+4hGTAc=
=0UGu
-----END PGP SIGNATURE-----

--ub7ojtsuyl5akr4c--

--===============0892801145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0892801145==--
