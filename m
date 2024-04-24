Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561448B1057
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E8710F759;
	Wed, 24 Apr 2024 16:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HNC8fc1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FE610F759
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:55:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9D3DCE1792;
 Wed, 24 Apr 2024 16:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A43C113CD;
 Wed, 24 Apr 2024 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713977752;
 bh=XcBcA9wSG/hJqeu2uO50hcTfxZb6NSTZgAUm+I1++nY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNC8fc1dGCQBoAHHhdVOJtKeyApmqtVbNNuW6qLJgKphsscgz7l97oYolAN18RgzN
 X8WYFrZzikxmCz7NL0qeaGalJAZ5jQNK8gUgKsn5H1Z3PYEFOalGOnXFrSVIYbSrGX
 kbcf9513A+QXDgxB55zm0Sq15uyVVq7IMsVG3DbJTXPR+ORsYmWbLDmOyq86wT8c6K
 LKHbgYPtYyiGdLIl2qI2lkROy6qlDVj3h/IjId47UQ/iSub4blTTfIaJ5LRalDeVZU
 n5OK0F1Is3nUpC5UmnKHg/vK9oI2wd+ge3ok/OQyqpswlDGW5fs/lNby+JtnNu4c+C
 2nLvliZyH8T1A==
Date: Wed, 24 Apr 2024 17:55:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v3 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
Message-ID: <20240424-spelling-float-9b881cb80992@spud>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pj/RbvYXrqipqoo5"
Content-Disposition: inline
In-Reply-To: <20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com>
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


--Pj/RbvYXrqipqoo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 10:30:04AM +0800, Cong Yang wrote:
> In V1, discussed with Doug and Linus [1], we need break out as separate
> driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
> and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> controller, they have some common CMDS. So add new documentation for
> this panels.

It'd be good to note in the commit message that the 3v3 supply is not
present on these panels, given it was present in the other binding and
not here.

> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aSAZ=
QvdMV95r3zRUw@mail.gmail.com
>=20
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V3:
>=20
> - Update commit message.
>=20
> V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaqin=
=2Ecorp-partner.google.com
>=20
> ---
>  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
>  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax=
,hx83102.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum=
-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl=
6.yaml
> index 906ef62709b8..53fb35f5c9de 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.ya=
ml
> @@ -32,8 +32,6 @@ properties:
>        - innolux,hj110iz-01a
>          # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
>        - starry,2081101qfh032011-53g
> -        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> -      - starry,himax83102-j02
>          # STARRY ili9882t 10.51" WUXGA TFT LCD panel
>        - starry,ili9882t
> =20
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8310=
2.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> new file mode 100644
> index 000000000000..2e0cd6998ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml

Filename matching a compatible please. What you've done here makes it
seem like there's a fallback compatible missing, given this looks like
the LCD panel controller and the starry compatible below is an LCD panel.

> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83102 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> +      - starry,himax83102-j02
> +
> +  reg:
> +    description: the virtual channel number of a DSI peripheral
> +
> +  enable-gpios:
> +    description: a GPIO spec for the enable pin
> +
> +  pp1800-supply:
> +    description: core voltage supply
> +
> +  avdd-supply:
> +    description: phandle of the regulator that provides positive voltage
> +
> +  avee-supply:
> +    description: phandle of the regulator that provides negative voltage
> +
> +  backlight:
> +    description: phandle of the backlight device attached to the panel

I'm not sure why this was given a description when port or rotation
was not.

Otherwise, this looks fine to me.

Cheers,
Conor.

> +
> +  port: true
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pp1800-supply
> +  - avdd-supply
> +  - avee-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        panel@0 {
> +            compatible =3D "starry,himax83102-j02";
> +            reg =3D <0>;
> +            enable-gpios =3D <&pio 45 0>;
> +            avdd-supply =3D <&ppvarn_lcd>;
> +            avee-supply =3D <&ppvarp_lcd>;
> +            pp1800-supply =3D <&pp1800_lcd>;
> +            backlight =3D <&backlight_lcd0>;
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint =3D <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --=20
> 2.25.1
>=20

--Pj/RbvYXrqipqoo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZik5kgAKCRB4tDGHoIJi
0vQEAQCABxeP8C4PVO0oy7rmAnyax20mxLqgK/83cR+wn6PwTQD+MyzcuAspe9+N
QVbJuxD7LhSAFPIPTocJGhAi2aFUpAY=
=uy9b
-----END PGP SIGNATURE-----

--Pj/RbvYXrqipqoo5--
