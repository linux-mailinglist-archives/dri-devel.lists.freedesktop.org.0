Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2884AC4815
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFB210E3AF;
	Tue, 27 May 2025 06:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="px+5ixoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A79310E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D49C61136;
 Tue, 27 May 2025 06:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1586C4CEEA;
 Tue, 27 May 2025 06:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748326006;
 bh=949plwvuDh0LXblafoGZmQ/UjZsqaCPbRV9YptNbJZg=;
 h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
 b=px+5ixoMOObPn1gjgY3F0Z9bRaiWd0CFRyD7XnyEGWCWSYXLTTL82yN0v9TlHGERB
 eXFfhu9FGpCAEN6Bz4edWRLy8Ozlf7EN+ipMkC8OatIve5c2h08LG3YMMfbGqaKVcP
 hC6Atl5DqAExiq3BW7u5C7RM26y9568VZXWPSSGxisF3PfXBGjvA+c+IMArifeX2OP
 Qt8hslVgHAbWNAb+A+G1BFmpV80FMM1Kn4y8w9v5YCBffPHAIeA8x62H8sSzXF8u/2
 KYb5mM608kaz7EmMJGRWs8BgcmWXU2RIakvi1AwgR0e4Qdw3/0ZB11ro4lY/qkwqQz
 Dd6J9zzh07Vqw==
Content-Type: multipart/signed;
 boundary=b260a079bbf6f987508aa5a40dcc49a946433bd21971dc74e0800c22cc6c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 27 May 2025 08:06:42 +0200
Message-Id: <DA6PUDJXVXL3.1EILFHW8G19E9@kernel.org>
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v8 2/4] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Devarsh Thakkar" <devarsht@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Jayesh Choudhary" <j-choudhary@ti.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "DRI Development List"
 <dri-devel@lists.freedesktop.org>, "Devicetree List"
 <devicetree@vger.kernel.org>, "Linux Kernel List"
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20250525151721.567042-3-aradhya.bhatia@linux.dev>
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

--b260a079bbf6f987508aa5a40dcc49a946433bd21971dc74e0800c22cc6c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Aradhya,

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments AM625 OLDI Transmitter
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +  - Aradhya Bhatia <aradhya.bhatia@linux.dev>
> +
> +description:
> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialize=
d RGB
> +  pixel data transmission between host and flat panel display over LVDS =
(Low
> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to=
-1 data
> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS=
 output
> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RG=
B or
> +  padded and un-padded 18-bit RGB bus formats as input.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: serial clock input for the OLDI transmitters
> +
> +  clock-names:
> +    const: serial
> +
> +  ti,companion-oldi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to companion OLDI transmitter. This property is mandatory =
for the
> +      primarty OLDI TX if the OLDI TXes are expected to work either in d=
ual-lvds

primary

> +      mode or in clone mode. This property should point to the secondary=
 OLDI
> +      TX.

You should mention that the second OLDI should also point back to
the primary OLDI using this property.

> +  ti,secondary-oldi:
> +    type: boolean
> +    description:
> +      Boolean property to mark the OLDI transmitter as the secondary one=
, when the
> +      OLDI hardware is expected to run as a companion HW, in cases of du=
al-lvds
> +      mode or clone mode. The primary OLDI hardware is responsible for a=
ll the
> +      hardware configuration.
> +


> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml

..

> @@ -190,3 +244,105 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        dss1: dss@30200000 {
> +            compatible =3D "ti,am625-dss";
> +            reg =3D <0x00 0x30200000 0x00 0x1000>, /* common */
> +                  <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
> +                  <0x00 0x30206000 0x00 0x1000>, /* vid */
> +                  <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
> +                  <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
> +                  <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
> +                  <0x00 0x3020b000 0x00 0x1000>, /* vp2 */
> +                  <0x00 0x30201000 0x00 0x1000>; /* common1 */
> +            reg-names =3D "common", "vidl1", "vid",
> +                        "ovr1", "ovr2", "vp1", "vp2", "common1";
> +            power-domains =3D <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
> +            clocks =3D        <&k3_clks 186 6>,
> +                            <&vp1_clock>,
> +                            <&k3_clks 186 2>;
> +            clock-names =3D "fck", "vp1", "vp2";
> +            interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +            oldi-transmitters {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                oldi0: oldi@0 {
> +                    reg =3D <0>;
> +                    clocks =3D <&k3_clks 186 0>;
> +                    clock-names =3D "serial";
> +                    ti,companion-oldi =3D <&oldi1>;
> +                    ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +                    ports {
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +                        port@0 {
> +                            reg =3D <0>;
> +                            oldi0_in: endpoint {
> +                                remote-endpoint =3D <&dpi0_out0>;
> +                            };
> +                        };
> +                        port@1 {
> +                            reg =3D <1>;
> +                            oldi0_out: endpoint {
> +                                remote-endpoint =3D <&panel_in0>;
> +                            };
> +                        };
> +                    };
> +                };
> +                oldi1: oldi@1 {
> +                    reg =3D <1>;
> +                    clocks =3D <&k3_clks 186 0>;
> +                    clock-names =3D "serial";

.. and update this example :)

-michael

> +                    ti,secondary-oldi;
> +                    ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +                    ports {
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +                        port@0 {
> +                            reg =3D <0>;
> +                            oldi1_in: endpoint {
> +                                remote-endpoint =3D <&dpi0_out1>;
> +                            };
> +                        };
> +                        port@1 {
> +                            reg =3D <1>;
> +                            oldi1_out: endpoint {
> +                                remote-endpoint =3D <&panel_in1>;
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                port@0 {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +                    reg =3D <0>;
> +                    dpi0_out0: endpoint@0 {
> +                        reg =3D <0>;
> +                        remote-endpoint =3D <&oldi0_in>;
> +                    };
> +                    dpi0_out1: endpoint@1 {
> +                        reg =3D <1>;
> +                        remote-endpoint =3D <&oldi1_in>;
> +                    };
> +                };
> +                port@1 {
> +                    reg =3D <1>;
> +                    dpi1_out: endpoint {
> +                        remote-endpoint =3D <&hdmi_bridge>;
> +                    };
> +                };
> +            };
> +        };
> +    };

--b260a079bbf6f987508aa5a40dcc49a946433bd21971dc74e0800c22cc6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaDVWchIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iJGwGAxRGPDN8iRUtg8G3CHTd8XVfK1W17iIKB
ah6wsakO6qA0866Uwb4kEHxqo8sk+wp+AYDf01M6KL6+J03glezubYBIUzMEdKYH
ZKO8I7IXqBaIiJRTBxP7b/R5OeOR+RKyn1E=
=hOQz
-----END PGP SIGNATURE-----

--b260a079bbf6f987508aa5a40dcc49a946433bd21971dc74e0800c22cc6c--
