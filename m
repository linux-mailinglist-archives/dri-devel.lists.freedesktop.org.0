Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMqMONFkc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:08:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409CC758EF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7302D10E2A9;
	Fri, 23 Jan 2026 12:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dKdzzYGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6810C10E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 12:08:46 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b87039c9a43so248057866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769170125; x=1769774925;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=7jX8ZXrxSKTJALGX+caA2iQKaO/aOfktLjQYXK9Gxow=;
 b=dKdzzYGPt7auE4yHbyauSzhqmk3ROLNCQ6NfLG4I6jYqNCvPdjEl1EPqElW8IDS3eA
 KF/ImsAz/IC+NJVkcZHrsj7L2DrW/qrZQebYaCZZPMH0f5ek7oQ6LCUSZjUPkuJgHk2U
 zoc0ZT3CJMP8+EKjFGP/e6PRjk6qVzi3YFaMmYlqJWo2FWIYSPO5xEldyENfa0kIOdgX
 xNu3ucPtR3p2C8pjTnN0pD7BGJ8PZ99ASVYbo2QxaFy1rP7kmPc7BKogdiADgsJdIvtX
 gcY/1UuiBU766GQlsmz+8ZS7fb1zSAwYAg1dHED2TggLWa/MNG82pPngOf4CABKgBYrH
 oRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769170125; x=1769774925;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7jX8ZXrxSKTJALGX+caA2iQKaO/aOfktLjQYXK9Gxow=;
 b=sisXDyV36wE90QhZVuTvEE4Y3Q/x9EaiOSCNKAvyQr9y6xXdfiu7tg6o7Jqu+0umib
 1l0qMqaD8FqZaU2fJc4obvhVGdFTqqJd6AfePv44giyTwspe6oNOHEiZKOXKLvSZilpJ
 avdEmciUrPivOgUZH65rq8pC0iPQha+5X6IAjWC+n6OPZmp8ThJSlsbF/32dE5YJT6tG
 Iwz3i62kgPs564DumCgwwbk+8aKmCMeIZ66TTmHurkQ1zIVyOFhJjgKZHlEWaij8uiB5
 VhOSFkyWiAuNsK2sGAI42owuZO1Evybvd/EFCGGcP+Z7PMWnSy6Uk5KHPJkWi+obiWhe
 by5Q==
X-Gm-Message-State: AOJu0Yzl9sJaXzUQULmKkv9mk24ZArrzsU+P2jJZ/NNKC9Ran1o/sfIJ
 HdkQPn3q/+Zi0qv+DR4mqmeMgXNsSocqGvMCDNLb3dCmOcEJLvrXiknzoL7OLC3JZAR1cMYlNz7
 Y85FvBy9JI/rVUjWrvw==
X-Received: from ejcs19.prod.google.com ([2002:a17:906:2853:b0:b87:76f3:ae34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:da6:b0:b88:dc6:395d with SMTP id
 a640c23a62f3a-b885ae0a0b3mr199959266b.48.1769170124975; 
 Fri, 23 Jan 2026 04:08:44 -0800 (PST)
Date: Fri, 23 Jan 2026 12:08:44 +0000
In-Reply-To: <aXJ1F4e7wdgM83Oo@um790>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <aXJ1F4e7wdgM83Oo@um790>
Message-ID: <aXNkzF2bgaj21OsI@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 409CC758EF
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:05:59AM -0800, Deborah Brouwer wrote:
> On Thu, Jan 22, 2026 at 08:42:02AM +0000, Alice Ryhl wrote:
> > On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> > > Currently these warnings, as errors, are preventing Tyr driver
> > > from building:
> > >=20
> > > error: field `device` is never read
> > >   --> drivers/gpu/drm/tyr/driver.rs:37:5
> > >    |
> > > 36 | pub(crate) struct TyrDriver {
> > >    |                   --------- field in this struct
> > > 37 |     device: ARef<TyrDevice>,
> > >    |     ^^^^^^
> > >    |
> > >    =3D note: `-D dead-code` implied by `-D warnings`
> > >    =3D help: to override `-D warnings` add `#[allow(dead_code)]`
> > >=20
> > > error: fields `mali` and `sram` are never read
> > >    --> drivers/gpu/drm/tyr/driver.rs:196:5
> > >     |
> > > 195 | struct Regulators {
> > >     |        ---------- fields in this struct
> > > 196 |     mali: Regulator<regulator::Enabled>,
> > >     |     ^^^^
> > > 197 |     sram: Regulator<regulator::Enabled>,
> > >     |     ^^^^
> > >=20
> > > error: aborting due to 2 previous errors
> > >=20
> > > Suppress these errors so that the Tyr driver will build.
> > >=20
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> >=20
> > I still don't understand why I couldn't reproduce it myself, but
> > assuming it's not just an 1.80.0 issue, below is my review:
>=20
> I think the problem is not actually the rust compiler version, but commit
> "0242623384c7 rust: driver: let probe() return impl PinInit<Self, Error>"
>=20
> Tyr probe() used to return a fully initialized Pin<KBox<Self>>, so the
> fields existed in an allocated struct which I suppose counted as
> =E2=80=9Creading=E2=80=9D the fields. But now Tyr probe() returns just a =
PinInit
> closure which doesn=E2=80=99t count as reading these fields.

I see.

> > >  drivers/gpu/drm/tyr/driver.rs | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driv=
er.rs
> > > index 2a45d0288825..04c865cb4397 100644
> > > --- a/drivers/gpu/drm/tyr/driver.rs
> > > +++ b/drivers/gpu/drm/tyr/driver.rs
> > > @@ -34,6 +34,7 @@
> > > =20
> > >  #[pin_data(PinnedDrop)]
> > >  pub(crate) struct TyrDriver {
> > > +    #[allow(dead_code)]
> > >      device: ARef<TyrDevice>,
> >=20
> > Let's use #[expect(dead_code)] so we remember to remove this when a use=
r
> > is added.
>=20
> Using #[expect(dead_code)] also fails with 'unfulfilled lint expectation'=
.
> So I could keep #[allow(dead_code)] or maybe just use an underscore
> _driver too with a comment to explain the issue. What do you think?

Ok, let's use _driver for now. If you send a v2, I'll apply it right away.

Alice
