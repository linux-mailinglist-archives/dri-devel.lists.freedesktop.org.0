Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD728706F8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452B9112306;
	Mon,  4 Mar 2024 16:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQ6acpC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0C112310
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:25:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B157CCE0A27;
 Mon,  4 Mar 2024 16:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BAFC433C7;
 Mon,  4 Mar 2024 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709569553;
 bh=2UZ7Ps4m/EJvpDzbZaPfX5VjodQWkCgg4RS6EPjKsCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JQ6acpC/cFa9wdBLb7Sws2VuYfCl+hY90Qsl+KTeVLG1ffOFpQKNDx0fFGYbFZOcr
 nR29qYIooowgh1Sp6FJsKpuMAWsXW5yYy3ze1RH7GdUK53xeMuSp5NP85GmbwxiSk8
 CUnNb+SYbDWqv7CrMlEufk1xc5AKLHuEtqNZi7KzdNtjNQ86fECtyyiQVUFqH7Ej6F
 5MTFFGi+yp5VI3QyGpxCq6yq1CGljfnu8gCDNbPwiMDKtoe+MTTavDBP/xd/XeU9SU
 IiDvMPKidoV5Sp9xjQMVrzjlWpl1TXNmtxF4+sD747PBYYvG1MRh0vKDpFUJB1UlWk
 uKH4RhpeQPzHg==
Date: Mon, 4 Mar 2024 17:25:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?SsOpcsOpbWll?= Dautheribes <jeremie.dautheribes@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add CMT430B19N00 LCD panel
 support
Message-ID: <20240304-inquisitive-kickass-pronghorn-c641ff@houat>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304160454.96977-4-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mv2k3vttsq537qh6"
Content-Disposition: inline
In-Reply-To: <20240304160454.96977-4-jeremie.dautheribes@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mv2k3vttsq537qh6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 04, 2024 at 05:04:54PM +0100, J=E9r=E9mie Dautheribes wrote:
> Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
> TFT-LCD panel.
>=20
> Signed-off-by: J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 20e3df1c59d4..b940220f56e2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa =3D {
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
>  };
> =20
> +static const struct drm_display_mode cct_cmt430b19n00_mode =3D {
> +	.clock =3D 9000,
> +	.hdisplay =3D 480,
> +	.hsync_start =3D 480 + 43,
> +	.hsync_end =3D 480 + 43 + 8,
> +	.htotal =3D 480 + 43 + 8 + 4,
> +	.vdisplay =3D 272,
> +	.vsync_start =3D 272 + 12,
> +	.vsync_end =3D 272 + 12 + 8,
> +	.vtotal =3D 272 + 12 + 8 + 4,
> +	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};

Your pixel clock doesn't really match the rest of the timings:

(480 + 43 + 8 + 4) * (272 + 12 + 8 + 4) * 60 =3D 9501600

So a ~6% deviation.

What does the datasheet say?

Maxime

--mv2k3vttsq537qh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeX2DQAKCRDj7w1vZxhR
xS9xAQCDGCVsUNv+1hMk/N0uYSfwBKeI3lP8qwJyPKdVGR6VrQEA7qRTva593Qgh
GgGlSkFFwUHITKwZL7fG0K4ESfAOrAY=
=MRSp
-----END PGP SIGNATURE-----

--mv2k3vttsq537qh6--
