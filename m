Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9F814FDC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 19:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2478410EA58;
	Fri, 15 Dec 2023 18:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777910EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 18:49:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEDFb-0001zZ-6T; Fri, 15 Dec 2023 19:49:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEDFW-00G5Sf-UJ; Fri, 15 Dec 2023 19:49:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEDFW-003l37-Jo; Fri, 15 Dec 2023 19:49:26 +0100
Date: Fri, 15 Dec 2023 19:49:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231215184926.6l4otbltfxzwy3ep@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
 <6wnsxbi27xdxjtaqaaaq5wtwwilp4jfw4mg5y2ctdl7xrs44ry@ns6y36pf7hge>
 <20231213155252.eq6cdzk2vuwllzdu@pengutronix.de>
 <nsa54fwu4ewmcaehesuqefoo5r7z3tuvj76hjb4ngtkaygxwxx@h73ihjon5gby>
 <20231215151547.y23fgs6hskng5izg@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rkioatefql2ulu6v"
Content-Disposition: inline
In-Reply-To: <20231215151547.y23fgs6hskng5izg@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rkioatefql2ulu6v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

On Fri, Dec 15, 2023 at 04:15:47PM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Dec 15, 2023 at 01:34:26PM +0100, Maxime Ripard wrote:
> > On Wed, Dec 13, 2023 at 04:52:52PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Dec 13, 2023 at 12:54:14PM +0100, Maxime Ripard wrote:
> > > > On Wed, Dec 13, 2023 at 12:08:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> > > > > > On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wr=
ote:
> > > > > > > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > > > > > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6ni=
g wrote:
> > > > > > > > > clk_rate_exclusive_get() returns zero unconditionally. Mo=
st users "know"
> > > > > > > > > that and don't check the return value. This series fixes =
the four users
> > > > > > > > > that do error checking on the returned value and then mak=
es function
> > > > > > > > > return void.
> > > > > > > > >=20
> > > > > > > > > Given that the changes to the drivers are simple and so m=
erge conflicts
> > > > > > > > > (if any) should be easy to handle, I suggest to merge thi=
s complete
> > > > > > > > > series via the clk tree.
> > > > > > > >=20
> > > > > > > > I don't think it's the right way to go about it.
> > > > > > > >=20
> > > > > > > > clk_rate_exclusive_get() should be expected to fail. For ex=
ample if
> > > > > > > > there's another user getting an exclusive rate on the same =
clock.
> > > > > > > >=20
> > > > > > > > If we're not checking for it right now, then it should prob=
ably be
> > > > > > > > fixed, but the callers checking for the error are right to =
do so if they
> > > > > > > > rely on an exclusive rate. It's the ones that don't that sh=
ould be
> > > > > > > > modified.
> > > > > > >=20
> > > > > > > If some other consumer has already "locked" a clock that I ca=
ll
> > > > > > > clk_rate_exclusive_get() for, this isn't an error. In my bubb=
le I call
> > > > > > > this function because I don't want the rate to change e.g. be=
cause I
> > > > > > > setup some registers in the consuming device to provide a fix=
ed UART
> > > > > > > baud rate or i2c bus frequency (and that works as expected).
> > > > > >=20
> > > > > > [a long text of mostly right things (Uwe's interpretation) that=
 are
> > > > > > however totally unrelated to the patches under discussion.]
> > > >=20
> > > > I'm glad you consider it "mostly" right.
> > >=20
> > > there was no offense intended. I didn't agree to all points, but didn=
't
> > > think it was helpful to discuss that given that I considered them
> > > orthogonal to my suggested modifications.
> > > =20
> > > > > The clk API works with and without my patches in exactly the same=
 way.
> > > > > It just makes more explicit that clk_rate_exclusive_get() cannot =
fail
> > > > > today and removes the error handling from consumers that is never=
 used.
> > > >=20
> > > > Not really, no.
> > >=20
> > > What exactly do you oppose here? Both of my sentences are correct?!
> >=20
> > That the API works in the exact same way.
>=20
> Yeah ok, if you call clk_rate_exclusive_get() and want to check the
> return code you always got 0 before and now you get a compiler error. So
> there is a difference. What I meant is: Calling clk_rate_exclusive_get()
> with my patches has the exact same effects as before (apart from setting
> the register used to transport the return value to zero).
> =20
> > > > Can you fail to get the exclusivity? Yes. On a theoretical basis, y=
ou
> > > > can, and the function was explicitly documented as such.
> > >=20
> > > Sure, you could modify the clk internals such that
> > > clk_rate_exclusive_get() needs to allocate memory. Or that it fails if
> > > another consumer already has called it. At least the latter is a chan=
ge
> > > in semantics that requires to review (and maybe fix) all users. Also
> > > note that calling clk_rate_exclusive_get() essentially locks all pare=
nt
> > > clocks up to the root clock. So if clk_rate_exclusive_get() fails in =
the
> > > presence of another locker, you can only have one locker per clock
> > > hierarchy because it's impossible that both grab the lock on the root
> > > clock.
> >=20
> > We're not discussing the same thing. You're talking about from a
> > technical point of view, I'm talking about it from an abstraction point
> > of view.
>=20
> In your abstract argumentation clk_rate_exclusive_get() has a
> different and stronger semantic than it has today. This stronger
> semantic indeed will make this function not succeed in every case. It
> should return an error indication and users should check it.
>=20
> But as your clk_rate_exclusive_get() is a different function than
> today's clk_rate_exclusive_get(), I still think our argument isn't
> helpful. I want to do something with apples and you're arguing against
> that by only talking about oranges.
>=20
> > Let's use another example: kmalloc cannot fail.
>=20
> Oh really?
>=20
> ... [a few greps later] ...
>=20
> While the memory allocation stuff is sufficiently complex that I don't
> claim to have grokked it, I think it can (and should) fail. Either I
> missed something, or I just burned some more time to convince myself
> that kmalloc is just another orange :-\

A colleague pointed me to https://lwn.net/Articles/627419/ which
suggests that indeed kmalloc doesn't fail in most situations. The
relevant difference to the clk_rate_exclusive_get() function is that
making kmalloc fail would result in a better (more robust) kernel. And
so I'm on your side that removing error codes probably isn't a smart
move even if probably nobody will tackle the obvious improvement to
kmalloc any time soon.

If I understand your plans correctly, you intend to introduce a "give me
exclusive control over the clk rate" function (let's call it
clk_rate_lock_maxime() just to have a name for it). You would implement
clk_rate_lock_maxime() in a way that it would fail for a second caller,
right? And that's because the second caller wouldn't be able to call
clk_set_rate() and/or it would stop the first caller from being able to
change the rate. (Which one? Both?)

What if a consumer installed a clock notifier that refuses any rate
change. Would calling clk_rate_lock_maxime() by another consumer fail?
A "yes" would be hard to implement, because you cannot reliably see for
a given installed notifier if it refuses changing the clock. A "no"
would be inconsistent, because the holder of clk_rate_lock_maxime()
cannot change the rate then.

After that destructive excursion, let me try being more constructive:

Would you consider renaming clk_rate_exclusive_get() to clk_rate_lock()
an improvement? Maybe also make the clk rate readonly for the caller
then. (I wouldn't require that, but a colleague argued that would make
the semantic of that function simpler.) As in my use case I don't want
to modify the clock, that's good enough for me. Also that function can
be implemented in a way that never fails, so it could return void.

Is that a compromise that you would agree on?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rkioatefql2ulu6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV8n7UACgkQj4D7WH0S
/k5YVAgAqlIT2aVTclt4IB/dZ6SARAgnfzg5TqFbsFqHjzq24MvstiRq7jkr/Uw+
cgzUiHVfBCrcZRH7QlP0LciL1mukzaLPz3ocxbLLeryHRFTrLxuUqkwy+IPcPEGa
cwGlifDHAZEm+l/7tVpj0EBCoM7f6MW/DyWReldxADkcXpTU+xF3cS2AnE0ZrZ2D
ZK43F4KLEny4fGn2gD4YPSVr5DNirAWdOQc0bSjA50pNEivo3WaQsHxKiEeOPHTQ
F7sOs8FThR97aoUt2V27t1ImZzQ0ZOAUnhZ+XVx7uISWZCrresfg9/L80U6bdxVg
oh1p1qCh+qO+/MV39OUBoAA1dXcVKQ==
=L2Y7
-----END PGP SIGNATURE-----

--rkioatefql2ulu6v--
