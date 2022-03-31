Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0854EDE1C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 18:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D2C10F40C;
	Thu, 31 Mar 2022 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5010F40B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:01:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F03175C01AC;
 Thu, 31 Mar 2022 12:01:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 31 Mar 2022 12:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Y2fZ8eYfUysVsSlZPJf0JztEkcPg001Cll7Ufz
 wVD1k=; b=XCNxXbAQ2eh5VbkHt4tPNRiIp83+E8XQT00pDsp/OAd9N2BNuauIBJ
 xryw0joBnDfM+eb/86HjBapquhzqrfKoIm51xBi/GZhdn+MiJZemSSpO2Nzut59+
 /kiW05pRmMEbz+MtFx07OaAx+J/GVVP3v0AYOrXKQzbWAest7WmH+pI0iqDZUswM
 M0+O3ms0O+PbUtWSMORTBkoU06ddVPf8ArTTfFt/DxJPzHNNFZELwEl+nLWHtN+3
 jecQtJiVrLVSZm/3jDp8CV+v2frmrsZt0K3RwPhynoo8P2nEKDGnAZBpz0qx8WtR
 QVo/d6IjpVnd88MVbJ4Xwzic6UjtcpuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y2fZ8eYfUysVsSlZP
 Jf0JztEkcPg001Cll7UfzwVD1k=; b=IkMInkZaLEraeZN0dAzEcS3TEIQ9wNIJ8
 jrtDfnPETJyNpo+bbsDNZ5L0hCZZVWMBtHfPpGn8CizWGby5stQsPzjmxo5Jj5Fd
 syiBr4Ryiw+gjNpapjqeREPzIHaf2ftoUY0R16P0WXf7MXpjrBVzHuWe9rqt5Aq5
 dwH3oDjlXi4qMP6Ka1zRN/gMuOj2dhv+Po4X+Mi4f0Byq/91/Gs2T8HfXwRXOhv1
 v7FGUB9oPhYX7tGdFSO/j10TP3V5VeW62I93nNAOVxdi8ceR4ZwdqMYgXNL2N8yr
 1nXZ/EqDhosoBBpRQA4FBnkxsD5sM1uX5X8NOjeRfv9Tn1FLScxaQ==
X-ME-Sender: <xms:atBFYofarEELLvcyS-kQOfuAlVvTx0RozLCw2IJ_0vUsnvcWtIW2rQ>
 <xme:atBFYqNxWBGtQjPNkpL1Wyf2eeeWztGWGNIWkzKYM3o-o5ZBzsQ8kylcAwc2eKxlc
 9DfbA8X3x9C_oVGo9o>
X-ME-Received: <xmr:atBFYpgsZeyZti9XT4j-5_JEkdRQmj99SKqr2gWIeS7Cz2yXXbW74zMLcsg5vjmaMo0LRMa3Uzwx8zi-lQ9n4ZDeXs5lDF-l0Sa0Wdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:atBFYt_4J742hkrhK3DABNzww5w4VPxTCTCAJYctsNxlp9wPeU2thQ>
 <xmx:atBFYksVdewVcQ8VnJMzEa0gQoXVXSN_XrmTs4vZaaq-hs0xiGUbag>
 <xmx:atBFYkEPBgvbx8zYb2PbWYTThgCDql9-8KxVy1G9FUXzivHc7eUclA>
 <xmx:a9BFYojvMVdQWzc6wY30yccgp7Unf2JCXExFDVPtJxN9mf5d_KC_Lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:01:45 -0400 (EDT)
Date: Thu, 31 Mar 2022 18:01:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 5/5] drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge
Message-ID: <20220331160143.wjrg6bj6gwkwo5dn@houat>
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
 <20220331154503.66054-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hahchmjtfgynl7po"
Content-Disposition: inline
In-Reply-To: <20220331154503.66054-5-jagan@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hahchmjtfgynl7po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 09:15:03PM +0530, Jagan Teki wrote:
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>=20
> Replace explicit finding calls with devm_drm_of_get_bridge.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes for v4:
> - collect r-b
> Changes for v3:
> - fix commit head
> - drop panel.h
> - use drm_bridge_remove
> Changes for v2:
> - split the patch
>=20
>  drivers/gpu/drm/mcde/mcde_dsi.c | 44 +++++----------------------------
>  1 file changed, 6 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_=
dsi.c
> index 5651734ce977..083a4728654d 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -19,7 +19,6 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> =20
> @@ -39,7 +38,6 @@ struct mcde_dsi {
>  	struct device *dev;
>  	struct mcde *mcde;
>  	struct drm_bridge bridge;
> -	struct drm_panel *panel;
>  	struct drm_bridge *bridge_out;
>  	struct mipi_dsi_host dsi_host;
>  	struct mipi_dsi_device *mdsi;
> @@ -1073,9 +1071,7 @@ static int mcde_dsi_bind(struct device *dev, struct=
 device *master,
>  	struct drm_device *drm =3D data;
>  	struct mcde *mcde =3D to_mcde(drm);
>  	struct mcde_dsi *d =3D dev_get_drvdata(dev);
> -	struct device_node *child;
> -	struct drm_panel *panel =3D NULL;
> -	struct drm_bridge *bridge =3D NULL;
> +	struct drm_bridge *bridge;
> =20
>  	if (!of_get_available_child_count(dev->of_node)) {
>  		dev_info(dev, "unused DSI interface\n");
> @@ -1100,37 +1096,10 @@ static int mcde_dsi_bind(struct device *dev, stru=
ct device *master,
>  		return PTR_ERR(d->lp_clk);
>  	}
> =20
> -	/* Look for a panel as a child to this node */
> -	for_each_available_child_of_node(dev->of_node, child) {
> -		panel =3D of_drm_find_panel(child);
> -		if (IS_ERR(panel)) {
> -			dev_err(dev, "failed to find panel try bridge (%ld)\n",
> -				PTR_ERR(panel));
> -			panel =3D NULL;
> -
> -			bridge =3D of_drm_find_bridge(child);
> -			if (!bridge) {
> -				dev_err(dev, "failed to find bridge\n");
> -				return -EINVAL;
> -			}
> -		}
> -	}
> -	if (panel) {
> -		bridge =3D drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge)) {
> -			dev_err(dev, "error adding panel bridge\n");
> -			return PTR_ERR(bridge);
> -		}
> -		dev_info(dev, "connected to panel\n");
> -		d->panel =3D panel;
> -	} else if (bridge) {
> -		/* TODO: AV8100 HDMI encoder goes here for example */
> -		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> -		return -ENODEV;
> -	} else {
> -		dev_err(dev, "no panel or bridge\n");
> -		return -ENODEV;
> +	bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(bridge)) {
> +		dev_err(dev, "error to get bridge\n");
> +		return PTR_ERR(bridge);
>  	}
> =20
>  	d->bridge_out =3D bridge;
> @@ -1153,8 +1122,7 @@ static void mcde_dsi_unbind(struct device *dev, str=
uct device *master,
>  {
>  	struct mcde_dsi *d =3D dev_get_drvdata(dev);
> =20
> -	if (d->panel)
> -		drm_panel_bridge_remove(d->bridge_out);
> +	drm_bridge_remove(d->bridge_out);

You don't need drm_bridge_remove if you used devm_drm_of_get_bridge

Maxime

--hahchmjtfgynl7po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkXQZwAKCRDj7w1vZxhR
xUI8AQCk53tzgZlLg7YFoEF06rcTiRKgDtmEcnSaXC6vAJJiEgD/Zr1JiV+a9KtQ
HVJEkFoJunDvuJUlmBK9a3VvSezvNgc=
=mE40
-----END PGP SIGNATURE-----

--hahchmjtfgynl7po--
