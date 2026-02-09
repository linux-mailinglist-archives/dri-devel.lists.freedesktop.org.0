Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOaGE0rXiWkzCQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:47:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B081310EF21
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7010E3C5;
	Mon,  9 Feb 2026 11:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LkYYdInN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E310E3C5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 11:30:28 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-437681ecd32so681543f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770636627; x=1771241427;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=B6UWN0OsE7QW1x3g1701AwzacxmXzQP0I4E5tISve+w=;
 b=LkYYdInN7hLTTnw9NqMDd06n2pFUuOSgzK+BE/lkKOB4FVBJfDFgIR9Kb8eGkeSefD
 GF7NFe66diqCas0lQgGhdVBkH8ziH4x5t9KDi9IIj89Eh8Fz7rh5bLLs6LWcdhaZLZrI
 Fl0ZDc16VdrIheY+Vp/o8b/EYi/beKLY2jESbXVMUYmy5krF70sD1TfvenHouLE/82cb
 pchJoFDUb6sbEogxhbKrPWq6eLDdf6XL07o4EsWMPeP8uSBJN4kZQqE6JOcZm5cGBaG7
 fsP/an0Jed4XP91Nl0+bT8R2baIdRoAKVNclP4b/5MVCyD/jS6+jWiGGdfpgjs4ymsBu
 QlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770636627; x=1771241427;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6UWN0OsE7QW1x3g1701AwzacxmXzQP0I4E5tISve+w=;
 b=nuMzcYzRLWdpe/UW+DPMwUejsQl9zPiqEpmCbcdqjlVphyQyHnFPZFaxaXTwci7mGH
 /xr0stuRTlhm54WkiUQkagRae0j460SE0HaHEy7ZfAUWdmR16i2PpCXaaB/Zu1Cg1aXp
 6kVmEBwD4V03Vn4UXz2p0fROMm5seF0nBpXGy5+0mEVNQX6k1B0l4Sb0F/m+q/gMyRX8
 ccLPufMB07BWZP2j/aDJs/Kran75E5UWSH/WMRPELoRNhnvNJYWeh2xzavpdvnzrxD44
 M5IcNqXH7qMf4IV/hZsGvMLoWX2ZQ/GjR586bc8MocmN1jj5EkVYmf5F5JIDZ3byOSRR
 3riw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxRbO+5zUNKHdKKvmqS9UorjDD7Kea/1TvdNOjPuad0t/pSlAF8T2nhBTpePYc5wRtXCO0nux5iQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAmb6WniNwnoXEkZhsywpuS+j02WVVTPx7RM7YsBKQuLhmdxvC
 WvovuPaK5wZQbe/kzWVtPVX/cLZhtKmrOBrQAk0rCpDT6mOWy9bn+vrHV8X5DKOooAZHzXh3COW
 QSqiROct3zI04e/+VVg==
X-Received: from wrgb9.prod.google.com ([2002:a05:6000:3c9:b0:437:7057:b172])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:230a:b0:437:678b:83ca with SMTP id
 ffacd0b85a97d-437678b8589mr8686513f8f.50.1770636626863; 
 Mon, 09 Feb 2026 03:30:26 -0800 (PST)
Date: Mon, 9 Feb 2026 11:30:25 +0000
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
Message-ID: <aYnFUX8mvsrH10RT@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B081310EF21
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:14:01AM +0100, Philipp Stanner wrote:
> +void rust_helper_dma_fence_get(struct dma_fence *f)
> +{
> +	dma_fence_get(f);
> +}
> +
> +void rust_helper_dma_fence_put(struct dma_fence *f)
> +{
> +	dma_fence_put(f);
> +}
> +
> +bool rust_helper_dma_fence_begin_signalling(void)
> +{
> +	return dma_fence_begin_signalling();
> +}
> +
> +void rust_helper_dma_fence_end_signalling(bool cookie)
> +{
> +	dma_fence_end_signalling(cookie);
> +}
> +
> +bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)
> +{
> +	return dma_fence_is_signaled(f);
> +}

These should use the __rust_helper #define. See:
https://lore.kernel.org/r/20260105-define-rust-helper-v2-0-51da5f454a67@google.com

> +void rust_helper_spin_lock_init(spinlock_t *lock)
> +{
> +	spin_lock_init(lock);
> +}
> [..]
> +#[pin_data]
> +pub struct DmaFenceCtx {
> +    /// An opaque spinlock. Only ever passed to the C backend, never used by Rust.
> +    #[pin]
> +    lock: Opaque<bindings::spinlock_t>,
> [...]
> +}
> +
> +impl DmaFenceCtx {
> +    /// Create a new `DmaFenceCtx`.
> +    pub fn new() -> Result<Arc<Self>> {
> +        let ctx = pin_init!(Self {
> +            // Feed in a non-Rust spinlock for now, since the Rust side never needs the lock.
> +            lock <- Opaque::ffi_init(|slot: *mut bindings::spinlock| {
> +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct spinlock_t`.
> +                unsafe { bindings::spin_lock_init(slot) };
> +            }),

We already have a __spin_lock_init() helper used by our SpinLock type. Can we
just use that one instead of adding a new one?

But actually I think it's simpler to just use SpinLock<()> as the type here. We
have (or should add) a method to get the `state` field from a SpinLock<()>,
which gets you a raw spinlock_t you can pass to C code.

> +use core::{
> [...]
> +    sync::atomic::{AtomicU64, Ordering},
> +};

This should use kernel::sync::atomic instead.

> +use kernel::c_str;
> [...]
> +    extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        c_str!("DRIVER_NAME_UNUSED").as_char_ptr()
> +    }
> +
> +    extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        c_str!("TIMELINE_NAME_UNUSED").as_char_ptr()
> +    }

We have c-strings literals now:

	extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
	    c"DRIVER_NAME_UNUSED".as_char_ptr()
	}
	
	extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
	    c"TIMELINE_NAME_UNUSED".as_char_ptr()
	}

> +pub trait DmaFenceCbFunc {
> +    /// The callback function. `cb` is a container of the data which the driver passed in
> +    /// [`DmaFence::register_callback`].
> +    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>)
> +    where
> +        Self: Sized;
> +}

Just make Sized into a super-trait.

	pub trait DmaFenceCbFunc: Sized {
	    /// The callback function. `cb` is a container of the data which the driver passed in
	    /// [`DmaFence::register_callback`].
	    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>);
	}

Probably also include 'static next to Sized instead of specifying it on
register_callback().

> +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> +    unsafe extern "C" fn callback(
> +        _fence_ptr: *mut bindings::dma_fence,
> +        cb_ptr: *mut bindings::dma_fence_cb,
> +    ) {
> [...]
> +        // SAFETY: `cp_ptr` is the heap memory of a Pin<Kbox<Self>> because it was created by
> +        // invoking ForeignOwnable::into_foreign() on such an instance.
> +        let cb = unsafe { <Pin<KBox<Self>> as ForeignOwnable>::from_foreign(cb_ptr) };
> +    }
> +}
> [...]
> +    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
> +        let cb = DmaFenceCb::new(data)?;
> +        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;

The ForeignOwnable trait provides no guarantees about where the void pointer
points. The only legal usage of such a void pointer is to pass it to
from_foreign() and borrow() and other similar methods defined on the
ForeignOwnable trait. Casting it to DmaFenceCb<U> and dereferencing it is
illegal because it might point elsewhere in the box than at the DmaFenceCb<U>
value. (Yes for Box it happens to point there, but for e.g. Arc it points at the
refcount_t value instead.)

Please replace this usage of ForeignOwnable with Box::into_raw() /
Box::from_raw() calls, or use ForeignOwnable::borrow[_mut]() to access the
value.

> +    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
> +        let cb = DmaFenceCb::new(data)?;
> +        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;
> +        // SAFETY: `ptr` was created validly directly above.
> +        let inner_cb = unsafe { (*ptr).inner.get() };
> +
> +        // SAFETY: `self.as_raw()` is valid because `self` is refcounted, `inner_cb` was created
> +        // validly above and was turned into a ForeignOwnable, so it won't be dropped. `callback`
> +        // has static life time.
> +        let ret = unsafe {
> +            bindings::dma_fence_add_callback(
> +                self.as_raw(),
> +                inner_cb,
> +                Some(DmaFenceCb::<U>::callback),
> +            )
> +        };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +        Ok(())

On error, this function leaks the DmaFenceCb allocation. It should be converted
back to a Box so that the destructor may run.

	drop(unsafe { Box::from_raw(ptr) });
	// or perhaps:
	drop(unsafe { DmaFenceCb::from_raw(...) });

Also this should use to_result().


> +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> +    fn new(data: impl PinInit<T>) -> Result<Pin<KBox<Self>>> {
> [...]
> +        KBox::pin_init(cb, GFP_KERNEL)
> [...]
> +impl DmaFenceCtx {
> +    /// Create a new `DmaFenceCtx`.
> +    pub fn new() -> Result<Arc<Self>> {
> [...]
> +        Arc::pin_init(ctx, GFP_KERNEL)

Shouldn't the gfp flags be provided by the caller instead of hard-coding
GFP_KERNEL here?

> +unsafe impl<T> AlwaysRefCounted for DmaFence<T> {
> +    /// # Safety
> +    ///
> +    /// `ptr`must be a valid pointer to a [`DmaFence`].
> +    unsafe fn dec_ref(ptr: NonNull<Self>) {
> +        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` is called
> +        // the fence is by definition still valid.
> +        let fence = unsafe { (*ptr.as_ptr()).inner.get() };
> +
> +        // SAFETY: Valid because `fence` was created validly above.
> +        unsafe { bindings::dma_fence_put(fence) }

The safety requirements of `dec_ref()` as described here are incomplete. The
caller must also give up ownership of one refcount to the value before they may
call this method. But you may simply delete that section because this is a trait
implementation, and the safety requirements are inherited from the declaration
of AlwaysRefCounted.

The safety comment on `let fence` is also not quite right. I don't think it's
useful to talk about NULL because you require something stronger than NULL for
this operation - for example `0xDEADBEEF as *mut DmaFence<T>` is not NULL but
would also be illegal here.

A better wording would be to say that by the safety requirements, the caller
passes a valid pointer to a `DmaFence<T>`.

And the safety comment on dma_fence_put() is also incomplete. The caller must
pass ownership of one refcount, so the safety comment should mention why we can
pass ownership of a refcount here (it is because caller must pass ownership of a
refcount to us by the safety requirments).

> +    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
> +    /// gets published.
> +    ///
> +    /// The signalling critical section is marked as finished automatically once the fence signals.
> +    pub fn begin_signalling(&mut self) {

I doubt it's legal to have a `&mut DmaFence<T>` because I could call
`mem::swap()` with two of them, which likely invalidates stuff inside `inner`.

> +    const fn ops_create() -> bindings::dma_fence_ops {
> +        // SAFETY: Zeroing out memory on the stack is always safe.
> +        let mut ops: bindings::dma_fence_ops = unsafe { core::mem::zeroed() };

No it's not always safe. If I have a local variable of type reference,
then it's not safe to zero that value because NULL is not a legal value
for references. The reason this is ok is because all fields of
dma_fence_ops are values that are nullable.

This should probably just use the safe pin_init::zeroed() function.

> +impl<T> DmaFence<T> {
> +    /// Create an initializer for a new [`DmaFence`].
> +    fn new(
> +        fctx: Arc<DmaFenceCtx>,
> +        data: impl PinInit<T>, // TODO: The driver data should implement PinInit<T, Error>
> +        lock: &Opaque<bindings::spinlock_t>,
> +        context: u64,
> +        seqno: u64,
> +    ) -> Result<ARef<Self>> {

This function should be unsafe. There are clearly some safety requirements here.
For example, I suspect it's required that `lock` does not get freed before the
returned value?

Making this function unsafe reveals that DmaFenceCtx::new_fence is missing a
safety requirement explaining why self.lock is alive for long enough.

Alice
