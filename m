Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A244751B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 20:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341686E1F7;
	Sun,  7 Nov 2021 19:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7536E1F7
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 19:05:49 +0000 (UTC)
Date: Sun, 07 Nov 2021 19:05:35 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
In-Reply-To: <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
 <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
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
 Kees Cook <keescook@chromium.org>, Jon as Karlman <jonas@kwiboo.se>,
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

Hi,

Le dim., nov. 7 2021 at 14:45:37 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 05.10.2021 um 23:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Paul,
>>=20
>>  Le mar., oct. 5 2021 at 23:44:12 +0200, Paul Boddie=20
>> <paul@boddie.org.uk> a =E9crit :
>>>  On Tuesday, 5 October 2021 22:50:12 CEST Paul Cercueil wrote:
>>>>  Hi Nikolaus & Paul,
>>>>  Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller
>>>  <hns@goldelico.com> a =E9crit :
>>>>  >
>>>>  > diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > index 9e34f433b9b5..c3c18a59c377 100644
>>>>  > --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
>>>>  >
>>>>  >  		status =3D "disabled";
>>>>  >
>>>>  >  	};
>>>>  >
>>>>  > +	hdmi: hdmi@10180000 {
>>>>  > +		compatible =3D "ingenic,jz4780-dw-hdmi";
>>>>  > +		reg =3D <0x10180000 0x8000>;
>>>>  > +		reg-io-width =3D <4>;
>>>>  > +
>>>>  > +		clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>>>>  > +		clock-names =3D "iahb", "isfr";
>>>>  > +
>>>>  > +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
>>>>  > +		assigned-clock-rates =3D <27000000>;
>>>>  Any reason why this is set to 27 MHz? Is it even required?=20
>>>> Because with
>>>>  the current ci20.dts, it won't be clocked at anything but 48 MHz.
>>>  EXCLK will be 48MHz, but the aim is to set the HDMI peripheral=20
>>> clock to 27MHz,
>>>  which is supposedly required. I vaguely recall a conversation=20
>>> about whether we
>>>  were doing this right, but I don't recall any conclusion.
>>=20
>>  But right now your HDMI clock is 48 MHz and HDMI works.
>=20
> Is it? How did you find out?
>=20
> And have you tried to remove assigned-clocks from jz4780.dtsi?
>=20
> 1. I read back:
>=20
> root@letux:~# cat /sys/kernel/debug/clk/hdmi/clk_rate
> 26909090
> root@letux:~#
>=20
> So for me it seems to be running at ~27 MHz.
>=20
> 2. If I remove the assigned-clocks or assigned-clock-rates from DT
> the boot process hangs shortly after initializing drm.
>=20
> 3. If I set assigned-clock-rates =3D <48000000>, HDMI also works.
>=20
> I get it read back from /sys/kernel/debug/clk/hdmi/clk_rate
> of 46736842.
>=20
> 4. Conclusions:
> * assigned-clocks are required
> * it does not matter if 27 or 48 MHz
> * I have no idea which value is more correct
> * so I'd stay on the safe side of 27 MHz
>=20
> 5. But despite that found, please look into the programming
> manual section 18.1.2.16. There is an
>=20
> "Import Note: The clock must be between 18M and 27M, it occurs
> fatal error if exceeding the range. "

Ok, that's the important information that was missing.

So 27 MHz is OK.

> 6. Therefore I think it *may* work overclocked with 48MHz
> but is not guaranteed or reliable above 27 MHz.
>=20
> So everything is ok here.

One thing though - the "assigned-clocks" and "assigned-clock-rates",=20
while it works here, should be moved to the CGU node, to respect the=20
YAML schemas.

Cheers,
-Paul

>=20
>>=20
>>>>  > +
>>>>  > +		interrupt-parent =3D <&intc>;
>>>>  > +		interrupts =3D <3>;
>>>>  > +
>>>>  > +		/* ddc-i2c-bus =3D <&i2c4>; */
>>>>  > +
>>>>  > +		status =3D "disabled";
>>>>  > +	};
>>>>  > +
>>>>  > +	lcdc0: lcdc0@13050000 {
>>>>  > +		compatible =3D "ingenic,jz4780-lcd";
>>>>  > +		reg =3D <0x13050000 0x1800>;
>>>>  > +
>>>>  > +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
>>>>  > +		clock-names =3D "lcd", "lcd_pclk";
>>>>  > +
>>>>  > +		interrupt-parent =3D <&intc>;
>>>>  > +		interrupts =3D <31>;
>>>>  > +
>>>>  > +		status =3D "disabled";
>>>>  I think you can keep lcdc0 enabled by default (not lcdc1 though),=20
>>>> since
>>>>  it is highly likely that you'd want that.
>>>  As far as I know, the clock gating for the LCD controllers acts=20
>>> like a series
>>>  circuit, meaning that they both need to be enabled. Some testing=20
>>> seemed to
>>>  confirm this. Indeed, I seem to remember only enabling one clock=20
>>> and not
>>>  getting any output until I figured this weird arrangement out.
>>=20
>>  I'm not talking about clocks though, but about LCDC0 and LCDC1.
>=20
> Ah, you mean status =3D "okay"; vs. status =3D "disabled";
>=20
> Well, IMHO it is common practise to keep SoC subsystems disabled by
> default (to save power and boot time) unless a board specific DTS=20
> explicitly
> requests the SoC feature to be active. See for example mmc0, mmc1 or=20
> i2c0..i2c4.
>=20
> All these are disabled in jz4780.dtsi and partially enabled in=20
> ci20.dts.
>=20
> Why should lcdc0 be an exception in jz4780.dtsi?
>=20
> BR and thanks,
> Nikolaus
>=20


