Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HgIO3ovi2lEQgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:15:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78A11B267
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A4910E1AB;
	Tue, 10 Feb 2026 13:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pfOZklSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E767510E1AB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:15:33 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b8db12d8c65so950960466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770729332; x=1771334132;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9VV/JxScsbsZ/xttmVg7Jcxlx8uiC2eXBQsyDkGahJE=;
 b=pfOZklSuTwPDuseoAVFotTl9lmmb9WxyvB0vYyzhAKEnJYIbuh04DdfQW0Sp+xSjbb
 5kERrJ0xOPD5qFoZkW6F/ICFFHoIx3chNiX8rNai0Tf3bITopEI7TEJoel67nvVFy5qe
 czJhHzjTYfcdb43KLI95yPSxPbS5gT+9iqN+ooQLnKYbADlocQluzLHuJzHSxrhDgGb4
 52I9RtH61U9tCVhgpiCjVaLgbN1Pl0CqmFzPsSr4mAfQSijg2BJp6g3iAVBTkbSQbq/N
 gHeTC4OtZsqDsNm4jONvHwQEhuKNJOi7kyB2NdjZm9jsO9dNA0LkJU59brIpvTWZmr8c
 ii4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770729332; x=1771334132;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9VV/JxScsbsZ/xttmVg7Jcxlx8uiC2eXBQsyDkGahJE=;
 b=P3JIMRxClv8kWTwyGQQU73pg5fo92hF0EgnqX2dGnkwnsjvcsOmyb0u15Y0LtYarPD
 PFvzbz35nHXilL4vhsW3ewpNgjp1Wo7DKb0Gop4wg5NJkSOq34ZLVeF0Pwxt+5wM6fLk
 lSTagBsUMtLBwoUqTNuzcyHgBEQeRB5SYt8uN1x/GhZRlDPFyZT0QHgGeWiAD1LCH6mN
 lFn50qjPyqxY97oaL7Cv6U56ZwGuX5rgGUAAVbhhj+6i7cc6T2jJ8dB5b6V7FqaYchz3
 1msXw0D0qaRYFGQfDP2PEF3onixxlm65ZdyglvURYJptknCCNOcK8YQDXbqNcH4SPYZM
 o48A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA7ewpiNdZotc1Nbp7vr/8X28rijFvdr3vZVT6Wj/YOO3t30UGqyMFhch8ttU1MW9jA22TxPBIjvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV1/SoTZrd/3g65Tul35UbbS+MEdx42zCBHum7x3pTEIUgo51w
 jYLA5gwWrVJsy4NhpVruQQxEwmPq7yVpdJncz1TSLAMbwdZHw6nJT6IKcQDZAsxcHK1+SMocM1e
 zJ92G1i240aEcj5JjkA==
X-Received: from ejblc1.prod.google.com ([2002:a17:906:f901:b0:b88:4d07:231])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a15:b0:b88:4e9d:bc63 with SMTP id
 a640c23a62f3a-b8f5438238fmr102094466b.6.1770729332186; 
 Tue, 10 Feb 2026 05:15:32 -0800 (PST)
Date: Tue, 10 Feb 2026 13:15:31 +0000
In-Reply-To: <20260210133617.0a4be958@fedora>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
Message-ID: <aYsvc3Q8h-Gg27-g@google.com>
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
X-Rspamd-Queue-Id: 2F78A11B267
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
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
> > 
> >         // enqueue the job
> >         wq.enqueue(item, wq);
> > 
> >         // The signature of DmaFenceWorkItem::run() promises to arrange
> >         // for it to be signalled.
> >         self.i_promise_it_will_be_signalled()
> >     }
> 
> I guess what's still missing is some sort of `transfer_to_hw()`
> function and way to flag the IRQ handler taking over the fence
> signaling token.

Yes, transfer to hardware needs to be another piece of logic similar to
transfer to wq. And I imagine there are many ways such a transfer to
hardware could work.

Unless you have a timeout on it, in which case the WillBeSignalled is
satisfied by the fact you have a timeout alone, and the signalling that
happens from the irq is just an opportunistic signal from outside the
dma fence signalling critical path.

From dma-fence.c:

 * * The only exception are fast paths and opportunistic signalling code, which
 *   calls dma_fence_signal() purely as an optimization, but is not required to
 *   guarantee completion of a &dma_fence. The usual example is a wait IOCTL
 *   which calls dma_fence_signal(), while the mandatory completion path goes
 *   through a hardware interrupt and possible job completion worker.

Well ... unless triggering timeouts can block on GFP_KERNEL
allocations...

Alice
