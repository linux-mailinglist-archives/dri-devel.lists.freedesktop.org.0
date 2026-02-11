Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDlFHUuhjGkkrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:33:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0F125B58
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EC910E61E;
	Wed, 11 Feb 2026 15:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="POC5XQwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8A10E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:33:27 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso68935255e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770824006; x=1771428806;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=69uHbckydWaKM9z8QoKV1Sspu6MeiIeZoVRM+AIu30E=;
 b=POC5XQwtJMNNOuuPJWD+aZ1/glIyNf+9rIPq3uAT7cZ4tr/0HvhfL+U6l2/6mavd7f
 M6qXbDj1Xz+wFTFfW5BdvUC/iO69t/E77MI2lOLn3D/D6h/ZMTM2Y7u6+aZc6g3xtt8a
 w7PHeMSH/ajvyQa+OSc319YBlawittW+/eAZt3zo2GyG/FUqGlYEaB4UDIUzTRAE0vqM
 MM3NCohdvkiBmI98gQRRWIjTjAZ26XqIFXKftAghxwb+U4o9KJ5SK2X/PdB37aM3hyxX
 q2Mi9g5euGiBhODkZLnpNsQMiL0Cpj18EmrMFdZbcyRBK8J0vrbVLUxOcyRKraWyuUFO
 IL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770824006; x=1771428806;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=69uHbckydWaKM9z8QoKV1Sspu6MeiIeZoVRM+AIu30E=;
 b=GGECd68hTp9ejc0VkVm7C4ouMGwyRd+W5G85cDRNUL5ErG0w4moZYMD9u9rFWycy7D
 lkNQ2y9Je/ow8UJpTjXHPTQjXtuN1xM7JLfP6lQ2D2fpIyeVxDt+hl+6ZBMvbg0T5brf
 IFsJjHPaYSaj8EZ4Who646VybVwwcQAh5MBL+7KJ/YROMX+WIsgJltx/ZwGZAsPhNg02
 WjeukvFGddCNIPtdtGJutGoSfbM26dAJFl6Z319WXlwRAo4fiTWfiochSlaS9PVRf+0l
 yu+KXziwB/UV2x1zMkMaM46oT2vvJsc5W4bB9OVGvP/qwyzJ7inR/MEYCEIBHq6UnEvu
 hsww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAg2npQgsPcBtY19lxj3UUpMOm/HlSoC7U5S5sTXVKWLGHbQMwreLodvR6hWE8rNyOsiJy5Yu7lCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzynndR3jR4jw+98ZQ2UGrwJupxllaFHmUygmJqdqsw0MOZP900
 enKIrcXFQjElQY7GdCG7IDGDlvVeMuk8s2lswTBCtNUzCiXiQvmiduLao0pWycY/xP8toqSlbKj
 7fqvHwFpBw6mH7V3K8g==
X-Received: from wmpf29.prod.google.com ([2002:a05:600c:491d:b0:480:6a27:9ec2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:483:ea6:8767 with SMTP id
 5b1f17b1804b1-4835e2cd408mr35661225e9.36.1770824006380; 
 Wed, 11 Feb 2026 07:33:26 -0800 (PST)
Date: Wed, 11 Feb 2026 15:33:25 +0000
In-Reply-To: <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
Message-ID: <aYyhRThN3F76oiWt@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,gmail.com,ffwll.ch,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: BEF0F125B58
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:45:37PM +0800, Gary Guo wrote:
> On Wed Feb 11, 2026 at 8:22 PM CST, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> >> On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> >> > On Wed, 11 Feb 2026 11:47:27 +0100
> >> > Philipp Stanner <phasta@mailbox.org> wrote:
> >> >=20
> >> > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> >> > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> >> > > > Philipp Stanner <phasta@kernel.org> wrote:
> >> > > > =C2=A0=20
> >> > > > > +/// A jobqueue Job.
> >> > > > > +///
> >> > > > > +/// You can stuff your data in it. The job will be borrowed b=
ack to your driver
> >> > > > > +/// once the time has come to run it.
> >> > > > > +///
> >> > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (o=
wnership transfer).
> >> > > > > +/// You can set multiple [`DmaFence`] as dependencies for a j=
ob. It will only
> >> > > > > +/// get run once all dependency fences have been signaled.
> >> > > > > +///
> >> > > > > +/// Jobs cost credits. Jobs will only be run if there are is =
enough capacity in
> >> > > > > +/// the jobqueue for the job's credits. It is legal to specif=
y jobs costing 0
> >> > > > > +/// credits, effectively disabling that mechanism.
> >> > > > > +#[pin_data]
> >> > > > > +pub struct Job<T: 'static + Send> {
> >> > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> >> > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> >> > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> >> > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> >> > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>=
>,
> >> > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> >> > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> >> > > >=20
> >> > > > Given how tricky Lists are in rust, I'd recommend going for an X=
Array,
> >> > > > like we have on the C side. There's a bit of overhead when the j=
ob only
> >> > > > has a few deps, but I think simplicity beats memory-usage-optimi=
zations
> >> > > > in that case (especially since the overhead exists and is accept=
ed in
> >> > > > C).=C2=A0=20
> >> > >=20
> >> > > I mean, the list is now already implemented and works. Considering=
 the
> >> > > XArray would have made sense during the development difficulties.
> >> >=20
> >> > I'm sure it does, but that's still more code/tricks to maintain than
> >> > what you'd have with the XArray abstraction.
> >>=20
> >> The solution than will rather be to make the linked list implementatio=
n
> >> better.
> >>=20
> >> A list is the correct data structure in a huge number of use cases in
> >> the kernel. We should not begin here to defer to other structures
> >> because of convenience.
> >
> > Rust vs C aside, linked lists are often used in the kernel despite not
> > being the best choice. They are extremely cache unfriendly and
> > inefficient; most of the time a vector or xarray is far faster if you
> > can accept an ENOMEM failure path when adding elements. I have heard
> > several times from C maintainers that overuse of list is making the
> > kernel slow in a death from a thousand cuts situation.
>=20
> I would rather argue the other way, other than very hot paths where cache
> friendliness absolutely matters, if you do not require indexing access th=
en the
> list is the correct data strucutre more often than not.
>=20
> Vector have the issue where resizing requires moving, so it cannot be use=
d with
> pinned types. XArray doesn't require moving because it requires an indire=
ction
> and thus an extra allocation, but this means that if you're just iteratin=
g over
> all elements it also does not benefit from cache locality. Using vectors =
also
> require careful management of capacity, which is a very common source of =
memory
> leak for long running programs in user space Rust.

XArray does benefit somewhat from cache locality compared to a linked
list because you know the address of element i+1 even if you have not yet
retrieved element i, which may enable prefetching to happen.

Alice

> Re: the ENOMEM failure path, I'd argue that even if you *can* accept a EN=
OMEM
> failure path, it is better to not have a failing path that is unnecessary=
.
>=20
> Best,
> Gary
>=20
> >
> > This applies to the red/black tree too, by the way.
> >
> > Alice
>=20
