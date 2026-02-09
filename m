Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP3IBDaYiWmk/QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:17:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DEB10CD7F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A5810E336;
	Mon,  9 Feb 2026 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G2KzZJat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A110E336
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:17:53 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4801bceb317so53038215e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 00:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770625072; x=1771229872;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SeGw7/2R45wt+F+U7+OwOP9BoBU6gDAUvmlJQ70/hk4=;
 b=G2KzZJatn/kBGxg85D7D+O+2rZZjwvau8oi92Ckfzs0pMQ9AQWngjNNQcOOZjuTKSU
 wb/QvD/qwV6owaES3Y5gi3qgP53OCmQCHVSjLtEF2UUHTGd/mZWKDOo+xLhBfAvYCMgO
 6h1kidxcrRKsWjVdDZvzqyL7tFi680P5SEyEGZYg7YCb4K/Y30MMgVikqDjrEwwrr7uz
 51gBMewQYMMXr7d0SOx71v22LhU0pl+bkH/Yk5VXvcKM59q3tByZFXmxNLkksmpkjGKu
 1VZa+0lCNR+a0uCu3VPK43CQ1JEROyriz/53ajBUKYDhIlZpDl2CGBt78EWYsc8FD4dS
 Uq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770625072; x=1771229872;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SeGw7/2R45wt+F+U7+OwOP9BoBU6gDAUvmlJQ70/hk4=;
 b=PwTNYDIdarSKKqoIrmHXOYRb7hR6ofR9JL744EvHKzBWjB8sxRXZOrf73NYvTGgsEd
 i77ILTkUA9fJhTJBaX/kkXZztQxb+/wIXE9RWQWkffHM+eg6D7MTxpptKKVqzitb17Xx
 sq5/65cCtoxKzl62dPCZmbkg0mUwHhotwFoFrC1XW//Uzme3cWk4IIZZX+4bEc/va5f6
 SjcCpA+QL47QZAKDe0cpXsM4SATY0SYFyBK6BZQyIDQYGSgBqWOaPqXpaMFMGLfomrQs
 +Wx9pHmeORRSHzEGWtad3ePO5aieNv7iDBuOw74tlZdsadhUlc9JGLuGMoJI7CcuCa+u
 IYJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQVV23MfZMlyJDLeCg1D4eofByUC+Jns48P/azJoNE/MM7bw4tHG2RXEMH3f3qWs0j38mi1DZGebc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKleR7cQYQ9zUd2cToCXmLM527mngNg+sSoU01wZ+KUdbj/7I7
 h2ujcGfmxJORB7a2Dd6MUR2jRC21ZaQX+lzwe/VQb43wD1W/ABNDzXaiVvOEB40zBmbme8ssfpK
 4sUb4wtp+5GqcoU3qCQ==
X-Received: from wmqi17.prod.google.com ([2002:a05:600c:3551:b0:480:4a03:7b63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3590:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-48320236b01mr159936025e9.30.1770625072160; 
 Mon, 09 Feb 2026 00:17:52 -0800 (PST)
Date: Mon, 9 Feb 2026 08:17:51 +0000
In-Reply-To: <aYZMXiv4GvyjPxoa@um790>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com> <aYZMXiv4GvyjPxoa@um790>
Message-ID: <aYmYL8DP7zWCEPYX@google.com>
Subject: Re: [PATCH v4 6/6] rust: gpuvm: add GpuVmCore::sm_map()
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email]
X-Rspamd-Queue-Id: 30DEB10CD7F
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:17:34PM -0800, Deborah Brouwer wrote:
> Hi Alice, I got a build error testing gpuvm v4 with Tyr.
> 
> On Fri, Jan 30, 2026 at 02:24:15PM +0000, Alice Ryhl wrote:
> > Finally also add the operation for creating new mappings. Mapping
> > operations need extra data in the context since they involve a vm_bo
> > coming from the outside.
> > 
> > Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > +}
> > +
> > +impl<'op, T: DriverGpuVm> OpMap<'op, T> {
> > +    /// The base address of the new mapping.
> > +    pub fn addr(&self) -> u64 {
> > +        self.op.va.addr
> > +    }
> > +
> > +    /// The length of the new mapping.
> > +    pub fn length(&self) -> u64 {
> > +        self.op.va.range
> > +    }
> > +
> > +    /// The offset within the [`drm_gem_object`](crate::gem::Object).
> > +    pub fn gem_offset(&self) -> u64 {
> > +        self.op.gem.offset
> > +    }
> > +
> > +    /// The [`drm_gem_object`](crate::gem::Object) to map.
> > +    pub fn obj(&self) -> &T::Object {
> > +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> > +        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
> > +    }
> > +
> > +    /// The [`GpuVmBo`] that the new VA will be associated with.
> > +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> > +        self.vm_bo
> > +    }
> > +
> > +    /// Use the pre-allocated VA to carry out this map operation.
> > +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
> > +        let va = va.prepare(va_data);
> > +        // SAFETY: By the type invariants we may access the interval tree.
> > +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
> > +
> > +        let _gpuva_guard = self.vm_bo().lock_gpuva();
> > +        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
> > +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> > +
> > +        OpMapped {
> > +            _invariant: self._invariant,
> > +        }
> 
> error[E0308]: mismatched types
>   --> rust/kernel/drm/gpuvm/sm_ops.rs:98:25
>    |
> 98 |             _invariant: self._invariant,
>    |                         ^^^^^^^^^^^^^^^ expected `PhantomData<*mut &mut T>`, found `PhantomData<fn(&mut T) -> fn(&mut T)>`
>    |
>    = note: expected struct `core::marker::PhantomData<*mut &mut T>`
>               found struct `core::marker::PhantomData<fn(&'op mut T) -> fn(&'op mut T)>`
> 
> Updating the PhantomData type for OpMapped to match OpMap
> seems to fix it.

Hm. I thought I fixed this error. But perhaps it did not included in the
sent version for some reason?

Thanks in any case.

Alice
