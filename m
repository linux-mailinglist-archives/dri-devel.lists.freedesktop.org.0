Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B0A610C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E3810E309;
	Fri, 14 Mar 2025 12:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlqK5/Z0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA3310E309
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:21:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63EEDA46571;
 Fri, 14 Mar 2025 12:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6284AC4CEE3;
 Fri, 14 Mar 2025 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741954905;
 bh=Y5SPOi2KoiLG4UfxK9KX9k3+kO+IlNxXC+VTO5lvuck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlqK5/Z0Gtv97NjaTsjrh7bzIlZNIItGAjDQ1YHvrYFmvJem9NpUxPacLagVgHk3q
 4ku/7tlkRZ/muLVsgcJzLVqUE+F5G74OSGpg3/G42q3PnXrGnH82Yv8oSVa+DjOgzp
 6zhyKH1HLHEKJNv4YffPOKaAMnyeqw0pZazK7xYcdGw86bjsOuqyZenTDJ4PKkfm5r
 E2PI7b5irO1bG4veWaLghd6tHMxGkc0H20egFsxoiTckO1bc03gx6uK2CVRX4XGoiJ
 Z42RWH3Yln/4eRMoqfH0mdoHwLViX96RXTHh8x0sk0i/yFlgM/DzlO9iKNb6U2inFL
 fm/AquhwiYndQ==
Date: Fri, 14 Mar 2025 13:21:43 +0100
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
Subject: Re: [RFC v3 19/33] rust: drm/kms: Add DriverCrtc::atomic_check()
Message-ID: <20250314-golden-piculet-of-wholeness-04b4a0@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-20-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o264ixzbok3e3xzl"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-20-lyude@redhat.com>
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


--o264ixzbok3e3xzl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 19/33] rust: drm/kms: Add DriverCrtc::atomic_check()
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:35PM -0500, Lyude Paul wrote:
> An optional trait method for implementing a CRTC's atomic state check.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Document uses of ManuallyDrop
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/kms/atomic.rs |  1 -
>  rust/kernel/drm/kms/crtc.rs   | 55 +++++++++++++++++++++++++++++++++--
>  2 files changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
> index 3d5c70dbc4274..e0a1b5b860d6f 100644
> --- a/rust/kernel/drm/kms/atomic.rs
> +++ b/rust/kernel/drm/kms/atomic.rs
> @@ -274,7 +274,6 @@ impl<T: KmsDriver> AtomicStateComposer<T> {
>      /// # Safety
>      ///
>      /// The caller guarantees that `ptr` points to a valid instance of `=
drm_atomic_state`.
> -    #[allow(dead_code)]
>      pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -=
> Self {
>          // SAFETY: see `AtomicStateMutator::from_raw()`
>          Self(unsafe { AtomicStateMutator::new(ptr) })
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index 3b9c9d97fcf24..50f5b68f4a3fe 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -12,7 +12,7 @@
>      alloc::KBox,
>      bindings,
>      drm::device::Device,
> -    error::to_result,
> +    error::{from_result, to_result},
>      init::Zeroable,
>      prelude::*,
>      private::Sealed,
> @@ -21,7 +21,7 @@
>  use core::{
>      cell::{Cell, UnsafeCell},
>      marker::*,
> -    mem,
> +    mem::{self, ManuallyDrop},
>      ops::{Deref, DerefMut},
>      ptr::{addr_of_mut, null, null_mut, NonNull},
>  };
> @@ -78,7 +78,11 @@ pub trait DriverCrtc: Send + Sync + Sized {
>          helper_funcs: bindings::drm_crtc_helper_funcs {
>              atomic_disable: None,
>              atomic_enable: None,
> -            atomic_check: None,
> +            atomic_check: if Self::HAS_ATOMIC_CHECK {
> +                Some(atomic_check_callback::<Self>)
> +            } else {
> +                None
> +            },
>              dpms: None,
>              commit: None,
>              prepare: None,
> @@ -113,6 +117,21 @@ pub trait DriverCrtc: Send + Sync + Sized {
>      ///
>      /// Drivers may use this to instantiate their [`DriverCrtc`] object.
>      fn new(device: &Device<Self::Driver>, args: &Self::Args) -> impl Pin=
Init<Self, Error>;
> +
> +    /// The optional [`drm_crtc_helper_funcs.atomic_check`] hook for thi=
s crtc.
> +    ///
> +    /// Drivers may use this to customize the atomic check phase of thei=
r [`Crtc`] objects. The
> +    /// result of this function determines whether the atomic check pass=
ed or failed.
> +    ///
> +    /// [`drm_crtc_helper_funcs.atomic_check`]: srctree/include/drm/drm_=
modeset_helper_vtables.h
> +    fn atomic_check(
> +        _crtc: &Crtc<Self>,
> +        _old_state: &CrtcState<Self::State>,
> +        _new_state: CrtcStateMutator<'_, CrtcState<Self::State>>,
> +        _state: &AtomicStateComposer<Self::Driver>,
> +    ) -> Result {
> +        build_error::build_error("This should not be reachable")
> +    }

We've spent an awful lot of time trying to get rid of
old_state/new_state in the atomic hooks, so I'd prefer to not
reintroduce them again in Rust, even more so if you have accessors to go
=66rom AtomicStateComposer to CrtcStateMutator, which I think you do.

Maxime

--o264ixzbok3e3xzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QfVgAKCRAnX84Zoj2+
dsedAX9YicdeHv/KgpcvHul06KYakqYQzENFKP/PCfkP+Czzg+MaWzyOkp8/3PhL
m1PGoH0BgPDvfUsuXWp+AdloDuVHSf+EP1xPyBKIq99ZEEPoFFVp85jzxyZ+eNBa
fwDqLcyQvQ==
=myIL
-----END PGP SIGNATURE-----

--o264ixzbok3e3xzl--
