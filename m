Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3BB856AFE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF1410EA0F;
	Thu, 15 Feb 2024 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XsUwywqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829410E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:29:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2949FCE1C5F;
 Thu, 15 Feb 2024 17:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244D8C433C7;
 Thu, 15 Feb 2024 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708018186;
 bh=xGmTgBLilTN6fWGK0q/dhszZ3xW+TO9kc1nLJ9c0Cxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XsUwywqhBibh7Nv0quuN/TTKxrYrGRYyWGcYr7Abta1V0DhGrg3J9h9+bXqRGbnqw
 v+A9ci8EMo3tJMFYYaws9C+AVD45z9PhoXPrjknlm2taJHmMpY4z1LkJXK36HDBBrG
 I14DC3cwO+7HubyV/9pDwQHCxvHKzjXUf1/QzifXnL9poFyL6veVp3ydBJRS11vqIF
 OMGrNZ0UiBonFgJnP5hSW8N9uwBERdhzIe7EVVcIfwxwno6mGTk6c2kSacy9ftzIqC
 lg2xLO1mOveZ/UaT6BsOVC711kanQvq1aA6ZozLXRDNAkBZHBXI7SQ3xavWA3iDNBG
 jrO7rv0XjiUMw==
Date: Thu, 15 Feb 2024 17:29:40 +0000
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
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
Message-ID: <20240215-supervise-concerned-55a18554a120@spud>
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C43cJgjesa1CmRR7"
Content-Disposition: inline
In-Reply-To: <20240212131323.2162161-8-panikiel@google.com>
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


--C43cJgjesa1CmRR7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 01:13:21PM +0000, Pawe=C5=82 Anikiel wrote:
> The Chameleon v3 uses the framebuffer IP core to take the video signal
> from different sources and directly write frames into memory.
>=20
> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> ---
>  .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/google,chv3-f=
b.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/google,chv3-fb.yaml =
b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> new file mode 100644
> index 000000000000..ba6643cc7232
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/google,chv3-fb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chameleon v3 video framebuffer
> +
> +maintainers:
> +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> +
> +properties:
> +  compatible:
> +    const: google,chv3-fb
> +
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: irq registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  google,legacy-format:
> +    type: boolean
> +    description: The incoming video stream is in 32-bit padded mode.
> +
> +  google,no-endpoint:
> +    type: boolean
> +    description:
> +      The framebuffer isn't connected to a controllable endpoint.
> +      The video interface still works, but EDID control is unavailable
> +      and DV timing information only reports the active video width/heig=
ht.

Why does this need a dedicated property? Is it not sufficient to check
that there are no endpoints in the devicetree?

Cheers,
Conor.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      not:
> +        required:
> +          - google,no-endpoint
> +    then:
> +      required:
> +        - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    video@c0060500 {
> +        compatible =3D "google,chv3-fb";
> +        reg =3D <0xc0060500 0x100>,
> +              <0xc0060f20 0x10>;
> +        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +        google,legacy-format;
> +        google,no-endpoint;
> +    };
> +
> +  - |
> +    video@c0060600 {
> +        compatible =3D "google,chv3-fb";
> +        reg =3D <0xc0060600 0x100>,
> +              <0xc0060f30 0x10>;
> +        interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        port {
> +            fb_mst0_0: endpoint {
> +                remote-endpoint =3D <&dprx_mst_0>;
> +            };
> +        };
> +    };
> --=20
> 2.43.0.687.g38aa6559b0-goog
>=20

--C43cJgjesa1CmRR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5KBAAKCRB4tDGHoIJi
0lysAQDdxf2465AvkKhF49ZcHnwSHInQqU4NtSRwzZOwOHT1hQEAqOZCSrEz6g2o
2S9hN9oun805ifFuz83SNRi4jo99oAg=
=3pwD
-----END PGP SIGNATURE-----

--C43cJgjesa1CmRR7--
