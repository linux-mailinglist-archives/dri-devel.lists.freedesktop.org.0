Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5266A2258F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 22:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F59210E00F;
	Wed, 29 Jan 2025 21:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HTzxoty0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522210E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 21:19:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3038CA41C41;
 Wed, 29 Jan 2025 21:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3592C4CED1;
 Wed, 29 Jan 2025 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738185584;
 bh=+Qsqfuy/ZFdMoLo0F/4FS8dsGspy1qqpACl6yHdM0II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTzxoty0gaf1FXl9hq0JEUBI23Ch/5WJqiwOnXVnIU15VzQiEE7vSUiGaTY6GGe3T
 IAwX5C0pi+I+S3sHICbuunhhcGByKJHS3/iVTd9w3d32nHu/2dxzkyixa/UKXbzyHC
 wyGLHPDTCmlRapRRyWYGwhL2jVlfEvfLrfT/+osxWxIWIFOZnno6mpY6/wNC9iLBy7
 R+BRrOqJ8xJ1ttX9V6Qj1yBAD/ZMJEYA4TVbjlg/Qj0FWGYVpFeTvUe6Z8b5gsxAHM
 /D1gB4+zEHrqZ/b8TpmEaDCSmfoUVyTnqBhEOKaGaA1i640u0/IS/iT4bVDSEx7aCv
 tJFCV7FdnSVRg==
Date: Wed, 29 Jan 2025 21:19:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <cbe0cd60-2057-461c-896b-b637a6b67f83@sirena.org.uk>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WVo/KW6FvNqVLjBm"
Content-Disposition: inline
In-Reply-To: <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
X-Cookie: The world is not octal despite DEC.
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


--WVo/KW6FvNqVLjBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 06:50:57PM +0100, Marek Szyprowski wrote:

> Bingo! This patch (on top of current linux-next) fixed the probe issue.=
=20
> Feel free to add:

> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> (although I'm not sure if this is a fix for the generic case or just=20
> this driver)

It's a fix for a broader class of issue, if there's other issues or not
is a separate question.

--WVo/KW6FvNqVLjBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeam2sACgkQJNaLcl1U
h9BnLAgAhVeRdUPXBY34USDBT60cPgFLNojWItmZ/USMDeDtAZoqExVebCcXfiUD
4iQH/9fkxSgoj27DHzu3ceDYr9r+6BCh3S3n1DJS02JryNnCgLVuxrfhmnMgc2pF
nfqaEsknyjARSkC2DTyl6UwHsTTChHRoaWVVi9pVdK1fGh3RFI01150P41vSSTre
qE/GBfBccrQ6Tl+S4XmfHU2WETBE+NCnlSUuByzuYB0CaDdh5YgzbQtcMJXBKphg
8wq/iSoMkV9vSZHvQt4M+VjyHpbiMrMHJuQ/GSeje0IWHiTHGcHMm1FVJEPLXuMr
PqhnO+gpMMe7/1SsoZgp5fj4TL5lPQ==
=4f3J
-----END PGP SIGNATURE-----

--WVo/KW6FvNqVLjBm--
