Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5FC513366
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855F310E2B9;
	Thu, 28 Apr 2022 12:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11B10E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:14:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D77FF5C012B;
 Thu, 28 Apr 2022 08:14:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Apr 2022 08:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651148060; x=1651234460; bh=BuvGzV88SC
 mh1JFEdrv7+gxKbeg4HVTmRcYTbtYYKR0=; b=OvUiA324eN4kWPK0Pel/N6L4Gw
 VGeFuxFV65atQJ0bCJPJIwr4Pa7joTXptvJhz6lNdkRjORgFZKeaS+kl1Mxm+TlO
 lAUYfYt0orEgwSPRiKGO6Xkr6e5JyH+Pcii4NlFHJg5P/DuLKdOJ4FoS/4Fi7dzR
 zTR5veXo++UOqSWKjEeFgIOBN1rfA21Am+0EwIyEyRfipzOp6svGj5uZpS84tD+3
 YXZI1Sg/WeDDHDyC57vDUNy2h7Sgi06e0KZbbo4gesqlJd4dBaop1zRIkr9sBIQw
 BUNQcQH10JG1l29mHKhpRyp2eGrFDJXiZE1yj4MglaNiF6JjbVtbpzyYUwBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651148060; x=
 1651234460; bh=BuvGzV88SCmh1JFEdrv7+gxKbeg4HVTmRcYTbtYYKR0=; b=Z
 3Coe7BOTXgdcwRHxVQZcd796M5GEGKx0pMDHQPEc31MnGDLbu1oleTYzEEwZhw5V
 jpREeQE3+QSOEoyM1ZHnlFLTy7BUBPItvjfHl/q0Uz+MMNtndSYnp7YkDqf10PjN
 rb00FWJyjIopLH/RlJ5BSGCXf9vZvfjGgMXMGPqw+jssfJPQjaTbmJhoM/rFTZp6
 mMiiCKjQfRX7jLFwXbBdVvIH1beBJvR7+yu8jwp644vr93TudlN8CiaPPZ5gVksT
 XLG8sn8YjD+51zdhDcS0sHoHO7S2cV+10z8oxgM/VU6e4OKFXfp4sK+X977Ip5x2
 gSJ307j+Uce0RBtc24ixQ==
X-ME-Sender: <xms:HIVqYuLVmxPJLTS3qrjP_qX9JDZuQWQP2jpEXfV8Pkx4ZHmXqwyWdQ>
 <xme:HIVqYmI50csnmxTeztRV-EeEr_ry7aswwqa8PF2PCIEp_ywJhnRUM88VyPrebK2Oe
 h37yAz2R_IUdWq_P4A>
X-ME-Received: <xmr:HIVqYuvSW5uZNDzXuCR_XP6wYIzuQT_CAnGOueJQZfs-TRsTUcD9b0D8JsL_E1GA0qSY-KNJgHYty01l8Z1xKKxw3VlvAOZlqHz0qQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HIVqYjZcHyWi1Qc5_AB_yivaD51rmRl6dzUEhdHqPlINT4csAK5wEA>
 <xmx:HIVqYlaLPg0TEwT4sbpzst4m2qNGeP772qFc7DO9x5rrLqYjUL-B_w>
 <xmx:HIVqYvAz_1xQChC4qfnqaES_-hmF8fh7oXS3dMwrdVxzUIo2PFGx_Q>
 <xmx:HIVqYkW-XLuQ4utsGUmv6N1fIHWMi7P-xWYHpoNT7s8ZILSKYqv8Lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 08:14:19 -0400 (EDT)
Date: Thu, 28 Apr 2022 14:14:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm: exynos: dsi: Use child panel or bridge find helpers
Message-ID: <20220428121417.74guaowmzrh7pc2f@houat>
References: <20220428094808.782938-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bxqf4eu4sf3wkxie"
Content-Disposition: inline
In-Reply-To: <20220428094808.782938-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bxqf4eu4sf3wkxie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 03:18:08PM +0530, Jagan Teki wrote:
> commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
> added devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
>=20
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge which eventually failed to find the DSI
> devices in exynos drm dsi driver.
>=20
> So, use the conventional child panel bridge lookup helpers like it
> does before.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index f067c86b0b12..ec673223d6b7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -1451,9 +1452,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_=
host *host,
>  	struct device *dev =3D dsi->dev;
>  	struct drm_encoder *encoder =3D &dsi->encoder;
>  	struct drm_device *drm =3D encoder->dev;
> +	struct drm_panel *panel;
>  	int ret;
> =20
> -	dsi->out_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	panel =3D of_drm_find_panel(device->dev.of_node);
> +	if (!IS_ERR(panel)) {
> +		dsi->out_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +	} else {
> +		dsi->out_bridge =3D of_drm_find_bridge(device->dev.of_node);
> +		if (!dsi->out_bridge)
> +			dsi->out_bridge =3D ERR_PTR(-EINVAL);
> +	}
> +

We should just revert 711c7adc4687 entirely (and make it very explicit
in the commit log). The out_bridge lifetime is completely screwed-up in
that patch now. If there's a panel it will be managed, but it's not if
there's a bridge.

Maxime

--bxqf4eu4sf3wkxie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmqFGQAKCRDj7w1vZxhR
xeOZAQC4mSLIsmmR1XPywwTzczr2htIO3YhcmsM6Lp5uA2Bg/AEA40Joh0qR3g7y
2fwdr9kzbD0rXuZ67316kBlqIGNDOQU=
=QLoJ
-----END PGP SIGNATURE-----

--bxqf4eu4sf3wkxie--
