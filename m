Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09996A610BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA2110E311;
	Fri, 14 Mar 2025 12:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kORz1N5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7C10E309
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:18:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E380A4699D;
 Fri, 14 Mar 2025 12:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0B0C4CEE3;
 Fri, 14 Mar 2025 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741954690;
 bh=cNgAtdlNV2722WBqFvdC3FTuHgN0BJtDRIB40TJDbb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kORz1N5jDowb2u9Orwmz6R6i9HRovlXgM5/5u0tETiZO2YtmSvkd1MNhSCklw/+Zk
 ARLLvxLcjWaPKgiPpQZd1HYTgQNtAVKO/y8jgJz0BoIvjK+hwixkVm61BOgARbghWZ
 yqUkSFxzGK1MmHhmcvqCCWb+TXN8g17A90GfCH+IZtE+QDYSZtfAMyM763ZCkhdIwu
 kE3GxCfV0aHL4lK7O93IOND9ICWHxwX68uppO4fn4c1lOzWMCGpOh9+nceWJdv4v4T
 /z2iPf6S7ymL8u6fhv64qA9B6KrFvbagCtnqHZcfrBXcnXGj554rUNdKqv7Xp6Abgb
 IsbBrW5JCxw1A==
Date: Fri, 14 Mar 2025 13:18:07 +0100
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
 Asahi Lina <lina@asahilina.net>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 18/33] rust: drm/kms: Add drm_atomic_state bindings
Message-ID: <20250314-bizarre-pearl-herring-dfeb01@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-19-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nnpxz5ci3sflqgc6"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-19-lyude@redhat.com>
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


--nnpxz5ci3sflqgc6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 18/33] rust: drm/kms: Add drm_atomic_state bindings
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:34PM -0500, Lyude Paul wrote:
> Next up is introducing bindings that we can use to represent the global D=
RM
> atomic state, along with all of the various object states contained withi=
n.
> We do this by introducing a few new concepts: borrowed states, atomic sta=
te
> mutators, and atomic state composers.
>=20
> To understand these, we need to quickly touch upon the general life of an
> atomic commit. Assuming a driver does its own internal atomic commit, the
> procedure looks something like this:
>=20
> * Allocate a new atomic state
> * Duplicate the atomic state of each mode object we want to mutate, and a=
dd
>   the duplicated state to the new atomic state
> * Check (possibly more then once) the atomic state, possibly modifying it
>   along the way
> * Commit the atomic state to software (we'll call this commit time). At
>   this point no new objects can be added to the state
> * Finish committing the atomic state to hardware asynchronously
>=20
> With this in mind, we introduce AtomicStateMutator and AtomicStateComposer
> (along with leaky variants intended for uses in FFI calls). An
> AtomicStateMutator allows mutating an atomic state but does not allow for
> adding new objects to the state. Subsequently, an AtomicStateComposer
> allows for both mutating an atomic state and adding new mode objects. We
> control when we expose each of these types in order to implement the
> limitations required by the aforementioned example.
>=20
> Note as well that AtomicStateComposer is intended to eventually be usable
> directly by drivers. In this scenario, a driver will be able to create an
> AtomicStateComposer (the equivalent of allocating an atomic state in C) a=
nd
> then commit it by passing it to our DRM bindings by-value, insuring that
> once the commit process begins it is impossible to keep using the
> AtomicStateComposer.
>=20
> The next part of this is allowing users to modify the atomic states of all
> of the objects contained within an atomic state. Since it's an extremely
> common usecase for objects to mutate the atomic state of multiple objects
> at once in an unpredictable order, we need a mechanism that will allow us
> to hand out &mut references to each state while ensuring at runtime that =
we
> do not break rust's data aliasing rules (which disallow us from ever havi=
ng
> more then one &mut reference to the same piece of data).
>=20
> We do this by introducing the concept of a "borrowed" state. This is a ve=
ry
> similar concept to RefCell, where it is ensured during runtime that when a
> &mut reference is taken out another one cannot be created until the
> corresponding Ref object has been dropped. Our equivalent Ref types are
> ConnectorState, BorrowedCrtcState, and BorrowedPlaneStateMutator.
>=20
> Each one of these types can be used in the same manner as a Ref - no
> additional borrows for an atomic state may be taken until the existing one
> has been dropped. Subsequently, all of these types implement their
> respective AsRaw* and FromRaw* counter-parts - and allow dereferencing to
> each driver-private data structure for fully qualified borrows (like
> CrtcState<'a, CrtcStateMutator<T>>. This allows a pretty clean way of
> mutating multiple states at once without ever breaking rust's mutability
> rules.
>=20
> We'll use all of these types over the next few commits to begin introduci=
ng
> various atomic modeset callbacks to each mode object type.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V3:
> * Drop the TODO about printing a kernel error in ConnectorStateMutator
>   I thought this was something we'd want early on in designing this, but
>   since then I'm pretty sure we just want to return None - there are valid
>   cases where we'd get None while doing connector iteration through an
>   atomic state
> * Improve safety comments in ConnectorStateMutator::new()
> * Rename Borrowed*State to *StateMutator
>   I think this makes things a lot clearer, as well - cleanup the
>   documentation regarding this.
> * Drop plane state iterator for now. It's not that we don't need this, it=
's
>   just that I haven't actually finished writing these up for all types so
>   I'd rather focus on that later now that we've demonstrated it's a thing
>   that is possible. And it at least shouldn't be needed for getting these
>   bindings/rvkms upstream.
> * Drop num_plane() for the time being
>   Without the plane state iterator in this patch series there's no current
>   usecase for this, so just drop the function for the time being and we'll
>   reintroduce it when it's ready.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/helpers/drm/atomic.c        |  32 +++
>  rust/helpers/drm/drm.c           |   3 +
>  rust/kernel/drm/kms.rs           |   1 +
>  rust/kernel/drm/kms/atomic.rs    | 359 +++++++++++++++++++++++++++++++
>  rust/kernel/drm/kms/connector.rs | 104 ++++++++-
>  rust/kernel/drm/kms/crtc.rs      | 103 ++++++++-
>  rust/kernel/drm/kms/plane.rs     | 105 ++++++++-
>  7 files changed, 700 insertions(+), 7 deletions(-)
>  create mode 100644 rust/helpers/drm/atomic.c
>  create mode 100644 rust/kernel/drm/kms/atomic.rs
>=20
> diff --git a/rust/helpers/drm/atomic.c b/rust/helpers/drm/atomic.c
> new file mode 100644
> index 0000000000000..fff70053f6943
> --- /dev/null
> +++ b/rust/helpers/drm/atomic.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_atomic.h>
> +
> +void rust_helper_drm_atomic_state_get(struct drm_atomic_state *state)
> +{
> +	drm_atomic_state_get(state);
> +}
> +
> +void rust_helper_drm_atomic_state_put(struct drm_atomic_state *state)
> +{
> +	drm_atomic_state_put(state);
> +}
> +
> +// Macros for generating one repetitive atomic state accessors (like drm=
_atomic_get_new_plane_state)
> +#define STATE_FUNC(type, tense)                                         =
                            \
> +	struct drm_ ## type ## _state *rust_helper_drm_atomic_get_ ## tense ## =
_ ## type ## _state( \
> +		const struct drm_atomic_state *state,                                 =
              \
> +		struct drm_ ## type *type                                             =
              \
> +	) {                                                                    =
                     \
> +		return drm_atomic_get_## tense ## _ ## type ## _state(state, type);   =
              \
> +	}
> +#define STATE_FUNCS(type) \
> +	STATE_FUNC(type, new); \
> +	STATE_FUNC(type, old);
> +
> +STATE_FUNCS(plane);
> +STATE_FUNCS(crtc);
> +STATE_FUNCS(connector);
> +
> +#undef STATE_FUNCS
> +#undef STATE_FUNC
> diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
> index 028b8ab429572..365f6807774d4 100644
> --- a/rust/helpers/drm/drm.c
> +++ b/rust/helpers/drm/drm.c
> @@ -1,5 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +#ifdef CONFIG_DRM_KMS_HELPER
> +#include "atomic.c"
> +#endif
>  #include "gem.c"
>  #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
>  #include "gem_shmem_helper.c"
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index 1d6ca9c92659a..978bb6712ffbe 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -2,6 +2,7 @@
> =20
>  //! KMS driver abstractions for rust.
> =20
> +pub mod atomic;
>  pub mod connector;
>  pub mod crtc;
>  pub mod encoder;
> diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
> new file mode 100644
> index 0000000000000..3d5c70dbc4274
> --- /dev/null
> +++ b/rust/kernel/drm/kms/atomic.rs
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! [`struct drm_atomic_state`] related bindings for rust.
> +//!
> +//! [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +use super::{connector::*, crtc::*, plane::*, KmsDriver, ModeObject};
> +use crate::{
> +    bindings,
> +    drm::device::Device,
> +    error::{from_err_ptr, to_result},
> +    prelude::*,
> +    types::*,
> +};
> +use core::{cell::Cell, marker::*, mem::ManuallyDrop, ops::*, ptr::NonNul=
l};
> +
> +/// The main wrapper around [`struct drm_atomic_state`].
> +///
> +/// This type is usually embedded within another interface such as an [`=
AtomicStateMutator`].
> +///
> +/// # Invariants
> +///
> +/// - The data layout of this type is identical to [`struct drm_atomic_s=
tate`].
> +/// - `state` is initialized for as long as this type is exposed to user=
s.
> +///
> +/// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +#[repr(transparent)]
> +pub struct AtomicState<T: KmsDriver> {
> +    pub(super) state: Opaque<bindings::drm_atomic_state>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: KmsDriver> AtomicState<T> {
> +    /// Reconstruct an immutable reference to an atomic state from the g=
iven pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid initialized instance of [`struct drm=
_atomic_state`].
> +    ///
> +    /// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
> +    #[allow(dead_code)]
> +    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_atomic_s=
tate) -> &'a Self {
> +        // SAFETY: Our data layout is identical
> +        // INVARIANT: Our safety contract upholds the guarantee that `st=
ate` is initialized for as
> +        // long as this type is exposed to users.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
> +        self.state.get()
> +    }
> +
> +    /// Return the [`Device`] associated with this [`AtomicState`].
> +    pub fn drm_dev(&self) -> &Device<T> {
> +        // SAFETY:
> +        // - `state` is initialized via our type invariants.
> +        // - `dev` is invariant throughout the lifetime of `AtomicState`
> +        unsafe { Device::borrow((*self.state.get()).dev) }
> +    }
> +
> +    /// Return the old atomic state for `crtc`, if it is present within =
this [`AtomicState`].
> +    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> Option<&C::State>
> +    where
> +        C: ModesettableCrtc + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: This function either returns NULL or a valid pointer =
to a `drm_crtc_state`
> +        unsafe {
> +            bindings::drm_atomic_get_old_crtc_state(self.as_raw(), crtc.=
as_raw())
> +                .as_ref()
> +                .map(|p| C::State::from_raw(p))
> +        }
> +    }
> +
> +    /// Return the old atomic state for `plane`, if it is present within=
 this [`AtomicState`].
> +    pub fn get_old_plane_state<P>(&self, plane: &P) -> Option<&P::State>
> +    where
> +        P: ModesettablePlane + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: This function either returns NULL or a valid pointer =
to a `drm_plane_state`
> +        unsafe {
> +            bindings::drm_atomic_get_old_plane_state(self.as_raw(), plan=
e.as_raw())
> +                .as_ref()
> +                .map(|p| P::State::from_raw(p))
> +        }
> +    }
> +
> +    /// Return the old atomic state for `connector` if it is present wit=
hin this [`AtomicState`].
> +    pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C=
::State>
> +    where
> +        C: ModesettableConnector + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: This function either returns NULL or a valid pointer =
to a `drm_connector_state`.
> +        unsafe {
> +            bindings::drm_atomic_get_old_connector_state(self.as_raw(), =
connector.as_raw())
> +                .as_ref()
> +                .map(|p| C::State::from_raw(p))
> +        }
> +    }
> +}
> +
> +// SAFETY: DRM atomic state objects are always reference counted and the=
 get/put functions satisfy
> +// the requirements.
> +unsafe impl<T: KmsDriver> AlwaysRefCounted for AtomicState<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: `state` is initialized for as long as this type is ex=
posed to users
> +        unsafe { bindings::drm_atomic_state_get(self.state.get()) }
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: `obj` contains a valid non-null pointer to an initial=
ized `Self`.
> +        unsafe { bindings::drm_atomic_state_put(obj.as_ptr().cast()) }
> +    }
> +}
> +
> +/// A smart-pointer for modifying the contents of an atomic state.
> +///
> +/// As it's not unreasonable for a modesetting driver to want to have re=
ferences to the state of
> +/// multiple modesetting objects at once, along with mutating multiple s=
tates for unique modesetting
> +/// objects at once, this type provides a mechanism for safely doing bot=
h of these things.
> +///
> +/// To honor Rust's aliasing rules regarding mutable references, this st=
ructure ensures only one
> +/// mutable reference to a mode object's atomic state may exist at a tim=
e - and refuses to provide
> +/// another if one has already been taken out using runtime checks.
> +pub struct AtomicStateMutator<T: KmsDriver> {
> +    /// The state being mutated. Note that the use of `ManuallyDrop` her=
e is because mutators are
> +    /// only constructed in FFI callbacks and thus borrow their referenc=
es to the atomic state from
> +    /// DRM. Composers, which make use of mutators internally, can poten=
tially be owned by rust code
> +    /// if a driver is performing an atomic commit internally - and thus=
 will call the drop
> +    /// implementation here.
> +    state: ManuallyDrop<ARef<AtomicState<T>>>,
> +
> +    /// Bitmask of borrowed CRTC state objects
> +    pub(super) borrowed_crtcs: Cell<u32>,
> +    /// Bitmask of borrowed plane state objects
> +    pub(super) borrowed_planes: Cell<u32>,
> +    /// Bitmask of borrowed connector state objects
> +    pub(super) borrowed_connectors: Cell<u32>,
> +}
> +
> +impl<T: KmsDriver> AtomicStateMutator<T> {
> +    /// Construct a new [`AtomicStateMutator`]
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid `drm_atomic_state`
> +    #[allow(dead_code)]
> +    pub(super) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -=
> Self {
> +        Self {
> +            // SAFETY: The data layout of `AtomicState<T>` is identical =
to drm_atomic_state
> +            // We use `ManuallyDrop` because `AtomicStateMutator` is onl=
y ever provided to users in
> +            // the context of KMS callbacks. As such, skipping ref inc/d=
ec for the atomic state is
> +            // convienent for our bindings.
> +            state: ManuallyDrop::new(unsafe { ARef::from_raw(ptr.cast())=
 }),
> +            borrowed_planes: Cell::default(),
> +            borrowed_crtcs: Cell::default(),
> +            borrowed_connectors: Cell::default(),
> +        }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
> +        self.state.as_raw()
> +    }
> +
> +    /// Return the [`Device`] for this [`AtomicStateMutator`].
> +    pub fn drm_dev(&self) -> &Device<T> {
> +        self.state.drm_dev()
> +    }
> +
> +    /// Retrieve the last committed atomic state for `crtc` if `crtc` ha=
s already been added to the
> +    /// atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_crtc_state<C>(&self, crtc: &C) -> Option<&C::State>
> +    where
> +        C: ModesettableCrtc + ModeObject<Driver =3D T>,
> +    {
> +        self.state.get_old_crtc_state(crtc)
> +    }
> +
> +    /// Retrieve the last committed atomic state for `connector` if `con=
nector` has already been
> +    /// added to the atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C=
::State>
> +    where
> +        C: ModesettableConnector + ModeObject<Driver =3D T>,
> +    {
> +        self.state.get_old_connector_state(connector)
> +    }
> +
> +    /// Retrieve the last committed atomic state for `plane` if `plane` =
has already been added to
> +    /// the atomic state being composed.
> +    ///
> +    /// Returns `None` otherwise.
> +    pub fn get_old_plane_state<P>(&self, plane: &P) -> Option<&P::State>
> +    where
> +        P: ModesettablePlane + ModeObject<Driver =3D T>,
> +    {
> +        self.state.get_old_plane_state(plane)
> +    }
> +
> +    /// Return a composer for `plane`s new atomic state if it was previo=
usly added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if another mutator still exists for=
 this state.
> +    pub fn get_new_crtc_state<C>(&self, crtc: &C) -> Option<CrtcStateMut=
ator<'_, C::State>>
> +    where
> +        C: ModesettableCrtc + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_=
crtc_state`
> +        let state =3D
> +            unsafe { bindings::drm_atomic_get_new_crtc_state(self.as_raw=
(), crtc.as_raw()) };
> +
> +        CrtcStateMutator::<C::State>::new(self, NonNull::new(state)?)
> +    }
> +
> +    /// Return a composer for `plane`s new atomic state if it was previo=
usly added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if another mutator still exists for=
 this state.
> +    pub fn get_new_plane_state<P>(&self, plane: &P) -> Option<PlaneState=
Mutator<'_, P::State>>
> +    where
> +        P: ModesettablePlane + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_=
plane_state`.
> +        let state =3D
> +            unsafe { bindings::drm_atomic_get_new_plane_state(self.as_ra=
w(), plane.as_raw()) };
> +
> +        PlaneStateMutator::<P::State>::new(self, NonNull::new(state)?)
> +    }
> +
> +    /// Return a composer for `crtc`s new atomic state if it was previou=
sly added to the atomic
> +    /// state being composed.
> +    ///
> +    /// Returns `None` otherwise, or if another mutator still exists for=
 this state.
> +    pub fn get_new_connector_state<C>(
> +        &self,
> +        connector: &C,
> +    ) -> Option<ConnectorStateMutator<'_, C::State>>
> +    where
> +        C: ModesettableConnector + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: DRM either returns NULL or a valid pointer to a `drm_=
connector_state`
> +        let state =3D unsafe {
> +            bindings::drm_atomic_get_new_connector_state(self.as_raw(), =
connector.as_raw())
> +        };
> +
> +        ConnectorStateMutator::<C::State>::new(self, NonNull::new(state)=
?)
> +    }
> +}
> +
> +/// An [`AtomicStateMutator`] wrapper which is not yet part of any commi=
t operation.
> +///
> +/// Since it's not yet part of a commit operation, new mode objects may =
be added to the state. It
> +/// also holds a reference to the underlying [`AtomicState`] that will b=
e released when this object
> +/// is dropped.
> +pub struct AtomicStateComposer<T: KmsDriver>(AtomicStateMutator<T>);
> +
> +impl<T: KmsDriver> Deref for AtomicStateComposer<T> {
> +    type Target =3D AtomicStateMutator<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T: KmsDriver> Drop for AtomicStateComposer<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We're in drop, so this is guaranteed to be the last p=
ossible reference
> +        unsafe { ManuallyDrop::drop(&mut self.0.state) }
> +    }
> +}
> +
> +impl<T: KmsDriver> AtomicStateComposer<T> {
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `ptr` points to a valid instance of `=
drm_atomic_state`.
> +    #[allow(dead_code)]
> +    pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -=
> Self {
> +        // SAFETY: see `AtomicStateMutator::from_raw()`
> +        Self(unsafe { AtomicStateMutator::new(ptr) })
> +    }
> +
> +    /// Attempt to add the state for `crtc` to the atomic state for this=
 composer if it hasn't
> +    /// already been added, and create a mutator for it.
> +    ///
> +    /// If a composer already exists for this `crtc`, this function retu=
rns `Error(EBUSY)`. If
> +    /// attempting to add the state fails, another error code will be re=
turned.
> +    pub fn add_crtc_state<C>(&self, crtc: &C) -> Result<CrtcStateMutator=
<'_, C::State>>
> +    where
> +        C: ModesettableCrtc + ModeObject<Driver =3D T>,
> +    {
> +        // SAFETY: DRM will only return a valid pointer to a `drm_crtc_s=
tate` - or an error.
> +        let state =3D unsafe {
> +            from_err_ptr(bindings::drm_atomic_get_crtc_state(
> +                self.as_raw(),
> +                crtc.as_raw(),
> +            ))
> +            .map(|c| NonNull::new_unchecked(c))
> +        }?;
> +
> +        CrtcStateMutator::<C::State>::new(self, state).ok_or(EBUSY)
> +    }

I think it should be called get_crtc_state. First because it would be
consistent with the C part of KMS, but also because, to me, add would
take the state and return void. Here, you take no state and return it,
so it's more of a get operation than add.

Maxime

--nnpxz5ci3sflqgc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QefwAKCRAnX84Zoj2+
dsjsAYDbcy1LAI7wqsYCuEzzSK8ev7CT66GYLAIyGYLfDvvlrpty/3G3m26oAksg
JDqUhj4BgNPk2NQ8rj9nhYiIW3plfwddz3tYYeNtFFzsmUfGLjdtTA3WORLqN3jl
t/9iYjb9XQ==
=bWOs
-----END PGP SIGNATURE-----

--nnpxz5ci3sflqgc6--
