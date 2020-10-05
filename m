Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF22841B8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 22:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555D66E192;
	Mon,  5 Oct 2020 20:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8526E192
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 20:55:48 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-158-146.ewe-ip-backbone.de
 [95.33.158.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E455A212CC;
 Mon,  5 Oct 2020 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601931348;
 bh=RauhoP+lY6PB4M6PjyFmPFjt0my1MIgv0r1A7kpjI2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ee9g6t5xN1OxdKi2wd4UGvlS2s4aCwrZH8Q0UWdDMaCdLHbTCpREEzaNNAQgtyvSN
 N3GB1BEfbo5uuiLy2wYaTx84L3htFNcfAnS/xFvkMPS68jJKIEq5wv+3leXUApvIiC
 KdEECqq7ynbrubFDHIIHw20X7TPtN7Odd0sbpGpQ=
Received: by earth.universe (Postfix, from userid 1000)
 id B9D193C0C87; Mon,  5 Oct 2020 22:55:45 +0200 (CEST)
Date: Mon, 5 Oct 2020 22:55:45 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201005205545.sqvohrh7jpt7w63w@earth.universe>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
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
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============1743513294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1743513294==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7db5qni5yh4rtlce"
Content-Disposition: inline


--7db5qni5yh4rtlce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 05, 2020 at 01:38:30PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  [...]
>  .../devicetree/bindings/power/supply/power-supply.yaml       | 2 ++
>  [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--7db5qni5yh4rtlce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl97iEsACgkQ2O7X88g7
+pr9vg//fpVYpKsaZc4pw203Kmzwve+W4z3OPaQS7g1Y93QHWykKxFYpCgOrbmA7
Ikwy3xwBLfMhPIUs8KZDsiaLVkKTi9XJifhEKiG4Uz772vFOZqAPgskcT6Sx4+iN
4lqd7WmgV3hGelDss8qw6dQ1FY0/MHuMXvoDeNHTvqi0ZhttRrQmOEO6spkWL1io
39Au/Pxbh2dK06Y7Y0qoKlqCKxnL4fWlUjFqJkJI+d4LjK/XYvukOTPmAhEYfP2H
tZ38WZd/3SxwQD+Nh6ZJCfKC54D00G54g+fkxhaiypSSgI1IPWfIsrqPfPnVMowq
wI2fo/C10LMZ1kqUi/LCW+OET8aePRkYjUMWZ2GBNRY9MJCJH/WkOPy7PaKHrOfU
EdJx9OH7guvFWaEJGhClazwYS6QkM8CEKy7Nd5nJTeQOBEg/p2Lb2etNPNq34nju
o9euArIjrnqbHK5X9Ijyvhaqw3bxsVPmPkOGUayDMB44UtwHNFqIosmboJnkJ6bt
BGS1zVnJs2sdLMqMZcCwfHGoX00rThZgvCACDas7fVEdsZgtaEnCW8aySbWCKPdY
1gtR+xdosJheKba+kMxfhmR0nm62rAmJvS9XOZaBY+cveye5NtC3kvk+Al5ixucd
jYmH3Iudn+0hC44ZPGUl49YUa5cwsX8NZlyh8ItyWm/x+WiVyb8=
=9y9P
-----END PGP SIGNATURE-----

--7db5qni5yh4rtlce--

--===============1743513294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1743513294==--
