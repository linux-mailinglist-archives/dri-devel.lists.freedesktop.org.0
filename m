Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2544731C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 14:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690896E192;
	Sun,  7 Nov 2021 13:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791F6E192
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636292738;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IUc2QJfZvKVpNPLQO06V15aBwBXtE3TaY9v9c4KrZsM=;
 b=fqLzXb2UhysqRDNzD+S2Zk+/MroOToOZvONeUoHdL6Rz3bvRrcp8MugsYf2DJZseIy
 pZtVfccDMOcNmS/UHbz8Ad4+N4objU7P/umYVohzmQjVhXYqOfyKK6mmu50MGaTxsV5g
 s6BjUUecIKnZqmqPx1f+kVKRAO9CSM+l55uMxaNyUseep29yQs2rwpRODEt5pZ1eWyS6
 fwHOO4r3ry2q0aYUc6oYnSVPhVtCAY9zI8+ZAG9z8LoO9fIp7D2MDRWji4qKlt5gwPWH
 ZCKBlG9KiONzEKmQR6FtJIgIw41OjTtsnw2zS0+8hyG7ltSEm5C9r6pjfmIhi/W52JnA
 iMkw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA7DjcFoL
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 7 Nov 2021 14:45:38 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
Date: Sun, 7 Nov 2021 14:45:37 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jon as Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 05.10.2021 um 23:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Paul,
>=20
> Le mar., oct. 5 2021 at 23:44:12 +0200, Paul Boddie =
<paul@boddie.org.uk> a =C3=A9crit :
>> On Tuesday, 5 October 2021 22:50:12 CEST Paul Cercueil wrote:
>>> Hi Nikolaus & Paul,
>>> Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller
>> <hns@goldelico.com> a =C3=A9crit :
>>> >
>>> > diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> > b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> > index 9e34f433b9b5..c3c18a59c377 100644
>>> > --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> > +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> > @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
>>> >
>>> >  		status =3D "disabled";
>>> >
>>> >  	};
>>> >
>>> > +	hdmi: hdmi@10180000 {
>>> > +		compatible =3D "ingenic,jz4780-dw-hdmi";
>>> > +		reg =3D <0x10180000 0x8000>;
>>> > +		reg-io-width =3D <4>;
>>> > +
>>> > +		clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu =
JZ4780_CLK_HDMI>;
>>> > +		clock-names =3D "iahb", "isfr";
>>> > +
>>> > +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
>>> > +		assigned-clock-rates =3D <27000000>;
>>> Any reason why this is set to 27 MHz? Is it even required? Because =
with
>>> the current ci20.dts, it won't be clocked at anything but 48 MHz.
>> EXCLK will be 48MHz, but the aim is to set the HDMI peripheral clock =
to 27MHz,
>> which is supposedly required. I vaguely recall a conversation about =
whether we
>> were doing this right, but I don't recall any conclusion.
>=20
> But right now your HDMI clock is 48 MHz and HDMI works.

Is it? How did you find out?

And have you tried to remove assigned-clocks from jz4780.dtsi?

1. I read back:

root@letux:~# cat /sys/kernel/debug/clk/hdmi/clk_rate
26909090
root@letux:~#=20

So for me it seems to be running at ~27 MHz.

2. If I remove the assigned-clocks or assigned-clock-rates from DT
the boot process hangs shortly after initializing drm.

3. If I set assigned-clock-rates =3D <48000000>, HDMI also works.

I get it read back from /sys/kernel/debug/clk/hdmi/clk_rate
of 46736842.

4. Conclusions:
* assigned-clocks are required
* it does not matter if 27 or 48 MHz
* I have no idea which value is more correct
* so I'd stay on the safe side of 27 MHz

5. But despite that found, please look into the programming
manual section 18.1.2.16. There is an

"Import Note: The clock must be between 18M and 27M, it occurs
fatal error if exceeding the range. "

6. Therefore I think it *may* work overclocked with 48MHz
but is not guaranteed or reliable above 27 MHz.

So everything is ok here.

>=20
>>> > +
>>> > +		interrupt-parent =3D <&intc>;
>>> > +		interrupts =3D <3>;
>>> > +
>>> > +		/* ddc-i2c-bus =3D <&i2c4>; */
>>> > +
>>> > +		status =3D "disabled";
>>> > +	};
>>> > +
>>> > +	lcdc0: lcdc0@13050000 {
>>> > +		compatible =3D "ingenic,jz4780-lcd";
>>> > +		reg =3D <0x13050000 0x1800>;
>>> > +
>>> > +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu =
JZ4780_CLK_LCD0PIXCLK>;
>>> > +		clock-names =3D "lcd", "lcd_pclk";
>>> > +
>>> > +		interrupt-parent =3D <&intc>;
>>> > +		interrupts =3D <31>;
>>> > +
>>> > +		status =3D "disabled";
>>> I think you can keep lcdc0 enabled by default (not lcdc1 though), =
since
>>> it is highly likely that you'd want that.
>> As far as I know, the clock gating for the LCD controllers acts like =
a series
>> circuit, meaning that they both need to be enabled. Some testing =
seemed to
>> confirm this. Indeed, I seem to remember only enabling one clock and =
not
>> getting any output until I figured this weird arrangement out.
>=20
> I'm not talking about clocks though, but about LCDC0 and LCDC1.

Ah, you mean status =3D "okay"; vs. status =3D "disabled";

Well, IMHO it is common practise to keep SoC subsystems disabled by
default (to save power and boot time) unless a board specific DTS =
explicitly
requests the SoC feature to be active. See for example mmc0, mmc1 or =
i2c0..i2c4.

All these are disabled in jz4780.dtsi and partially enabled in ci20.dts.

Why should lcdc0 be an exception in jz4780.dtsi?

BR and thanks,
Nikolaus

