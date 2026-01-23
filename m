Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKUDKpn7c2mf0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:52:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E47B454
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D30910E223;
	Fri, 23 Jan 2026 22:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eKbKgfvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEECD10E223
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769208724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
 b=eKbKgfvdhi8+yN+YRpFhNS9YJMCuZfJE/zVcO1dPVZhDpiaMLrm2Uoc1ewwDS0pZOfIrfv
 gHsbAf6miLNAGrlP3GyPk7j3hC6XGxbtkxD9cf6M6LDho+Z+Wq3kHPwIijMsJIQbyc8P3N
 NLIykB8CixZe0s+UlyLB8T6q+yMTUCk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-CbOmEd-jMFOBTVCQnPDWkw-1; Fri, 23 Jan 2026 17:52:03 -0500
X-MC-Unique: CbOmEd-jMFOBTVCQnPDWkw-1
X-Mimecast-MFC-AGG-ID: CbOmEd-jMFOBTVCQnPDWkw_1769208723
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-502a13e3e55so95820941cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769208723; x=1769813523;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
 b=lhjqfxeS90ltqu/P7Q/EpJNdqoKR0/QX6y5m04BnHZyO/pur/aG8T8e4ZinTCM5gMY
 WPvdGoZoYTEMbwilPWPl+hmkS2/VvYc8z/RSl4b41BEhlMPcJLVbOo+L+Liz9aE318L/
 soMXw+OLI6uUgq752EnMAHqae1mXqd+n4TQihaDfBuyuNbgGZDHzic+rcUq2IfXqTCBl
 r7UbcwHGO2yZNLePteD8Zlzp9KxERJI91S8tg57G28/Gqs9PmNTR6QYxDHgkNHt1ONnL
 7rm1GKjNp9gRmTKwA5k8/BJV2s4DBURiacs3K2c6lHCSE3GUyxfVxAcOZ89SoKKLJ7DW
 /D3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6mnmRaSjlkdjQ2jXSsidpdXdsgq9zr0u9XgU89bsJBm7KIB4R5jnmWOtv9y60Cp34BiT4aKd9a3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm+hLJH8viO78raVjwNz7quHfM/qrQL4Pov2LWoWo5g+bVzMHr
 Apuka9pLt4erNkgKLEj3G6A2p4G5aZWZWkU5M11RuTUGySGwqnlrRl3sOBSqdQnaN87Y/dNaQIr
 upEkazdkTfgHN1WJO441SUYueXyxfLkfflhH/8Oi6qK+rywkqpoV9PJrHxRM56LJC3DjUQQ==
X-Gm-Gg: AZuq6aJfAZr0Lz1yjHtnN7AsD1/Ai490Zehv3hxiHBwuMCCmutTtVjigUVT3MYQqnMC
 B6zqrF9gxxJquWZg1Ge54SmcMesANXJOdPrDP1W19VKux0JgDg6OtSE8x7yeiMXnkO52mD+cKJx
 dXyzIydl7QFTwEc0fa2+naAihLij0UXku3a36Yx8hmzH1mVIH8lB0HmjhVCnSj1bMW0xW52FPwa
 jQ0RQL2dTmqRqwn055Wq9lJ84wzyqedEd8KKaAkUAC8HgdbsuDQeBjyikQZpY/0IoyvdTS7Rvtk
 wkQtEfwu9cE4evehF8P7LtuLFynFVpRX3GOFVqrZWcbqeql4Jdgd1YxNRxFPD7rCrf/p6bgkmQQ
 cI9GgMw==
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id
 d75a77b69052e-502f77d0621mr57859411cf.73.1769208722977; 
 Fri, 23 Jan 2026 14:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id
 d75a77b69052e-502f77d0621mr57859261cf.73.1769208722588; 
 Fri, 23 Jan 2026 14:52:02 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8949bdd0a5asm13002476d6.9.2026.01.23.14.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 14:52:01 -0800 (PST)
Message-ID: <4b46771349a474a3d81c29a6b0cd946071c58d7b.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] rust/drm/gem: Use DeviceContext with GEM objects
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Fri, 23 Jan 2026 17:52:00 -0500
In-Reply-To: <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-4-lyude@redhat.com>
 <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -jyEJXhFjjC9Stautp6VR0SC6b9qopL4g9pU26J4EC4_1769208723
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
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lossin@kernel.org,m:lina+kernel@asahilina.net,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.160];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 276E47B454
X-Rspamd-Action: no action

On Thu, 2026-01-22 at 22:56 -0300, Daniel Almeida wrote:
> > =C2=A0=C2=A0=C2=A0 }
> > }
> > diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> > index 0e81957cf8c28..4c03105e6a817 100644
> > --- a/rust/kernel/drm/device.rs
> > +++ b/rust/kernel/drm/device.rs
> > @@ -163,13 +163,13 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_set: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_drop: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_init: None,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object: T::Objec=
t::ALLOC_OPS.gem_create_object,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::ALLOC_OPS.prime_handle_to_fd,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::ALLOC_OPS.prime_fd_to_handle,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import: T::Object=
::ALLOC_OPS.gem_prime_import,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::ALLOC_OPS.gem_prime_import_sg_table,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::ALL=
OC_OPS.dumb_create,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset: T::Object:=
:ALLOC_OPS.dumb_map_offset,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object:
> > T::Object::<Uninit>::ALLOC_OPS.gem_create_object,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::<Uninit>::ALLOC_OPS.prime_handle_to_fd,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::<Uninit>::ALLOC_OPS.prime_fd_to_handle,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import_sg_table,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::<Un=
init>::ALLOC_OPS.dumb_create,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset:
> > T::Object::<Uninit>::ALLOC_OPS.dumb_map_offset,
>=20
> Why are we specifically going with Uninit here?

I think this was just an assumption that similarly to KMS callbacks,
gem callbacks can also happen before registration. except, that some of
these clearly can't happen before registration - whoops.

But this being said - it doesn't really make any difference what the
DeviceContext is here. The DeviceContext generic here isn't actually
used in any way, nor is it used by the C callback, it's just here
because we have to specify it on the associated type.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_fdinfo: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev_probe: None,
> >=20
> > diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> > index a16605b407159..94ebaf19ac069 100644
> > --- a/rust/kernel/drm/driver.rs
> > +++ b/rust/kernel/drm/driver.rs
> > @@ -110,7 +110,7 @@ pub trait Driver {
> > =C2=A0=C2=A0=C2=A0 type Data: Sync + Send;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to manage memory for this driver.
> > -=C2=A0=C2=A0=C2=A0 type Object: AllocImpl;
> > +=C2=A0=C2=A0=C2=A0 type Object<Ctx: drm::DeviceContext>: AllocImpl;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (client)
> > =C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> > diff --git a/rust/kernel/drm/gem/mod.rs
> > b/rust/kernel/drm/gem/mod.rs
> > index b4199945db378..3af9f52f8eda4 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -8,6 +8,10 @@
> > =C2=A0=C2=A0=C2=A0 bindings,
> > =C2=A0=C2=A0=C2=A0 drm::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Dev=
iceContext,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reg=
istered, //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cImpl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cOps, //
> > @@ -22,6 +26,7 @@
> > =C2=A0=C2=A0=C2=A0 types::Opaque,
> > };
> > use core::{
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomData,
> > =C2=A0=C2=A0=C2=A0 ops::Deref,
> > =C2=A0=C2=A0=C2=A0 ptr::NonNull, //
> > };
> > @@ -33,21 +38,30 @@
> > /// [`DriverFile`]: drm::file::DriverFile
> > pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as
> > drm::Driver>::File>;
> >=20
> > +/// A type alias for retrieving the current [`AllocImpl`] for a
> > given [`DriverObject`].
> > +///
> > +/// [`Driver`]: drm::Driver
> > +pub type DriverAllocImpl<T, Ctx =3D Registered> =3D
> > +=C2=A0=C2=A0=C2=A0 <<T as DriverObject>::Driver as drm::Driver>::Objec=
t<Ctx>;
>=20
> Should this be a follow up patch instead?
>=20
> > +
> > /// GEM object functions, which must be implemented by drivers.
> > pub trait DriverObject: Sync + Send + Sized {
> > =C2=A0=C2=A0=C2=A0 /// Parent `Driver` for this object.
> > =C2=A0=C2=A0=C2=A0 type Driver: drm::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new driver data object for a GEM object=
 of a given
> > size.
> > -=C2=A0=C2=A0=C2=A0 fn new(dev: &drm::Device<Self::Driver>, size: usize=
) -> impl
> > PinInit<Self, Error>;
> > +=C2=A0=C2=A0=C2=A0 fn new<Ctx: DeviceContext>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &drm::Device<Self::Dri=
ver, Ctx>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: usize,
> > +=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error>;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Open a new handle to an existing object, associa=
ted with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn open(_obj: &<Self::Driver as drm::Driver>::Objec=
t, _file:
> > &DriverFile<Self>) -> Result {
> > +=C2=A0=C2=A0=C2=A0 fn open(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) -> Result {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Close a handle to an existing object, associated=
 with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn close(_obj: &<Self::Driver as drm::Driver>::Obje=
ct, _file:
> > &DriverFile<Self>) {}
> > +=C2=A0=C2=A0=C2=A0 fn close(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) {}
> > }
> >=20
> > /// Trait that represents a GEM object subtype
> > @@ -73,9 +87,12 @@ extern "C" fn open_callback<T: DriverObject>(
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is only ever called with =
a valid
> > pointer to a `struct drm_file`.
> > =C2=A0=C2=A0=C2=A0 let file =3D unsafe { DriverFile::<T>::from_raw(raw_=
file) };
> >=20
> > -=C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is specified in the Allo=
cOps
> > structure for `DriverObject<T>`,
> > -=C2=A0=C2=A0=C2=A0 // ensuring that `raw_obj` is contained within a
> > `DriverObject<T>`
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 // SAFETY:
> > +=C2=A0=C2=A0=C2=A0 // * `open_callback` is specified in the AllocOps s=
tructure
> > for `DriverObject`, ensuring that
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `raw_obj` is contained within a `Dri=
verAllocImpl<T>`
> > +=C2=A0=C2=A0=C2=A0 // * It is only possible for `open_callback` to be =
called
> > after device registration, ensuring
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 that the object's device is in the `=
Registered` state.
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 match T::open(obj, file) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(e) =3D> e.to_errno(),
> > @@ -92,12 +109,12 @@ extern "C" fn close_callback<T: DriverObject>(
> >=20
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `close_callback` is specified in the Allo=
cOps
> > structure for `Object<T>`, ensuring
> > =C2=A0=C2=A0=C2=A0 // that `raw_obj` is indeed contained within a `Obje=
ct<T>`.
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 T::close(obj, file);
> > }
> >=20
> > -impl<T: DriverObject> IntoGEMObject for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> IntoGEMObject for
> > Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.obj.get()
> > =C2=A0=C2=A0=C2=A0 }
> > @@ -105,7 +122,7 @@ fn as_raw(&self) -> *mut
> > bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0 unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_=
gem_object)
> > -> &'a Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `obj` is guarante=
ed to be in an `Object<T>` via
> > the safety contract of this
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T>, obj)
> > }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T, Ctx>,
> > obj) }
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > @@ -122,7 +139,7 @@ fn size(&self) -> usize {
> > =C2=A0=C2=A0=C2=A0 fn create_handle<D, F>(&self, file: &drm::File<F>) -=
>
> > Result<u32>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut handle: u32 =3D 0;
> > @@ -137,7 +154,7 @@ fn create_handle<D, F>(&self, file:
> > &drm::File<F>) -> Result<u32>
> > =C2=A0=C2=A0=C2=A0 fn lookup_handle<D, F>(file: &drm::File<F>, handle: =
u32) ->
> > Result<ARef<Self>>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > @@ -177,16 +194,18 @@ impl<T: IntoGEMObject> BaseObject for T {}
> > ///
> > /// # Invariants
> > ///
> > -/// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * Any type invariants of `Ctx` apply to the parent DRM device
> > for this GEM object.
> > #[repr(C)]
> > #[pin_data]
> > -pub struct Object<T: DriverObject + Send + Sync> {
> > +pub struct Object<T: DriverObject + Send + Sync, Ctx:
> > DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0 obj: Opaque<bindings::drm_gem_object>,
> > =C2=A0=C2=A0=C2=A0 #[pin]
> > =C2=A0=C2=A0=C2=A0 data: T,
> > +=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<Ctx>,
> > }
> >=20
> > -impl<T: DriverObject> Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 const OBJECT_FUNCS: bindings::drm_gem_object_funcs =
=3D
> > bindings::drm_gem_object_funcs {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free: Some(Self::free_callba=
ck),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: Some(open_callback::<T=
>),
> > @@ -206,11 +225,12 @@ impl<T: DriverObject> Object<T> {
> > =C2=A0=C2=A0=C2=A0 };
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver>, size: usiz=
e) ->
> > Result<ARef<Self>> {
> > +=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver, Ctx>, size:=
 usize) ->
> > Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let obj: Pin<KBox<Self>> =3D=
 KBox::pin_init(
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_=
pin_init!(Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 obj:
> > Opaque::new(bindings::drm_gem_object::default()),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data <- T::new(dev, size),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_=
KERNEL,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
> > @@ -219,6 +239,8 @@ pub fn new(dev: &drm::Device<T::Driver>, size:
> > usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { (*obj.as_raw()).fun=
cs =3D &Self::OBJECT_FUNCS };
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT: We use `dev` =
for creating the GEM object,
> > which is known to be in state `Ctx` -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that the GEM ob=
ject's pointer to the DRM
> > device is always in the same state.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_result(unsafe {
> > bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size)
> > })?;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We will never mov=
e out of `Self` as `ARef<Self>`
> > is always treated as pinned.
> > @@ -232,13 +254,15 @@ pub fn new(dev: &drm::Device<T::Driver>,
> > size: usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Returns the `Device` that owns this GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver> {
> > +=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver, Ctx> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `struct drm_gem_object.=
dev` is initialized and valid
> > for as long as the GEM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 object lives.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - The device we used for =
creating the gem object is
> > passed as &drm::Device<T::Driver> to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 Object::<T>::=
new(), so we know that `T::Driver` is the
> > right generic parameter to use
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 here.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - Any type invariants of=
 `Ctx` are upheld by using the
> > same `Ctx` for the `Device` we
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 return.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drm::Device::from_r=
aw((*self.as_raw()).dev) }
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > @@ -264,7 +288,7 @@ extern "C" fn free_callback(obj: *mut
> > bindings::drm_gem_object) {
> > }
> >=20
> > // SAFETY: Instances of `Object<T>` are always reference-counted.
> > -unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted
> > for Object<T> {
> > +unsafe impl<T: DriverObject, Ctx: DeviceContext> AlwaysRefCounted
> > for Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The existence of =
a shared reference guarantees
> > that the refcount is non-zero.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::drm_gem_o=
bject_get(self.as_raw()) };
> > @@ -279,9 +303,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> super::private::Sealed for Object<T> {}
> > +impl<T: DriverObject, Ctx: DeviceContext> super::private::Sealed
> > for Object<T, Ctx> {}
> >=20
> > -impl<T: DriverObject> Deref for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Deref for Object<T, Ctx>
> > {
> > =C2=A0=C2=A0=C2=A0 type Target =3D T;
> >=20
> > =C2=A0=C2=A0=C2=A0 fn deref(&self) -> &Self::Target {
> > @@ -289,7 +313,7 @@ fn deref(&self) -> &Self::Target {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> AllocImpl for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T,
> > Ctx> {
> > =C2=A0=C2=A0=C2=A0 type Driver =3D T::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 const ALLOC_OPS: AllocOps =3D AllocOps {
> > --=20
> > 2.52.0
> >=20
> >=20

