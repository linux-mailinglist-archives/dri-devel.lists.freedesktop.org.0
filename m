Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72B44B416
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BDF89AAD;
	Tue,  9 Nov 2021 20:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0639F89B27
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:36:23 +0000 (UTC)
Date: Tue, 09 Nov 2021 20:36:06 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <6WNB2R.GJ2KT1BB7QOY1@crapouillou.net>
In-Reply-To: <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
 <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
 <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
 <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
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

Hi Nikolaus,

Le mar., nov. 9 2021 at 21:19:17 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 07.11.2021 um 20:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>>  6. Therefore I think it *may* work overclocked with 48MHz
>>>  but is not guaranteed or reliable above 27 MHz.
>>>  So everything is ok here.
>>=20
>>  One thing though - the "assigned-clocks" and=20
>> "assigned-clock-rates", while it works here, should be moved to the=20
>> CGU node, to respect the YAML schemas.
>=20
> Trying to do this seems to break boot.
>=20
> I can boot up to
>=20
> [    8.312926] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare=20
> HDMI I2C bus driver
>=20
> and
>=20
> [   11.366899] [drm] Initialized ingenic-drm 1.1.0 20200716 for=20
> 13050000.lcdc0 on minor 0
>=20
> but then the boot process becomes slow and hangs. Last sign of=20
> activity is
>=20
> [   19.347659] hub 1-0:1.0: USB hub found
> [   19.353478] hub 1-0:1.0: 1 port detected
> [   32.321760] wlan0_power: disabling
>=20
> What I did was to just move
>=20
> 		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
> 		assigned-clock-rates =3D <27000000>;
>=20
> from
>=20
> 	hdmi: hdmi@10180000 {
>=20
> to
>=20
> 	cgu: jz4780-cgu@10000000 {
>=20
> Does this mean the clock is assigned too early or too late?
>=20
> Do you have any suggestions since I don't know the details of CGU.

These properties are already set for the CGU node in ci20.dts:

&cgu {
	/*
	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
	 * precision.
	 */
	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>;
	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>;
	assigned-clock-rates =3D <48000000>;
};

So you want to update these properties to add the HDMI clock setting,=20
like this:

	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>,=20
<&cgu JZ4780_CLK_HDMI>;
	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>;
	assigned-clock-rates =3D <48000000>, <0>, <27000000>;

Cheers,
-Paul


