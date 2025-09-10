Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531FB51625
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AEC10E2D8;
	Wed, 10 Sep 2025 11:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="QMrR7Z56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9C10E2D8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757505346; x=1757764546;
 bh=ubMvjrek87GeaqHNL5HP9x3C5ADG973j0x4E0albOnY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QMrR7Z5676anBLe7AwxaKKijBhSvwv6m7yQv47t5NC0444eC2kKw96q59+2x85mFe
 A4mAQw0X3jevbu76dbFKC3xOgN/Zrwk8jJIDb4s4iOdW1Xpt8fQtuUtlSrjI5gccLb
 eRbazy2nfu5l/mYqS1JGe6+2nTtbI6L/ndnwGis5bQyXf3qUgsX//x9egZqwYILnBJ
 bwi8GPNx97ApOCR90PTnIaSU5/FmZaqjRV3ahwTbHlzlqR8QFcXOvxIVbFGRv/g67W
 mLrqzq/YvJXsd1hsb/nj1K+dw6Btw4sulGlb+srUcJCcpvaLcytbzeTZl1N+bY00f/
 yxOUX9S8oDY5w==
Date: Wed, 10 Sep 2025 11:55:42 +0000
To: Hans de Goede <hansg@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <5bgdfKv1_vrZKbzrkfF_zm8JDGoS_IdEmDcQzC2KmzhywBdjgOV1ULxep6DscsKudeIo4LdKRCGcAhPn3u1n-XMhT8m2U2EMifIZ0r39og0=@vinarskis.com>
In-Reply-To: <c6c80870-386b-473d-b643-bcd64c86c692@kernel.org>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
 <20250910-leds-v4-1-1fc320488233@vinarskis.com>
 <c6c80870-386b-473d-b643-bcd64c86c692@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 79dbae72426f9ad4c136f124bd92c930930dc852
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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






On Wednesday, September 10th, 2025 at 13:50, Hans de Goede <hansg@kernel.or=
g> wrote:

>=20
>=20
> Hi Aleksandrs,
>=20
> Thank you for your continued work on this.
>=20
> One small remark below.
>=20
> On 10-Sep-25 1:07 PM, Aleksandrs Vinarskis wrote:
>=20
> > Introduce common generic led consumer binding, where consumer defines
> > led(s) by phandle, as opposed to trigger-source binding where the
> > trigger source is defined in led itself.
> >=20
> > Add already used in some schemas 'leds' parameter which expects
> > phandle-array. Additionally, introduce 'led-names' which could be used
> > by consumers to map LED devices to their respective functions.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
> > .../devicetree/bindings/leds/leds-consumer.yaml | 67 ++++++++++++++++++=
++++
> > 1 file changed, 67 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml =
b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..045b7a4fcd3bdcfb19a02fe=
4435b40445c168115
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common leds consumer
> > +
> > +maintainers:
> > + - Aleksandrs Vinarskis alex@vinarskis.com
> > +
> > +description:
> > + Some LED defined in DT are required by other DT consumers, for exampl=
e
> > + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> > + approach which is typically used as 'soft' binding, referencing LED
> > + devices by phandle makes things simpler when 'hard' binding is desire=
d.
> > +
> > + Document LED properties that its consumers may define.
> > +
> > +select: true
> > +
> > +properties:
> > + leds:
> > + oneOf:
> > + - type: object
> > + - $ref: /schemas/types.yaml#/definitions/phandle-array
> > + description:
> > + A list of LED device(s) required by a particular consumer.
> > + items:
> > + maxItems: 1
> > +
> > + led-names:
> > + description:
> > + A list of device name(s). Used to map LED devices to their respective
> > + functions, when consumer requires more than one LED.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > + - |
> > + #include <dt-bindings/gpio/gpio.h>
> > + #include <dt-bindings/leds/common.h>
> > +
> > + leds {
> > + compatible =3D "gpio-leds";
> > +
> > + privacy_led: privacy-led {
> > + color =3D <LED_COLOR_ID_RED>;
> > + default-state =3D "off";
> > + function =3D LED_FUNCTION_INDICATOR;
> > + gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > + };
> > + };
> > +
> > + i2c {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <0>;
> > +
> > + v4l2_node: camera@36 {
> > + reg =3D <0x36>;
> > +
> > + leds =3D <&privacy_led>;
> > + led-names =3D "privacy-led";
>=20
>=20
> This should probable be:
>=20
> led-names =3D "privacy";
>=20
> Now without the "-led".

Ah of course, seems I messed my rebasing, thanks for spotting it.
Re-spinning.

Alex

>=20
> Regards,
>=20
> Hans
