Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56EE595A28
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43E410EF7D;
	Tue, 16 Aug 2022 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7D210E932
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:31:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4779CE17B9;
 Tue, 16 Aug 2022 11:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9B8C433C1;
 Tue, 16 Aug 2022 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660649502;
 bh=DNGxZGCzNE/W9SNa3AOcpRXwEUSzLHawjI4GPUOozEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ibyaO5o/Nr/cFFgJEL7PPVekFs+0Q3USPuDu3QwvW87IXj9cmqYanCsbSmFkhICCI
 /bS/xCmD23/cb+FBxGnzpVz3kjeVAkO2lYjT75WQKNF5axNhVAwouihZTg6FbLvEAY
 J4D9uKaJlitqM9D4ZYgx+VikKjvj7peGJBkuhBXKCVwCi46fJVtOhi63JN8hMrZFCH
 UkfZ0SYPO3LlM1dZqhAEgMC/gX42n3x6mQYJi/OWry/0M9xvDVAnxC5iuOOswm5mZI
 QOIIYWVpSbd9EF5OhCbydJMADpl7C+bCAHQspCqNHYt9riKK17LZaBtj0TiuX1S5h2
 kfxfjwbz6D43A==
Date: Tue, 16 Aug 2022 12:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvuAE0Y3QbAf9Zh/@sirena.org.uk>
References: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
 <YvtzJw3jmocM0JFi@sirena.org.uk>
 <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GRi4H55EvexP+ViS"
Content-Disposition: inline
In-Reply-To: <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
X-Cookie: A bachelor is an unaltared male.
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
 David Airlie <airlied@linux.ie>, Michael Turq uette <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Johan Hovold <johan+linaro@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GRi4H55EvexP+ViS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 11:06:21AM +0000, Vaittinen, Matti wrote:

> I wonder if writing such 'release callbacks' is compulsory? I mean, if I=
=20
> was writing a driver to some new (to me) subsystem and was required to=20
> write an explicit release-callback for a resource - then it'd surely=20
> rang a bell about potentially double freeing stuff with devm. Especially=
=20
> if the doc stated the callback can be called after the driver has been=20
> detached.

Generally yes, thoguh people can and do leave them blank and it's easy
enough to do some cleanup in there that assumes that the device is still
present and not think the device might've gone away especially if the
hardware isn't practically hotpluggable.

--GRi4H55EvexP+ViS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7gBIACgkQJNaLcl1U
h9AzDwf9HyzkouCr6DLxGa2jy+krXW2whkKczGUewYVjLonIovCKJI3OKOOMeqaZ
rggHFUZDlyHpe4f23sQn190TBdngSGLYf1nrOt1WMUf3vCkLA05c7RcsGPCZdlGm
TaL1HglUSxZ6Mce97JyRZ3k3Uw28ImBl0LWx3nunXvOqv6UUjs0cc0NdiGSD3JEA
q7cLUiSYA4BzPVJg8bAXNNgXRdqY08D9aqih79uT+vgmcurosxM9InLGjKWb4xRw
UlVPhgqtHOGKTfgLfNuPG7s+nSv91LUEf43AMjI0HE92IutdyHoYhleNfB5V7kAU
vbqH3vEZToSso212DUSGKfURUbqHBg==
=2bTO
-----END PGP SIGNATURE-----

--GRi4H55EvexP+ViS--
