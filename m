Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F02449B16
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A7C6E0A5;
	Mon,  8 Nov 2021 17:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AF16E0A5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 17:49:59 +0000 (UTC)
Date: Mon, 08 Nov 2021 17:49:39 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <RIL92R.MLAZ6CTO865E1@crapouillou.net>
In-Reply-To: <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
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
 <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le lun., nov. 8 2021 at 18:22:58 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 08.11.2021 um 17:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi,
>>=20
>>  Le lun., nov. 8 2021 at 16:29:11 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Bnjour Paul,
>>>>  Am 08.11.2021 um 13:20 schrieb Paul Cercueil=20
>>>> <paul@crapouillou.net>:
>>>>  Hi,
>>>>>  e.g. jz4770.dtsi:
>>>>>  	lcd: lcd-controller@13050000 {
>>>>>  		compatible =3D "ingenic,jz4770-lcd";
>>>>>  		reg =3D <0x13050000 0x300>;
>>>>>  or jz4725b.dtsi:
>>>>>  	lcd: lcd-controller@13050000 {
>>>>>  		compatible =3D "ingenic,jz4725b-lcd";
>>>>>  		reg =3D <0x13050000 0x1000>;
>>>>>  So max_register becomes 0x300 or 0x1000 but not
>>>>>  #define JZ_REG_LCD_SIZE1	0x12c
>>>>>  	.max_reg =3D JZ_REG_LCD_SIZE1,
>>>>>  And therefore wastes a lot of regmap memory.
>>>>  "regmap memory"? ...
>>>  regmap allocates memory for its cache. Usually the total amount=20
>>> specified in the reg property.
>>=20
>>  We are not using any register cache here.
>>=20
>>>>>  Do you want this? DTS should not be reduced (DTS should be kept=20
>>>>> as stable as possible), since the reg property describes address=20
>>>>> mapping - not how many bytes are really used by registers or how=20
>>>>> big a cache should be allocated (cache allocation size=20
>>>>> requirements are not hardware description).
>>>>  The DTS should list the address and size of the register area. If=20
>>>> your last register is at address 0x12c and there's nothing above,=20
>>>> then the size in DTS should be 0x130.
>>>  If I look into some .dtsi it is sometimes that way but sometimes=20
>>> not. There seems to be no consistent rule.
>>>  So does this mean you allow me to modify jz4740.dtsi, jz4770.dtsi=20
>>> and jz4725b.dtsi as well (as mentioned above: this is beyond the=20
>>> scope of my project)?
>>=20
>>  You could update them if you wanted to, but there is no need to do=20
>> it here.
>=20
> Hm. Then we are changing the .max_register initialization to a much=20
> bigger value.
>=20
>>=20
>>>>>  But here are good news:
>>>>>  I have a simpler and less invasive proposal. We keep the=20
>>>>> devm_regmap_init_mmio code as is and just increase its=20
>>>>> .max_register from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when=20
>>>>> introducing the jz4780. This wastes a handful bytes for all=20
>>>>> non-jz4780 chips but less than using the DTS memory region size.=20
>>>>> And is less code (no entry in soc_info tables, no modifyable=20
>>>>> copy) and faster code execution than all other proposals.
>>>>>  This is then just a single-line change when introducing the=20
>>>>> jz4780. And no "preparation for adding jz4780" patch is needed at=20
>>>>> all. No patch to split out for separate review.
>>>>>  Let's go this way to get it eventually finalized. Ok?
>>>>  No.
>>>  Look friend, if you explain your "no" and what is wrong with my=20
>>> arguments, it helps to understand your decisions and learn=20
>>> something from them. A plain "no" does not help anyone.
>>=20
>>  I answered just "no" because I felt like I explained already what I=20
>> wanted to see in the previous email.
>>=20
>>  By using a huge number as the .max_register, we do *not* waste=20
>> additional memory. Computing the value of the .max_register field=20
>> does not add any overhead, either.
>>=20
>>  The .max_register is only used for boundary checking. To make sure=20
>> that you're not calling regmap_write() with an invalid register.=20
>> That's all there is to it.
>=20
> Ah, now I understand our disconnect. So far I have used regmaps=20
> mainly for i2c devices and there is caching to avoid redundant i2c=20
> traffic...
>=20
> So I just assumed wrongly that the regmap driver also allocates some=20
> buffer/cache here. Although it does not initialize .cache_type=20
> (default: REGCACHE_NONE).
>=20
>>=20
>>>  So to summarize: if you prefer something which I consider worse,=20
>>> it is ok for me... In the end you are right - you are the=20
>>> maintainer, not me. So you have to live with your proposals.
>>>  Therefore, I have prepared new variants so you can choose which=20
>>> one is easier to maintain for you.
>>>  Note that they are both preparing for full jz4780-lcdc/hdmi=20
>>> support but in very different ways:
>>>  Variant 1 already adds some jz4780 stuff while Variant 2 just=20
>>> prepares for it.
>>>  Variant 2 is not tested (except to compile). So it needs some=20
>>> Tested-by: from someone with access to hardware. IMHO it is more=20
>>> invasive.
>>>  And don't forget: DTB could be in ROM or be provided by a separate=20
>>> bootloader... So we should not change it too often (I had such=20
>>> discussions some years ago with maintainers when I thought it is=20
>>> easier to change DTS instead of code).
>>>  Variant 3 would be to not separate this. As proposed in [PATCH v5=20
>>> 2/7].
>>>  (Finally, a Variant 3b would be to combine the simple change from=20
>>> Variant 1 with Variant 3).
>>>  So what is your choice?
>>=20
>>  Variant 4: the variant #2 without the changes to the DTSI files.
>=20
> Hm. If there is no cache and we can safely remove tight boundary=20
> checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing DTSI)=20
> why do we still need the max_register calculation from DTSI=20
> specifically for jz4780 and at all?

It's better to have the .max_register actually set to the proper value.=20
Then reading the registers from debugfs (/sys/kernel/debug/regmap/)=20
will print the actual list of registers without bogus values. If=20
.max_register is set too high, it will end up reading outside the=20
registers area. On Ingenic SoCs such reads just return 0, but on some=20
other SoCs it can lock up the system.

So the best way forward is to have .max_register computed from the=20
register area's size, and fix the DTSI with the proper sizes. Since=20
your JZ4780 code needs to update .max_register anyway it's a good=20
moment to add this patch, and the DTSI files can be fixed later (by me=20
or whoever is up to the task).

Fixing the DTS is not a problem in any way, btw. We just need to ensure=20
that the drivers still work with old DTB files, which will be the case=20
here.

-Paul

> So what about:
>=20
> Variant 5: set .max_register =3D 0x1800, i.e. "big enough for everyone"=20
> (includes z4780 gamma and vee registers) + no DTSI changes (+ no=20
> jz4780 register constants like Variant 1)
>=20
> + no DTSI changes
> + no calculation from DTSI needed
> + single separate patch to prepare for jz4780 but not included in=20
> jz4780 patch
>=20
> BR and thanks,
> Nikolaus
>=20
>=20


