Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4F4D1C63
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 16:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9019410E26E;
	Tue,  8 Mar 2022 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7010E1E3;
 Tue,  8 Mar 2022 15:55:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C8345C00ED;
 Tue,  8 Mar 2022 10:55:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 10:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=0YnIqCDu3gKawpIM8w/cy0yec0uVqzld1dHM5H
 VipnY=; b=KPJF/FTrRYuxnfWjCI62cvZ4ANIDPbw/nkUJ8xJV4Jc1lDCHM4Qu/x
 vzZ3hK/g2tA3v6F2BQaJt7bBu67UqiH5pI4pq1dHSJxY8q4vodCFyAKMo6VEy/od
 rw3pud/0oPN8PcJOU76dXM2xH+hH2DS1SHd81hWgUX7WJupG4TgpqPF/iTLDs/Zc
 L2On6IuQNIa2YSpFggLU/MvnkSiREXnLagpUiuuEeuK9fgP0P+PdwSdTWerdYouD
 eWZhx6U+pHflM4/KIXFSgkpsQxcVnvfNQPxrFvvHcsKxdumwdo0uAPxTTPFkbIt2
 8fjlLSnveqpzQTaQa9QimVd6gDa1BEtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0YnIqCDu3gKawpIM8
 w/cy0yec0uVqzld1dHM5HVipnY=; b=OxIeHU9VzXVpyoCo/te4dbNf/gayo/pGC
 3aZpPqWJYSmiS59AWbtPrTtAFDhX2lWM2Weox7UKoK5qQuDlWJDy8IR31w1GgLIj
 ZKfE0bKsaPVa+pkexIh4L9e15EZ+l1fiZJIvDmG1eZUUhzvI70vkRcOkhL1kdifp
 HghGCo/dtttiW95v/kOdKWLF0hSvrnQ7/D23mijETqpNspnl/wM7t82w2hioYvMj
 83dKVeBvtTaT0LntD+b3JdcdlxRQiGK/hmd7BvPUWI8m0+vyaxxzwnd/HfHpayD8
 ITN2bfeDusNRJhHXnuaUy7NZHVcU+VXq7ZpmVySsY5hASPaW7mlyA==
X-ME-Sender: <xms:bXwnYhJ2f96ukA6Ke7znY3lazWzS8cy4XUSvZmRIyqmPTVXI_Ta1eQ>
 <xme:bXwnYtKN5_y3g37XsrKyKd-tehGtA9guusASdEyOrEHTy5aaipgGaXeiiclpni28t
 -KjkPaxJMRPEjZC_D4>
X-ME-Received: <xmr:bXwnYptm-ohM2qUhIKAh15UA9dTIwmUD_pygODYkZvItJvOE35eDYLX0qWDANuIlQjqVjdZprrRxsfEziP10KsnFl0U0aHtjZr6KtkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeettdffgeejhfduledtjeejteeiffekuedtffdtveeiffdttdejheejledu
 tdffnecuffhomhgrihhnpedtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bXwnYiZelJD6ao8YaRdZr-fFlW9DgDHQrmwsO9fksUQ8swmte3Og-Q>
 <xmx:bXwnYob-DdfUB2cm0MPjYdBZxIvFinFu-gy1QPyCOFX55CuMCiAoxg>
 <xmx:bXwnYmBfEHyyMXoLEoE4VYRpjyOdmG5_nPul1cOmagNOH8642GzxMw>
 <xmx:bnwnYjzIbhpsA-q4Hqkv5Y-WVXu1izqMGe4AqYtW6G8O3yWAYyXXOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 10:55:25 -0500 (EST)
Date: Tue, 8 Mar 2022 16:55:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: Mandatory Test Suite for KMS Drivers?
Message-ID: <20220308155523.nhbg4i3y66pm3x55@houat>
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="az3d6kpqqzu5hmzq"
Content-Disposition: inline
In-Reply-To: <YiCeCeNobS2FCiQB@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--az3d6kpqqzu5hmzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

On Thu, Mar 03, 2022 at 05:52:57AM -0500, Rodrigo Vivi wrote:
> On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Back at XDC we floated the idea of creating a test suite for IGT that we
> > expect any KMS driver to pass, similar to what v4l2-compliance and
> > cec-compliance provide for v4l2 and CEC respectively.
> >=20
> > I was looking at the list of tests, and it's fairly massive, so it's not
> > clear to me what tests we could start this suite with. I can only assume
> > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > good start?
> >=20
> > What do you think?
>=20
> I believe we should start with the group of the tests that we know that
> are reliably passing today on most of the platforms and then increase
> the list as the tests and drivers become more reliable.

I can see why that would be an objective too, but I'm not sure it would
cover mine. What I'd like this series to be is something we can ask
upfront to new drivers being submitted to make sure that they are sane.

Whether or not old drivers pass that bar is a bit irrelevant to that
objective (and this would actually create tasks for newcomers that are
looking for something to work on).

So, yeah, I don't mind having failing tests on older drivers, I kind of
even expect them to fail somehow. It would essentially be a bar to show
what any driver should strive for, not the lowest common denominator.

Does that make sense?

> For instance, many of these would be candidate to be filtered out for now
> https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=3Dkms
>=20
> compared to the whole view of kms tests:
> https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=3Dkms

So the set of tests that are always run would be the latter, right?

Maxime

--az3d6kpqqzu5hmzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYid8awAKCRDj7w1vZxhR
xT2LAP9nq0W8cnjXaiqZWyA0fWnsNV6+F4ZuzrLPeV2ZyR232AEAyRR+VOMRVipC
lK7DS4JQxYaR03qcrJJq9eN/QrO8sAk=
=MdhL
-----END PGP SIGNATURE-----

--az3d6kpqqzu5hmzq--
