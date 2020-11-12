Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B816D2B0EAA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9916E41B;
	Thu, 12 Nov 2020 20:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4C6E41B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:01:40 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E47BA206C0;
 Thu, 12 Nov 2020 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605211299;
 bh=MKJDXGpNlGKLCI9dNv7dDPKVeEJe0VJ/HK7E+grpTDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/ksYSCI1J9IPc6Tjsze3uiUdqAwqqI6fTydzuEQ/zllsZIZX9gf+6kkRQEr4VR1N
 sI/Sfb9exPJr5bz8iuS/yvboFP25H3+cmbL1VIsZcCdrlFbr/qs71AIKKx4mBv5LYo
 0Ok1y77dTkY2b68mM3G/uNiu47PwTZ0ITkWabBQM=
Date: Thu, 12 Nov 2020 20:01:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Message-ID: <20201112200123.GF4742@sirena.org.uk>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com>
 <20201110202945.GF2375022@ulmo>
 <20201110203257.GC5957@sirena.org.uk>
 <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
 <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
X-Cookie: Danger: do not shake.
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
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============1427723032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1427723032==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Content-Disposition: inline


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 10:16:14PM +0300, Dmitry Osipenko wrote:
> 12.11.2020 20:16, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Nov 12, 2020 at 07:59:36PM +0300, Dmitry Osipenko wrote:

> >> Also, some device-trees won't have that regulator anyways because board
> >> schematics isn't available, and thus, we can't fix them.

> > This is what dummy supplies are for?

> But it's not allowed to change voltage of a dummy regulator, is it
> intentional?

Of course not, we can't know if the requested new voltage is valid - the
driver would have to have explict support for handling situations where
it's not possible to change the voltage (which it can detect through
enumerating the values it wants to set at startup).

[Requesting the same supply multiple times]
> > So there's no known obstacle to putting enumeration of supported
> > voltages into the OPP core then?  I'm a bit confused here.

> It's an obstacle if both OPP and device driver need to get the same
> regulator. Like in the case of this DRM driver, which need to control
> the voltage instead of allowing OPP core to do it.

It wasn't entirely deliberate but the warnings have proven useful in
catching bugs (eg, leaked regulator requests).  The general thought is
that if two things both claim to control the same supply on a consumer
then they really ought to be coordinating with each other.

> Please notice that devm_tegra_dc_opp_table_init() of this patch doesn't
> use dev_pm_opp_set_regulators(), which would allow OPP core to filter
> out unsupported OPPs. But then OPP core will need need to get an already
> requested regulator and this doesn't work well.

There is nothing stopping us adding a variant of that call which passes
in the regulators that were acquired by the caller rather than having
the OPP core do the requesting, or equally the OPP core could provide a
mechanism for the caller to get the regulators that were requested.

> > Ah, so each board duplicates the OPP tables then, or there's an
> > expectation that if there's some limit then they'll copy and modify the
> > table?  If that's the case then it's a bit redundant to do filtering
> > indeed.

> I think this is not strictly defined. Either way will work, although
> perhaps it should be more preferred that unsupported OPPs aren't present
> in a device-tree.

OTOH that does mean that if there's an updated information on OPPs (new
ones added, old ones determined to be unstable) then you can't just
update a central place.  It depends if the OPPs are thought of as
describing the SoC or the system as a whole I guess.

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+tlJMACgkQJNaLcl1U
h9COcgf9EH4d/GUFioibikErfQGZW508vh8gf7BzEhMbZ1U44T4UeBcZN5+Sxfi9
Y9qKnb/EnnOFXZXcSjcQUtGaS5eEjFxd+bak7yLpfFNKYEsMKnEOdVDtbxB5NQ1W
FJiZYR2ccixR9FdgWI9DsNRxScr3EnqfV+IvHV33Agn/Kyq2KkA7Q8Qu5SupHm5O
XJ3/b2MSiW1P1rpQzA+yp+qUWdm4HCqpf+fL6eGqdDY+WG5QDHAjBubPN4ReUNIe
Abev8erADzNJMrfGC86F0yJmPA/BwOIBqFSJHOKE4FIaxASi0ZDQAy+akWh4rbB4
kLMQ2gKElTmSDF8Gx2rTqPmKzhtW9w==
=Dp9/
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--

--===============1427723032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1427723032==--
