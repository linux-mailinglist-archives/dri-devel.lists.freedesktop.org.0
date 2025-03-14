Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB35BA61077
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D247310E9DA;
	Fri, 14 Mar 2025 11:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rwEVISHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FDB10E9DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F5B4A4659B;
 Fri, 14 Mar 2025 11:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83269C4CEE3;
 Fri, 14 Mar 2025 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741953435;
 bh=VxaxwjK+niSMzXPPlLDr7WIz4BtXQ1WcjaUYmy+sD5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwEVISHx65bRzneHmAZfN6WGuIIQxhyirha4to4EORUNqjZzdFBRklKT47M7XKhDl
 zAQaSt2GTDlkfZv/W5upxPZH/3aXDW248TArmO2RfdYuGaxbmzc2aPDVszF1ebrtsy
 zWhf5erSNDYhRS4AYAVadm1DdwtpPjqM/8TiwsnIJsB2ZKKfMryLztIEeY13XmBIb6
 1oBthumGXnIbQvTvuNKiHqIxTjos2/gRn2hd4mAA54zoyU8HUzbmGNFF3pwxyv9ffe
 IIoRIhdLy16Z6gv3rO/zvGmg9H5Zd7VXxJPGVowqyim0YJ5jgEIhu9VOqg/eayxIqp
 CNrYv3/29QPcg==
Date: Fri, 14 Mar 2025 12:57:13 +0100
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
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 09/33] rust: drm/kms: Add DriverConnector::get_mode
 callback
Message-ID: <20250314-gigantic-frisky-condor-9b35c8@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-10-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="36i6rvascxdsmql5"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-10-lyude@redhat.com>
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


--36i6rvascxdsmql5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 09/33] rust: drm/kms: Add DriverConnector::get_mode
 callback
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:25PM -0500, Lyude Paul wrote:
> Next up is filling out some of the basic connector hotplugging callbacks -
> which we'll need for setting up the fbdev helpers for KMS devices. Note
> that connector hotplugging in DRM follows a BFL scheme: pretty much all
> probing is protected under the mighty drm_device->mode_config.lock, which
> of course is a bit counter-intuitive to rust's locking schemes where data
> is always associated with its lock.
>=20
> Since that lock is embedded in an FFI type and not a rust type, we need to
> introduce our own wrapper type that acts as a lock acquisition for this.
> This brings us to introducing a few new types:
>=20
> * ModeConfigGuard - the most basic lock guard, as long as this object is
>   alive we are guaranteed to be holding drm_device->mode_config.lock. This
>   object doesn't do much else on its own currently.
> * ConnectorGuard - an object which corresponds to a specific typed DRM
>   connector. This can only be acquired with a ModeConfigGuard, and will be
>   used to allow calling methods that are only safe to call with
>   drm_device->mode_config.lock held. Since it implements
>   Deref<Target=3DConnector<T>> as well, it can also be used for any other
>   operations that would normally be available on a DRM connector.
>=20
> And finally, we add the DriverConnector::get_modes() trait method which
> drivers can use to implement the drm_connector_helper_funcs.get_modes
> callback. Note that while we make this trait method mandatory, we only do
> so for the time being since VKMS doesn't do very much with DRM connectors=
 -
> and as such we have no need yet to implement alternative connector probing
> schemes outside of get_modes().
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Document uses of ManuallyDrop
> * Use addr_of_mut!() instead of &mut
> * Add some missing invariant comments
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h  |  1 +
>  rust/kernel/drm/kms.rs           | 90 +++++++++++++++++++++++++++++++-
>  rust/kernel/drm/kms/connector.rs | 62 ++++++++++++++++++++--
>  3 files changed, 147 insertions(+), 6 deletions(-)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a6735f6fba947..27828dd36d4f2 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -21,6 +21,7 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_plane.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <kunit/test.h>
>  #include <linux/blk-mq.h>
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index f0044d396e1eb..7935e935f9975 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -8,15 +8,20 @@
>  pub mod plane;
> =20
>  use crate::{
> -    device,
> +    container_of, device,
>      drm::{device::Device, drv::Driver},
>      error::to_result,
>      prelude::*,
>      private::Sealed,
> +    sync::{Mutex, MutexGuard},
>      types::*,
>  };
>  use bindings;
> -use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref,
> +    ptr::{self, addr_of_mut, NonNull},
> +};
> =20
>  /// The C vtable for a [`Device`].
>  ///
> @@ -191,6 +196,23 @@ pub struct ModeConfigInfo {
>      pub preferred_fourcc: Option<u32>,
>  }
> =20
> +impl<T: KmsDriver> Device<T> {
> +    /// Retrieve a pointer to the mode_config mutex
> +    #[inline]
> +    pub(crate) fn mode_config_mutex(&self) -> &Mutex<()> {
> +        // SAFETY: This lock is initialized for as long as `Device<T>` i=
s exposed to users
> +        unsafe { Mutex::from_raw(addr_of_mut!((*self.as_raw()).mode_conf=
ig.mutex)) }
> +    }
> +
> +    /// Acquire the [`mode_config.mutex`] for this [`Device`].
> +    #[inline]
> +    pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
> +        // INVARIANT: We're locking mode_config.mutex, fulfilling our in=
variant that this lock is
> +        // held throughout ModeConfigGuard's lifetime.
> +        ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
> +    }
> +}
> +

Again, I think the introduction of ModeConfigGuard, the new API to get
the mutex and guard from the DRM device, etc, while obviously called
for, would be better in separate patches.

>  /// A modesetting object in DRM.
>  ///
>  /// This is any type of object where the underlying C object contains a =
[`struct drm_mode_object`].
> @@ -314,3 +336,67 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
>          unsafe { bindings::drm_mode_object_put(obj.as_ref().raw_mode_obj=
()) }
>      }
>  }
> +
> +/// A mode config guard.
> +///
> +/// This is an exclusive primitive that represents when [`drm_device.mod=
e_config.mutex`] is held - as
> +/// some modesetting operations (particularly ones related to [`connecto=
rs`](connector)) are still
> +/// protected under this single lock. The lock will be dropped once this=
 object is dropped.
> +///
> +/// # Invariants
> +///
> +/// - `self.0` is contained within a [`struct drm_mode_config`], which i=
s contained within a
> +///   [`struct drm_device`].
> +/// - The [`KmsDriver`] implementation of that [`struct drm_device`] is =
always `T`.
> +/// - This type proves that [`drm_device.mode_config.mutex`] is acquired.
> +///
> +/// [`struct drm_mode_config`]: (srctree/include/drm/drm_device.h)
> +/// [`drm_device.mode_config.mutex`]: (srctree/include/drm/drm_device.h)
> +/// [`struct drm_device`]: (srctree/include/drm/drm_device.h)
> +pub struct ModeConfigGuard<'a, T: KmsDriver>(MutexGuard<'a, ()>, Phantom=
Data<T>);
> +
> +impl<'a, T: KmsDriver> ModeConfigGuard<'a, T> {
> +    /// Construct a new [`ModeConfigGuard`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that [`drm_device.mode_config.mutex`] is =
acquired.
> +    ///
> +    /// [`drm_device.mode_config.mutex`]: (srctree/include/drm/drm_devic=
e.h)
> +    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
> +        // SAFETY: Our safety contract fulfills the requirements of `Mut=
exGuard::new()`
> +        // INVARIANT: And our safety contract ensures that this type pro=
ves that
> +        // `drm_device.mode_config.mutex` is acquired.
> +        Self(
> +            unsafe { MutexGuard::new(drm.mode_config_mutex(), ()) },
> +            PhantomData,
> +        )
> +    }
> +
> +    /// Return the [`Device`] that this [`ModeConfigGuard`] belongs to.
> +    pub fn drm_dev(&self) -> &'a Device<T> {
> +        // SAFETY:
> +        // - `self` is embedded within a `drm_mode_config` via our type =
invariants
> +        // - `self.0.lock` has an equivalent data type to `mutex` via it=
s type invariants.
> +        let mode_config =3D unsafe { container_of!(self.0.lock, bindings=
::drm_mode_config, mutex) };
> +
> +        // SAFETY: And that `drm_mode_config` lives in a `drm_device` vi=
a type invariants.
> +        unsafe {
> +            Device::borrow(container_of!(
> +                mode_config,
> +                bindings::drm_device,
> +                mode_config
> +            ))
> +        }
> +    }
> +
> +    /// Assert that the given device is the owner of this mode config gu=
ard.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `dev` is different from the owning device for this mod=
e config guard.
> +    #[inline]
> +    pub(crate) fn assert_owner(&self, dev: &Device<T>) {
> +        assert!(ptr::eq(self.drm_dev(), dev));
> +    }
> +}
> diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/conne=
ctor.rs
> index 6fe0a7517bd55..14de3b0529f89 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -4,7 +4,7 @@
>  //!
>  //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_co=
nnector.h)
> =20
> -use super::{encoder::*, KmsDriver, ModeObject, RcModeObject};
> +use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, RcModeOb=
ject};
>  use crate::{
>      alloc::KBox,
>      bindings,
> @@ -17,7 +17,7 @@
>  };
>  use core::{
>      marker::*,
> -    mem,
> +    mem::{self, ManuallyDrop},
>      ops::*,
>      ptr::{addr_of_mut, null_mut},
>      stringify,
> @@ -106,7 +106,7 @@ pub trait DriverConnector: Send + Sync + Sized {
>              destroy: Some(connector_destroy_callback::<Self>),
>              force: None,
>              detect: None,
> -            fill_modes: None,
> +            fill_modes: Some(bindings::drm_helper_probe_single_connector=
_modes),

It's kind of what I wanted to express in my earlier statements I guess,
but I'm not really sure we should force down helpers on drivers. The
larger approach KMS has taken over the years was to provide hooks and
default implementations, with the drivers allowed to use different
implementations if they wanted to.

That approach largely worked for us I think, so I'm a bit worried about
changing that.

>              debugfs_init: None,
>              oob_hotplug_event: None,
>              atomic_duplicate_state: Some(atomic_duplicate_state_callback=
::<Self::State>),
> @@ -114,7 +114,7 @@ pub trait DriverConnector: Send + Sync + Sized {
>          helper_funcs: bindings::drm_connector_helper_funcs {
>              mode_valid: None,
>              atomic_check: None,
> -            get_modes: None,
> +            get_modes: Some(get_modes_callback::<Self>),
>              detect_ctx: None,

Since you pass (the equivalent of) the locking context to get_modes, I'd
rather keep the convention you have with detect here and use the _ctx
suffix, or drop the one from detect_ctx, and pass the context
everywhere. But we should be consistent there at least.

Maxime

--36i6rvascxdsmql5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QZmAAKCRAnX84Zoj2+
dpVsAX4yGH76zjBhSWlLOh2qzSVSXb8yusnOsYHn31IQY5PbEvcD++uO7+wwZC9l
FR9Xh9EBgITG1cYAzaBSEYEt71OjCp3WmdPIyrZKDDP5PT9hTEIm6Zu2n3zxW83q
IDhuxeCOuQ==
=jJ2K
-----END PGP SIGNATURE-----

--36i6rvascxdsmql5--
