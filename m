Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBF7E723D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616010E8F7;
	Thu,  9 Nov 2023 19:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AFC10E8F7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 19:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89D1160D14;
 Thu,  9 Nov 2023 19:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F579C433C7;
 Thu,  9 Nov 2023 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699557753;
 bh=omrfxaa+J/5nWgwxOCEybAtDNlYVqN5puZowfEYsMSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YUeOjbHTod/exJRIzEO3Bc/EhP4cF4eBTgn1g7kTB0rpx5kqwcGVWt0RytI4KLnXh
 1APpsJe+a4/cr3mx7h7Uz1sxSfi3zFttR3D3cEAVA9q9NABSLncSenV2qHokN/JHUw
 gSDuYGjsG20CsTuJHqTtJrjS8lAkFUYCOUPtMH74/cndN/Cb2eOWLWNH3WMJ/zkDst
 Ayxcaa1lS5giHEtUhvmFVbQH4ZvllDtHkIcDRGrH0IrY+vl1v+qchyi4vOJamPRCCL
 5nqo52Z79ZMrWF/cdVmgNFZAf2rnclaOYArtQYoa3ajhP1rHjT5sn19VZkI8hrAyl3
 ox1+KO4roURAQ==
Date: Thu, 9 Nov 2023 20:22:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Message-ID: <ZU0xdeMX7g856J81@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W725bfiX4yCK58gL"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--W725bfiX4yCK58gL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 11:43:29AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.

I am fine that you take it once all review comments are addressed. Given
that:

Acked-by: Wolfram Sang <wsa@kernel.org>


--W725bfiX4yCK58gL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVNMXUACgkQFA3kzBSg
Kbay9g//eXyEFLH18ObMaht1tYo+nQsZvUuCog4jMbrdmYAYGKemdGIdx9SYI5tz
O8iW5KlaMLIKzUgzCpBLz6RDj18NG3D+MRTVThCprfw7snkHBj/34WRhtzC2LodT
vZ4vxmCILUOJBZv8p1qdNkeTEHg9O1KiqBlldgEbns/vx5fYloMFBVwmFQygzpqa
HoZz31DZ0p3V09kpaHoN4Wccv9VxT9vqFxsxsfzsXOoxlQuFTIr/szokmb2Or2N/
IyjXeWc5XgS9Y+39ti58bW5dCMNaCy4B6VZTQi8eymjIZDAxb+P1Ljp7r8tFuc8p
sVFUwmY5m0iELY9GSvqzCQeX16pzj/Jmg7hXNY8+JqGjVWBrPCXjgpr80e17tdeN
4ESfEK5Rc/8EYZ7djg8DTaTM/gVS8A5tAbsQL4v4NUkIodzyJoZBYfAJ5DNKmUTG
+LuOhGjv8Ut1sdc/v2Mm2Nwz3L+J3Gixde0B9UmPIJ4gTQ56f/Q45wBaBuGAkD5n
jIGqmIxgC1dg0M5hWoj/AC5WjYBtOMaKhK+FStBH9YuyvekZYq9v/0xFTnvl2emq
iQ+bcHzNwIVk0NDGhVU3xUARyiRFZRJTYEjNe2gcTtBczA423vOOkPvyNou9hgXw
uRQYM46Y2STJ5a4NuIcaLNyvbQNWa+LlKaohyW/FxFXW1tF9Z40=
=0tv7
-----END PGP SIGNATURE-----

--W725bfiX4yCK58gL--
