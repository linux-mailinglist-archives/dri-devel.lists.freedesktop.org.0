Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1736B37AFE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 08:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D310E70C;
	Wed, 27 Aug 2025 06:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IE9INoh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5F210E70C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B38060259;
 Wed, 27 Aug 2025 06:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F645C4CEEB;
 Wed, 27 Aug 2025 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756277881;
 bh=sXsa2oI+PlHDQ0E3S4V/J4UomuoV9FI2vgAus9rYLN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IE9INoh0Gk49HFNzEGbz3xB0zhwAvgcuslU3sWsUO8PI4xE1SlT+MoWepGTJ1rjT7
 dspA0kdDFWkTkvCIVp7D/NphCmD8QmrkeZtqMUN+mLrLDP0dUu2Emvz2uzjAw+wLzj
 NQDr0QVN1TEPa4ZwWK8mRwEYMhpko8jTz7ItPukkCAJjfVLvgG/nL/0+WOwgNjyvyH
 woYa1QsSOiSQhnTkjTr0yeamTGe39p962uQCgyg0DX/whytYWKXy57ccOreKfBR8pL
 S+g8PlQ7xk564/7qeUJRBMZqN1y2KY5DJHA3H15/oCOoWnfQ59cNAkzeaiA4a0CDu7
 Z+i33KAbEOdEA==
Date: Wed, 27 Aug 2025 08:57:58 +0200
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
Message-ID: <20250827-cherubic-tapir-of-wind-5cf0c4@houat>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
 <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
 <87ect61txs.fsf@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mqb3omvpumyphrna"
Content-Disposition: inline
In-Reply-To: <87ect61txs.fsf@protonmail.com>
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


--mqb3omvpumyphrna
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
MIME-Version: 1.0

Hi Rahul,

On Wed, Aug 20, 2025 at 04:46:52AM +0000, Rahul Rameshbabu wrote:
> On Tue, 19 Aug, 2025 11:06:40 +0200 "Maxime Ripard" <mripard@kernel.org> =
wrote:
> > Hi Rahul,
> >
> > On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
> >> I am working on a drm_connector scoped backlight API in Rust. I have b=
een
> >> looking through Hans de Goede's previous efforts on this topic to help
> >> guide my design. My hope is to enable backlight control over external
> >> displays through DDC or USB Monitor Control Class while also supporting
> >> internal panels. In parallel, I would like to improve the driver
> >> probing/selection mechanism when there are different candidates for dr=
iving
> >> a backlight device. This initial RFC is mainly intended to sanity check
> >> that the plumbing I have chosen for extending the DRM connector
> >> functionality in Rust seems reasonable.
> >
> > It's a great goal, and I had that same discussion with Hans recently
> > too, but I can't find the link between backling/DDC CI, and Rust. Can
> > you elaborate?
>=20
> Hi Maxime,
>=20
> Sure, let me elaborate on this. You are right that plumbing DDC
> CI/backlight support at the DRM connector level does not need to be
> implemented in Rust.
>=20
> If we look at Hans's proposal, the suggested phase 2 was to add a
> drm_connector helper function for plumbing a pointer to the backlight
> device implementation. I had some model differences with regards to how
> the API would look like, mostly stemming from concerns about providing
> better runtime overriding of the acpi_video_get_backlight_type based
> backlight selection. However, I am aligned with the direction of scoping
> at the drm_connector level. I basically was interested in implementing
> this helper functionality in Rust instead of C, which is where Rust came
> into play.
>=20
> I was also interested in declaring and attaching a drm_property in Rust
> for controlling properties such as backlight rather than updating the
> drm_connector declaration in C as an experiment.
>=20
> Let me know if you feel like this work would be better off as a C
> implementation. I can also send out a detailed architecture proposal to
> the mailing list if that would help.
>=20
> Link: https://lore.freedesktop.org/wayland-devel/0d188965-d809-81b5-74ce-=
7d30c49fee2d@redhat.com/

Thanks for the explanation.

I'm not sure Rust is at the point where we can use it for the framework.
If we want to make this work useful, we have to make it consistent and
usable across all drivers, but we do have drivers for architectures that
aren't supported by Rust yet (let alone tier 1).

So it feels to me that it would be a bit premature for that work to be
in Rust. If you do want to use it from a Rust driver though, feel free
to write bindings for it, that would be a great addition.

Maxime

--mqb3omvpumyphrna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK6sdQAKCRAnX84Zoj2+
dj2cAX0Q1S8INc2x2nOiw7Gdav5R8o0AlpqTSpNcuNO30kyg2DhhTEB+HnHezeiz
CW/FxoABfA4rE4Zkatie8ypmj+RpipQq3PL9ndTZUqJxICSQjW8zsi6jroNZl8SC
Hy0JDUs7Kg==
=qJ/e
-----END PGP SIGNATURE-----

--mqb3omvpumyphrna--
