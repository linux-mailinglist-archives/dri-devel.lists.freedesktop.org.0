Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A821449AAE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7FF6E185;
	Mon,  8 Nov 2021 17:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21286E270
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636392180;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=hLLn26F9mTaGNLdtyqawJH4bhbe5n3y5jRn46lQtAaA=;
 b=GBcL6JJrt8hFoPVhfbnuIX63D2IUHXw39LsbS6yusDVRmbTk7AaQtSysVKx1bY3Zfm
 y2xrx8j+hyA5k5xg9uSvofFUzmbb8Rs63FXvp8ynsoUX9XiN/w00BZzNoRq9Qb5pZlhI
 /ap0vOPlPQIwm0fCt6dyYWvCpnxceovCpXmsx6ZQpAzE8n/X0YgmggI8qSveSbwjkT1Q
 SDMMbf9BEEb4fWde0e7yj8kXc8k8FW9OehCMMrb2VjJXR9Mx8lM3LN4e1YM3pnCDCPCr
 4gSHK9e1gVow9vBT0Tkic7e8FKBLkMfnoIwpdKXhO09/9uLeCoGsB7OXlGRIRlIZ0ygO
 NOGQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3gMZ+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA8HMxM5V
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 8 Nov 2021 18:22:59 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BVH92R.0VU3IKPQTLX9@crapouillou.net>
Date: Mon, 8 Nov 2021 18:22:58 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
 <ZA692R.GHQL6RBCLFB12@crapouillou.net>
 <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
 <BVH92R.0VU3IKPQTLX9@crapouillou.net>
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 08.11.2021 um 17:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le lun., nov. 8 2021 at 16:29:11 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Bnjour Paul,
>>> Am 08.11.2021 um 13:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi,
>>>> e.g. jz4770.dtsi:
>>>> 	lcd: lcd-controller@13050000 {
>>>> 		compatible =3D "ingenic,jz4770-lcd";
>>>> 		reg =3D <0x13050000 0x300>;
>>>> or jz4725b.dtsi:
>>>> 	lcd: lcd-controller@13050000 {
>>>> 		compatible =3D "ingenic,jz4725b-lcd";
>>>> 		reg =3D <0x13050000 0x1000>;
>>>> So max_register becomes 0x300 or 0x1000 but not
>>>> #define JZ_REG_LCD_SIZE1	0x12c
>>>> 	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>> And therefore wastes a lot of regmap memory.
>>> "regmap memory"? ...
>> regmap allocates memory for its cache. Usually the total amount =
specified in the reg property.
>=20
> We are not using any register cache here.
>=20
>>>> Do you want this? DTS should not be reduced (DTS should be kept as =
stable as possible), since the reg property describes address mapping - =
not how many bytes are really used by registers or how big a cache =
should be allocated (cache allocation size requirements are not hardware =
description).
>>> The DTS should list the address and size of the register area. If =
your last register is at address 0x12c and there's nothing above, then =
the size in DTS should be 0x130.
>> If I look into some .dtsi it is sometimes that way but sometimes not. =
There seems to be no consistent rule.
>> So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi and =
jz4725b.dtsi as well (as mentioned above: this is beyond the scope of my =
project)?
>=20
> You could update them if you wanted to, but there is no need to do it =
here.

Hm. Then we are changing the .max_register initialization to a much =
bigger value.

>=20
>>>> But here are good news:
>>>> I have a simpler and less invasive proposal. We keep the =
devm_regmap_init_mmio code as is and just increase its .max_register =
from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when introducing the jz4780. =
This wastes a handful bytes for all non-jz4780 chips but less than using =
the DTS memory region size. And is less code (no entry in soc_info =
tables, no modifyable copy) and faster code execution than all other =
proposals.
>>>> This is then just a single-line change when introducing the jz4780. =
And no "preparation for adding jz4780" patch is needed at all. No patch =
to split out for separate review.
>>>> Let's go this way to get it eventually finalized. Ok?
>>> No.
>> Look friend, if you explain your "no" and what is wrong with my =
arguments, it helps to understand your decisions and learn something =
from them. A plain "no" does not help anyone.
>=20
> I answered just "no" because I felt like I explained already what I =
wanted to see in the previous email.
>=20
> By using a huge number as the .max_register, we do *not* waste =
additional memory. Computing the value of the .max_register field does =
not add any overhead, either.
>=20
> The .max_register is only used for boundary checking. To make sure =
that you're not calling regmap_write() with an invalid register. That's =
all there is to it.

Ah, now I understand our disconnect. So far I have used regmaps mainly =
for i2c devices and there is caching to avoid redundant i2c traffic...

So I just assumed wrongly that the regmap driver also allocates some =
buffer/cache here. Although it does not initialize .cache_type (default: =
REGCACHE_NONE).

>=20
>> So to summarize: if you prefer something which I consider worse, it =
is ok for me... In the end you are right - you are the maintainer, not =
me. So you have to live with your proposals.
>> Therefore, I have prepared new variants so you can choose which one =
is easier to maintain for you.
>> Note that they are both preparing for full jz4780-lcdc/hdmi support =
but in very different ways:
>> Variant 1 already adds some jz4780 stuff while Variant 2 just =
prepares for it.
>> Variant 2 is not tested (except to compile). So it needs some =
Tested-by: from someone with access to hardware. IMHO it is more =
invasive.
>> And don't forget: DTB could be in ROM or be provided by a separate =
bootloader... So we should not change it too often (I had such =
discussions some years ago with maintainers when I thought it is easier =
to change DTS instead of code).
>> Variant 3 would be to not separate this. As proposed in [PATCH v5 =
2/7].
>> (Finally, a Variant 3b would be to combine the simple change from =
Variant 1 with Variant 3).
>> So what is your choice?
>=20
> Variant 4: the variant #2 without the changes to the DTSI files.

Hm. If there is no cache and we can safely remove tight boundary =
checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing DTSI) why =
do we still need the max_register calculation from DTSI specifically for =
jz4780 and at all?

So what about:

Variant 5: set .max_register =3D 0x1800, i.e. "big enough for everyone" =
(includes z4780 gamma and vee registers) + no DTSI changes (+ no jz4780 =
register constants like Variant 1)

+ no DTSI changes
+ no calculation from DTSI needed
+ single separate patch to prepare for jz4780 but not included in jz4780 =
patch

BR and thanks,
Nikolaus


