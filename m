Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825F856AF0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5361610E5B9;
	Thu, 15 Feb 2024 17:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Emff3pkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432CE10EA0F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:26:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45C9461DE9;
 Thu, 15 Feb 2024 17:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72583C433C7;
 Thu, 15 Feb 2024 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708017989;
 bh=eSq19Hx9R3mJB4qxGio917FATDQAO4ZEh4JWZW2Mwcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Emff3pkv9SMwmr52IwT3QfZi8fKIdBD5hhfK9jDgUY0Xykumd+Hw8LHlyZvF644tZ
 Wh+kitCoR8zbNcriaHGLEUuHQ4F0uG2i2Pxa44S+DkojGiZ4SECBwbxYuej/uw2cNY
 J7onXGVpGHFcU7pByOsf1fAAOASYSFxGNdmifzhi4/yf+6br22aeFFOFb2aKrLog0g
 Pxb1gzXNxi7QIMdbobSa/FvMtewoPlVC79zVB0uF8kaP/4t6IkbOY8AUspr4+nSjwu
 X8IP1FMKwppSvrY6E32K1ga6ZqFjysf3iRifNN3TqddSTGzlABefXMhqzCXWYsUq6U
 2wXRrNyh3rKuw==
Date: Thu, 15 Feb 2024 17:26:23 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
Subject: Re: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
Message-ID: <20240215-moodiness-concert-0050a16f644c@spud>
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-9-panikiel@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hSfnCMcAR7JL8pIR"
Content-Disposition: inline
In-Reply-To: <20240212131323.2162161-9-panikiel@google.com>
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


--hSfnCMcAR7JL8pIR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Mon, Feb 12, 2024 at 01:13:22PM +0000, Pawe=C5=82 Anikiel wrote:
> The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> capture and Multi-Stream Transport. The user guide can be found here:
>=20
> https://www.intel.com/programmable/technical-pdfs/683273.pdf
>=20
> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Do=
cumentation/devicetree/bindings/media/intel,dprx.yaml
> new file mode 100644
> index 000000000000..3ed37e0a4a94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel DisplayPort RX IP
> +
> +maintainers:
> +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> +
> +properties:
> +  compatible:
> +    const: intel,dprx

Please version this compatible, given that is it for an FPGA IP.
I could not find an example of another intel IP that had versioning, but
there's plenty of xilinx stuff you can get inspiration from.

> +  reg:
> +    items:
> +      - description: core registers
> +      - description: irq registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  intel,has-mst:

Mostly this looks fine, but this property drew my eye.
Firstly, I'd probably call this "intel,multi-stream-support" rather than
"intel,has-mst".

> +    type: boolean
> +    description: The device supports Multi-Stream Transport

Secondly, there are many many configuration parameters for this IP,
but you have chosen to document just one.
Are all other configuration parameters currently in their default
states or ignored by the driver? If not, please at least document all
configuration settings that you rely on - for example the max stream
count or audio packet encoding.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: SST main link
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 0 or SST main link
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 1
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 2
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MST virtual channel 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      required:
> +        - intel,has-mst
> +    then:
> +      required:
> +        - ports
> +    else:
> +      required:
> +        - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dprx@c0062000 {

"dprx" isn't a class of device, please try to use a generic node name
here.

Thanks,
Conor.

> +        compatible =3D "intel,dprx";
> +        reg =3D <0xc0062000 0x800>,
> +              <0xc0060f80 0x10>;
> +        interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +        intel,has-mst;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dprx_mst_0: endpoint {
> +                    remote-endpoint =3D <&fb_mst0_0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dprx_mst_1: endpoint {
> +                    remote-endpoint =3D <&fb_mst1_0>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg =3D <2>;
> +                dprx_mst_2: endpoint {
> +                    remote-endpoint =3D <&fb_mst2_0>;
> +                };
> +            };
> +
> +            port@3 {
> +                reg =3D <3>;
> +                dprx_mst_3: endpoint {
> +                    remote-endpoint =3D <&fb_mst3_0>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    dprx@c0064000 {
> +        compatible =3D "intel,dprx";
> +        reg =3D <0xc0064000 0x800>,
> +              <0xc0060fe0 0x10>;
> +        interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        port {
> +            dprx_sst_0: endpoint {
> +                remote-endpoint =3D <&fb_sst_0>;
> +            };
> +        };
> +    };
> --=20
> 2.43.0.687.g38aa6559b0-goog
>=20

--hSfnCMcAR7JL8pIR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5JPwAKCRB4tDGHoIJi
0gBLAQDhmoTNTAhTFhv9uO2IJ/2GJs5qeqMZXhKTI+ttHPKd1wEA43adUWXt/iGD
f7ogI1OIq4ytqQCW75qGuHEwYznCAQ8=
=drWq
-----END PGP SIGNATURE-----

--hSfnCMcAR7JL8pIR--
