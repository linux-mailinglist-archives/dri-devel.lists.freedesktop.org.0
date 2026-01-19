Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CAD3AB7A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E9210E23E;
	Mon, 19 Jan 2026 14:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u/HzqjlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B14410E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:18:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 003E460054;
 Mon, 19 Jan 2026 14:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F2DC116C6;
 Mon, 19 Jan 2026 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768832304;
 bh=g6qrItnXMxcK3sBx2w2hINmGUZoc1FHx9rc2/Deh1w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/HzqjlFn89iTnbgsjVBbFaaAX8iA9juCrVxQTDKOk+56MYyQVWqWypq2zudCyxxF
 xwifbk4Y9koJzFuv77q7WlbwW4pAvZYHv2ll+GUscpHdOyeaR6wKcrkbnM68X1VgeE
 LXFw8tFWkHzmSTmpkOBx8lW02NyIos8+A/OLBWuEfg7GQv+9DOprFx7ghY48c8vp8Z
 PM2L5fN7erxQOScsLMFvu6cTPiJSmjeHOHj5XP49Yc1YFqhlTq1Pr7Rd5M837c5Prv
 0hsW0Ohqal/kRcivh0XAXNkgGyZzvSn3kzZGB5G/BTOYm1w2NM+CirwL7q2WfySqC0
 Hi9u18ygS+AIA==
Date: Mon, 19 Jan 2026 15:18:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260119-weightless-pelican-of-anger-190db0@houat>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r35gw42txiia2ftk"
Content-Disposition: inline
In-Reply-To: <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r35gw42txiia2ftk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >> I think that if you still want an API where you just call enable/disab=
le
> >> directly on it with no protection against unbalanced calls, then that
> >> should be the special API. Probably called RawClk and functions marked
> >> unsafe. Unbalanced calls seem really dangerous and use should not be
> >> encouraged.
>=20
> +1; and unless there is a use-case that requires otherwise, it should not=
 even
> be possible to do this at all -- at least for driver code.

I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
perspective on many platforms. It's totally fine to provide nice, safe,
ergonomic wrappers for the drivers that don't care (or can't, really),
but treating a legitimate optimisation as something we should consider
impossible to do is just weird to me.

> > I think we should discourage RawClk if at all possible. But if the cons=
ensus
> > is that we *really* need this easily-abused thing, I can provide a foll=
ow-up.
>=20
> I think we should only do this if there are use-case with no alternative,=
 so far
> there haven't been any AFAIK.

I don't really care about which alternative we come up with, but look at
devm_regmap_init_mmio_clk for example. It is a valid use-case that
already exists today, and has had for more than a decade at this point.

Maxime

--r35gw42txiia2ftk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaW49KQAKCRAnX84Zoj2+
dt7aAYDAMMq5goJ8F57+R0eeu9IhG+g9NsslhFNxDOjuXCzZBC9Ltj1x0emRNsNP
1EtPX4EBf1g1bAHKFfkK+3azvdKbnVWe1wt6p0rsd5eyTrS+H10Rm8yBv9VpeDtW
pAS+fwDmJQ==
=s+g7
-----END PGP SIGNATURE-----

--r35gw42txiia2ftk--
