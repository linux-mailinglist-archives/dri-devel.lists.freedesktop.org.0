Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761ACAA995
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 16:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632AA10E133;
	Sat,  6 Dec 2025 15:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="jLK97Nr+";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="cSamX0lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841CF10E133
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 15:58:31 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 6D4951D000E5;
 Sat,  6 Dec 2025 10:58:30 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sat, 06 Dec 2025 10:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1765036710; x=1765123110; bh=OePPmB7WDX
 9Fvk0i2giuguzFWfLKOHpXQRh3h1WMM90=; b=jLK97Nr+7BSP1OWm6KuTwLeDuz
 3KQbN3GmP4W72b+IHdvLqLVE0qCj1K8xUFKCdRHMlvcdNfBoNTXwietndeJrqZxJ
 /vNoFuP1EF32x+0LjjylFs3s+lIzzr05ktxFxdu3kTgH8iI94Yu3/VKaAfD0O9gI
 oSR7yP6dOMOvB+/bUZ+c0YW1gRWhGokcg9vHgZr4ifcmHwh8y1zEKWaeUR/wHLGs
 ueNwhJTPvBT332PlI4Nv5lhhHQXghjdDSlrtlb8fhBwFwVlExyt5W2pBFy7hM2Kf
 CJMpxau+fOssnWbsRHOFAWGtJL7/aT55Fj3HTdDiuFqWgrWAJihxSsirdlxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1765036710; x=1765123110; bh=OePPmB7WDX9Fvk0i2giuguzFWfLKOHpXQRh
 3h1WMM90=; b=cSamX0lgfzesMpLPeKldxKX1xU1L7MBCEbrmdrZ0DoO2MDVQhym
 iD9f0z4hXskSTjcYZswNZjlYFa21vkz0uNN4qxZqKWkrR5eZSiieGzYxB866af+E
 C1ITRTS+3e2uajJ3XmaPa+QHw3TSMpYHYX7xOWuf7lZwb9jKpcnC13pdn61MK2yX
 rIuAkScs8kdPwajV8pu+NEBL6vt4GUA+HtsXRbT+ztwuEVWwdZGRbFGqdgPekngx
 d0fJYbzMRFwAFF6CkPBbyxEQwFylMcQMmDHX+yhwr2O/DlHV7cj9QfWD9UqWvs9d
 fvyCIqjmnkFNajALPz+qbvtzHmXl2E2UzgA==
X-ME-Sender: <xms:pVI0afSwddSqLgFyOhtIkSXsYP0xHxvwNYQyQYws5_w-H0CwsGY6Lw>
 <xme:pVI0aX0mY6yWp-pKGB9oXJfuoUyglQlq_GFSnIrcwft8iXruv_mDehmsl28vKdQ_i
 UXOlRZtFTYoxPBpfpXoCaZEiOZm3GK1ndFQ3evKvdyHg4s3X5eFtL0>
X-ME-Received: <xmr:pVI0acjS0WXo5wg0bYfoYeTZScYt27p28EJ6b8faMBi10nRkRpooMM6TAP1uNBR1GTdSISaKmwf8h_0tIhOl4_OwIBUJP9J1tJ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
 evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
 hnvghtpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
 oheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlh
 eslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsthdq
 fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
 hitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghnihgvlhdrrghl
 mhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghkrheskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
 rhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:pVI0aVYjJWif8vSTaFiHzgEoX6hU0LA3vxmocoG87kr9NtZfa5M-NQ>
 <xmx:pVI0aVNdkVsZgIv670comAM3kGCkB1AOMLvUuqiQloXWidMFB6f4Ng>
 <xmx:pVI0aZT_EjckPT0qRwYLGfNQCbjqwYKwCBDAzFx4g5gSgjxca_RvEA>
 <xmx:pVI0aY7OVBTNRvP01dexsA1Mx0qFxc6k5ByhGeqw6yn3gcB-gIjxCQ>
 <xmx:plI0aaTN7BGu777xndLTFbSHba3jpmz3zZEq78FNoqtsDQ-6x3DgMbVC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 10:58:29 -0500 (EST)
Date: Sat, 6 Dec 2025 16:58:27 +0100
From: Janne Grunau <j@jannau.net>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
Message-ID: <20251206155827.GC1097212@robin.jannau.net>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-8-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202220924.520644-8-lyude@redhat.com>
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

On Tue, Dec 02, 2025 at 05:03:33PM -0500, Lyude Paul wrote:
> This introduces a set of bindings for working with iosys_map in rust code.
> The design of this is heavily based off the design for both the io and
> dma_map bindings for Rust.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V5:
> - Fix incorrect field size being passed to iosys_map_memcpy_to()
> - Add an additional unit test, basic_macro(), which can successfully catch
>   the above issue so it doesn't happen again in the future.
> V6:
> - Drop as_slice/as_mut_slice (Alice Rhyl)
> 
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/iosys_map.c |  15 +
>  rust/kernel/iosys_map.rs | 614 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs       |   1 +
>  4 files changed, 631 insertions(+)
>  create mode 100644 rust/helpers/iosys_map.c
>  create mode 100644 rust/kernel/iosys_map.rs
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 36d40f911345c..d549af697bd60 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -31,6 +31,7 @@
>  #include "irq.c"
>  #include "fs.c"
>  #include "io.c"
> +#include "iosys_map.c"
>  #include "jump_label.c"
>  #include "kunit.c"
>  #include "maple_tree.c"
> diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
> new file mode 100644
> index 0000000000000..b105261c3cf8a
> --- /dev/null
> +++ b/rust/helpers/iosys_map.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/iosys-map.h>
> +
> +void rust_helper_iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
> +				     const void *src, size_t len)
> +{
> +	iosys_map_memcpy_to(dst, dst_offset, src, len);
> +}
> +
> +void rust_helper_iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
> +				       size_t src_offset, size_t len)
> +{
> +	iosys_map_memcpy_from(dst, src, src_offset, len);
> +}
> diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
> new file mode 100644
> index 0000000000000..884a3d2be3348
> --- /dev/null
> +++ b/rust/kernel/iosys_map.rs
> @@ -0,0 +1,614 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! IO-agnostic memory mapping interfaces.
> +//!
> +//! This crate provides bindings for the `struct iosys_map` type, which provides a common interface
> +//! for memory mappings which can reside within coherent memory, or within IO memory.
> +//!
> +//! C header: [`include/linux/iosys-map.h`](srctree/include/linux/pci.h)
> +
> +use crate::{
> +    prelude::*,
> +    transmute::{AsBytes, FromBytes},
> +};
> +use bindings;
> +use core::{
> +    marker::PhantomData,
> +    mem::{self, MaybeUninit},
> +    ops::{Deref, DerefMut, Range},
> +};
> +
> +/// Raw unsized representation of a `struct iosys_map`.
> +///
> +/// This struct is a transparent wrapper around `struct iosys_map`. The C API does not provide the
> +/// size of the mapping by default, and thus this type also does not include the size of the
> +/// mapping. As such, it cannot be used for actually accessing the underlying data pointed to by the
> +/// mapping.
> +///
> +/// With the exception of kernel crates which may provide their own wrappers around `RawIoSysMap`,
> +/// users will typically not interact with this type directly.
> +pub struct RawIoSysMap<T: AsBytes + FromBytes>(bindings::iosys_map, PhantomData<T>);
> +
> +impl<T: AsBytes + FromBytes> RawIoSysMap<T> {
> +    /// Convert from a raw `bindings::iosys_map`.
> +    #[expect(unused)]
> +    #[inline]
> +    pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
> +        Self(val, PhantomData)
> +    }
> +
> +    /// Convert from a `RawIoSysMap<T>` to a raw `bindings::iosys_map` ref.
> +    #[inline]
> +    pub(crate) fn as_raw(&self) -> &bindings::iosys_map {
> +        &self.0
> +    }
> +
> +    /// Convert from a `RawIoSysMap<T>` to a raw mutable `bindings::iosys_map` ref.
> +    #[inline]
> +    pub(crate) fn as_raw_mut(&mut self) -> &mut bindings::iosys_map {
> +        &mut self.0
> +    }
> +
> +    /// Returns whether the mapping is within IO memory space or not.
> +    #[inline]
> +    pub fn is_iomem(&self) -> bool {
> +        self.0.is_iomem
> +    }
> +
> +    /// Returns the size of a single item in this mapping.
> +    pub const fn item_size(&self) -> usize {
> +        mem::size_of::<T>()
> +    }
> +
> +    /// Returns a mutable address to the memory pointed to by this iosys map.
> +    ///
> +    /// Note that this address is not guaranteed to reside in system memory, and may reside in IO
> +    /// memory.
> +    #[inline]
> +    pub fn as_mut_ptr(&self) -> *mut T {
> +        if self.is_iomem() {
> +            // SAFETY: We confirmed above that this iosys map is contained within iomem, so it's
> +            // safe to read vaddr_iomem
> +            unsafe { self.0.__bindgen_anon_1.vaddr_iomem }
> +        } else {
> +            // SAFETY: We confirmed above that this iosys map is not contaned within iomem, so it's
> +            // safe to read vaddr.
> +            unsafe { self.0.__bindgen_anon_1.vaddr }
> +        }
> +        .cast()
> +    }
> +
> +    /// Returns an immutable address to the memory pointed to by this iosys map.
> +    ///
> +    /// Note that this address is not guaranteed to reside in system memory, and may reside in IO
> +    /// memory.
> +    #[inline]
> +    pub fn as_ptr(&self) -> *const T {
> +        self.as_mut_ptr().cast_const()
> +    }
> +}
> +
> +// SAFETY: As we make no guarantees about the validity of the mapping, there's no issue with sending
> +// this type between threads.
> +unsafe impl<T: AsBytes + FromBytes> Send for RawIoSysMap<T> {}
> +
> +impl<T: AsBytes + FromBytes> Clone for RawIoSysMap<T> {
> +    fn clone(&self) -> Self {
> +        Self(self.0, PhantomData)
> +    }
> +}
> +
> +/// A sized version of a [`RawIoSysMap`].
> +///
> +/// Since this type includes the size of the [`RawIoSysMap`], it can be used for accessing the
> +/// underlying data pointed to by it.
> +///
> +/// # Invariants
> +///
> +/// - The iosys mapping referenced by this type is guaranteed to be of at least `size` bytes in
> +///   size
> +/// - The iosys mapping referenced by this type is valid for the lifetime `'a`.
> +#[derive(Clone)]
> +pub struct IoSysMapRef<'a, T: AsBytes + FromBytes> {
> +    map: RawIoSysMap<T>,
> +    size: usize,
> +    _p: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T: AsBytes + FromBytes> IoSysMapRef<'a, T> {
> +    /// Create a new [`IoSysMapRef`] from a [`RawIoSysMap`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller guarantees that the mapping referenced by `map` is of at least `size` bytes in
> +    ///   size.
> +    /// - The caller guarantees that the mapping referenced by `map` remains valid for the lifetime
> +    ///   of `'a`.
> +    #[allow(unused)]
> +    pub(crate) unsafe fn new(map: RawIoSysMap<T>, size: usize) -> IoSysMapRef<'a, T> {
> +        // INVARIANT: Our safety contract fulfills the type invariants of `IoSysMapRef`.
> +        IoSysMapRef {
> +            map,
> +            size,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Return the size of the `IoSysMapRef`.
> +    #[inline]
> +    pub fn size(&self) -> usize {
> +        self.size
> +    }
> +
> +    /// Writes `src` to the region starting from `offset`.
> +    ///
> +    /// `offset` is in units of `T`, not the number of bytes.
> +    ///
> +    /// This function can return the following errors:
> +    ///
> +    /// * [`EOVERFLOW`] if calculating the length of the slice results in an overflow.
> +    /// * [`EINVAL`] if the slice would go out of bounds of the memory region.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::iosys_map::*;
> +    ///
> +    /// # fn test() -> Result {
> +    /// # let mut map = tests::VecIoSysMap::new(&[0; 3])?;
> +    /// # {
> +    /// # let mut map = map.get();
> +    /// map.write(&[1, 2, 3], 0)?; // (now [1, 2, 3])
> +    /// map.write(&[4], 2)?; // (now [1, 2, 4])
> +    /// # }
> +    /// #
> +    /// # map.assert_eq(&[1, 2, 4]);
> +    /// #
> +    /// # Ok::<(), Error>(()) }
> +    /// # assert!(test().is_ok());
> +    /// ```
> +    pub fn write(&mut self, src: &[T], offset: usize) -> Result {
> +        let range = self.compute_range(offset, src.len())?;
> +
> +        // SAFETY:
> +        // - The address pointed to by this iosys_map is guaranteed to be valid via IoSysMapRef's
> +        //   type invariants.
> +        // - We checked that this range of memory is within bounds above
> +        unsafe {
> +            bindings::iosys_map_memcpy_to(
> +                self.as_raw_mut(),
> +                range.start,
> +                src.as_ptr().cast(),
> +                range.len(),
> +            )
> +        };
> +
> +        Ok(())
> +    }
> +
> +    /// Attempt to compute the offset of an item within the iosys map using its index.
> +    ///
> +    /// Returns an error if an overflow occurs.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This function checks for overflows, but it explicitly does not check if the offset goes out
> +    /// of bounds. It is the caller's responsibility to check for this before using the returned
> +    /// offset with the iosys_map API.
> +    unsafe fn item_from_index(&self, idx: usize) -> Result<usize> {
> +        self.item_size().checked_mul(idx).ok_or(EOVERFLOW)
> +    }
> +
> +    /// Compute the range within this mapping a specific data type at a given offset would occupy.
> +    ///
> +    /// This function returns the computed range if it doesn't overflow, but does not check whether
> +    /// or not the range is within the bounds of the allocated region pointed to by this iosys
> +    /// mapping.

The part of the comment starting with "but does not check ..." doesn't
appear to be accurate anymore. It checks `range_end > self.size`. The
guarantees on successful return below contradict it as well.

> +    ///
> +    /// On success, the range returned by this function is guaranteed:
> +    ///
> +    /// * To be a valid range of memory within the virtual mapping for this gem object.

This isn't a gem object anymore

> +    /// * To be properly aligned to [`RawIoSysMap::item_size()`].
> +    fn compute_range(&self, offset: usize, count: usize) -> Result<Range<usize>> {
> +        // SAFETY: If the offset is out of bounds, we'll catch this via overflow checks or when
> +        // checking range_end.
> +        let offset = unsafe { self.item_from_index(offset)? };
> +        let range_size = count.checked_mul(self.item_size()).ok_or(EOVERFLOW)?;
> +        let range_end = offset.checked_add(range_size).ok_or(EOVERFLOW)?;
> +
> +        if range_end > self.size {
> +            return Err(EINVAL);
> +        }
> +
> +        // INVARIANT: Since `offset` and `count` are both in units of `T`, we're guaranteed that the

The use of offset is a little confusing since the function parameter is
shadowed by the computed byte offset.

Janne
