Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BD836F9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 19:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B098110ECE5;
	Mon, 22 Jan 2024 18:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CF210ECE5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 18:18:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 37E0CCE2C10;
 Mon, 22 Jan 2024 18:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84691C433F1;
 Mon, 22 Jan 2024 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705947523;
 bh=McOauSyMQNxtPZ0g7TEpEiNFuLd+iPYfNexDMsX/FI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8fifh16cqrlBPFhmdK0/1YCmVp+FCQJRM3mcc61e8B54POXfNtNHCezXLI06U+BW
 2HyC31K2GKN8pqxyPoe5eH43Wr1IvzJ4qYvgVKrZ28cOHRapgl4U0tO7nRd1Hg96Gu
 /I85mPr8fKbNlof8bDAKADfRcHtOpPxmy3YbesJ0DqFFZ2OTYAI+xKJ3khkG5PRPqb
 IkZ7Lha5tDCBsHZjVT1Pc0QMwPbNJ0JMPGxW7jUMjEknv7bvXLCARAShkNA8Yp5eXw
 Jxu0Ft8Uip4jzu6W9VwfTzuvxciZJpio1DrdN7XFmAH69ub0PysqfBMv84es2fWtex
 o4y4YVecDwVTQ==
Date: Mon, 22 Jan 2024 18:18:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T+I3YsJdHvT4lja9"
Content-Disposition: inline
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Cookie: Nice guys don't finish nice.
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org,
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
 Simon Horman <horms@kernel.org>, linux-integrity@vger.kernel.org,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, linux-staging@lists.linux.dev,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--T+I3YsJdHvT4lja9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=F6nig wrote:

> Note that Jonathan Cameron has already applied patch 3 to his tree, it
> didn't appear in a public tree though yet. I still included it here to
> make the kernel build bots happy.

It's also going to be needed for buildability of the end of the series.

--T+I3YsJdHvT4lja9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWusW0ACgkQJNaLcl1U
h9AR1Af8DbPI9TFuBXKEh4BM61G07z/XXFesQgMYJFn7hnO/3qPq0DB2udfdH+HR
WrEFwWfImJcLCzV8lyZSjyQS8FeUMRbP7r99FeoYIb8amMJfpQIN7gD1IJ+OzZGL
9PhsdsnLY3FgKjHbQCA6B6TnEDwI/0zpTfNjtElcXbWRB+V9uqBR/i8Uk02ngrKd
MFM4BWy/tlEQvi0AQcylB9znY58FISMxd4ww1jeW0euV6Do4c1U3/9N+ivg6WNfs
rKxD/BMTdGNcwlR3dWzHBLLYk3YAMLSi8p37kFSHwDGoHFtHCuUNPhA4RsVlbb9P
SyEM0rudlzp/uFBuKSBT2nWslCLfjA==
=Dr9Y
-----END PGP SIGNATURE-----

--T+I3YsJdHvT4lja9--
