Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02733957105
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BA910E286;
	Mon, 19 Aug 2024 16:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="effaAejZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B566310E286
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:53:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E90D8CE0B0A;
 Mon, 19 Aug 2024 16:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4887C32782;
 Mon, 19 Aug 2024 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724086431;
 bh=Lgc91tGqxh8A/yeZwkCHnvZJKzQLNAzEfNfTq/lcPoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=effaAejZKiMmF/iYn8xf9VirwWcY6KUWYl29sRt9c0A0Bbu1xe9L1oJTpoNHx1YR+
 WhpV3wYaIHzbBYOMH4qD7N45c2WlF8Sucdm7nEi7DWWyk9FV4CxX0NvcSw9Q4XfCxk
 0JNqJz6rgfMUIAHX7DT+yAwpMLwGTx31/5Htss7C/jy1yFluVJw4MEzfLMhM76Kyet
 2fCoIFwsect8/yC6TWtraAw+B/wHakkWNs4xQ6VGeFdK0Ym8+718gyj4BLoKzA+ELW
 ejrlEop0ep5mKa6ek2qgG1sbZwEGU0IXpluyLtncAjUcVvWXheALOzrsCw4OjjFtzV
 X+TnuipJq41Iw==
Date: Mon, 19 Aug 2024 17:53:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
Message-ID: <20240819-bobbing-purplish-99e48baa2304@spud>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-3-6417c72a2749@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BqjkFo/XhTGy7ekD"
Content-Disposition: inline
In-Reply-To: <20240819-b4-rk3588-bridge-upstream-v4-3-6417c72a2749@collabora.com>
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


--BqjkFo/XhTGy7ekD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 01:29:30AM +0300, Cristian Ciocaltea wrote:
> Rockchip RK3588 SoC integrates the Synopsys DesignWare HDMI 2.1
> Quad-Pixel (QP) TX controller IP.
>=20
> Since this is a new IP block, quite different from those used in the
> previous generations of Rockchip SoCs, add a dedicated binding file.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../display/rockchip/rockchip,dw-hdmi-qp.yaml      | 170 +++++++++++++++=
++++++
>  1 file changed, 170 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi-qp.yaml
> new file mode 100644
> index 000000000000..de470923d823
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi=
-qp.yaml

Filename matching the compatible please.

> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi-qp.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DW HDMI QP TX Encoder
> +
> +maintainers:
> +  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> +
> +description:
> +  Rockchip RK3588 SoC integrates the Synopsys DesignWare HDMI QP TX cont=
roller
> +  IP and a HDMI/eDP TX Combo PHY based on a Samsung IP block.
> +
> +allOf:
> +  - $ref: /schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-dw-hdmi-qp
> +
> +  clocks:
> +    minItems: 4
> +    items:
> +      - {}
> +      - {}
> +      - {}
> +      - {}

Why have you chosen to do things like this?  I find it makes things less
clear than reiterating the names of the required clocks.

> +      # The next clocks are optional, but shall be specified in this
> +      # order when present.
> +      - description: TMDS/FRL link clock
> +      - description: Video datapath clock

I don't get what you mean by optional. You have one SoC, either they are
or are not connected, unless there's multiple instances of this IP block
on the SoC and some do and some do not have these clocks?
Ditto for the interrupts.

> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - {}
> +      - {}
> +      - {}
> +      - {}
> +      - enum: [hdp, hclk_vo1]
> +      - const: hclk_vo1
> +
> +  interrupts:
> +    items:
> +      - {}
> +      - {}
> +      - {}
> +      - {}
> +      - description: HPD interrupt
> +
> +  interrupt-names:
> +    items:
> +      - {}
> +      - {}
> +      - {}
> +      - {}
> +      - const: hpd
> +
> +  phys:
> +    maxItems: 1
> +    description: The HDMI/eDP PHY.
> +
> +  phy-names:
> +    const: hdmi
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: ref
> +      - const: hdp
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Most HDMI QP related data is accessed through SYS GRF regs.
> +
> +  rockchip,vo1-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Additional HDMI QP related data is accessed through VO1 GRF regs.

Why are these required? What prevents you looking up the syscons by
compatible?

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phys
> +  - phy-names
> +  - ports
> +  - resets
> +  - reset-names
> +  - rockchip,grf
> +  - rockchip,vo1-grf
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      hdmi@fde80000 {
> +        compatible =3D "rockchip,rk3588-dw-hdmi-qp";
> +        reg =3D <0x0 0xfde80000 0x0 0x20000>;
> +        clocks =3D <&cru PCLK_HDMITX0>,
> +                 <&cru CLK_HDMITX0_EARC>,
> +                 <&cru CLK_HDMITX0_REF>,
> +                 <&cru MCLK_I2S5_8CH_TX>,
> +                 <&cru CLK_HDMIHDP0>,
> +                 <&cru HCLK_VO1>;
> +        clock-names =3D "pclk", "earc", "ref", "aud", "hdp", "hclk_vo1";
> +        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names =3D "avp", "cec", "earc", "main", "hpd";
> +        phys =3D <&hdptxphy_hdmi0>;
> +        phy-names =3D "hdmi";
> +        power-domains =3D <&power RK3588_PD_VO1>;
> +        resets =3D <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
> +        reset-names =3D "ref", "hdp";
> +        rockchip,grf =3D <&sys_grf>;
> +        rockchip,vo1-grf =3D <&vo1_grf>;
> +        #sound-dai-cells =3D <0>;
> +
> +        ports {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          port@0 {
> +            reg =3D <0>;
> +
> +            hdmi0_in_vp0: endpoint {
> +                remote-endpoint =3D <&vp0_out_hdmi0>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg =3D <1>;
> +
> +            hdmi0_out_con0: endpoint {
> +                remote-endpoint =3D <&hdmi_con0_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
>=20
> --=20
> 2.46.0
>=20

--BqjkFo/XhTGy7ekD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN4lwAKCRB4tDGHoIJi
0uMlAQCeNiyUGCxDpjROAQ54l9m7hMljsdP2KRn6KVEBgpgwhAD/S9KJnlaANagj
HTaIDomg1UIgte88LE7zDjLZYOJmWgo=
=uaDs
-----END PGP SIGNATURE-----

--BqjkFo/XhTGy7ekD--
