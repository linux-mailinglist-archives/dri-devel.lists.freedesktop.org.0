Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IIGBl03i2neRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:49:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253511B684
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9510E1CD;
	Tue, 10 Feb 2026 13:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QKxvsk6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880D710E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:49:11 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806cd00e02so23805115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770731350; x=1771336150;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ir8q+upc8QwnzKnnpPbPVZe9GiYbjnyr5Mc/R3N1TXo=;
 b=QKxvsk6gDWs3Wm0eQv9gam9R7J3OvuxFVIksnaazjb8n/Bu9RJ1uDYj8EcGUomuqqI
 yAmdmJ+8e7R3yQU3k3Mflnuevvb16/KiVkdiocbaeL3yMOs2f7gBkPXjTzSe243DJ1ag
 qYd1Beq1PTlogNhS1Ro4sc/j4nRHG0sziyUx6MYW72zYF1fvFr7Iy63Kt/Zz72SPEnNw
 u1oah1sB14T2GqBE17jTIxNVF/DHXnosABfb8MU7oXtv6PzPis17eDzF0HMqtCf6eZf/
 Lvl0cQcQOzCVrIyzERqlpRRLAsyi75XdEhWI1/xDdOz53u4imbDOiz7f0KSdEkBrhWDG
 54ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770731350; x=1771336150;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ir8q+upc8QwnzKnnpPbPVZe9GiYbjnyr5Mc/R3N1TXo=;
 b=Kgz4ZhuNq1FAR3mpKP2s3SCgf4uKK/9TtFyd77FXLX/Fm40SbBxjGF1rpq+bdGTP5p
 Bg73jvcK5EOoMhYzlY0R7Sgup0XjSDfX6CdODutf4ClVPDiLt/n+IWjFzl2KZs06wRUZ
 cxb30HGqSdeuSvFlcPs+kV7OHoYLo6W+UkaTKNy5I5z2D9zLT5YhHJkW/i3ai7xVtMm0
 zRBFl75gRWAB/3pNkibiOgk1AW3eGrt+m0yIoZgKMT49M+YKII8RcSBkaH/Vk9QeOz+i
 t7BpiCc3VqWaBpQaxQ0ZUPI3uDCCuZ52gbDbdDc+p4kOvU9s5xwmwwdOPn1Pf/bjHUa/
 ZJIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBnkg9q/uCke3KcG8P+KdwGu4M/h61n+xsaNlaI2ra7oZaTLFiT0E5KSrj9KGviF/z1IhXHuV/l3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj6b1dOJ+WSbP7dln0WkrxheR52QLkCAmsRhJimKC2/RuYpsDh
 lXB7/jL0w1X0Jbuc9sSl3lY96QrSYFJgnVi9/sEnbstW+MmuIqXZllxIsNcN2e2D6oVc7pF8XiB
 Fsu6XE7SeBD6dVwjnHg==
X-Received: from wmrc23.prod.google.com ([2002:a05:600c:ad7:b0:480:1bc3:e23c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id
 5b1f17b1804b1-48320213a37mr218488375e9.22.1770731350068; 
 Tue, 10 Feb 2026 05:49:10 -0800 (PST)
Date: Tue, 10 Feb 2026 13:49:09 +0000
In-Reply-To: <20260210142631.6f8a3411@fedora>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
Message-ID: <aYs3VVH_UXMFa5oC@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
X-Rspamd-Queue-Id: 6253511B684
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 13:15:31 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >   
> > > > impl MustBeSignalled<'_> {
> > > >     /// Drivers generally should not use this one.
> > > >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > > > 
> > > >     /// One way to ensure the fence has been signalled is to signal it.
> > > >     fn signal_fence(self) -> WillBeSignalled {
> > > >         self.fence.signal();
> > > >         self.i_promise_it_will_be_signalled()
> > > >     }
> > > > 
> > > >     /// Another way to ensure the fence will be signalled is to spawn a
> > > >     /// workqueue item that promises to signal it.
> > > >     fn transfer_to_wq(
> > > >         self,
> > > >         wq: &Workqueue,
> > > >         item: impl DmaFenceWorkItem,
> > > >     ) -> WillBeSignalled {
> > > >         // briefly obtain the lock class of the wq to indicate to
> > > >         // lockdep that the signalling path "blocks" on arbitrary jobs
> > > >         // from this wq completing
> > > >         bindings::lock_acquire(&wq->key);
> > > >         bindings::lock_release(&wq->key);
> > > > 
> > > >         // enqueue the job
> > > >         wq.enqueue(item, wq);
> > > > 
> > > >         // The signature of DmaFenceWorkItem::run() promises to arrange
> > > >         // for it to be signalled.
> > > >         self.i_promise_it_will_be_signalled()
> > > >     }  
> > > 
> > > I guess what's still missing is some sort of `transfer_to_hw()`
> > > function and way to flag the IRQ handler taking over the fence
> > > signaling token.  
> > 
> > Yes, transfer to hardware needs to be another piece of logic similar to
> > transfer to wq. And I imagine there are many ways such a transfer to
> > hardware could work.
> > 
> > Unless you have a timeout on it, in which case the WillBeSignalled is
> > satisfied by the fact you have a timeout alone, and the signalling that
> > happens from the irq is just an opportunistic signal from outside the
> > dma fence signalling critical path.
> 
> Yes and no. If it deadlocks in the completion WorkItem because of
> allocations (or any of the forbidden use cases), I think we want to
> catch that, because that's a sign fences are likely to end up with
> timeouts when they should have otherwise been signaled properly.
> 
> > Well ... unless triggering timeouts can block on GFP_KERNEL
> > allocations...
> 
> I mean, the timeout handler should also be considered a DMA-signalling
> path, and the same rules should apply to it.

I guess that's fair. Even with a timeout you want both to be signalling
path.

I guess more generally, if a fence is signalled by mechanism A or B,
whichever happens first, you have the choice between:

1. A in signalling path, B is not
2. B in signalling path, A is not
3. A and B both in signalling path

But the downside of choosing (1.) or (2.) is that if you declare that
event B is not in the signalling path, then B can kmalloc(GFP_KERNEL),
which may deadlock on itself until event A happens, and if A is a
timeout that could be a long time, so this scenario is undesirable even
if technically it's not a deadlock because it eventually unblocks
itself.

So we should choose option (3.) and declare that both timeout and hw irq
codepaths are signalling paths.

Alice
