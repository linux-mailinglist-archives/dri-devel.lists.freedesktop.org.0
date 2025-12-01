Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D937C980AB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6210E3FB;
	Mon,  1 Dec 2025 15:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="a16ZDsuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49110E3F7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:25:48 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477563e531cso37793595e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764602747; x=1765207547;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/PBMLC/8G/juxv/25GNnJBJ2JcKLUfSryP0oOOFPz4s=;
 b=a16ZDsuyizy7kL55BvqUkzewD/A2IMFh6qQMzZXJ32bN5MeH8gKbqGL9GAP9iqKnYX
 3xqIHu/5ejUv9gtJ8GDLT+VIa8Zd5PAZkLhffRlPf6pZ8YtmlDPeX5TlpiTJSP+FtVXT
 O4uodQAl7Dd2Hz/MT6eMF4pHXWemvjaJwEBUeNTQCsRK9niLecl5q/4waKNU+fDlx9Yu
 WM5x0dlO1wsvrwfa//5RFaiIl544wmNaHh8+ufZ+sy5YJj0oF7xjuUMgZOCuZ+DLrfQd
 fK0mpovZaH8dxc0Ev8qmWSbjL5FORZKp6lY6G6SKcg3BMoSGquPRDceZeEHSIjqGD4k+
 VmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764602747; x=1765207547;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/PBMLC/8G/juxv/25GNnJBJ2JcKLUfSryP0oOOFPz4s=;
 b=I4p8nzis6ukxtLYq5bmYOPRJCn3o8TRJjsRLlBC4HSBl8pweLXP1af5KlhQivn4KB7
 FuOSm/KjK2pAVSr0qrnFokkPenfnlcYP4dP0pD5Zlm+x37AgHCifY2zu0c7XPzEYTMja
 /MnQDHACVjnoa4rka69HbyQICEg83DG4EG+rCxkxN0fnQ94a8RzdFBCgZDDGERswBOlu
 HJYsHxwmLLS/rtktCB8PHRoe/m2tKKQ6d894HDyeFWhbDy43c9dEM5m/iRI79vWjEMiu
 b+edNjglrKkoGhGt6pOkGWBIjaJdtSJW8/xGJnCDTT+QAeIQSf71h75/b8XkVTZqjChq
 tqmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn/sqPHcVHRbjpk1w9zeSCzfiecgOHX71gm8Yu2hBvpYYlHdR57N32Yix73vbvb95fenPYFL8bodk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyakbaGmtw5vEJAA+R+H/Vh+y83mFM9p7fPJDY0Tvq/Pz/GVqmh
 B77P4vtOgw/WhUnj8e/24nIOY33i83TmMEwefatUkPWkdHkbrCZyiBn8vt3B14R2SASa172Hjnh
 ML5hbYtExs7jDLAdehg==
X-Google-Smtp-Source: AGHT+IHagyKsAqWEXQp83POdvueNqL+O+T5qrx9NbxfHAPtvRBo5PsypyEpuu1wmHGW4Yci8BLozHHebFt1NFt0=
X-Received: from wrqr12.prod.google.com ([2002:a5d:498c:0:b0:42b:3a01:781f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1447:b0:42b:3131:5434 with SMTP id
 ffacd0b85a97d-42cc1d0cfefmr41170930f8f.38.1764602746763; 
 Mon, 01 Dec 2025 07:25:46 -0800 (PST)
Date: Mon, 1 Dec 2025 15:25:45 +0000
In-Reply-To: <20251129213056.4021375-1-joelagnelf@nvidia.com>
Mime-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
Message-ID: <aS2zeUDqqbmYPaug@google.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"
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

On Sat, Nov 29, 2025 at 04:30:56PM -0500, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list_head nodes and high-level
> iteration over typed list items.
> 
> Provide a `clist_create` macro to assist in creation of the `Clist` type.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> Thanks to Alex, Daniel, Danilo, John, and Miguel for reviewing v1/v2!
> 
> Changes since v2:
>   - Squashed the 3 patches into a single patch due to dependencies and reducing helpers.
>   - Changed Clist to Clist<'a, T> using const generic offset (Alex).
>   - Simplified C helpers to only list_add_tail (Alex, John).
>   - Added init_list_head() for INIT_LIST_HEAD functionality and dropped it from C helpers (Alex).
>   - Added FusedIterator impl for both ClistHeadIter and ClistIter.
>   - Added PartialEq/Eq for ClistHead (Alex)
>   - Rust style improvements, comment improvements (Daniel).
>   - Added MAINTAINERS entry (Miguel).
> 
> Link to v2: https://lore.kernel.org/all/20251111171315.2196103-2-joelagnelf@nvidia.com/
> Link to v1 (RFC): https://lore.kernel.org/all/20251030190613.1224287-2-joelagnelf@nvidia.com/
> 
>  MAINTAINERS            |   7 +
>  rust/helpers/helpers.c |   1 +
>  rust/helpers/list.c    |  12 ++
>  rust/kernel/clist.rs   | 349 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   1 +
>  5 files changed, 370 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/clist.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f7aa6a8a9a1..fb2ff877b6d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22666,6 +22666,13 @@ F:	rust/kernel/init.rs
>  F:	rust/pin-init/
>  K:	\bpin-init\b|pin_init\b|PinInit
>  
> +RUST TO C LIST INTERFACES
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/clist.rs
> +
>  RXRPC SOCKETS (AF_RXRPC)
>  M:	David Howells <dhowells@redhat.com>
>  M:	Marc Dionne <marc.dionne@auristor.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..634fa2386bbb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..6044979c7a2e
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..361a6132299b
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist::init_list_head,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # // SAFETY: head and all the items are test objects allocated in this scope.
> +//! # unsafe { init_list_head(head.as_mut_ptr()) };
> +//! # // SAFETY: head is a test object allocated in this scope.
> +//! # let mut head = unsafe { head.assume_init() };
> +//! # let mut items = [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr = item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
> +//! #     unsafe {
> +//! #         (*ptr).value = i as i32 * 10;
> +//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
> +//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
> +//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed Clist from sentinel head.
> +//! // SAFETY: head is valid, items are `SampleItemC` with embedded `link` field.
> +//! let list = unsafe { clist_create!(&mut head, Item, SampleItemC, link) };
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 = false;
> +//! let mut found_10 = false;
> +//! let mut found_20 = false;
> +//!
> +//! for item in list.iter() {
> +//!     let val = item.value();
> +//!     if val == 0 { found_0 = true; }
> +//!     if val == 10 { found_10 = true; }
> +//!     if val == 20 { found_20 = true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +/// Initialize a `list_head` object to point to itself.
> +///
> +/// # Safety
> +///
> +/// `list` must be a valid pointer to a `list_head` object.
> +#[inline]
> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
> +    unsafe {
> +        (*list).next = list;
> +        (*list).prev = list;
> +    }
> +}

It may make sense to move such manual reimplementations into the
bindings crate so that other abstractions take advantage of them by
default when they write bindings::init_list_head.

Of course you can still have a re-export here.

> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - `ClistHead` represents an allocated and valid `list_head` structure.
> +///
> +/// # Safety
> +///
> +/// - All `list_head` nodes must not be modified by C code for the lifetime of `ClistHead`.

So if I modify the list from Rust code, it's okay?

I think the actual requirement you want is just that nobody modifies it.

> +#[repr(transparent)]
> +pub struct ClistHead(Opaque<bindings::list_head>);
> +
> +impl ClistHead {
> +    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next `ClistHead` in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Get the previous `ClistHead` in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).prev) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
> +    }
> +}
> +
> +// SAFETY: `ClistHead` can be sent to any thread.
> +unsafe impl Send for ClistHead {}
> +
> +// SAFETY: `ClistHead` can be shared among threads as it is not modified by C per type invariants.
> +unsafe impl Sync for ClistHead {}
> +
> +impl PartialEq for ClistHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_raw() == other.as_raw()
> +    }
> +}
> +
> +impl Eq for ClistHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (using `container_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and valid list.
> +struct ClistHeadIter<'a> {
> +    current_head: &'a ClistHead,
> +    list_head: &'a ClistHead,
> +    exhausted: bool,
> +}
> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item = &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.exhausted {
> +            return None;
> +        }
> +
> +        // Advance to next node.
> +        self.current_head = self.current_head.next();
> +
> +        // Check if we've circled back to the sentinel head.
> +        if self.current_head == self.list_head {
> +            self.exhausted = true;
> +            return None;
> +        }
> +
> +        Some(self.current_head)
> +    }
> +}
> +
> +impl<'a> FusedIterator for ClistHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used for
> +/// iteration over items of type `T`, it is not associated with a specific item.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
> +/// - `offset` is the byte offset of the `list_head` field within the C struct that `T` wraps.
> +///
> +/// # Safety
> +///
> +/// - All the list's `list_head` nodes must be allocated and have valid next/prev pointers.
> +/// - The underlying `list_head` (and entire list) must not be modified by C for the
> +///   lifetime 'a of `Clist`.

Here and elsewhere: We don't generally have Safety sections on structs.
It looks like these should just be invariants.

> +pub struct Clist<'a, T> {
> +    head: &'a ClistHead,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Clist<'a, T> {
> +    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
> +    ///
> +    /// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
> +    /// the C struct that `T` wraps.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bindings::list_head) -> Self {

I think OFFSET should probably be a constant on the struct rather than a
field.

> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
> +            head: unsafe { ClistHead::from_raw(ptr) },
> +            offset: OFFSET,
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next == raw }
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> ClistIter<'a, T> {
> +        ClistIter {
> +            head_iter: ClistHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +                exhausted: false,
> +            },
> +            offset: self.offset,
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct ClistIter<'a, T> {
> +    head_iter: ClistHeadIter<'a>,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Iterator for ClistIter<'a, T> {
> +    type Item = &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head = self.head_iter.next()?;
> +
> +        // Convert to item using offset.
> +        // SAFETY:
> +        // - `item_ptr` calculation from `offset` (calculated using offset_of!)
> +        //    is valid per invariants.
> +        Some(unsafe { &*head.as_raw().cast::<u8>().sub(self.offset).cast::<T>() })

Can be simplified to:
head.as_raw().byte_sub(OFFSET).cast::<T>()

> +    }
> +}
> +
> +impl<'a, T> FusedIterator for ClistIter<'a, T> {}
> +
> +/// Create a C doubly-circular linked list interface `Clist` from a raw `list_head` pointer.
> +///
> +/// This macro creates a `Clist<T>` that can iterate over items of type `$rust_type` linked
> +/// via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
> +///   unmodified for the lifetime of the rust `Clist`.
> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
> +/// - The macro is called from an unsafe block.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in the [crate::clist] module documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
> +        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
> +            { ::core::mem::offset_of!($c_type, $field) },
> +        >($head)
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c2eea9a2a345..b69cc5ed3b59 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -72,6 +72,7 @@
>  pub mod bug;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod clist;
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;
> -- 
> 2.34.1
> 
