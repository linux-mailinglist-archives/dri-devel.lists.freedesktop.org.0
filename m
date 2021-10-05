Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E6423245
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBF66E45C;
	Tue,  5 Oct 2021 20:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5243F6E45C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:44:12 +0000 (UTC)
Date: Tue, 05 Oct 2021 21:43:56 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Message-Id: <8XUI0R.KDQ64KIMI9BU@crapouillou.net>
In-Reply-To: <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mar., oct. 5 2021 at 14:29:15 +0200, H. Nikolaus Schaller=20
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
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 79=20
> +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 000000000000..5bcb342da86f
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
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

My dmesg disagrees:
dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a with=20
HDCP (DWC HDMI 3D TX PHY)

Or am I comparing apples to oranges?

> +
> +allOf:
> +  - $ref: bridge/synopsys,dw-hdmi.yaml#
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
> +  hdmi-5v-supply:
> +    description: Optional regulator to provide +5V at the connector
> +
> +  ddc-i2c-bus:
> +    description: An I2C interface if the internal DDC I2C driver is=20
> not to be used

This property is used within=20
(drivers/gpu/drm/bridge/synopsys/dw-hdmi.c); I think it would make=20
sense to move it to bridge/synopsys,dw-hdmi.yaml.

Cheers,
-Paul

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +required:
> +    - compatible
> +    - clocks
> +    - clock-names
> +    - ports
> +    - reg-io-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
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


