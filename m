Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA41544662
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 10:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D8C10F52D;
	Thu,  9 Jun 2022 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C056310F51A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 08:50:59 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B33BD1BF207;
 Thu,  9 Jun 2022 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654764655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BfxHp0UuzcNZYyEYJ1sl50Rmbz5Dg36Jzk5KDYEN71c=;
 b=gMVrSgsQw/RkdjR/riiWS3r+GUSazRwduSFxjiZiSzSSsjHrswzxgGCwyyhQ7vDQx2JEZE
 feYYvwz5i+3d6w0Gsd/7r/LruFyMpMJS7PfKZ5ehmd9+kaYcXiKmAH6N1+23bRg0TdRIeH
 xFkwSoXoLb4u4QXxiJXBc0WZeNkLFoZqGb++RXg04dlKI0cfkgJlr/Ybqnms9sawyAiLeY
 Z+N7WBd7Qk97uUbNzfNo6O3JE54Ns5RIFXqTk/PwQX6eRUiauygFoNU/m/iIJmjpxN8Cp0
 0+LbmiwsfsPirwlPV4qIu7n+nDvpl3vMdmsPww9pNWAr91ZtTmTM1EuPIyOWaA==
Date: Thu, 9 Jun 2022 10:50:53 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 1/3] drm/panel: ltk050h3146w: add
 mipi_dsi_device.mode_flags to of_match_data
Message-ID: <YqG0bfNNiF+1dY36@aptenodytes>
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2VFOPZfnHB1h1LU+"
Content-Disposition: inline
In-Reply-To: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2VFOPZfnHB1h1LU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 31 Jan 22, 17:47, quentin.schulz@theobroma-systems.com wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>=20
> To prepare for a new display to be supported by this driver which has a
> slightly different set of DSI mode related flags, let's move the
> currently hardcoded mode flags to the .data field of of_device_id
> structure.
>=20
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

LGTM:

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers=
/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index a5a414920430..67eb474e28c6 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -25,6 +25,7 @@ struct ltk050h3146w_cmd {
> =20
>  struct ltk050h3146w;
>  struct ltk050h3146w_desc {
> +	const unsigned long mode_flags;
>  	const struct drm_display_mode *mode;
>  	int (*init)(struct ltk050h3146w *ctx);
>  };
> @@ -339,6 +340,8 @@ static const struct drm_display_mode ltk050h3146w_mod=
e =3D {
>  static const struct ltk050h3146w_desc ltk050h3146w_data =3D {
>  	.mode =3D &ltk050h3146w_mode,
>  	.init =3D ltk050h3146w_init_sequence,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>  };
> =20
>  static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int pag=
e)
> @@ -433,6 +436,8 @@ static const struct drm_display_mode ltk050h3146w_a2_=
mode =3D {
>  static const struct ltk050h3146w_desc ltk050h3146w_a2_data =3D {
>  	.mode =3D &ltk050h3146w_a2_mode,
>  	.init =3D ltk050h3146w_a2_init_sequence,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>  };
> =20
>  static int ltk050h3146w_unprepare(struct drm_panel *panel)
> @@ -592,8 +597,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device =
*dsi)
> =20
>  	dsi->lanes =3D 4;
>  	dsi->format =3D MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> +	dsi->mode_flags =3D ctx->panel_desc->mode_flags;
> =20
>  	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2VFOPZfnHB1h1LU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmKhtGwACgkQ3cLmz3+f
v9EUjAf/ZCcLHlhyKYX6Azym+bJX1cWtg07PR2Hk6nqetoQxApl2uC6TCzn8X2FH
kMKfRP/A613N18MRf6Gu5OTBsE7U76fyIjjSCMWfiNqIm2XYGhnysAhNlOYUf5m3
cAlOq9BkMFw7snTxdDnoyDy34vohvPa68/XJ5VwgclTEEmRHQrwL98eUayLQQelB
gSKR3S1WBkhctUpIUK7u/lq5QvThzqoTkcU2N82EwkJuNYuyWF3RuWtcOiyZX7j5
h5x+y6woInlxg9SLdQjlCXJvosaq99jUJg9yFA5PoURODe4HKtr9e1FEJiCRxIG6
Ohoa6vTTvd44gqPL/5CJsSt1lOgE/w==
=ncrv
-----END PGP SIGNATURE-----

--2VFOPZfnHB1h1LU+--
