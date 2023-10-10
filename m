Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F37C01A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883AE10E3C0;
	Tue, 10 Oct 2023 16:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C003810E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:31:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3A28FCE1F54;
 Tue, 10 Oct 2023 16:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2458C433C8;
 Tue, 10 Oct 2023 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696955513;
 bh=k1lL82diLHKw/+zq5O/inoSt62xLZXJ0W/quVztpAvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+eny5t4ZV3vWX1uJnUkUFGY8jS4yRaRAZXsfRHHAmuaZpnvPddE31NAuMh70OKV2
 2OXMzFryotIDqpR7jYrPqo+MlmO8TsHuIJSfveUtnKubzlT5FpEdn9DaUgf/3J5aur
 0P7qFCNIOOR0x0XOUqJaqUXQehvGJmZxhbIo247FhBRJ79aEUtZYokeHo3q6Vd6RQr
 olRk9wKLy/404rQDql05auPtaqnYOI1wGNQuIEKw5nU+S1hi4//XWkWGaX3lSBg4/R
 qNBoKwhVXH6vP29vlPKVy+/EkIYqtE3ygWvnlLCUKcvrKupQ0W/Nu4KztezrJco0lC
 DweL500swo/eA==
Date: Tue, 10 Oct 2023 17:31:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
Message-ID: <20231010-headache-hazard-834a3338c473@spud>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-9-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nZTzSzTENfYlYUCo"
Content-Disposition: inline
In-Reply-To: <20231009183522.543918-9-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nZTzSzTENfYlYUCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Oct 09, 2023 at 08:34:22PM +0200, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the Solomon
> SSD132x family of controllers.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  .../bindings/display/solomon,ssd132x.yaml     | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
132x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> new file mode 100644
> index 000000000000..b64904703a3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD132x OLED Controllers
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - solomon,ssd1322
> +          - solomon,ssd1325
> +          - solomon,ssd1327

You don't need the oneOf here here as there is only the enum as a
possible item.
I didn't get anything else in the series, I have to ask - are these
controllers not compatible with eachother?

> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  # Only required for SPI
> +  dc-gpios:
> +    description:
> +      GPIO connected to the controller's D/C# (Data/Command) pin,
> +      that is needed for 4-wire SPI to tell the controller if the
> +      data sent is for a command register or the display data RAM
> +    maxItems: 1
> +
> +  solomon,height:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Height in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.

You probably know better than me, operating in drm stuff, but are there
really no generic properties for the weidth/height of a display?

> +
> +  solomon,width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: solomon,ssd1322
> +    then:
> +      properties:
> +        width:
> +          default: 480
> +        height:
> +          default: 128
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: solomon,ssd1325
> +    then:
> +      properties:
> +        width:
> +          default: 128
> +        height:
> +          default: 80
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: solomon,ssd1327
> +    then:
> +      properties:
> +        width:
> +          default: 128
> +        height:
> +          default: 128

Unless you did it like this for clarity, 2 of these have the same
default width and 2 have the same default height. You could cut this
down to a pair of if/then/else on that basis AFAICT.
:wq

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            ssd1327_i2c: oled@3c {

This label is unused as far as I can tell. Ditto below.

Cheers,
Conor.

> +                    compatible =3D "solomon,ssd1327";
> +                    reg =3D <0x3c>;
> +                    reset-gpios =3D <&gpio2 7>;
> +            };
> +
> +    };
> +  - |
> +    spi {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            ssd1327_spi: oled@0 {
> +                    compatible =3D "solomon,ssd1327";
> +                    reg =3D <0x0>;
> +                    reset-gpios =3D <&gpio2 7>;
> +                    dc-gpios =3D <&gpio2 8>;
> +                    spi-max-frequency =3D <10000000>;
> +            };
> +    };
> --=20
> 2.41.0
>=20
>=20

--nZTzSzTENfYlYUCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSV8dAAKCRB4tDGHoIJi
0lOVAQCYh5XfAhpN2Ub0NBL13m3+H+VbFHZ4v6rRMM5HC7VcRwEA+j1MKNddmHvS
3nuSUc3lsv02CCEFfKljwpslWizh0As=
=4zyv
-----END PGP SIGNATURE-----

--nZTzSzTENfYlYUCo--
