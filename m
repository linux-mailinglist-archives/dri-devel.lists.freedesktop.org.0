Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDisFNZ5jGktpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:45:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C345A12477F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C182D10E55D;
	Wed, 11 Feb 2026 12:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="u6opnOJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6B10E55D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:45:06 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9ynT5mdgz9v04;
 Wed, 11 Feb 2026 13:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770813901; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eK0q2oRVIM++Mlb5yYpDfNReBvcK8zN0dDnqTIrMLnw=;
 b=u6opnOJmLw42PC1zMky4fE0mF2Heyo0Sj+Tjshpxh2XhUfW6CrKZcH443054tFgLXTjmWb
 xgHTtnCIyv+yVuEkRf1Pxxep+8D7EjXnxTh/WUQ9L2ESvSXbONuMxTTE+6f+ihODhTXlLh
 BC8mm9VauOy5SPSse06WvcgPQ7w4wqvL+B2Zlfj3zVtSlhd1xW+TBRca8tiG7hgMgth2+e
 29u6UKosoQ8qZwW7j4MaBL7eK1+/1v4NGwGgjvB2afXHI4Vxv/OJZ1aSgVigSV9M4Tv5dd
 YKr7Jz9rI9KEFqkW8EXYJTHqXHsS6cJp0UuIEJg+9gyAcu+tzE7uvZKHR+Nlbw==
Message-ID: <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 13:44:56 +0100
In-Reply-To: <aYx0a-2eANbM_vnd@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 8hmua1f9tyuawcr647rk5jh5cidxomb4
X-MBO-RS-ID: 5699410d0844e91dd72
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,mailbox.org:email]
X-Rspamd-Queue-Id: C345A12477F
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 12:22 +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> > On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > > On Wed, 11 Feb 2026 11:47:27 +0100
> > > Philipp Stanner <phasta@mailbox.org> wrote:
> > >=20
> > > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > > =C2=A0=20
> > > > > > +/// A jobqueue Job.
> > > > > > +///
> > > > > > +/// You can stuff your data in it. The job will be borrowed ba=
ck to your driver
> > > > > > +/// once the time has come to run it.
> > > > > > +///
> > > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ow=
nership transfer).
> > > > > > +/// You can set multiple [`DmaFence`] as dependencies for a jo=
b. It will only
> > > > > > +/// get run once all dependency fences have been signaled.
> > > > > > +///
> > > > > > +/// Jobs cost credits. Jobs will only be run if there are is e=
nough capacity in
> > > > > > +/// the jobqueue for the job's credits. It is legal to specify=
 jobs costing 0
> > > > > > +/// credits, effectively disabling that mechanism.
> > > > > > +#[pin_data]
> > > > > > +pub struct Job<T: 'static + Send> {
> > > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>=
,
> > > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > > > >=20
> > > > > Given how tricky Lists are in rust, I'd recommend going for an XA=
rray,
> > > > > like we have on the C side. There's a bit of overhead when the jo=
b only
> > > > > has a few deps, but I think simplicity beats memory-usage-optimiz=
ations
> > > > > in that case (especially since the overhead exists and is accepte=
d in
> > > > > C).=C2=A0=20
> > > >=20
> > > > I mean, the list is now already implemented and works. Considering =
the
> > > > XArray would have made sense during the development difficulties.
> > >=20
> > > I'm sure it does, but that's still more code/tricks to maintain than
> > > what you'd have with the XArray abstraction.
> >=20
> > The solution than will rather be to make the linked list implementation
> > better.
> >=20
> > A list is the correct data structure in a huge number of use cases in
> > the kernel. We should not begin here to defer to other structures
> > because of convenience.
>=20
> Rust vs C aside, linked lists are often used in the kernel despite not
> being the best choice. They are extremely cache unfriendly and
> inefficient; most of the time a vector or xarray is far faster if you
> can accept an ENOMEM failure path when adding elements. I have heard
> several times from C maintainers that overuse of list is making the
> kernel slow in a death from a thousand cuts situation.

Interesting. Valid points.

It might be a self-accelerating thing. More people have lists on their
mind because they are so common, with RB trees et al. being relatively
rare, so they instinctively use them, making them more common=E2=80=A6

>=20
> This applies to the red/black tree too, by the way.

Can't fully follow, you mean that RB trees are supposedly overused,
too?


P.
