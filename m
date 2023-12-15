Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099FD81443F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 10:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528310E168;
	Fri, 15 Dec 2023 09:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C9C10E168
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 09:11:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BED04CE2C66;
 Fri, 15 Dec 2023 09:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D68C433C7;
 Fri, 15 Dec 2023 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702631480;
 bh=kKCmxtcl5MSg424p40e+BsGHD8SMbZdxG9H2LxbPPow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XTGFD5gAci2HZRlK8c56c9BnKf6Ep9j4jkK4gWJd3uhtUhNjkdvBJaeKnDVnQjb5W
 8zrUmyeT0DDb5fiIcnTUtqaaEgZP55SBQeTDYGdtQqCex1xV5VquEoZweJY40uSBH7
 U9nu83bDyhpJTbyNG8h8n5zrZjER9j3Sy7DEeFfpsrgDZBw5htbt3r/UHng/Y9L0by
 eJ/NZwkX/jG9j6K2g6vav0cgDbhJp3m+AZRA4uVMcHq2afEU7bNrdcplQAk7n7qf1k
 7lD3ZH84PdJOvbuVfdwa+j2KUzFOrQvhPAg6TMTmzFKbjxC0pR9I372I0TnT+msS9z
 L5eYPk0My5cqg==
Date: Fri, 15 Dec 2023 10:11:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <lpcmyqxmf24tuwt72uxb6vyk7y23ot5d3vtwhwe77uwonhynxu@khe2zzjjq7fg>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7garuxwpuj4i65vc"
Content-Disposition: inline
In-Reply-To: <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
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
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7garuxwpuj4i65vc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Dec 13, 2023 at 05:44:28PM +0100, Neil Armstrong wrote:
> Le 13/12/2023 =E0 09:36, Maxime Ripard a =E9crit=A0:
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
> > I guess it's a larger conversation, but I don't see how that can
> > possibly work.
> >=20
> > The way the API is designed, you have no guarantee (outside of
> > clk_rate_exclusive_*) that the rate is going to change.
> >=20
> > And clk_rate_exclusive_get() doesn't allow the rate to change while in
> > the "critical section".
> >=20
> > So the only possible thing to do is clk_set_rate() +
> > clk_rate_exclusive_get().
>=20
> There's clk_set_rate_exclusive() for this purpose.

Sure. But that assumes you'll never need to change the rate while in the
critical section.

> > So there's a window where the clock can indeed be changed, and the
> > consumer that is about to lock its rate wouldn't be aware of it.
> >=20
> > I guess it would work if you don't care about the rate at all, you just
> > want to make sure it doesn't change.
> >=20
> > Out of the 7 users of that function, 3 are in that situation, so I guess
> > it's fair.
> >=20
> > 3 are open to that race condition I mentioned above.
> >=20
> > 1 is calling clk_set_rate while in the critical section, which works if
> > there's a single user but not if there's multiple, so it should be
> > discouraged.
> >=20
> > > In this case I won't be able to change the rate of the clock, but that
> > > is signalled by clk_set_rate() failing (iff and when I need awother
> > > rate) which also seems the right place to fail to me.
> >=20
> > Which is ignored by like half the callers, including the one odd case I
> > mentioned above.
> >=20
> > And that's super confusing still: you can *always* get exclusivity, but
> > not always do whatever you want with the rate when you have it? How are
> > drivers supposed to recover from that? You can handle failing to get
> > exclusivity, but certainly not working around variable guarantees.
> >=20
> > > It's like that since clk_rate_exclusive_get() was introduced in 2017
> > > (commit 55e9b8b7b806ec3f9a8817e13596682a5981c19c).
> >=20
> > Right, but "it's always been that way" surely can't be an argument,
> > otherwise you wouldn't have done that series in the first place.
> >=20
> > > BTW, I just noticed that my assertion "Most users \"know\" that
> > > [clk_rate_exclusive_get() returns zero unconditionally]" is wrong. As=
 of
> > > next-20231213 there are 3 callers ignoring the return value of
> > > clk_rate_exclusive_get() and 4 that handle (imaginary) returned error=
s.
> > > I expected this function to be used more extensively. (In fact I think
> > > it should be used more as several drivers rely on the clk rate not
> > > changing.)
> >=20
> > Yes, but also it's super difficult to use in practice, and most devices
> > don't care.
> >=20
> > The current situation is something like this:
> >=20
> >    * Only a handful of devices really care about their clock rate, and
> >      often only for one of their clock if they have several. You would
> >      probably get all the devices that create an analog signal somehow
> >      there, so audio, display, i2c, spi, uarts, etc. Plus the ones doing
> >      frequency scaling so CPU and GPUs.
> >=20
> >    * CPUs and GPUs are very likely to have a dedicated clock, so we can
> >      rule the "another user is going to mess with my clock" case.
> >=20
> >    * UARTs/i2c/etc. are usually taking their clock from the bus interfa=
ce
> >      directly which is pretty much never going to change (for good
> >      reason). And the rate of the bus is not really likely to change.
> >=20
> >    * SPI/NAND/MMC usually have their dedicated clock too, and the bus
> >      rate is not likely to change after the initial setup either.
> >=20
> > So, the only affected devices are the ones generating external signals,
> > with the rate changing during the life of the system. Even for audio or
> > video devices, that's fairly unlikely to happen. And you need to have
> > multiple devices sharing the same clock tree for that issue to occur,
> > which is further reducing the chances it happens.
>=20
> Well, thanks for HW designers, this exists and some SoCs has less PLLs th=
an
> needed, and they can't be dedicated for some hw blocks.
>=20
> >=20
> > Realistically speaking, this only occurs with multi-head display outputs
> > where it's somewhat likely to have all the display controllers feeding
> > from the same clock, and the power up of the various output is done in
> > sequence which creates that situation.
> >=20
> > And even then, the clk_rate_exclusive_* interface effectively locks the
> > entire clock subtree to its current rate, so the effect on the rest of
> > the devices can be significant.
> >=20
> > So... yeah. Even though you're right, it's trying to address a problem
> > that is super unlikely to happen with a pretty big hammer that might be
> > too much for most. So it's not really surprising it's not used more.
>=20
> Honestly I tried my best to find a smart way to set the DSI clock tree
> with only 2 endpoints of the tree, but CCF will explore all possibilities
> and since you cannot set constraints, locking a sub-tree is the smartest
> way I found.
> In this case, the PLL is common between the DSI controller and video gene=
rator,
> so to keep the expected clock ratio, the smart way is to set the freq on
> one side, lock the subtree and set the rate on the other side.
> An API permitting to set multiple rates to multiple clocks in a single ca=
ll
> would be the solution, but not sure if we could possibly write such algor=
ithm.

Sure, and it's working great for some SoCs, so it was a good solution
for the problem you had at the time.

For some other SoCs it's not working that well however, so we need to
improve things for those.

Maxime

--7garuxwpuj4i65vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXwYNAAKCRDj7w1vZxhR
xakLAP9GcHkCf7rMfdpKTVB0KahFy7/yq68gPTi4+2LCz/TXXAD/fsAdJUXHCeWp
2Om50TZcBtUtxTuRDqmx0aUTY0ROFgE=
=Z9RR
-----END PGP SIGNATURE-----

--7garuxwpuj4i65vc--
