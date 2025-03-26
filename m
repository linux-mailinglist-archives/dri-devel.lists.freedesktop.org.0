Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E42A7139E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2A210E685;
	Wed, 26 Mar 2025 09:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AdgGapWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289210E685
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:24:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E07D6A40E4E;
 Wed, 26 Mar 2025 09:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238FEC4CEE2;
 Wed, 26 Mar 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742981085;
 bh=6vR0hMY7/lFYGSwRX0YvgVjgLGDS7wGj/NIZGMcSIuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AdgGapWer9fV3UUUEqX7PduLQJF8X5SZrXmBcP8hUeJmEK6QxbJzy4Qcbhtjz6Ydy
 hmpYxwwjqhvAJ90XI9f3xicowrpaNEfmC1gLv7C3yycJ8blt2aq6Y520YPTfcUPgFR
 u+7iH/AR0W2rzypqkmNlBJcGvPj+tqyk8fSS6Sza3Dt64A4umEv/9s4tos98N19l94
 Z0VSupooF5s2e7gd4VHCmYsLkcddjzdB1N8u1ZZ/9/VIVMFqRyJxktJPQIrC52VDku
 eYwq7gIr7CDb6Fd3xn4FurTlo/flLZIK3YsXRPZ4di2VWrv7n4gSEjC5Z/agagVfOi
 EIOOsM47F9Grw==
Date: Wed, 26 Mar 2025 10:24:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
Message-ID: <20250326-loyal-scrupulous-leech-59d44a@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-6-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ncnfr2i3xiofvi2o"
Content-Disposition: inline
In-Reply-To: <20250325235522.3992-6-dakr@kernel.org>
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


--ncnfr2i3xiofvi2o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
MIME-Version: 1.0

Hi,

On Wed, Mar 26, 2025 at 12:54:32AM +0100, Danilo Krummrich wrote:
> Implement the DRM driver `Registration`.
>=20
> The `Registration` structure is responsible to register and unregister a
> DRM driver. It makes use of the `Devres` container in order to allow the
> `Registration` to be owned by devres, such that it is automatically
> dropped (and the DRM driver unregistered) once the parent device is
> unbound.

The code looks correct, but the wording is confusing to me.
drm_dev_unregister does indeed unregister the device, but it's not freed
until the last reference is dropped, so it's not really "dropped once
the parent device is unbound", the reference is, and it's not active
anymore.

> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/drm/driver.rs | 57 ++++++++++++++++++++++++++++++++++++++-
>  rust/kernel/drm/mod.rs    |  1 +
>  2 files changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index 625cab7839a3..8d2b397018d1 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -4,7 +4,15 @@
>  //!
>  //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/=
drm_drv.h)
> =20
> -use crate::{bindings, drm, str::CStr};
> +use crate::{
> +    bindings,
> +    devres::Devres,
> +    drm,
> +    error::{Error, Result},
> +    prelude::*,
> +    str::CStr,
> +    types::ARef,
> +};
>  use macros::vtable;
> =20
>  /// Driver use the GEM memory manager. This should be set for all modern=
 drivers.
> @@ -134,3 +142,50 @@ pub trait Driver {
>      /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
>      const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
>  }
> +
> +/// The registration type of a `drm::Device`.
> +///
> +/// Once the `Registration` structure is dropped, the device is unregist=
ered.
> +pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
> +
> +impl<T: Driver> Registration<T> {
> +    /// Creates a new [`Registration`] and registers it.
> +    pub fn new(drm: ARef<drm::Device<T>>, flags: usize) -> Result<Self> {
> +        // SAFETY: Safe by the invariants of `drm::Device`.
> +        let ret =3D unsafe { bindings::drm_dev_register(drm.as_raw(), fl=
ags) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Self(drm))
> +    }
> +
> +    /// Same as [`Registration::new`}, but transfers ownership of the [`=
Registration`] to
> +    /// [`Devres`].
> +    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: u=
size) -> Result {
> +        let reg =3D Registration::<T>::new(drm.clone(), flags)?;
> +
> +        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
> +    }
> +
> +    /// Returns a reference to the `Device` instance for this registrati=
on.
> +    pub fn device(&self) -> &drm::Device<T> {
> +        &self.0
> +    }
> +}
> +
> +// SAFETY: `Registration` doesn't offer any methods or access to fields =
when shared between
> +// threads, hence it's safe to share it.
> +unsafe impl<T: Driver> Sync for Registration<T> {}
> +
> +// SAFETY: Registration with and unregistration from the DRM subsystem c=
an happen from any thread.
> +unsafe impl<T: Driver> Send for Registration<T> {}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    /// Removes the registration from the kernel if it has completed suc=
cessfully before.
> +    fn drop(&mut self) {
> +        // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. The =
existence of this
> +        // `Registration` also guarantees the this `drm::Device` is actu=
ally registered.
> +        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
> +    }
> +}

drm_dev_unregister also have an hotplug-aware variant in
drm_dev_unplug(). However, most devices are hotpluggable, even if only
through sysfs. So drm_dev_unplug() is generally a better option. Should
we use it here, and / or should we provide multiple options still?

Another thing worth mentioning I think is that drm_dev_unplug() works by
setting a flag, and drivers are expected to check that their access to
device-bound resources (so registers mapping, clocks, regulators, etc.)
are still there through drm_dev_enter/drm_dev_exit. It's pretty fragile
overall, so I wonder if it's something we could abstract away in Rust.

Maxime

--ncnfr2i3xiofvi2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+PH2gAKCRDj7w1vZxhR
xTS3AP9e5D9UpCoO4d3TIBSIr+fpF4mj+jKIqxtiJxo6VMTwGQD/VbcaKtmzwsX9
w8nseKbzwambddtuJEdu+UXIzDhEhAg=
=YPjG
-----END PGP SIGNATURE-----

--ncnfr2i3xiofvi2o--
