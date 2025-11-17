Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96057C65F23
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE90410E3F2;
	Mon, 17 Nov 2025 19:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UjIiM7hI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB3C10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:24:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D7AA4456E;
 Mon, 17 Nov 2025 19:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF75AC2BCB3;
 Mon, 17 Nov 2025 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763407488;
 bh=xtiqSnsAY4ywiCLioxymP9tv/WYEi/Go85PcqJsXmq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UjIiM7hIzNMJPp4VAhTX2RWA9enHgG3jM/EMaRIKQ60RgFWc4llVEYrM6PGmalzqR
 W4ZGjjaFB+REtntjrJW5Qqotow5499nTdOzhCiEfNUR4wKNOc5PjZlRb2En24YMVn4
 7TvJNW5o7o+UD4uwBhgqzAyD6I6ufpdr99Pu/4fZ2VTF02jXuUX8nZOe6av5lkrHZ/
 yWo3A5QlgH6J76XnbvV7vT9rNXQLAOqpADi+mm0V9b0VkGfKzXX73fpGBvIiaoEhCJ
 DN7xgTchv4ioEpXASKMPh3NY3gMIiBWkcfz3EW5C6oXxcKQfbG5SS9tgXSTxcFTZgg
 iMJ2CFhw0DRTg==
Date: Mon, 17 Nov 2025 19:24:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Message-ID: <20251117-herbal-absently-c37ba6077679@spud>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-2-bf1a4cf5fa8e@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jJ92fiK/uBFIDD/7"
Content-Disposition: inline
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-2-bf1a4cf5fa8e@solid-run.com>
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


--jJ92fiK/uBFIDD/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 01:28:44PM +0100, Josua Mayer wrote:
> Add missing ref on panel-common.yaml for this dsi panel so that common
> properties can be shared.
>=20
> Drop reset-gpios and backlight as they are already in panel-common.
>=20
> Switch from additionalProperties to unevaluatedProperties so that common
> panel properties are available without repeating them in this binding.
>=20
> Notably panel-common defines the "port" property for linking panels to a
> source - which was missing from this panel. Mark it as required.
>=20
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Forgot my tag I think.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml  | 14 +++++---=
------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d=
30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.ya=
ml
> index 04f86e0cbac91..6940373015833 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -9,6 +9,9 @@ title: Ronbo RB070D30 DSI Display Panel
>  maintainers:
>    - Maxime Ripard <mripard@kernel.org>
> =20
> +allOf:
> +  - $ref: panel-common.yaml#
> +
>  properties:
>    compatible:
>      const: ronbo,rb070d30
> @@ -20,10 +23,6 @@ properties:
>      description: GPIO used for the power pin
>      maxItems: 1
> =20
> -  reset-gpios:
> -    description: GPIO used for the reset pin
> -    maxItems: 1
> -
>    shlr-gpios:
>      description: GPIO used for the shlr pin (horizontal flip)
>      maxItems: 1
> @@ -35,10 +34,6 @@ properties:
>    vcc-lcd-supply:
>      description: Power regulator
> =20
> -  backlight:
> -    description: Backlight used by the panel
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -
>  required:
>    - compatible
>    - power-gpios
> @@ -47,5 +42,6 @@ required:
>    - shlr-gpios
>    - updn-gpios
>    - vcc-lcd-supply
> +  - port
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
>=20
> --=20
> 2.51.0
>=20

--jJ92fiK/uBFIDD/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRt2eAAKCRB4tDGHoIJi
0hrHAQCBaAmVJzC1Z0STWj1jk4/PdSurZ065qolA+crJiZFTBwEA624wDBQFzZga
EVu79ROyCjko8bQ+2VEAS6lgAsh+eQ4=
=Qt2L
-----END PGP SIGNATURE-----

--jJ92fiK/uBFIDD/7--
