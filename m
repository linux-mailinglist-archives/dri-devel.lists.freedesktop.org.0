Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1F3EEC5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 14:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037366E192;
	Tue, 17 Aug 2021 12:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672EB6E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 12:23:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1CB760FA0;
 Tue, 17 Aug 2021 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629202987;
 bh=c/PlC/W6yjxlV+Z7ZbF/hxgaIiNXDZlZo9QTekHzzto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmskkW06SeXdvESPFwWJP4iQi/AfZfa0vEFy+cuAqLmy+f4I2uJuGlWiIG3+qOPHv
 xnda4sK3SpsR15EDLFwOPVpUWOowLkNLIk9ImApHVFPfJnKz/lhdsh+HFZYj/NbRHm
 eXuH3smkHCoqx0QNay+eOr+RUqsGi1/LD/ASV8gvs921fqWRRcXPMo3BLK5Ue/LMAY
 E7aHmfxbASTmbJ0PGpnfzkpkFQY6yMi66OmBVe1qXWlxHCeHepAgYCfKYqlUOjbUyt
 lxKqpcb5n/55Qq2tzaqx1B4Vg1bUnEx45zv+Fl9rzaJm69xqekfjJ82brq5dSoJIe+
 WqipDMJt6MCZg==
Date: Tue, 17 Aug 2021 13:22:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
Message-ID: <20210817122244.GA4290@sirena.org.uk>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-23-digetx@gmail.com>
X-Cookie: Custer committed Siouxicide.
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2021 at 04:27:42AM +0300, Dmitry Osipenko wrote:
> The SPI on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now SPI driver must use OPP
> API for driving the controller's clock rate because OPP API takes care
> of reconfiguring the domain's performance state in accordance to the
> rate. Add OPP support to the driver.

Acked-by: Mark Brown <broonie@kernel.org>

Is there a concrete dependency here or can I merge this separately?

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEbqhMACgkQJNaLcl1U
h9Buggf/d4C5+YzSeq0C2NHs0zamK8fHfoeCb5Qf7DbvwC4xNpUEoKAl6kFe6XlO
ngiyDsMKDiDDirVRL6usRQkhxcB9hYlR9qZPZwTumcSB8omPU2d8ibg0bZlq6+EW
bQf4R3TRA5YOFtGXxUejMSdK0+MO4I0QbuU6o4zLT3dzFtq+nK1Oct7FNyhjNrK/
ELy4bDfbSewMfEPDjMsi05Qg7I6ftQiO3ZAqdTAj+0bLpHvsChKGv474uEXEw6vv
FICFNW+bUCUC/oS3NykjRlVmWPr6eACJDT33krIuaX8/G0mN5kVjAfVPnOK1OzG+
Y+z6bEN/Dr6UAjhZRQbizQRM04sR+w==
=JJo7
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
