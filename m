Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F5D01891
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1760110E69F;
	Thu,  8 Jan 2026 08:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tHqoozos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD910E69F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 08A6260018;
 Thu,  8 Jan 2026 08:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B194C116C6;
 Thu,  8 Jan 2026 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767860063;
 bh=EtgY9/EVerR2uZrY6KJZ9kC/J3pcc8Nhql32Ojqiwoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tHqoozosIU8cDsP3+u6sm7M0ubuyctf0AYxcP9tphpkxQtszmGR7Tg17mXOu03IL2
 5nE2xfP7ZngJKsk0roxvBy7ppI3AUirOVgrZRG1hBQqNUWdH68Hkc4LYn2ubn6nhyO
 4d+c1Pr4G6j1g11+1SwUxX88gSsDBpF9cLBFfMUKZP44qVneUREuzNvNJIQhg8I4Q2
 QSsC9OLAiALxNZ+F4RzEU8bYT6L5r51/UGmL2LyvYamiGMbAlXF152repnzP2Bykxu
 47F+86tI1TQs64ivMCACn1iMGLTqq738E4D+F+QPUKYPMlwsKZawN0m91It/QgdPtv
 SsUnWqFgi2pmA==
Date: Thu, 8 Jan 2026 09:14:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260108-acoustic-groovy-shark-1c6850@houat>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="iaxf263ybcspakt7"
Content-Disposition: inline
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
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


--iaxf263ybcspakt7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0

On Wed, Jan 07, 2026 at 05:22:03PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Why can't we use next_bridge for this one?

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index 01813e11e6c6..bfcf2fa62fe1 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *hd=
ata)
>  		return -EINVAL;
>  	}
> =20
> -	hdata->bridge =3D of_drm_find_bridge(np);
> +	hdata->bridge =3D of_drm_find_and_get_bridge(np);
>  	of_node_put(np);
> =20
>  	if (!hdata->bridge)
> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pde=
v)
> =20
>  	put_device(&hdata->ddc_adpt->dev);
> =20
> +	drm_bridge_put(hdata->bridge);
> +
>  	mutex_destroy(&hdata->mutex);
>  }

Same story than in your part 2 series, it should be dropped in destroy.

Maxime

--iaxf263ybcspakt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV9nXAAKCRAnX84Zoj2+
dpQcAX4/DsMYcVghXzTl1wL4Eg875nz8oa8QzS5rCmiMvWyUXZDs9jjE+v4NJH9l
XfmGlK0Bfij85bzMX8N3NHOZ0ga+3CVx6+FxmlxB26/EafiT6qVke+EY/dh8z5mV
6ouR1XkHOQ==
=Htm4
-----END PGP SIGNATURE-----

--iaxf263ybcspakt7--
