Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OxHFKZ2lGlmEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:09:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B157B14D03C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21F710E4D9;
	Tue, 17 Feb 2026 14:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ArW1OTcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50A810E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:09:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so3811578f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 06:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771337376; cv=none;
 d=google.com; s=arc-20240605;
 b=ioLXVNid3vBSLviBjvzeqnzw4YpXH0UzU5fcbndLjwYWrBAjZtPlWPa2smDEjJQ5GT
 6B5oJr2GTDVp5YZdQX5NbXHXLwoVYHYjcoxz3LPCRtIBpWyYIdVOGMu94v5XyZrlw/mv
 X8GypNdngB126azEH6aLl2Tp6xFAPPwHirrsBAe+JYYnE+p/LHhIvYau3v6uO64OwmoC
 t+OTClrFjFhstPkFyjSlOdu9tp4PCDUWFYx947pD53cpqHKIbKoIVZD6CUCKpQQ8/WLw
 RvZ2xM3UtpJh5yPu3zvAWTgHz9zbCxxfdaFkH7ydtGRXZ1Ve95UGPH19CTL2bSijSMo4
 z7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
 fh=cn/Xy84fHEXGLuAMmrGvVjL3nr5CTjRiiNOJGTG6VyY=;
 b=WkUOdxj1n8trmfCrlcrbTV0eajoMx1qgkcfuKDb7ySk0tmO4RgRfzIn4VNP1WFzwBf
 VMS6N8m0v0RqzkSjS9B804wS07lCYTjCtfYqJrnoSWy0/+5JqO7pCY8xIIZwaHZm5QJF
 Y0VL3qF2nWHB4tseUveOsWcmzA5r6+eI9S6M8v9NwNTN4bqEwYugGdHlv+EuoZ43SMBk
 v26nuvwqBqAOQNXqzrcbfxkdrLbEiOiUdPlOkmNPcMdnsb1oJLMKgmd9CmHvhaWvT6EG
 4o6pGgqriExi+4bFsQR8ujQPxnYuxQcWRyStBp8PnjDmLny42UkQiJZ3n7sVFhzZTKDb
 zeYQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771337376; x=1771942176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
 b=ArW1OTcZJuohHgtZMVY8OQ6F36xwwTHi5SN9NTLZeIrrFC/Ndlti6Kf4Sh+uRvN3VL
 ilyH0hR3aYBC1KL0GMFizkRlHPV0r2jMoQzeu8qcBHXTEyvkPDcDrsdwK+9UBnP/QPGs
 3PPQ/shEE5Swd2TbjjnbdQsvzqLGHAhg6mhKOiJXQiJbpx73NrrqwwQcZLrtNSLbWC1t
 5ws281kDmaX8ka9cnTCqRzANH6UI2gZ3zs4/sbEpmOR8/yFlYdr1XNO54gjrCyDfKqeZ
 CIR1BhYBau2tdxhursdAAxMCy7mVk3fBLMqe5hg9+Kl44PEiQ72sxN6GH+EpKxmjQebQ
 Ptng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771337376; x=1771942176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kw7EHh8fCVhoh+y7PD5pWqu1yarVszXOXmD3HacviCg=;
 b=llQTAvE7TO17iRe2YY1SQU7u6Ph3JMNQ3Bd6QBy/WseW9uvJv/9tDJBvLhAIOpXJNK
 LL6JHXNKzZbFaS9i1Cs/xMEbKCWiQP7lyj8MQ8Ecc1iiLlzdAljDcMHCTa+KJ576Fnch
 +wkxuu21MIzk+5fFdqPdIiZ6Py7zI1u5nVWMB+Kyve410dDGSok6kMJBqFQ0cMkml6JB
 3lDSx3DWGPt4BGwzWuef+Cj4dNNVAUeRLEXps/+J/lCY4L6AkcKA725rMNQBdRfvo/xp
 upWhuOWZWe8T8zFx04iwhsmk0bmgPGSUC6Htvctk5Dyfq5+n3NAP83xn65xWoQbml3BE
 oc3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHEiGF2g7mvakmBky88YL4qU7G6AjMc9tmxT3LeZMNxgwRyT2zZEXfwdi4fKDknem6gi38RbYYq2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykGAC3duMaF9kNKbspmB1w3FkIAicKxdC4zdAtspdZ17cF1F5J
 WbKB4fwBXV1WSC2St6f6u5z6wMTZHtIG5lWyrKqd/PYQwRN4IqHYDe7mCz0yISKcKkavE1OCq5x
 VbxlYRfK13nkZdLvlbfJBflhMPJRqrRe0qhd3ghtZ
X-Gm-Gg: AZuq6aIGYOz2PwRmOux8QNiPyX1HO8oYiMaekcaSDbVCOHyk2rrgz7Lt4QoGZi24CCZ
 ooqqAQtoATeuFxo2JzE1xJtBIMyDoHiN9Xxai/n41Zy5Qzq9tMLUY/VHakPuBMOZskAQxnuhiqY
 Qqji6Dzqo4i0HdqdM/Go2nNX4BBapTs+rg6GJFtiaeoHZJLKMTsmUBex5Jh5ziFRiONMpl/sRtX
 0G94OpqD/dvoTwDWuZW1+DcEciupa9DRsNlcn/eC5nHJtsQD5MpGsHZsdzxfBN1LgxPKCUmTH44
 Y74uX7YJz6hlvUx53u9Tadw2MVil4Wn2+CrMkgMmhtN5sYqEDlr5YNOlN+FwuFhcNXcTwQ==
X-Received: by 2002:adf:ee07:0:b0:437:6e63:9172 with SMTP id
 ffacd0b85a97d-437978c761amr17248986f8f.4.1771337375424; Tue, 17 Feb 2026
 06:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com> <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
In-Reply-To: <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 15:09:22 +0100
X-Gm-Features: AaiRm50B8Tc9CMv2QWUVjoG3DsZ7EJJzS-cwntAad34iqku_5ZENYYX9qsQjqLg
Message-ID: <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, 
 Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B157B14D03C
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Tue, 2026-02-10 at 16:45 +0100, Christian K=C3=B6nig wrote:
> > On 2/10/26 16:07, Alice Ryhl wrote:
> > > On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian K=C3=B6nig wrote:
> > > > On 2/10/26 14:49, Alice Ryhl wrote:
> > > > > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> > > > > > On Tue, 10 Feb 2026 13:15:31 +0000
> > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > >
> > > > > > > On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wro=
te:
> > > > > > > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > > > >
> > > > > > > > > impl MustBeSignalled<'_> {
> > > > > > > > >     /// Drivers generally should not use this one.
> > > > > > > > >     fn i_promise_it_will_be_signalled(self) -> WillBeSign=
alled { ... }
> > > > > > > > >
> > > > > > > > >     /// One way to ensure the fence has been signalled is=
 to signal it.
> > > > > > > > >     fn signal_fence(self) -> WillBeSignalled {
> > > > > > > > >         self.fence.signal();
> > > > > > > > >         self.i_promise_it_will_be_signalled()
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > >     /// Another way to ensure the fence will be signalled=
 is to spawn a
> > > > > > > > >     /// workqueue item that promises to signal it.
> > > > > > > > >     fn transfer_to_wq(
> > > > > > > > >         self,
> > > > > > > > >         wq: &Workqueue,
> > > > > > > > >         item: impl DmaFenceWorkItem,
> > > > > > > > >     ) -> WillBeSignalled {
> > > > > > > > >         // briefly obtain the lock class of the wq to ind=
icate to
> > > > > > > > >         // lockdep that the signalling path "blocks" on a=
rbitrary jobs
> > > > > > > > >         // from this wq completing
> > > > > > > > >         bindings::lock_acquire(&wq->key);
> > > > > > > > >         bindings::lock_release(&wq->key);
> > > > > > > > >
> > > > > > > > >         // enqueue the job
> > > > > > > > >         wq.enqueue(item, wq);
> > > > > > > > >
> > > > > > > > >         // The signature of DmaFenceWorkItem::run() promi=
ses to arrange
> > > > > > > > >         // for it to be signalled.
> > > > > > > > >         self.i_promise_it_will_be_signalled()
> > > > > > > > >     }
> > > > > > > >
> > > > > > > > I guess what's still missing is some sort of `transfer_to_h=
w()`
> > > > > > > > function and way to flag the IRQ handler taking over the fe=
nce
> > > > > > > > signaling token.
> > > > > > >
> > > > > > > Yes, transfer to hardware needs to be another piece of logic =
similar to
> > > > > > > transfer to wq. And I imagine there are many ways such a tran=
sfer to
> > > > > > > hardware could work.
> > > > > > >
> > > > > > > Unless you have a timeout on it, in which case the WillBeSign=
alled is
> > > > > > > satisfied by the fact you have a timeout alone, and the signa=
lling that
> > > > > > > happens from the irq is just an opportunistic signal from out=
side the
> > > > > > > dma fence signalling critical path.
> > > > > >
> > > > > > Yes and no. If it deadlocks in the completion WorkItem because =
of
> > > > > > allocations (or any of the forbidden use cases), I think we wan=
t to
> > > > > > catch that, because that's a sign fences are likely to end up w=
ith
> > > > > > timeouts when they should have otherwise been signaled properly=
.
> > > > > >
> > > > > > > Well ... unless triggering timeouts can block on GFP_KERNEL
> > > > > > > allocations...
> > > > > >
> > > > > > I mean, the timeout handler should also be considered a DMA-sig=
nalling
> > > > > > path, and the same rules should apply to it.
> > > > >
> > > > > I guess that's fair. Even with a timeout you want both to be sign=
alling
> > > > > path.
> > > > >
> > > > > I guess more generally, if a fence is signalled by mechanism A or=
 B,
> > > > > whichever happens first, you have the choice between:
> > > >
> > > > That doesn't happen in practice.
> > > >
> > > > For each fence you only have one signaling path you need to guarant=
ee
> > > > forward progress for.
> > > >
> > > > All other signaling paths are just opportunistically optimizations
> > > > which *can* signal the fence, but there is no guarantee that they
> > > > will.
> > > >
> > > > We used to have some exceptions to that, especially around aborting
> > > > submissions, but those turned out to be a really bad idea as well.
> > > >
> > > > Thinking more about it you should probably enforce that there is on=
ly
> > > > one signaling path for each fence signaling.
> > >
> > > I'm not really convinced by this.
> > >
> > > First, the timeout path must be a fence signalling path because the
> > > reason you have a timeout in the first place is because the hw might
> > > never signal the fence. So if the timeout path deadlocks on a
> > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boo=
m.
> >
> > Mhm, good point. On the other hand the timeout handling should probably=
 be considered part of the normal signaling path.
>
>
> Why would anyone want to allocate in a timeout path in the first place =
=E2=80=93 especially for jobqueue?
>
> Timeout -> close the associated ring. Done.
> JobQueue will signal the done_fences with -ECANCELED.
>
> What would the driver want to allocate in its timeout path, i.e.: timeout=
 callback.

Maybe you need an allocation to hold the struct delayed_work_struct
field that you use to enqueue the timeout?

Alice
