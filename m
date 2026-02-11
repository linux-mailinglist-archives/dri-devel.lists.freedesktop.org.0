Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AoGAExejGmWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3A123955
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE810E03F;
	Wed, 11 Feb 2026 10:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SRA72+b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F4710E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 10:47:35 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f9w9w1fWZz9v0f;
 Wed, 11 Feb 2026 11:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770806852; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5z29sdjoI2pyDdH/AdNiFMZxUo2NeeZNAipSnwq5zw=;
 b=SRA72+b1owHd36VTHquTwabZexBV4RC/kvuGEz3D48A2+Cnj1onNOTs02Ny/9a1T70vkDu
 zCuqD2zQB2hBQ7C5q8g5Wdp/GUx8GVAgBScWV0ee4ruGPCS78rSxIMw1fMtEhYm5+dT190
 zpgWr6vHDgZ2JCDikHlw7WG76LeJO+dcfSwUgrJeDxSFBH3812+GVHJ4atWLhUi8m65+I/
 96tdQq1j09K2rIek/8oFwuF0HzOp1OpM0ryFuvihKg5GffKWcz46b5KVjAUz6MpeVydxTc
 JVflLxiqLbCnpXAijfUXfezL3EmlX7TeKwrkaVqyzI1H6W/dVElYb2E6+wqBKQ==
Message-ID: <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>,  Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 11:47:27 +0100
In-Reply-To: <20260210155750.5cdbe6cc@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e1f3d9352780d436a1a
X-MBO-RS-META: xfo3rdi318f5njketuggfaicofkmdy9d
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
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 57E3A123955
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
>=20
> > +/// A jobqueue Job.
> > +///
> > +/// You can stuff your data in it. The job will be borrowed back to yo=
ur driver
> > +/// once the time has come to run it.
> > +///
> > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ownership =
transfer).
> > +/// You can set multiple [`DmaFence`] as dependencies for a job. It wi=
ll only
> > +/// get run once all dependency fences have been signaled.
> > +///
> > +/// Jobs cost credits. Jobs will only be run if there are is enough ca=
pacity in
> > +/// the jobqueue for the job's credits. It is legal to specify jobs co=
sting 0
> > +/// credits, effectively disabling that mechanism.
> > +#[pin_data]
> > +pub struct Job<T: 'static + Send> {
> > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,
>=20
> Given how tricky Lists are in rust, I'd recommend going for an XArray,
> like we have on the C side. There's a bit of overhead when the job only
> has a few deps, but I think simplicity beats memory-usage-optimizations
> in that case (especially since the overhead exists and is accepted in
> C).

I mean, the list is now already implemented and works. Considering the
XArray would have made sense during the development difficulties.

If it were to make sense we could certainly replace the list with an
xarray, but I don't see an advantage. The JQ just needs to iterate over
the dependencies to register its events on them, and on drop to
deregister them perhaps.

We have many jobs, but likely only few dependencies per job, so the
lower memory footprint seems desirable and the XArray's advantages
don't come to play =E2=80=93 except maybe if we'd want to consider to avoid=
 the
current unsafe-rawpointer solution to obtain the job, since obtaining a
job from an Xarray is far faster than by list iteration.


P.
