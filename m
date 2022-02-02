Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B64A6E4B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFCB10E296;
	Wed,  2 Feb 2022 09:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC610E296
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:59:17 +0000 (UTC)
Date: Wed, 02 Feb 2022 09:59:01 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 3/9] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <D29O6R.3788L9G5J66L@crapouillou.net>
In-Reply-To: <2386420a975e0a6c17393828af776991f3d17c01.1643632014.git.hns@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <2386420a975e0a6c17393828af776991f3d17c01.1643632014.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le lun., janv. 31 2022 at 13:26:49 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 83=20
> +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.ya=
ml=20
> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.ya=
ml
> new file mode 100644
> index 0000000000000..5a2767308c0ab
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.ya=
ml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id:=20
> http://devicetree.org/schemas/display/bridge/ingenic,jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys=20
> DesignWare HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: ingenic,jz4780-dw-hdmi
> +
> +  reg-io-width:
> +    const: 4
> +
> +  clocks:
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input from LCD controller output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Link to the HDMI connector.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - ports
> +  - reg-io-width
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
> +
> +    hdmi: hdmi@10180000 {
> +        compatible =3D "ingenic,jz4780-dw-hdmi";
> +        reg =3D <0x10180000 0x8000>;
> +        reg-io-width =3D <4>;
> +        ddc-i2c-bus =3D <&i2c4>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <3>;
> +        clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> +        clock-names =3D "iahb", "isfr";
> +        hdmi-5v-supply =3D <&hdmi_power>;

Where is this property defined?

Cheers,
-Paul

> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            hdmi_in: port@0 {
> +                reg =3D <0>;
> +                dw_hdmi_in: endpoint {
> +                    remote-endpoint =3D <&jz4780_lcd_out>;
> +                };
> +            };
> +            hdmi_out: port@1 {
> +                reg =3D <1>;
> +                dw_hdmi_out: endpoint {
> +                    remote-endpoint =3D <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.33.0
>=20


