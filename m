Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF318CEA2B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 21:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BFF10EA90;
	Fri, 24 May 2024 19:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bd+MzVyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DB110EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 19:10:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DE6362818;
 Fri, 24 May 2024 19:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE6AC2BBFC;
 Fri, 24 May 2024 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716577820;
 bh=qRfM4TU7sRQJ/7eeA6XN0y8uQdtXege7cNrMTDXXWso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bd+MzVyGeSBmeWqjwO4x7j6KpuGsANl+9m8m1Emwh/XdOKy4QSutbnOlTvsgznLWt
 QdfVw1cqaiuHXyGtLueE7PuqP2diE2W/4UgXTKG60OV+MrOyaFMZ5AGMv+ooVhgiMf
 11ObI3ROLz0n/MLRyQdiEgHHW/iuFXnr5LYf4LKyroDrVMwuEkqwL6MEiovPPfq8MW
 GWi/ayO90Y+WQ39y0B/dAf3PNjoSPfMDVsr7TlWOX2VKE6Bej+osCto258/GvV1uhb
 qunoYYecIcsCoj1QIcPv5y9tlqGN2X/WQCog6+RS2fYAs/TGrJxLSL3YuKvNgE8mMO
 7eX75PvJm9Iag==
Date: Fri, 24 May 2024 20:10:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240524-purveyor-outlying-5201f700a56e@spud>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pLrOJBoAnsXYyrmH"
Content-Disposition: inline
In-Reply-To: <20240524103506.187277-2-ryan@testtoast.com>
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


--pLrOJBoAnsXYyrmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 10:33:13PM +1200, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM, used in a number of handheld gaming devices made by Anbernic.
>=20
> Add a device tree binding for the panel.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../bindings/display/panel/wl-355608-a8.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/wl-35=
5608-a8.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/wl-355608-a8=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
> new file mode 100644
> index 000000000..af12303e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/wl-355608-a8.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WL-355608-A8 3.5" (640x480 pixels) 24-bit IPS LCD panel
> +
> +maintainers:
> +  - Ryan Walklin <ryan@testtoast.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: wl-355608-a8

You're missing a vendor prefix here. And when you add it, update the
filename to match.

> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-3wire: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +

> +    spi_lcd: spi {
> +        compatible =3D "spi-gpio";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sck-gpios =3D <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
> +        mosi-gpios =3D <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
> +        cs-gpios =3D <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
> +        num-chipselects =3D <1>;

All of this is not needed in the example, all you need to have here is:

spi {
    #address-cells =3D <1>;
    #size-cells =3D <0>;

> +
> +        panel: panel@0 {

This "panel" label is not used, you should drop it.

> +            compatible =3D "wl_355608_a8";

This doesn't match what you documented, be sure to run dt_binding_check.

> +            reg =3D <0>;
> +
> +            spi-3wire;
> +            spi-max-frequency =3D <3125000>;
> +
> +            reset-gpios =3D <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
> +
> +            backlight =3D <&backlight>;
> +            power-supply =3D <&reg_lcd>;
> +            pinctrl-0 =3D <&lcd0_rgb888_pins>;
> +            pinctrl-names =3D "default";
> +
> +            port {
> +            	panel_in_rgb: endpoint {

Neither is this label afaict.

Thanks,
Conor.

> +                    remote-endpoint =3D <&tcon_lcd0_out_lcd>;
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.45.1
>=20

--pLrOJBoAnsXYyrmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDmFwAKCRB4tDGHoIJi
0sJlAPsHIXJ5RW+GGQGLu1zyH7U8LPyVW3Yh9QRjxnQie6ur3gEAzLG3B8OasbR3
qS9DRp/1m6iEAvWbi+M9HxIMetDHbwk=
=qrd6
-----END PGP SIGNATURE-----

--pLrOJBoAnsXYyrmH--
