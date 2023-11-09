Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2662E7E7119
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 19:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79910E0F2;
	Thu,  9 Nov 2023 18:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F6010E0E9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 18:04:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9839B609D1;
 Thu,  9 Nov 2023 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9222C433C8;
 Thu,  9 Nov 2023 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699553080;
 bh=Z9CrFEFmEnOL/3Q5XW+qZ/CdeY8ktvSVkXjM1v0v9Bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVkWWZLA7o6syfN/8ixVI8y7Kdr61lfB5UBV5DieWn5k8XcuuWkgPoxb3EdxBWnDP
 DfI6QayvLB5LE3pbUCN79+3wROAQQ3mEo3tjiBMDAgoWvrKzNTnNXATQM1SKhGLdYd
 UfsTP3tfcL9x7DB4q2zaAHlAcAx0pLoeelZd7uFt0XTtiU/Y5mWg8NdbEb++epj1XT
 9u/1OVbyyPtXYFlftLsmDkuGEf0poTDvOU4QmBe+4k4d/g40Ejn6n2kflZkWzK1LCI
 cIGkoTTZr7D7XB6WsRiR+5of7ldK4F6ZdYNsclZyoN9QxOM9qcexPEYaJtIlL8Gk2K
 eE/N+uPZoigng==
Date: Thu, 9 Nov 2023 18:04:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231109-sterility-unsoiled-e43771c61894@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tjSRnZL12xJ4z8LE"
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
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


--tjSRnZL12xJ4z8LE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and =
is
> documented as a subnode of a simple-mfd, drop the invalid reg property.

I'd expect a note here tbh about how removing reg & relying on being a
subnode of the simple-mfd is safe to do. It looks like your driver
was added at the same time as this binding & it was always documented as
being a child of the simple-mfd system controller, so I'd kinda expect
to see a Fixes tag on this patch..

Am I missing something?

>=20
> Also drop the unnecessary example, the top level bindings example should
> be enough.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------=
------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy=
-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy=
-analog.yaml
> index c8c83acfb871..81c2654b7e57 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog=
=2Eyaml
> @@ -16,20 +16,8 @@ properties:
>    "#phy-cells":
>      const: 0
> =20
> -  reg:
> -    maxItems: 1
> -
>  required:
>    - compatible
> -  - reg
>    - "#phy-cells"
> =20
>  additionalProperties: false
> -
> -examples:
> -  - |
> -    phy@0 {
> -          compatible =3D "amlogic,g12a-mipi-dphy-analog";
> -          reg =3D <0x0 0xc>;
> -          #phy-cells =3D <0>;
> -    };
>=20
> --=20
> 2.34.1
>=20

--tjSRnZL12xJ4z8LE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0fMgAKCRB4tDGHoIJi
0iggAQCV2/5BcIW31u6mySyU3aLEob1O1ciipaTd/rc/GvNlSAEAoFfFfmam/hxu
pqXvBa9dJuXqDDyhraCQHOmyFKSHugs=
=tBb3
-----END PGP SIGNATURE-----

--tjSRnZL12xJ4z8LE--
