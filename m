Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGcEC8k9qWmn3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:24:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9120D671
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2D10EB5B;
	Thu,  5 Mar 2026 08:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Esq7gGZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B4210EB5B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:24:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B81B344330;
 Thu,  5 Mar 2026 08:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFFBC2BC9E;
 Thu,  5 Mar 2026 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772699076;
 bh=v9aqov2TRju92BUkePwYkzbYjnrsweKBt5HjUS1ipP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Esq7gGZU0KXs35RQU+pRlI1hgRQdxYIiLM86nXyEIyCQU01GYI19QdoSxNiwazxtb
 amix2JoNVwSw4sHwRX3GaRsSGHP3oMYdlKSU2WBjkb5dY8S+Z/qMrUI0igGiit/ebl
 EpQYoux7iIB/RdepnrDkfAXKEPEl9C1XqqRL/UnEIROc9kL4kuSOGfrCE3T61m8xtC
 mhfz6afBq6fQwsKYcva3+3WIGl4XWrNfxbUL32wxY79TmAi1f0EQl3VDDWv+huynVD
 r/g0D1cAC8Lggqh/H7lVjcJ/nM4kvBuAHF13ttzcQ5ww/I1MaSPwikStFIfZh/4Xg0
 MGUlxzUri/dKA==
Date: Thu, 5 Mar 2026 09:24:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
Message-ID: <aak9ZBJenK1DSCEt@monoceros>
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
 <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
 <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ygr7vi7eyprc7gqk"
Content-Disposition: inline
In-Reply-To: <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
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
X-Rspamd-Queue-Id: 8FA9120D671
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
	FORGED_SENDER(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:m.wilczynski@samsung.com,m:aliceryhl@google.com,m:mturquette@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:viresh.kumar@linaro.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[google.com,baylibre.com,linux.intel.com,kernel.org,redhat.com,linaro.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,samsung.com:email]
X-Rspamd-Action: no action


--ygr7vi7eyprc7gqk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
MIME-Version: 1.0

Hello,

On Tue, Jan 20, 2026 at 09:48:48AM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Jan 19, 2026 at 10:45:56PM +0100, Michal Wilczynski wrote:
> > On 1/13/26 16:12, Alice Ryhl wrote:
> > > Now that clk implements Send and Sync, we no longer need to manually
> > > implement these traits for Th1520PwmDriverData. Thus remove the
> > > implementations.
> >=20
> > I thought this was already merged :-).
> >=20
> > Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
>=20
> If I understand correctly this patch 3 depends on the first patch of
> this series so I cannot pick it up via the pwm tree *now*. There is
> another patch pending for the th1520 PWM driver, but as of now git seems
> to cope well when merging the pwm's tree for-next with this patch.  So
> it's fine for me if the series is picked up for 6.20-rc1 via the clock
> tree.

That didn't happen (with s/6.20/7.0/), so this patch is still open in my
todo list. Is the first patch still considered for the clk subsystem?
What is the plan for the pwm patch?

Best regards
Uwe

--ygr7vi7eyprc7gqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmpPb4ACgkQj4D7WH0S
/k6AYgf+IFbJpwiUp9P8Rmry4DJdrF6HeXt7L7+0cSOAtSjz8246LrMcqOZN03RB
YAi8NxU8tZw4Ib54H+GNZUp+gf4jryjO+ry/HXrbC9giXxYVAPBzNhRLgpLUXsm/
dIJFq7MwB5s7zFnJ6F/u2kD/cCvzCgokFftc831AAAOI7oFD0yZx6nHS/FT60M9B
eK4cNPn/MEB3vgaxHub02lpr0ctEd+s9sPzbmUobR5KI4yqf60VKycdMGfZtu/m6
h/nZTyq/u+CEZP92L59gx7GPKTnJZ2XcHKXJSw5wgPiNCYRWn4s1EbKXA6uvKQV5
r6wXppJz8sU18n8EljYkeht9uPMW0g==
=NxJx
-----END PGP SIGNATURE-----

--ygr7vi7eyprc7gqk--
