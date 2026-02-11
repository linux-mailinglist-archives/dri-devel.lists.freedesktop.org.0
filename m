Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP1UE+hljGkFmgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:20:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEF123CF3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E8310E3A4;
	Wed, 11 Feb 2026 11:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="I95V4l5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03210E3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 11:20:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9wvP52gtz9vBc;
 Wed, 11 Feb 2026 12:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770808801; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyD+2ATM9NoCWFlgtOgiTkdsssKuDn3OmQ6kuJKWcKs=;
 b=I95V4l5tlpC6ZDniN6BxoEUybUSt1UBZuH3N2rnPdzX+rEG82IEvuJ1tORXfuXC/xqT+rG
 7Obw5bIramSh2OJXyk8K0cHsSO2/NfsBNdJu80O8Ows7G/NSjKlBAbTeaUgMzta+UclLdv
 GpULim0qMHxvGtCY+nA4KaXL7E8jL7a1gAU33Enw84oroTf8tODg/yUwsqnqqgYhToTyVg
 XbrtdvIp24RBWEHHJjV4ih7EgTmb/mxd9Cqtmrxy+rO3ZQI3CJaVPh486FK9kCQF79Abgf
 CFp+RCzESkM6oBQFVOx7/YQ3P/TunmLIFVctkuyiwXCKkY0lzZDvRL6x2y87+Q==
Message-ID: <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 12:19:56 +0100
In-Reply-To: <20260211120742.0e9e7122@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: wfa8wetjy5hckf9yhr1pezh8hkujsg1x
X-MBO-RS-ID: ccf7d9f4b3d04bfc014
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim,mailbox.org:email]
X-Rspamd-Queue-Id: B8EEF123CF3
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 11:47:27 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > > =C2=A0=20
> > > > +/// A jobqueue Job.
> > > > +///
> > > > +/// You can stuff your data in it. The job will be borrowed back t=
o your driver
> > > > +/// once the time has come to run it.
> > > > +///
> > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (owners=
hip transfer).
> > > > +/// You can set multiple [`DmaFence`] as dependencies for a job. I=
t will only
> > > > +/// get run once all dependency fences have been signaled.
> > > > +///
> > > > +/// Jobs cost credits. Jobs will only be run if there are is enoug=
h capacity in
> > > > +/// the jobqueue for the job's credits. It is legal to specify job=
s costing 0
> > > > +/// credits, effectively disabling that mechanism.
> > > > +#[pin_data]
> > > > +pub struct Job<T: 'static + Send> {
> > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
> > >=20
> > > Given how tricky Lists are in rust, I'd recommend going for an XArray=
,
> > > like we have on the C side. There's a bit of overhead when the job on=
ly
> > > has a few deps, but I think simplicity beats memory-usage-optimizatio=
ns
> > > in that case (especially since the overhead exists and is accepted in
> > > C).=C2=A0=20
> >=20
> > I mean, the list is now already implemented and works. Considering the
> > XArray would have made sense during the development difficulties.
>=20
> I'm sure it does, but that's still more code/tricks to maintain than
> what you'd have with the XArray abstraction.

The solution than will rather be to make the linked list implementation
better.

A list is the correct data structure in a huge number of use cases in
the kernel. We should not begin here to defer to other structures
because of convenience.

Btw. lists in Rust being so horrible has been repeatedly a reason why
some other hackers argued that Rust as a language is not suitable for
kernel development.

So getting that right seems more desirable than capitulating.

>=20
> >=20
> > If it were to make sense we could certainly replace the list with an
> > xarray, but I don't see an advantage. The JQ just needs to iterate over
> > the dependencies to register its events on them, and on drop to
> > deregister them perhaps.
> >=20
> > We have many jobs, but likely only few dependencies per job, so the
> > lower memory footprint seems desirable and the XArray's advantages
> > don't come to play =E2=80=93 except maybe if we'd want to consider to a=
void the
> > current unsafe-rawpointer solution to obtain the job, since obtaining a
> > job from an Xarray is far faster than by list iteration.
>=20
> I don't think we need O(1) for picking random deps in a job, because
> that's not something we need at all: the dep list here is used as a
> FIFO.
>=20

Wrong. The dep list here has no ordering requirements at all. JQ does
not care in which order it registers its events, it just cares about
dealing with dep-fences racing.

You could (de-)register your callbacks in random order, it does not
matter.

List and Xarray might be useful for the unsafe related to the
DependencyWaker. There you could avoid a raw pointer by getting the job
through a list iteration or through the hypothetical XArray.

Please take a look at my detailed code comments for DependencyWaker.

>  There's the per-dep overhead of the ListLinks object maybe, but
> it's certainly acceptable. And I don't think cache locality matters
> either, because the XArray stores pointers too, so we'll still be one
> deref away from the DmaFence. No, my main concern was maintainability,
> because managing lists in rust is far from trivial, and as a developer,
> I try to avoid using concepts the language I rely on is not friendly
> with.

This would be a decision with wide implications, as detailed above.

If we were to admit that lists just don't work in Rust, then wouldn't
the consequent decision to remove them all together?

"Lists in kernel-Rust are not supported. Too difficult to maintain.
We're sorry. Use XArray et al. instead :("
