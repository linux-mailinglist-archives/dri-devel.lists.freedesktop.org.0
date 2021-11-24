Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6145C9CF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4916E8F5;
	Wed, 24 Nov 2021 16:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B206E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637770874;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=A8cl5XMYTCID9CkBz3Mux6j+IoiYxHqGzWidm31N1Uk=;
 b=DxsSqehZRUB94idDDA/Wmti1v2ZWN1ZaURuYxeoJjnp7qKAfFqQm27XLQ2W5PKqxa9
 lHHbHLN7+3eK42COQtzdMpQPP/Q143cT1OCBbjyqiTFWGjIy3FsURRAznmOt1iFsZlUU
 giYd+WgG/klJslJk+K4tUTp5aPr1lw6Jyh0BNcGtsZsOUDFlWg05fCWN/wDApYsOZ9Cv
 AlL5Z8oWsFaDsYhiOhTCgj7x/FaYWJMTDvSucT3UoMOUm+Infz3NWFnT/SKV0Z64TI8B
 Y/SQ2Wwtmc48Te7s9AjowRwObtKi6a+m9eqK/Ta4ntivkx8sfQ1pa8Yy7Lc3nZo71IYB
 VgwQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGLE3lP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:21:14 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <QHK23R.B5XN10D1VV2O1@crapouillou.net>
Date: Wed, 24 Nov 2021 17:21:13 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <A16256C4-C48C-4308-B99B-ACE85A2978E2@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
 <QHK23R.B5XN10D1VV2O1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob and Paul,

> Am 24.11.2021 um 10:17 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., nov. 23 2021 at 19:13:56 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 =
+++++++++++++++++++
>> .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>> 2 files changed, 79 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>> diff --git =
a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l =
b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l
>> new file mode 100644
>> index 0000000000000..190ca4521b1d0
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bridge/ingenic,jz4780-hdmi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
>> +
>> +maintainers:
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>> +
>> +description: |
>> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys =
DesignWare HDMI 1.4
>> +  TX controller IP with accompanying PHY IP.
>> +
>> +allOf:
>> +  - $ref: bridge/synopsys,dw-hdmi.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: ingenic,jz4780-dw-hdmi
>> +
>> +  reg-io-width:
>> +    const: 4
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  hdmi-5v-supply:
>> +    description: Optional regulator to provide +5V at the connector
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +required:
>> +    - compatible
>> +    - clocks
>> +    - clock-names
>> +    - ports
>> +    - reg-io-width
>> +
>> +unevaluatedPropertes: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>=20
> This include was moved in 5.16-rc1 to =
<dt-bindings/clock/ingenic,jz4780-cgu.h>.

I see!

>=20
> Cheers,
> -Paul
>=20
>> +
>> +    hdmi: hdmi@10180000 {
>> +        compatible =3D "ingenic,jz4780-dw-hdmi";
>> +        reg =3D <0x10180000 0x8000>;
>> +        reg-io-width =3D <4>;
>> +        ddc-i2c-bus =3D <&i2c4>;
>> +        interrupt-parent =3D <&intc>;
>> +        interrupts =3D <3>;
>> +        clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>> +        clock-names =3D "iahb", "isfr";
>> +
>> +        ports {
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +            hdmi_in: port@0 {
>> +                reg =3D <0>;
>> +                dw_hdmi_in: endpoint {
>> +                    remote-endpoint =3D <&jz4780_lcd_out>;
>> +                };
>> +            };
>> +            hdmi_out: port@1 {
>> +                reg =3D <1>;
>> +                dw_hdmi_out: endpoint {
>> +                    remote-endpoint =3D <&hdmi_con>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> diff --git =
a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> index 9be44a682e67a..9cbeabaee0968 100644
>> --- =
a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> +++ =
b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> @@ -50,6 +50,9 @@ properties:
>>   interrupts:
>>     maxItems: 1
>> +  ddc-i2c-bus:
>> +    description: An I2C interface if the internal DDC I2C driver is =
not to be used
>> +
>> additionalProperties: true
>> ...
>> --
>> 2.33.0
>=20
>=20

