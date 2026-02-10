Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAGxMm/uimmcOwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:38:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365991184C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F17A10E259;
	Tue, 10 Feb 2026 08:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GO1t14Xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D6610E259
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:38:02 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-4376e25bb4dso1289508f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 00:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770712681; x=1771317481;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=eIR/nLMNJopzZi8r6OqBl96KsfB3I1gZxHx9GRbTuCE=;
 b=GO1t14XbjIpdF+FM++6Y7Tck8Ct0rqCGGLk3KwRIGIhFSX8uQXN23PfwmjxcCKpYBg
 DPLJC2WWHEuUbST5jAQo2nkwPzNYd2de9M2PPuMSv076zyiqkWEHnt9uJyDm2UJgY5kC
 yUV+ZnG2GVjzNG2DSUA1Ox4p1KDU6ZS1kdFx8q63ipedWVDYeFu/MFAWm9B/iPKEzho6
 AJlqBeL2P3ypAeR8SwfPy/4KFrrDYCv7JtCqBCCZg1j9F/FMiuJyrl4CRcX4/GhK7fz/
 hXTCAgKuRrZUcqoHxJIirVwVCENfLYxegzJOweTU/ko4Rv6D8MXMLjnxsphkMplKZKwa
 a3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770712681; x=1771317481;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eIR/nLMNJopzZi8r6OqBl96KsfB3I1gZxHx9GRbTuCE=;
 b=hRiOROOW1NATP2Oltt/MKR0i7YVJiHoZ94Y5i4d+FgQpHQsYK6WGLcIX+C9nJ887pn
 Wwbh6h/egj9VJp96apzK6v/KQvGwjspiK4AoUg85rdDKETOXmLZrK1QNTitmGQdx3VcV
 69OfAItMgAJJctHStpTzgxTdZNDtVbLm8CsL4vObUapgezWdhzKBiNp/48YBAjxMfm0k
 ezd66PTcJ1YTLEf9nBByyegFMyveu5BYqNUm0CtZ6PYNdtjqmWxU8Ifgz4GNQWrg42Cv
 lE94GPzTZStaNGhIODyt5k0jsQAbxLe8p4daHeSOXzgoecEa8SfmcISElcZMZbO/96Kt
 79vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKV1SbLuH1cUOI1zpn+NQrno+bUoJVXm6GzEXyl9uP4OQNwjM/+MInt/p0mEdFxLe3ESpwfDS1mfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEFSxtnnFvke2GFaYxtkGI4+xTFA9ujYXQ1eIrTACZ9z2LqBWr
 8Qpc+DOFy64sTw8Yk/YQkQY+sgQsbBbk1BltTiwJS1QmvArCtwQFLnAhuI82TcyDD+avTdld2x3
 rzzIR4c7cfzdbiVwsNg==
X-Received: from wrbeh2.prod.google.com ([2002:a05:6000:4102:b0:437:66b4:44d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2012:b0:437:72d8:7dd7 with SMTP id
 ffacd0b85a97d-4377a5953e0mr1903500f8f.43.1770712681191; 
 Tue, 10 Feb 2026 00:38:01 -0800 (PST)
Date: Tue, 10 Feb 2026 08:38:00 +0000
In-Reply-To: <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora> <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
Message-ID: <aYruaIxn8sMXVI0r@google.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email]
X-Rspamd-Queue-Id: 365991184C9
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:
> On 2/9/26 15:58, Boris Brezillon wrote:
> > On Mon, 09 Feb 2026 09:19:46 +0100
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> >> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> >>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote: =20
> >>>> On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> >>>> Philipp Stanner <phasta@kernel.org> wrote:
> >>>> Unfortunately, I don't know how to translate that in rust, but we
> >>>> need a way to check if any path code path does a DmaFence.signal(),
> >>>> go back to the entry point (for a WorkItem, that would be
> >>>> WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> >>>> Not only that, but we need to know all the deps that make it so
> >>>> this path can be called (if I take the WorkItem example, that would
> >>>> be the path that leads to the WorkItem being scheduled). =20
> >>>
> >>> I think we need a guard object for this that is not Send, just like f=
or any
> >>> other lock.
> >>>
> >>> Internally, those markers rely on lockdep, i.e. they just acquire and=
 release a
> >>> "fake" lock. =20
> >>
> >> The guard object would be created through fence.begin_signalling(), wo=
uldn't it?
> >=20
> > It shouldn't be a (&self)-method, because at the start of a DMA
> > signaling path, you don't necessarily know which fence you're going to
> > signal (you might actually signal several of them).
> >=20
> >> And when it drops you call dma_fence_end_signalling()?
> >=20
> > Yep, dma_fence_end_signalling() should be called when the guard is
> > dropped.
> >=20
> >>
> >> How would that ensure that the driver actually marks the signalling re=
gion correctly?
> >=20
> > Nothing, and that's a problem we have in C: you have no way of telling
> > which code section is going to be a DMA-signaling path. I can't think
> > of any way to make that safer in rust, unfortunately. The best I can
> > think of would be to
> >=20
> > - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
> >   constraints) that's designed for DMA-fence signaling, and that takes
> >   the DmaSignaling guard around the ::run() call.
> > - We would then need to ensure that any code path scheduling this work
> >   item is also in a DMA-signaling path by taking a ref to the
> >   DmaSignalingGuard. This of course doesn't guarantee that the section
> >   is wide enough to prevent any non-authorized operations in any path
> >   leading to this WorkItem scheduling, but it would at least force the
> >   caller to consider the problem.
>=20
> On the C side I have a patch set which does something very similar.
>=20
> It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> signal a DMA fence from an IOCTL, or more specific process context.
>=20
> Signaling a DMA fence from interrupt context, a work item or kernel
> thread is still allowed, there is just the hole that you can schedule
> a work item from process context as well.
>=20
> The major problem with that patch set is that we have tons of very
> hacky signaling paths in drivers already because we initially didn't
> knew how much trouble getting this wrong causes.
>=20
> I'm strongly in favor of getting this right for the rust side from the
> beginning and enforcing strict rules for every code trying to
> implement a DMA fence.

Hmm. Could you say a bit more about what the rules are? I just re-read
the comments in dma-fence.c, but I have some questions.

First, how does the signalling annotation work when the signalling path
crosses thread boundaries? For example, let's say I call an ioctl to
perform an async VM_BIND, then the dma fence signalling critical path
starts in the ioctl, but then it moves into a workqueue and finishes
there, right?

Second, it looks like we have the same challenge as with irq locks where
you must properly nest dma_fence_begin_signalling() regions, and can't
e.g. do this:

c1 =3D dma_fence_begin_signalling()
c2 =3D dma_fence_begin_signalling()
dma_fence_end_signalling(c1)
dma_fence_end_signalling(c2)

Alice
