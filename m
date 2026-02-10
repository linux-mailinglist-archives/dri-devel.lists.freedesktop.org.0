Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGPtDNVJi2l1TwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:08:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1111C441
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A0410E5AA;
	Tue, 10 Feb 2026 15:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BZ66v3tL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860DB10E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 15:08:00 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b844098869cso168338666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770736079; x=1771340879;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=/FhVNp7S2apTNQtAR4dzz+xwyAwezduduteEZBpg878=;
 b=BZ66v3tL/MCXBJT0PEXu56JYFj2XmgpNaZfU5VEtcFxHGk+HXGwO8cpfYcgrEetvxA
 +ZRzudnf+s1AFvqxglohlLR0PtIEHvZtrnfywSG6yWNw+5yVPk6AH2e0IJDRO0+O9/cA
 CTetgLbV9DTAR+gAWp2S23tU4HD40M5pcza9L+dKZxWxgoGsuiF8M5whgG8T/IGw3Ix4
 dwjkAbinCOxaa8nDduxo7aPaeB0+LeiHBm/klnVCSpjXf1q+dL9j8nY1tFBJSsuqD11h
 yswwh4TdNoUWcf1u/HejVgT60Ae7eMnCaTgYz0jgWt87NxF0LBQOlU8c63HSkUBvEvok
 FNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770736079; x=1771340879;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/FhVNp7S2apTNQtAR4dzz+xwyAwezduduteEZBpg878=;
 b=eXCM16ysYCtZvr20RrEEjegmTSosaSpxI2dGvupJXxDQ2cNocILmVAP2XCl15dsUVC
 J3SPKj+maNqkBdVinzu4uXZESoJk+/HK1ZarTvDVw4LEFsiQP5CiLLX9Kp49eGkmkrJE
 qWOGtOn1JdKFP/O4iE+Yt+dSabcAx1M+44rYQtIjm7eV7173Z01tKuDt3jCjmaPCUpjd
 JkbW9L8Kzz17y/v4an5qsX91X3om/pdIa8OSl+m+RMUZVhHWEfy2eUcfCfUkOKDpTBox
 MiS9Ljj94fjUvG/J5KuSNumng4oz1C8o7DgeC9GUH8zCaX6NxFBPfRcJAkOHImvWc+15
 yk4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2qpMm1p0Q6nUMnt3Z72KjPHZsvJEi1Z6/y+LdVNaYmFOPP/XsGnPhKgruWJSd6m5NtAAJuEFx0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz7pnnXRILJVcnCx9YQng6/aShsQp29gD+KxAD8tm7uR45h0cz
 RkkK55ozHWA0fy+oYtM6jIALglJDXMZN4Lcbirkl38LKOVyC3u3AN95/UxW6wR4fbfai8Ihpehp
 Q7KeDkyCVV0rNWpBhpg==
X-Received: from ejdce41.prod.google.com ([2002:a17:907:d2e9:b0:b8e:7975:1950])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:96a3:b0:b87:8172:257 with SMTP id
 a640c23a62f3a-b8edf47dd02mr829999966b.64.1770736079025; 
 Tue, 10 Feb 2026 07:07:59 -0800 (PST)
Date: Tue, 10 Feb 2026 15:07:58 +0000
In-Reply-To: <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Mime-Version: 1.0
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Message-ID: <aYtJznZcCEYBffil@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 77F1111C441
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 14:49, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> >> On Tue, 10 Feb 2026 13:15:31 +0000
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >>
> >>> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
> >>>> On Tue, 10 Feb 2026 10:15:04 +0000
> >>>> Alice Ryhl <aliceryhl@google.com> wrote:
> >>>>  =20
> >>>>> impl MustBeSignalled<'_> {
> >>>>>     /// Drivers generally should not use this one.
> >>>>>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ..=
. }
> >>>>>
> >>>>>     /// One way to ensure the fence has been signalled is to signal=
 it.
> >>>>>     fn signal_fence(self) -> WillBeSignalled {
> >>>>>         self.fence.signal();
> >>>>>         self.i_promise_it_will_be_signalled()
> >>>>>     }
> >>>>>
> >>>>>     /// Another way to ensure the fence will be signalled is to spa=
wn a
> >>>>>     /// workqueue item that promises to signal it.
> >>>>>     fn transfer_to_wq(
> >>>>>         self,
> >>>>>         wq: &Workqueue,
> >>>>>         item: impl DmaFenceWorkItem,
> >>>>>     ) -> WillBeSignalled {
> >>>>>         // briefly obtain the lock class of the wq to indicate to
> >>>>>         // lockdep that the signalling path "blocks" on arbitrary j=
obs
> >>>>>         // from this wq completing
> >>>>>         bindings::lock_acquire(&wq->key);
> >>>>>         bindings::lock_release(&wq->key);
> >>>>>
> >>>>>         // enqueue the job
> >>>>>         wq.enqueue(item, wq);
> >>>>>
> >>>>>         // The signature of DmaFenceWorkItem::run() promises to arr=
ange
> >>>>>         // for it to be signalled.
> >>>>>         self.i_promise_it_will_be_signalled()
> >>>>>     } =20
> >>>>
> >>>> I guess what's still missing is some sort of `transfer_to_hw()`
> >>>> function and way to flag the IRQ handler taking over the fence
> >>>> signaling token. =20
> >>>
> >>> Yes, transfer to hardware needs to be another piece of logic similar =
to
> >>> transfer to wq. And I imagine there are many ways such a transfer to
> >>> hardware could work.
> >>>
> >>> Unless you have a timeout on it, in which case the WillBeSignalled is
> >>> satisfied by the fact you have a timeout alone, and the signalling th=
at
> >>> happens from the irq is just an opportunistic signal from outside the
> >>> dma fence signalling critical path.
> >>
> >> Yes and no. If it deadlocks in the completion WorkItem because of
> >> allocations (or any of the forbidden use cases), I think we want to
> >> catch that, because that's a sign fences are likely to end up with
> >> timeouts when they should have otherwise been signaled properly.
> >>
> >>> Well ... unless triggering timeouts can block on GFP_KERNEL
> >>> allocations...
> >>
> >> I mean, the timeout handler should also be considered a DMA-signalling
> >> path, and the same rules should apply to it.
> >=20
> > I guess that's fair. Even with a timeout you want both to be signalling
> > path.
> >=20
> > I guess more generally, if a fence is signalled by mechanism A or B,
> > whichever happens first, you have the choice between:
>=20
> That doesn't happen in practice.
>=20
> For each fence you only have one signaling path you need to guarantee
> forward progress for.
>=20
> All other signaling paths are just opportunistically optimizations
> which *can* signal the fence, but there is no guarantee that they
> will.
>=20
> We used to have some exceptions to that, especially around aborting
> submissions, but those turned out to be a really bad idea as well. =20
>=20
> Thinking more about it you should probably enforce that there is only
> one signaling path for each fence signaling.

I'm not really convinced by this.

First, the timeout path must be a fence signalling path because the
reason you have a timeout in the first place is because the hw might
never signal the fence. So if the timeout path deadlocks on a
kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.

Second, for the reasons I mentioned you also want the signal-from-irq
path to be a fence signalling critical path, because if we allow you to
kmalloc(GFP_KERNEL) on the path from getting notification from hardware
to signalling the fence, then you may deadlock until the timeout
triggers ... even if the deadlock is only temporary, we should still
avoid such cases IMO. Thus, the hw signal path should also be a fence
signalling critical path.

Alice
