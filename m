Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D584B0A71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E510E7C2;
	Thu, 10 Feb 2022 10:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CCB10E7C2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:19:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 698903201F96;
 Thu, 10 Feb 2022 05:19:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Feb 2022 05:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=FX2U36JUXXXRjbU6eTCsWy4BzX/9SgdVHf9aPv
 auItc=; b=XLW8COsuN0Y5MFXizfpKSQr1E0hXgY3UHw78q7wnKta9jcB5TfuHt3
 rwmTuXMkbj2BnY+Cz6/RpCZvAFNxz9j2knviPhKAhRwmurM94fpmcOJ2/1qZuZ5N
 xveMuSYWw7OheVlQCyhJA8C+PRxmGZ5udr6c7leq3M9VBTpArm1DRDniZZF7vWro
 AxYy+R9XInokKKCvVqHzn3cVLXKJIyuK0zJiYJZWLlJwfdmQJ8q5B7dRSaGYsJ3D
 o3rt8FDR+iTHlrCyc6YgF1d0EKjTdM6uJEPS1GCaFZmHlX65PWk2cG79jTppUK79
 3oJHljoWJfZvBT9KWyN1va41kbKSmEdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FX2U36JUXXXRjbU6e
 TCsWy4BzX/9SgdVHf9aPvauItc=; b=doPN5PjkbeOT0QygOZZTDgI/9jcQ4J+BJ
 PcyaYXNXxGPssslyVf3BcdSY36qrzCCMc23kQL3+GSAKlf/1kwnqOuQuvaquKNsG
 T705h5FfWoIWvOVy9gcQjPsDxXz6jvMNml/FKkGoHQk8F3NJZEiXJbSgPYuUcHTv
 YrZ9nNzEiHSXdzXW+IpkfQ5xeA9CRDgTol70IJYf5SvP6Ld5u63dukCJVk4Ajkir
 f8ft9PT6Soed31AYDq03J/p9cKMzfApR8bmfOUzdCMASeYa/5eiibksuf+zDG/7o
 onhhuQFjvZqhaYgki4hLoswa5Bj52KD/IYCYZavX9o3cj7Sdr2Brw==
X-ME-Sender: <xms:puYEYjNoe97vvKYTeDh8wIHpzkPGmZgZbScFKtZJjn_v5W2g8TLI-g>
 <xme:puYEYt9LIytAB571b7ciKSzuh6n0UHo7cZNjIi9Z3dnId_suXtN7fKUtljFT7igQZ
 AE1ikryjJXky0MzNjk>
X-ME-Received: <xmr:puYEYiQAJl_rb43HycYKFfpZezeFOd5zLPu5rQjqqnds1YQRbW6dDBrR7meZKtTGW3zMr4SITpvNCNJmW7Xjf_NKoC0THoYwavoa2g4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedugddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:puYEYnvTYUUhPwiLS2s3MHn_SJxlQQH6xVpXsXgoDyhMu_TyV4JFHA>
 <xmx:puYEYrdRT0qZ4dgWHWo4I6MWOVhbs0_nPd2yA9ThDtDnCyeGwPK6LA>
 <xmx:puYEYj3Rym7XGZ4PXEafJUr8aL6NyHrXMN1AA-p6fcotyduJKthIVA>
 <xmx:puYEYjRAr3aZS8xnedfoKg0ZdPGpDCk6gn2IR3TFsR2Lb9c2-YCkQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 05:19:18 -0500 (EST)
Date: Thu, 10 Feb 2022 11:19:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 00/10] clk: Improve clock range handling
Message-ID: <20220210101916.3bsgkbbklyvwowla@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iu2nanqn2witv43w"
Content-Disposition: inline
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iu2nanqn2witv43w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Jan 25, 2022 at 03:15:39PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>=20
> and here:
> https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
>=20
> While the initial proposal implemented a new API to temporarily raise and=
 lower
> clock rates based on consumer workloads, Stephen suggested an
> alternative approach implemented here.
>=20
> The main issue that needed to be addressed in our case was that in a
> situation where we would have multiple calls to clk_set_rate_range, we
> would end up with a clock at the maximum of the minimums being set. This
> would be expected, but the issue was that if one of the users was to
> relax or drop its requirements, the rate would be left unchanged, even
> though the ideal rate would have changed.
>=20
> So something like
>=20
> clk_set_rate(user1_clk, 1000);
> clk_set_min_rate(user1_clk, 2000);
> clk_set_min_rate(user2_clk, 3000);
> clk_set_min_rate(user2_clk, 1000);
>=20
> Would leave the clock running at 3000Hz, while the minimum would now be
> 2000Hz.
>=20
> This was mostly due to the fact that the core only triggers a rate
> change in clk_set_rate_range() if the current rate is outside of the
> boundaries, but not if it's within the new boundaries.
>=20
> That series changes that and will trigger a rate change on every call,
> with the former rate being tried again. This way, providers have a
> chance to follow whatever policy they see fit for a given clock each
> time the boundaries change.
>=20
> This series also implements some kunit tests, first to test a few rate
> related functions in the CCF, and then extends it to make sure that
> behaviour has some test coverage.

As far as I know, this should address any concern you had with the
previous iterations.

Is there something else you'd like to see fixed/improved?

Maxime

--iu2nanqn2witv43w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgTmpAAKCRDj7w1vZxhR
xdW5AQCCui8rFtAvdngbW0K1At9OGQIqi1MsIpQC8xHGE/cFiAD8DFYVxFDHIial
PLZXEiyaWN4TamdW0MCJqrT7/mYhGgc=
=N/GK
-----END PGP SIGNATURE-----

--iu2nanqn2witv43w--
