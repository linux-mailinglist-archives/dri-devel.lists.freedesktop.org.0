Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP1LJdfDlGmFHgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:39:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD43F14FAEB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E1910E200;
	Tue, 17 Feb 2026 19:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="E3UO+B5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8BB10E200;
 Tue, 17 Feb 2026 19:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771357134; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JztFbrSjjb6MGsAMpM4pZ6MGr5vCuB5w2xLlnNRfqNdkMvBlVRR5+YEoowo4fFMsBxRser/lKt6oLUUADtGjwemBE7N0if3fDi3wpqes2QWgRPaSqmkZ3PLX2t5ujM7bsrM75Z5Ixj6dokhm3nWtxR7qQou1g+klXJ4kssIsmn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771357134;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=R7jxlTqhnmOEzf6Ej53/pn/46lcrMPiTXvzN+MXZnqA=; 
 b=EoKowpxJ6ff++1AvX4zueTaRuNJpAFUM/4uYxMKfeQ9WyBM2JDCVp/lWmQY8+2tkcbX6WgzKqQSFEoSbJzq40PkY8bXb2b5sotJANZM1iLKwej/f7S8wjsoCbW6wTkP0ep2nCBRfknkswcbYq4q2yql2ZuVJwTazE54u6ITERZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771357134; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=R7jxlTqhnmOEzf6Ej53/pn/46lcrMPiTXvzN+MXZnqA=;
 b=E3UO+B5JvK8drGFyFelwxjvo58h3qp5CGzcPE8dcBBJ5JSRSFPEgrkI90IiIpBah
 ETZOW9elwt767vBN1EExpUATp6f6zEUok5WS5YwzGPSeQr8EO7FTn/9lhkaCH15t37g
 Oyx+Y04YU66Febp3V8In+9LIVBscfL8OUBsUvJuQ=
Received: by mx.zohomail.com with SMTPS id 1771357132881477.74784133148523;
 Tue, 17 Feb 2026 11:38:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 4/7] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260206223431.693765-5-lyude@redhat.com>
Date: Tue, 17 Feb 2026 16:38:38 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4DC79BC-4752-467F-B28A-B74A8B046B25@collabora.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-5-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD43F14FAEB
X-Rspamd-Action: no action

Hi Lyude,

> On 6 Feb 2026, at 19:34, Lyude Paul <lyude@redhat.com> wrote:
>=20
> From: Asahi Lina <lina@asahilina.net>
>=20
> The DRM shmem helper includes common code useful for drivers which
> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
> this. Drivers can choose the raw GEM implementation or the shmem =
layer,
> depending on their needs.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> V2:
> * Use the drm_gem_shmem_init() and drm_gem_shmem_release() that I =
extracted
>  so we can handle memory allocation in rust, which means we no longer =
have
>  to handle freeing rust members of the struct by hand and have a =
closer
>  implementation to the main gem object
>  (this also gets rid of gem_create_object)
> * Get rid of GemObjectRef and UniqueGemObjectRef, we have ARef<T> at =
home.
> * Use Device<T::Driver> in Object<T>
> * Cleanup Object::<T>::new() a bit:
>  * Cleanup safety comment
>  * Use cast_mut()
> * Just import container_of!(), we use it all over anyhow
> * mut_shmem() -> as_shmem(), make it safe (there's no reason for being =
unsafe)
> * Remove any *const and *muts in structs, just use NonNull
> * Get rid of the previously hand-rolled sg_table bindings in shmem, =
use the
>  bindings from Abdiel's sg_table patch series
> * Add a TODO at the top about DMA reservation APIs and a desire for =
WwMutex
> * Get rid of map_wc() and replace it with a new ObjectConfig struct. =
While
>  it currently only specifies the map_wc flag, the idea here is that
>  settings like map_wc() and parent_resv_obj() shouldn't be exposed as
>  normal functions since the only place where it's safe to set them is
>  when we're still guaranteed unique access to the GEM object, e.g. =
before
>  returning it to the caller. Using a struct instead of individual
>  arguments here is mainly because we'll be adding at least one more
>  argument, and there's enough other gem shmem settings that trying to =
add
>  all of them as individual function arguments in the future would be a =
bit
>  messy.
> * Get rid of vm_numa_fields!, Lina didn't like this macro much either =
and I
>  think that it's fine for us to just specify the #[cfg(=E2=80=A6)] =
attributes by
>  hand since we only need to do it twice.
> * Set drm_gem_object_funcs.vm_ops directly to drm_gem_shmem_vm_ops, =
don't
>  export the various shmem funcs. I'm not sure why this wasn't possible
>  before but it seems to work fine now.
> V4:
> * Switch from OpaqueObject to a normal Object<T> now that we've =
removed it
> * Remove `dev` from Object, it's redundant as drm_gem_object already =
has a
>  device pointer we can use.
> * Use &raw instead of addr_of!()
> V5:
> * Fix typo in shmem::Object::as_raw()
> * Add type invariant around `obj` always being a valid
>  `drm_gem_shmem_object` for the duration of the lifetime of `Object`.
> * Use Opaque::cast_from() instead of unrestricted casts
> * Use IS_ENABLED() for gem shmem C helpers.
> V7:
> * Fix import style
> * Don't forget to make Object<T> Send/Sync
>=20
> rust/bindings/bindings_helper.h |   2 +
> rust/helpers/drm.c              |  56 ++++++-
> rust/kernel/drm/gem/mod.rs      |   5 +-
> rust/kernel/drm/gem/shmem.rs    | 249 ++++++++++++++++++++++++++++++++
> 4 files changed, 310 insertions(+), 2 deletions(-)
> create mode 100644 rust/kernel/drm/gem/shmem.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index ecf31681df806..c93afbd095e87 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -33,6 +33,7 @@
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/auxiliary_bus.h>
> @@ -61,6 +62,7 @@
> #include <linux/fs.h>
> #include <linux/i2c.h>
> #include <linux/ioport.h>
> +#include <linux/iosys-map.h>
> #include <linux/jiffies.h>
> #include <linux/jump_label.h>
> #include <linux/mdio.h>
> diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
> index 450b406c6f273..53ec06879db3d 100644
> --- a/rust/helpers/drm.c
> +++ b/rust/helpers/drm.c
> @@ -1,6 +1,7 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_vma_manager.h>
>=20
> #ifdef CONFIG_DRM
> @@ -20,4 +21,57 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct =
drm_vma_offset_node *node)
> return drm_vma_node_offset_addr(node);
> }
>=20
> -#endif
> +#if IS_ENABLED(CONFIG_DRM_GEM_SHMEM_HELPER)
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
> +{
> + return drm_gem_shmem_object_free(obj);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_print_info(struct drm_printer *p, =
unsigned int indent,
> +    const struct drm_gem_object *obj)
> +{
> + drm_gem_shmem_object_print_info(p, indent, obj);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_pin(struct drm_gem_object *obj)
> +{
> + return drm_gem_shmem_object_pin(obj);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
> +{
> + drm_gem_shmem_object_unpin(obj);
> +}
> +
> +__rust_helper struct sg_table *
> +rust_helper_drm_gem_shmem_object_get_sg_table(struct drm_gem_object =
*obj)
> +{
> + return drm_gem_shmem_object_get_sg_table(obj);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
> +      struct iosys_map *map)
> +{
> + return drm_gem_shmem_object_vmap(obj, map);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
> + struct iosys_map *map)
> +{
> + drm_gem_shmem_object_vunmap(obj, map);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
> +{
> + return drm_gem_shmem_object_mmap(obj, vma);
> +}
> +
> +#endif /* CONFIG_DRM_GEM_SHMEM_HELPER */
> +#endif /* CONFIG_DRM */
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 972d50d4342dd..379ae3dfb02f5 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -3,6 +3,8 @@
> //! DRM GEM API
> //!
> //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
> +#[cfg(CONFIG_DRM_GEM_SHMEM_HELPER)]
> +pub mod shmem;
>=20
> use crate::{
>     alloc::flags::*,
> @@ -50,6 +52,8 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
>     };
> }
>=20
> +pub(crate) use impl_aref_for_gem_obj;
> +
> /// A type alias for retrieving a [`Driver`]s [`DriverFile`] =
implementation from its
> /// [`DriverObject`] implementation.
> ///
> @@ -205,7 +209,6 @@ fn create_mmap_offset(&self) -> Result<u64> {
> impl<T: IntoGEMObject> BaseObject for T {}
>=20
> /// Crate-private base operations shared by all GEM object classes.
> -#[expect(unused)]
> pub(crate) trait BaseObjectPrivate: IntoGEMObject {
>     /// Return a pointer to this object's dma_resv.
>     fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> new file mode 100644
> index 0000000000000..d9f1a4e95cedc
> --- /dev/null
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DRM GEM shmem helper objects
> +//!
> +//! C header: =
[`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/linux/drm/drm=
_gem_shmem_helper.h)
> +
> +// TODO:
> +// - There are a number of spots here that manually acquire/release =
the DMA reservation lock using
> +//   dma_resv_(un)lock(). In the future we should add support for ww =
mutex, expose a method to
> +//   acquire a reference to the WwMutex, and then use that directly =
instead of the C functions here.

Right, thanks to Onur we=E2=80=99re pretty close on getting ww_mutex =
I=E2=80=99d say.

> +
> +use crate::{
> +    container_of,
> +    drm::{
> +        device,
> +        driver,
> +        gem,
> +        private::Sealed, //
> +    },
> +    error::{
> +        from_err_ptr,
> +        to_result, //
> +    },
> +    prelude::*,
> +    scatterlist,
> +    types::{
> +        ARef,
> +        Opaque, //
> +    }, //
> +};
> +use core::{
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    },
> +    ptr::NonNull,
> +};
> +use gem::{
> +    BaseObjectPrivate,
> +    DriverObject,
> +    IntoGEMObject, //
> +};
> +
> +/// A struct for controlling the creation of shmem-backed GEM =
objects.
> +///
> +/// This is used with [`Object::new()`] to control various properties =
that can only be set when
> +/// initially creating a shmem-backed GEM object.
> +#[derive(Default)]
> +pub struct ObjectConfig<'a, T: DriverObject> {
> +    /// Whether to set the write-combine map flag.
> +    pub map_wc: bool,
> +
> +    /// Reuse the DMA reservation from another GEM object.
> +    ///
> +    /// The newly created [`Object`] will hold an owned refcount to =
`parent_resv_obj` if specified.
> +    pub parent_resv_obj: Option<&'a Object<T>>,
> +}
> +
> +/// A shmem-backed GEM object.
> +///
> +/// # Invariants
> +///
> +/// `obj` contains a valid initialized `struct drm_gem_shmem_object` =
for the lifetime of this
> +/// object.
> +#[repr(C)]
> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    #[pin]
> +    obj: Opaque<bindings::drm_gem_shmem_object>,
> +    // Parent object that owns this object's DMA reservation object
> +    parent_resv_obj: Option<ARef<Object<T>>>,
> +    #[pin]
> +    inner: T,
> +}
> +
> +super::impl_aref_for_gem_obj!(impl<T> for Object<T> where T: =
DriverObject);
> +
> +// SAFETY: All GEM objects are thread-safe.
> +unsafe impl<T: DriverObject> Send for Object<T> {}
> +
> +// SAFETY: All GEM objects are thread-safe.
> +unsafe impl<T: DriverObject> Sync for Object<T> {}
> +
> +impl<T: DriverObject> Object<T> {
> +    /// `drm_gem_object_funcs` vtable suitable for GEM shmem objects.
> +    const VTABLE: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
> +        free: Some(Self::free_callback),
> +        open: Some(super::open_callback::<T>),
> +        close: Some(super::close_callback::<T>),
> +        print_info: Some(bindings::drm_gem_shmem_object_print_info),
> +        export: None,
> +        pin: Some(bindings::drm_gem_shmem_object_pin),
> +        unpin: Some(bindings::drm_gem_shmem_object_unpin),
> +        get_sg_table: =
Some(bindings::drm_gem_shmem_object_get_sg_table),
> +        vmap: Some(bindings::drm_gem_shmem_object_vmap),
> +        vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> +        mmap: Some(bindings::drm_gem_shmem_object_mmap),
> +        status: None,
> +        rss: None,
> +        // SAFETY: `drm_gem_shmem_vm_ops` is static const on the C =
side, so immutable references are
> +        // safe here and such references shall be valid forever
> +        vm_ops: unsafe { &bindings::drm_gem_shmem_vm_ops },
> +        evict: None,
> +    };
> +
> +    /// Return a raw pointer to the embedded drm_gem_shmem_object.
> +    fn as_shmem(&self) -> *mut bindings::drm_gem_shmem_object {

nit: I=E2=80=99d shoehorn the term =E2=80=9Craw=E2=80=9D here somehow =
because of the pointer. Like
as_raw_shmem() or something.

> +        self.obj.get()
> +    }
> +
> +    /// Create a new shmem-backed DRM object of the given size.
> +    ///
> +    /// Additional config options can be specified using `config`.
> +    pub fn new(
> +        dev: &device::Device<T::Driver>,
> +        size: usize,
> +        config: ObjectConfig<'_, T>,
> +        args: T::Args,
> +    ) -> Result<ARef<Self>> {
> +        let new: Pin<KBox<Self>> =3D KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                obj <- Opaque::init_zeroed(),
> +                parent_resv_obj: config.parent_resv_obj.map(|p| =
p.into()),
> +                inner <- T::new(dev, size, args),
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY: `obj.as_raw()` is guaranteed to be valid by the =
initialization above.
> +        unsafe { (*new.as_raw()).funcs =3D &Self::VTABLE };
> +
> +        // SAFETY: The arguments are all valid via the type =
invariants.
> +        to_result(unsafe { bindings::drm_gem_shmem_init(dev.as_raw(), =
new.as_shmem(), size) })?;
> +
> +        // SAFETY: We never move out of `self`.
> +        let new =3D KBox::into_raw(unsafe { =
Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: We're taking over the owned refcount from =
`drm_gem_shmem_init`.
> +        let obj =3D unsafe { =
ARef::from_raw(NonNull::new_unchecked(new)) };
> +
> +        // Start filling out values from `config`
> +        if let Some(parent_resv) =3D config.parent_resv_obj {
> +            // SAFETY: We have yet to expose the new gem object =
outside of this function, so it is
> +            // safe to modify this field.
> +            unsafe { (*obj.obj.get()).base.resv =3D =
parent_resv.raw_dma_resv() };
> +        }
> +
> +        // SAFETY: We have yet to expose this object outside of this =
function, so we're guaranteed
> +        // to have exclusive access - thus making this safe to hold a =
mutable reference to.
> +        let shmem =3D unsafe { &mut *obj.as_shmem() };
> +        shmem.set_map_wc(config.map_wc);

> +
> +        Ok(obj)
> +    }
> +
> +    /// Returns the `Device` that owns this GEM object.
> +    pub fn dev(&self) -> &device::Device<T::Driver> {
> +        // SAFETY: `dev` will have been initialized in `Self::new()` =
by `drm_gem_shmem_init()`.
> +        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
> +    }
> +
> +    extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
> +        // SAFETY:
> +        // - DRM always passes a valid gem object here
> +        // - We used drm_gem_shmem_create() in our create_gem_object =
callback, so we know that
> +        //   `obj` is contained within a drm_gem_shmem_object
> +        let this =3D unsafe { container_of!(obj, =
bindings::drm_gem_shmem_object, base) };
> +
> +        // SAFETY:
> +        // - We're in free_callback - so this function is safe to =
call.
> +        // - We won't be using the gem resources on `this` after this =
call.
> +        unsafe { bindings::drm_gem_shmem_release(this) };
> +
> +        // SAFETY:
> +        // - We verified above that `obj` is valid, which makes =
`this` valid
> +        // - This function is set in AllocOps, so we know that `this` =
is contained within a
> +        //   `Object<T>`
> +        let this =3D unsafe { container_of!(Opaque::cast_from(this), =
Self, obj) }.cast_mut();
> +
> +        // SAFETY: We're recovering the Kbox<> we created in =
gem_create_object()
> +        let _ =3D unsafe { KBox::from_raw(this) };
> +    }
> +
> +    /// Creates (if necessary) and returns an immutable reference to =
a scatter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
> +        // SAFETY:
> +        // - drm_gem_shmem_get_pages_sgt is thread-safe.
> +        // - drm_gem_shmem_get_pages_sgt returns either a valid =
pointer to a scatterlist, or an
> +        //   error pointer.
> +        let sgt =3D from_err_ptr(unsafe { =
bindings::drm_gem_shmem_get_pages_sgt(self.as_shmem()) })?;
> +
> +        // SAFETY: We checked above that `sgt` is not an error =
pointer, so it must be a valid
> +        // pointer to a scatterlist
> +        Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
> +    }
> +}
> +
> +impl<T: DriverObject> Deref for Object<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> DerefMut for Object<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> Sealed for Object<T> {}
> +
> +impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        // SAFETY:
> +        // - Our immutable reference is proof that this is safe to =
dereference.
> +        // - `obj` is always a valid drm_gem_shmem_object via our =
type invariants.
> +        unsafe { &raw mut (*self.obj.get()).base }
> +    }
> +
> +    unsafe fn from_raw<'a>(obj: *mut bindings::drm_gem_object) -> &'a =
Object<T> {
> +        // SAFETY: The safety contract of from_gem_obj() guarantees =
that `obj` is contained within
> +        // `Self`
> +        unsafe {
> +            let obj =3D Opaque::cast_from(container_of!(obj, =
bindings::drm_gem_shmem_object, base));
> +
> +            &*container_of!(obj, Object<T>, obj)
> +        }
> +    }
> +}
> +
> +impl<T: DriverObject> driver::AllocImpl for Object<T> {
> +    type Driver =3D T::Driver;
> +
> +    const ALLOC_OPS: driver::AllocOps =3D driver::AllocOps {
> +        gem_create_object: None,
> +        prime_handle_to_fd: None,
> +        prime_fd_to_handle: None,
> +        gem_prime_import: None,
> +        gem_prime_import_sg_table: =
Some(bindings::drm_gem_shmem_prime_import_sg_table),
> +        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
> +        dumb_map_offset: None,
> +    };
> +}
> --=20
> 2.53.0
>=20

Looks good to me.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
