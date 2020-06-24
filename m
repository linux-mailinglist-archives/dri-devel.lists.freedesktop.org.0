Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5320766C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FFD6E0F1;
	Wed, 24 Jun 2020 15:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10C16E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:36 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F352C2070A;
 Wed, 24 Jun 2020 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593011076;
 bh=sjyWN89n2WVn1nir58rJre28qTxK1Z7LKlW6WPjB498=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OuktBilcZV/yDm2z+dLzle3X5u04XthtuHlAreC1y/MG37F7osJCt8BQdho0fFtnr
 Zbqy05zYZlwITMtBKJjdgZIWp5dN5nafQF6fts3sxdifBfIuD3LxBGLbx0T8m0No9r
 Vs25zXTH+3WgSZPmxueQywLc30VHf7n177WG8R10=
Date: Wed, 24 Jun 2020 16:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
Message-ID: <20200624150434.GH5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
 <CAHp75VfpP1cGK3FvTL0hBudRY2N_7GpXYRuUHUCipz7X2sMLmQ@mail.gmail.com>
 <be755825-b413-e5c1-7ea4-06506b20d1f0@arm.com>
MIME-Version: 1.0
In-Reply-To: <be755825-b413-e5c1-7ea4-06506b20d1f0@arm.com>
X-Cookie: So this is it.  We're going to die.
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: multipart/mixed; boundary="===============0616714112=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0616714112==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 03:25:33PM +0100, Robin Murphy wrote:

> And yeah, anyone who pipes up suggesting that places where an ERR_PTR value
> could be passed to probe_err() could simply refactor IS_ERR() checks with
> more uses of the god-awful PTR_ERR_OR_ZERO() obfuscator gets a long stare of
> disapproval...

We could also have a probe_err_ptr() or something that took an ERR_PTR()
instead if there really were an issue with explicitly doing this.

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7za4EACgkQJNaLcl1U
h9ADKQf/bUGsVZLtJzgP2M/GIXNWTFrshhTPYFVHuKWmwRJL79fSW758BKdmbzdF
fYDZdgI3NMUnfpBaL7MmdmAlazwJ97Mci7lVIckChwBKZWo7QT/oe8RZlp+mGlbr
6kSNJDIQgTdBEtx1T6VYHhEnZgjn5KRgZHTp2SVd1SaJ6StGr2w29XvLABxfekXl
OLdDcSIHN0eUWZoLx/fjDrB3Wic9JzbEzj7rFZ6Zfr5py3VxUseRexpXikjW9YEa
VejUE8Z0brYa021cZqMymq0G++v+JeATDEzCsYMJ3VGsHgBfSVJrIHfxtx9dJHv+
dHEFhwK7rmIkGPziGlBbph8Bncxuhg==
=wsw7
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--

--===============0616714112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0616714112==--
