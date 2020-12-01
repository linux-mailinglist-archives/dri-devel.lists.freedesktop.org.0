Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8392CA5BA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441E89B67;
	Tue,  1 Dec 2020 14:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1C089B67
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:34:50 +0000 (UTC)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DDAA20757;
 Tue,  1 Dec 2020 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606833289;
 bh=MyXMx5yXcwhyHoSDPi4JqwtH6IbreqZ2dffpm2rMrnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dk2mKbi0tMydQDEKwILrugaQ4+lDOei99EiGyEzw8miGGC/enajtGKrNxNAgOh19d
 bUolBQkpIVH3Hui3nBJELnqmmCNUkGvsVFhpqQ5K0vNjOLXzgTLtjz0BPDjBiyCFTO
 H6YlxqFYzbMW5dFfkwv/1U0YroBSdxaecQ6rhs4U=
Date: Tue, 1 Dec 2020 14:34:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201201143420.GD5239@sirena.org.uk>
References: <20201104234427.26477-1-digetx@gmail.com>
 <160683107675.35139.13466076210885462180.b4-ty@kernel.org>
 <858e4183-5064-084f-9b80-870e118c3edc@gmail.com>
MIME-Version: 1.0
In-Reply-To: <858e4183-5064-084f-9b80-870e118c3edc@gmail.com>
X-Cookie: Who was that masked man?
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============1351510067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1351510067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 05:17:20PM +0300, Dmitry Osipenko wrote:
> 01.12.2020 16:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > [1/1] regulator: Allow skipping disabled regulators in regulator_check_=
consumers()
> >       (no commit info)

> Could you please hold on this patch? It won't be needed in a v2, which
> will use power domains.

> Also, I'm not sure whether the "sound" tree is suitable for any of the
> patches in this series.

It didn't actually get applied (note the "no commit info") - it looks
like b4's matching code got confused and decided to generate mails for
anything that I've ever downloaded and not posted.

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GVGsACgkQJNaLcl1U
h9BikAf/buTRpKtsLDzFSoQBjj73gw+9m/quyO+03JWRrvv3U6Me8tZmCZHGcAhJ
5+PFS79ESOLZrypMM4IE6HEK1cq0AFNjUDMqVKtWFP4GgZ8LBjcLvSF8OYkdHwo7
TiUsxAOnhequj3OhP46T/AuusHAX53D4Fg4rLsJMCrJygo0e6kAaOB7F9ZlJqNQt
A3pk4g+mC153uBGhCsZRWQmj93R9SxH6vUd3g6ePE0jIZAqa3LSJHdYX3xRSfQWd
Iojrsh3QYMFNdrajfbhAcn9hyXU1O2Zy0NadudYbqOIYWBQ5TEbW8z55BJLr1a2O
09Ob2CqfLC5c6oPrJJtjRMGm4w8iaw==
=1gdB
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--

--===============1351510067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1351510067==--
