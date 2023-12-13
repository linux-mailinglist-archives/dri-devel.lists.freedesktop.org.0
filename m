Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A505811092
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1417E10E797;
	Wed, 13 Dec 2023 11:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7215710E7AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B07E61C4E;
 Wed, 13 Dec 2023 11:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC807C433C8;
 Wed, 13 Dec 2023 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702468457;
 bh=iHthuXB7sfzZcg98+EKwHTXcS8ZvmQ4BanSBcAsrHIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MjnnVZ0S7rVIKkqnGTiQ4DlqE2/wYLDD+AwPYhVsgGx6Eii2AQtoaWS7SymKrgfJF
 Ttkwe0ZPFeMuRktLhUTlDjtSv+F0Euq61k8svBaGRGYZIkq8ylsQsBIBfwbf4AnqWo
 VDKv7GvOb0WtVWDbzkCxmes4wW6Qhes/ZC5J2Xq5JiutrXqMccJLknAKOIqSNHcQoA
 1cS6vcPQtfv/3ocOXTNm36GO4yA3C8uiDNEy1eUrlM4g3ReHOjoYYVLiBUCDL+5aqu
 5NE/cfH4OP74Pg+t5zJ7YzInYoIFTK11scS0e4Nd8Uwh8X7GLXRNKNFcXUZzibD43+
 hNyjWepgZ0BMw==
Date: Wed, 13 Dec 2023 12:54:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <6wnsxbi27xdxjtaqaaaq5wtwwilp4jfw4mg5y2ctdl7xrs44ry@ns6y36pf7hge>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nuge2gzlt63erkrn"
Content-Disposition: inline
In-Reply-To: <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, kernel@pengutronix.de,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nuge2gzlt63erkrn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:08:29PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> > On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > clk_rate_exclusive_get() returns zero unconditionally. Most users=
 "know"
> > > > > that and don't check the return value. This series fixes the four=
 users
> > > > > that do error checking on the returned value and then makes funct=
ion
> > > > > return void.
> > > > >=20
> > > > > Given that the changes to the drivers are simple and so merge con=
flicts
> > > > > (if any) should be easy to handle, I suggest to merge this comple=
te
> > > > > series via the clk tree.
> > > >=20
> > > > I don't think it's the right way to go about it.
> > > >=20
> > > > clk_rate_exclusive_get() should be expected to fail. For example if
> > > > there's another user getting an exclusive rate on the same clock.
> > > >=20
> > > > If we're not checking for it right now, then it should probably be
> > > > fixed, but the callers checking for the error are right to do so if=
 they
> > > > rely on an exclusive rate. It's the ones that don't that should be
> > > > modified.
> > >=20
> > > If some other consumer has already "locked" a clock that I call
> > > clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
> > > this function because I don't want the rate to change e.g. because I
> > > setup some registers in the consuming device to provide a fixed UART
> > > baud rate or i2c bus frequency (and that works as expected).
> >=20
> > [a long text of mostly right things (Uwe's interpretation) that are
> > however totally unrelated to the patches under discussion.]

I'm glad you consider it "mostly" right.

>=20
> The clk API works with and without my patches in exactly the same way.
> It just makes more explicit that clk_rate_exclusive_get() cannot fail
> today and removes the error handling from consumers that is never used.

Not really, no.

An API is an interface, meant to provide an abstraction. The only
relevant thing is whether or not that function, from an abstract point
of view, can fail.

Can you fail to get the exclusivity? Yes. On a theoretical basis, you
can, and the function was explicitly documented as such.

Whether or not the function actually can fail in its current
implementation is irrelevant.

> Yes, my series doesn't fix any race conditions that are there without
> doubt in some consumers. It also doesn't make the situation any worse.

Sure it does. If we ever improve that function to handle those unrelated
cases, then all your patches will have to be reverted, while we already
had code to deal with it written down.

> It also doesn't fix other problems that are orthogonal to the intention
> of this patch series (neither makes it any of them any worse).
>=20
> It's just dead code removal and making sure no new dead code of the same
> type is introduced in the future.

Again, it's not. It's a modification of the abstraction.

> Is there anyone working on improving the clk framework regarding how clk
> rate exclusivity works? I'd probably not notice, but I guess there is
> noone that I need to consider for.

I started working on it.

Maxime

--nuge2gzlt63erkrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXmbZgAKCRDj7w1vZxhR
xeNbAPsE+NnFuPDNbesYJ/zccKjzlV8dYIxZVV6ktpsHP6v5fwEAuyJ0fCkI9TXf
zyJQ9dsVbHuR1MO93Vzy2Jkp7HckJg8=
=gX+r
-----END PGP SIGNATURE-----

--nuge2gzlt63erkrn--
