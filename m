Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YghTEeVwmWkfUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:46:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86F16C6BB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A710E07E;
	Sat, 21 Feb 2026 08:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Kzucb9IM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A4310E07E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 08:46:24 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b801784f406so320747266b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 00:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771663583; x=1772268383;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3nulCMAkP+Qci36vgPqlTJu8Ho7ZO6tqS+wQkIh7yUM=;
 b=Kzucb9IMgn8lZ8n5AfTbYPdtZ+lfi4QGhfDfm9UX9BrH//l5brkkkmWdVu9Jcv4RQD
 eboHL6mwCQAT2QrDgh2MELj/01c80TaMW21FIn/d00cmYLkIyB3CDgcHij1ZxmIHkq2w
 gQ5HhQBldhUieJNu7iN9ORhEOK/+DWVpptFgNj4XQRWMEXqNUONC7OmMgROmU/9lq0CD
 Oy4VN5TAvjwEJSUBF0tKNFvh7qzD/oUq8OQxvoADL1n7kChENTcBcvRvA+WrJYo5OuZ3
 bg+iZVzFB5VKokQz6d7rDTWAsj3vpXHCvScySOLJeWgwwbZvtmzh3wX+Da64K77dL//+
 zI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771663583; x=1772268383;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nulCMAkP+Qci36vgPqlTJu8Ho7ZO6tqS+wQkIh7yUM=;
 b=rJhKRgyHEJTfWNKjPRIFycHezNtMs3s+X27D/4JNKPxNhj/8utN3URLFS8vjfYSwfv
 CI33ctxayaZ7Jk6Jl+mTthKeWzXz+NBS+VOCd/fglCzZCLXGZXEqufs2TkI2Z6ZBe5lZ
 b2B/+kxeHW05jiir/wjJBHr3OpvwR9xxZqg740OWl8dTCEKSjtixodlxSi+4GjjO3JNT
 b2nKwI2dlqOI/5KY6ARYtvg40ClAeeHHHbq8VQQHgPuPoJIHM/4qMH+gcEXqf/ILwbh2
 EnpZ39E6L2NJiAM/BArPLe4zcf8s1HpxPj4A5qTELO4TM8cteQSjlP3WontH5ngoxqub
 NV4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEO39Zl90tTYSYzAuiXYldajEN7wX6RLXT5jXwUShPUGqLpXVDkRaW6DZgGuaNmEFugRVZxHMiYgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLf/g+i2+w8jpM1y0+ebjb90Wsf+wnxKpw9MxxWOht6Kw31pmP
 h+crpQlPalpNhyodKutvIDMrYaxBWbF3xylKs76hNIpsGaJ3r2ao/J5mvZ8TcMeX6Gpn3rGq5JV
 vzlyqn8spMcz/Y0hvGw==
X-Received: from ejdck25.prod.google.com ([2002:a17:907:f1d9:b0:b88:451e:42d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e83:b0:b7f:f862:df26 with SMTP id
 a640c23a62f3a-b9081a0251bmr130091966b.14.1771663582622; 
 Sat, 21 Feb 2026 00:46:22 -0800 (PST)
Date: Sat, 21 Feb 2026 08:46:21 +0000
In-Reply-To: <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
Message-ID: <aZlw3SGmLetHwaTM@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7D86F16C6BB
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 05:08:09PM +0100, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 9:16 AM CET, Alice Ryhl wrote:
> >> > +/// A [`GpuVmBo`] object in the GEM list.
> >> > +///
> >> > +/// # Invariants
> >> > +///
> >> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> >> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> >> 
> >> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoRegistered
> >> in a drive-by comment on v3.
> >> 
> >> But now that I have a closer look, I think it would be nice to just have GpuVmBo
> >> being the registered one and GpuVmBoAlloc being the pre-allocated one.
> >> 
> >> As it is currently, I think it is bad to ever present a &GpuVmBo to a driver
> >> because it implies that we don't know whether it is a pre-allocated one or a
> >> "normal", registered one. But we do always know.
> >
> > Actually, I think GpuVmBo is already the registered one.
> > GpuVmBoRegistered is just ARef<GpuVmBo<T>>.
> 
> GpuVmBoAlloc<T> dereferences to GpuVmBo<T>, so currently it is not.

I will drop the Deref impl.

> >> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually carries
> >> the invariant of being registered.
> >> 
> >> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> instead,
> >> but it would be nice to not have drivers be in touch with a type that can be one
> >> or the other.
> >> 
> >> I know that the current GpuVmBo<T> also serves the purpose of storing common
> >> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inline
> >> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly more
> >> overhead in this implementation due to the forwarding methods, but less
> >> ambiguity for drivers, which I think is more important.
> >
> > I think we should keep the current state that GpuVmBo is registered, and
> > only GpuVmBoAlloc is not. That is most useful.
> 
> We seem to agree then: What I want is that from a driver perspective there is
> only GpuVmBo<T> (which is the registered thing) and GpuVmBoAlloc<T> which is the
> pre-allocated thing, i.e.  no separate GpuVmBoRegistered<T> type.

So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?

Alice
