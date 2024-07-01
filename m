Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0391DBFD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 12:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181C10E387;
	Mon,  1 Jul 2024 10:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FwpS5InK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7934D10E387
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 10:03:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B10E661204;
 Mon,  1 Jul 2024 10:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FB5C116B1;
 Mon,  1 Jul 2024 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719828188;
 bh=rj2CuGZSuorKkqrmqjXwI7PvtbVRpe9ajyOq8suI5Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwpS5InKB0WHeJvDl00B4mDyVpgtWRPch13ta7HsTvTyk2qU9CAm4ahmD+wsEctHc
 MYCrGVTnrBjo6jvt5GBxaYTB8FxHv2menHZexYacTgYMG0C30VswIdbnWpOZXlztTt
 OjJMVYyPKMojWhQ9TYdzm6UgIXkrrfyfGqTtDugOOatUeh4SBaU8qxzDDxX4L42Pnt
 98wTdukcSrqmbqnb6HUV5DX3aayTslixUC5ntsCv8Zos0pLeELIO1eytxsJakjk/Zs
 E4C/MMklfw5skb2y++k8fvOSz/31hK7nhwNQK6IAM8iTnJREQpK3R8arWmCXukuPdC
 4l53aEE/qNQBg==
Date: Mon, 1 Jul 2024 11:03:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: megi@xff.cz, javierm@redhat.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Message-ID: <20240701-preset-shredding-409ef0d80ca4@spud>
References: <20240701085837.50855-1-manikandan.m@microchip.com>
 <20240701085837.50855-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zEW7h/lfGlnSjTL0"
Content-Disposition: inline
In-Reply-To: <20240701085837.50855-2-manikandan.m@microchip.com>
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


--zEW7h/lfGlnSjTL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 02:28:35PM +0530, Manikandan Muralidharan wrote:
> Add compatible string for the Microchip's AC40T08A MIPI Display
> panel.This panel uses a Himax HX8394 display controller.
> The reset line is not populated and leads to driver probe issues,
> thus add conditional block to narrow reset-gpio property per variant.

I really should have asked on v1, but I wasn't sure whether or not the
optional nature of the reset-gpios was specific to your new panel so I
held off: Is it ever the case that a reset-gpio can be provided for this
microchip panel, or just not in the configuration you tested? If it is
never possible, then I'd probably do...

>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - re-order compatible string alphabetically.
> - Add conditional block to narrow reset-gpio property from required
> list based on compatible string check
> ---
>  .../bindings/display/panel/himax,hx8394.yaml    | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 644387e4fb6f..75ccabff308b 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -15,14 +15,12 @@ description:
>    such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
>    a MIPI-DSI video interface.
> =20
> -allOf:
> -  - $ref: panel-common.yaml#
> -
>  properties:
>    compatible:
>      items:
>        - enum:
>            - hannstar,hsd060bhw4
> +          - microchip,ac40t08a-mipi-panel
>            - powkiddy,x55-panel
>        - const: himax,hx8394
> =20
> @@ -46,7 +44,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reset-gpios
>    - backlight
>    - port
>    - vcc-supply
> @@ -54,6 +51,18 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            enum:
> +              - microchip,ac40t08a-mipi-panel
> +    then:
> +      required:
> +        - reset-gpios

  - if:
      properties:
        compatible:
          const: microchip,ac40t08a-mipi-panel
    then:
      properties:
        reset-gpios: false
    else:
      required:
        - reset-gpios

Otherwise, what you have is fine.

Cheers,
Conor.

>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> --=20
> 2.25.1
>=20

--zEW7h/lfGlnSjTL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoJ+1gAKCRB4tDGHoIJi
0tMwAP0RreznrdGTlsp+/TMrTBH1CLFSfccb6TiXVFKsF//otwD+L5S9KraEH2JJ
IwJ5jYCHglQ2NnWI9qvTDAwHlg3zYgw=
=TrUD
-----END PGP SIGNATURE-----

--zEW7h/lfGlnSjTL0--
