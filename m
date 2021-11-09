Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71D44B3D5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA59C6E029;
	Tue,  9 Nov 2021 20:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025116E029
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636489159;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=JxqM8I/z35C5+6J2ZygkF2pjyw7aqUpyOwISg707hYI=;
 b=P4Q/O7R+6NMMrAlpZFc7SF8DTNcYUMrpfKvHu32CezOknO1/Yo3Iu2tZJRnS+B6797
 76Ib13MWNlnm3EMFJNL6+52AE4zRb0dQk3vI7FuUH7PpE4G/5iJKdR1zgUmly5toHPYt
 WpTZh+y/F854ldxMHS1w1pphUwbZrRs7lxq5KjUdeBq9uoS8gv6VuMH1QzTQ0Up9B/tb
 LsO+WBhZEYSz7IMIuHEkewh4vZVYNysaKyWP3OB4cZtp84qHRbfXjv1lFEbB4oTyP37T
 dpbgYNVlCNj/DN1H9+nsVOQ4piaKfjU+96mmNhQLO4J9q35XkcpvMewwjw4HOZjPA5LZ
 EzEQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8cT6Q=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
 with ESMTPSA id Y02aa4xA9KJI0YI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 9 Nov 2021 21:19:18 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
Date: Tue, 9 Nov 2021 21:19:17 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
 <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
 <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
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

Hi Paul,

> Am 07.11.2021 um 20:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>> 6. Therefore I think it *may* work overclocked with 48MHz
>> but is not guaranteed or reliable above 27 MHz.
>> So everything is ok here.
>=20
> One thing though - the "assigned-clocks" and "assigned-clock-rates", =
while it works here, should be moved to the CGU node, to respect the =
YAML schemas.

Trying to do this seems to break boot.

I can boot up to=20

[    8.312926] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI =
I2C bus driver

and

[   11.366899] [drm] Initialized ingenic-drm 1.1.0 20200716 for =
13050000.lcdc0 on minor 0

but then the boot process becomes slow and hangs. Last sign of activity =
is

[   19.347659] hub 1-0:1.0: USB hub found
[   19.353478] hub 1-0:1.0: 1 port detected
[   32.321760] wlan0_power: disabling

What I did was to just move

		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
		assigned-clock-rates =3D <27000000>;

from

	hdmi: hdmi@10180000 {

to

	cgu: jz4780-cgu@10000000 {

Does this mean the clock is assigned too early or too late?

Do you have any suggestions since I don't know the details of CGU.

BR and thanks,
Nikolaus

