Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4862F99E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0ED10E76B;
	Fri, 18 Nov 2022 15:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23EF10E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:44:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C433B8244E;
 Fri, 18 Nov 2022 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D62CC433D6;
 Fri, 18 Nov 2022 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668786277;
 bh=lv3Ir6hqjWLfpj3JgMlunLddNrdnY2PDByb5xwuja2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iznHYNViEZbwr2lnpESQWX8uHtsVjn4Jt1zlsrs+3aV5nwHAPVKwwrM/dLos7JdaZ
 BjH6T8H5sJXbOKtZFK64UqLjW7SOpDP7qu6pAQoBNrsg6JCo5N6/UhCGFGSgSVi6+1
 ZMwRUL4L4zXNJN21VljHkYflhgMvHvkQvQbUOMCFgTFJalMgr3QhZTMs48NGu6TA03
 SwlhqVXP4+G0Mafp0OY8RW6cAHytuAnvjQf0CZYWiUpYE5lEDd7QbwfUuYsR2dPCjz
 WqDDdbEjq4y++xLS2WhjL6xoBIzWHbCxE2GiO4NcjcPpMDFNAGZy7nSzaT7Vg0QR8S
 5jLXbt5JFCRDQ==
Date: Fri, 18 Nov 2022 15:44:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Message-ID: <Y3eoYTZRyRJnze1z@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
 <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
 <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
 <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="REJnauToDoQdDoiz"
Content-Disposition: inline
In-Reply-To: <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--REJnauToDoQdDoiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 11:36:27AM +0100, Carlo Caione wrote:
> On 17/11/2022 15:59, Mark Brown wrote:

> > So this is an issue in the MIPI DBI code where the interpretation of the
> > buffer passed in depends on both the a caller parameter and the
> > capabilities of the underlying SPI controller, meaning that a driver can
> > suddenly become buggy when used with a new controller?

> The MIPI DBI code is fine, in fact it is doing the correct thing in the
> mipi_dbi_typec3_command() function. The problem is that the ILI9486
> driver is hijacking that function installing its own hook that is wrong.

Ah, I see - it's causing confusion because it peers into the
internals of the underlying code.

> The problem arrives when your controller does support 16-bits, so your
> data is not swapped, but you still put the data on the bus with 8-bit
> transfers.

Why would you need to use 8 bit transfers if the controller
supports 16 bits?

--REJnauToDoQdDoiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN3qGAACgkQJNaLcl1U
h9D2lAf+Ps2YiMRv04FkRIpnqcdeeVJ5f9fygu+kakEWfMNpqzc+qEbwovF9SZp6
gU8YaTS6ipuPAbf5Zv8ziwDe4wgbRcBHnmegTOmSHj451Oc3q0TBvKkganCwxHFd
K1bB0cJYMmmpt4Y4OR+pyLTLoOMxJ3ADQ+yxqAZTGF5llQXxHw0/8UPhGIXLCAn3
0bTaruYqx9EATK199CVVj/oHzU31Ryj+H9pJOie8PoDBPO1eaykOAC5wiJHjU4M6
qgT29nXAt6XJw/gHnWZoKVLP0uJnJJQDEdL9Mp4y5yWoIFIXLTow1Lg+ZyadiLCm
/DtnT4366TwxKlbjqYPYdT28DOAmBA==
=URfB
-----END PGP SIGNATURE-----

--REJnauToDoQdDoiz--
