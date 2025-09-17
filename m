Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C37B800F8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3719510E84E;
	Wed, 17 Sep 2025 14:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ke9FdRQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB2010E84E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 769CB43268;
 Wed, 17 Sep 2025 14:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C10C4CEE7;
 Wed, 17 Sep 2025 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758119835;
 bh=WNLwm2DneHS0zi4fvWJbJ1VJqCF10002RieNhb5d+3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ke9FdRQgp0Mrxd8rQ85YsIbqJQC2ApYRMPnF0xIVdK+jH+cj+Mmdk5CFTSjXG7st1
 q6UtiSm6eG0ugRvy0ZQ7dxTVVBtL12+QHpQppsEky3kvwO+UKbVhgCYnta0I2pLUsC
 rgKFLPFSV85tqQgweqzQYY0aklUBdzsI3irF+cyDQyyPj1TopZE+uOd1rzNYGRvHwf
 j0BGW8sBQc14VCz/IevssmpiqVIC7OtnBAZO/F7pguX1nI4HovKxfvCN4/P/CWA5aO
 z7q5KYV3BjluMSlxfCZrACmE0w/Pv/cFCjIg9Mt/Q0u2m9wAlzE+7/Y0szqNVmzbqR
 1ekngs9X4DKtw==
Date: Wed, 17 Sep 2025 16:37:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
Message-ID: <20250917-berserk-gainful-chachalaca-cc05da@houat>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
 <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
 <87ect61txs.fsf@protonmail.com>
 <20250827-cherubic-tapir-of-wind-5cf0c4@houat>
 <87plbus32o.fsf@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fo3apuffsmxldwfu"
Content-Disposition: inline
In-Reply-To: <87plbus32o.fsf@protonmail.com>
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


--fo3apuffsmxldwfu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
MIME-Version: 1.0

On Sat, Sep 13, 2025 at 04:57:26PM +0000, Rahul Rameshbabu wrote:
> On Wed, 27 Aug, 2025 08:57:58 +0200 "Maxime Ripard" <mripard@kernel.org> =
wrote:
> > Hi Rahul,
> >
> > On Wed, Aug 20, 2025 at 04:46:52AM +0000, Rahul Rameshbabu wrote:
> >> On Tue, 19 Aug, 2025 11:06:40 +0200 "Maxime Ripard" <mripard@kernel.or=
g> wrote:
> >> > Hi Rahul,
> >> >
> >> > On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
> >> >> I am working on a drm_connector scoped backlight API in Rust. I hav=
e been
> >> >> looking through Hans de Goede's previous efforts on this topic to h=
elp
> >> >> guide my design. My hope is to enable backlight control over extern=
al
> >> >> displays through DDC or USB Monitor Control Class while also suppor=
ting
> >> >> internal panels. In parallel, I would like to improve the driver
> >> >> probing/selection mechanism when there are different candidates for=
 driving
> >> >> a backlight device. This initial RFC is mainly intended to sanity c=
heck
> >> >> that the plumbing I have chosen for extending the DRM connector
> >> >> functionality in Rust seems reasonable.
> >> >
> >> > It's a great goal, and I had that same discussion with Hans recently
> >> > too, but I can't find the link between backling/DDC CI, and Rust. Can
> >> > you elaborate?
> >>=20
> >> Hi Maxime,
> >>=20
> >> Sure, let me elaborate on this. You are right that plumbing DDC
> >> CI/backlight support at the DRM connector level does not need to be
> >> implemented in Rust.
> >>=20
> >> If we look at Hans's proposal, the suggested phase 2 was to add a
> >> drm_connector helper function for plumbing a pointer to the backlight
> >> device implementation. I had some model differences with regards to how
> >> the API would look like, mostly stemming from concerns about providing
> >> better runtime overriding of the acpi_video_get_backlight_type based
> >> backlight selection. However, I am aligned with the direction of scopi=
ng
> >> at the drm_connector level. I basically was interested in implementing
> >> this helper functionality in Rust instead of C, which is where Rust ca=
me
> >> into play.
> >>=20
> >> I was also interested in declaring and attaching a drm_property in Rust
> >> for controlling properties such as backlight rather than updating the
> >> drm_connector declaration in C as an experiment.
> >>=20
> >> Let me know if you feel like this work would be better off as a C
> >> implementation. I can also send out a detailed architecture proposal to
> >> the mailing list if that would help.
> >>=20
> >> Link: https://lore.freedesktop.org/wayland-devel/0d188965-d809-81b5-74=
ce-7d30c49fee2d@redhat.com/
> >
> > Thanks for the explanation.
> >
> > I'm not sure Rust is at the point where we can use it for the framework.
> > If we want to make this work useful, we have to make it consistent and
> > usable across all drivers, but we do have drivers for architectures that
> > aren't supported by Rust yet (let alone tier 1).
> >
> > So it feels to me that it would be a bit premature for that work to be
> > in Rust. If you do want to use it from a Rust driver though, feel free
> > to write bindings for it, that would be a great addition.
>=20
> Hi Maxime,
>=20
> Thanks for the follow-up. Sorry for the delay in my response. I was
> preparing a slide deck for Kangrejos 2025 (Rust for Linux conference).
>=20
> https://binary-eater.github.io/kangrejos-2025/
>=20
> The above discusses the architecture I had in mind in greater detail. I
> am working on some last minute tweaks. I wanted to do a couple things
> with regards to this topic.
>=20
> 1. Send a high level RFC describing the architecture / functionality
> 2. In parallel, maybe further evaluate whether Rust could be viable for
>    this effort. I hope the slides I put together help.
> 3. If the discussion in point 2 seems to suggest that Rust is not
>    viable, do the core implementation work in C.
>=20
> Let me know if this seems like a reasonable approach and thank you so
> much for taking the time to respond.

The thing I was trying to say before is that we have an inherent tension
here: it's an interface we want to roll as widely as possible, otherwise
userspace is going to either ignore it, or the kernel wouldn't provide a
consistent interface for this.

We do have drivers that are for architectures that don't have rust
support yet.

I still think it's premature to have code used by all those drivers in
Rust just yet.

Maxime

--fo3apuffsmxldwfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMrHlwAKCRAnX84Zoj2+
dpDfAYDBscZZ3zC9cwtha0V4NOUNTsCH/pyw4BxyQlinZ+Qv9NnwGyqoKSPjzWBA
yGEJ2mIBegKHgltq36/PFT4bj0BvjbBKc6w0ip90vFaaw7WbvSZJHICnQNYJlL7B
eXpb+GH+Ig==
=tElm
-----END PGP SIGNATURE-----

--fo3apuffsmxldwfu--
