Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9434C674E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FD389838;
	Mon, 28 Feb 2022 10:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08E689838
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:47:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C89B2320094D;
 Mon, 28 Feb 2022 05:47:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 28 Feb 2022 05:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=aBQu7upbZgdbLLHKuB/qTx0if9/d6dUXkxnJMl
 Mb1Yg=; b=CKKT7kbAkn7PYQneTsTscW5IZUNKcmc31UMg1UQjtX1iHueTCvr9Qd
 oBZExJUXCn0DlmQG5UPrncgbr/PncT0pmYk94MTGH9Uczn7M7ygqBa3UMJJr5QVi
 rrG7Oxy7AKaCMFdlhCd12tyo7g7PH8gcIJbMq8x4Cm/zsFMvFrwL9u0rx072llE1
 XWxf3jOziYqR1/ErVZjB3JEjGXogYlnGe89Il3MSefB6kY9t9t4OLZnFzlzl/14V
 67ese+Xjh8H/8cCxYRIoKg0Z3BhN/MeByyQK2uYhv7iF2S17dIYKHacLeL3Y9gSw
 EOG8s4rQfOSvICJFpTFUDRSNFMDUPYzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aBQu7upbZgdbLLHKu
 B/qTx0if9/d6dUXkxnJMlMb1Yg=; b=jcrselFOR2nRw4r6i/nxG6jtLEAkC2SAv
 lm0ltuKzJnz68R15pHFvslWblRVP56Kq7RK6KmhQwXqhOGtR8VfUB07U8TpVU39z
 qkoAEEkdXWdWmUbIHiQElrjNnSx0+aoorJk1yIqHc+/Oc9W56eeC1u7zCyvYYwsY
 cAHksiBh1xzITNM9GkbjoC+uzBHW8CD3S3eWjDoUJptLsL2Sgz4vj+k5UT1CK5yA
 /QU/GGQ25T5Ghvv4lBZjKnUmhiSYsVdRzoRM6lD3ZTYMNOa5oK4Y5SE4gJXaUT4I
 BUUuJrbAiIeHbPpV2ev0RwNOw3/fOLMkzdtL4nBZllGNthir+1rVA==
X-ME-Sender: <xms:OKgcYuQdoSQBYANUTdSODKJWtyKxcBBGQAUX3Yuq0pynBzzjPCnwjA>
 <xme:OKgcYjyumucM8GlbLocI3q21MxID9BZtzczbErpDiD-Ryt_QKPLijtw6TCJsTkvLz
 b0XINOKP6gzEm5k9Qw>
X-ME-Received: <xmr:OKgcYr1vFjRS_1F85Q9dM3Tjg6iseGUyV1zkFOH3EXmURB8-mjJ70LrLa6AUTGFME3j_UlQw8RzSFliNi9pXDGun31NIqAo-e0aIMjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OKgcYqDNEIM3WMAmivvjRuStuB8LZGepRgm0esp66dOqbCEMPoAAzA>
 <xmx:OKgcYngRqXLlmhpfHoCHB8rRjs2Qfq-hiOzk0MscCJYgIkwR7NLfgQ>
 <xmx:OKgcYmrcNGMVVH0Ijqa54blQkR40obwtuXVASAIwvPNpgbXXCn7uKw>
 <xmx:OagcYoXB5B8FVDJviIrpAz_j1OymcCQrwCPV8xgPUfjc-kCEl2MZ1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 05:47:20 -0500 (EST)
Date: Mon, 28 Feb 2022 11:47:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220228104718.yorlzq6264jtffak@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat>
 <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iib5nwly66weogpv"
Content-Disposition: inline
In-Reply-To: <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iib5nwly66weogpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 01:29:03PM -0800, Daniel Latypov wrote:
> On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Daniel,
> >
> > On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > Let's test various parts of the rate-related clock API with the kun=
it
> > > > testing framework.
> > > >
> > > > Cc: kunit-dev@googlegroups.com
> > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > >
> > > Looks good to me on the KUnit side.
> > > Two small nits below.
> > >
> > > FYI, I computed the incremental coverage for this series, i.e.:
> > > 1) applied the full series
> > > 2) computed the absolute coverage
> > >
> > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> > > --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG_KER=
NEL=3Dy
> > > --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=3Dy
> >
> > I built a docker container based on ubuntu 18.04 to have gcc6 and
> > python3.7, but this doesn't seem to be working, I'm not entirely sure w=
hy:
> >
> > [13:11:22] Configuring KUnit Kernel ...
> > Regenerating .config ...
> > Populating config with:
> > $ make ARCH=3Dum olddefconfig CC=3D/usr/bin/gcc-6 O=3D.kunit
> > ERROR:root:Not all Kconfig options selected in kunitconfig were in the =
generated .config.
> > This is probably due to unsatisfied dependencies.
> > Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> > Note: many Kconfig options aren't available on UML. You can try running=
 on a different architecture with something like "--arch=3Dx86_64".
>=20
> Did you perhaps drop CONFIG_DEBUG_KERNEL=3Dy?
> Need to add 3 config options in total for coverage.
>=20
> If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=3Dy, I
> get the error message you get:
>=20
> $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> --make_options=3DCC=3D/usr/bin/gcc-6  --kconfig_add=3DCONFIG_DEBUG_INFO=
=3Dy
> --kconfig_add=3DCONFIG_GCOV=3Dy
> ...
> Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> Note: many Kconfig options aren't available on UML. You can try
> running on a different architecture with something like
> "--arch=3Dx86_64".

It looks to me that it's more that DEBUG_INFO isn't enabled.

If I'm running

=2E/tools/testing/kunit/kunit.py config --kunitconfig=3Ddrivers/clk
    --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG_KERNE=
L=3Dy
    --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=3Dy

DEBUG_INFO isn't selected and I end up with DEBUG_INFO_NONE.
DEBUG_KERNEL is enabled though.

Maxime

--iib5nwly66weogpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhyoNgAKCRDj7w1vZxhR
xTcPAP9+TnfrqTlXrJIZOrqVk81hJZc94EdgN/TikllrUr00+gD/bP3OtQQ6yyd3
3Sw8YcdpD/1viH3Y6Eoqi3MvcRhH1gY=
=JZIM
-----END PGP SIGNATURE-----

--iib5nwly66weogpv--
