Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDJKItKicmkOnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:21:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11726E1FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AB510E17B;
	Thu, 22 Jan 2026 22:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VLBFGTvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61F010E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769119779; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fV1sKmewq1PmXxzBTBrtpdFjOXNI7/d39KLVL63BbqTzAJnp2y9cgfEm+kM7hqO/84E0P3DngNE3gj99Wd9Z7EJ0kXZrfN/hu2/EpOWLHNMWa4Q2vmV43CGYaRU1EcR836IOE58Y34OqgHmhclO6TiQvb3PkUrbCxhhD5587fOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769119779;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VUf+AxJTDoFCkVXjdJj0kebd2uk6lzi5j31cMLhMcDo=; 
 b=lvGjmo49JU4O2uo/iwUJBimhXN44uWFQLXx608xrxEApaWf3pk76oK+6MDrPrMxvDJ0LPKKGpAenHTQ+4RM5NZYGCmf6WhUiTVa1ShUMHt5cSOgyFZZS0gY/Aa4AFMm+v3Bzas1UY0+AAPpxVrv2pqRYz8b+xzgcyPE2KMUqLe4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769119779; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=VUf+AxJTDoFCkVXjdJj0kebd2uk6lzi5j31cMLhMcDo=;
 b=VLBFGTvdmok6YEp0l1iddfhMDXRraHPg9WMDE5o9ti+9u8nDBQYi32vBKUEq1TrY
 TQGacKl+iDrtb3dI/kwYjDFdcVkJiOkmyWTXhUlkxCKhagqpFFeU1Xw29xXGjDoDWg/
 j1evfhqhG97oRskYMQ3pldYWEQqdZk9YwYVGzv6E=
Received: by mx.zohomail.com with SMTPS id 1769119776498366.7218835302906;
 Thu, 22 Jan 2026 14:09:36 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 4/6] rust: gpuvm: add GpuVa struct
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-4-dd95c04aec35@google.com>
Date: Thu, 22 Jan 2026 19:09:03 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <28ABEB7D-BE54-4625-AB9F-BB030FDD6723@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-4-dd95c04aec35@google.com>
To: Alice Ryhl <aliceryhl@google.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.data:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,asahilina.net:email,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: E11726E1FA
X-Rspamd-Action: no action



> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> This struct will be used to keep track of individual mapped ranges in
> the GPU's virtual memory.
>=20
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/drm/gpuvm/mod.rs |  17 ++++-
> rust/kernel/drm/gpuvm/va.rs  | 149 =
+++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 164 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> index =
cb576a7ffa07bc108704e008b7f87de52a837930..2179ddd717d8728bbe231bd94ea7b5d1=
e2652543 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -11,7 +11,10 @@
> //! C header: =
[`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
>=20
> use kernel::{
> -    alloc::AllocError,
> +    alloc::{
> +        AllocError,
> +        Flags as AllocFlags, //
> +    },
>     bindings,
>     drm,
>     drm::gem::IntoGEMObject,
> @@ -25,9 +28,13 @@
>=20
> use core::{
>     cell::UnsafeCell,
> -    mem::ManuallyDrop,
> +    mem::{
> +        ManuallyDrop,
> +        MaybeUninit, //
> +    },
>     ops::{
>         Deref,
> +        DerefMut,
>         Range, //
>     },
>     ptr::{
> @@ -36,6 +43,9 @@
>     }, //
> };
>=20
> +mod va;
> +pub use self::va::*;
> +
> mod vm_bo;
> pub use self::vm_bo::*;
>=20
> @@ -224,6 +234,9 @@ pub trait DriverGpuVm: Sized {
>     /// The kind of GEM object stored in this GPUVM.
>     type Object: IntoGEMObject;
>=20
> +    /// Data stored with each `struct drm_gpuva`.
> +    type VaData;
> +
>     /// Data stored with each `struct drm_gpuvm_bo`.
>     type VmBoData;
> }
> diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..c96796a6b2c8c7c4b5475324562968ca=
0f07fd09
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/va.rs
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +#![expect(dead_code)]
> +use super::*;
> +
> +/// Represents that a range of a GEM object is mapped in this =
[`GpuVm`] instance.
> +///
> +/// Does not assume that GEM lock is held.
> +///
> +/// # Invariants
> +///
> +/// This is a valid `drm_gpuva` that is resident in the [`GpuVm`] =
instance.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVa<T: DriverGpuVm> {
> +    #[pin]
> +    inner: Opaque<bindings::drm_gpuva>,
> +    #[pin]
> +    data: T::VaData,
> +}
> +
> +impl<T: DriverGpuVm> GpuVa<T> {
> +    /// Access this [`GpuVa`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuva` associated with a
> +    /// [`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a =
Self {
> +        // SAFETY: `drm_gpuva` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuva {
> +        self.inner.get()
> +    }
> +
> +    /// Returns the address of this mapping in the GPU virtual =
address space.
> +    #[inline]
> +    pub fn addr(&self) -> u64 {
> +        // SAFETY: The `va.addr` field of `drm_gpuva` is immutable.
> +        unsafe { (*self.as_raw()).va.addr }
> +    }
> +
> +    /// Returns the length of this mapping.
> +    #[inline]
> +    pub fn length(&self) -> u64 {
> +        // SAFETY: The `va.range` field of `drm_gpuva` is immutable.
> +        unsafe { (*self.as_raw()).va.range }
> +    }
> +
> +    /// Returns `addr..addr+length`.
> +    #[inline]
> +    pub fn range(&self) -> Range<u64> {
> +        let addr =3D self.addr();
> +        addr..addr + self.length()
> +    }
> +
> +    /// Returns the offset within the GEM object.
> +    #[inline]
> +    pub fn gem_offset(&self) -> u64 {
> +        // SAFETY: The `gem.offset` field of `drm_gpuva` is =
immutable.
> +        unsafe { (*self.as_raw()).gem.offset }
> +    }
> +
> +    /// Returns the GEM object.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `gem.offset` field of `drm_gpuva` is =
immutable.
> +        unsafe { <T::Object as =
IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
> +    }
> +
> +    /// Returns the underlying [`GpuVmBo`] object that backs this =
[`GpuVa`].
> +    #[inline]
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        // SAFETY: The `vm_bo` field has been set and is immutable =
for the duration in which this
> +        // `drm_gpuva` is resident in the VM.
> +        unsafe { GpuVmBo::from_raw((*self.as_raw()).vm_bo) }
> +    }
> +}
> +
> +/// A pre-allocated [`GpuVa`] object.
> +///
> +/// # Invariants
> +///
> +/// The memory is zeroed.
> +pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
> +
> +impl<T: DriverGpuVm> GpuVaAlloc<T> {
> +    /// Pre-allocate a [`GpuVa`] object.
> +    pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, =
AllocError> {
> +        // INVARIANTS: Memory allocated with __GFP_ZERO.
> +        Ok(GpuVaAlloc(KBox::new_uninit(flags | __GFP_ZERO)?))
> +    }
> +
> +    /// Prepare this `drm_gpuva` for insertion into the GPUVM.
> +    pub(super) fn prepare(mut self, va_data: impl PinInit<T::VaData>) =
-> *mut bindings::drm_gpuva {
> +        let va_ptr =3D MaybeUninit::as_mut_ptr(&mut self.0);
> +        // SAFETY: The `data` field is pinned.
> +        let Ok(()) =3D unsafe { va_data.__pinned_init(&raw mut =
(*va_ptr).data) };
> +        KBox::into_raw(self.0).cast()
> +    }
> +}
> +
> +/// A [`GpuVa`] object that has been removed.
> +///
> +/// # Invariants
> +///
> +/// The `drm_gpuva` is not resident in the [`GpuVm`].
> +pub struct GpuVaRemoved<T: DriverGpuVm>(KBox<GpuVa<T>>);
> +
> +impl<T: DriverGpuVm> GpuVaRemoved<T> {
> +    /// Convert a raw pointer into a [`GpuVaRemoved`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// Must have been removed from a [`GpuVm<T>`].
> +    pub(super) unsafe fn from_raw(ptr: *mut bindings::drm_gpuva) -> =
Self {
> +        // SAFETY: Since it has been removed we can take ownership of =
allocation.
> +        GpuVaRemoved(unsafe { KBox::from_raw(ptr.cast()) })
> +    }
> +
> +    /// Take ownership of the VA data.
> +    pub fn into_inner(self) -> T::VaData
> +    where
> +        T::VaData: Unpin,
> +    {
> +        KBox::into_inner(self.0).data
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVaRemoved<T> {
> +    type Target =3D T::VaData;
> +    fn deref(&self) -> &T::VaData {
> +        &self.0.data
> +    }
> +}
> +
> +impl<T: DriverGpuVm> DerefMut for GpuVaRemoved<T>
> +where
> +    T::VaData: Unpin,
> +{
> +    fn deref_mut(&mut self) -> &mut T::VaData {
> +        &mut self.0.data
> +    }
> +}
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

