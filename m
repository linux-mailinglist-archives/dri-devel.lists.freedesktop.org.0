Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8830362D90D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302A10E54E;
	Thu, 17 Nov 2022 11:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE3F10E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:09:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B396B60EAD;
 Thu, 17 Nov 2022 11:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A05C433D6;
 Thu, 17 Nov 2022 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668683384;
 bh=rlMFnUfQu8GJbpUZVcINUpGICn6p1+U5R0s89aqiluY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3x/iGCbNuMvys+UHPYxXfBNEAjRTHTA7o32s2r636M+YBziRU2SonABy/5UU1DnQ
 3YSZBpbLlV16b0wTYkkbOka0EYaToulvwQQ6YLZf1ROtwkCUY/mYWSKCusjvL5vfl5
 GtXRdaGwEu5jajg8VLb3TOuqu8rtnFdEm4Xr02tIqPUgI6oDOyw0ISkleOPBWQv1Uh
 Q4l5z6Y53UO3FFCyK7OG8Af7IuGHk5lPUop3+BjBi3gh4Pw65qxsKsd9Ug2shYBllT
 zLwERhd4dFhs4bctzw0za1HB8NQRl6Qh5d7eU+rxh+CyqFs4sAk8zNQCSfWflRXOXM
 +GanqHZNquZlw==
Date: Thu, 17 Nov 2022 11:09:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Message-ID: <Y3YWdeTLfmDh7UyB@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LQcIBCJXd6N58uwP"
Content-Disposition: inline
In-Reply-To: <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
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


--LQcIBCJXd6N58uwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 09:47:40AM +0100, Carlo Caione wrote:
> The ILI9486 driver is wrongly assuming that the SPI panel is interfaced
> only with 8-bit SPI controllers and consequently that the pixel data
> passed by the MIPI DBI subsystem are already swapped before being sent
> over SPI using 8 bits-per-word.
>=20
> This is not always true for all the SPI controllers.
>=20
> Make the command function more general to not only support 8-bit only
> SPI controllers and support sending un-swapped data over SPI using 16
> bits-per-word when dealing with pixel data.

I don't understand what the commit log is saying here.  The
meson-spicc driver advertises support for 8 bit words, if the
driver is sending data formatted as a byte stream everything
should be fine.  It may be that there is some optimisation
available from taking advantage of the hardware's ability to
handle larger word sizes but there should be no data corruption
issue.

> +	/*
> +	 * Check whether pixel data bytes needs to be swapped or not
> +	 */
> +	if (*cmd =3D=3D MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
> +		bpw =3D 16;
> +

You should check the SPI controller compatibility here.

--LQcIBCJXd6N58uwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2FnQACgkQJNaLcl1U
h9DkAQf/ZO81DRjufOHQCe4TT3YQX0I4BQbc6tjxpvEJsPkgTRL6r1vfxKJOjA6j
gBJqo8B7TdFYzqzWf4hJwieTLgUKdg4pWERfMQ5O/g9bHsc0BwLUTzg6asgynPqk
ZdxyCvC5QTA/b9ZIWdKPRN9com67mNQRrebpkwcRjFQ1alJxlLDi2P+yrsCE+WOj
Q77RLUtE3cVmxP1tFERDaS6TTTxc51nqK/HT0t6x3LURP6nnPdp5o8s2+AU88Vfv
QoJDmpltiUw2lUScF9jTJjc3ATKhvXAY2NuY1xpVOUMfd4noH1MX5L97UPVedrY2
24k3w5zahZP+JTUtK7epT6eO/eckVg==
=opWd
-----END PGP SIGNATURE-----

--LQcIBCJXd6N58uwP--
