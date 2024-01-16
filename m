Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBED82F0B5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 15:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1719010E548;
	Tue, 16 Jan 2024 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB2710E548
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 14:41:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5BF2FCE19B0;
 Tue, 16 Jan 2024 14:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82385C433F1;
 Tue, 16 Jan 2024 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705416062;
 bh=pi9f5n7aCz4k4GcDtHhDD5lv5OgeZ4ucYdJWw/uz8rU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eoW8PYM2MfAuIBhKaoTZlWZwOEH64nrarWgh8smz385NHA2AvWbxhu44TZid6guIO
 ztdPcokve4KGk/P0r48xP9LXjdlp+nfRggeFVeFp1EKUfQh1HSmalAz393OHzBH8yx
 HITZr7gQr/eVgLSaMXJ0zK/Hypf/9tgOSbSJiXzjxDaUW1d3OgO9S7G4+/H4mw666+
 L5PksNx2fvrD/Q9/Cn2uOjt9fv52HRvN58krYPnsggJ/tW1Mam7cV3tInWEBTcjzIV
 QhTlg/jUO4g8ofnL8rKCTYV2n5vBGWNCAEmw7Luoyo7bgDS5dKI4oEy8rewQcDvB/c
 CCz+OFltnyGUA==
Date: Tue, 16 Jan 2024 14:40:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/33] spi: get rid of some legacy macros
Message-ID: <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c8yli56mmI+gJGEV"
Content-Disposition: inline
In-Reply-To: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Cookie: Programmers do it bit by bit.
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ronald Wahl <ronald.wahl@raritan.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, libertas-dev@lists.infradead.org,
 Javier Martinez Canillas <javierm@redhat.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel@pengutronix.de, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-doc@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 chrome-platform@lists.linux.dev,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Viresh Kumar <vireshk@kernel.org>, Helge Deller <deller@gmx.de>,
 Wu Hao <hao.wu@intel.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-integrity@vger.kernel.org,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-input@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>,
 Moritz Fischer <mdf@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Rayyan Ansari <rayyan@ansari.sh>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>, Xu Yilun <yilun.xu@intel.com>,
 Alexander Aring <alex.aring@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Huewe <peterhuewe@gmx.de>, Sergey Kozlov <serjk@netup.ru>,
 Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c8yli56mmI+gJGEV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 09:12:46PM +0100, Uwe Kleine-K=F6nig wrote:

> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions were renamed. Further some compat defines were introduced
> to map the old names to the new ones.

> Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
> are pairwise independent and could be applied by their respective
> maintainers. The alternative is to let all patches go via the spi tree.
> Mark, what's your preference here?

I don't have a strong preference here, I'm happy to take all the patches
if the maintainers for the other subsystem are OK with that - ideally
I'd apply things at -rc1 but the timeline is a bit tight there.  I think
my plan here unless anyone objects (or I notice something myself) will
be to queue things at -rc3, please shout if that doesn't seem
reasonable.

--c8yli56mmI+gJGEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWmlVwACgkQJNaLcl1U
h9AImgf/YhrOsj57KBdfXCGkJi2n+rTwU/YN3Vvfy2fP+4gmJoFGfjk1o+luXQwi
q3+RNetq9JicN07DE0eggUdY7EqvLtghmHnQWYraw+gEPT7PwkiFuKZgDEy79tmH
pNpJuEKTeDipvLkXCVMzD0T+NrW2BXshkACyxLpBrh+ewGJpmmgJEH8LEo52dxrk
uLfK3YjSYco5zXw8Dzak8Ea9Hb57dnySjT6aQf8GRXZMjNYAPqMC27Pzd5pWHnD1
am4raQY/1ji5yjiVs38+2RB0EnWlFJyj0VvC9vL5PEhkz0XiW3OTTedLKcxKKoYv
H+d+5ZwIRVx3bl+qcRRzH8EMyJW7pA==
=Umm1
-----END PGP SIGNATURE-----

--c8yli56mmI+gJGEV--
