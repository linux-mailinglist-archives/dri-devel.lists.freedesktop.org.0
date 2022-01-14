Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702148EDCE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E709610EEFA;
	Fri, 14 Jan 2022 16:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3910EEF7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:16:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B5495802E0;
 Fri, 14 Jan 2022 11:16:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 14 Jan 2022 11:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=BxuIQYHC8bpQmCjH6NaTDIBRX/H
 U6HyVQjKJKwQPD0Q=; b=Y/+bYhRxEHYzPmOSgQVqcM10I0ugnbN6+sctQ/1ebNW
 uuYiYExTuIAnYjtXDC69ExEAaefwS6MaohdhHgBywiNXYb/1hPsPlOIbmGoB5zl0
 w8JoAEoTw5TJdMzaCXiKGnmyDBvxJCYUJx1UEEUR87qLyt74w/drVC6vySL4nGh4
 hpEQs4MqXkDxHduf3hBkQzScteSRjqVTsQkYwS9k5G6J8Ifv+sapt5i0r+AjerNb
 VDuWkWqrOEqPm77oocUMsVqeitNCEuY6XEbuVT3hdUnBPkSs8vYbgBoUPTRmq14i
 DcbHfFXWjpXCo8AHLM8mTI3GfHTD+pD1MkQnUAxj0kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BxuIQY
 HC8bpQmCjH6NaTDIBRX/HU6HyVQjKJKwQPD0Q=; b=lr82qyVao7Xs5apHHtDiJ2
 yBsr985xjvZTihGDIx6ZTp/gCyxjb+PjXCJcPrNrSAIaSGQG4To5r/e3bU8uZS4a
 onAS3eVGIJWdKR5+DNUAUlE6+J7T6QRXJtapVOpoXBvCy899o3FDYLsbxwNWZR/9
 dsGR4sB/whn27x5LNuicuxhlHS142VmKrRCGHwkMwNOPb7pDw2RJJmq5UWR/c4WE
 Ecus/RPBd+aVOLTUp283Kx9W/EfbIzzfg1dDK7idz2XxkcW+G0A+Gr1zAfOqSHn5
 cogehLXVR37FvIFizR0ADNY6yry4GqRAKZRYZ4+A2WXcBBHLYg/pBHmh+BcFmtkg
 ==
X-ME-Sender: <xms:v6HhYbjd4uLG1fp1zCMKWtUPOZF5PXeWu67yNkzMlz2K1F7zkJD-0A>
 <xme:v6HhYYDTYasQe5ARucQhlZ25as9bH6pozqgurodXGtjQAKWzEz1LjyWixQJRSuVrZ
 O25egT_3GXsAcUGG_Q>
X-ME-Received: <xmr:v6HhYbFlDM4DF3xb3Xr1gC-SJDuGlrnuzBqb8iIQAZRu-77f_b6Y5O6xk-aRUxDAYmeRD-b8n0tnYzEpc-hIUT3sH72BRYZqDAux9Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v6HhYYS-s2C2SO6gEYZ0nxi3WQMHK2132mtaXYES0vDPKtyhhYkf9g>
 <xmx:v6HhYYx6pv_33AqqxbfuCIktQ8OiwNwuX6wv5Fxi7XU7Ice4D1SaVA>
 <xmx:v6HhYe6R8k3xmlkUM-zlHKCfStZknLFZcsOdy3gC3KkDR0PH-2fimA>
 <xmx:wKHhYdLO8XLVfehpBPlH-yYWEvxJsSP0Sm_QhGqUmL6g2Up7l6Zz9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 11:15:59 -0500 (EST)
Date: Fri, 14 Jan 2022 17:15:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: Introduce a clock request API
Message-ID: <20220114161556.vgxhetm4ccokik4b@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <20210914093515.260031-2-maxime@cerno.tech>
 <20220112033716.63631C36AEA@smtp.kernel.org>
 <20220112114652.hmfdcpqil5jg2vz6@houat>
 <20220113214426.95292C36AEA@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t5pwxciopz46bn7p"
Content-Disposition: inline
In-Reply-To: <20220113214426.95292C36AEA@smtp.kernel.org>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t5pwxciopz46bn7p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 01:44:25PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-01-12 03:46:52)
> > On Tue, Jan 11, 2022 at 07:37:15PM -0800, Stephen Boyd wrote:
> > > Sorry for being super delayed on response here. I'm buried in other
> > > work. +Jerome for exclusive clk API.
> > >=20
> > > Quoting Maxime Ripard (2021-09-14 02:35:13)
> > > > It's not unusual to find clocks being shared across multiple devices
> > > > that need to change the rate depending on what the device is doing =
at a
> > > > given time.
> > > >=20
> > > > The SoC found on the RaspberryPi4 (BCM2711) is in such a situation
> > > > between its two HDMI controllers that share a clock that needs to be
> > > > raised depending on the output resolution of each controller.
> > > >=20
> > > > The current clk_set_rate API doesn't really allow to support that c=
ase
> > > > since there's really no synchronisation between multiple users, it's
> > > > essentially a fire-and-forget solution.
> > >=20
> > > I'd also say a "last caller wins"
> > >=20
> > > >=20
> > > > clk_set_min_rate does allow for such a synchronisation, but has ano=
ther
> > > > drawback: it doesn't allow to reduce the clock rate once the work is
> > > > over.
> > >=20
> > > What does "work over" mean specifically? Does it mean one of the clk
> > > consumers has decided to stop using the clk?
> >=20
> > That, or it doesn't need to enforce that minimum anymore. We have
> > several cases like this on the RPi. For example, during a change of
> > display mode a (shared) clock needs to be raised to a minimum, but
> > another shared one needs to raise its minimum based on the resolution.
> >=20
> > In the former case, we only need the minimum to be enforced during the
> > resolution change, so it's fairly quick, but the latter requires its
> > minimum for as long as the display is on.
> >=20
> > > Why doesn't clk_set_rate_range() work? Or clk_set_rate_range() combin=
ed
> > > with clk_set_rate_exclusive()?
> >=20
> > clk_set_rate_range could work (it's what we have right now in mainline
> > after all), but it's suboptimal since the clock is never scaled down.
>=20
> Alright, I didn't see any mention of clk_set_rate_range() in the commit
> text so did I miss it? Maybe it's used interchangeably with
> clk_set_min_rate()?

Yeah, we were interested in only the minimum so I've used
clk_set_min_rate, but it's backed by clk_set_rate_range() so it can be
used interchangeably.

> > It's especially showing in my first example where we need to raise the
> > clock only for the duration of the resolution change. Using
> > clk_set_min_rate works but we end up with that fairly high clock (at
> > least 500MHz) for the rest of the system life even though we usually can
> > get away with using a clock around 200MHz outside of that (short) windo=
w.
> >=20
> > This is fairly inefficient, and is mostly what I'm trying to address.
>=20
> Got it!
>=20
> >=20
> > > > In our previous example, this means that if we were to raise the
> > > > resolution of one HDMI controller to the largest resolution and then
> > > > changing for a smaller one, we would still have the clock running a=
t the
> > > > largest resolution rate resulting in a poor power-efficiency.
> > >=20
> > > Does this example have two HDMI controllers where they share one clk =
and
> > > want to use the most efficient frequency for both of the HDMI devices=
? I
> > > think I'm following along but it's hard. It would be clearer if there
> > > was some psuedo-code explaining how it is both non-workable with curr=
ent
> > > APIs and workable with the new APIs.
> >=20
> > The fact that we have two HDMI controllers that share one clock is why
> > we use clk_set_min_rate in the first place, but you can have that
> > behavior with clk_set_min_rate only with a single user.
> >=20
> > With pseudo-code, if you do something like
> >=20
> > clk =3D clk_get(NULL);
> > clk_set_min_rate(600 * 1000 * 1000);
> > clk_set_min_rate(1000);
> >=20
> > The clock will still remain at 600MHz, even though you would be totally
> > fine with the clock running at 1kHz.
>=20
> That looks like a bug. While we could happily ignore the rate floor
> being lowered because we're still within constraints, it looks like we
> should always re-evaluate the constraints when they change.
>=20
> >=20
> > If you really wanted to make the clock run at 1kHz, you'd need to have:
> >=20
> > clk =3D clk_get(NULL);
> > clk_set_min_rate(600 * 1000 * 1000);
> > clk_set_min_rate(1000);
> > clk_set_rate(1000);
> >=20
> > And that works fine for a single user.
> >=20
> > If you have a clock shared by multiple drivers though, things get
> > tricky. Indeed, you can't really find out what the minimum for that
> > clock is, so figuring out the rate to pass to the clk_set_rate call
> > would be difficult already. And it wouldn't be atomic anyway.
>=20
> Right.
>=20
> >=20
> > It's made even more difficult since in clk_calc_new_rates the core
> > checks that the rate is within the boundaries and will error out if it
> > isn't, so even using clk_set_rate(0) wouldn't work.
>=20
> clk_set_rate(0) is pretty gross!
>=20
> >=20
> > It could work if the clock driver makes sure in round/determine_rate
> > that the rate passed in within the boundaries of the clock, but then you
> > start working around the core and relying on the behavior of clock
> > drivers, which is a fairly significant abstraction violation.
> >=20
> > > > In order to address both issues, let's create an API that allows us=
er to
> > > > create temporary requests to increase the rate to a minimum, before
> > > > going back to the initial rate once the request is done.
> > > >=20
> > > > This introduces mainly two side-effects:
> > > >=20
> > > >   * There's an interaction between clk_set_rate and requests. This =
has
> > > >     been addressed by having clk_set_rate increasing the rate if it=
's
> > > >     greater than what the requests asked for, and in any case chang=
ing
> > > >     the rate the clock will return to once all the requests are don=
e.
> > > >=20
> > > >   * Similarly, clk_round_rate has been adjusted to take the requests
> > > >     into account and return a rate that will be greater or equal to=
 the
> > > >     requested rates.
> > > >=20
> > >=20
> > > I believe clk_set_rate_range() is broken but it can be fixed. I'm
> > > forgetting the details though. If the intended user of this new API
> > > can't use that range API then it would be good to understand why it
> > > can't be used. I imagine it would be something like
> > >=20
> > >       struct clk *clk_hdmi1, *clk_hdmi2;
> > >=20
> > >       clk_set_rate_range(&clk_hdmi1, HDMI1_MIN, HDMI1_MAX);
> > >       clk_set_rate_range(&clk_hdmi2, HDMI2_MIN, HDMI2_MAX);
> > >       clk_set_rate_range(&clk_hdmi2, 0, UINT_MAX);
> > >=20
> > > and then the goal would be for HDMI1_MIN to be used, or at the least =
for
> > > the last call to clk_set_rate_range() to drop the rate constraint and
> > > re-evaluate the frequency of the clk again based on hdmi1's rate rang=
e.
> >=20
> > This is pretty much what this series was doing. I was being conservative
> > and didn't really want to modify the behavior of existing functions, but
> > that will work fine.
>
> I don't see a problem with re-evaluating the rate every time we call
> clk_set_rate_range(). That's probably the bug that I can't recall. Can
> you fix the API so it works that way?

Yep, I'll work on it next week. I started to think about it this week,
and there's two things I'm not entirely sure about:

  - Keeping the clock at its minimum rate is essentially policy. Do we
    want to guard that behavior by a flag, and do we want to do the same
    thing if we want to max it?

  - How should we deal with a clk_set_rate call while we have a range?
    Something like:

    clk_set_min_rate(hdmi1_clk, 1000);
    clk_set_min_rate(hdmi2_clk, 2000)
    clk_set_rate(hdmi1_clk, 3000);
    clk_drop_range(hdmi2_clk);

    If we just try to minimize the rate all the time, we'll set the rate
    back to 1000Hz, but I think it would make more sense to keep the
    rate at 3000?

    Maybe we can test if the range is still at the boundary we remove,
    and only if it is, drop it to whatever boundary we have left?

Maxime

--t5pwxciopz46bn7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeGhvAAKCRDj7w1vZxhR
xWSQAP9LedtsLcCq/LTXNR1+toP7r6IRqt64f6CuhG0msZ8prAD/ZGKwMd59Dab5
7WgwAgmmJmRQ2Dv+oBqMddNjK9LBQQQ=
=1+2/
-----END PGP SIGNATURE-----

--t5pwxciopz46bn7p--
