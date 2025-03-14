Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018DFA60E30
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990AE10E012;
	Fri, 14 Mar 2025 10:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qbop8S4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5338B10E012
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:05:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5B0D2A449A2;
 Fri, 14 Mar 2025 10:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EBDC4CEE3;
 Fri, 14 Mar 2025 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741946755;
 bh=03PeuX3zEoMsHex9Pl1k6JlGQ3dHjNNjrz0Pss6M8aY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qbop8S4C6UFD9hpbvl/X9CrkPqOmJwDFCEiLfiYvwKF0zUABhYMXKrvxdposqP5dz
 Kr6IgOONttU6NLy6zAjhTm9gb25TFl1A0A+uZ6Vy0huum/zVOJ7VUETJuN4f6BdTP+
 zM8HZo1Y7lweHe5dMoo7HMiMhCRqo4gujAMT/pP3Ol35d0a63pgYJZRYKR+phbYl/A
 vpg1lxY/Ph31K70xgzZmHap3W4clRnf/iHEu3UzCapSd/6YIvXY6JEehuTVpqO0yDr
 ytx84okhZ5+Zsg2z118EYr1woHlfXx6WKrs+jtpCxwWH4xTL7YOgQQks/gpbtoH39K
 lc08s0eQ+ZeHg==
Date: Fri, 14 Mar 2025 11:05:52 +0100
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 02/33] rust: drm: Add traits for registering KMS devices
Message-ID: <20250314-unselfish-mauve-anaconda-2991af@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="k2ya52hs7cxxbhks"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-3-lyude@redhat.com>
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


--k2ya52hs7cxxbhks
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 02/33] rust: drm: Add traits for registering KMS devices
MIME-Version: 1.0

Hi Lyude,

First off, thanks for keeping up with this series.

I'm quite familiar with Rust in userspace, but not so much in the
kernel, so I might have stupid questions or points, sorry I advance :)

On Wed, Mar 05, 2025 at 05:59:18PM -0500, Lyude Paul wrote:
> This commit adds some traits for registering DRM devices with KMS support,
> implemented through the kernel::drm::kms::KmsDriver trait. Devices which
> don't have KMS support can simply use PhantomData<Self>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V3:
> * Get rid of Kms, long live KmsDriver
>   After Daniel pointed out that we should just make KmsDriver a supertrait
>   of Driver, it immediately occurred to me that there's no actual need for
>   Kms to be a separate trait at all. So, drop Kms entirely and move its
>   requirements over to KmsDriver.
> * Drop fbdev module entirely and move fbdev related setup into AllocImpl
>   (Daniel)
> * Rebase to use drm_client_setup()
>=20
> TODO:
> * Generate feature flags automatically, these shouldn't need to be
>   specified by the user
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |   6 ++
>  rust/kernel/drm/device.rs       |  10 +-
>  rust/kernel/drm/drv.rs          |  56 ++++++++--
>  rust/kernel/drm/gem/mod.rs      |   4 +
>  rust/kernel/drm/gem/shmem.rs    |   4 +
>  rust/kernel/drm/kms.rs          | 186 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   1 +
>  7 files changed, 258 insertions(+), 9 deletions(-)
>  create mode 100644 rust/kernel/drm/kms.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index ca857fb00b1a5..e1ed4f40c8e89 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,10 +6,16 @@
>   * Sorted alphabetically.
>   */
> =20
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <kunit/test.h>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 5b4db2dfe87f5..cf063de387329 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -5,8 +5,8 @@
>  //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/d=
rm/drm_device.h)
> =20
>  use crate::{
> -    bindings, device, drm,
> -    drm::drv::AllocImpl,
> +    bindings, device,
> +    drm::{self, drv::AllocImpl, kms::private::KmsImpl as KmsImplPrivate},
>      error::code::*,
>      error::from_err_ptr,
>      error::Result,
> @@ -73,7 +73,7 @@ impl<T: drm::drv::Driver> Device<T> {
>          dumb_create: T::Object::ALLOC_OPS.dumb_create,
>          dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
>          show_fdinfo: None,
> -        fbdev_probe: None,
> +        fbdev_probe: T::Object::ALLOC_OPS.fbdev_probe,
> =20
>          major: T::INFO.major,
>          minor: T::INFO.minor,
> @@ -153,6 +153,10 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::B=
orrowed<'_> {
>          // SAFETY: `Self::data` is always converted and set on device cr=
eation.
>          unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data(=
)) };
>      }
> +
> +    pub(crate) const fn has_kms() -> bool {
> +        <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
> +    }
>  }
> =20
>  // SAFETY: DRM device objects are always reference counted and the get/p=
ut functions
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> index e42e266bdd0da..3e09e130730f6 100644
> --- a/rust/kernel/drm/drv.rs
> +++ b/rust/kernel/drm/drv.rs
> @@ -6,14 +6,15 @@
> =20
>  use crate::{
>      alloc::flags::*,
> -    bindings,
> +    bindings, device,
>      devres::Devres,
> -    drm,
> +    drm::{self, kms::private::KmsImpl as KmsImplPrivate},
>      error::{Error, Result},
>      private::Sealed,
>      str::CStr,
>      types::{ARef, ForeignOwnable},
>  };
> +use core::ptr::null;
>  use macros::vtable;
> =20
>  /// Driver use the GEM memory manager. This should be set for all modern=
 drivers.
> @@ -115,6 +116,12 @@ pub struct AllocOps {
>              offset: *mut u64,
>          ) -> core::ffi::c_int,
>      >,
> +    pub(crate) fbdev_probe: Option<
> +        unsafe extern "C" fn(
> +            fbdev_helper: *mut bindings::drm_fb_helper,
> +            sizes: *mut bindings::drm_fb_helper_surface_size,
> +        ) -> core::ffi::c_int,
> +    >,
>  }
> =20
>  /// Trait for memory manager implementations. Implemented internally.
> @@ -142,6 +149,14 @@ pub trait Driver {
>      /// The type used to represent a DRM File (client)
>      type File: drm::file::DriverFile;
> =20
> +    /// The KMS implementation for this driver.
> +    ///
> +    /// Drivers that wish to support KMS should pass their implementatio=
n of `drm::kms::KmsDriver`
> +    /// here. Drivers which do not have KMS support can simply pass `drm=
::kms::NoKms` here.
> +    type Kms: drm::kms::KmsImpl<Driver =3D Self>
> +    where
> +        Self: Sized;
> +
>      /// Driver metadata
>      const INFO: DriverInfo;
> =20
> @@ -159,21 +174,44 @@ pub trait Driver {
> =20
>  impl<T: Driver> Registration<T> {
>      /// Creates a new [`Registration`] and registers it.
> -    pub fn new(drm: ARef<drm::device::Device<T>>, flags: usize) -> Resul=
t<Self> {
> +    pub fn new(dev: &device::Device, data: T::Data, flags: usize) -> Res=
ult<Self> {
> +        let drm =3D drm::device::Device::<T>::new(dev, data)?;
> +        let has_kms =3D drm::device::Device::<T>::has_kms();
> +
> +        let mode_config_info =3D if has_kms {
> +            // SAFETY: We have yet to register this device
> +            Some(unsafe { T::Kms::setup_kms(&drm)? })
> +        } else {
> +            None
> +        };
> +
>          // SAFETY: Safe by the invariants of `drm::device::Device`.
>          let ret =3D unsafe { bindings::drm_dev_register(drm.as_raw(), fl=
ags) };
>          if ret < 0 {
>              return Err(Error::from_errno(ret));
>          }
> =20
> +        #[cfg(CONFIG_DRM_CLIENT =3D "y")]
> +        if has_kms {
> +            if let Some(ref info) =3D mode_config_info {
> +                if let Some(fourcc) =3D info.preferred_fourcc {
> +                    // SAFETY: We just registered `drm` above, fulfillin=
g the C API requirements
> +                    unsafe { bindings::drm_client_setup_with_fourcc(drm.=
as_raw(), fourcc) }
> +                } else {
> +                    // SAFETY: We just registered `drm` above, fulfillin=
g the C API requirements
> +                    unsafe { bindings::drm_client_setup(drm.as_raw(), nu=
ll()) }
> +                }
> +            }
> +        }
> +
>          Ok(Self(drm))
>      }
> =20
>      /// Same as [`Registration::new`}, but transfers ownership of the [`=
Registration`] to `Devres`.
> -    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: u=
size) -> Result {
> -        let reg =3D Registration::<T>::new(drm.clone(), flags)?;
> +    pub fn new_foreign_owned(dev: &device::Device, data: T::Data, flags:=
 usize) -> Result {
> +        let reg =3D Registration::<T>::new(dev, data, flags)?;
> =20
> -        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
> +        Devres::new_foreign_owned(dev, reg, GFP_KERNEL)

I appreciate that it's a quite large series, but I think this patch (and
others, from a quick glance) could be broken down some more. For
example, the introduction of the new data parameter to
Registration::new() is a prerequisite but otherwise pretty orthogonal to
the patch subject.

>      }
> =20
>      /// Returns a reference to the `Device` instance for this registrati=
on.
> @@ -195,5 +233,11 @@ fn drop(&mut self) {
>          // SAFETY: Safe by the invariant of `ARef<drm::device::Device<T>=
>`. The existance of this
>          // `Registration` also guarantees the this `drm::device::Device`=
 is actually registered.
>          unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
> +
> +        if drm::device::Device::<T>::has_kms() {
> +            // SAFETY: We just checked above that KMS was setup for this=
 device, so this is safe to
> +            // call
> +            unsafe { bindings::drm_atomic_helper_shutdown(self.0.as_raw(=
)) }
> +        }

And similarly, calling drm_atomic_helper_shutdown() (even though it's
probably a good idea imo), should be a follow-up. I guess it's more of a
policy thing but drivers have different opinions about it and I guess we
should discuss that topic in isolation.

Breaking down the patches into smaller chunks will also make it easier
to review, and I'd really appreciate it :)

>      }
>  }
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 3fcab497cc2a5..605b0a22ac08b 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -300,6 +300,10 @@ impl<T: DriverObject> drv::AllocImpl for Object<T> {
>          gem_prime_import_sg_table: None,
>          dumb_create: None,
>          dumb_map_offset: None,
> +        #[cfg(CONFIG_DRM_FBDEV_EMULATION =3D "y")]
> +        fbdev_probe: Some(bindings::drm_fbdev_dma_driver_fbdev_probe),
> +        #[cfg(CONFIG_DRM_FBDEV_EMULATION =3D "n")]
> +        fbdev_probe: None,
>      };
>  }
> =20
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 92da0d7d59912..9c0162b268aa8 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -279,6 +279,10 @@ impl<T: DriverObject> drv::AllocImpl for Object<T> {
>          gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_im=
port_sg_table),
>          dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
>          dumb_map_offset: None,
> +        #[cfg(CONFIG_DRM_FBDEV_EMULATION =3D "y")]
> +        fbdev_probe: Some(bindings::drm_fbdev_shmem_driver_fbdev_probe),
> +        #[cfg(CONFIG_DRM_FBDEV_EMULATION =3D "n")]
> +        fbdev_probe: None,
>      };
>  }
> =20
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> new file mode 100644
> index 0000000000000..78970c69f4cda
> --- /dev/null
> +++ b/rust/kernel/drm/kms.rs
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! KMS driver abstractions for rust.
> +
> +use crate::{
> +    device,
> +    drm::{device::Device, drv::Driver},
> +    error::to_result,
> +    prelude::*,
> +    types::*,
> +};
> +use bindings;
> +use core::{marker::PhantomData, ops::Deref};
> +
> +/// The C vtable for a [`Device`].
> +///
> +/// This is created internally by DRM.
> +pub struct ModeConfigOps {
> +    pub(crate) kms_vtable: bindings::drm_mode_config_funcs,
> +    pub(crate) kms_helper_vtable: bindings::drm_mode_config_helper_funcs,
> +}
> +
> +/// A trait representing a type that can be used for setting up KMS, or =
a stub.
> +///
> +/// For drivers which don't have KMS support, the methods provided by th=
is trait may be stubs. It is
> +/// implemented internally by DRM.
> +pub trait KmsImpl: private::KmsImpl {}
> +
> +pub(crate) mod private {
> +    use super::*;
> +
> +    /// Private callback implemented internally by DRM for setting up KM=
S on a device, or stubbing
> +    /// the KMS setup for devices which don't have KMS support.
> +    #[allow(unreachable_pub)]
> +    pub trait KmsImpl {
> +        /// The parent driver for this KMS implementation
> +        type Driver: Driver;
> +
> +        /// The optional KMS callback operations for this driver.
> +        const MODE_CONFIG_OPS: Option<ModeConfigOps>;
> +
> +        /// The callback for setting up KMS on a device
> +        ///
> +        /// # Safety
> +        ///
> +        /// `drm` must be unregistered.
> +        unsafe fn setup_kms(_drm: &Device<Self::Driver>) -> Result<ModeC=
onfigInfo> {
> +            build_error::build_error("This should never be reachable")
> +        }
> +    }
> +}
> +
> +/// A [`Device`] with KMS initialized that has not been registered with =
userspace.
> +///
> +/// This type is identical to [`Device`], except that it is able to crea=
te new static KMS resources.
> +/// It represents a KMS device that is not yet visible to userspace, and=
 also contains miscellaneous
> +/// state required during the initialization process of a [`Device`].
> +pub struct UnregisteredKmsDevice<'a, T: Driver> {
> +    drm: &'a Device<T>,
> +}
> +
> +impl<'a, T: Driver> Deref for UnregisteredKmsDevice<'a, T> {
> +    type Target =3D Device<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.drm
> +    }
> +}
> +
> +impl<'a, T: Driver> UnregisteredKmsDevice<'a, T> {
> +    /// Construct a new [`UnregisteredKmsDevice`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller promises that `drm` is an unregistered [`Device`].
> +    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
> +        Self { drm }
> +    }
> +}

I guess it's more of a question here than a review, but what's the
advantage of that pattern over Into<UnregisteredKmsDevice> for Device<T> ?

> +/// A trait which must be implemented by drivers that wish to support KMS
> +///
> +/// It should be implemented for the same type that implements [`Driver`=
]. Drivers which don't
> +/// support KMS should use [`PhantomData<Self>`].
> +///
> +/// [`PhantomData<Self>`]: PhantomData
> +#[vtable]
> +pub trait KmsDriver: Driver {
> +    /// Return a [`ModeConfigInfo`] structure for this [`device::Device`=
].
> +    fn mode_config_info(
> +        dev: &device::Device,
> +        drm_data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
> +    ) -> Result<ModeConfigInfo>;
> +
> +    /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], etc. =
for this device
> +    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self>) -> Result
> +    where
> +        Self: Sized;
> +}
> +
> +impl<T: KmsDriver> private::KmsImpl for T {
> +    type Driver =3D Self;
> +
> +    const MODE_CONFIG_OPS: Option<ModeConfigOps> =3D Some(ModeConfigOps {
> +        kms_vtable: bindings::drm_mode_config_funcs {
> +            atomic_check: Some(bindings::drm_atomic_helper_check),
> +            fb_create: Some(bindings::drm_gem_fb_create),
> +            mode_valid: None,
> +            atomic_commit: Some(bindings::drm_atomic_helper_commit),
> +            get_format_info: None,
> +            atomic_state_free: None,
> +            atomic_state_alloc: None,
> +            atomic_state_clear: None,
> +        },
> +
> +        kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
> +            atomic_commit_setup: None,
> +            atomic_commit_tail: None,
> +        },
> +    });

I think here we venture into what we want from the bindings exactly. If
we want to model the API truthfully, then the
drm_mode_config_helper_funcs should be optional. We could also take a
stand and say that any modern driver should use the helpers anyway, and
thus it's mandatory.

Both are fine imo, but we should make it clearer what we want our
bindings to be: the same API, or a better one.

Maxime

--k2ya52hs7cxxbhks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9P/fAAKCRAnX84Zoj2+
dg6pAXwJMmxoWr+bxAoWObx/BTLVNeAC+SueIrFPVqzgtJH1d70iPkQdvgNhVd06
sV1S5EoBf3Uy0MbfOc9RnkO414SGBOspFM71jjbthpqzxrHCMbeKhyFeHjjr/IZY
yJSvJXqCYw==
=dWAD
-----END PGP SIGNATURE-----

--k2ya52hs7cxxbhks--
