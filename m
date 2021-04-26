Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2DA36B298
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 13:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262D66E82C;
	Mon, 26 Apr 2021 11:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED06E829
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 11:57:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C53A60FE6;
 Mon, 26 Apr 2021 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619438234;
 bh=YAMGLDr484gnwUvmIKxfN/VOkDFd46Y2bk2JtoZTrxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jY6inlmBl0DN2ZyWOs3VNzGPVKMDziPXKIzxbKn9SVs/bnRSAbA4RYJAEe+EsgI73
 f1apQg9KsOuPHn9HvDNeOu0EcKrwv5TDmXlXzpcl3xsOhyJJlOSH6bcm+pfHAdh3SL
 C4sC8hDQeVUz8RC6uRgc2AnfDvqudyLeNvG2blpWZnky0iliKU+QKnAgI8VQPJAzes
 9RJ/bH7BmIbweBhqwu1tMEtg8ZQn8ks8Rw8B7hnKlCZGwm2jDgGxlHway26jWxlUBH
 mUjm+KodlrjZXYBGEhPu766CVyTrspDe/y+GXlxt2e47xspeGAPvW7qRxqqw4E0tAa
 dBQYOXiTKueBg==
Date: Mon, 26 Apr 2021 12:56:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Art Nikpal <email2tema@gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
Message-ID: <20210426115645.GB4590@sirena.org.uk>
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
 <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Gouwa Wang <gouwa@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, Artem Lapkin <art@khadas.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============1764035916=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1764035916==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 24, 2021 at 07:57:19AM +0800, Art Nikpal wrote:

> > I would expect the driver to unregister the controller at the start of
> > the remove function, suspend doesn't really make sense here

> It's strange - But without spi_master_suspend i have randomly stucks when i
> try unload this module - as was written before
> i was test it (load/unload module in loop) and for me suspend make sense
> here

> If anybody has another solution - or real problem not here - please write
> to me the right way!

As I said above unregister the controller at the start of the remove
function.

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCGqnwACgkQJNaLcl1U
h9ChAQf6AzAWZAIxaf/Vi1T0miZmDkRpcCYrObYCduQZQzbR83zD+NtVRAQt5Hzd
3TMxWVBMUD6hChyKOe4xA6ZfZQ8jh8s3LPNwTwCnBtrmpNPoovMkjAtB3xcXY0Qw
vFonf9FoPRLLbjf63HL1qv4dHmxARdZZ4ZFS/fMx9670pPz1TlMwyVLzXw3iOycr
9S2Gzap9QFqXP83avoh2cbxEgNRGlmN4OyNPx0fWYkvwx5vpQJ8/TZ4X9mO1Zi/q
S7tS3jJW2UVtxHK3jXXSpqdr67o1+2YCRZwKReT0YPPQI9n689PAa1dmnxAMmoPg
BIADUKIHULSv9i/fb0MGMkpRtdSTuQ==
=kGPv
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============1764035916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1764035916==--
