Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIS/LUkOg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50EE3AF9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845E610E59D;
	Wed,  4 Feb 2026 09:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ArXmYgvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23210E59B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2180B600C4;
 Wed,  4 Feb 2026 09:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED09C4CEF7;
 Wed,  4 Feb 2026 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770196548;
 bh=lS9VFPZsRSSNY0TpBWxQ7aGLcnM4yMbS/RfpIHPoP1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArXmYgvBA36SUx1c2xvQzH24vnKr/dLJ567NvWI8RRbJPb7FUmnsBRpFh8+JxH2oH
 a4O2uhpoXMZd8psL8tyxV66IVOQxaWwcw5srCDnEeTkDdceL9379S/Oxt5gRc0HNJ7
 iJ/oyrGQu7PjoGsg2u6BjE0fqwiKT2oSeYIUj0fcCuxS3qCs8lBCIenfIZODUNIMKA
 cf3wiNqV/lPenBD9EtSee0hKDjnvFrhMIdEJlz3mI6gfkHraltBRkf+u3J1K6IJBkC
 yI9oGlZS2IVPZPE4siUHNp02gTmhORcHZJJNwUUf4gkxAizbp22DL+a2sTe9+DsbDE
 HjeM3nyKC2P3w==
Date: Wed, 4 Feb 2026 10:15:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
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
Message-ID: <20260204-nickel-seal-of-poetry-8fdefb@houat>
References: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cc3shtqnjnhks75h"
Content-Disposition: inline
In-Reply-To: <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
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
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2F50EE3AF9
X-Rspamd-Action: no action


--cc3shtqnjnhks75h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 09:29:30PM -0300, Daniel Almeida wrote:
>=20
>=20
> > On 22 Jan 2026, at 10:44, Maxime Ripard <mripard@kernel.org> wrote:
> >=20
> > On Mon, Jan 19, 2026 at 03:37:17PM +0100, Danilo Krummrich wrote:
> >> On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
> >>> On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
> >>>> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
> >>>>>> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >>>>>> I think that if you still want an API where you just call enable/d=
isable
> >>>>>> directly on it with no protection against unbalanced calls, then t=
hat
> >>>>>> should be the special API. Probably called RawClk and functions ma=
rked
> >>>>>> unsafe. Unbalanced calls seem really dangerous and use should not =
be
> >>>>>> encouraged.
> >>>>=20
> >>>> +1; and unless there is a use-case that requires otherwise, it shoul=
d not even
> >>>> be possible to do this at all -- at least for driver code.
> >>>=20
> >>> I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
> >>> perspective on many platforms. It's totally fine to provide nice, saf=
e,
> >>> ergonomic wrappers for the drivers that don't care (or can't, really),
> >>> but treating a legitimate optimisation as something we should consider
> >>> impossible to do is just weird to me.
> >>=20
> >> I said that an unsafe API with potentially unbalanced calls is somethi=
ng we
> >> should clearly avoid for drivers. This is *not* equivalent to "treatin=
g a
> >> legitimate optimisation as something we should consider impossible".
> >>=20
> >> If we discover use-cases where the current API doesn't work well, we c=
an
> >> invenstigate further.
> >=20
> > I'm not sure I'm following what you're saying, sorry. I've pointed out
> > such a use-case already.
> >=20
> >>>>> I think we should discourage RawClk if at all possible. But if the =
consensus
> >>>>> is that we *really* need this easily-abused thing, I can provide a =
follow-up.
> >>>>=20
> >>>> I think we should only do this if there are use-case with no alterna=
tive, so far
> >>>> there haven't been any AFAIK.
> >>>=20
> >>> I don't really care about which alternative we come up with, but look=
 at
> >>> devm_regmap_init_mmio_clk for example. It is a valid use-case that
> >>> already exists today, and has had for more than a decade at this poin=
t.
> >>=20
> >> I don't see the issue with devm_regmap_init_mmio_clk()? It takes a ref=
erence
> >> count of the clock and prepares it when called and unprepares the clk =
in drops
> >> its reference in regmap_mmio_free_context() called from the devres cal=
lback.
> >>=20
> >> That something we can easily do with the current API, no?
> >=20
> > The current one, yes. Doing that in the API suggested here would involve
> > some boilerplate in all those drivers they don't have right now.
> >=20
> > Maxime
>=20
> Maxime, I know you=E2=80=99ve already pointed out a use-case, but I think=
 the
> confusion stems from why you seem to think that the current solution cann=
ot
> cater to the API you mentioned in a clean way. You seem to imply that the=
re
> will be a lot of boilerplate involved, but we (or I) cannot see this. Per=
haps
> it would help if you highlighted how exactly the type state solution woul=
d be
> verbose using some pseudocode. I guess that would make your point clearer=
 for
> us.

I'm probably missing something then, but let's assume you have a driver
that wants its clock prepared and enabled in an hypothetical enable()
callback, and disabled / unprepared in a disable() callback.

=46rom a PM management perspective, this usecase makes total sense, is a
valid usecase, is widely used in the kernel, and is currently supported
by both the C and Rust clk APIs.

The only solution to this you suggested so far (I think?) to implement
this on top of the new clk API you propose is to have a driver specific
enum that would store each of the possible state transition.

That's the boilerplate I'm talking about. If every driver wanting to
implement that pattern has to make such an enum, with all the relevant
traits implementation that might come with it, we go from an API where
everything works at no-cost from a code-size perspective to a situation
where every driver has to develop and maintain that enum.

Maxime

--cc3shtqnjnhks75h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYMOQQAKCRAnX84Zoj2+
dvrFAYCy9cMAXESi9V53Vv20SNDa4P4AXDj8RQneRDFodbIFI+G3mTEJQXOcFGkx
+lpmRa0Bf1ShS4JaHvSikZv6j6Jok+SN4hqbhT/G4nenYi5IvCNK7+Ezo+THb7dq
SORhPzP8yg==
=E93p
-----END PGP SIGNATURE-----

--cc3shtqnjnhks75h--
