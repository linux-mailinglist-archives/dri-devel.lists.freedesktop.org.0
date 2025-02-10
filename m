Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF6A2F6CF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CDC10E5E5;
	Mon, 10 Feb 2025 18:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="be1eT55i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA4410E5E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4875FA41EF2;
 Mon, 10 Feb 2025 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A8BC4CED1;
 Mon, 10 Feb 2025 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739211738;
 bh=kW4WlH1HkjqvMNtVdOaqv6Bu3HBYq9GrG/aLmkyGeCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=be1eT55i+UR6ruMjbhjaLYShzWBV7ozYReKlgdefdv/FGyh77+ltMi3kDsqbo/sVF
 eHRVRXaqBUzsfLgIzgOEeKSp6hKXCEOrVSin5J1mkd58bPYgwxnnU+qKyP4sPeMqIf
 tVBEhX6NQHBU8JD/H0/rIZJaX2T6mhwDPsz43JOINFl1GVXwNWJGH9zcJFAQZRC20C
 qnVOrHalrHMtHpuxYxkC6VZ9o7zMhOGGeYftsHslUmYk5whiorSveKLY1PZC/FOPA+
 h0OGLPdtge3ogo82C6Ksqvc6KrUWpWrKHm7mdekN5jTU8J5DPSdCCb5CZwBVoAkPaY
 aVJ7wRqrkyRgg==
Date: Mon, 10 Feb 2025 19:22:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <20250210-vague-fluorescent-toad-c7d1ce@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a3gp6fts62sykw5k"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
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


--a3gp6fts62sykw5k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommend=
ed
> function to get a pointer to the following bridge.
>=20
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
>=20
> However there are drivers supporting the panel subnode description in
> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  8 ++++++++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 2aa17fbe538b86066c4e68f0d0e8046e9ca9b965..b0834b8644284e5f7751cec81=
724af849b4180e7 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1407,6 +1407,36 @@ struct drm_bridge *devm_drm_of_get_bridge(struct d=
evice *dev,
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> =20
> +/**
> + * devm_drm_of_get_bridge_by_node - Return bridge for a given OF node
> + * @dev: device to tie the bridge lifetime to
> + * @bridge_node: device node of the remote bridge
> + *
> + * Given a bridge DT node, returns the associated bridge if any. This
> + * should be used in addition to devm_drm_of_get_bridge() when the regul=
ar
> + * graph link search is not enough, e.g. for drivers that need to support
> + * panels described only as subnodes.
> + *
> + * RETURNS:
> + * A pointer to the bridge if successful, or an error pointer otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
> +						  struct device_node *bridge_node)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	if (!bridge_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	bridge =3D of_drm_find_bridge(bridge_node);
> +	if (!bridge)
> +		return ERR_PTR(-ENODEV);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
> +

A bridge is a KMS-facing structure, there's no reason to tie it to the
lifetime of the device.

Maxime

--a3gp6fts62sykw5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pD1wAKCRAnX84Zoj2+
duqYAYCyFN95MaOSOiHSy48n6f+H3RwjknEahucK0hxM//iGFFhtWemOcArKOv5O
ruChdWsBgMttvepbPSgqHfhHAKiGVSo2oYhJYPPZWeYyVlDWHVRi49u6PZWnEoWZ
iHl0s6SF1A==
=82V5
-----END PGP SIGNATURE-----

--a3gp6fts62sykw5k--
