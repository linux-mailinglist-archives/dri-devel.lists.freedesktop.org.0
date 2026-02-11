Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO3OBH57jGkcpgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:52:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB61248D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FC210E59F;
	Wed, 11 Feb 2026 12:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CKRqHoB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5332110E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:52:10 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-65811f8a102so6062418a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770814329; x=1771419129;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=x3Lbw63yOI0dsAlzCOoI4S/tRd2ag22kVmVpghQuSY8=;
 b=CKRqHoB7OBdSjmFU3kLD/I5ku085GM/FyAbdALmvrxY2jBUtBLdEhP8X29gu1E8R0c
 AnONUpyDxBZFEvNlfXgdO+Qr92T6Zm3RST8rN2yA/FA8Pq/w/f5Gh35aED2ocD6KaenP
 pUxnzBKwaw26N/nX5YgjwsVf5K7hgPOE8MzNSaUJLtigWVtRXXyvBzlEc5RXIgOgnByp
 2yhyx0JeSyS7Hbi8xdb5YjEBsYH7Gxgwdm0O9Rg1RmOiEpklSX+xS67awXqIqj9PqEFf
 sccwPvqO4gbxNHQKpXoK2TELsv9l2UKii4Ao9NYMU+l29EKYF07joclVOvee/RSflFzy
 Sydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770814329; x=1771419129;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x3Lbw63yOI0dsAlzCOoI4S/tRd2ag22kVmVpghQuSY8=;
 b=lzr+eRSAGq6c3TPwrsHYXK2/LOhNYW2tcgm+/Cx9ew7c5j8nlY2NXi3vBdRVB8hEb1
 q4NRpZkRlt2HvFK745huyD3xrcVKH5peIBDYRJ0tSXT5Tfnmz+ZccldmK8djy+HUE0Wd
 osnwh8YAztSTfbmHGt2X0TalymoJcsNSS3M2iWIJNx3bskDZ4pLQuK7RWRCOm2dRUyK/
 DHfpo5IV/6dqLHplmVFREhI5v8P29qeQ3Hhxxu0iIN3zhCPRlHo1AMjnd0n9W4VdwXwg
 6W01KzdvnagGCHjnOelpucSdTS/jsMSRATFlPFSb3cnPSBdJjZISCG839jkY3ZaMrNWY
 GaWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI+tbQaQZsgK3v9JKzGuKxMXWEUbYf8WznSOL6b+M2EQzdLupOuyEB7donE4IvPu/aLycf2aAVGjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbggzgNwoF6OB9oIK5hA7VEFzZd5OqczbuJs9NcHZR/kYAJwmw
 KBXQPtLwe1Y64lVLqoxIDc+FXyP53NgViPC9vk21eL4ClBjwb1Bgxx3KaAQkHXh8ko7Rkem/WJA
 ZxADXxLwpuY6UKJYgcw==
X-Received: from edqh19.prod.google.com ([2002:aa7:c613:0:b0:64d:3c2c:6061])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d3:b0:65a:4209:f83b with SMTP id
 4fb4d7f45d1cf-65a4209f97bmr706226a12.29.1770814328687; 
 Wed, 11 Feb 2026 04:52:08 -0800 (PST)
Date: Wed, 11 Feb 2026 12:52:07 +0000
In-Reply-To: <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com>
 <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
Message-ID: <aYx7d21_hIWP93XW@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 90AB61248D1
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:44:56PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 12:22 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
> > > On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > > > On Wed, 11 Feb 2026 11:47:27 +0100
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > >=20
> > > > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > > > =C2=A0=20
> > > > > > > +/// A jobqueue Job.
> > > > > > > +///
> > > > > > > +/// You can stuff your data in it. The job will be borrowed =
back to your driver
> > > > > > > +/// once the time has come to run it.
> > > > > > > +///
> > > > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (=
ownership transfer).
> > > > > > > +/// You can set multiple [`DmaFence`] as dependencies for a =
job. It will only
> > > > > > > +/// get run once all dependency fences have been signaled.
> > > > > > > +///
> > > > > > > +/// Jobs cost credits. Jobs will only be run if there are is=
 enough capacity in
> > > > > > > +/// the jobqueue for the job's credits. It is legal to speci=
fy jobs costing 0
> > > > > > > +/// credits, effectively disabling that mechanism.
> > > > > > > +#[pin_data]
> > > > > > > +pub struct Job<T: 'static + Send> {
> > > > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>=
>>,
> > > > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > > > > >=20
> > > > > > Given how tricky Lists are in rust, I'd recommend going for an =
XArray,
> > > > > > like we have on the C side. There's a bit of overhead when the =
job only
> > > > > > has a few deps, but I think simplicity beats memory-usage-optim=
izations
> > > > > > in that case (especially since the overhead exists and is accep=
ted in
> > > > > > C).=C2=A0=20
> > > > >=20
> > > > > I mean, the list is now already implemented and works. Considerin=
g the
> > > > > XArray would have made sense during the development difficulties.
> > > >=20
> > > > I'm sure it does, but that's still more code/tricks to maintain tha=
n
> > > > what you'd have with the XArray abstraction.
> > >=20
> > > The solution than will rather be to make the linked list implementati=
on
> > > better.
> > >=20
> > > A list is the correct data structure in a huge number of use cases in
> > > the kernel. We should not begin here to defer to other structures
> > > because of convenience.
> >=20
> > Rust vs C aside, linked lists are often used in the kernel despite not
> > being the best choice. They are extremely cache unfriendly and
> > inefficient; most of the time a vector or xarray is far faster if you
> > can accept an ENOMEM failure path when adding elements. I have heard
> > several times from C maintainers that overuse of list is making the
> > kernel slow in a death from a thousand cuts situation.
>=20
> Interesting. Valid points.
>=20
> It might be a self-accelerating thing. More people have lists on their
> mind because they are so common, with RB trees et al. being relatively
> rare, so they instinctively use them, making them more common=E2=80=A6

Yes, many people assume "list widely used in kernel" implies "list is a
good idea". Unfortunately it is not the case.

> > This applies to the red/black tree too, by the way.
>=20
> Can't fully follow, you mean that RB trees are supposedly overused,
> too?

When I first suggested adding red/black tree abstractions in Rust
several years ago I was told by Greg that I couldn't do it because the
red/black tree was deprecated and no new users should be added.

Later I found that this was more of a not-written-down recommendation
than a full deprecation, and since Rust Binder has codepaths where an
ENOMEM failure path is unacceptable for the map, we did end up adding a
Rust rb tree abstraction after all. But this is where I first heard of
this issue with lists and rb trees.

Alice
