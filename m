Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F809810C8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 09:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7910E25A;
	Wed, 13 Dec 2023 08:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9B510E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6BDB61AFA;
 Wed, 13 Dec 2023 08:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18385C433C7;
 Wed, 13 Dec 2023 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702456612;
 bh=CiIBmvqhvhMAh8ZXlMaK2fWPYP5wC1YNvSEZRMY1RKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=avoISUBPqyE6owTM5E74LjlMs6Q+1IhUpBwlR2gEU49013lofFUDms/OAhOakD9VD
 8ycMof3UhNS8QZNHTwRhq46ZGd5bmZS2hzYthKXf0zAR4zcvixXSqO8Ap+F+1s7LkF
 XLfFVuVSgSuqd9OHOvDuxlvWT6Hk/o6RSZl9yVgEsPdNCAuTFhOMNbEjL9xKSP212S
 YhSoeiiSdAfqClqBMTpWzvFnynBafXXuWUIBT7e1EE50mMFacsinbEXNeGqXJFjtv6
 YexjKFLyv46GI6vGF6uYKPQW+0ZtGlJeX8mSxWbMYWIaXgtoJVB+yxEwRkamZedB3U
 vRXuAVpsmVkjQ==
Date: Wed, 13 Dec 2023 09:36:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x53dnxxvipfwjdrs"
Content-Disposition: inline
In-Reply-To: <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
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
 kernel@pengutronix.de, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x53dnxxvipfwjdrs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > > clk_rate_exclusive_get() returns zero unconditionally. Most users "kn=
ow"
> > > that and don't check the return value. This series fixes the four use=
rs
> > > that do error checking on the returned value and then makes function
> > > return void.
> > >=20
> > > Given that the changes to the drivers are simple and so merge conflic=
ts
> > > (if any) should be easy to handle, I suggest to merge this complete
> > > series via the clk tree.
> >=20
> > I don't think it's the right way to go about it.
> >=20
> > clk_rate_exclusive_get() should be expected to fail. For example if
> > there's another user getting an exclusive rate on the same clock.
> >=20
> > If we're not checking for it right now, then it should probably be
> > fixed, but the callers checking for the error are right to do so if they
> > rely on an exclusive rate. It's the ones that don't that should be
> > modified.
>=20
> If some other consumer has already "locked" a clock that I call
> clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
> this function because I don't want the rate to change e.g. because I
> setup some registers in the consuming device to provide a fixed UART
> baud rate or i2c bus frequency (and that works as expected).

I guess it's a larger conversation, but I don't see how that can
possibly work.

The way the API is designed, you have no guarantee (outside of
clk_rate_exclusive_*) that the rate is going to change.

And clk_rate_exclusive_get() doesn't allow the rate to change while in
the "critical section".

So the only possible thing to do is clk_set_rate() +
clk_rate_exclusive_get().

So there's a window where the clock can indeed be changed, and the
consumer that is about to lock its rate wouldn't be aware of it.

I guess it would work if you don't care about the rate at all, you just
want to make sure it doesn't change.

Out of the 7 users of that function, 3 are in that situation, so I guess
it's fair.

3 are open to that race condition I mentioned above.

1 is calling clk_set_rate while in the critical section, which works if
there's a single user but not if there's multiple, so it should be
discouraged.

> In this case I won't be able to change the rate of the clock, but that
> is signalled by clk_set_rate() failing (iff and when I need awother
> rate) which also seems the right place to fail to me.

Which is ignored by like half the callers, including the one odd case I
mentioned above.

And that's super confusing still: you can *always* get exclusivity, but
not always do whatever you want with the rate when you have it? How are
drivers supposed to recover from that? You can handle failing to get
exclusivity, but certainly not working around variable guarantees.

> It's like that since clk_rate_exclusive_get() was introduced in 2017
> (commit 55e9b8b7b806ec3f9a8817e13596682a5981c19c).

Right, but "it's always been that way" surely can't be an argument,
otherwise you wouldn't have done that series in the first place.

> BTW, I just noticed that my assertion "Most users \"know\" that
> [clk_rate_exclusive_get() returns zero unconditionally]" is wrong. As of
> next-20231213 there are 3 callers ignoring the return value of
> clk_rate_exclusive_get() and 4 that handle (imaginary) returned errors.
> I expected this function to be used more extensively. (In fact I think
> it should be used more as several drivers rely on the clk rate not
> changing.)

Yes, but also it's super difficult to use in practice, and most devices
don't care.

The current situation is something like this:

  * Only a handful of devices really care about their clock rate, and
    often only for one of their clock if they have several. You would
    probably get all the devices that create an analog signal somehow
    there, so audio, display, i2c, spi, uarts, etc. Plus the ones doing
    frequency scaling so CPU and GPUs.

  * CPUs and GPUs are very likely to have a dedicated clock, so we can
    rule the "another user is going to mess with my clock" case.

  * UARTs/i2c/etc. are usually taking their clock from the bus interface
    directly which is pretty much never going to change (for good
    reason). And the rate of the bus is not really likely to change.

  * SPI/NAND/MMC usually have their dedicated clock too, and the bus
    rate is not likely to change after the initial setup either.

So, the only affected devices are the ones generating external signals,
with the rate changing during the life of the system. Even for audio or
video devices, that's fairly unlikely to happen. And you need to have
multiple devices sharing the same clock tree for that issue to occur,
which is further reducing the chances it happens.

Realistically speaking, this only occurs with multi-head display outputs
where it's somewhat likely to have all the display controllers feeding
=66rom the same clock, and the power up of the various output is done in
sequence which creates that situation.

And even then, the clk_rate_exclusive_* interface effectively locks the
entire clock subtree to its current rate, so the effect on the rest of
the devices can be significant.

So... yeah. Even though you're right, it's trying to address a problem
that is super unlikely to happen with a pretty big hammer that might be
too much for most. So it's not really surprising it's not used more.

Maxime

--x53dnxxvipfwjdrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXltIQAKCRDj7w1vZxhR
xQ4nAQCBBLx3VnYsE9S8sZc3wgJurUaw630uZ9Q/w4XBCEwZEgD+If/VH1UlIu50
NxjLsx/MhDEaTfAwEDKFRFBDw4NApwM=
=4bbu
-----END PGP SIGNATURE-----

--x53dnxxvipfwjdrs--
