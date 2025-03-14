Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B899A610C6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1210E356;
	Fri, 14 Mar 2025 12:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fjU5puaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7510E356
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:22:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 590EC5C6396;
 Fri, 14 Mar 2025 12:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F2BC4CEE3;
 Fri, 14 Mar 2025 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741954969;
 bh=Pqk5m5XBKy+Hv73Zwq676K5PF8xzsJSlwBNzMnQ1mH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjU5puaKlKKJ/MZgOSRLqg77Egu8d+WLA7e3LDZMhjbIKvcKMmI3AXhgU2yEyO0WP
 ceC0dpjUIJlGB++DhasLmTjVoA86vrnLXhP30XoFCOPwxL/gVOunshzassGHonQJby
 Gog574BOfFRlkUhTdMbQ9FcDN/NRltlKE2LuUk3Fan42OsYEOSaO9wisHPlXHWzyGi
 ItC7St2ZLlUa2jScuARt76YVoKoumKSEHNb5nS5ciw1jOE6OAyDJluZYXPdis1jSVv
 e2r+NdOkwn4dyrrwB/FgeVlB9jnYRxYKZmJYcGRko1RrmuJ3KbbI/OEiSoV9MePmCj
 VGdMqRO2vwY2Q==
Date: Fri, 14 Mar 2025 13:22:47 +0100
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
Subject: Re: [RFC v3 21/33] rust: drm/kms: Add DriverPlane::atomic_check()
Message-ID: <20250314-unselfish-manipulative-parrot-0f403f@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-22-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="grcwfw23rs235645"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-22-lyude@redhat.com>
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


--grcwfw23rs235645
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 21/33] rust: drm/kms: Add DriverPlane::atomic_check()
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:37PM -0500, Lyude Paul wrote:
> Optional trait method for implementing a plane's atomic_check().
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Document ManuallyDrop uses better
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/kms/plane.rs | 53 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
> index b090aebc35649..f3adc30c17489 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -11,7 +11,7 @@
>      alloc::KBox,
>      bindings,
>      drm::{device::Device, fourcc::*},
> -    error::{to_result, Error},
> +    error::{from_result, to_result, Error},
>      init::Zeroable,
>      prelude::*,
>      private::Sealed,
> @@ -20,7 +20,7 @@
>  use core::{
>      cell::Cell,
>      marker::*,
> -    mem,
> +    mem::{self, ManuallyDrop},
>      ops::*,
>      pin::Pin,
>      ptr::{addr_of_mut, null, null_mut, NonNull},
> @@ -69,7 +69,11 @@ pub trait DriverPlane: Send + Sync + Sized {
>              cleanup_fb: None,
>              begin_fb_access: None,
>              end_fb_access: None,
> -            atomic_check: None,
> +            atomic_check: if Self::HAS_ATOMIC_CHECK {
> +                Some(atomic_check_callback::<Self>)
> +            } else {
> +                None
> +            },
>              atomic_update: if Self::HAS_ATOMIC_UPDATE {
>                  Some(atomic_update_callback::<Self>)
>              } else {
> @@ -117,6 +121,21 @@ fn atomic_update(
>      ) {
>          build_error::build_error("This should not be reachable")
>      }
> +
> +    /// The optional [`drm_plane_helper_funcs.atomic_check`] hook for th=
is plane.
> +    ///
> +    /// Drivers may use this to customize the atomic check phase of thei=
r [`Plane`] objects. The
> +    /// result of this function determines whether the atomic check pass=
ed or failed.
> +    ///
> +    /// [`drm_plane_helper_funcs.atomic_check`]: srctree/include/drm/drm=
_modeset_helper_vtables.h
> +    fn atomic_check(
> +        _plane: &Plane<Self>,
> +        _new_state: PlaneStateMutator<'_, PlaneState<Self::State>>,
> +        _old_state: &PlaneState<Self::State>,
> +        _state: &AtomicStateComposer<Self::Driver>,
> +    ) -> Result {
> +        build_error::build_error("This should not be reachable")
> +    }

I think it was the other way around for CRTCs between old_state and
new_state? I still believe we should get rid of both, but we need to be
consistent at least :)

Maxime

--grcwfw23rs235645
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QflgAKCRAnX84Zoj2+
dlmgAYCv/IqQx/4fwu6/QLutidlJcS4QIP6PwcZ7YhfyMMrxDOEfwYtyOmGtQU/r
nevoE08BgOsHvColnXcbK/ipTKsd+otfQ0Ej4/mpQsBfTBAz2LutE2JA9TTebLzd
uh7Y52/t0Q==
=kqb1
-----END PGP SIGNATURE-----

--grcwfw23rs235645--
