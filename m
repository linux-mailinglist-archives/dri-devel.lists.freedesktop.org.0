Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJyyGmoYmGki/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:16:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2D165929
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B9E10E229;
	Fri, 20 Feb 2026 08:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="b8KyK+cB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415510E229
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 08:16:38 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-658c19d5ca0so2076553a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771575397; x=1772180197;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PyET7l0I7fLKTMPMjBwCdOePtcIDSdcQj0ubAt5TBQI=;
 b=b8KyK+cBECDLiy809cZskMkwX7bcta421/Ryz2N6yYclyBR1Sw5eTPADVYb5BdR/IP
 T09ET/PU+6fmw1aVQy1WM05WI6MVLLeAakTvASeJjEIK4sdEhsD4acabmOB4tNs9i9Xa
 iaHu8T32JdTS/4EguX+vHdsxc0cU3FFcy8gs5c2dLgQyEu6nbv4yqp2CC90KI7Xr392R
 i6RBEvd3qwQ1zjBGw6jNn8HRKfMwl2XxiBO8/Oy72SCTq4P/VONMM6JV/Fs/ncHOTfDO
 qM+GgzF86x3nbu+zOBFU3Dqks/3MH7zjEHPCK3BsITQWQFbloxIC7+AZW1srpKpLbckP
 Mz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771575397; x=1772180197;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PyET7l0I7fLKTMPMjBwCdOePtcIDSdcQj0ubAt5TBQI=;
 b=ayY4hFfV6UIw393kQllJLj0DYSQiciyjfpfj1iCw/N4M5Zv8WVR8Cjn2V649vvFvPC
 Bx9AlU0B1bq7sp3aScdhTtQ4rwHQY8FmT9zfLfLLhhaUYun4WaVRgF/miviQuUST7WqF
 B4Od48lBS2wMkCqQkp9usuYuf2LQHtIwbFtEcJYsvhWKOdBjQ9X2b8u0lhBbMlW5QPM5
 C1AJIkac7rciroBK644lQS62qCm2oUWSFl4sN3Y7EcdcOlCu4Lw8m8jDWVYaqGmGNwGG
 lSzwEUpkn1Dkl/T7KRoiCPV5rVS4njB8WYyG7+OzSN/+veiie+P5FigGx+whlHGJTDeU
 WKLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX04nGJSfC14OopPtFKyEE03b4r93IIE9Fl2NRsyoAPMDaXg28RgeKwUskJmdCLWVZfPgMqq5R3SKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8fjexH+L2BD5J2Z1CURJVHEVY8rWygdEPXVjAW/eR7O1oGoxA
 CowGIE7urJC2hcEoZboBzjfsW+V7mRgxbn8FiJY8R/QZgCWzQkba+DQ1Wm6SgUaPyGbhIjjmWui
 sdqho4PghoHmKHxMDhw==
X-Received: from edvd12.prod.google.com ([2002:aa7:ce0c:0:b0:659:31c4:b9d0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27d0:b0:65c:b71:e69e with SMTP id
 4fb4d7f45d1cf-65e825a4ef5mr496694a12.8.1771575396787; 
 Fri, 20 Feb 2026 00:16:36 -0800 (PST)
Date: Fri, 20 Feb 2026 08:16:35 +0000
In-Reply-To: <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
Message-ID: <aZgYY_fetgz_GDR8@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D7C2D165929
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:22:14PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > +/// Represents that a given GEM object has at least one mapping on this [`GpuVm`] instance.
> > +///
> > +/// Does not assume that GEM lock is held.
> > +#[repr(C)]
> > +#[pin_data]
> > +pub struct GpuVmBo<T: DriverGpuVm> {
> > +    #[pin]
> > +    inner: Opaque<bindings::drm_gpuvm_bo>,
> > +    #[pin]
> > +    data: T::VmBoData,
> > +}
> > +
> > +impl<T: DriverGpuVm> GpuVmBo<T> {
> > +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut bindings::drm_gpuvm_bo> = {
> > +        use core::alloc::Layout;
> > +        let base = Layout::new::<bindings::drm_gpuvm_bo>();
> > +        let rust = Layout::new::<Self>();
> > +        assert!(base.size() <= rust.size());
> > +        if base.size() != rust.size() || base.align() != rust.align() {
> > +            Some(Self::vm_bo_alloc)
> > +        } else {
> > +            // This causes GPUVM to allocate a `GpuVmBo<T>` with `kzalloc(sizeof(drm_gpuvm_bo))`.
> > +            None
> 
> So, if T::VmBoData is a ZST *and* needs drop, we may end up allocating on the C
> side and freeing on the Rust side.
> 
> I assume this is intentional and there is nothing wrong with it, but without a
> comment it might be a bit subtle.

Yeah it's subtle but correct.

> Another subtlety is that vm_bo_free() and vm_bo_alloc() assume that inner is
> always the first member. I'd probably add a brief comment why this even has to
> be the case, i.e. vm_bo_alloc() does not return *mut c_void, but *mut
> bindings::drm_gpuvm_bo.

I will add comments.

> > +    /// Access this [`GpuVmBo`] from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
> > +    /// a [`GpuVm<T>`].
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
> 
> I think this a good candidate for crate private, as we don't want drivers to use
> this, but still use it in other DRM core modules.
> 
> > +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +
> > +    /// Returns a raw pointer to underlying C value.
> > +    #[inline]
> > +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> 
> Less important, but probably also only needed in core DRM code.

For cases like these two, I do think one can run into cases where you
want them to be public. E.g. the vma confusion bugfix uses a raw pointer
for now:
https://lore.kernel.org/all/20260218-binder-vma-check-v2-1-60f9d695a990@google.com/

I'm generally not so worried about methods like these being public
because they can't be used without unsafe.

> > +    /// Look up whether there is an existing [`GpuVmBo`] for this gem object.
> > +    #[inline]
> > +    pub(super) fn obtain(self) -> GpuVmBoRegistered<T> {
> > +        let me = ManuallyDrop::new(self);
> > +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> > +        let ptr = unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
> > +
> > +        // Add the vm_bo to the extobj list if it's an external object, and if the vm_bo does not
> > +        // already exist. (If we are using an existing vm_bo, it's already in the extobj list.)
> > +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
> > +            let resv_lock = me.gpuvm().raw_resv();
> > +            // SAFETY: The GPUVM is still alive, so its resv lock is too.
> > +            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut()) };
> 
> Maybe add a TODO to replace this with a proper lock guard once available?

Ok.

> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoRegistered
> in a drive-by comment on v3.
> 
> But now that I have a closer look, I think it would be nice to just have GpuVmBo
> being the registered one and GpuVmBoAlloc being the pre-allocated one.
> 
> As it is currently, I think it is bad to ever present a &GpuVmBo to a driver
> because it implies that we don't know whether it is a pre-allocated one or a
> "normal", registered one. But we do always know.

Actually, I think GpuVmBo is already the registered one.
GpuVmBoRegistered is just ARef<GpuVmBo<T>>.

> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually carries
> the invariant of being registered.
> 
> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> instead,
> but it would be nice to not have drivers be in touch with a type that can be one
> or the other.
> 
> I know that the current GpuVmBo<T> also serves the purpose of storing common
> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inline
> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly more
> overhead in this implementation due to the forwarding methods, but less
> ambiguity for drivers, which I think is more important.

I think we should keep the current state that GpuVmBo is registered, and
only GpuVmBoAlloc is not. That is most useful.

Alice
