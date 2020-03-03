Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9F177111
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A996EA01;
	Tue,  3 Mar 2020 08:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105BA6E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583220128;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/FFJp29E0bM3pvHTu+JTqNaYJ7aZHkmiAWb7IBx82t4=;
 b=AsAdX+CKlJ05lU2xXrShBhKzmd+REPVzOEfbwXff1bgBxLHCeGXzouKLT6pa7bW29p
 6yEyZpXw+i5RpXWupyxGwyfUD0q/lSa5luESvICn+skF6XzIz9tBGJvbGeE5YIGujy2r
 UIt83oiBtJwa+mvIxZ6WeRb5lCySZoLjBvOxxsuGkwBGfgiP8XB6Ab3IxzunHT+glnJy
 qcodMdwR4CyQLotyoiF6A7tEBUb0XEk/1Us9vCVjnElaJFCOjjv5I/OXqlJn2zgHqZ5o
 40SAyXOvORLQh24gYS0HcvHB8E9Vdbsa2TcEiKDUVRgms3/MS1Y15Vagw/sMTz1RN3ut
 7N7g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw237LkFyR
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 08:21:46 +0100 (CET)
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1583176247.3.2@crapouillou.net>
Date: Tue, 3 Mar 2020 08:21:37 +0100
Message-Id: <12E78333-0940-4F20-863E-91272C477B58@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
 <1583176247.3.2@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 02.03.2020 um 20:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> =

> Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Add DT bindings for the LCD controller on the jz4780 SoC
>> Based on .txt binding from Zubair Lutfullah Kakakhel
> =

> If you mean Documentation/devicetree/bindings/display/ingenic,lcd.txt the=
n it was written by me.

Ah, ok. We didn't recognise this before. 6 eyes see more than 4...

I just did cherry-pick this old 4.0 patch from 2015 by Zubair
and it created a ingenic-jz4780-lcd.txt:

https://lore.kernel.org/patchwork/patch/547872/

and Sam was so kind to convert it to yaml.

> =

>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
>> 1 file changed, 78 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4=
780-lcd.yaml
>> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lc=
d.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>> new file mode 100644
>> index 000000000000..c71415a3a342
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 LCD Controller
>> +
>> +maintainers:
>> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
> =

> I'm the author of the driver, please put me here; and remove Zubair, whic=
h 1. didn't touch the DRM driver at all, and 2. isn't working at ImgTec any=
more.

Yes that is true.

> Also, no need to put yourself here, unless you maintain the Ingenic DRM/K=
MS driver.

Agreed. That was suggested by Sam.

> =

>> +
>> +description: |
>> +  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
>> +
>> +properties:
> =

> You should add a '$nodename' property.
> =

>> +  compatible:
>> +    items:
>> +      - const: ingenic,jz4780-lcd
> =

> The .txt lists more compatible strings. Please add them all.
> =

>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: the address & size of the LCD controller registers
> =

> Drop the description here,
> =

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the interrupt provided by parent
> =

> and here.
> =

>> +
>> +  clocks:
>> +    maxItems: 2
>> +    description: Clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD=
0PIXCLK
> =

> Add one 'description:' per item.
> =

>> +
>> +  clock-names:
>> +    items:
>> +      - const: lcd_clk
>> +      - const: lcd_pixclk
>> +
>> +  port:
>> +    type: object
>> +    description: |
>> +      A port node with endpoint definitions as defined in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +required:
>> +    - compatible
>> +    - reg
>> +    - interrupts
>> +    - clocks
>> +    - clock-names
>> +    - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +    lcd: jz4780-lcdk@0x13050000 {
> =

> The node name does not comply with the DT spec, it should be 'lcd-control=
ler'.

Ok, I think I'll review all so that it does match/replace
Documentation/devicetree/bindings/display/ingenic,lcd.txt
and no information is lost.
 =

> =

> Cheers,
> -Paul

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
