Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKy1G4g8i2neRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:11:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B411BBB9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B710E59B;
	Tue, 10 Feb 2026 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="X6ZGNWCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5332B10E595
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:11:15 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b88632ba0b5so621332166b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770732674; x=1771337474;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wpyZuzgNw/WGJaYO0aTw62Jp3X9Gu5cXyXe5IaYxcjU=;
 b=X6ZGNWCNrmbWlNPttgB5/zmDsquH+/8bikwgAuPGTZUW+ZglyDEhIllCqpN4QQlW6E
 f9LYJ5BeHAS4priZ2DAkJBYV+w0B2BRwssRycIfQy4ClG/ANNQkQX2P4+b5ScTy3CrQ7
 reBBAthRxj3sRJnMEu8ZD/Ld/oLqoLO6468KBu4+ilzc6z8FqiRkgfYzTxSFaoGq/+l6
 bVZkMlRx9bfQdZHOvb3PNAwwz411/zFaB3dMbRSmCvCOXeFPd2s68NIgugxWJdUWuXvD
 F05q5mKblrpQUigLEW4hNO7RinCnJRsxh6E1d7kviEUMtULIijdz4YzCW8FWdd2u/4AK
 A6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770732674; x=1771337474;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpyZuzgNw/WGJaYO0aTw62Jp3X9Gu5cXyXe5IaYxcjU=;
 b=LCTs0+T07ySp6D6CyZEeLcDWyfsuiyC7nks3iJdCAkv1jfN7StWtAUicQQ6tXhrqH5
 Hw2uj0UxxTU6hem/sYRe0Pt607xnaO+D7EkEC62ld2hTGevC6WmPxRQrYB38o3HBFljh
 XOEQOiImN1VQR2YuruOYgxmZvawWD2FXWFMMZJdFkSLAFVquOnr0+71JAIBJGoWbuB5v
 wVM2xihpp/aNE1qqkGS6xfbs1PelhpyoXCneJCbFkJ/067lNMoQpbmfjM5Q7RB7iG5jq
 oF0/zkz7yNMmshZ+XG7aWHFYmkPVnvdwvAmNhQ+o7tpAM0Oc7wKYldYR4yZ9p8qZOcLz
 mHsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4eCGqDK2+r1AXnLdoeoGoMd9QaFGNV9uNW0cpgwkwj0t7sjTSGkM1Iw9HRnua4/OvQiUIGi262U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymcMk5JcgbiSlfsZ/bc+6Ta4B5Sf9KYWUzaqnGr3u5xoZz9MMp
 IYTdvfJsquOPxWjP5hSNCcTx2YfSZ8JIokscn0757GubqBmvWcOS6J3RDnAm6oR1rH/pq4s0vXZ
 YPIimQSJnLuV+EOpOLQ==
X-Received: from ejca6.prod.google.com ([2002:a17:906:3686:b0:b8e:7d43:b280])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f58b:b0:b86:f194:9eec with SMTP id
 a640c23a62f3a-b8edf1ea493mr956084166b.18.1770732673626; 
 Tue, 10 Feb 2026 06:11:13 -0800 (PST)
Date: Tue, 10 Feb 2026 14:11:12 +0000
In-Reply-To: <20260210145156.108ab292@fedora>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
 <aYsyGAwy4rq-H7Hd@google.com> <20260210145156.108ab292@fedora>
Message-ID: <aYs8gN34IVPQiqLk@google.com>
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
X-Rspamd-Queue-Id: B99B411BBB9
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 02:51:56PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 13:26:48 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >   
> > > > /// The owner of this value must ensure that this fence is signalled.
> > > > struct MustBeSignalled<'fence> { ... }
> > > > /// Proof value indicating that the fence has either already been
> > > > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > > > /// up the proof value.
> > > > struct WillBeSignalled<'fence> { ... }  
> > > 
> > > Sorry, I have more questions, unfortunately. Seems that
> > > {Must,Will}BeSignalled are targeting specific fences (at least that's
> > > what the doc and 'fence lifetime says), but in practice, the WorkItem
> > > backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> > > met, and N > 1 if more than one job is ready). Similarly, an IRQ
> > > handler can signal 0-N fences (can be that the IRQ has nothing to do we
> > > job completion, or, it can be that multiple jobs have completed). How
> > > is this MustBeSignalled object going to be instantiated in practice if
> > > it's done before the DmaFenceWorkItem::run() function is called?  
> > 
> > The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
> > that ensures a specific fence is signalled. If you have code that
> > manages a collection of fences and invokes code for specific fences
> > depending on outside conditions, then that's a different matter.
> > 
> > After all, transfer_to_wq() has two components:
> > 1. Logic to ensure any spawned workqueue job eventually gets to run.
> > 2. Once the individual job runs, logic specific to the one fence ensures
> >    that this one fence gets signalled.
> 
> Okay, that's a change compared to how things are modeled in C (and in
> JobQueue) at the moment: the WorkItem is not embedded in a specific
> job, it's something that's attached to the JobQueue. The idea being
> that the WorkItem represents a task to be done on the queue itself
> (check if the first element in the queue is ready for execution), not on
> a particular job. Now, we could change that and have a per-job WorkItem,
> but ultimately, we'll have to make sure jobs are dequeued in order
> (deps on JobN can be met before deps on Job0, but we still want JobN to
> be submitted after Job0), and we'd pay the WorkItem overhead once per
> Job instead of once per JobQueue. Probably not the end of the world,
> but it's worth considering, still.

It sounds like the fix here is to have transfer_to_job_queue() instead
of trying to do it at the workqueue level.

> > And {Must,Will}BeSignalled exists to help model part (2.). But what you
> > described with the IRQ callback falls into (1.) instead, which is
> > outside the scope of {Must,Will}BeSignalled (or at least requires more
> > complex APIs).
> 
> For IRQ callbacks, it's not just about making sure they run, but also
> making sure nothing in there can lead to deadlocks, which is basically
> #2, except it's not scoped to a particular fence. It's just a "fences
> can be signaled from there" marker. We could restrict it to "fences of
> this particular implementation can be signaled from there" but not
> "this particular fence instance will be signaled next, if any", because
> that we don't know until we've walked some HW state to figure out which
> job is complete and thus which fence we need to signal (the interrupt
> we get is most likely multiplexing completion on multiple GPU contexts,
> so before we can even get to our per-context in-flight-jobs FIFO, we
> need to demux this thing).

All I can say is that this is a different use-case for the C api
dma_fence_begin_signalling(). This different usage also seems useful,
but it would be one that does not involve {Must,Will}BeSignalled
arguments at all.

After all, dma_fence_begin_signalling() only requires those arguments if
you want to convert a PrivateFence into a PublishedFence. (I guess a
better name is PublishableFence.) If you're not trying to prove that a
specific fence will be signalled, then you don't need the
{Must,Will}BeSignalled arguments.

Alice
