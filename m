Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCzfGNcpcmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:44:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC767761
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAAC10E9AE;
	Thu, 22 Jan 2026 13:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MiijZP2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4875610E9AE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:44:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 106B141A3D;
 Thu, 22 Jan 2026 13:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C125C116C6;
 Thu, 22 Jan 2026 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769089491;
 bh=j8JEqlvIFnXt9gGEm0Oheoh75nKbbz8Bdg2iudx4Y8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MiijZP2PgQ7cWwM/BrL4/aHqDuWgWt7buVDitzOLLgQdCeGQbRri9VRoWsknB6BOs
 MW4NXW6W74RdY0fAsK6Bdd8gp3rRRx5EUSq74/zd+Y3DQk3JDvoomz7nvfQXW4sYLt
 5NK4v3hzZ1ozM6HXvxIyYNRKjNtql6nEd8fORfMN3aJ57Fm0fNPpqIpF07lBZJNEqe
 bh1lrnUZrr3xfZB+VMQmhgzNd1DvOX4XxCozUKLJsUOQjxjF4TFLjOaa5sReHLH4/Q
 rdTHw5qscsZCtb4v7dlQUXKGr6CN30WBw/AIPOWvt9r6gzUfBUhamrC89amGEuE/MZ
 erbPngC11saWw==
Date: Thu, 22 Jan 2026 14:44:49 +0100
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
Message-ID: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zgoq7kx6iu4jzgjw"
Content-Disposition: inline
In-Reply-To: <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D4EC767761
X-Rspamd-Action: no action


--zgoq7kx6iu4jzgjw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Mon, Jan 19, 2026 at 03:37:17PM +0100, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
> > On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
> >> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
> >> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> I think that if you still want an API where you just call enable/di=
sable
> >> >> directly on it with no protection against unbalanced calls, then th=
at
> >> >> should be the special API. Probably called RawClk and functions mar=
ked
> >> >> unsafe. Unbalanced calls seem really dangerous and use should not be
> >> >> encouraged.
> >>=20
> >> +1; and unless there is a use-case that requires otherwise, it should =
not even
> >> be possible to do this at all -- at least for driver code.
> >
> > I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
> > perspective on many platforms. It's totally fine to provide nice, safe,
> > ergonomic wrappers for the drivers that don't care (or can't, really),
> > but treating a legitimate optimisation as something we should consider
> > impossible to do is just weird to me.
>=20
> I said that an unsafe API with potentially unbalanced calls is something =
we
> should clearly avoid for drivers. This is *not* equivalent to "treating a
> legitimate optimisation as something we should consider impossible".
>=20
> If we discover use-cases where the current API doesn't work well, we can
> invenstigate further.

I'm not sure I'm following what you're saying, sorry. I've pointed out
such a use-case already.

> >> > I think we should discourage RawClk if at all possible. But if the c=
onsensus
> >> > is that we *really* need this easily-abused thing, I can provide a f=
ollow-up.
> >>=20
> >> I think we should only do this if there are use-case with no alternati=
ve, so far
> >> there haven't been any AFAIK.
> >
> > I don't really care about which alternative we come up with, but look at
> > devm_regmap_init_mmio_clk for example. It is a valid use-case that
> > already exists today, and has had for more than a decade at this point.
>=20
> I don't see the issue with devm_regmap_init_mmio_clk()? It takes a refere=
nce
> count of the clock and prepares it when called and unprepares the clk in =
drops
> its reference in regmap_mmio_free_context() called from the devres callba=
ck.
>=20
> That something we can easily do with the current API, no?

The current one, yes. Doing that in the API suggested here would involve
some boilerplate in all those drivers they don't have right now.

Maxime

--zgoq7kx6iu4jzgjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXIp0AAKCRAnX84Zoj2+
dv/rAX9htC+v4VP6TU5rtpJ5yxn/5pIK0gwosc19iO/daFXAUH7fxYosU1HBuveb
KxjMgb8BgMuQtaOp2idk6EzXwAecWf/CAQ08Ci5MNA2QR6rNT2nYPbr8TNKaiLWq
nIzGXz2HvQ==
=cTWW
-----END PGP SIGNATURE-----

--zgoq7kx6iu4jzgjw--
