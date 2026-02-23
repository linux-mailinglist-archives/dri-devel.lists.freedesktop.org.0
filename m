Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G4hCYo4nGlCBgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:22:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E71756B6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF75410E15F;
	Mon, 23 Feb 2026 11:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SSTyAR/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA510E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:22:46 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-48372facfedso44758075e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771845765; x=1772450565;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ezzn5ZoGBmTqaL/WoWOOmJY3hi0ECWwZN/jUNRe/4RY=;
 b=SSTyAR/hQUCDNtOjuqH643u6K12cS4BqEgli6HBtsS39ScVMTK5eVgAZDMO1LwqReA
 kPlpNOgVqeXHVdGyczQFZ55Ev8svn5m50zBPh5Me5g4cXhK4aS9JcdMgknn0zv8wTLFB
 1kuPD2EftxxmKMyLTEVRQ0B1MCbl5U3i46na0LjUkHOQxLXZml9sGfxVlB0lEVdV6Dkv
 noAqdyoV2zAH81uGz3YyHBmh2HcFNfTAH0hw/ZEiqVIGS0OQdXL034ipCXa6o8pcbc53
 otVCdmBJZolxMmmr+UlSeNBI2OQRTJtDSBTxLjDllOsoQmkV5in9PAtJ87bBGf0+x44y
 Pw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771845765; x=1772450565;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ezzn5ZoGBmTqaL/WoWOOmJY3hi0ECWwZN/jUNRe/4RY=;
 b=PYWoHtPyC5211ulKpny54YcBhShblg7MXVW6CC3bXodiZ89ACOHXlb3+/p5Lo+JBqu
 V5rAqL1C5UfjsRSeb55k79MBwDCZRn4jpbbKUmuIL9MuRjhavbLLXG4dM+xpNSuvVMmY
 xbt3CCTx9OQluJtUZDoT04m8uG1St7Jc63aS4XZ0245rEJJzCcV9uAo1TfeM7VbaNwsY
 e9LE1+zgKOBY5WDK7nbJe0eIoSj9UC5RHRnM6ou8MRcNuhVtxilFNXgkXIVxzwRql3Kh
 Z3I1agC//2xxoEFmmBfxuCe/G1RMAeJHQSv4AJyGGNNbpsuRJcN0SOEBUMj5O2GsgwvL
 7tYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvih86OvtFOF+Ie1NC52/s7XhBcjpuddF18TS5WygLAWRFQGlEme7qFUS+dVTjXz2YE9plpEaZFUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrxJXpR6IqqtJfQtamQG8DMtnOClJD/QSurcbVXbw+x9DJzIyC
 l83TflTvVHRL9EVggrFJlIQ7J2loNalqP1DXL68dH1I1OiyK94QMSYM46SrA5M3bDURhATgB11T
 s3oZq5n2jsKYgzORPEg==
X-Received: from wmqc1.prod.google.com ([2002:a05:600c:a41:b0:483:702a:341c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f08:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-483a94c996fmr127902415e9.11.1771845765025; 
 Mon, 23 Feb 2026 03:22:45 -0800 (PST)
Date: Mon, 23 Feb 2026 11:22:44 +0000
In-Reply-To: <DGMA3158PGED.1BQ63TEC2FC60@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
 <aZlw3SGmLetHwaTM@google.com> <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
 <aZwalt_6KlOIDzkN@google.com> <DGMA3158PGED.1BQ63TEC2FC60@kernel.org>
Message-ID: <aZw4hCxvx_2oFIha@google.com>
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
X-Rspamd-Queue-Id: A71E71756B6
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 11:44:12AM +0100, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 10:15 AM CET, Alice Ryhl wrote:
> > On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
> >> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
> >> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?
> >> 
> >> I wanted to avoid exposing the reference count, as I suspect drivers might not
> >> need it in Rust, but I don't know for sure.
> >> 
> >> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
> >> GpuVmBoInner<T> is private, but I also don't want you to go back and forth with
> >> this in case it turns out we do need drivers to be able to take a reference
> >> count and I also don't think it hurts too much exposing the reference count,
> >> even if not needed.
> >> 
> >> So, either is fine with me, ARef<GpuVmBo<T>> or
> >> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
> >
> > I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need to
> > be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
> > The reference type is returned by several different APIs, so the Inner
> > type can't be private.
> 
> I meant NonNull<GpuVmBoInner<T>>, analogous to the current GpuVmBoRegistered.

Not sure what you mean.

Ultimately there is GpuVmBo<T> which is just an Opaque wrapper. Around
that, we need two pointer types: &_ and owned. The owned one can be
ARef<_>, or it can be a custom pointer type like the patch has right
now. Or maybe it could be Owned<_>, but it's honestly not a great match
as it's not really unique.

Alice
