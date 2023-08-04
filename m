Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A776F82C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 05:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EDB10E232;
	Fri,  4 Aug 2023 03:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CF210E231
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 03:03:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E97D061F1E;
 Fri,  4 Aug 2023 03:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24337C433C7;
 Fri,  4 Aug 2023 03:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691118238;
 bh=PplwZWUSWRelG+HtJwh19hJ07dNTMpB+8ATd3U9MXpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NsGOS3SHUD68Ryh6BsLW3/hfZShmEBJVcGVkATBUgiesMUdkUtRYfM4ksx1CMWZ6v
 uwhNloO2c/Knaa/68tkjrKsr89qc7ZhlQvT7n3FVkoA6tPD8eXPdvwoKFGCY0wWklm
 aGoxqeaGyrLTnEINtiQWwxVgh0fQK3Tdp9ENart7fXaC1NpOXA8gRcrgin1PhPhidV
 99xjofdMknzbL9aAr3b+S9ZIyC4HhrKSZTEUkn87uooyX5ce6b/B9eBQaBIo3J7vS3
 vqZBmCOlgaqW90jWtS/mZwszNi5EisMiBqADn1Q3xj1+DbieCAqRiFlN/mW48S+NN0
 EZVBdACDy0C+w==
Received: by mercury (Postfix, from userid 1000)
 id CEAE81061B64; Fri,  4 Aug 2023 05:03:54 +0200 (CEST)
Date: Fri, 4 Aug 2023 05:03:54 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v2 2/3] drm/panel: sitronix-st7789v: add panel
 orientation support
Message-ID: <20230804030354.oi3xnegv4afnqe5l@mercury.elektranox.org>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
 <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fckfwghtydhzpdqt"
Content-Disposition: inline
In-Reply-To: <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fckfwghtydhzpdqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 03, 2023 at 10:13:49PM +0200, Michael Riesch wrote:
> Determine the orientation of the display based on the device tree and
> propagate it.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7789v.c
> index c7cbfe6ca82c..6575f07d49e3 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -116,6 +116,7 @@ struct st7789v {
>  	struct spi_device *spi;
>  	struct gpio_desc *reset;
>  	struct regulator *power;
> +	enum drm_panel_orientation orientation;
>  };
> =20
>  enum st7789v_prefix {
> @@ -170,6 +171,7 @@ static const struct drm_display_mode default_mode =3D=
 {
>  static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> +	struct st7789v *ctx =3D panel_to_st7789v(panel);
>  	struct drm_display_mode *mode;
> =20
>  	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
> @@ -188,9 +190,22 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  	connector->display_info.width_mm =3D 61;
>  	connector->display_info.height_mm =3D 103;
> =20
> +	/*
> +	 * TODO: Remove once all drm drivers call
> +	 * drm_connector_set_orientation_from_panel()
> +	 */
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
> +
>  	return 1;
>  }
> =20
> +static enum drm_panel_orientation st7789v_get_orientation(struct drm_pan=
el *p)
> +{
> +	struct st7789v *ctx =3D panel_to_st7789v(p);
> +
> +	return ctx->orientation;
> +}
> +
>  static int st7789v_prepare(struct drm_panel *panel)
>  {
>  	struct st7789v *ctx =3D panel_to_st7789v(panel);
> @@ -349,6 +364,7 @@ static const struct drm_panel_funcs st7789v_drm_funcs=
 =3D {
>  	.disable =3D st7789v_disable,
>  	.enable	=3D st7789v_enable,
>  	.get_modes =3D st7789v_get_modes,
> +	.get_orientation =3D st7789v_get_orientation,
>  	.prepare =3D st7789v_prepare,
>  	.unprepare =3D st7789v_unprepare,
>  };
> @@ -382,6 +398,8 @@ static int st7789v_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> +	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +
>  	drm_panel_add(&ctx->panel);
> =20
>  	return 0;
>=20
> --=20
> 2.37.2
>=20

--fckfwghtydhzpdqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmTMapoACgkQ2O7X88g7
+poNkw/9FKqiodGUO8oFovN4JVW9FCQGSACAJH7yPrN1OCyaT1zTiCbCfXsiCWHX
ZO4DvPpUsB7EB1yMjbmCriZYBM65fAt53Ut1cZCSSCtsqyPEe774FRaqkCOxZ14x
bskZcYLewAeBDVNYoMrzowcJeN31G0VynUhirWDGdLdz6j7chyZTatawAsodaA2N
pxXgZf6Qp086U3xgJ8HiTHy/Lsrgm7jTQwhTCHGwpQtSE4LfsH6QFcGPKJO3RL2q
Jem0fKNmF9IggzAE9kM13Uvv+BJxDSIYOh1Mn6Q7Du7TBLKYQJDgEXR2t9omslWT
ui45HC8InH/GDfygMyDoxJBR+E1lHY8atY48BY1BC0LAd9ntzb3usQ6C41sOPjKR
BWHc9jjCStmS0ANW/EddEd4HbaJgYt8n6527ofuA+ELav2u1CTP+oeQPZOChw3w0
ctR8mk0ljazzNd6G7es3XCbhacod0aeNUV+EIi92lQZGY0Jud3ZIm/UcGYEUqC8F
e3691/BY7G60vjg2IBRSab+Hrh6bZTercd0qWqpNhDDF24TM8X6NVoj0fvqO/svu
V0YDej1OlmwmldjV0afQ7PcEBqaAm945Y3JQZWQyXYfDKFuSqLJyWo0qxZ2ER2h0
oNH+eu6v53SvWLw1+jH3MoDMdWoklFOX6V4xbW0016kja7uOIo4=
=fXVP
-----END PGP SIGNATURE-----

--fckfwghtydhzpdqt--
