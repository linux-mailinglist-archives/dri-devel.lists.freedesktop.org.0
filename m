Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA86A610ED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DFB10E370;
	Fri, 14 Mar 2025 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AHB8bRqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF8D10E370
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:25:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B62B5C0666;
 Fri, 14 Mar 2025 12:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781FBC4CEE3;
 Fri, 14 Mar 2025 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741955119;
 bh=lX6P6BkccktiL84ymCoW4M2tQiV48IROB/Z80qlWTb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHB8bRqbxV3rn4ycF7li6ou2UcpeF2pQbc2g0MzUXfq4orqyWk76L/ai9nLC7SKfC
 4+8WBW1CUTVaJypQ01jEJkPdSHfcO3XjOTZUQwquT9Bqf+6887zIAkAvrLZr3iSqDc
 cDjoD/1aN4/sPFEgV3tDbdwqftXbj8Tuz3GRAvcA6eka1q0kfG+nwkT/9iEkayuNLc
 9bogWyNJZHjYgKGVQgwp8ZT60dG2cCPbYPIm0KtHpMeTSU6K8xV9lWYzmVBLBaxTEW
 3sn5AIlG/Y0twz9RoQ7oSYwoelGyhERqNrATpQIN8VWhdMu3cTNBayj/umC+Ws8sKn
 BN7+cBGm7pZ0w==
Date: Fri, 14 Mar 2025 13:25:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, 
 Simona Vetter <sima@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 27/33] rust: drm/kms: Add DriverCrtc::atomic_begin() and
 atomic_flush()
Message-ID: <20250314-aspiring-prehistoric-caracara-ba6435@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-28-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4vzvxz5ir4p5ljeq"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-28-lyude@redhat.com>
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


--4vzvxz5ir4p5ljeq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 27/33] rust: drm/kms: Add DriverCrtc::atomic_begin() and
 atomic_flush()
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:43PM -0500, Lyude Paul wrote:
> Optional trait methods for implementing the atomic_begin and atomic_flush
> callbacks for a CRTC.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/kms/crtc.rs | 90 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index aaa208b35c3c1..131d10505ba07 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -90,8 +90,16 @@ pub trait DriverCrtc: Send + Sync + Sized {
>              mode_set: None,
>              mode_valid: None,
>              mode_fixup: None,
> -            atomic_begin: None,
> -            atomic_flush: None,
> +            atomic_begin: if Self::HAS_ATOMIC_BEGIN {
> +                Some(atomic_begin_callback::<Self>)
> +            } else {
> +                None
> +            },
> +            atomic_flush: if Self::HAS_ATOMIC_FLUSH {
> +                Some(atomic_flush_callback::<Self>)
> +            } else {
> +                None
> +            },
>              mode_set_nofb: None,
>              mode_set_base: None,
>              mode_set_base_atomic: None,
> @@ -132,6 +140,36 @@ fn atomic_check(
>      ) -> Result {
>          build_error::build_error("This should not be reachable")
>      }
> +
> +    /// The optional [`drm_crtc_helper_funcs.atomic_begin`] hook.
> +    ///
> +    /// This hook will be called before a set of [`Plane`] updates are p=
erformed for the given
> +    /// [`Crtc`].
> +    ///
> +    /// [`drm_crtc_helper_funcs.atomic_begin`]: srctree/include/drm/drm_=
modeset_helper_vtables.h
> +    fn atomic_begin(
> +        _crtc: &Crtc<Self>,
> +        _old_state: &CrtcState<Self::State>,
> +        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
> +        _state: &AtomicStateMutator<Self::Driver>,
> +    ) {
> +        build_error::build_error("This should not be reachable")
> +    }

Another dumb question I guess. If it's optional, and the default
implementation of a trait errors out at build time, how can it not break
if we don't implement the method?

Maxime

--4vzvxz5ir4p5ljeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QgLAAKCRAnX84Zoj2+
doWXAYCngdcASoukMj94aBgAFaDc5rmGDv7xFouBULgQ1a7QU4FIOv1FrDDYBjjs
LV/iy/IBfA7HXPThFtjNWgZICI73lieLqkSKUI9FtusEAO1W/HH19SsQJ+OivEhw
euxbbwkLPg==
=4Day
-----END PGP SIGNATURE-----

--4vzvxz5ir4p5ljeq--
