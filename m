Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B27492C49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 18:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56710E3CF;
	Tue, 18 Jan 2022 17:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F310E3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1642526043;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=cyrnWGrJvs1dfpSyQh55Z5OJ2Bhw4Ju474fu1zFZejw=;
 b=Q5E65ZMtmZAgQzC8pyRy9ZHHRKQWAfPr7bnZ+6jdlifTttPjZzfMX48YdBvvo2rEkm
 f53tawNNym34PyIu9Hz/DpG/yhCvMqzVNuV8c80MGrZQS425VUtQ2C63GHej3Lcn3luf
 TvS35jJPTQQ+xvDJ+nCo8RbIAz+mwfx5CKSaxmerXJQ6k6GlpHumCvnmA/gEdj5AlNag
 Brje1imq8At/Uv1T1XhRoygUXNc4V30URBXcxTF5GGLDn6RZ5IN96M2eS38Cbe33Cdnc
 exoeuGEebqseG01QR1gbWirZgh9L5CJbCJxeqoZDJP7hwufii0LbVnq/A8lEi/2roZhe
 egKw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMITlA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.37.6 DYNA|AUTH)
 with ESMTPSA id D61423y0IHE1hsP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 18 Jan 2022 18:14:01 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <AI0X5R.YWIZO63QXTF4@crapouillou.net>
Date: Tue, 18 Jan 2022 18:14:00 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E2787F5-8080-4F6C-8843-4C5D49462AD0@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <5BC61397-AF28-45CD-83F6-FA2C760F3995@goldelico.com>
 <C846BAFB-473D-41D8-93B9-B9ECDD1846C1@goldelico.com>
 <AI0X5R.YWIZO63QXTF4@crapouillou.net>
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
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 18.01.2022 um 17:58 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., janv. 18 2022 at 15:50:01 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>> any insights on the JZ_REG_LCD_OSDC issue below?
>=20
> Sorry, I missed your previous email. I blame the holidays ;)

No problem... We all had deserved them.

>=20
>> There is a second, unrelated issue with the introduction of
>> "drm/bridge: display-connector: implement bus fmts callbacks"
>> which breaks bus format negotiations.
>> These are the two last unsolved issues to submit a fully working =
driver.
>>> Am 22.12.2021 um 15:03 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>> Am 08.11.2021 um 10:37 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>> Hi Nikolaus,
>>>> Le dim., nov. 7 2021 at 21:25:38 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>>> Hi Paul,
>>>>>>>>> @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct =
device *dev, bool has_components)
>>>>>>>>> 	/* Enable OSD if available */
>>>>>>>>> 	if (soc_info->has_osd)
>>>>>>>>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>>>>>>>>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>>>>>>>> This change is unrelated to this patch, and I'm not even sure =
it's a valid change. The driver shouldn't rely on previous register =
values.
>>>>>>> I think I already commented that I think the driver should also =
not reset
>>>>>>> previous register values to zero.
>>>>>> You did comment this, yes, but I don't agree. The driver *should* =
reset the registers to zero. It should *not* have to rely on whatever =
was configured before.
>>>>>> Even if I did agree, this is a functional change unrelated to =
JZ4780 support, so it would have to be splitted to its own patch.
>>>>> Well it is in preparation of setting more bits that are only =
available for the jz4780.
>>>>> But it will be splitted into its own patch for other reasons - if =
we ever make osd working...
>>>>>>> If I counted correctly this register has 18 bits which seem to =
include
>>>>>>> some interrupt masks (which could be initialized somewhere else) =
and we
>>>>>>> write a constant 0x1.
>>>>>>> Of course most other bits are clearly OSD related (alpha =
blending),
>>>>>>> i.e. they can have any value (incl. 0) if OSD is disabled. But =
here we
>>>>>>> enable it. I think there may be missing some setting for the =
other bits.
>>>>>>> So are you sure, that we can unconditionally reset *all* bits
>>>>>>> except JZ_LCD_OSDC_OSDEN for the jz4780?
>>>>>>> Well I have no experience with OSD being enabled at all. I.e. I =
have no
>>>>>>> test scenario.
>>> It turns out that the line
>>> 		ret =3D clk_prepare_enable(priv->lcd_clk);
>>> initializes JZ_REG_LCD_OSDC to 0x00010005 (i.e. printk tells 0x0 =
before).
>> more detailled test shows that it is the underlying
>> 	clk_enable(priv->lcd_clk)
>> (i.e. not the prepare).
>>> and writing
>>> 		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>>> overwrites it with 0x00000001.
>>> This makes the HDMI monitor go/stay black until I write manually 0x5 =
to
>>> JZ_REG_LCD_OSDC.
>>> This means that JZ_LCD_OSDC_ALPHAEN must be enabled on jz4780 as =
well.
>>> Hence overwriting just with JZ_LCD_OSDC_OSDEN breaks it.
>>> Now the questions:
>>> a) 0x5 is understandable that it sets JZ_LCD_OSDC_ALPHAEN - but why =
is it needed?
>>>   Is this a not well documented difference between jz4740/60/70/80?
>>> b) how can clk_prepare_enable() write 0x00010005 to JZ_REG_LCD_OSDC? =
Bug or feature?
>>>   Something in cgu driver going wrong?
>> I now suspect that it is an undocumented SoC feature.
>=20
> Not at all. If the clock is disabled, the LCD controller is disabled, =
so all the registers read zero, this makes sense. You can only read the =
registers when the clock is enabled. On some SoCs, reading disabled =
registers can even cause a complete lockup.

This is the right answer to the wrong question :)
The question is why the register becomes 0x10005 as soon as the clock is =
enabled. Without writing to it.  And contrary to the documented reset =
state.
Or are you aware that u-boot initialized the lcdc and clocks get =
disabled when/during starting the kernel (I am using the good old =
v2013.10)?
That could be an explanation that we read 0 before the clock is enabled =
and 0x10005 after.

> Why is this JZ_LCD_OSDC_ALPHAEN bit needed now? I remember it working =
fine last time I tried, and now I indeed get a black screen unless this =
bit is set. The PM doesn't make it obvious that the bit is required,

exactly.

> but that wouldn't be surprising.
>=20
> Anyway, feel free to send a patch to fix it (with a Fixes: tag). =
Ideally something like this:
>=20
> u32 osdc =3D 0;
> ...
> if (soc_info->has_osd)
>   osdc |=3D JZ_LCD_OSDC_OSDEN;
> if (soc_info->has_alpha)
>   osdc |=3D JZ_LCD_OSDC_ALPHAEN;
> regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);

Looks good to me. I'll give it a try.

>=20
> This also ensures that the OSDC register is properly initialized in =
the !has_osd case. The driver shouldn't rely on pre-boot values in the =
registers.

Ok. Not all SoC have osd.

BR and thanks,
Nikolaus=
