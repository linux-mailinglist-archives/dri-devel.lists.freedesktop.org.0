Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00C447518
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 20:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5E6E1F5;
	Sun,  7 Nov 2021 19:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122AE6E1F5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 19:03:19 +0000 (UTC)
Date: Sun, 07 Nov 2021 19:03:03 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <39U72R.F9FBQRJUWY9W2@crapouillou.net>
In-Reply-To: <D45DF9B7-8175-43EE-9D55-DA131DCB4FA4@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
 <8XUI0R.KDQ64KIMI9BU@crapouillou.net>
 <D45DF9B7-8175-43EE-9D55-DA131DCB4FA4@goldelico.com>
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

Hi Nikolaus,

Le dim., nov. 7 2021 at 14:43:33 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi,
>=20
>>  Am 05.10.2021 um 22:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le mar., oct. 5 2021 at 14:29:15 +0200, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: Sam Ravnborg <sam@ravnborg.org>
>>>  Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>>>  Based on .txt binding from Zubair Lutfullah Kakakhel
>>>  Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  Cc: Rob Herring <robh@kernel.org>
>>>  Cc: devicetree@vger.kernel.org
>>>  ---
>>>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 79=20
>>> +++++++++++++++++++
>>>  1 file changed, 79 insertions(+)
>>>  create mode 100644=20
>>> Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>>>  diff --git=20
>>> a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml=20
>>> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>>>  new file mode 100644
>>>  index 000000000000..5bcb342da86f
>>>  --- /dev/null
>>>  +++=20
>>> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>>>  @@ -0,0 +1,79 @@
>>>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>  +%YAML 1.2
>>>  +---
>>>  +$id:=20
>>> http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
>>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>  +
>>>  +title: Bindings for Ingenic JZ4780 HDMI Transmitter
>>>  +
>>>  +maintainers:
>>>  +  - H. Nikolaus Schaller <hns@goldelico.com>
>>>  +
>>>  +description: |
>>>  +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys=20
>>> DesignWare HDMI 1.4
>>>  +  TX controller IP with accompanying PHY IP.
>>=20
>>  My dmesg disagrees:
>>  dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a=20
>> with HDCP (DWC HDMI 3D TX PHY)
>=20
> mine as well.
>=20
>>=20
>>  Or am I comparing apples to oranges?
>=20
> There is a document called "JZ4780 High Efficiency Engine for Mobile=20
> Device"
> (JZ4780_PB.pdf) which says
>=20
> "24-bit parallel/serial TFT interface, HDMI 1.4a interface, LVDS=20
> interface"
>=20
> And the data sheet ("JZ4780 Mobile Application Processor Data Sheet=20
> ") says: "Support HDMI 1.4a Interface"
>=20
> Finally, the programming manual also says "Support HDMI 1.4a=20
> Interface".
>=20
> So what is correct?
>=20
> dmesg may return something else. E.g. silicon revision 1.31a
> while the interface is HDMI protocol revision 1.4a compatible?
>=20
> Trying to find something about "hdmi 1.31a" did only lead to some
> "Synopsys' HAPS-51 eval platform" [1].
>=20
> Looking at HDMI standards [2] I can only find HDMI 1.3 and 1.3a but=20
> no HDMI 1.31a.
>=20
> [1]=20
> https://www.digital-cp.com/hdcp-products/haps51-hdmi-tx-platform-dwc-hdmi=
-tx-controller-131a-ea-hdmi-3d-tx-phy-tsmc40g-ip
> [2] https://en.wikipedia.org/wiki/HDMI#Version_1.3
>=20
> Well it may also be some Synopsys-internal designation 1.31a=20
> referring so something
> newer than HDMI 1.3a which became the HDMI 1.4 standard (released=20
> June 2009)...
>=20
> Whom should we believe? What the chip tells or what the data sheet=20
> and programming
> manual says?
>=20
> I tend to keep confusion low and stay with "HDMI 1.4" in the bindings=20
> because
> there is no offical "HDMI 1.31a" standard. And HDMI 1.4 was already=20
> some years old
> when the jz4780 was released. So it is likely that the chip=20
> identification just
> returns 1.31a (maybe Ingenic licenced an interim release VHDL)=20
> although the standard
> was later officially named 1.4a.

Fair enough. Let's keep "HDMI 1.4" until proven otherwise.

Cheers,
-Paul

>>=20
>>>  +
>>>  +allOf:
>>>  +  - $ref: bridge/synopsys,dw-hdmi.yaml#
>>>  +
>>>  +properties:
>>>  +  compatible:
>>>  +    const: ingenic,jz4780-dw-hdmi
>>>  +
>>>  +  reg-io-width:
>>>  +    const: 4
>>>  +
>>>  +  clocks:
>>>  +    maxItems: 2
>>>  +
>>>  +  hdmi-5v-supply:
>>>  +    description: Optional regulator to provide +5V at the=20
>>> connector
>>>  +
>>>  +  ddc-i2c-bus:
>>>  +    description: An I2C interface if the internal DDC I2C driver=20
>>> is not to be used
>>=20
>>  This property is used within=20
>> (drivers/gpu/drm/bridge/synopsys/dw-hdmi.c); I think it would make=20
>> sense to move it to bridge/synopsys,dw-hdmi.yaml.
>=20
> It is indeed more general and not jz4780 specific. I'll move it for=20
> v6.
>=20
> BR and thanks,
> Nikolaus
>=20


