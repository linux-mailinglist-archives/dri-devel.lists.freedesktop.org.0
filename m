Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A4A2F6E0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71410E5E6;
	Mon, 10 Feb 2025 18:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D2evZvDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8663F10E5E6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BC3AA41F64;
 Mon, 10 Feb 2025 18:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF350C4CEEB;
 Mon, 10 Feb 2025 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739211830;
 bh=oYaoNIca/prrl6BbAu9QFMCD9Wkhq7BkULEeqssB7Bs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2evZvDm6o+cP6BrTglQP35ObWhuCuDK/FcZISz+0R5Kf3YzsV9ZAsdZek9eua8k2
 2PI3jfczob2R0shNArMq12gB+zCqAjNLgBEzHZ1xyFT0g00Q1AWp32mKKeAihEVspG
 c5iI09SYNlvyLtCZjQdkPMKlu2/jEqr+SZc+JkVt/ESIyIUmZRj/hS8a4E0qm16dpH
 MjhhFZNZp/ZOawzjKiEFvhP9vnD0rQG94ni4b+ou9Nu2X7M6kNZanCQ1VIjxEgPgG9
 GlmDfmt4VT3wRLIyHI51b4Ml7/jZ+WaMFdEw/l2R8kTWOSSKkjFxt3sr9UP+Zd0T0S
 1fXHpKEEkW8kg==
Date: Mon, 10 Feb 2025 19:23:47 +0100
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
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <20250210-bronze-copperhead-of-faith-12d0a9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="etdpmgzxb265ivsl"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
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


--etdpmgzxb265ivsl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates co=
de
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
>=20
> Note there are two slight changes in the new logic intended to improve the
> final result:
>=20
>  * the old code looks for a subnode with any name except "port" or "ports=
",
>    while the new code uses the node passed as a parameter
>=20
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
>=20
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
>=20
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>=20
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------=
------
>  1 file changed, 9 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6=
e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_d=
si_host *host,
>  	const struct samsung_dsim_plat_data *pdata =3D dsi->plat_data;
>  	struct device *dev =3D dsi->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
> =20
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */
> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge =3D devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) !=3D -EPROBE_DEFER)
> +		out_bridge =3D devm_drm_of_get_bridge_by_node(dev, device->dev.of_node=
);
> =20

For the same reason I mentioned earlier, this is inherently unsafe if
the bridge device goes away but the DRM device doesn't.

Maxime

--etdpmgzxb265ivsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pEMwAKCRAnX84Zoj2+
doYqAX0ZaluJTI4PSfPTqVMOAG5TZK+XUyRofxt6QFR9rI9Q4sU0nkYYSkhQYgjF
pn8pQS0BgNQjNe0c2Ynpkp6HpXjapBAAkIo35EtMoD45WFYl09nft0+VjWBNwrN4
vaCFaeigwA==
=lqhs
-----END PGP SIGNATURE-----

--etdpmgzxb265ivsl--
