Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47F41ABFB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 11:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224866E0E5;
	Tue, 28 Sep 2021 09:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B36E0E5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632821663;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=p7neOckUGIWhTkuByC2fKtTN9WxFIHR4euOV8huQSmo=;
 b=bYNMzj18HJaqxWA/saFk7BWwrm0PqFh4Vp4GmrSZIGSGWkrdZCwztrEWnrLuboepbg
 lvgQOkJUj/UO7P5zVsxss5DyiRW+QGu+AyNkp4H/euY3+miTwh4T/TTJeQiILsbFMnOr
 ofC5An/1vNVYgPEPxgsG0RW++JSCSLEYgUfi7LlBfq2dWvnk7wqs+h1l+O1+oBK8HuvY
 Iyk8gYi/YF7xDckmxCA96gysdiUA4SMXgbG6oiBD/sUYLsxU3WlexQqG8cA7fbCf5uhi
 kTpFmXuVYj/i2nOuvZNWghhai5jFAdOwa45z40ihlk3M2p7XIcrZkBqgQsj78n3f0iJ6
 w/pw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8S9YMdLm
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Sep 2021 11:34:22 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 03/10] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210928091807.xgqxemjizlobpcxy@gilmour>
Date: Tue, 28 Sep 2021 11:34:22 +0200
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
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
 Harry Wentland <harry.wentland@amd.com>,
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
Message-Id: <A17F7F48-5A3E-4F23-8C40-156275F5AEEE@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <6c8b72a03703de54fa02b29c1a53c84ca0889e50.1632761067.git.hns@goldelico.com>
 <20210927170702.on243lp24fcfdhbj@gilmour>
 <C529DB99-709A-4C24-B647-3A2004CBFE18@goldelico.com>
 <20210928091807.xgqxemjizlobpcxy@gilmour>
To: Maxime Ripard <maxime@cerno.tech>
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



> Am 28.09.2021 um 11:18 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> On Tue, Sep 28, 2021 at 10:59:45AM +0200, H. Nikolaus Schaller wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: ingenic,jz4780-dw-hdmi
>>>=20
>>> This can just be a const, there's no need for the items
>>=20
>> Maybe starting with an enum is better if more compatible strings are =
to be added.
>=20
> it's still fairly easy to change if needed, there's no need to confuse
> anyone.
>=20
>>>=20
>>>> +  reg-io-width:
>>>> +    const: 4
>>>=20
>>> If it's fixed, why do you need it in the first place?
>>=20
>> There is a fixed default of 1 if not specified.
>=20
> My point was more about why do you need to have that property at all?
> Can't you just drop it and assume that the register width is 32 bits =
if
> it's all you will ever run on?

No, please see bridge/synopsys,dw-hdmi.yaml where it is derived from:

  reg-io-width:
    description:
      Width (in bytes) of the registers specified by the reg property.
    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32
      - enum: [1, 4]
    default: 1

Other bindings define it explicitly to be 4, e.g.

Documentation//devicetree/bindings/display/intel,keembay-msscam.yaml:  =
reg-io-width:
=
Documentation//devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml:=
  reg-io-width:

Therefore I'd assume that a regmap is not properly set up
if we don't require the DTS to include it with const: 4.

>=20
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +    description: Clock specifiers for isrf and iahb clocks
>>>=20
>>> This can be defined as
>>>=20
>>> clocks:
>>> items:
>>>   - description: isrf
>>>   - description: iahb
>>>=20
>>> A better description about what these clocks are would be nice as =
well
>>=20
>> Generally I see that this all is nowadays not independent of
>>=20
>> =
Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>>=20
>> where there is already a description.
>=20
> Ok, good then
>=20
>> On the other hand every SoC specialization runs its own copy. e.g.
>>=20
>> Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
>> =
Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yam
>>=20
>>>=20
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: isfr
>>>=20
>>> Is it isfr or isrf?
>>=20
>> isfr. Seems to be a typo in the description. See
>> bridge/synopsys,dw-hdmi.yaml#
>>=20
>> One question to the yaml specialists:
>>=20
>> since ../bridge/synopsys,dw-hdmi.yaml# already defines this, do we
>> have to repeat? Or can we reduce to just the changes?
>=20
> If you add the ref you mentionned above, you don't have to repeat

Nice. It defines:

  clocks:
    minItems: 2
    maxItems: 5
    items:
      - description: The bus clock for either AHB and APB
      - description: The internal register configuration clock
    additionalItems: true

> yourself indeed. You can just put clock-names: true

Or should we do

  clocks:
    maxItems: 2
    additionalItems: false

>=20
>> [I am still not familiar enough with the yaml stuff to understand if
>> it has sort of inheritance like device tree include files, so that =
you
>> just have to change relevant properties]
>=20
> Kind of, but not entirely. schemas are all applied separately, unlike =
DT
> includes that will just expand to one big DT. In practice, it means =
that
> your device must validate against all the schemas, not just the sum of
> them.
>=20
> For example, if you have a generic schema that has:
>=20
> properties:
>  compatible:
>    const: vendor,my-generic-compatible
>=20
>=20
> and your schema that extends the generic binding, with a ref to the
> generic one that has:
>=20
> properties:
>  compatible:
>    items:
>      - const: other-vendor,my-device-compatible
>      - const: vendor,my-generic-compatible
>=20
>=20
> It will still fail since the generic schema expects only a single
> compatible, whereas your device would have two.

Ok, I see. it is not a simple "overwrite" rule.

>=20
>>>=20
>>>> +      - const: iahb
>>=20
>> would it make sense to add additionalItems: false here?
>>=20
>> In the jz4780 case there are just two clocks while other =
specializations
>> use more and synopsys,dw-hdmi.yaml# defines additionalItems: true.
>=20
> If you want to refine the generic one, and it's all the clocks you =
ever
> expect then there's no need for additionalItems

Ok.

>=20
>>>=20
>>>> +    description: An I2C interface if the internal DDC I2C driver =
is not to be used
>>>> +  ports: true
>>>=20
>>> If there's a single port, you don't need ports
>>=20
>> There can be two ports - one for input from LCDC and one
>> for output (HDMI connector). But explicitly defining an output
>> port is optional to some extent (depending on driver structure).
>=20
> This needs to be defined then (and port@0 made mandatory)

Ok. I'll try to make the best out of it for v5 series. Maybe
it is still not perfect by then, but close...

>=20
> Maxime

BR and thanks,
Nikolaus

