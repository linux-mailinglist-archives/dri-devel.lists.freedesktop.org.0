Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4F51CAE6
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED84910E1BF;
	Thu,  5 May 2022 21:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8417B10E1BF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 21:08:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60B0CB82FAE;
 Thu,  5 May 2022 21:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D9FC385A4;
 Thu,  5 May 2022 21:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651784895;
 bh=Xjk8ll4wXPxgCOFR2l28+P74rOKIvD1Dm/QgUNA9pag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ar2rqbEXxxUf0SSH9VBzwA5HPeai/2wedNXeeF4BR/i9vLjlsWgr2YOh5qPlLQKDi
 E1wP0vtfm4sz6KHfytEYVsc3ZmlqpPFZP+KhyiY/p3nMtkWa9JFyOyVAyIIA09Z/5Y
 lnG622aIbuU1eXB8ZiXbXJRTFw1TV182zyNWbUH5vtrokAVN6D2wLuDezYS94Gpmbp
 BAYUYwI8cve68n10JL8wqZF0pf+FI4AOcXblnwtNgVJJGDFA1fe7Ms/kwj8OIVrAR4
 GAlNqUGMebg40yxU0Wz+fmggCJSZA+pglz+ic7aoiQpWzI26Ph2ru+KKuGqKhSNLWm
 47mFksjqCYxqQ==
Date: Thu, 5 May 2022 22:08:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-ID: <YnQ8uqMBFJc+LV4l@sirena.org.uk>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <88edf09b-fca9-26b1-1366-94976c6ce2a0@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CQ01jN/0AqoMtdjG"
Content-Disposition: inline
In-Reply-To: <88edf09b-fca9-26b1-1366-94976c6ce2a0@denx.de>
X-Cookie: Real programs don't eat cache.
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 jagan@amarulasolutions.com, tzimmermann@suse.de, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--CQ01jN/0AqoMtdjG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 07:32:23PM +0200, Marek Vasut wrote:
> On 5/5/22 17:12, Mark Brown wrote:
> > On Sat, 30 Apr 2022 04:51:44 +0200, Marek Vasut wrote:

> > > Currently the regmap_config structure only allows the user to implement
> > > single element register read/write using .reg_read/.reg_write callbacks.

> > [1/2] regmap: Add bulk read/write callbacks into regmap_config
> >        commit: d77e745613680c54708470402e2b623dcd769681

> I was really hoping this would get a lot more review / comments before this
> is applied.

I can easily punt for this release, though TBH I'm not anticipating huge
numbers of comments on a regmap patch unless it breaks things for
people, they tend to be very quiet.  I did go through it and didn't spot
any issues so it seemed like the testing coverage would be useful here.
Are there specific things you're worried about that you'd like feedback
on?

--CQ01jN/0AqoMtdjG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ0PLkACgkQJNaLcl1U
h9BkCwf9HSTaryl2iCC9YukCl/SXxYQ7M/nhzSq3Vza4+V3AO1t1mfzYuBt4YDLn
QYLGgmuW12bvjZ0A5UlrOZnfr+CQhwXUtK8o1ECGkWZWz72GWeE2YLX/esKEYmj3
P57jv5O3wJJa7u1ykkQsGxLQ/zYtX7bELV6HIvxVE9gGqsZJszAYFnrv/u7iAIcm
0PuyG0zO1eOM2z7UtxvaP7Mhiejiu6oVJRWlxN99PtBj5rgy0IJb9H8nF1qHJygt
EDpM8Ug4y4Ej/E3Niw0Wffuj+0ifRpEN+PtnKoGcYHGfGsrFyephIRxOhPERofxB
/WTfFqG7YtkXuYZ1ljMabQZ7hWOVjw==
=97nh
-----END PGP SIGNATURE-----

--CQ01jN/0AqoMtdjG--
