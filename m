Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFn1N2oai2nSPwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:45:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002F11A5C1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D555910E55E;
	Tue, 10 Feb 2026 11:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DNf2FL9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA5E10E562
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:45:38 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806cfffca6so64024115e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 03:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770723937; x=1771328737;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FhyqHwDydhtKGY3YKE2q4rmdMYVlIl0zSjuX94GgR8w=;
 b=DNf2FL9i8Ko+S9bcmdv5/aLgj3Q9auyqOWj2Pacm+kOb8RmKe40+w3Lls3Qm/TLaP4
 OhJh51Xuu5Wqa0oWL2SJNKRdocf3gGzStg9mBGEDKNLkGsXOPg7LbRBnv11zrqUI4a3N
 Au2pp8mlBgZpVjLKlcrt5Z7PgkuJkFknXJjmXWH6nRUfz4c2sM8xmkG/VMdUuJag+jyk
 d6tFTnRCZOWSUeP9pz/uMMf9YTZJpHolrbD+Oh3HeAAts+aDoSgVxq0iSrVbM+f95E91
 CGOWezA/0jwailoJT6cwy8fNPEaUvfsra5tiMGVyqtKAyq7NzV4rzAImfkKI8q7hSq4a
 Kj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770723937; x=1771328737;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhyqHwDydhtKGY3YKE2q4rmdMYVlIl0zSjuX94GgR8w=;
 b=XX0AznGBNG+6qKnd0/O2yf91ZTdxTXnXTxc3jjMbf2oXrelMvu/BIpXvDaLvRxYHDl
 PNhzs/OmB2FhAy4zujMM0EOy4gVmzFQfiUmCWGaZHqjzHkOfCNCWxLPGSOcNOXIEVB16
 hS/svavfIeYhyyE2XgwTfs1719htuBC+CNab39aXyG9gMbnIoAYfrf/tngs/34WWpZDc
 01VxcGw8W4khxWvSgYDLUqoDMNq2ZWD8inRbkg0eIIwvM0x69RSI1G36KiDiMNPHNEOY
 vgFthw584iPkeBMqGClbwSpCq+IlFujG60eDRxnqqzo7sE4bGLejoGgIauJk/RtPwBOT
 Ohgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjnAEbntEkwTauXBj91CW5jeOZ6lZq4H+V6gtcdaB3Ac9dmYI4f0NwwveY8pypW7FjXA+nUjTD62E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnWwJAC9FniaPAeq17R0v1gSB5OweszPvmFASZj5GgUHC8ojzw
 ieQ1rxIZu3fP6nbkJoEsA9jAeVn3UuehC1vuMmLcaC7+spKFDRX4+OYANcupJ32/Rp6TgqxC8S7
 cM+igGHIRXCm6T4aBXg==
X-Received: from wmqo9.prod.google.com ([2002:a05:600c:4fc9:b0:480:4a03:7b78])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b09:b0:480:6999:27ec with SMTP id
 5b1f17b1804b1-483507e1accmr28102895e9.13.1770723937377; 
 Tue, 10 Feb 2026 03:45:37 -0800 (PST)
Date: Tue, 10 Feb 2026 11:45:36 +0000
In-Reply-To: <20260210123432.588a20f5@fedora>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210123432.588a20f5@fedora>
Message-ID: <aYsaYBimKUaRA1Gb@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 9002F11A5C1
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > impl MustBeSignalled<'_> {
> >     /// Drivers generally should not use this one.
> >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > 
> >     /// One way to ensure the fence has been signalled is to signal it.
> >     fn signal_fence(self) -> WillBeSignalled {
> >         self.fence.signal();
> >         self.i_promise_it_will_be_signalled()
> >     }
> > 
> >     /// Another way to ensure the fence will be signalled is to spawn a
> >     /// workqueue item that promises to signal it.
> >     fn transfer_to_wq(
> >         self,
> >         wq: &Workqueue,
> >         item: impl DmaFenceWorkItem,
> >     ) -> WillBeSignalled {
> >         // briefly obtain the lock class of the wq to indicate to
> >         // lockdep that the signalling path "blocks" on arbitrary jobs
> >         // from this wq completing
> >         bindings::lock_acquire(&wq->key);
> >         bindings::lock_release(&wq->key);
> 
> Sorry, I'm still trying to connect the dots here. I get that the intent
> is to ensure the pseudo-lock ordering is always:
> 
>    -> dma_fence_lockdep_map
>       -> wq->lockdep_map
> 
> but how can this order be the same in the WorkItem execution path? My
> interpretation of process_one_work() makes me think we'll end up with
> 
>   -> wq->lockdep_map
>     -> work->run()
>        -> WorkItem::run()
>           -> dma_fence_lockdep_map
>              -> DmaFenceSignalingWorkItem::run()
>                 ...
> 
> Am I missing something? Is there a way you can insert the
> dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> execution path?

Conceptually, the dma_fence_lockdep_map is already taken by the time you
get to WorkItem::run() because it was taken all the way back in the
ioctl, so WorkItem::run() does not need to reacquire it.

Now, of course that does not translate cleanly to how lockdep does
things, so in lockdep we do have to re-acquire it in WorkItem::run().
You can do that by setting the trylock bit when calling lock_acquire()
on dma_fence_lockdep_map. This has the correct semantics because trylock
does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.

Alice
