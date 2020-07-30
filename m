Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE82338A8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 21:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725B46E951;
	Thu, 30 Jul 2020 19:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0C6E951
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 19:06:55 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1D97206F5;
 Thu, 30 Jul 2020 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596136015;
 bh=1I8fO+aOE4GM8YnM8qo4Nuupe+/TzUrSp9geRjuPg7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zTI8TKPGCH5TvgmEZYVPZIu/SeTLs5dEOoKzcI8T5sGbuA4syJ7F4F59AJtqNkfTN
 IdQBuDXBoqIsIUodnJf8xzVyLbeV+gpv0gLLzRbfnncnFt67La4zr2MkMNS9EdF5DZ
 r05Orm18MH5SwELFo/25PICbJjNRLvMxxJLSm7y8=
Date: Thu, 30 Jul 2020 20:06:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v9 0/4] driver core: add probe error check helper
Message-ID: <20200730190634.GI5055@sirena.org.uk>
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
 <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
 <20200730164845.GE5055@sirena.org.uk>
 <CAKdAkRS+QooavPaKMcsaUQdRJGky_6JYq1EiUbyT_gcU3ZYeJw@mail.gmail.com>
 <20200730181639.GG5055@sirena.org.uk>
 <CAKdAkRSaF3q1MJ7mteD-4C4O58LL4FP6xpTovVOdu0v2VD=sAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKdAkRSaF3q1MJ7mteD-4C4O58LL4FP6xpTovVOdu0v2VD=sAQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1494899575=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1494899575==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6b3yLyRKT1M6kiA0"
Content-Disposition: inline


--6b3yLyRKT1M6kiA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 11:45:25AM -0700, Dmitry Torokhov wrote:
> On Thu, Jul 30, 2020 at 11:16 AM Mark Brown <broonie@kernel.org> wrote:

> > You can sometimes do a better job of explaining what the resource you
> > were looking for was,

> I think it is true for very esoteric cases. I.e. your driver uses 2
> interrupt lines, or something like that. For GPIO, regulators, and
> clocks we normally have a name/connection ID that provides enough of

*Normally* but not always - some of the older bindings do love their
arrays of phandles (or mixes of numbers and phandles!) unfortunately.

> context. We need to remember, the error messages really only make
> total sense to a person familiar with the driver to begin with, not
> for a random person looking at the log.

Not really, one of the big targets is people doing system integration
who are writing a DT or possibly producing a highly tuned kernel config.
They needn't have a strong familiarity with the driver, they're often
just picking it up off the shelf.

> > and of course you still need diagnostics in the
> > non-deferral case.  Whatever happens we'll need a lot of per-driver
> > churn, either removing existing diagnostics that get factored into cores
> > or updating to use this new API.

> The point is if you push it into core you'll get the benefit of
> notifying about the deferral (and can "attach" deferral reason to a
> device) without changing drivers at all. You can clean them up later
> if you want, or decide that additional logging in error paths does not
> hurt. This new API does not do you any good unless you convert
> drivers, and you need to convert the majority of them to be able to
> rely on the deferral diagnostic that is being added.

The push for this is that there's already people going around modifying
drivers whatever happens but at present they're mainly trying to delete
diagnostics which isn't wonderful.  Besides, even if we push things into
the subsystems they'd want to use this interface or something quite like
it anyway - it's more a question of if we go quickly add some users to
subsystems isn't it?  I'm not against that.

--6b3yLyRKT1M6kiA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jGjoACgkQJNaLcl1U
h9BywAf8C7mJ7xiPFi7qLH/+T9F0CBF3SL6/ubMOaNhmgrWz+rz2qb5TTQ1adyjl
GiUu7DQbZhoWvWxb/8fqdy4BufqP58KbV53l0Oy6loVslM914RzzWcHv2hRT16wn
nMTVtBOfXjxT6Dv6UYNQs7a3XxaOLFx6SNDydn5bAoQNxz2r6+lPCIlevPOIVwyV
W41iFyk6AeACKSDbKSi7R/eP8apDELZTV1JQMv9kFQjPi0Qn+g/BvH6AjtJWlBke
CssSrTU7H/Ifu0yJqGaCyYWHgb8A7C8A4NOYpHwbkwhJ0q8bT3BbMlc7785n8C08
MT1LDTbH/SJqhnox2e+FWjcDkEyAJA==
=Dnzb
-----END PGP SIGNATURE-----

--6b3yLyRKT1M6kiA0--

--===============1494899575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1494899575==--
