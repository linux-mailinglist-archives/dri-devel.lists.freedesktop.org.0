Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B1759B35
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 18:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8573210E4D1;
	Wed, 19 Jul 2023 16:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDF010E4D1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 16:44:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C68C61787;
 Wed, 19 Jul 2023 16:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8C2C433C7;
 Wed, 19 Jul 2023 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689785090;
 bh=GNiOTf7Wsj6iBBrxZOzip07dR5NF7eYzPjywtBjLGr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sU8B0REPY0tu6NeUyQwgtq91tYheBGPdQyqo+fVrEUUfca0pupMNGDi2cMrI4CoRr
 S7s/6+03LrWqT3qCTWoHcHkGfJtNoAGAaB4ck4DyYZ4U3/YS9CFauQbzP+vc1Np3h3
 6fhpSl9ur2yQ35RsPkf8p/WX70qTlc7fgeXEqsBrGVETaIEvQ43hL6cdJ7vw3qr+a/
 8xKFtzj6suiTHryJorIomxa1BUEdfgzh8aG4OsOuNZlLTBG0DXJF1KTTRV2KtmpHPP
 zrgLtTwauqTeLm9YZ/j084WrAeZ4xmVx1e4TFIB5BzU9RsBXQY0J0rSxt3W1hJP/ET
 hfFWq+OcuNsTA==
Date: Wed, 19 Jul 2023 17:44:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <20230719-sizing-ribbon-9e62a4afb5f6@spud>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j+RSuWfJSboaYJOP"
Content-Disposition: inline
In-Reply-To: <20230719152147.355486-2-luca.ceresoli@bootlin.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--j+RSuWfJSboaYJOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Luca,

On Wed, Jul 19, 2023 at 05:21:46PM +0200, Luca Ceresoli wrote:
> Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> 480x800 panel based on it.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  .../display/panel/ilitek,ili9806e.yaml        | 69 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilite=
k,ili9806e.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
06e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.=
yaml
> new file mode 100644
> index 000000000000..42abc6923065
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9806E display panels
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +description:
> +  This binding is for display panels using an Ilitek ILI9806E controller=
 in
> +  SPI mode.

I figure you explicitly mention SPI mode here because it also supports
D{P,S}I?

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          # ShenZhen New Display Co 3.97" 480x800 RGB a-SI TFT LCD
> +          - newdisplay,nds040480800-v3
> +      - const: ilitek,ili9806e
> +
> +  reg: true
> +  spi-max-frequency: true
> +  reset-gpios: true
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +        compatible =3D "gpio-backlight";
> +        gpios =3D <&gpio 22 GPIO_ACTIVE_HIGH>;
> +    };
> +    spi {

Just a nit, a blank line between properties please. Clearly no
respinning needed for that...

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        display@0 {
> +            compatible =3D "newdisplay,nds040480800-v3", "ilitek,ili9806=
e";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <1000000>;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&pinctrl_lcdgpios>;
> +            reset-gpios =3D <&gpio 26 GPIO_ACTIVE_LOW>;
> +            backlight =3D <&backlight>;
> +
> +            port {
> +                ili9806e_in: endpoint {
> +                    remote-endpoint =3D <&lcdif_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aee340630eca..3c38699ee821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6515,6 +6515,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
>  F:	drivers/gpu/drm/tiny/ili9486.c
> =20
> +DRM DRIVER FOR ILITEK ILI9806E PANELS
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> +
>  DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
>  M:	Jagan Teki <jagan@edgeble.ai>
>  S:	Maintained
> --=20
> 2.34.1
>=20

--j+RSuWfJSboaYJOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgS/QAKCRB4tDGHoIJi
0vyvAP46mdHMTAFPovlWwCuGPOePISXPxxu9rgJZZO3CYwVWPQEA+J1Ty9WwUfvI
2Xj6I0WHld8jnPue1q38PYahl9hXTA0=
=7pn7
-----END PGP SIGNATURE-----

--j+RSuWfJSboaYJOP--
