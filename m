Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C70470BBE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 21:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF0010ECDD;
	Fri, 10 Dec 2021 20:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709FF10ECDD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 20:18:58 +0000 (UTC)
Date: Fri, 10 Dec 2021 20:18:43 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v11 3/8] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <7R1X3R.HSAT8MYJAY6M2@crapouillou.net>
In-Reply-To: <YbOF/pwib/VXoqkx@robh.at.kernel.org>
References: <cover.1638470392.git.hns@goldelico.com>
 <ac147196cd7744a7d50cf25197fe08bf9e81f88a.1638470392.git.hns@goldelico.com>
 <YbOF/pwib/VXoqkx@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le ven., d=E9c. 10 2021 at 10:53:18 -0600, Rob Herring <robh@kernel.org>=20
a =E9crit :
> On Thu, Dec 02, 2021 at 07:39:48PM +0100, H. Nikolaus Schaller wrote:
>>  From: Sam Ravnborg <sam@ravnborg.org>
>>=20
>>  Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>>  Based on .txt binding from Zubair Lutfullah Kakakhel
>>=20
>>  We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
>>=20
>>  Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>  Cc: Rob Herring <robh@kernel.org>
>>  Cc: devicetree@vger.kernel.org
>>  ---
>>   .../display/bridge/ingenic,jz4780-hdmi.yaml   | 78=20
>> +++++++++++++++++++
>>   .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>>   2 files changed, 81 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.y=
aml=20
>> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.y=
aml
>>  new file mode 100644
>>  index 0000000000000..49ae1130efded
>>  --- /dev/null
>>  +++=20
>> b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.y=
aml
>>  @@ -0,0 +1,78 @@
>>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id:=20
>> http://devicetree.org/schemas/display/bridge/ingenic,jz4780-hdmi.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Bindings for Ingenic JZ4780 HDMI Transmitter
>>  +
>>  +maintainers:
>>  +  - H. Nikolaus Schaller <hns@goldelico.com>
>>  +
>>  +description: |
>>  +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys=20
>> DesignWare HDMI 1.4
>>  +  TX controller IP with accompanying PHY IP.
>>  +
>>  +allOf:
>>  +  - $ref: synopsys,dw-hdmi.yaml#
>>  +
>>  +properties:
>>  +  compatible:
>>  +    const: ingenic,jz4780-dw-hdmi
>>  +
>>  +  reg-io-width:
>>  +    const: 4
>>  +
>>  +  clocks:
>>  +    maxItems: 2
>>  +
>>  +  hdmi-5v-supply:
>>  +    description: regulator to provide +5V at the connector
>=20
> Being part of the connector, that belongs in a connector node.

I believe that means adding .atomic_{enable,disable} callbacks to the=20
display-connector bridge (drivers/gpu/drm/bridge/display-connector.c)=20
which would enable/disable the regulator.

Unless it messes up with e.g. cable detection (which I believe requires=20
the regulator to be enabled), in that case unconditionally enable it in=20
the connector's probe function.

>>  +
>>  +  ports:
>>  +    $ref: /schemas/graph.yaml#/properties/ports
>=20
> You need to define what each 'port' node is.

Have a look at=20
Documentation/devicetree/bindings/display/ingenic,lcd.yaml for an=20
example on how to do this.

>>  +
>>  +required:
>>  +  - compatible
>>  +  - clocks
>>  +  - clock-names
>>  +  - hdmi-5v-supply
>>  +  - ports
>>  +  - reg-io-width
>>  +
>>  +unevaluatedProperties: false
>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
>>  +
>>  +    hdmi: hdmi@10180000 {
>>  +        compatible =3D "ingenic,jz4780-dw-hdmi";
>>  +        reg =3D <0x10180000 0x8000>;
>>  +        reg-io-width =3D <4>;
>>  +        ddc-i2c-bus =3D <&i2c4>;
>>  +        interrupt-parent =3D <&intc>;
>>  +        interrupts =3D <3>;
>>  +        clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>>  +        clock-names =3D "iahb", "isfr";
>>  +        hdmi-5v-supply =3D <&hdmi_power>;
>>  +
>>  +        ports {
>>  +            #address-cells =3D <1>;
>>  +            #size-cells =3D <0>;
>>  +            hdmi_in: port@0 {
>>  +                reg =3D <0>;
>>  +                dw_hdmi_in: endpoint {
>>  +                    remote-endpoint =3D <&jz4780_lcd_out>;
>>  +                };
>>  +            };
>>  +            hdmi_out: port@1 {
>>  +                reg =3D <1>;
>>  +                dw_hdmi_out: endpoint {
>>  +                    remote-endpoint =3D <&hdmi_con>;
>>  +                };
>>  +            };
>>  +        };
>>  +    };
>>  +
>>  +...
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml=
=20
>> b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>>  index 9be44a682e67a..9cbeabaee0968 100644
>>  ---=20
>> a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>>  +++=20
>> b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>>  @@ -50,6 +50,9 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>=20
>>  +  ddc-i2c-bus:
>>  +    description: An I2C interface if the internal DDC I2C driver=20
>> is not to be used
>=20
> That too is already defined to be part of the connector node.

Just remove the property then, since you don't use it in the ci20=20
bindings.

Cheers,
-Paul

>>  +
>>   additionalProperties: true
>>=20
>>   ...
>>  --
>>  2.33.0
>>=20
>>=20


