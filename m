Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10696423314
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 23:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086816EC7D;
	Tue,  5 Oct 2021 21:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1886EC7D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 21:52:51 +0000 (UTC)
Date: Tue, 05 Oct 2021 22:52:35 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To: Paul Boddie <paul@boddie.org.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, Jon as Karlman
 <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Message-Id: <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
In-Reply-To: <3514743.EH6qe8WxYI@jason>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Le mar., oct. 5 2021 at 23:44:12 +0200, Paul Boddie=20
<paul@boddie.org.uk> a =E9crit :
> On Tuesday, 5 October 2021 22:50:12 CEST Paul Cercueil wrote:
>>  Hi Nikolaus & Paul,
>>=20
>>  Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller
> <hns@goldelico.com> a =E9crit :
>>  >
>>  > diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  > b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  > index 9e34f433b9b5..c3c18a59c377 100644
>>  > --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  > +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  > @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
>>  >
>>  >  		status =3D "disabled";
>>  >
>>  >  	};
>>  >
>>  > +	hdmi: hdmi@10180000 {
>>  > +		compatible =3D "ingenic,jz4780-dw-hdmi";
>>  > +		reg =3D <0x10180000 0x8000>;
>>  > +		reg-io-width =3D <4>;
>>  > +
>>  > +		clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>>  > +		clock-names =3D "iahb", "isfr";
>>  > +
>>  > +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
>>  > +		assigned-clock-rates =3D <27000000>;
>>=20
>>  Any reason why this is set to 27 MHz? Is it even required? Because=20
>> with
>>  the current ci20.dts, it won't be clocked at anything but 48 MHz.
>=20
> EXCLK will be 48MHz, but the aim is to set the HDMI peripheral clock=20
> to 27MHz,
> which is supposedly required. I vaguely recall a conversation about=20
> whether we
> were doing this right, but I don't recall any conclusion.

But right now your HDMI clock is 48 MHz and HDMI works.

>>  > +
>>  > +		interrupt-parent =3D <&intc>;
>>  > +		interrupts =3D <3>;
>>  > +
>>  > +		/* ddc-i2c-bus =3D <&i2c4>; */
>>  > +
>>  > +		status =3D "disabled";
>>  > +	};
>>  > +
>>  > +	lcdc0: lcdc0@13050000 {
>>  > +		compatible =3D "ingenic,jz4780-lcd";
>>  > +		reg =3D <0x13050000 0x1800>;
>>  > +
>>  > +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
>>  > +		clock-names =3D "lcd", "lcd_pclk";
>>  > +
>>  > +		interrupt-parent =3D <&intc>;
>>  > +		interrupts =3D <31>;
>>  > +
>>  > +		status =3D "disabled";
>>=20
>>  I think you can keep lcdc0 enabled by default (not lcdc1 though),=20
>> since
>>  it is highly likely that you'd want that.
>=20
> As far as I know, the clock gating for the LCD controllers acts like=20
> a series
> circuit, meaning that they both need to be enabled. Some testing=20
> seemed to
> confirm this. Indeed, I seem to remember only enabling one clock and=20
> not
> getting any output until I figured this weird arrangement out.

I'm not talking about clocks though, but about LCDC0 and LCDC1.

Cheers,
-Paul


