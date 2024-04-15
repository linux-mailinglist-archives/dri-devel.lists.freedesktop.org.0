Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D398A589F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 19:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175B711271E;
	Mon, 15 Apr 2024 17:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C753SYye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4777B112720
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 17:07:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 948CF60F03;
 Mon, 15 Apr 2024 17:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F68C113CC;
 Mon, 15 Apr 2024 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713200829;
 bh=FOsS3Rqk88ldzlT96VMVnmS+dPPkpqirhwk6Fw5Yn5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C753SYyeQDwc2ojdR7attJ5/xEhfc/W0AV1zpqzVThMMxtq+s8KsfpxtWH91J7f/A
 IAr/sVVCi45hOea7W1ial9TQqus6DBfOMp1MlCd/EGq7hbNA3HW0BVKdSCgGWB4kHC
 4x0oJmrj9sBIDM+FWUvV8/SApcFGPGEu7b9jOXYMexasX0IU3JwaIEIOGWe9Ud8+U/
 Z3zyWTNdIp3FV2gY9+n7w4Srns+ZQjdi3QE/hE7B+yHP4sa6uLAdr/1qukeBSmVHeu
 k1dLL0vdM+3Wy/pCkb99SH9/VwmiXl4q81VB1WAFjdCfTSsvgs+FsAsv3HKgsm5Qq4
 piio5Ei5FEScg==
Date: Mon, 15 Apr 2024 18:07:03 +0100
From: Conor Dooley <conor@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Raydium RM69380
Message-ID: <20240415-basically-laboring-3a5fde2027ef@spud>
References: <20240415-raydium-rm69380-driver-v2-0-524216461306@mainlining.org>
 <20240415-raydium-rm69380-driver-v2-1-524216461306@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0GLNjRxLWL3JBgc2"
Content-Disposition: inline
In-Reply-To: <20240415-raydium-rm69380-driver-v2-1-524216461306@mainlining.org>
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


--0GLNjRxLWL3JBgc2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 06:10:41PM +0200, David Wronek wrote:
> Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
> Add a dt-binding for it.
>=20
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
>  .../bindings/display/panel/raydium,rm69380.yaml    | 91 ++++++++++++++++=
++++++
>  1 file changed, 91 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69=
380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.=
yaml
> new file mode 100644
> index 000000000000..0ac7d033cbe0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raydium RM6380-based DSI display panels
> +
> +maintainers:
> +  - David Wronek <david@mainlining.org>
> +
> +description:
> +  The Raydium RM69380 is a generic DSI panel IC used to control
> +  OLED panels.
> +
> +allOf:
> +  - $ref: panel-common-dual.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lenovo,j716f-edo-rm69380
> +      - const: raydium,rm69380
> +    description: This indicates the panel manufacturer of the panel
> +      that is in turn using the RM69380 panel driver. The compatible
> +      string determines how the RM69380 panel driver shall be configured
> +      to work with the indicated panel. The raydium,rm69380 compatible s=
hall
> +      always be provided as a fallback.
> +
> +  avdd-supply:
> +    description: Analog voltage rail
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be active =
low
> +
> +  ports: true
> +  reg: true

Where is reg defined? I briefly checked the two panel-common bindings
and didn't see it.

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vddio-supply
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "lenovo,j716f-edo-rm69380", "raydium,rm69380";
> +            reg =3D <0>;
> +
> +            avdd-supply =3D <&panel_avdd_regulator>;
> +            vddio-supply =3D <&vreg_l14a>;
> +            reset-gpios =3D <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +                    panel_in_0: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    panel_in_1: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
>=20
> --=20
> 2.44.0
>=20

--0GLNjRxLWL3JBgc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1etwAKCRB4tDGHoIJi
0mHkAQDH2xKYkE4R7Ku+Y0Z6OrwT1OLZWwQTMHQ67JzNr6FllgD/W2C7opnNMcD7
rf8AECa0OELVhjuuAVTl3UtDPCqW0gE=
=+guv
-----END PGP SIGNATURE-----

--0GLNjRxLWL3JBgc2--
