Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB3A60F82
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85C010E9C0;
	Fri, 14 Mar 2025 11:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nyufdQC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4135810E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:02:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 23C1CA43A20;
 Fri, 14 Mar 2025 10:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9820C4CEE3;
 Fri, 14 Mar 2025 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741950128;
 bh=u2JViQhU95MeHN/gzjJ6lMHDW2ERVO4gD4ZIXCJ/ivE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nyufdQC7XCneV0HYkIxBGaH7UgtD+jR8suQ4jXHM0NRXspRBi2RdVDZt1nITEdCVa
 n8Z+34zYn9Fr0PINIwecHOvnySSkipW9ww8uiilCWQ5axL8B25+khJdRZO/Zm7ah4L
 UAiane3LUd+5VIJEVidmZ8Vgo1iVFkrM3y4fiwJFR7lNi7z3uHB8bNSbDIT/JshsdS
 M9K359NtPHu3Eto1WJ6o9Rb6mUDvYY5bwBxBfiSaAvkxcUcRF+i6IYqhYkYSTRK7Y9
 0C85x4LEUBm3bimm9W5O0UhjFd7F6yExkkFYYo2wRnwWLayygCgEGPqhg3Vh33B8ot
 NqOX9VPbIiJsg==
Date: Fri, 14 Mar 2025 12:02:05 +0100
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
Subject: Re: [RFC v3 04/33] rust: drm/kms: Add drm_connector bindings
Message-ID: <20250314-magnetic-provocative-bee-ad69ad@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2ehwp3252xuzkjsg"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-5-lyude@redhat.com>
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


--2ehwp3252xuzkjsg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 04/33] rust: drm/kms: Add drm_connector bindings
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:20PM -0500, Lyude Paul wrote:
> We start off by introducing wrappers for the first important type of mode
> object: a DRM display connector. This introduces Connector<T:
> DriverConnector> and ConnectorState<T: DriverConnectorState>. Both
> DriverConnector and DriverConnectorState must be implemented by KMS
> drivers, and a driver may have as many implementations of these two traits
> as it needs.

This part is a bit ambiguous to me, and it doesn't look like your patch
makes the wrong assumption, but connectors are not necessarily
implemented by KMS drivers directly. Bridges in particular will create
the connector outside of the KMS driver.

> This also introduces the general data pattern we'll be using
> for all of the core mode objects that can be used in atomic commits.
>=20
> It's important to note that both Connector<T> and ConnectorState<T> are
> intended to be "subclassable". To explain what this means, we need to look
> at how a DRM driver normally uses objects like DRM connectors.
>=20
> Typically, a driver in C will define its connectors like so:
>=20
> struct foo_connector {
>   struct drm_connector base;
>   int bar;
> }
>=20
> Note that we have a drm_connector struct embedded in foo_connector, but we
> have data which comes after it which is defined by the driver. This is
> important for a number of reasons: connectors can have their own mutexes
> and various other hardware-specific information that a driver may want
> access to at any time. The same goes for drm_connector_state, where drive=
rs
> will subclass this struct in the same way.

  ^ might

It's also pretty common to use the generic implementation directly and
not have a driver-specific state or connector structure.

> It's worth noting as well that it isn't uncommon for a driver to have
> multiple types of connectors, but we'll handle in a later commit.
>=20
> As a result, we've designed Connector<T> and ConnectorState<T> so that for
> both types: a DRM driver can add custom data into the T. As well, there's
> some basic limitations on how this data may be accessed:
>=20
> * Data within the `DriverConnector` struct is pinned in order to allow
>   mutexes and other structs which need pinning to be stored within it. As
>   well, it is impossible to get a direct mutable reference to the data
>   within DriverConnector - as there's no locks for doing so which would
>   cause a race condition.

I guess it's the part where my Rust-foo lacks a bit, but we do have a
way to mutate data in DriverConnector behind a Mutex, right?

> * Data within the `DriverConnectorState` struct is currently not pinned.
>   While it's not unheard of for a driver to put something like a mutex in
>   its atomic states, (VKMS actually does this in some spots) this quickly
>   complicates things especially with nonblocking modesets - and doesn't
>   really fit into the philosophy of an atomic state anyway. We may add
>   support for this in the future later if this does end up being needed,
>   but for now we hold back in order to make it much easier for drivers to
>   access private data within the atomic state.
>   As well, the functions we provide for converting to/from raw connector
>   state pointers are notably different from many other rust types in the
>   kernel. Instead of converting raw state pointers to raw ConnectorState<=
T>
>   pointers, we allow for direct immutable and mutable references. The
>   reason for this is that it makes accessing private driver data in the
>   state much easier, and unlike Connector<T> - we can actually uphold
>   all of the required data aliasing rules thanks to states only being
>   mutable by a single thread before they've been swapped in.
>   Note that currently, we don't provide a way to access said private data
>   for ConnectorState<T> since allowing direct access to a &mut
>   ConnectorState<T> could allow a caller to modify portions of
>   drm_connector_state which are meant to be invariant throughout the
>   lifetime of the connector state. We'll address this in the next few
>   commits when we introduce the global atomic state type.
>=20
> And finally - we introduce the following internal traits for the crate si=
de
> of things:
>=20
>   * AsRawConnector - any type which can spit out a *mut
>     bindings::drm_connector or be recovered from one
>   * AsRawConnectorState - any type which can return a reference to a
>     bindings::drm_connector_state
>   * private::AsRawConnectorState - just methods for AsRawConnectorState
>     that we don't want to be accessible to our users (since they could be
>     used to introduce UB)
>   * FromRawConnectorState - any type which can be recovered from a raw
>     pointer to a bindings::drm_connector_state
>=20
> The reason for having AsRawConnectorState and FromRawConnectorState as
> separate traits unlike AsRawConnector is due to the fact that we'll
> introduce objects later on which can be used as DRM connector states, but
> cannot be directly derived from a *mut bindings::drm_connector_state
> because they hold additional state or have additional side-effects.
>=20
> Likewise, we'll also have other objects which can be used as raw DRM
> connectors - hence AsRawConnector.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V3:
> * Add safety comment to implementation of ModeObject
> * Make AsRawConnector an unsafe trait, we need a guarantee that as_raw()
>   always returns a valid pointer.
> * Improve safety comments in atomic_duplicate_state_callback
> * Improve safety comments in Connector::new()
> * Switch to requiring a UnregisteredKmsDevice instead of a Device
>   This is in preparation for the static/dynamic connector split, which we
>   may as well prepare for since we don't have any use for dynamic
>   connectors yet.
> * Drop redundant Connector associated type in AsRawConnector trait
> * Improve safety comments in FromRawConnectorState
> * Introduce UnregisteredConnector type
> * Don't have AsRawConnector be a supertrait of StaticModeObject. We don't
>   want Unregistered mode object variants to be able to return a pointer to
>   the DRM device since that would break the UnregisteredKmsDevice pattern.
> * Introduce an actual enum for connector types
>   I realized we actually could do this fairly easy by using
>   #[non_exhaustive], which should future-proof us against new connector
>   types being added someday (if that ever happens).
> * Use addr_of_mut! for accessing fields we were using &mut for.
>   I think this is correct after going through some other rfl work?
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h  |   1 +
>  rust/kernel/drm/kms.rs           |   2 +
>  rust/kernel/drm/kms/connector.rs | 616 +++++++++++++++++++++++++++++++
>  3 files changed, 619 insertions(+)
>  create mode 100644 rust/kernel/drm/kms/connector.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index e1ed4f40c8e89..c41a3309223b2 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/clients/drm_client_setup.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index 885bd5266a2d7..f10e9f83ccb78 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -2,6 +2,8 @@
> =20
>  //! KMS driver abstractions for rust.
> =20
> +pub mod connector;
> +
>  use crate::{
>      device,
>      drm::{device::Device, drv::Driver},
> diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/conne=
ctor.rs
> new file mode 100644
> index 0000000000000..ed65c06ece627
> --- /dev/null
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM display connectors.
> +//!
> +//! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_co=
nnector.h)
> +
> +use super::{KmsDriver, ModeObject, RcModeObject};
> +use crate::{
> +    alloc::KBox,
> +    bindings,
> +    drm::{device::Device, kms::UnregisteredKmsDevice},
> +    error::to_result,
> +    init::Zeroable,
> +    prelude::*,
> +    private::Sealed,
> +    types::{NotThreadSafe, Opaque},
> +};
> +use core::{
> +    marker::*,
> +    mem,
> +    ops::*,
> +    ptr::{addr_of_mut, null_mut},
> +    stringify,
> +};
> +use macros::{paste, pin_data};
> +
> +/// A macro for generating our type ID enumerator.
> +macro_rules! declare_conn_types {
> +    ($( $oldname:ident as $newname:ident ),+) =3D> {
> +        /// An enumerator for all possible [`Connector`] type IDs.
> +        #[repr(i32)]
> +        #[non_exhaustive]
> +        #[derive(Copy, Clone, PartialEq, Eq)]
> +        pub enum Type {
> +            // Note: bindgen defaults the macro values to u32 and not i3=
2, but DRM takes them as an
> +            // i32 - so just do the conversion here
> +            $(
> +                #[doc =3D concat!("The connector type ID for a ", string=
ify!($newname), " connector.")]
> +                $newname =3D paste!(crate::bindings::[<DRM_MODE_CONNECTO=
R_ $oldname>]) as i32
> +            ),+,
> +
> +            // 9PinDIN is special because of the 9, making it an invalid=
 ident. Just define it here
> +            // manually since it's the only one
> +
> +            /// The connector type ID for a 9PinDIN connector.
> +            _9PinDin =3D crate::bindings::DRM_MODE_CONNECTOR_9PinDIN as =
i32
> +        }
> +    };
> +}
> +
> +declare_conn_types! {
> +    Unknown     as Unknown,
> +    Composite   as Composite,
> +    Component   as Component,
> +    DisplayPort as DisplayPort,
> +    VGA         as Vga,
> +    DVII        as DviI,
> +    DVID        as DviD,
> +    DVIA        as DviA,
> +    SVIDEO      as SVideo,
> +    LVDS        as Lvds,
> +    HDMIA       as HdmiA,
> +    HDMIB       as HdmiB,
> +    TV          as Tv,
> +    eDP         as Edp,
> +    VIRTUAL     as Virtual,
> +    DSI         as Dsi,
> +    DPI         as Dpi,
> +    WRITEBACK   as Writeback,
> +    SPI         as Spi,
> +    USB         as Usb
> +}
> +
> +/// The main trait for implementing the [`struct drm_connector`] API for=
 [`Connector`].
> +///
> +/// Any KMS driver should have at least one implementation of this type,=
 which allows them to create
> +/// [`Connector`] objects. Additionally, a driver may store driver-priva=
te data within the type that
> +/// implements [`DriverConnector`] - and it will be made available when =
using a fully typed
> +/// [`Connector`] object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed that=
 passed-in
> +///   [`struct drm_connector`] pointers are contained within a [`Connect=
or<Self>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed that=
 passed-in
> +///   [`struct drm_connector_state`] pointers are contained within a
> +///   [`ConnectorState<Self::State>`].
> +///
> +/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +#[vtable]
> +pub trait DriverConnector: Send + Sync + Sized {
> +    /// The generated C vtable for this [`DriverConnector`] implementati=
on
> +    #[unique]
> +    const OPS: &'static DriverConnectorOps =3D &DriverConnectorOps {
> +        funcs: bindings::drm_connector_funcs {
> +            dpms: None,
> +            atomic_get_property: None,
> +            atomic_set_property: None,
> +            early_unregister: None,
> +            late_register: None,
> +            set_property: None,
> +            reset: Some(connector_reset_callback::<Self::State>),
> +            atomic_print_state: None,
> +            atomic_destroy_state: Some(atomic_destroy_state_callback::<S=
elf::State>),
> +            destroy: Some(connector_destroy_callback::<Self>),
> +            force: None,
> +            detect: None,
> +            fill_modes: None,
> +            debugfs_init: None,
> +            oob_hotplug_event: None,
> +            atomic_duplicate_state: Some(atomic_duplicate_state_callback=
::<Self::State>),
> +        },
> +        helper_funcs: bindings::drm_connector_helper_funcs {
> +            mode_valid: None,
> +            atomic_check: None,
> +            get_modes: None,
> +            detect_ctx: None,
> +            enable_hpd: None,
> +            disable_hpd: None,
> +            best_encoder: None,
> +            atomic_commit: None,
> +            mode_valid_ctx: None,
> +            atomic_best_encoder: None,
> +            prepare_writeback_job: None,
> +            cleanup_writeback_job: None,
> +        },
> +    };

That's kind of the same comment than for mode_config: the helper_funcs
part is optional in KMS.

> +
> +    /// The type to pass to the `args` field of [`UnregisteredConnector:=
:new`].
> +    ///
> +    /// This type will be made available in in the `args` argument of [`=
Self::new`]. Drivers which
> +    /// don't need this can simply pass [`()`] here.
> +    type Args;
> +
> +    /// The parent [`KmsDriver`] implementation.
> +    type Driver: KmsDriver;
> +
> +    /// The [`DriverConnectorState`] implementation for this [`DriverCon=
nector`].
> +    ///
> +    /// See [`DriverConnectorState`] for more info.
> +    type State: DriverConnectorState;
> +
> +    /// The constructor for creating a [`Connector`] using this [`Driver=
Connector`] implementation.
> +    ///
> +    /// Drivers may use this to instantiate their [`DriverConnector`] ob=
ject.
> +    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinI=
nit<Self, Error>;
> +}
> +
> +/// The generated C vtable for a [`DriverConnector`].
> +///
> +/// This type is created internally by DRM.
> +pub struct DriverConnectorOps {
> +    funcs: bindings::drm_connector_funcs,
> +    helper_funcs: bindings::drm_connector_helper_funcs,
> +}

So, yeah, if we plan on making a truthful equivalent to KMS, this should
probably be two different structures, or at least with helper_funcs
optional there. Or maybe a FuncsOnly / FuncsWithHelpers enum? idk

> +/// The main interface for a [`struct drm_connector`].
> +///
> +/// This type is the main interface for dealing with DRM connectors. In =
addition, it also allows
> +/// immutable access to whatever private data is contained within an imp=
lementor's
> +/// [`DriverConnector`] type.
> +///
> +/// # Invariants
> +///
> +/// - The DRM C API and our interface guarantees that only the user has =
mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore=
, `connector` follows rust's
> +///   data aliasing rules and does not need to be behind an [`Opaque`] t=
ype.
> +/// - `connector` and `inner` are initialized for as long as this object=
 is made available to users.
> +/// - The data layout of this structure begins with [`struct drm_connect=
or`].
> +/// - The atomic state for this type can always be assumed to be of type
> +///   [`ConnectorState<T::State>`].
> +///
> +/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
> +/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic=
_helper.h
> +#[repr(C)]
> +#[pin_data]
> +pub struct Connector<T: DriverConnector> {
> +    connector: Opaque<bindings::drm_connector>,
> +    #[pin]
> +    inner: T,
> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +impl<T: DriverConnector> Sealed for Connector<T> {}
> +
> +// SAFETY: DRM expects this struct to be zero-initialized
> +unsafe impl Zeroable for bindings::drm_connector {}
> +
> +impl<T: DriverConnector> Deref for Connector<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +/// A trait implemented by any type that acts as a [`struct drm_connecto=
r`] interface.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// # Safety
> +///
> +/// [`as_raw()`] must always return a pointer to a valid initialized [`s=
truct drm_connector`].
> +///
> +/// [`as_raw()`]: AsRawConnector::as_raw()
> +/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
> +pub unsafe trait AsRawConnector {
> +    /// Return the raw [`struct drm_connector`] for this DRM connector.
> +    ///
> +    /// Drivers should never use this directly
> +    ///
> +    /// [`struct drm_Connector`]: srctree/include/drm/drm_connector.h
> +    fn as_raw(&self) -> *mut bindings::drm_connector;
> +
> +    /// Convert a raw `bindings::drm_connector` pointer into an object o=
f this type.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers promise that `ptr` points to a valid instance of this ty=
pe.
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Sel=
f;
> +}
> +
> +/// A supertrait of [`AsRawConnector`] for [`struct drm_connector`] inte=
rfaces that can perform
> +/// modesets.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// # Safety
> +///
> +/// Any object implementing this trait must only be made directly availa=
ble to the user after
> +/// [`create_objects`] has completed.
> +///
> +/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
> +/// [`create_objects`]: KmsDriver::create_objects
> +pub unsafe trait ModesettableConnector: AsRawConnector {
> +    /// The type that should be returned for a plane state acquired usin=
g this plane interface
> +    type State: FromRawConnectorState;
> +}
> +
> +// SAFETY: Our connector interfaces are guaranteed to be thread-safe
> +unsafe impl<T: DriverConnector> Send for Connector<T> {}
> +
> +// SAFETY: Our connector interfaces are guaranteed to be thread-safe
> +unsafe impl<T: DriverConnector> Sync for Connector<T> {}
> +
> +// SAFETY: We don't expose Connector<T> to users before `base` is initia=
lized in ::new(), so
> +// `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode=
_object.
> +unsafe impl<T: DriverConnector> ModeObject for Connector<T> {
> +    type Driver =3D T::Driver;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        // SAFETY: The parent device for a DRM connector will never outl=
ive the connector, and this
> +        // pointer is invariant through the lifetime of the connector
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose DRM connectors to users before `base`=
 is initialized
> +        unsafe { addr_of_mut!((*self.as_raw()).base) }
> +    }
> +}
> +
> +// SAFETY: DRM connectors are refcounted mode objects
> +unsafe impl<T: DriverConnector> RcModeObject for Connector<T> {}
> +
> +// SAFETY:
> +// * Via our type variants our data layout starts with `drm_connector`
> +// * Since we don't expose `Connector` to users before it has been initi=
alized, this and our data
> +//   layout ensure that `as_raw()` always returns a valid pointer to a `=
drm_connector`.
> +unsafe impl<T: DriverConnector> AsRawConnector for Connector<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_connector {
> +        self.connector.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Sel=
f {
> +        // SAFETY: Our data layout starts with `bindings::drm_connector`
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +// SAFETY: We only expose this object to users directly after KmsDriver:=
:create_objects has been
> +// called.
> +unsafe impl<T: DriverConnector> ModesettableConnector for Connector<T> {
> +    type State =3D ConnectorState<T::State>;
> +}
> +
> +/// A [`Connector`] that has not yet been registered with userspace.
> +///
> +/// KMS registration is single-threaded, so this object is not thread-sa=
fe.
> +///
> +/// # Invariants
> +///
> +/// - This object can only exist before its respective KMS device has be=
en registered.
> +/// - Otherwise, it inherits all invariants of [`Connector`] and has an =
identical data layout.
> +pub struct UnregisteredConnector<T: DriverConnector>(Connector<T>, NotTh=
readSafe);
> +
> +// SAFETY: We share the invariants of `Connector`
> +unsafe impl<T: DriverConnector> AsRawConnector for UnregisteredConnector=
<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_connector {
> +        self.0.as_raw()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Sel=
f {
> +        // SAFETY: This is another from_raw() call, so this function sha=
res the same safety contract
> +        let connector =3D unsafe { Connector::<T>::from_raw(ptr) };
> +
> +        // SAFETY: Our data layout is identical via our type invariants.
> +        unsafe { mem::transmute(connector) }
> +    }
> +}
> +
> +impl<T: DriverConnector> Deref for UnregisteredConnector<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0.inner
> +    }
> +}
> +
> +impl<T: DriverConnector> UnregisteredConnector<T> {
> +    /// Construct a new [`UnregisteredConnector`].
> +    ///
> +    /// A driver may use this to create new [`UnregisteredConnector`] ob=
jects.
> +    ///
> +    /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::crea=
te_objects
> +    pub fn new<'a>(
> +        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
> +        type_: Type,
> +        args: T::Args,
> +    ) -> Result<&'a Self> {
> +        let new: Pin<KBox<Connector<T>>> =3D KBox::try_pin_init(
> +            try_pin_init!(Connector::<T> {
> +                connector: Opaque::new(bindings::drm_connector {
> +                    helper_private: &T::OPS.helper_funcs,
> +                    ..Default::default()
> +                }),
> +                inner <- T::new(dev, args),
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY:
> +        // - `dev` will hold a reference to the new connector, and thus =
outlives us.
> +        // - We just allocated `new` above
> +        // - `new` starts with `drm_connector` via its type invariants.
> +        to_result(unsafe {
> +            bindings::drm_connector_init(dev.as_raw(), new.as_raw(), &T:=
:OPS.funcs, type_ as i32)
> +        })?;
> +
> +        // SAFETY: We don't move anything
> +        let this =3D unsafe { Pin::into_inner_unchecked(new) };
> +
> +        // We'll re-assemble the box in connector_destroy_callback()
> +        let this =3D KBox::into_raw(this);
> +
> +        // UnregisteredConnector has an equivalent data layout
> +        let this: *mut Self =3D this.cast();
> +
> +        // SAFETY: We just allocated the connector above, so this pointe=
r must be valid
> +        Ok(unsafe { &*this })
> +    }
> +}
> +
> +unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
> +    connector: *mut bindings::drm_connector,
> +) {
> +    // SAFETY: DRM guarantees that `connector` points to a valid initial=
ized `drm_connector`.
> +    unsafe {
> +        bindings::drm_connector_unregister(connector);
> +        bindings::drm_connector_cleanup(connector);
> +    };
> +
> +    // SAFETY:
> +    // - We originally created the connector in a `Box`
> +    // - We are guaranteed to hold the last remaining reference to this =
connector
> +    // - This cast is safe via `DriverConnector`s type invariants.
> +    drop(unsafe { KBox::from_raw(connector as *mut Connector<T>) });
> +}
> +
> +// SAFETY: DRM expects this struct to be zero-initialized
> +unsafe impl Zeroable for bindings::drm_connector_state {}
> +
> +/// A trait implemented by any type which can produce a reference to a
> +/// [`struct drm_connector_state`].
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +pub trait AsRawConnectorState: private::AsRawConnectorState {
> +    /// The type that represents this connector state's DRM connector.
> +    type Connector: AsRawConnector;
> +}
> +
> +pub(super) mod private {
> +    use super::*;
> +
> +    /// Trait for retrieving references to the base connector state cont=
ained within any connector
> +    /// state compatible type
> +    #[allow(unreachable_pub)]
> +    pub trait AsRawConnectorState {
> +        /// Return an immutable reference to the raw connector state.
> +        fn as_raw(&self) -> &bindings::drm_connector_state;
> +
> +        /// Get a mutable reference to the raw [`struct drm_connector_st=
ate`] contained within this
> +        /// type.
> +        ///
> +        ///
> +        /// # Safety
> +        ///
> +        /// The caller promises this mutable reference will not be used =
to modify any contents of
> +        /// [`struct drm_connector_state`] which DRM would consider to b=
e static - like the
> +        /// backpointer to the DRM connector that owns this state. This =
also means the mutable
> +        /// reference should never be exposed outside of this crate.
> +        ///
> +        /// [`struct drm_connector_state`]: srctree/include/drm/drm_conn=
ector.h
> +        unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_=
state;
> +    }
> +}
> +
> +pub(super) use private::AsRawConnectorState as AsRawConnectorStatePrivat=
e;
> +
> +/// A trait implemented for any type which can be constructed directly f=
rom a
> +/// [`struct drm_connector_state`] pointer.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +pub trait FromRawConnectorState: AsRawConnectorState {
> +    /// Get an immutable reference to this type from the given raw [`str=
uct drm_connector_state`]
> +    /// pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller guarantees `ptr` is contained within a valid instan=
ce of `Self`.
> +    /// - The caller guarantees that `ptr` cannot not be modified for th=
e lifetime of `'a`.
> +    ///
> +    /// [`struct drm_connector_state`]: srctree/include/drm/drm_connecto=
r.h
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) ->=
 &'a Self;
> +
> +    /// Get a mutable reference to this type from the given raw [`struct=
 drm_connector_state`]
> +    /// pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller guarantees that `ptr` is contained within a valid i=
nstance of `Self`.
> +    /// - The caller guarantees that `ptr` cannot have any other referen=
ces taken out for the
> +    ///   lifetime of `'a`.
> +    ///
> +    /// [`struct drm_connector_state`]: srctree/include/drm/drm_connecto=
r.h
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) =
-> &'a mut Self;
> +}
> +
> +/// The main interface for a [`struct drm_connector_state`].
> +///
> +/// This type is the main interface for dealing with the atomic state of=
 DRM connectors. In
> +/// addition, it allows access to whatever private data is contained wit=
hin an implementor's
> +/// [`DriverConnectorState`] type.
> +///
> +/// # Invariants
> +///
> +/// - The DRM C API and our interface guarantees that only the user has =
mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore=
, `connector` follows rust's
> +///   data aliasing rules and does not need to be behind an [`Opaque`] t=
ype.
> +/// - `state` and `inner` initialized for as long as this object is expo=
sed to users.
> +/// - The data layout of this structure begins with [`struct drm_connect=
or_state`].
> +/// - The connector for this atomic state can always be assumed to be of=
 type
> +///   [`Connector<T::Connector>`].
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic=
_helper.h
> +#[derive(Default)]
> +#[repr(C)]
> +pub struct ConnectorState<T: DriverConnectorState> {
> +    state: bindings::drm_connector_state,
> +    inner: T,
> +}
> +
> +/// The main trait for implementing the [`struct drm_connector_state`] A=
PI for a [`Connector`].
> +///
> +/// A driver may store driver-private data within the implementor's type=
, which will be available
> +/// when using a full typed [`ConnectorState`] object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed that=
 passed-in
> +///   [`struct drm_connector`] pointers are contained within a [`Connect=
or<Self::Connector>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed that=
 passed-in
> +///   [`struct drm_connector_state`] pointers are contained within a [`C=
onnectorState<Self>`].
> +///
> +/// [`struct drm_connector`]: srctree/include/drm_connector.h
> +/// [`struct drm_connector_state`]: srctree/include/drm_connector.h
> +pub trait DriverConnectorState: Clone + Default + Sized {
> +    /// The parent [`DriverConnector`].
> +    type Connector: DriverConnector;
> +}
> +
> +impl<T: DriverConnectorState> Sealed for ConnectorState<T> {}
> +
> +impl<T: DriverConnectorState> AsRawConnectorState for ConnectorState<T> {
> +    type Connector =3D Connector<T::Connector>;
> +}
> +
> +impl<T: DriverConnectorState> private::AsRawConnectorState for Connector=
State<T> {
> +    fn as_raw(&self) -> &bindings::drm_connector_state {
> +        &self.state
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_stat=
e {
> +        &mut self.state
> +    }
> +}
> +
> +impl<T: DriverConnectorState> FromRawConnectorState for ConnectorState<T=
> {
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) ->=
 &'a Self {
> +        // Our data layout starts with `bindings::drm_connector_state`.
> +        let ptr: *const Self =3D ptr.cast();
> +
> +        // SAFETY:
> +        // - Our safety contract requires that `ptr` be contained within=
 `Self`.
> +        // - Our safety contract requires the caller ensure that it is s=
afe for us to take an
> +        //   immutable reference.
> +        unsafe { &*ptr }
> +    }
> +
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) =
-> &'a mut Self {
> +        // Our data layout starts with `bindings::drm_connector_state`.
> +        let ptr: *mut Self =3D ptr.cast();
> +
> +        // SAFETY:
> +        // - Our safety contract requires that `ptr` be contained within=
 `Self`.
> +        // - Our safety contract requires the caller ensure it is safe f=
or us to take a mutable
> +        //   reference.
> +        unsafe { &mut *ptr }
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorS=
tate>(
> +    connector: *mut bindings::drm_connector,
> +) -> *mut bindings::drm_connector_state {
> +    // SAFETY: DRM guarantees that `connector` points to a valid initial=
ized `drm_connector`.
> +    let state =3D unsafe { (*connector).state };
> +    if state.is_null() {
> +        return null_mut();
> +    }
> +
> +    // SAFETY:
> +    // - We just verified that `state` is non-null
> +    // - This cast is guaranteed to be safe via our type invariants.
> +    let state =3D unsafe { ConnectorState::<T>::from_raw(state) };
> +
> +    let new =3D Box::try_init(
> +        try_init!(ConnectorState::<T> {
> +            state: bindings::drm_connector_state {
> +                ..Default::default()
> +            },
> +            inner: state.inner.clone()
> +        }),
> +        GFP_KERNEL,
> +    );
> +
> +    if let Ok(mut new) =3D new {
> +        // SAFETY:
> +        // - `new` provides a valid pointer to a newly allocated `drm_pl=
ane_state` via type
> +        //   invariants
> +        // - This initializes `new` via memcpy()
> +        unsafe {
> +            bindings::__drm_atomic_helper_connector_duplicate_state(conn=
ector, new.as_raw_mut())
> +        };
> +
> +        KBox::into_raw(new).cast()
> +    } else {
> +        null_mut()
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_destroy_state_callback<T: DriverConnectorSta=
te>(
> +    _connector: *mut bindings::drm_connector,
> +    connector_state: *mut bindings::drm_connector_state,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance of=
 `drm_connector_state`
> +    unsafe { bindings::__drm_atomic_helper_connector_destroy_state(conne=
ctor_state) };
> +
> +    // SAFETY:
> +    // - DRM guarantees we are the only one with access to this `drm_con=
nector_state`
> +    // - This cast is safe via our type invariants.
> +    drop(unsafe { KBox::from_raw(connector_state.cast::<ConnectorState<T=
>>()) });
> +}
> +
> +unsafe extern "C" fn connector_reset_callback<T: DriverConnectorState>(
> +    connector: *mut bindings::drm_connector,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance of=
 `drm_connector_state`
> +    let state =3D unsafe { (*connector).state };
> +    if !state.is_null() {
> +        // SAFETY:
> +        // - We're guaranteed `connector` is `Connector<T>` via type inv=
ariants
> +        // - We're guaranteed `state` is `ConnectorState<T>` via type in=
variants.
> +        unsafe { atomic_destroy_state_callback::<T>(connector, state) }
> +
> +        // SAFETY: No special requirements here, DRM expects this to be =
NULL
> +        unsafe { (*connector).state =3D null_mut() };
> +    }
> +
> +    // Unfortunately, this is the best we can do at the moment as this F=
FI callback was mistakenly
> +    // presumed to be infallible :(
> +    let new =3D KBox::new(ConnectorState::<T>::default(), GFP_KERNEL).ex=
pect("Blame the API, sorry!");
> +
> +    // DRM takes ownership of the state from here, resets it, and then a=
ssigns it to the connector
> +    // SAFETY:
> +    // - DRM guarantees that `connector` points to a valid instance of `=
drm_connector`.
> +    // - The cast to `drm_connector_state` is safe via `ConnectorState`s=
 type invariants.
> +    unsafe { bindings::__drm_atomic_helper_connector_reset(connector, Bo=
x::into_raw(new).cast()) };
> +}

Reset mostly means "allocate the initial state". So, while what you did
is definitely the most common use-case, we also have drivers that will
allocate and initialize a new state themselves based on the hardware
state at boot.

Maxime

--2ehwp3252xuzkjsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QMrQAKCRAnX84Zoj2+
dqswAYCUs0lUPY99mTV1Tx/rgLvkejcuMPz9hRCrFGwzTBr33R7glJlKMP7jj2a5
ShyRWzABf1aQKJDBB0GgOeFHj4fwwk9PdReCH1gxN7vR085v4J7GHmTnoVHHb2BE
+NiKTO0iDQ==
=QqBf
-----END PGP SIGNATURE-----

--2ehwp3252xuzkjsg--
