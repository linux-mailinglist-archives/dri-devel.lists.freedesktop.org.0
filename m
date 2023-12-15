Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6D814828
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 13:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A597F10E122;
	Fri, 15 Dec 2023 12:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B7D10E122
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 12:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6B2E6B82817;
 Fri, 15 Dec 2023 12:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45979C433C8;
 Fri, 15 Dec 2023 12:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702643668;
 bh=FaCZ2fNraad49PiDtX3wes78ymtVFrS8O37vDr/7Bwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqGTdqkSJTbeNCkys9izOFrKzzGLhSAUGY0S7zmNMp1fq9I+nGBTZ82rMYGw37rBh
 YzsNrhE8bM3v+zM28ABp2cZCG3Xndyrx42SAlCImrSLIixr9CIiqpCuoWbH11oSw1o
 H6d2m1s6vJpfhUc+yl3E8goo8CkW2kf2Z5GnIEz9BdmyvAem7g3SL0PJlPC9T0sf8G
 bJrNdNN631TrOa5WbwoBq4/yfSS0xIg/FVZ+6BEmBDR5OaswBheC9dSsAnaMqFSG31
 3oCNJU4tNUgVycsGEWUuuAQY6lh1gZPM4LKW/3+mAxzk6GGV5DIlHW3//laGWdYu0E
 BvWrQPiud4/0w==
Date: Fri, 15 Dec 2023 13:34:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <nsa54fwu4ewmcaehesuqefoo5r7z3tuvj76hjb4ngtkaygxwxx@h73ihjon5gby>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
 <6wnsxbi27xdxjtaqaaaq5wtwwilp4jfw4mg5y2ctdl7xrs44ry@ns6y36pf7hge>
 <20231213155252.eq6cdzk2vuwllzdu@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wu77dsjz7uev4rk4"
Content-Disposition: inline
In-Reply-To: <20231213155252.eq6cdzk2vuwllzdu@pengutronix.de>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de, Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wu77dsjz7uev4rk4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 04:52:52PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Dec 13, 2023 at 12:54:14PM +0100, Maxime Ripard wrote:
> > On Wed, Dec 13, 2023 at 12:08:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> > > > On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > > > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wr=
ote:
> > > > > > > clk_rate_exclusive_get() returns zero unconditionally. Most u=
sers "know"
> > > > > > > that and don't check the return value. This series fixes the =
four users
> > > > > > > that do error checking on the returned value and then makes f=
unction
> > > > > > > return void.
> > > > > > >=20
> > > > > > > Given that the changes to the drivers are simple and so merge=
 conflicts
> > > > > > > (if any) should be easy to handle, I suggest to merge this co=
mplete
> > > > > > > series via the clk tree.
> > > > > >=20
> > > > > > I don't think it's the right way to go about it.
> > > > > >=20
> > > > > > clk_rate_exclusive_get() should be expected to fail. For exampl=
e if
> > > > > > there's another user getting an exclusive rate on the same cloc=
k.
> > > > > >=20
> > > > > > If we're not checking for it right now, then it should probably=
 be
> > > > > > fixed, but the callers checking for the error are right to do s=
o if they
> > > > > > rely on an exclusive rate. It's the ones that don't that should=
 be
> > > > > > modified.
> > > > >=20
> > > > > If some other consumer has already "locked" a clock that I call
> > > > > clk_rate_exclusive_get() for, this isn't an error. In my bubble I=
 call
> > > > > this function because I don't want the rate to change e.g. becaus=
e I
> > > > > setup some registers in the consuming device to provide a fixed U=
ART
> > > > > baud rate or i2c bus frequency (and that works as expected).
> > > >=20
> > > > [a long text of mostly right things (Uwe's interpretation) that are
> > > > however totally unrelated to the patches under discussion.]
> >=20
> > I'm glad you consider it "mostly" right.
>=20
> there was no offense intended. I didn't agree to all points, but didn't
> think it was helpful to discuss that given that I considered them
> orthogonal to my suggested modifications.
> =20
> > > The clk API works with and without my patches in exactly the same way.
> > > It just makes more explicit that clk_rate_exclusive_get() cannot fail
> > > today and removes the error handling from consumers that is never use=
d.
> >=20
> > Not really, no.
>=20
> What exactly do you oppose here? Both of my sentences are correct?!

That the API works in the exact same way.

> > An API is an interface, meant to provide an abstraction. The only
> > relevant thing is whether or not that function, from an abstract point
> > of view, can fail.
>=20
> What is the ideal API that you imagine? For me the ideal API is:
>=20
> A consumer might call clk_rate_exclusive_get() and after that returns
> all other consumers are prohibited to change the rate of the clock
> (directly and indirectly) until clk_rate_exclusive_put() is called. If
> this ends in a double lock (i.e. two different consumers locked the
> clock), then I cannot change the rate (and neither can anybody else).
>=20
> That is fine iff I don't need to change the rate and just want to rely
> on it to keep its current value (which is a valid use case). And if I
> want to change the rate but another consumer prevents that, I handle
> that in the same away as I handle all other failures to set the rate to
> the value I need. I have to prepare for that anyhow even if I have
> ensured that I'm the only one having exclusivity on that clock.
>=20
> Letting clk_rate_exclusive_get() fail in the assumption that the
> consumer also wants to modify the rate is wrong. The obvious point where
> to stop such consumers is when they call clk_rate_set(). And those who
> don't modify the rate then continue without interruption even if there
> are two lockers.
>=20
> This can easily be implemented without clk_rate_exclusive_get() ever
> failing.
>=20
> > Can you fail to get the exclusivity? Yes. On a theoretical basis, you
> > can, and the function was explicitly documented as such.
>=20
> Sure, you could modify the clk internals such that
> clk_rate_exclusive_get() needs to allocate memory. Or that it fails if
> another consumer already has called it. At least the latter is a change
> in semantics that requires to review (and maybe fix) all users. Also
> note that calling clk_rate_exclusive_get() essentially locks all parent
> clocks up to the root clock. So if clk_rate_exclusive_get() fails in the
> presence of another locker, you can only have one locker per clock
> hierarchy because it's impossible that both grab the lock on the root
> clock.

We're not discussing the same thing. You're talking about from a
technical point of view, I'm talking about it from an abstraction point
of view. Let's use another example: kmalloc cannot fail. Are we going to
remove every possible check for a null pointer in the kernel?

No, of course we won't, because at some point it might and the error
handling will be valuable.

Same story here.

Maxime

--wu77dsjz7uev4rk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxH0gAKCRDj7w1vZxhR
xV/qAQD3/+x4S05zuQ5N2nfPdpjw4SxrkhoevmzHBpy1FgHZiQD/VV4FJjb2kuQG
qaKs9P5j71Zv3P0kGzQhaFxK9fkLCws=
=lYpt
-----END PGP SIGNATURE-----

--wu77dsjz7uev4rk4--
