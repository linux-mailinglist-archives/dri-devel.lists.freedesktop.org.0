Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOMAJHWIjWnq3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:59:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4712B100
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A5110E6E4;
	Thu, 12 Feb 2026 07:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ttK4hrrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541410E0FD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 07:59:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D667C44298;
 Thu, 12 Feb 2026 07:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A9CC4CEF7;
 Thu, 12 Feb 2026 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770883184;
 bh=LJheg+1Lg6iUUverc5R9e3b/E+Zn96jS/50T1K8tIOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ttK4hrrUAk9Se4Kpm1hdtQ0fM5zBEuqymzqkEsY7MPfJlVtzyId3ENAhGqJTKxHJ9
 qk208j5OhxM/VJh96rLEhX9/GlU/phYgceJLrZbONswdhiGwIdX5dS/TcPuYtxrizC
 uFGBTCzuznFlBWgsHGk7zbkdKPw5a8WRpKTTgomhmDFQM4iOD4J1k3xPSEh3nlOi4W
 Z/zqkvFTnL13LBUEX+UXQCDRAt+9R/ZWr347UbIwpgC7VDoBln2hE+534MN6bUWXd1
 tcU5oSB09ywdfm7aSQX1nuaburzzjrUcRU9bme+LtMd2MCdx1H9NtHxE71PkIxIOvy
 rn077zqo3xnHA==
Date: Thu, 12 Feb 2026 08:59:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
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
Message-ID: <20260212-obedient-faithful-koel-d8aaf6@houat>
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="33m6meqnrfzcdzlc"
Content-Disposition: inline
In-Reply-To: <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EEA4712B100
X-Rspamd-Action: no action


--33m6meqnrfzcdzlc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Wed, Feb 11, 2026 at 05:47:09PM +0100, Danilo Krummrich wrote:
> On Wed Feb 11, 2026 at 5:37 PM CET, Maxime Ripard wrote:
> > I do think we can find a compromise though. Miguel suggested for example
> > to make the current enable/prepare/disable/unprepare function unsafe,
> > and that's totally reasonable to me.
> >
> > Then we can implement the "managed" clock version on that unsafe API,
>=20
> What do you mean with "managed" clock? Do you mean devres managed? If so,=
 I
> don't think there is any reason to switch to the unsafe API to be able to
> implement devres managed APIs (see also [1]).
>=20
> [1] https://lore.kernel.org/all/DFVW9MS5YLON.CVJDBYQKJ0P6@kernel.org/

By that, I mean what Daniel has been proposing to achieve with this series.

> > and we would end up with a "raw", unsafe, version kind of equivalent to
> > the one we have today, and where callers would have to justify why their
> > usage of the API is actually safe, or the new, managed, variant that is
> > safe and can be easily used by most drivers.
> >
> > And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
> >
> > How does that sound?
>=20
> What about we just wait until we have a user that really requires an unsa=
fe API
> for some reason? And if it never appears, even better. :)

It works *today*.

And the "oh but driver is using the API" is kind of ironic in the
context of the Rust bindings which have globally been in that situation
for years. You can't argue it both ways.

Either way, I'm not sure what the point of that submission was if you
will just dismiss diverging opinions, including attempts to compromise.

Do whatever you want, but it's really hard to root for you some times.

Maxime

--33m6meqnrfzcdzlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY2IZAAKCRAnX84Zoj2+
dgqqAX9ZKKvbeCpd4Vk6D0P2PgLPgXEzVbGysMUart7lUZ4iDk9GcFwLa7X8pXMl
DWKl2eEBf3hYz3Rv+1FNd/mQ9KtcUckYXXnZxYqCguLOzqUcX4VORUfxwQwckRE4
yTfjWW6Akw==
=V0pG
-----END PGP SIGNATURE-----

--33m6meqnrfzcdzlc--
