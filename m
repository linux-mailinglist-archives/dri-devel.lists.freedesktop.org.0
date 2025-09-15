Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9248B5840D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE1710E367;
	Mon, 15 Sep 2025 17:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jom/24+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651110E367
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:55:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC9C041779;
 Mon, 15 Sep 2025 17:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562DAC4CEFB;
 Mon, 15 Sep 2025 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757958901;
 bh=p6i1OXOwL1SbFMy6RHcrUa5lkMegakp9xY05tYmaFnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jom/24+EXhKUrEjPIycsMmgCYhmsBk1/WXxwQDO2r6+KPb+kDjeG8to3CCwvyqU/l
 oawXXgrHbTKOEYTYjVPgrJyCtjfq21/GjhscZsrXfDM4bMtSvzUQ58kdqXhYkaEspt
 Ny4iC9WtNufFJwcOxo518A1KT3kEYPnQzFoWgro6feQBLLfWND1LuAI1kIGvm+a0c6
 E8ycaLMCXRReKt2vOMMGFf5zGJSQan6rrQZbgVIFdzB/4bbbkoLF5+Q6qljSEdny0W
 jY5W1g7cN/dC0dhPI6/BkqxNRxPX8ESK+8pcBIjCifTi02o98uOSabpw5/AaEozXcx
 KgMv+VhBYMdYQ==
Date: Mon, 15 Sep 2025 18:54:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
Message-ID: <20250915-reviving-evasive-8ecd2d760ba8@spud>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-4-779a8a3729d9@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DOVzGwk1KV7PIqCa"
Content-Disposition: inline
In-Reply-To: <20250912-mt8196-gpufreq-v2-4-779a8a3729d9@collabora.com>
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


--DOVzGwk1KV7PIqCa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 08:37:03PM +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
> acting as glue logic to control power and frequency of the Mali GPU.
> This MCU runs special-purpose firmware for this use, and the main
> application processor communicates with it through a mailbox.
>=20
> Add a binding that describes this mailbox.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gp=
ueb-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-g=
pueb-mbox.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..56508f406fce88c7c1699aa67=
b57394fc7b1c357
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbo=
x.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-gpueb-mbox.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MFlexGraphics GPUEB Mailbox Controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-gpueb-mbox
> +
> +  reg:
> +    items:
> +      - description: mailbox data registers
> +      - description: mailbox control registers
> +
> +  reg-names:
> +    items:
> +      - const: data
> +      - const: ctl
> +
> +  clocks:
> +    items:
> +      - description: main clock of the GPUEB MCU
> +
> +  interrupts:
> +    items:
> +      - description: fires when a new message is received
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      The number of the mailbox channel.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gpueb_mbox: mailbox@4b09fd80 {

drop the label, but otherwise this binding looks okay to me.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +        compatible =3D "mediatek,mt8196-gpueb-mbox";
> +        reg =3D <0x4b09fd80 0x280>,
> +              <0x4b170000 0x7c>;
> +        reg-names =3D "data", "ctl";
> +        clocks =3D <&topckgen CLK_TOP_MFG_EB>;
> +        interrupts =3D <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells =3D <1>;
> +    };
>=20
> --=20
> 2.51.0
>=20

--DOVzGwk1KV7PIqCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhS7gAKCRB4tDGHoIJi
0lYlAP9XouEer/Fwt1f66kXxrg1+AQ0F+bPce66xOHq6v41wAgEA4pG93Zb9AFHi
eAUYrGfpE1XzVi8+aUoob4gbAyOwvw0=
=+tYL
-----END PGP SIGNATURE-----

--DOVzGwk1KV7PIqCa--
