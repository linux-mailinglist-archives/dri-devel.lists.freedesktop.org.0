Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB897FA7CA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 18:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F8910E067;
	Mon, 27 Nov 2023 17:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1395610E067
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:14:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D0569B836CD;
 Mon, 27 Nov 2023 17:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BE1C433C7;
 Mon, 27 Nov 2023 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701105284;
 bh=94eA5a3oVs1VTguMTV9OICnFtDjCrfp2/1bumD9OBZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fa/wQuX929+5dckPfYpUstS/A0PYi6ycn5TAH8wdbjF3R0MA8NWtU2JDzQKolgyvt
 LIdAMaLbIwy2Zu22qZ4AiKrl8xoGIPudfiWX3PEkYFK+QtJlKtkfzTYluMf0QWdGOV
 rRTYnLkT4j+kxALg0gAOSgRNdV+e0XLBSwO3fFds8seHEL31R3+4wLr/nnS1QEkDFF
 EnLkTCojnQeygYnmU1SUSfHV50HWG3zRY+jFN0sYWexHhR1217i5PnnTN5KT3Urdo4
 Ua+TSAMOSCqB4LApFdAHQX6MJDa5+Mr46b8GfdKndENulAzNbrtsz1vXe+k9m+NNO1
 1ybXs76rFt0fA==
Date: Mon, 27 Nov 2023 17:14:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Roland Hieber <rhi@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: samsung-dsim: Add
 i.MX7D support
Message-ID: <20231127-sessions-publisher-d15b28966646@spud>
References: <20231127-b4-imx7-mipi-dsi-v1-0-7d22eee70c67@pengutronix.de>
 <20231127-b4-imx7-mipi-dsi-v1-1-7d22eee70c67@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eEkdIYeTY4jIHAux"
Content-Disposition: inline
In-Reply-To: <20231127-b4-imx7-mipi-dsi-v1-1-7d22eee70c67@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eEkdIYeTY4jIHAux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 05:12:28PM +0100, Roland Hieber wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Add support for the "fsl,imx7d-mipi-dsim" compatible used on i.MX7D.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml         | =
4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 4ed7a799ba26..e43fec560941 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -27,7 +27,9 @@ properties:
>            - fsl,imx8mm-mipi-dsim
>            - fsl,imx8mp-mipi-dsim
>        - items:
> -          - const: fsl,imx8mn-mipi-dsim
> +          - enum:
> +              - fsl,imx7d-mipi-dsim
> +              - fsl,imx8mn-mipi-dsim
>            - const: fsl,imx8mm-mipi-dsim
> =20
>    reg:
>=20
> --=20
> 2.39.2
>=20

--eEkdIYeTY4jIHAux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWTOfAAKCRB4tDGHoIJi
0gR3AQC/uU0C6yQnjFTOi3VAkiumHD8Z665Xqv9I+8g62eUrFgEAyZ2kzmH3FFHh
D1CWuyb+hcb2UhlGWyV3b4HuLNpq8QQ=
=ysHQ
-----END PGP SIGNATURE-----

--eEkdIYeTY4jIHAux--
