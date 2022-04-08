Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C084F93A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 13:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853BB10E12E;
	Fri,  8 Apr 2022 11:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5B1884D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 11:18:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24B04B82A4F;
 Fri,  8 Apr 2022 11:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5B1C385A3;
 Fri,  8 Apr 2022 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649416692;
 bh=/m0sOMkIY+YH/xMizj3AEsdT5/nMANVS7C4zn00Dcoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IUfg3W95tcHxKLDG6N0ysbpPiIz+skActS1vj4iycbyIagilzHpBXbQOC3rKJ/Ly/
 hDo9o6/SouLzvC2CWO43syU8n87BIyPd7Rkxy8EXYOX5fIZ52ZUEynkZ5BH+znJnrC
 S62qrTks/jec/1uxiKywIohunzOGdt841Jg3xM3STgO7qc4zsAiuv67y5yXUXgEhOU
 k+1O5QX5XU/WP16f1zKD9Ph72cU1LF5qiMb0ODLYMyUSe+LFQJ3Batc5CfsAXpjtzq
 oCenxiCprcaXXoj7GxNrgwnZPbW1SQPmvTPKDWY9DjY1w6MGflVdwYveIWuh1sXI56
 WqEQS3s3BiFxA==
Date: Fri, 8 Apr 2022 12:18:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 5/5] drm/solomon: Add SSD130x OLED displays SPI support
Message-ID: <YlAZ7gl7aHjIrYn9@sirena.org.uk>
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-6-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g1yK6P6SAt6g6CTu"
Content-Disposition: inline
In-Reply-To: <20220407200205.28838-6-javierm@redhat.com>
X-Cookie: Look ere ye leap.
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g1yK6P6SAt6g6CTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 10:02:04PM +0200, Javier Martinez Canillas wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over SPI.
>=20
> There is a difference in the communication protocol when using 4-wire SPI
> instead of I2C. For the latter, a control byte that contains a D/C# field
> has to be sent. This field tells the controller whether the data has to be
> written to the command register or to the graphics display data memory.
>=20
> But for 4-wire SPI that control byte is not used, instead a real D/C# line
> must be pulled HIGH for commands data and LOW for graphics display data.
>=20
> For this reason the standard SPI regmap can't be used and a custom .write
> bus handler is needed.

Acked-by: Mark Brown <broonie@kernel.org>

--g1yK6P6SAt6g6CTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJQGe0ACgkQJNaLcl1U
h9AIOQf/WM+DQ3uZHPaIQ5Aa2QPhp1jUAe6hJOZPDcPKGVkxfwwWLN0Dv0AS6MNv
RrM5wv7Yvqp1vvAQ1srOtZJgLWYpVyzWQEpr2i2CUvX5rIiX6d8iAspK5HbcbMon
RSWXcItCHZjj/CacdEkjZp1ZHCwmxLmPJ6BajKoZCdnDWu/1/+Y5V6C3kHUbPgl7
46wTkUzXoPBS25rHOyAQmhcsEgvP9mL9mQ7JwSfEI6gsBAy61fxrgZiPcxJWef0Y
P8jnTv65wR5m7KNc09i0m9MaMubatw9laXRYRc3UHjlVX44vAte1lzvBJdem4+YV
s8o2HpkntpTn+bn87ONIk+eb5Y8DeA==
=rvVz
-----END PGP SIGNATURE-----

--g1yK6P6SAt6g6CTu--
