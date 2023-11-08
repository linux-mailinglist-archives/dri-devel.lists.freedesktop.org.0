Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510C7E57CA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF5C10E752;
	Wed,  8 Nov 2023 13:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578FA10E752
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0B0B6B818EB;
 Wed,  8 Nov 2023 13:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAAEC433C8;
 Wed,  8 Nov 2023 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448838;
 bh=oi5w46XUUj+5eCHt5HUP0e7A7OgjsfNv+uqws1harcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USgbXuQE+ahS0wMNzK3GZRWrt2o4EadreHpU54UrkxxsZTTz0+LAe6fX8RvlykKp3
 GnmJtzyZD1B5KT90EnuOrpS45Wn4Ug2QUbGzOlIaMw4h8TYxXniEVURlDAPEFofnAA
 iULsGnxGgZ2r3S/txUvuyAC4NfimqV7S5ugviXvv/bC9zlMCTAI9ifoFUl0qap50eK
 8xnqTE2LkaSAP45eLgiKG3jc+Tl0L9OlmfUcmBV78/c8SmRpnZH7a47rwrNZWy6prh
 1BOu/wADh/rVR70guv/oGFc/pjZ9rrdvWZkVYr2T0XYKkEeW2YWOsyGVWaKdWKHEcO
 jUDvq/YygN9Fw==
Date: Wed, 8 Nov 2023 13:07:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <ZUuIAihzcOqkVsWG@finisterre.sirena.org.uk>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X+QegD6ebh8cp8W3"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
X-Cookie: Slow day.  Practice crawling.
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--X+QegD6ebh8cp8W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 08, 2023 at 11:43:37AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:

Acked-by: Mark Brown <broonie@kernel.org>

--X+QegD6ebh8cp8W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVLh/wACgkQJNaLcl1U
h9D+/Af+MyEPu0I4eqVGYfK3Bo/6Rvq3LXEhL2x1vksJCKJjNwBBvQHqRWRTBZXL
VEhtg6O887bE4a7Hy4RErRnb978JM4kG0mM4qBPhwgv9YoqD9Ymr7jFfp8dRru28
hGY35dYXNXlC3LMJ1CdSVnubfo0QPHIzRYwWO4xpz0/BqNtsJlELPaU2s1q0wDHO
v/nMVrIE3Xzjp4iQEXcyfZa4k73XOYHmSqxR0H9xiDayBgMuUkypOeDs/qGpO+mW
Bp4IbvvgVJr9ifLmpCMlZWSQryHbiOR3cpJHR6Tb3UhjJKUgccQLyGHgBfAgiSqJ
x6Tc2OIcYB5l2yn9+JONwgLPLMiALg==
=Ypqx
-----END PGP SIGNATURE-----

--X+QegD6ebh8cp8W3--
