Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLGCF+szi2mhRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:34:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A011B3BD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEBE10E0D0;
	Tue, 10 Feb 2026 13:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NXZEZ2Ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CCC10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:34:31 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b8718916c9aso89564066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770730470; x=1771335270;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8/H7jmw8ZJJGOF6KNSe5xcMTZ4QJmclAwWnwXYIlcAk=;
 b=NXZEZ2EffLug06LUbvDniU9D6pw1IpztzjSJPuGGD44SUYgj2aFyVpBwD76yN//p3e
 xv5ZuGudwzMtxho/8lL4L0BksCd7uw6yeRsM3tVfINKR7GzkBq8H5FQDmLbboOctAzZF
 pqAdZI/qKkwdWgJNQZxmyOhO210EJ4lW0ZT8TpGrqu1zkA4fE23xBZWCp/Tv3xgh8nBh
 KceLJXL1Pjx8ERv1skOzBm8UcB5KoNBUnGD81q9HXap7kCXa48vNeXa1XtrzP55Sq66a
 71zUz5wUZQuh8V1vdEwwmxcEq+XX0jEVoe+YE2bt8YbJnW8aVDMxD/rFlyj8y1gpeqK5
 WRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770730470; x=1771335270;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/H7jmw8ZJJGOF6KNSe5xcMTZ4QJmclAwWnwXYIlcAk=;
 b=s+Qdlu5w8xW0yPx1x3F166bkncQPRrYB3zOURQlVzI+paVb7Sy3cFeK6U+Wns3JmHr
 mNdsyfukY0IHCMHLgdS0WztkrDH2h5c4xoIfUxEd+Q82ucP9QKLSZS50zjxREUZityFT
 oAwYIjv+RsubZzAjSmA81DoVhzHV63nLRfY7Ec20+iCYnIRSg5OGD/tlqKQ2jxmgQtvl
 LVAvoxBKlrg53DQSWNCMKusnyYJcKgbgFn/rzTc6sTUOOZrNb6H1o8kZQZUoAcgiYiIP
 35paRZYY6bZUwwCJybQwPUUGQGpgKVSv9WBuRLNZB8RQPUQjrgoCRu4Qdb+8Kn6Ll3Qt
 9tPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQVxGDnYJTqCa3HhXiP78WIP0HCn93vFhQUdOvTpMFIdW+kN3I+Lhg2N6IH2X6fxqQ9wK28sNi6m4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFhe/VtqyeYOg3yE1Ht3X9P+gTQn4acTgt9agIpl0so+cQOgfP
 M/2mWQ+3hExF7nMlPtFcpBNgsqpQjW69N2Px/MFzZ1ewiSDv6lEmZGXF4WhNeyJTVDBWPvHdlS5
 /UU3ujKtlPmLyIbSFKw==
X-Received: from ejbr12.prod.google.com ([2002:a17:906:364c:b0:b88:38ff:1869])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9f85:b0:b8e:4790:d7c7 with SMTP id
 a640c23a62f3a-b8edf175f83mr881079766b.6.1770730469653; 
 Tue, 10 Feb 2026 05:34:29 -0800 (PST)
Date: Tue, 10 Feb 2026 13:34:28 +0000
In-Reply-To: <20260210132147.4d5a491b@fedora>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210123432.588a20f5@fedora>
 <aYsaYBimKUaRA1Gb@google.com> <20260210132147.4d5a491b@fedora>
Message-ID: <aYsz5JKjTrxNPW4w@google.com>
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
X-Rspamd-Queue-Id: AC6A011B3BD
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:21:47PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 11:45:36 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
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
> > > 
> > > Sorry, I'm still trying to connect the dots here. I get that the intent
> > > is to ensure the pseudo-lock ordering is always:
> > >   
> > >    -> dma_fence_lockdep_map
> > >       -> wq->lockdep_map  
> > > 
> > > but how can this order be the same in the WorkItem execution path? My
> > > interpretation of process_one_work() makes me think we'll end up with
> > >   
> > >   -> wq->lockdep_map
> > >     -> work->run()
> > >        -> WorkItem::run()
> > >           -> dma_fence_lockdep_map
> > >              -> DmaFenceSignalingWorkItem::run()  
> > >                 ...
> > > 
> > > Am I missing something? Is there a way you can insert the
> > > dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> > > execution path?  
> > 
> > Conceptually, the dma_fence_lockdep_map is already taken by the time you
> > get to WorkItem::run() because it was taken all the way back in the
> > ioctl, so WorkItem::run() does not need to reacquire it.
> > 
> > Now, of course that does not translate cleanly to how lockdep does
> > things, so in lockdep we do have to re-acquire it in WorkItem::run().
> > You can do that by setting the trylock bit when calling lock_acquire()
> > on dma_fence_lockdep_map. This has the correct semantics because trylock
> > does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.
> 
> Ah, I never noticed dma_fence_begin_signalling() was recording a
> try_lock not a regular lock. I guess it would do then.

Calling dma_fence_begin_signalling() never blocks so 'trylock' is the
right option.


Actually, that raises one question for me. Right now it's implemented
like this:

	/* explicitly nesting ... */
	if (lock_is_held_type(&dma_fence_lockdep_map, 1))
		return true;

	/* ... and non-recursive successful read_trylock */
	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _RET_IP_);

but why not drop the explicit nest check and pass `2` for read instead?

	lock_acquire(&dma_fence_lockdep_map, 0, 1, 2, 1, NULL, _RET_IP_);

Note that passing 2 means that you're taking a readlock with
same-instance recursion allowed. This way you could get rid of the
cookie entirely because you're just taking the lock multiple times, and
lockdep will count how many times it's taken for you.

Alice
