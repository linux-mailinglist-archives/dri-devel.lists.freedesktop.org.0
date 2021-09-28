Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D602641AB50
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE34E6E0DE;
	Tue, 28 Sep 2021 08:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC706E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632819587;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=QjkVh+X5B/D/wI3Y4vAzZ0HLzWUItUYeAwlzSj/mPtw=;
 b=H+xHZGpgo4nwbiZaGdNmMbIH1wDRknHN2jiDKkGhh5kwNIfG2dqaA1RRezdIr7pEUp
 cT5CSqnx+ZD6NdDXm8Ip+LBloPAUKi6SoLJVLRa34Jc7d/ZRpknXn7zeUBwTRQW9GHH3
 GT6jAOdyG4PrrvN8UlYTvawrhJqKwtkBNTz8onQEEJhjAiLu9gScD+Oq1cQz6qKkqWr3
 eW2YtP3UskemrlDpuaZd4B4wFw+4zx+kGxHbSzGb/lNz5EV/LU28SZcX7AEAodNzrNlb
 Vec2NlhjzzmM0nxXg77gxHFs32hW/hOyIIPqNQzVXR/2G56MbvoBwpx9AmyqRZejr0St
 Dbkg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8S8xjd8m
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Sep 2021 10:59:45 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 03/10] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210927170702.on243lp24fcfdhbj@gilmour>
Date: Tue, 28 Sep 2021 10:59:45 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mips <linux-mips@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C529DB99-709A-4C24-B647-3A2004CBFE18@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
 <20210927170702.on243lp24fcfdhbj@gilmour>
To: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Am 27.09.2021 um 19:07 schrieb maxime@cerno.tech:
>=20
> Hi,
>=20
> On Mon, Sep 27, 2021 at 06:44:21PM +0200, H. Nikolaus Schaller wrote:
>> From: Sam Ravnborg <sam@ravnborg.org>
>>=20
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>>=20
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic-jz4780-hdmi.yaml | 85 =
+++++++++++++++++++
>> 1 file changed, 85 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> new file mode 100644
>> index 000000000000..5e60cdac4f63
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> @@ -0,0 +1,85 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
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
>> +  - $ref: panel/panel-common.yaml#
>=20
> Is it a panel though?

Good question.=20

Appears to have to be changed to

  - $ref: bridge/synopsys,dw-hdmi.yaml#

>=20
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: ingenic,jz4780-dw-hdmi
>=20
> This can just be a const, there's no need for the items

Maybe starting with an enum is better if more compatible strings are to =
be added.

>=20
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: the address & size of the LCD controller registers
>=20
> There's no need for that description, it's obvious enough

Indeed.

>=20
>> +  reg-io-width:
>> +    const: 4
>=20
> If it's fixed, why do you need it in the first place?

There is a fixed default of 1 if not specified.

>=20
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the interrupt provided by parent
>=20
> There's no need for that description, it's obvious enough

Indeed.

>=20
>> +  clocks:
>> +    maxItems: 2
>> +    description: Clock specifiers for isrf and iahb clocks
>=20
> This can be defined as
>=20
> clocks:
>  items:
>    - description: isrf
>    - description: iahb
>=20
> A better description about what these clocks are would be nice as well

Generally I see that this all is nowadays not independent of

Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml

where there is already a description.

On the other hand every SoC specialization runs its own copy. e.g.

Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yam

>=20
>> +  clock-names:
>> +    items:
>> +      - const: isfr
>=20
> Is it isfr or isrf?

isfr. Seems to be a typo in the description. See =
bridge/synopsys,dw-hdmi.yaml#

One question to the yaml specialists:

since ../bridge/synopsys,dw-hdmi.yaml# already defines this, do we have =
to repeat?
Or can we reduce to just the changes?

[I am still not familiar enough with the yaml stuff to understand if it =
has sort
of inheritance like device tree include files, so that you just have to =
change
relevant properties]

>=20
>> +      - const: iahb

would it make sense to add additionalItems: false here?

In the jz4780 case there are just two clocks while other specializations
use more and synopsys,dw-hdmi.yaml# defines additionalItems: true.

>> +
>> +  hdmi-regulator: true
>> +    description: Optional regulator to provide +5V at the connector
>=20
> regulators need to be suffixed by -supply

My omission...

And, it should be "hdmi-5v-supply" to match driver and device tree.

>=20
> You also can just provide the description, you don't need the true =
there
>=20
>> +  ddc-i2c-bus: true
>=20
> ditto

Ok

>=20
>> +    description: An I2C interface if the internal DDC I2C driver is =
not to be used
>> +  ports: true
>=20
> If there's a single port, you don't need ports

There can be two ports - one for input from LCDC and one
for output (HDMI connector). But explicitly defining an output
port is optional to some extent (depending on driver structure).

>=20
> You should also include /schemas/graph.yaml#/$defs/port-base

Ok.

BR and thanks,
Nikolaus

