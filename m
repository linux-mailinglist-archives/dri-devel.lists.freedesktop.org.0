Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAC4732C9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 18:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CF410E80B;
	Mon, 13 Dec 2021 17:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7179D10E80B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 17:18:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BA31B5C021F;
 Mon, 13 Dec 2021 12:18:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 13 Dec 2021 12:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CsDNnPnXTUbPA5jENq+CqL88VrE
 jZHmLoygWsiBVAV8=; b=IhY2WnHKXyU53WogCi88ZokOni8gHm9HAHbxxirjrkn
 YKXeGlD+qJPObBQXr+Uouj2bSmtppH3UzpJ/0DacCwIx6qRKJgWSuUsnxrj9uKyP
 WF5lILEPF9zYwgWhvl/PC8oHH2N8nOXvnznWAZADCd/dPOyN7YrgUu2ZcFJlRlG2
 NCVDihjQxiU+edjiLo6KU7ghazXiV8x3nFYpjCgthHBTGAf+llQDWq7SuDuqine4
 ioeMTOaH/tRI1R1VoBOwWBFtw5TtzAQH72ArAJFYWhuNxLt3LTPo8N7AqUusOoC4
 94OuKAZfx2B0n0u4rfBMc/luzZUStn5ouJxpGDWXVOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CsDNnP
 nXTUbPA5jENq+CqL88VrEjZHmLoygWsiBVAV8=; b=SCjLq8edh2JDnR/GNYjBsa
 qSK7+IuVPeCMCEJDZjzeqnSzcNE/e6mmw1x01+huOkf0j+K3akT2r+3vcYABm+3B
 pDsQKyHB+t6ylx7H4l9Dx0zQRm2W6LCSQ1QUs9qIpV18z+vlHU8NqFQIA/GZPMBz
 t+dC1AkzsS015iJ3ed8FBD62wztLwcMQ6pPAyHCOmDYkLV5Eg6cOtvezo/rIIc3E
 ZFc7ALSy9lme1ZxMzkRhl+fdIKN+w/pPahij811Ch4jrTWxCZq1DEQmxsvOVA2SS
 q67CfEJUq3kRUePzAbsynU1YW2E98AUKKqQYr4zA+vS1IsyIzmDygEdFEYeh2osQ
 ==
X-ME-Sender: <xms:R4C3YROwKy-Ydh0NGdPy6rUyL93oM79nZk9xYjx0tjwuGnE4mNG3ew>
 <xme:R4C3YT8mRWkdpxzRisv3mjkmdxNsp8on02mmRRiDxHM2aUd9M2dIy09uE-ndNOaUL
 tdxOu-hPlEejfC_b0I>
X-ME-Received: <xmr:R4C3YQQ7Qs5nFzfdNVAUmAkX3Z78NVx3TPYt_9fDj4RX8YlchmQZcQ2HdcWvi6_APE41XvR0Cfwyr8mHWFwEHGpwYypxHPmyQxckHe7J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R4C3YdskzHdeaZLFaUEpWQ6PhhfXp9nQQ3RBI6dQ0D1Gs7R5Y7-r2Q>
 <xmx:R4C3YZc3MIvU8wMvnFeLaxv1XdwfgUlNKuOJSbSs59B2nIdte9LMTA>
 <xmx:R4C3YZ3xk0c3WCNqoCEMljvNXeG49xjTd1HUUJTgRgazsG34ECL-gw>
 <xmx:SIC3YYzsxViDp09nf5jiG53bfbXmy6OqIx7hoy2xdlfAfrYtx88wIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 12:17:59 -0500 (EST)
Date: Mon, 13 Dec 2021 18:17:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 3/6] drm: sun4i: dsi: Add bridge support
Message-ID: <20211213171757.bxu57eaqawmp5kwh@houat>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-4-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xpbwef7eosymdczj"
Content-Disposition: inline
In-Reply-To: <20211210111711.2072660-4-jagan@amarulasolutions.com>
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


--xpbwef7eosymdczj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 04:47:08PM +0530, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output, those
> can have an option to connect the DSI host by means of interface
> bridge converter.
>=20
> This DSI to non-DSI interface bridge converter would require
> DSI Host to handle drm bridge functionalities in order to
> communicate interface bridge.
>=20
> This patch adds support for bridge functionalities in Allwinner
> DSI controller.
>=20
> Supporting down-stream bridge makes few changes in the driver.
>=20
> - It drops drm_connector and related operations as drm_bridge_attach
>   creates connector during attachment.
>=20
> - It drop panel pointer and iterate the bridge, so-that it can operate
>   the normal bridge and panel_bridge in constitutive callbacks.
>=20
> - It uses devm_drm_of_get_bridge for panel or bridge lookup. It uses
>   port 0 and endpoint 0 to support I2C-based bridges eventhough the
>   usual Allwinner DSI OF graph doesn't require this for panel and
>   non-I2C based downstream bridges.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - support donwstream bridge
> - drop bridge conversion
> - devm_drm_of_get_bridge() require child lookup
> https://patchwork.kernel.org/project/dri-devel/cover/20211207054747.46102=
9-1-jagan@amarulasolutions.com/
> Changes for v5:
> - add atomic APIs
> - find host and device variant DSI devices.
> Changes for v4, v3:
> - none
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 83 ++++++++++----------------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  9 +--
>  2 files changed, 33 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 9cf91dcac3f2..f1d612bf1a0b 100644
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
> @@ -720,6 +721,7 @@ static void sun6i_dsi_encoder_enable(struct drm_encod=
er *encoder)
>  	struct mipi_dsi_device *device =3D dsi->device;
>  	union phy_configure_opts opts =3D { };
>  	struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dphy;
> +	struct drm_bridge *iter;
>  	u16 delay;
>  	int err;
> =20
> @@ -769,8 +771,10 @@ static void sun6i_dsi_encoder_enable(struct drm_enco=
der *encoder)
>  	phy_configure(dsi->dphy, &opts);
>  	phy_power_on(dsi->dphy);
> =20
> -	if (dsi->panel)
> -		drm_panel_prepare(dsi->panel);
> +	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
> +	}

Like we discussed in the previous version already, this is unnecessary,
just like the poking at bridge_chain in the encoder.

Maxime

--xpbwef7eosymdczj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbeARQAKCRDj7w1vZxhR
xXHjAP46GiodqPLdBDkSZohe2PpyTCSBnADcEqqQV97Apgr0HgEA4llq0b2KPIjV
CfPVh81D9P3EK0p3i4M3WBeCfEN6dAs=
=CE/S
-----END PGP SIGNATURE-----

--xpbwef7eosymdczj--
