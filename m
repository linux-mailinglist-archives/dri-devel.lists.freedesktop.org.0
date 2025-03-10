Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43827A599C5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0186510E46F;
	Mon, 10 Mar 2025 15:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tN6SUlZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4810E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 15:21:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5558A45A18;
 Mon, 10 Mar 2025 15:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A6C4CEF0;
 Mon, 10 Mar 2025 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741620077;
 bh=Lq4ng9tUDh+Do3SLF+xgV+HmrJ7By4mHdda8vZYyX2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tN6SUlZfZij8LZDhONGQZYa0e7YUVUuznQJoN7QxJNnpe+jbNxOnouR+r6lsg7jz3
 4Lnrtw2jbVBA9IJxSTQbHidaF0Xgxo30DQX/+dScJ3X+P/HfURJVPE7azLzRl75Iuj
 R8qcVAe8zjuSBe0ms+K4GbTB1xyvm5SpRUbS7iX6tIkR0RqnWdsnTrb6c3W7zMZDv7
 l93X3XUIGRPiEP671e+UX6rqe3SSv1Mnw8M1IfM3zl0B/hdXNP+qm2TErT9R6lsSAV
 DzqqaC9VfMcf1rxLXbPztaw+62TIEvlf6O7v94iUwpFr2XUemJJ7QAOlLrT9UrMiF8
 HR7YneCmAO6Ug==
Date: Mon, 10 Mar 2025 15:21:07 +0000
From: Mark Brown <broonie@kernel.org>
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] regulator: pcf50633-regulator: Remove
Message-ID: <a45de47a-d3f8-4730-bb91-2782f52fd25f@sirena.org.uk>
References: <20250309193612.251929-1-linux@treblig.org>
 <20250309193612.251929-7-linux@treblig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xd0V7MnYEiEQnSNp"
Content-Disposition: inline
In-Reply-To: <20250309193612.251929-7-linux@treblig.org>
X-Cookie: I'm having an emotional outburst!!
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xd0V7MnYEiEQnSNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 09, 2025 at 07:36:09PM +0000, linux@treblig.org wrote:

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/mfd/pcf50633-core.c            |  35 +------
>  drivers/regulator/Kconfig              |   7 --
>  drivers/regulator/Makefile             |   1 -
>  drivers/regulator/pcf50633-regulator.c | 124 -------------------------
>  include/linux/mfd/pcf50633/core.h      |   1 -

Putting MFD changes into the subsystem changes just makes everything
harder to apply, please keep things separate unless there's a strong
need to keep everything integrated.

Acked-by: Mark Brown <broonie@kernel.org>

--xd0V7MnYEiEQnSNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfPA2MACgkQJNaLcl1U
h9DJ2Af/XTN0nfI5RCpJ/Fr/iN6MekiWRzaQb3lLzvZytMpntNc4uPwT7p5rYEHa
ydU9MVFQh7Dyt0gJynsGwsny1gwwpV6lbD/t9Larxqo0gCebDw8KDzLqOEuj2U3k
0qHsl4zlFCcPbafwODYl+E6ZsaE2i6qIaaYkuRVNtMVDmJ60E3NBfow87xLD56q3
VH/Vp8e4kPNG/tHAfDadzy705WzmwwJHYSt1JCDPoyxlbXSrCzEDyN5w2+hq0Jvf
YbmzdUrP2MUQlvOolK/ciND0mX/VT17xsO6Wg2b4t2ZyuDkxJ9bod08/xTZk7BxA
j94zeh1q8atD27MZlCcC4ibCsF317A==
=A1eA
-----END PGP SIGNATURE-----

--xd0V7MnYEiEQnSNp--
