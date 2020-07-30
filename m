Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47B233844
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 20:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35796E93F;
	Thu, 30 Jul 2020 18:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1D6E93F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 18:16:59 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D6AA20829;
 Thu, 30 Jul 2020 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596133019;
 bh=LBCwuVVf2MFMPMEHXM5IvbF8TsLWJpQcKK8QGu1gYp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwq0nnZj/hIgvH8uNBimB+cd8SjqqJMtQnnMlxXej5RIfBUckzOQvJdYznOX/gFC1
 /5l+CPMhHKGIFDjovC6MrhJmRay6Pv6Fypo4qqiobgGCp5VAEA7JO2N0ZTQ9PGX//b
 bgvfhRAYufUeGmxt/W+oMOlIjxVsCCEDMZeuQgw0=
Date: Thu, 30 Jul 2020 19:16:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v9 0/4] driver core: add probe error check helper
Message-ID: <20200730181639.GG5055@sirena.org.uk>
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
 <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
 <20200730164845.GE5055@sirena.org.uk>
 <CAKdAkRS+QooavPaKMcsaUQdRJGky_6JYq1EiUbyT_gcU3ZYeJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKdAkRS+QooavPaKMcsaUQdRJGky_6JYq1EiUbyT_gcU3ZYeJw@mail.gmail.com>
X-Cookie: Alex Haley was adopted!
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1803529010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1803529010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 10:46:31AM -0700, Dmitry Torokhov wrote:
> On Thu, Jul 30, 2020 at 9:49 AM Mark Brown <broonie@kernel.org> wrote:

> > The error messages are frequently in the caller rather than the
> > frameworks, it's often helpful for the comprehensibility of the error
> > messages especially in cases where things may be legitimately absent.

> Not for deferral. All you need to know in this case is:

> "device A is attempting to request resource B which is not ready yet"

> There is nothing to handle on the caller part except to float the error up.

You can sometimes do a better job of explaining what the resource you
were looking for was, and of course you still need diagnostics in the
non-deferral case.  Whatever happens we'll need a lot of per-driver
churn, either removing existing diagnostics that get factored into cores
or updating to use this new API.

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jDoYACgkQJNaLcl1U
h9A2DQf5AbA6hQnpkocd7NNW+Fw34/watcpGeOf4wGfEJJJ4gI4gUx6kg6uRWIA3
UgGG/DpJJATR3MPX7tldkjFb65ha6uxYu7Vv2/hHbGYepe+0ta2ne1R/DMePZC6x
RTi7Fp5kuRndOAYjdJYTKWHDPh/Wq1eqaZ7qQVmon4pTuj/MxQwGARkI9eaw2/B0
PxQCmeNPpAadkihizL2VQQdf/L8kL0OsGieJq/SF2Dcv7gp6XWcddLBzTX2hhWhd
2ZODZdYj0aaQwirjVx2ckwl6Ijioaod+RslHEYfoLWjIHRV0326rQjKMqhHjhaQ8
P6vn0hVhQYM8huV6o6MxPRLHutQ4fw==
=OEO+
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--

--===============1803529010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803529010==--
