Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE02AE0B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 21:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED789CD9;
	Tue, 10 Nov 2020 20:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B27D89CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 20:33:12 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A8452065E;
 Tue, 10 Nov 2020 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605040391;
 bh=yJTYZmAXuxpcGEJyYxHhM5frnzHMmu2d66zn6Bja/hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0+9M3MIhvG1jKl+29RdqvQt51vR+oaGK/8GCDfVOFt7DeuVYh3d1crHlNZUC8WDds
 g9vkQkcCbbEoXNQpyaSLrzdPjoLqf+ydgGGXiFyaUf3ctGyVRw0DSvUJ1vfluiCeqN
 k/eioYuKDJ0bQsdAJATDhkiDO1uTXHoc1BDNDaN4=
Date: Tue, 10 Nov 2020 20:32:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Message-ID: <20201110203257.GC5957@sirena.org.uk>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com>
 <20201110202945.GF2375022@ulmo>
MIME-Version: 1.0
In-Reply-To: <20201110202945.GF2375022@ulmo>
X-Cookie: Disk crisis, please clean up!
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============0524263594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0524263594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 09:29:45PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2020 at 02:44:08AM +0300, Dmitry Osipenko wrote:

> > +	/*
> > +	 * Voltage scaling is optional and trying to set voltage for a dummy
> > +	 * regulator will error out.
> > +	 */
> > +	if (!device_property_present(dc->dev, "core-supply"))
> > +		return;

> This is a potentially heavy operation, so I think we should avoid that
> here. How about you use devm_regulator_get_optional() in ->probe()? That
> returns -ENODEV if no regulator was specified, in which case you can set
> dc->core_reg = NULL and use that as the condition here.

Or enumerate the configurable voltages after getting the regulator and
handle that appropriately which would be more robust in case there's
missing or unusual constraints.

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+q+PkACgkQJNaLcl1U
h9Di3Af+KvYDy9j9hzr4giaqciyG6ZuO/j4tEwL8vjsyaMREZ12mZ3xOOgu04UTQ
KYUtOH+AIWAUWOBwJNWEgKiRd04eMyhD6IHeCT1lip3XWBxXOEr9/YGXba3fVI/J
vvHATycSemWFAYfZ1yjhz2fAxz4zxgwujwivC1/YKWjHZi8vFTy16R9yY5Eex5l/
eplxyfun7IvJxFiVf5XDK4K2lGmn783N6VYofq6lAUknQ+TxScbl9QNyKNihB7Ys
tOgGgxJpK6+xFKP8RWC34O3W++wjUL2sUZUhvVKP059roKdB0gej+D9DnV+RCYHf
AloxftWStaHBnOpYPmbGoUoaK8isGQ==
=oCrN
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--

--===============0524263594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0524263594==--
