Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A84IEOpc2nOxwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:00:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604978BC6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5710EB6B;
	Fri, 23 Jan 2026 17:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a9KXvr3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3410EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769187646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
 b=a9KXvr3wE2NshJFHab11VoEFst7r7IXLuEcCt9Bp+2fRePP1tdL2gWRBkv5gPBJ8i64vJJ
 E+F0aUqjIN/lalgjYeVSvE/UTRtSkKVXOZK1bWck1yF1exCxLVUJ4MD5KCGg7WKx55LsZJ
 Q0iKngE8GSiz04Z/Qe8R7grzmfH4tas=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-fSYT52XVP76idCB4iZ4pBg-1; Fri, 23 Jan 2026 12:00:45 -0500
X-MC-Unique: fSYT52XVP76idCB4iZ4pBg-1
X-Mimecast-MFC-AGG-ID: fSYT52XVP76idCB4iZ4pBg_1769187645
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c538971a16so661850285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769187645; x=1769792445;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
 b=tUDRSnWsEVcbWxQGbRm10NqB3EOC0q5EkwlQd3Rqt0uKaP3VU6upBiddMLkyQTtkg+
 dg9+bUbDHFPq30U2+cl2/p0HjNwJcts25JnEEeVQUt0x67qSaQn4CWLy2oMJWLQB8/Zv
 pp98W+I76ZNTCw4TI51+MpSjjvPlH/lE8M5tSRCmCWuNWg2tvgXByueD2DOwMwBM4GDP
 17qjhYzM8bcbl4YSx1DE1p5PCi51v5D8ZuXX/lQp9kiJSKVVpqAqa09+yd5oRmeNwgOe
 tZkREoZktrLYe/1hBKXphbuXfpb79XEutsxu4SR+4S3rFOo4lKv3C/KzMshkLaYC/gn3
 bnTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvoHphHODgHsLxIIsIW7hEibCcbtccLy/NLQa0E/Y+kCtDR2o3KFsJmX+sucu75YR0V5TCl8Op54w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynqN2P4vpJFZpjUxc0LK78MKTwDoa8c5xarr2dY/SO4ZmY7znt
 KqdQEgRlXbDjpWNsUwwPUnO0BU6ChoN11G0dedYSJmv2cPVyjRTi53W1bvn6C1Dmu3kwJqE/Gpe
 K6eBFk7CY6tvTEbDPeVV4Ek0zr/PnrVF/Tl6Zipg3D6sePOaiYSIlAzQedRuIVqOLkKXc7Q==
X-Gm-Gg: AZuq6aKFWQ/Bv26uJtKFdmXn+S2N4DCsf7HGuEnsGIUasuw4o3JqkEUfFA2dFdBymro
 wS5XQMhypjLf2y/5RDTtlpbdxDH34sz8YUo85Zur1AkVmLoeRh1c1Ln9WV0l1iQLEVuV4Pwp0vw
 d3GiNjFVtuHB8TQXQ+5MieL+ztolHlUDn2Bz8C4pS5njd4UVa2HV0Az5UPUCzEY5s+xLnt7sU3P
 3ZrtuSlyeEXeg4ruBNbuSmEZegY63CBPKeF0HIGMMcJvUEHRcs5qCj7IyyFSZd9ub7Iw08W174l
 TIfHGl+SFDWtw2mTZiuLFLzY58y53rJ4SeHhe/awIyHd0e056RPWlxkQQkqBv7vkQMwn2bVFG5I
 lKieArQ==
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6e2e4c7cbmr393961285a.79.1769187637961; 
 Fri, 23 Jan 2026 09:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6e2e4c7cbmr393887885a.79.1769187633428; 
 Fri, 23 Jan 2026 09:00:33 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8949193add8sm22302406d6.45.2026.01.23.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 09:00:31 -0800 (PST)
Message-ID: <47cbb2bb4462331e5ffa56da488d8ffab9a5fcd7.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Fri, 23 Jan 2026 12:00:28 -0500
In-Reply-To: <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-3-lyude@redhat.com>
 <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pBdcIz7nOOyXSiN3FNJboxVOvRPh0RNG1_lqw7L6NRc_1769187645
X-Mimecast-Originator: redhat.com
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lossin@kernel.org,m:lina+kernel@asahilina.net,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.150];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3604978BC6
X-Rspamd-Action: no action

On Thu, 2026-01-22 at 22:52 -0300, Daniel Almeida wrote:
> > @@ -254,7 +240,15 @@ pub fn new(dev: &device::Device, data: impl
> > PinInit<T::Data, Error>) -> Result<S
> > #[repr(C)]
> > pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0=C2=A0 dev: Opaque<bindings::drm_device>,
> > -=C2=A0=C2=A0=C2=A0 data: T::Data,
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Keeps track of whether we've initialized the de=
vice data
> > yet.
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> Why don=E2=80=99t we make the data a member of the Registered context?

A couple of different reasons. For one: not having it embedded as part
of Device would complicate trying to go from the device's private data
using container_of! to the actual Device struct, which isn't great for
workqueues.

The other much more important reason is that Registered isn't going to
be the only typestate that has access to the driver's private data in
the future.=C2=A0With KMS, nearly all of the modesetting callbacks for a
driver can be invoked before userspace registration. E.g. consider a
modesetting driver that needs to perform a modeset pre-registration so
that the hardware is in a known good state before being exposed to
userspace.

To clarify what this looks like: you'll recall that I made a diagram
showing a high-level overview of the DRM initialization process for the
documentation for DeviceContext. The second stage in that diagram,
which I'm currently calling Init, is the context that we're going to
need to eventually add a typestate for.

FWIW, this is more or less what the flow will look like with this new
context. Indenting indicates calling down to a function from within the
function above

 * UnregisteredDevice::new(d: device::Device) -> UnregisteredDevice<T>
    - // Creates Crtcs, Connectors, etc.
      KmsDriver::probe(d: &UninitializedKmsDevice)
 * // The driver sets stuff up
 * Registration::new_foreign_owned(
   =C2=A0 dev: UnregisteredDevice,
   =C2=A0 data: impl PinInit<T::Data>
   ):
    - // Initialize `data`, so driver data is ready at this point
    - KmsDriver::pre_registration_init(d: &Device<T, Init>)
    - // Perform actual userspace registration

If it wasn't clear too: this means tyr won't really need to do anything
when we add the new DeviceContext typestate :)

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The Driver's private data.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This must only be written to from
> > [`drm::Registration::new`].
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<C>,

