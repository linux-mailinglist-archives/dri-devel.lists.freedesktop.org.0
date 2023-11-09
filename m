Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A914D7E70CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87810E490;
	Thu,  9 Nov 2023 17:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F7910E490
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:51:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8834AB82173;
 Thu,  9 Nov 2023 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0B4C433C7;
 Thu,  9 Nov 2023 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699552257;
 bh=GB1syrHkrGKsmiS0BjcotABnBGuB2ElN3V85GZw/kAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ToCXT+f0/7z3BZkle4LwTFuKxK3lAXNYtMhvN8zhbG2gkF7h4SBB/igmwG0P+Zvo2
 NmuS/Eg86zaZ6ucHSUi94mNjOVQMxv6vRV7mSbR5Nu2xBvVt+kOOadEY1MeJi2R5eX
 gm/vUCHta0V+Aw72M3C1IBCFGONx0v4m5jQ9enBcpbJJu7jdsg0lKCj1pkr1bIN56H
 XlOOpDuFV4fAm1/T95n+hJTQNX4BnHUyad1pDELC+KMD+BzhteYuURCIzoLPGIax5q
 24ToC2MuXIi88cVPWmXu7EuLB2aftW1hVxXBE5zrsHGWQoYmx0ds30NK2pSkEsnp1Z
 O5bKwljiIwPLw==
Date: Thu, 9 Nov 2023 17:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
Message-ID: <20231109-unsalted-daredevil-4052fa57fd2c@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E5Nn4IFoyvxjicc1"
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--E5Nn4IFoyvxjicc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:04AM +0100, Neil Armstrong wrote:
> Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, d=
rop the now
> useless description about the parent node and also drop the unnecessary e=
xample.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
COnor.

> ---
>  .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------=
------
>  1 file changed, 17 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi=
-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg=
-mipi-pcie-analog.yaml
> index 009a39808318..70def36e5688 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> @@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
>  maintainers:
>    - Remi Pommarel <repk@triplefau.lt>
> =20
> -description: |+
> -  The Everything-Else Power Domains node should be the child of a syscon
> -  node with the required property:
> -
> -  - compatible: Should be the following:
> -                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
> -
> -  Refer to the bindings described in
> -  Documentation/devicetree/bindings/mfd/syscon.yaml
> -
>  properties:
>    compatible:
>      const: amlogic,axg-mipi-pcie-analog-phy
> @@ -31,10 +21,3 @@ required:
>    - "#phy-cells"
> =20
>  additionalProperties: false
> -
> -examples:
> -  - |
> -    mpphy: phy {
> -          compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
> -          #phy-cells =3D <0>;
> -    };
>=20
> --=20
> 2.34.1
>=20

--E5Nn4IFoyvxjicc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0b+wAKCRB4tDGHoIJi
0llMAQDSiyi01Tk6EfsjuzI7TW2RZ9q3lS642vkuNdyv7Vl74QEAi50xLev+LeZV
0XXHkOzNdlCx7iH9hujdrheVevi6VwY=
=NFGG
-----END PGP SIGNATURE-----

--E5Nn4IFoyvxjicc1--
