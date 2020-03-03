Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E462177126
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C55F6EA1A;
	Tue,  3 Mar 2020 08:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515866E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583220181;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=VukO5M6kbjrBruC22VkjNmvM3yOu++YWXVQgHeus7Ew=;
 b=P3hLiAoEJsgX7g9TTbnhrV5muycRYVKH49MhWlV7L2o+JYCAYHsocZ88GDexCULBI8
 PfWjxhfozsFHdxE0EU04bRfxtgCiUM7ZjU8yBjmrqp4wHldoyImVwu0wksqlGcyaUeSP
 4jIr8M4RJsvMJjNI1HSs+bxkg8xJVjCwfAW8RElkwPrTipVqZn/rhGNsKA82qXOPv9nn
 6E5uHKj2RENBCIORZv7adnPN4l2fm09LP+aPiGGBB1RuP9Xtjg18ch94f+lmcuttw4dt
 n2wsFJrdKXhIKVYNRSu7lkXPzMVjXKWuNZysig5pP9BenStKMrHBY5uZAJr4uxvLw9Oa
 j1yA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw237MjFyf
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 08:22:45 +0100 (CET)
Subject: Re: [RFC v2 2/8] dt-bindings: display: add ingenic-jz4780-hdmi DT
 Schema
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <1583176788.3.3@crapouillou.net>
Date: Tue, 3 Mar 2020 08:22:45 +0100
Message-Id: <E41B927B-A250-48F4-B0F8-851F23EADB24@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <0fb2f39437ea04fb4de889aac001b44f4b0a77e8.1582913973.git.hns@goldelico.com>
 <1583176788.3.3@crapouillou.net>
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


> Am 02.03.2020 um 20:19 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> =

> Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic-jz4780-hdmi.yaml | 83 +++++++++++++++++++
>> 1 file changed, 83 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4=
780-hdmi.yaml
>> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hd=
mi.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> new file mode 100644
>> index 000000000000..9b71c427bd69
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
>> +
>> +maintainers:
>> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
> =

> Did Zubair write this glue driver? He's been MIA for a while, doesn't wor=
k at ImgTec anymore, and this email doesn't work.

He did write the original .txt version of [RFC v1 2/8] and Sam simply added=
 him.

> =

>> +
>> +description: |
>> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare H=
DMI 1.4
>> +  TX controller IP with accompanying PHY IP.
>> +
>> +allOf:
>> +  - $ref: panel/panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: ingenic,jz4780-hdmi
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: the address & size of the LCD controller registers
> =

> Remove the description here,
> =

>> +
>> +  reg-io-width:
>> +    const: 4
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the interrupt provided by parent
> =

> and here.
> =

> The rule is that if there is only one "reg", "interrupts" or "clocks" ent=
ry then a description is not needed as it's pretty obvious what it's for.
> =

>> +
>> +  clocks:
>> +    maxItems: 2
>> +    description: Clock specifiers for isrf and iahb clocks
> =

> You need two 'description:' like this:
> =

> clocks:
> items:
>   - description: ISRF clock
>   - description: IAHB clock

Ok.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
