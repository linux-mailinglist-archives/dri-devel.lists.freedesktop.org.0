Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0AE4CA1A1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7462210F2CB;
	Wed,  2 Mar 2022 10:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CFC10F2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:01:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F7CC5C021A;
 Wed,  2 Mar 2022 05:01:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Mar 2022 05:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=7oxw8JwtH0lCDzPoOYEhtfAWeS0vp2Tq9n2Vih
 c5gUw=; b=d3svpoYH2XOqupp0RGUxgnR1sOdwkTF8V1601npuEw4hdkk/HeUnnM
 LaKEvqo6kjD7VeHLDr38tDHnohjDHsvLmDVjzn2dN4T3/4GUH/5YY1jibpg2BlRb
 TODANek5nRGWSeRgA0Wk1PkGZz4nZAEagvmFUZvmlXEnpAC3vI5zjJMAoylfnQJh
 YF1ypVU4GIWww+OWeGTanGg1Xon31uZn53YY5wMpmCFHf+Uy+CyDmtrRv1sCt1xI
 fEdJqb0rAcMi/rtYpEzy+AJAJ5JnY1KUAP+gMbaUbmD0+G6BdJzO2VfPvkkH6Afj
 jKoGReImpi9z4mfczUt0FkyNMxfBvcAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7oxw8JwtH0lCDzPoO
 YEhtfAWeS0vp2Tq9n2Vihc5gUw=; b=dfFjVIkDty+aKBRJ0ossEnQZwQo9YXk1C
 FFrbnaC2V5R/1YHEkQa+VPVPk99bSEPCu+ySyUuG1bjRMZUTb/m1yPvZ+UphWIkp
 YBrAqY3s45L/0qcDb8kt+lEqJEVJhMsZ6SA02IagbGCcnrAsJw7dgc1Rde8oYoZe
 T7OXSGRVFmpDTr3p8bXUCruI6PiwUxyhLymLj2LHCdXGc/hP20kNzIXZEnJbPT2I
 EK42p+iCNEu8aNQlgCKGaCARw0JsVQjCBL4BN++NzXyywsUz1RzoMzU+d9GUkcgu
 J/UhEF9t7DFRNzMmb3M0yf4FoeRFbZDtVemkAjglx4AhHh98OkmuA==
X-ME-Sender: <xms:iEAfYth61sNqGUHwQTX0wfudK8z6ie3346DHZ2MmLRHZKjKEh7Gn8Q>
 <xme:iEAfYiB6xuu4nvnJ4zZMdjoS4tFMQI9BDnImUKPtryXUps-91stzw8qZy0X9g6ERC
 q9Y_JQ2SZKe1ak-zn8>
X-ME-Received: <xmr:iEAfYtEXGwJiIaq923G4p4v-iQ15QTwwksHv8OrZZvcIPI8uRWl3QqSi8L-sHjwV1YSSCFH_lM1euFDXdapOmL0XpU-vbsnJmgNqAyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iUAfYiRWfrSRE1LWSj8bkTpCuJD0ce-Sr_TD_OhD_GWlFiWkLCLocw>
 <xmx:iUAfYqzJojhkatZBqkBoq7SyqfSpAyvl9l9w6RoUwsnHUj9v0JnuYA>
 <xmx:iUAfYo4C9_H9kzSPC4sxxtijJ1tgkYItRJiZXNN8Fbo0psEY8mXFkQ>
 <xmx:iUAfYkvOQzAqQl1cnfjNBqt1cAa50ZSMKQJRRWqUP9Y8DB7QH5QNqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:01:44 -0500 (EST)
Date: Wed, 2 Mar 2022 11:01:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 04/12] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220302100143.pvy77sw2sgd57tql@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kzdr55c5mebf6o3s"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-5-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kzdr55c5mebf6o3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:22AM +0100, Marek Vasut wrote:
> The driver currently hard-codes DSI lane count to two, however the chip
> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
> property and program the result into DSI_CTRL register.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Rebase on next-20220214
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 2ac8eb7e25f52..7c013a08c7b00 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -136,10 +136,12 @@ struct chipone {
>  	struct drm_bridge bridge;
>  	struct drm_display_mode mode;
>  	struct drm_bridge *panel_bridge;
> +	struct device_node *host_node;
>  	struct gpio_desc *enable_gpio;
>  	struct regulator *vdd1;
>  	struct regulator *vdd2;
>  	struct regulator *vdd3;
> +	int dsi_lanes;
>  };
> =20
>  static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridg=
e)
> @@ -212,6 +214,11 @@ static void chipone_atomic_enable(struct drm_bridge =
*bridge,
>  	/* dsi specific sequence */
>  	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
>  	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
> +
> +	/* DSI data lane count */
> +	ICN6211_DSI(icn, DSI_CTRL,
> +		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
> +
>  	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>  	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
> =20
> @@ -314,6 +321,7 @@ static const struct drm_bridge_funcs chipone_bridge_f=
uncs =3D {
>  static int chipone_parse_dt(struct chipone *icn)
>  {
>  	struct device *dev =3D icn->dev;
> +	struct device_node *endpoint;
>  	struct drm_panel *panel;
>  	int ret;
> =20
> @@ -350,6 +358,16 @@ static int chipone_parse_dt(struct chipone *icn)
>  		return PTR_ERR(icn->enable_gpio);
>  	}
> =20
> +	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	icn->dsi_lanes =3D of_property_count_u32_elems(endpoint, "data-lanes");

The binding must be amended to allow for the usage of data-lanes, and
you need to keep the previous value as default for older device trees

Maxime

--kzdr55c5mebf6o3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9AhwAKCRDj7w1vZxhR
xeEJAP4rKR0Gf9rcwygCJ0K0PemJe47h3eAzdZ+o7ipvY1kDsgEAhqYcoUSy3td7
hZhpHvY0nZ55DBCmdDRStJZuDQ3MXwU=
=9Y4/
-----END PGP SIGNATURE-----

--kzdr55c5mebf6o3s--
