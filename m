Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 993854732A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 18:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8B610E7C4;
	Mon, 13 Dec 2021 17:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB1810E7C4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 17:05:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B0965C01A6;
 Mon, 13 Dec 2021 12:05:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Dec 2021 12:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=e95AF2j9MiIxrIXhpLNwutXXb93
 SHacg7FqvkjbL/Y8=; b=Rz50GGTSkJ261LZbn5rizfYS/0Rc9cUE7UnTs64ita+
 z4RDrqY81V1u5AfLAFEiW2QqzwhOXU9hQ7pkphfh+6PsSvWt0dHWGn83WHDHqxQ3
 PZX5+mSI2XF72Ox3rgS5KtJSWWCZ4kUy2KI0uSiKWLgP+BXD5w4q8kHKaadoJ2YQ
 P/zK1PhFTrk1igi+mppugTxPUDXerSyOTwVLzsVqC+6zwU1WEG5wQSSaTWHoxCcN
 9BE5aVQG5YAobHhZG2GLSVW0sb5dV/M4Rw3lm0ip/rUfJ4wypzswAyIFcSnhLneb
 cdNcpXqOXN50x9iuFw8smzeG9y5+zVd4wEoowE5UPRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e95AF2
 j9MiIxrIXhpLNwutXXb93SHacg7FqvkjbL/Y8=; b=G8M323Ra4+izS3Hh9FF8KR
 xidconoKDOKfkMM5p1yP559sqizx7qSp34O7tClSPxQzxrff/zZrx5h/Vtm2Co4d
 DIn9zFA5du3lM9BAbEGhJ6ayhv6OpCS1dlMgc+5ASqrPYWRM+aQtc0zGOCx7IjmF
 2Xdr7AJgIjzJDaiIiuo6+0XvBGF7YEQDxZ75vixI4BTU4FkmixQ8du8ytOrSrNed
 zjEmRsHFZ3Ub694z9Dvqqi/6o/wsNngA66EQDu0d3Wz9QDtjS2ylkTw7IdtKT33r
 2DMxXAeIJjOKUPMRHarhnk5u4dOzYoXSurvQ/X/XE0UYj+XIJm83aVICbZqVtT3w
 ==
X-ME-Sender: <xms:TX23YR3A3Ql7OocE58UrbmUeLj_tKXpopL6HpWsoXwJg_0sZ2O-Maw>
 <xme:TX23YYH2tvbbp6Z7CLGw26iuOi616hflKOuIo53T3qZeqgwe06i_gMdmoMjB0LtlL
 v5dU5hpm9itIVbHRGc>
X-ME-Received: <xmr:TX23YR4zq4GeMRvCBh1iLt5rDpko-t1fGwfdqNUW1vjVpSl41w1sY-6tIGFwznDMq7ODCf_x-Jy4ogH4_fThm8mEX-CtsseKL-fZk_wY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TX23Ye0jXW41GZ_uqWlvtkIEG_IOb9OLAAlQ_lN1VXUC_YmVSkk4ZQ>
 <xmx:TX23YUH-rozTJVILwLBr7d3zofq7qXBhdpj7MNlOrL0tj2TiRTuj5Q>
 <xmx:TX23Yf9Dw2HmeQEgQ6SoOvMf7IUMQxVheIvH4fZeOiU_Lh2RUJyV9w>
 <xmx:Tn23YSYfJeQj6yDlJp9lAebUaftZpCe_xuFr5uehLYn0P3xomMEy1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 12:05:16 -0500 (EST)
Date: Mon, 13 Dec 2021 18:05:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 2/6] drm: sun4i: dsi: Add component only once DSI
 device attached
Message-ID: <20211213170515.2xzx52pedqcjqiyy@houat>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y7qgik3d2zhwi7o4"
Content-Disposition: inline
In-Reply-To: <20211210111711.2072660-3-jagan@amarulasolutions.com>
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


--y7qgik3d2zhwi7o4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 04:47:07PM +0530, Jagan Teki wrote:
> Having component_add for running all drm bind callbacks returns
> error or unbound due to chain of DSI devices connected across
> bridge topology on a display pipeline.

I'm not sure what that means?

> In a typical bridge oriented display pipeline where the host is
> connected to the bridge converter and that indeed connected to
> a panel.
>=20
> DRM =3D> SUN6I DSI Host =3D> Chipone ICN6211 =3D> BananaPi Panel
>=20
> The bridge converter is looking for a panel to probe first and
> then attach the host. The host attach is looking for a bridge
> converter to probe and preserve bridge pointer, at this movement

                                                          ^ moment ?

> the host is trying to bind the all callbacks and one of the bind
> callback in the DSI host is trying to find the bridge using the
> bridge pointer in sun6i_dsi_attach call.
>=20
> chipone_probe().start
>     drm_of_find_panel_or_bridge
>         mipi_dsi_attach
>              sun6i_dsi_attach
>                  drm_of_find_panel_or_bridge
> chipone_probe().done
>=20
> sun6i_dsi_probe().start
>     mipi_dsi_host_register
>         component_add
> sun6i_dsi_probe().done
>=20
> However, the movement when panel defers the probe, will make the
> bridge converter defer the host attach call which eventually found
> a NULL bridge pointer during DSI component bind callback.
>=20
> So, in order to prevent this scenario of binding invalid bridge,
> wait for DSI devices on the pipeline to probe first and start the
> binding process by moving component_add in host probe to attach call.
>=20
> chipone_probe().start
>     drm_of_find_panel_or_bridge
>         mipi_dsi_attach
>              sun6i_dsi_attach
>                  drm_of_find_panel_or_bridge
>       		      component_add
> chipone_probe().done
>=20
> sun6i_dsi_probe().start
>     mipi_dsi_host_register
> sun6i_dsi_probe().done
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - none
> Changes for v5:
> - new patch
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 120 +++++++++++++------------
>  1 file changed, 61 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 4bdcce8f1d84..9cf91dcac3f2 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -959,11 +959,63 @@ static int sun6i_dsi_dcs_read(struct sun6i_dsi *dsi,
>  	return 1;
>  }
> =20
> +static int sun6i_dsi_bind(struct device *dev, struct device *master,
> +			 void *data)
> +{
> +	struct drm_device *drm =3D data;
> +	struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	drm_encoder_helper_add(&dsi->encoder,
> +			       &sun6i_dsi_enc_helper_funcs);
> +	ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
> +	if (ret) {
> +		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
> +		return ret;
> +	}
> +	dsi->encoder.possible_crtcs =3D BIT(0);
> +
> +	drm_connector_helper_add(&dsi->connector,
> +				 &sun6i_dsi_connector_helper_funcs);
> +	ret =3D drm_connector_init(drm, &dsi->connector,
> +				 &sun6i_dsi_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DSI);
> +	if (ret) {
> +		dev_err(dsi->dev,
> +			"Couldn't initialise the DSI connector\n");
> +		goto err_cleanup_connector;
> +	}
> +
> +	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +
> +	return 0;
> +
> +err_cleanup_connector:
> +	drm_encoder_cleanup(&dsi->encoder);
> +	return ret;
> +}
> +
> +static void sun6i_dsi_unbind(struct device *dev, struct device *master,
> +			    void *data)
> +{
> +	struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> +
> +	drm_encoder_cleanup(&dsi->encoder);
> +}
> +
> +static const struct component_ops sun6i_dsi_ops =3D {
> +	.bind	=3D sun6i_dsi_bind,
> +	.unbind	=3D sun6i_dsi_unbind,
> +};

Just use a forward declaration there, it will make the patch more
straightforward.

Maxime

--y7qgik3d2zhwi7o4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbd9SwAKCRDj7w1vZxhR
xTfsAQD+sHZYd5aYSJVMY/r6BH/r1d40RbJ4XF6fFY7wcKtfEgEA+BQwdgaDHwdG
miCwNJkfa7m6wgG7zJMkFSKpyz24RAI=
=ffqM
-----END PGP SIGNATURE-----

--y7qgik3d2zhwi7o4--
