Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF80AB3D8E
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 18:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA1910E46D;
	Mon, 12 May 2025 16:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YIb3jdk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0367210E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 16:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747067416; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a1/iz/wmSFjpDcus3Em7EY9WriuzhM7FByzqDmOmWW0AzJfvWEHjyqoGZIC0Zza/ZlbXJ22IrN69iicN4YmKf07ARLKj7+MYLzo0cDUN6dYUUUz5dBeGRQ/Ud/ss/L9GGM70RBwSG6wJjvpn+BoI4AdGbpwQX0cVO9Neq1iLYUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747067416;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xi83OUcZSlLpzeMfBYvzx20Np2AJkyRKSUzEzDY8W+0=; 
 b=aQNAxN4UJFp8Soa0fWJKaQVBtXbmqE3oUWZCAPPFRImJRWmBNRwnTbDVqOQz0vjo0kbO9naIvtqQrpD02w9QmebILfdRP9AYD4ZVGl/BLyYgBgvIxB0Iiz7dOC8hT7g7plR+34Sp/TcL+Nn8RGvReG7xqVvl5dzHmrK1f0sNRXE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747067416; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=xi83OUcZSlLpzeMfBYvzx20Np2AJkyRKSUzEzDY8W+0=;
 b=YIb3jdk/X1Iqvcydz0HXfb96dREEANg7qVTnmadmwvLguB1tXAkOiRMp6b0GSdvO
 tT5YznydMt9RjLX2fPFg/05Sl6TyhFmLT87+TI9CHDt+tyKx9kRhInDisk2BFSS1Uz5
 OQfoLdM1VArk1ULL+FrxnwGtNrwmoS2pwEpPXjhU=
Received: by mx.zohomail.com with SMTPS id 174706741359340.4873184991236;
 Mon, 12 May 2025 09:30:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC v3 05/33] rust: drm/kms: Add drm_plane bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250305230406.567126-6-lyude@redhat.com>
Date: Mon, 12 May 2025 13:29:56 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CBB09E7-1B00-4F75-8EC5-D6139734654C@collabora.com>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-6-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External
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

Hi Lyude,

This patch is similar to the last one, I see that most of my
comments also apply here.

> On 5 Mar 2025, at 19:59, Lyude Paul <lyude@redhat.com> wrote:
>=20
> The next step is adding a set of basic bindings to create a plane, =
which
> has to happen before we can create a CRTC (since we need to be able to =
at
> least specify a primary plane for a CRTC upon creation). This mostly
> follows the same general pattern as connectors (AsRawPlane,
> AsRawPlaneState, etc.).
>=20
> There is one major difference with planes vs. other types of atomic =
mode
> objects: drm_plane_state isn't the only base plane struct used in DRM
> drivers, as some drivers will use helpers like drm_shadow_plane_state =
which
> have a drm_plane_state embedded within them.
>=20
> Since we'll eventually be adding bindings for shadow planes, we =
introduce a
> PlaneStateHelper trait - which represents any data type which can be =
used
> as the main wrapping structure around a drm_plane_state - and we =
implement
> this trait for PlaneState<T>. This trait can be used in our C =
callbacks to
> allow for drivers to use different wrapping structures without needing =
to
> implement a separate set of FFI callbacks for each type. Currently =
planes
> are the only type I'm aware of which do this.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V2:
> * Start using Gerry Guo's updated #[vtable] function so that our =
driver
>  operations table has a static location in memory

nit: Gary=E2=80=99s name is misspelled.

>=20
> V3:
> * Add safety comment for implementation of ModeObject
> * Make AsRawPlane unsafe, since we need a guarantee that `as_raw()` =
always
>  returns a valid pointer to an initialized drm_plane.
> * Add comments to __drm_atomic_helper_duplicate_state()
> * Switch `PlaneType` to camel casing
> * Improve safety comment in `Plane::<T>::new()`
> * Fix parameter types for `formats` and `format_modifiers`, as pointed =
out
>  by Louis Chauvet DRM will copy all of these into its own storage.
> * Improve safety comments in FromRawPlaneState
> * Introduce UnregisteredPlane type
> * Don't have AsRawPlane be a supertrait of StaticModeObject. We don't =
want
>  Unregistered mode object variants to be able to return a pointer to =
the
>  DRM device since that would break the UnregisteredKmsDevice pattern.
> * Change name of PlaneType to Type (for consistency with the other =
type IDs
>  we've adde)
> * Use addr_of_mut! in more places instead of &mut
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   2 +
> rust/kernel/drm/fourcc.rs       |   1 -
> rust/kernel/drm/kms.rs          |   1 +
> rust/kernel/drm/kms/plane.rs    | 621 ++++++++++++++++++++++++++++++++
> 4 files changed, 624 insertions(+), 1 deletion(-)
> create mode 100644 rust/kernel/drm/kms/plane.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index c41a3309223b2..5b85f3faca525 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -10,6 +10,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/clients/drm_client_setup.h>
> #include <drm/drm_connector.h>
> +#include <drm/drm_plane.h>
> #include <drm/drm_device.h>
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> @@ -18,6 +19,7 @@
> #include <drm/drm_gem.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_plane.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/blk-mq.h>
> diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
> index 62203478b5955..a30e40dbc037c 100644
> --- a/rust/kernel/drm/fourcc.rs
> +++ b/rust/kernel/drm/fourcc.rs
> @@ -11,7 +11,6 @@ const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> =
u32 {
>=20
> // TODO: We manually import this because we don't have a reasonable =
way of getting constants from
> // function-like macros in bindgen yet.
> -#[allow(dead_code)]
> pub(crate) const FORMAT_MOD_INVALID: u64 =3D 0xffffffffffffff;
>=20
> // TODO: We need to automate importing all of these. For the time =
being, just add the single one
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index f10e9f83ccb78..6cc5bb53f3628 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -3,6 +3,7 @@
> //! KMS driver abstractions for rust.
>=20
> pub mod connector;
> +pub mod plane;
>=20
> use crate::{
>     device,
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> new file mode 100644
> index 0000000000000..9f262156eac6c
> --- /dev/null
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM display planes.
> +//!
> +//! C header: =
[`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
> +
> +use super::{KmsDriver, ModeObject, StaticModeObject, =
UnregisteredKmsDevice};
> +use crate::{
> +    alloc::KBox,
> +    bindings,
> +    drm::{device::Device, fourcc::*},
> +    error::{to_result, Error},
> +    init::Zeroable,
> +    prelude::*,
> +    private::Sealed,
> +    types::{NotThreadSafe, Opaque},
> +};
> +use core::{
> +    marker::*,
> +    mem,
> +    ops::*,
> +    pin::Pin,
> +    ptr::{addr_of_mut, null, null_mut},
> +};
> +use macros::pin_data;
> +
> +/// The main trait for implementing the [`struct drm_plane`] API for =
[`Plane`].
> +///
> +/// Any KMS driver should have at least one implementation of this =
type, which allows them to create
> +/// [`Plane`] objects. Additionally, a driver may store =
driver-private data within the type that
> +/// implements [`DriverPlane`] - and it will be made available when =
using a fully typed [`Plane`]
> +/// object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane`] pointers are contained within a =
[`Plane<Self>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed =
that passed-in
> +///   [`struct drm_plane_state`] pointers are contained within a =
[`PlaneState<Self::State>`].
> +///
> +/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +#[vtable]
> +pub trait DriverPlane: Send + Sync + Sized {
> +    /// The generated C vtable for this [`DriverPlane`] =
implementation.
> +    #[unique]
> +    const OPS: &'static DriverPlaneOps =3D &DriverPlaneOps {
> +        funcs: bindings::drm_plane_funcs {
> +            update_plane: =
Some(bindings::drm_atomic_helper_update_plane),
> +            disable_plane: =
Some(bindings::drm_atomic_helper_disable_plane),
> +            destroy: Some(plane_destroy_callback::<Self>),
> +            reset: Some(plane_reset_callback::<Self>),
> +            set_property: None,
> +            atomic_duplicate_state: =
Some(atomic_duplicate_state_callback::<Self::State>),
> +            atomic_destroy_state: =
Some(atomic_destroy_state_callback::<Self::State>),
> +            atomic_set_property: None,
> +            atomic_get_property: None,
> +            late_register: None,
> +            early_unregister: None,
> +            atomic_print_state: None,
> +            format_mod_supported: None,
> +        },
> +
> +        helper_funcs: bindings::drm_plane_helper_funcs {
> +            prepare_fb: None,
> +            cleanup_fb: None,
> +            begin_fb_access: None,
> +            end_fb_access: None,
> +            atomic_check: None,
> +            atomic_update: None,
> +            atomic_enable: None,
> +            atomic_disable: None,
> +            atomic_async_check: None,
> +            atomic_async_update: None,
> +            panic_flush: None,
> +            get_scanout_buffer: None,
> +        },
> +    };
> +
> +    /// The type to pass to the `args` field of =
[`UnregisteredPlane::new`].
> +    ///
> +    /// This type will be made available in in the `args` argument of =
[`Self::new`]. Drivers which
> +    /// don't need this can simply pass [`()`] here.
> +    type Args;
> +
> +    /// The parent [`KmsDriver`] implementation.
> +    type Driver: KmsDriver;
> +
> +    /// The [`DriverPlaneState`] implementation for this =
[`DriverPlane`].
> +    ///
> +    /// See [`DriverPlaneState`] for more info.
> +    type State: DriverPlaneState;
> +
> +    /// The constructor for creating a [`Plane`] using this =
[`DriverPlane`] implementation.
> +    ///
> +    /// Drivers may use this to instantiate their [`DriverPlane`] =
object.
> +    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl =
PinInit<Self, Error>;
> +}
> +
> +/// The generated C vtable for a [`DriverPlane`].
> +///
> +/// This type is created internally by DRM.
> +pub struct DriverPlaneOps {
> +    funcs: bindings::drm_plane_funcs,
> +    helper_funcs: bindings::drm_plane_helper_funcs,
> +}
> +
> +#[derive(Copy, Clone, Debug, PartialEq, Eq)]
> +#[repr(u32)]
> +/// An enumerator describing a type of [`Plane`].
> +///
> +/// This is mainly just relevant for DRM legacy drivers.
> +///
> +/// # Invariants
> +///
> +/// This type is identical to [`enum drm_plane_type`].
> +///
> +/// [`enum drm_plane_type`]: srctree/include/drm/drm_plane.h

nit: the order of attributes and docs is reversed here.

> +pub enum Type {
> +    /// Overlay planes represent all non-primary, non-cursor planes. =
Some drivers refer to these
> +    /// types of planes as "sprites" internally.
> +    Overlay =3D bindings::drm_plane_type_DRM_PLANE_TYPE_OVERLAY,
> +
> +    /// A primary plane attached to a CRTC that is the most likely to =
be able to light up the CRTC
> +    /// when no scaling/cropping is used, and the plane covers the =
whole CRTC.
> +    Primary =3D bindings::drm_plane_type_DRM_PLANE_TYPE_PRIMARY,
> +
> +    /// A cursor plane attached to a CRTC that is more likely to be =
enabled when no scaling/cropping
> +    /// is used, and the framebuffer has the size indicated by =
[`ModeConfigInfo::max_cursor`].
> +    ///
> +    /// [`ModeConfigInfo::max_cursor`]: =
crate::drm::kms::ModeConfigInfo
> +    Cursor =3D bindings::drm_plane_type_DRM_PLANE_TYPE_CURSOR,
> +}
> +
>=20

=E2=80=94 Daniel

