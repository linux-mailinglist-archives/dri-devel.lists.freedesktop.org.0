Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A350CFE297
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5D10E5E6;
	Wed,  7 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d+yKW82N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DDA10E5E6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:08:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B773060007;
 Wed,  7 Jan 2026 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9210C4CEF1;
 Wed,  7 Jan 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767794885;
 bh=tixylDIwkfMzESf8/JELPILstX0GopnvIR6u5lHwaKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+yKW82NNNJx2vwiMYS/bjv0OXWpntcMb8wDjG09HZnubqTCbaqj+8kpP90FLjKlZ
 RDxkRBwLEpn+rnHZ/prOfonmw61IcVqCKKa0kFCJA7PQi0zVRjzu1HEA8XQC7t3vf8
 AeUgLYHGtc5ZxJm+m1b12TIuNRSGZFN9sB27rL1MeXdz9zWJDR/3fw0T/NyYqPKYFy
 SMwdLpHO4EFEwusImIAIZkIYBeIhkDzZRyC7ofsTkfJ9C/9ENFdLftj+HMgprXWwWC
 VyxpGtJ8WBNM8CAjpmc64bFSQ2hdxU5ZhZ10rsar79OuzK5b2qoXW//ACFMqHR4eCb
 Pu81Om00rpliA==
Date: Wed, 7 Jan 2026 15:08:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>, 
 benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ljhomylig6poh7z3"
Content-Disposition: inline
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
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


--ljhomylig6poh7z3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0

Hi,

On Wed, Jan 07, 2026 at 02:13:00PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/b=
ridge/imx/imx8qxp-ldb.c
> index 122502968927..6b80d798b27a 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8=
qxp_ldb *imx8qxp_ldb)
>  		goto out;
>  	}
> =20
> -	imx8qxp_ldb->companion =3D of_drm_find_bridge(companion_port);
> +	imx8qxp_ldb->companion =3D of_drm_find_and_get_bridge(companion_port);
>  	if (!imx8qxp_ldb->companion) {
>  		ret =3D -EPROBE_DEFER;
>  		DRM_DEV_DEBUG_DRIVER(dev,
> @@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_device=
 *pdev)
>  	struct ldb *ldb =3D &imx8qxp_ldb->base;
> =20
>  	ldb_remove_bridge_helper(ldb);
> +	drm_bridge_put(imx8qxp_ldb->companion);

the companion bridge is used in pretty much every KMS hook, we need to
put the reference in destroy.

Maxime

--ljhomylig6poh7z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV5ovQAKCRAnX84Zoj2+
dv4yAYC/18PKdVreCA8vF+oCiv+rArQOQdluKaPY7WyntK608MdJYBnbhVlGWFt3
m/w0WAkBgIx7i5jlphIWLhPUgfA0LxoI4W9QLV2N3AymAfzRp7rmhJPGXGDZ03P/
Q3gPy/78sg==
=3oDC
-----END PGP SIGNATURE-----

--ljhomylig6poh7z3--
