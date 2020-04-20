Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BC1B1191
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 18:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8966E5BD;
	Mon, 20 Apr 2020 16:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FC966E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 16:28:07 +0000 (UTC)
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
 by pokefinder.org (Postfix) with ESMTPSA id DF97D2C1F58;
 Mon, 20 Apr 2020 18:28:06 +0200 (CEST)
Date: Mon, 20 Apr 2020 18:28:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200420162806.GB3721@ninjato>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============1159275934=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1159275934==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 07:55:49PM -0500, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>=20
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Same preamble for my ack as in patch 1:

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6dzZYACgkQFA3kzBSg
KbZHYg//W5YxCeazbDM94E6YBsxW12FqWEDS34r8khleoxdl3PUw+iNq6ZW20vVf
iukBEN6kySmVQjCoT4FHxxZSd3MuOxISlT7jpTr1qlWZAYjKBQ2hreJ53IoSwac5
KLqfatKLSIIDvnPPOrvqqVOLCD998wpaLJlfoXiIPNwnaU7j+nB0lFjsv5gA+eeN
jKUFY8cv0b3pY9aUhatVnodM421EWf9pH5K6hkhbxhtS2E/Sb+zw4v6ewUuxnMIH
rJxcdnWBUtqDh26y7ezSSLNUgU7TDYnuT3v5Zi8m7HaZ1npdGb5EJwg7Jvr5yi2k
qBeYtB5Ed9+IjPit/Y1GLJamCVdohdPxiPCzdqr5iSdH3+DsbmWJjxN7NjfJvnGu
M5wmk4m3pSEcYGy7cRZQPzv2AjHPYgqxJIxBzXpejNT1U0BJpJEKXqDAJrRGBBOR
Mb16mCEDGZZxw+m1DN6gftPiLMRFaqYgjkkdEMma9EbW2Of7y9gzdYqRU5HyaiBM
WB3yUbcoM9ySLCQHX75Xg7UsLzVw2N5SA24diMdKPGhUfEpSgZ+DtlJZ3h4o4fos
GC6i6hC0shFUcpoZM9XQs+ZhJ38/bfRxOqdy/K4Ali+0G7PZzf5/4fcyi7TvG7wc
qXAYGaxFehFemV8oQZxLxFtvQYlCom+MLAVEbzF4P/9hI9PlcZk=
=3u/Q
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--

--===============1159275934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1159275934==--
