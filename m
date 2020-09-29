Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CB27DC73
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 01:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C706E30F;
	Tue, 29 Sep 2020 23:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31EF6E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 23:06:16 +0000 (UTC)
Received: from earth.universe (unknown [185.213.155.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EAC720897;
 Tue, 29 Sep 2020 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601420776;
 bh=Y7zr4AlIKP2gAU27J/dUuw6tyc73EiyJRq/8jkALbnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGVJwLWCsaeD4J7CkuuII0mMaGAv32FlyrBGhuC6wP5hQEp1apRnpxuH/gIIEfEIz
 9CQTVBmYYJreN3ZN05RbPYD+p7SKyktJ4d9i3Kok9KUBQc1fFfTXeyrw3Iq5FYSnTG
 PY65vBOD4vE36ce+nxaGZtsnUDWUmQSFahscL9no=
Received: by earth.universe (Postfix, from userid 1000)
 id 2B0363C0C84; Wed, 30 Sep 2020 01:06:14 +0200 (CEST)
Date: Wed, 30 Sep 2020 01:06:14 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers
 maintainer
Message-ID: <20200929230614.mxyxko4u4jsdw3n6@earth.universe>
References: <20200922152839.2744-1-krzk@kernel.org>
 <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
 <20200923205857.5af407ee@archlinux>
 <CAJKOXPdWD47OvK7qQ4Md2t3U=NmSf=j5hNjBq4+8CgZKLdup=Q@mail.gmail.com>
 <20200924122331.GI4678@dell>
MIME-Version: 1.0
In-Reply-To: <20200924122331.GI4678@dell>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============0816655310=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0816655310==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vo4t74hlgmpxejui"
Content-Disposition: inline


--vo4t74hlgmpxejui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 24, 2020 at 01:23:31PM +0100, Lee Jones wrote:
> On Thu, 24 Sep 2020, Krzysztof Kozlowski wrote:
>=20
> > On Wed, 23 Sep 2020 at 22:01, Jonathan Cameron <jic23@kernel.org> wrote:
> > >
> > > On Wed, 23 Sep 2020 11:53:33 -0500
> > > Dan Murphy <dmurphy@ti.com> wrote:
> > >
> > > > Hello
> > > >
> > > > On 9/22/20 10:28 AM, Krzysztof Kozlowski wrote:
> > > > > Milo Kim's email in TI bounces with permanent error (550: Invalid
> > > > > recipient).  Last email from him on LKML was in 2017.  Move Milo =
Kim to
> > > > > credits and add Dan Murphy from TI to look after:
> > > > >   - TI LP855x backlight driver,
> > > > >   - TI LP8727 charger driver,
> > > > >   - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> > > > >
> > > > > Cc: Dan Murphy <dmurphy@ti.com>
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > Acked-by: Dan Murphy <dmurphy@ti.com>
> > > >
> > > Not sure who will pick this one up, but
> > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >=20
> > I guess whoever is first. :)
> > This spans across systems but the common part is MFD, so maybe Lee -
> > could you pick it up?
>=20
> Yes, I'll handle it.

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--vo4t74hlgmpxejui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9zvd8ACgkQ2O7X88g7
+poBWg/+MKAsn+8M2gk8ABqp84IGjPTY6eP4iD+eD0CLBmoiqpYPQdfHww494a/3
4BNGOgGz1g+ZLs31Lc9FWY6/UfDR85/2+hlz8DOTHRCb0t6XyScPMG4zXPs1mwVO
xG3geK9/wksCwaalOpRio04VipltRriZqdkOoTrQ34CnZF0/O7swS1uVbQRSuRhD
6ymSnrJlkZpzzguwkD0MMZmcK6W4lA5dB77i8/Ot+9bYYJ/YBdQCg7Fb0xlD69Q/
hevry6Z1mrp1DlITou+TX2QKsiKTGYovKvN5omrZUKKsLs22IaSFMYpDzwWyvsia
PnBaQaWIohbfm1r+5e53Ld0nGbChg7FTWAhJUxbM4I2WZ0q9O3TY8/EhTPEYHoF+
+GGMVf1xGcbMl+8P45CXnftOlOJYTAk+kfbTHqdy2uHHuEUdM+sPsMVnc7OBITZq
prJu1dA2NU83gGLuFk9Phk7tuta65MbY5OBibcgpr3kpn93inaarlzhsd8GQ8UVf
Ags0NXfsIob+u73GpMJP7wx38ZVIftXv63ZWjpifmTtbVWiZC2L6uR1zkTGCsHzE
Oh5tT2I/bZsXZK0Segmjq8xnRJ3Z7a/fnR/BSf+m7vUQIZuHvgMuqwU0mnsbF4uv
7SXIoQvBp2nJgYRShV2DH2XyQWAiZVojT5KYlaXADtqVZl2AfFQ=
=SsLs
-----END PGP SIGNATURE-----

--vo4t74hlgmpxejui--

--===============0816655310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0816655310==--
