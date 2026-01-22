Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLKdE+3dcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:21:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673E62F63
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7041E10E03F;
	Thu, 22 Jan 2026 08:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kz1lj2Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC56410E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 08:20:55 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4801e2e3532so4604235e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769070054; x=1769674854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PlwMpAn9Al0QHgVBZe5vJEVXfz0qnjNPXGGsZraEwjM=;
 b=kz1lj2GpHtwg+DzGgyEFzfObK1hbdTSzsk01S9W4jgflGfFSuwf9vtn5Ac3MgEu1KW
 XqzTIEwixkMQKXMqVIE91/F5TCg3R0KA82H4z8csfUKNY4JGvOZ+ekPVwmOJczGWELEQ
 f/Rfm8yx2slYodgJVS0wCciJhxZmGuK0qxskesnDTtpznS2+Kz3T/iO6EtUDIW5uDyLE
 ZyQZVI4clW37pSlHp4F+0oiCLYtKX1ZZnmoqkvOqCU3dWkcmIZJAR725Hq8/unUe2Prr
 3Y53xJ2mzpP+YrkpZ/pGYV37xSAOAbPumYx9MbRNt8MaN4sVpbrCGCJN+j1kp6GFqRnE
 XQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769070054; x=1769674854;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PlwMpAn9Al0QHgVBZe5vJEVXfz0qnjNPXGGsZraEwjM=;
 b=HCJoXFbH9RFUUSraYajEzHgjZsRU5rqLFU3WE9Es3J0hnTySE8f+rfj72yiukBh7DQ
 37cxH6txF2F/MRZy4nm5Ta48XIdyEFvUkPa2xYCbbG3MSBdpfyXMfHfJndPM2GET//9r
 hZACK4cYIkcEy48eI1f5XDZ9tWU6vU4LNYOYaLDdvUUQZBKXOM4ylJo42b41mSmNRMy+
 bFEgiFkA5ePjGKKyELBczMWeC4Pknq2kiMkatg4qdug8e3sDEW9BGTrXLV/tLtW54Chr
 23YZhHJGAV/DOB6oRuSzeDtIJyIbbHuRwE5Siy7kIkNEjRSL0QYwf1pR6FQSbFPm0WDQ
 Zi+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn6uPtI9z6xjOWSQNHxpuAt3N1mCKKg84Uov+bwp9/KsM9dpACuvqx8LZyM1CJQgj4uanhJ4Ulxow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHbpt7Gcwl4xFZNyYKpWwsFD5IFTyjmNfkHqv8Okxy7wfdX9kg
 0CdQBsEXHEPTzyxXgM/EwNAELAsxWQfQkk89bC17cwhP2i/Hf3dsqn+e3cVcvhHxrbdNs2MfV/g
 5ezmlJs3RScdy8ho2IQ==
X-Received: from wmow17.prod.google.com ([2002:a05:600c:4751:b0:47e:e4a5:c5f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6413:10b0:480:3a72:5c10 with SMTP id
 5b1f17b1804b1-4803a725caemr150095185e9.16.1769070054393; 
 Thu, 22 Jan 2026 00:20:54 -0800 (PST)
Date: Thu, 22 Jan 2026 08:20:53 +0000
In-Reply-To: <C31C1A08-D626-48D6-8F8C-39209BF94B50@collabora.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
 <C31C1A08-D626-48D6-8F8C-39209BF94B50@collabora.com>
Message-ID: <aXHd5aU-kV-9q_GW@google.com>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9673E62F63
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 02:31:26PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> This looks good. See a few nits below:
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > This provides a mechanism to create (or look up) VMBO instances, which
> > represent the mapping between GPUVM and GEM objects.
> >=20
> > The GpuVmBoResident<T> type can be considered like ARef<GpuVm<T>>,
> > except that no way to increment the refcount is provided.
>=20
> So this is like GpuVmCore, right? Since that is an ARef whose refcount ca=
nnot
> be incremented.

Sort of, except that GpuVmBoResident is not truly unique since you can
call obtain() twice.

> > The GpuVmBoAlloc<T> type is more akin to a pre-allocated GpuVm<T>, so
> > it's not really a GpuVm<T> yet. Its destructor could call
>=20
> Maybe you mean a pre-allocated GpuVmBo?

Yes that's what I meant.

> > drm_gpuvm_bo_destroy_not_in_lists(), but as the type is currently
> > private and never called anywhere, this perf optimization does not need
> > to happen now.
> >=20
> > Pre-allocating and obtaining the gpuvm_bo object is exposed as a single
> > step. This could theoretically be a problem if one wanted to call
> > drm_gpuvm_bo_obtain_prealloc() during the fence signalling critical
> > path, but that's not a possibility because:
> >=20
> > 1. Adding the BO to the extobj list requires the resv lock, so it canno=
t
> >   happen during the fence signalling critical path.
> > 2. obtain() requires that the BO is not in the extobj list, so obtain()
> >   must be called before adding the BO to the extobj list.
> >=20
> > Thus, drm_gpuvm_bo_obtain_prealloc() cannot be called during the fence
> > signalling critical path. (For extobjs at least.)
>=20
> What about internal objects? This is merely a sanity check from my side.

There are only two lists: extobj and evicted.

The extobj list is used to find the dma_resv locks of external objects.
This isn't required for internal ones, as they all share the resv lock
of the GPUVM itself.

> > +    #[inline]
> > +    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
> > +        // SAFETY: `r_obj` is immutable and valid for duration of GPUV=
M.
> > +        unsafe { (*(*self.as_raw()).r_obj).resv }
> > +    }
>=20
> Shouldn=E2=80=99t we call this raw_resv? Adding =E2=80=9Clock=E2=80=9D to=
 a name may incorrectly
> hint that the lock is actually taken.

Good call.

> > +    /// Custom function for allocating a `drm_gpuvm_bo`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Always safe to call.
> > +    // Unsafe to match function pointer type in C struct.
>=20
> Is this missing an extra =E2=80=9C/=E2=80=9C token? Also, I think this is=
 a bit hard to parse initially.

Well, I didn't meant to include it in the docs. But I can reformat this
to be less confusing.

> > +    /// Look up whether there is an existing [`GpuVmBo`] for this gem =
object.
> > +    #[inline]
> > +    pub(super) fn obtain(self) -> GpuVmBoResident<T> {
> > +        let me =3D ManuallyDrop::new(self);
> > +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> > +        let ptr =3D unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me=
.as_raw()) };
> > +
> > +        // If the vm_bo does not already exist, ensure that it's in th=
e extobj list.
>=20
> Wording is a bit off. Obviously only external objects should be in the ex=
tobj
> list. This is correctly captured by the check below, but the wording abov=
e
> makes it sound unconditional.

I'll update the comment. The "does not already exist" refers to the
`ptr::eq()` part of the condition, which checks whether the
pre-allocated vm_bo was created, or whether the GPUVM already has a
vm_bo for this GEM object.

> > +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj())=
 {
> > +            let resv_lock =3D me.gpuvm().raw_resv_lock();
> > +            // SAFETY: The GPUVM is still alive, so its resv lock is t=
oo.
> > +            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut(=
)) };
> > +            // SAFETY: We hold the GPUVMs resv lock.
> > +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> > +            // SAFETY: We took the lock, so we can unlock it.
> > +            unsafe { bindings::dma_resv_unlock(resv_lock) };
> > +        }
> > +
> > +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> > +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non=
-null ptr
> > +        GpuVmBoResident(unsafe { NonNull::new_unchecked(ptr.cast()) })
> > +    }
> > +}

> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Thanks for the reivew!

Alice
