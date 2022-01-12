Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0C48C376
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 12:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DBC10E2F6;
	Wed, 12 Jan 2022 11:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6410E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 11:47:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9A6CB2B000BC;
 Wed, 12 Jan 2022 06:46:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 12 Jan 2022 06:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HUjciRt5oJndHDa2833SlsReu2F
 Lf5JGDbYdWg1xoYs=; b=SZi998ghqmL2HXA2R5cA6kdLNdjDPgHYR9a/jMNWD/M
 STVYrgIBv9PRtm4F6daxWUFqq7njRWhRR1w7i/Lxl/yz0HSm/hMbv/snu9NwGmFU
 QRw94aOfYdZxlJna4jtr4L8v647c9uUxKpea/Nwj1Y2zRp4pMaGMwtNRa4C+puJD
 YPUyrqxbGsjoEPPuHynorRPNf9TX+FxQsT6Z9m8UZKrsXd4H5t3rTyaSSe2NoKPm
 ZMntaHnoffnytcFuF17PWrEn+3dqCGQ1d0JPKz+waGBGGyzfP/Tyn3mitbqkxTxo
 bRxacFYHw6/3CtXKOLvIVYUsxxHm7kUcjIEd5GDEN9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HUjciR
 t5oJndHDa2833SlsReu2FLf5JGDbYdWg1xoYs=; b=e8KGKIF93rUVNZc7T1LIw8
 dnhAHggVIVyYIvaghnzQOHPyS7LEiB0865QxwGenVqJj+rDUAZi/E/mTqNqVw88f
 u/ue7smcTQDal/ZoLbMcXfPQefBQWB/s0LvqIbgAFkNbFzaVC9l+9mnPtWX6zVmZ
 yYCRIWE2SglpMf6YJUZwHmxZxnglXRmCMy09gqVyPeTdQUpLDPS0EITFNzl8f+t3
 bMR5sE6gzbMom/00etMAzwFrp1JPIKUkpi4A/A6HuRigum8lY+zOKG8T+Di2X1Hw
 1cgJSlL3ff/wkRImI3DsaBd8T2Z+W5Oct3VpB0JQsexKFWZpGXs3Db995HOOOuug
 ==
X-ME-Sender: <xms:r7_eYWfWPldIQcrbBv4JI72JlpglwS-V0hp4t4G-RuoSRiwnDxDkFA>
 <xme:r7_eYQPwS9sDu6r7IYJVxhF_ojRpJvGVDFySU5_JoZtnhaJgo9gnQovbmlphcgapN
 BDSL1IAMuSW0ptw4xA>
X-ME-Received: <xmr:r7_eYXg7HG2IEdFVPE-A20qAjMWihuijnIlzk4eUBazQ2ZwFQmRi59q0gh2M_zrq3lSZUGWgv4x1AlrcDtReGXgIN_dUmpM5ImTE140>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtddugddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:r7_eYT-O9vnOaLcoNm2Si1eFH1RLaTmkni9-2U4VK_JBUP5KimGsFg>
 <xmx:r7_eYSvvHvL15QKgqRlIlAC4aP9hntOkNkwwZBQkdUMOCKRbs87h8Q>
 <xmx:r7_eYaETlyi_9EAwH07vLaeKw55u35-zIqdoqyTvbykkCEKvOHuKhQ>
 <xmx:sL_eYSGQhz3HeeWNFuPBcxFaJ8zVu3aqyBJZC2SykptAa5M6SzFh_mvz_Pc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jan 2022 06:46:55 -0500 (EST)
Date: Wed, 12 Jan 2022 12:46:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: Introduce a clock request API
Message-ID: <20220112114652.hmfdcpqil5jg2vz6@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <20210914093515.260031-2-maxime@cerno.tech>
 <20220112033716.63631C36AEA@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="egjpwy3yppd7su6i"
Content-Disposition: inline
In-Reply-To: <20220112033716.63631C36AEA@smtp.kernel.org>
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


--egjpwy3yppd7su6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thanks for your answer

On Tue, Jan 11, 2022 at 07:37:15PM -0800, Stephen Boyd wrote:
> Sorry for being super delayed on response here. I'm buried in other
> work. +Jerome for exclusive clk API.
>=20
> Quoting Maxime Ripard (2021-09-14 02:35:13)
> > It's not unusual to find clocks being shared across multiple devices
> > that need to change the rate depending on what the device is doing at a
> > given time.
> >=20
> > The SoC found on the RaspberryPi4 (BCM2711) is in such a situation
> > between its two HDMI controllers that share a clock that needs to be
> > raised depending on the output resolution of each controller.
> >=20
> > The current clk_set_rate API doesn't really allow to support that case
> > since there's really no synchronisation between multiple users, it's
> > essentially a fire-and-forget solution.
>=20
> I'd also say a "last caller wins"
>=20
> >=20
> > clk_set_min_rate does allow for such a synchronisation, but has another
> > drawback: it doesn't allow to reduce the clock rate once the work is
> > over.
>=20
> What does "work over" mean specifically? Does it mean one of the clk
> consumers has decided to stop using the clk?

That, or it doesn't need to enforce that minimum anymore. We have
several cases like this on the RPi. For example, during a change of
display mode a (shared) clock needs to be raised to a minimum, but
another shared one needs to raise its minimum based on the resolution.

In the former case, we only need the minimum to be enforced during the
resolution change, so it's fairly quick, but the latter requires its
minimum for as long as the display is on.

> Why doesn't clk_set_rate_range() work? Or clk_set_rate_range() combined
> with clk_set_rate_exclusive()?

clk_set_rate_range could work (it's what we have right now in mainline
after all), but it's suboptimal since the clock is never scaled down.

It's especially showing in my first example where we need to raise the
clock only for the duration of the resolution change. Using
clk_set_min_rate works but we end up with that fairly high clock (at
least 500MHz) for the rest of the system life even though we usually can
get away with using a clock around 200MHz outside of that (short) window.

This is fairly inefficient, and is mostly what I'm trying to address.

> > In our previous example, this means that if we were to raise the
> > resolution of one HDMI controller to the largest resolution and then
> > changing for a smaller one, we would still have the clock running at the
> > largest resolution rate resulting in a poor power-efficiency.
>=20
> Does this example have two HDMI controllers where they share one clk and
> want to use the most efficient frequency for both of the HDMI devices? I
> think I'm following along but it's hard. It would be clearer if there
> was some psuedo-code explaining how it is both non-workable with current
> APIs and workable with the new APIs.

The fact that we have two HDMI controllers that share one clock is why
we use clk_set_min_rate in the first place, but you can have that
behavior with clk_set_min_rate only with a single user.

With pseudo-code, if you do something like

clk =3D clk_get(NULL);
clk_set_min_rate(600 * 1000 * 1000);
clk_set_min_rate(1000);

The clock will still remain at 600MHz, even though you would be totally
fine with the clock running at 1kHz.

If you really wanted to make the clock run at 1kHz, you'd need to have:

clk =3D clk_get(NULL);
clk_set_min_rate(600 * 1000 * 1000);
clk_set_min_rate(1000);
clk_set_rate(1000);

And that works fine for a single user.

If you have a clock shared by multiple drivers though, things get
tricky. Indeed, you can't really find out what the minimum for that
clock is, so figuring out the rate to pass to the clk_set_rate call
would be difficult already. And it wouldn't be atomic anyway.

It's made even more difficult since in clk_calc_new_rates the core
checks that the rate is within the boundaries and will error out if it
isn't, so even using clk_set_rate(0) wouldn't work.

It could work if the clock driver makes sure in round/determine_rate
that the rate passed in within the boundaries of the clock, but then you
start working around the core and relying on the behavior of clock
drivers, which is a fairly significant abstraction violation.

> > In order to address both issues, let's create an API that allows user to
> > create temporary requests to increase the rate to a minimum, before
> > going back to the initial rate once the request is done.
> >=20
> > This introduces mainly two side-effects:
> >=20
> >   * There's an interaction between clk_set_rate and requests. This has
> >     been addressed by having clk_set_rate increasing the rate if it's
> >     greater than what the requests asked for, and in any case changing
> >     the rate the clock will return to once all the requests are done.
> >=20
> >   * Similarly, clk_round_rate has been adjusted to take the requests
> >     into account and return a rate that will be greater or equal to the
> >     requested rates.
> >=20
>=20
> I believe clk_set_rate_range() is broken but it can be fixed. I'm
> forgetting the details though. If the intended user of this new API
> can't use that range API then it would be good to understand why it
> can't be used. I imagine it would be something like
>=20
> 	struct clk *clk_hdmi1, *clk_hdmi2;
>=20
> 	clk_set_rate_range(&clk_hdmi1, HDMI1_MIN, HDMI1_MAX);
> 	clk_set_rate_range(&clk_hdmi2, HDMI2_MIN, HDMI2_MAX);
> 	clk_set_rate_range(&clk_hdmi2, 0, UINT_MAX);
>=20
> and then the goal would be for HDMI1_MIN to be used, or at the least for
> the last call to clk_set_rate_range() to drop the rate constraint and
> re-evaluate the frequency of the clk again based on hdmi1's rate range.

This is pretty much what this series was doing. I was being conservative
and didn't really want to modify the behavior of existing functions, but
that will work fine.

Thanks!
Maxime

--egjpwy3yppd7su6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd6/rAAKCRDj7w1vZxhR
xR9GAQDP0lh5cm05+cYde3a9KcPm6bTgvLdbWYfrwII7np7O7gD/RQycjeJyoZ25
SvqeoDWllJmlR1yk/+VSlpi0hZxiJwI=
=QGDi
-----END PGP SIGNATURE-----

--egjpwy3yppd7su6i--
