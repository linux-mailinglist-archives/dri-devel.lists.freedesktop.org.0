Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A5598284
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 13:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28559D0EF1;
	Thu, 18 Aug 2022 11:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28A4D0DF2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 11:54:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB2A9B81FC7;
 Thu, 18 Aug 2022 11:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB17C433C1;
 Thu, 18 Aug 2022 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660823673;
 bh=OOp4XCPaOSFAdQWQdL7x7S/vwQa/o7fKz+ynmdHyLg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DV2MuYBkRWWKa0Rs0voJoSLDxQUKzzOSYe//JgzHbHdSieYD7vWcHpu2Q8LoPSaI3
 FnZqOspjyW2rNi6V6qpw1SQK2+fwaxpAGvK2k4+LSD9O3ZLiUXeoCq1F54Jjv3OeOF
 NYuTsRPKmmWPX6JVM3bvHxW6aOcu6+OoZgK9EhnW/YuvhBAMoICkRcaP0kJBFre+Dm
 JMxHe1yocZDaGtIZwU2vsmxf55iLt12gUUG2tjGMk5a7ko/bARUZAV7vcn5ZTVqOja
 21TqUfUXsYqq0IH+tl6Opvtn5sB38Fu5rm0QFGx7bKdL0fLyrkFSOyysCuQRPZCgdU
 IeQpBLkC3FoHA==
Date: Thu, 18 Aug 2022 12:54:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <Yv4obo9MUw+Lc+nr@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MKmYY9GsmMLl3nVC"
Content-Disposition: inline
In-Reply-To: <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
X-Cookie: Logic is the chastity belt of the mind!
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--MKmYY9GsmMLl3nVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 18, 2022 at 02:33:53PM +0300, Matti Vaittinen wrote:
> On 8/15/22 18:44, Mark Brown wrote:

> > [2/7] regulator: Add devm helpers for get and enable
> >        (no commit info)

> I was planning to send out the v3 (where IIO patches are no longer squashed
> into one). I didn't spot the above mentioned patch 2/7 from
> regulator/for-next. I'd just like to get confirmation the 2/7 was not merged
> even though it's mentioned in this mail before re-spinning the series with
> it.

It's not there yet (that's the "no commit info"), but it is queued for
today.

--MKmYY9GsmMLl3nVC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL+KG4ACgkQJNaLcl1U
h9ChKgf+MqQYNLGgZ/WEAylHrK/Uzrw+LnjUXAyMBb/vZjdl3DVYOv+/LtcGpk2B
vMl+H2cT2aA3eF56DroX4dIyRauM8a7w9PNeqKCTRYzdeJ91Vp1q0gOUIbKHxfmu
LJkxtl3b2n7/O7J+OrJ1HljR3z2JxBD4lmqH4+vKKMNwPIh0fn5GAbg8/O2M0yv5
NEJYI6TxlO4FG1bncptZI3H7tlGjV+MAYgemtJlJnLkpiS3OaOfTS6QeDAtgI0QE
oU6UoQtU2ZSP0W/dlLys3zAGz2wI7/vlprZAeabP2UyUWDIRlRN8GjTI/YkwClpr
VsgNrCyAZbv1afHLckm3stj8/Czk8Q==
=mvEp
-----END PGP SIGNATURE-----

--MKmYY9GsmMLl3nVC--
