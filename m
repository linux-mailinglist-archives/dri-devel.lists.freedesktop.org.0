Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88A8AC291
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 03:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2B112638;
	Mon, 22 Apr 2024 01:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TSP4LRVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5C9112638
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713750439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yx73zqQ33O64RzGII3neJtJQBGW4x6JXDHVdLNprsMQ=;
 b=TSP4LRVYgDipwBt01rG0DASNyolqwBLzY6EvtauVDVwnfgDXPps7kSb8lPnig0jnXtvOmM
 VCQm7E25OYnXP55oP2eVaHKd7ss2xvJautAIOntfBjNUWNj7NbuIheqX5Q9UBNzsotawa8
 WqpwfX1kTdbL6PEbPvK12IN7G28ys/o=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-pFusUm6MPtOa7mU2bdYVQg-1; Sun, 21 Apr 2024 21:47:17 -0400
X-MC-Unique: pFusUm6MPtOa7mU2bdYVQg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-79071211fbbso132481085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 18:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713750437; x=1714355237;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yx73zqQ33O64RzGII3neJtJQBGW4x6JXDHVdLNprsMQ=;
 b=O9i9X8RfG19ce4qBNpI9JA46Zc0IDqj8vBWU563liaEbY1LKYu77T/5xPuXu4twQmB
 sTBirzTSWYd5DvXNsoJCpKrx9a04QhAV/4s1dl7xeoV2mlx+Y1MApUiazzhAJeQVcV40
 U4mudhXPynqReB13eZGNwVpi5vtZYrlKSeEhZIbf+BAfxkN7iE3SvcUxCX1J3NuRc21x
 r1Oy2AdaWCzM55lEawowy3jT29N1O8nI5kVVAZM94MhWhyuwe1lfyalo5a4L4xnsBQwL
 oN4enBjlFATYZ9RGIaI48qMYhpQ6q67K9KV2X0eNh1896O4qO7J9QFE3Fr/Hl5bGWk2Y
 T0Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTvzZvaXUjOqcu5+nc92omwyYDHdUMGDSugMQmkzB8ALi6YoxtE34/IZ+FUNRJSDGi2o0WIxGt2snjDFyEsTGotDGQndfFi02khBTuEVpO
X-Gm-Message-State: AOJu0YxkrZigva18utxSpTIRYvwxlhj7HetRx0HJkA0Cw4JtZ2CKnYee
 0ix/EdpbHthV8h4ebL6TnwB58O9vzKhusKdCKQYFd84OSSyuV4c9WpajwMscnV6OzNDx/hVscIH
 1sTgJPUGGEY5kYz6s8XraAHj7RzAi2BRU6v6vQJW2y34oyRqga1nFkrq3Ln1v3/MJEQ==
X-Received: by 2002:a05:620a:16d3:b0:78d:4424:b286 with SMTP id
 a19-20020a05620a16d300b0078d4424b286mr9704236qkn.39.1713750436993; 
 Sun, 21 Apr 2024 18:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0oypAvB+arR5uvxvYXe7Ljf37RyOviz88X5auzveVSUU+ahart74vndDVPjmznqguhXiGlQ==
X-Received: by 2002:a05:620a:16d3:b0:78d:4424:b286 with SMTP id
 a19-20020a05620a16d300b0078d4424b286mr9704211qkn.39.1713750436622; 
 Sun, 21 Apr 2024 18:47:16 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a0a4c00b0078d6120fad0sm3870260qka.108.2024.04.21.18.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 18:47:15 -0700 (PDT)
Message-ID: <9fd1fea40f5d053e371bd076d9cb095ba3d77d93.camel@redhat.com>
Subject: Re: [PATCH 1/4] WIP: rust: Add basic KMS bindings
From: Lyude Paul <lyude@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>, dri-devel@lists.freedesktop.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Asahi
 Lina <lina@asahilina.net>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Danilo Krummrich
 <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Date: Sun, 21 Apr 2024 21:47:14 -0400
In-Reply-To: <0785452f-7714-4384-838b-879e0b224c3c@proton.me>
References: <20240322221305.1403600-1-lyude@redhat.com>
 <20240322221305.1403600-2-lyude@redhat.com>
 <0785452f-7714-4384-838b-879e0b224c3c@proton.me>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
Organization: Red Hat Inc.
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

On Wed, 2024-03-27 at 20:50 +0000, Benno Lossin wrote:
> Hi,
>=20
> I just took a quick look and commented on the things that stuck
> out to me. Some general things:
> - several `unsafe` blocks have missing SAFETY comments,
> - missing documentation and examples.

This is really early on - so I had wanted to post a WIP before I
actually wrote up everything to make sure I'm going in the right
direction (I'm certainly not planning on leaving things undocumented
when this is actually ready for submission :).

>=20
> On 22.03.24 23:03, Lyude Paul wrote:
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> > =C2=A0rust/bindings/bindings_helper.h=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0rust/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 ++
> > =C2=A0rust/kernel/drm/device.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0rust/kernel/drm/drv.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 115 +++++++--
> > =C2=A0rust/kernel/drm/kms.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 146 +++++++++++
> > =C2=A0rust/kernel/drm/kms/connector.rs | 404
> > +++++++++++++++++++++++++++++++
> > =C2=A0rust/kernel/drm/kms/crtc.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 300 +=
++++++++++++++++++++++
> > =C2=A0rust/kernel/drm/kms/encoder.rs=C2=A0=C2=A0 | 175 +++++++++++++
> > =C2=A0rust/kernel/drm/kms/plane.rs=C2=A0=C2=A0=C2=A0=C2=A0 | 300 ++++++=
+++++++++++++++++
> > =C2=A0rust/kernel/drm/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A010 files changed, 1448 insertions(+), 16 deletions(-)
>=20
> Please try to break this up into smaller patches. It makes review
> a lot easier!

I'll definitely try to do that next time!

>=20
> [...]
>=20
> > diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> > new file mode 100644
> > index 0000000000000..b55d14415367a
> > --- /dev/null
> > +++ b/rust/kernel/drm/kms.rs
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! KMS driver abstractions for rust.
> > +
> > +pub mod connector;
> > +pub mod crtc;
> > +pub mod encoder;
> > +pub mod plane;
> > +
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 drm::{drv, device::Device},
> > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > +=C2=A0=C2=A0=C2=A0 types::ARef,
> > +=C2=A0=C2=A0=C2=A0 private::Sealed
> > +};
> > +use core::{
> > +=C2=A0=C2=A0=C2=A0 ops::Deref,
> > +=C2=A0=C2=A0=C2=A0 ptr,
> > +};
> > +use bindings;
> > +
> > +#[derive(Copy, Clone)]
> > +pub struct ModeConfigInfo {
> > +=C2=A0=C2=A0=C2=A0 /// The minimum (w, h) resolution this driver can s=
upport
> > +=C2=A0=C2=A0=C2=A0 pub min_resolution: (i32, i32),
> > +=C2=A0=C2=A0=C2=A0 /// The maximum (w, h) resolution this driver can s=
upport
> > +=C2=A0=C2=A0=C2=A0 pub max_resolution: (i32, i32),
> > +=C2=A0=C2=A0=C2=A0 /// The maximum (w, h) cursor size this driver can =
support
> > +=C2=A0=C2=A0=C2=A0 pub max_cursor: (u32, u32),
> > +=C2=A0=C2=A0=C2=A0 /// The preferred depth for dumb ioctls
> > +=C2=A0=C2=A0=C2=A0 pub preferred_depth: u32,
> > +}
> > +
> > +// TODO: I am not totally sure about this. Ideally, I'd like a
> > nice way of hiding KMS-specific
> > +// functions for DRM drivers which don't implement KMS - so that
> > we don't have to have a bunch of
> > +// random modesetting functions all over the DRM device trait.
> > But, unfortunately I don't know of
> > +// any nice way of doing that yet :(
>=20
> I don't follow, can't you put the KMS specific functions into the
> KmsDriver trait?

I can, lol. I realized how that would work a little while after writing
this, so I'm not quite sure where my confusion was with this - so I'll
fix this on the next version I send out.

>=20
> > +
> > +/// An atomic KMS driver implementation
> > +pub trait KmsDriver: drv::Driver { }
> > +
> > +impl<T: KmsDriver> Device<T> {
> > +=C2=A0=C2=A0=C2=A0 pub fn mode_config_reset(&self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The previous bui=
ld assertion ensures this can
> > only be called for devices with KMS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // support, which means mod=
e_config is initialized
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::drm_mode=
_config_reset(self.drm.get()) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +/// Main trait for a modesetting object in DRM
> > +pub trait ModeObject: Sealed + Send + Sync {
> > +=C2=A0=C2=A0=C2=A0 /// The parent driver for this ModeObject
> > +=C2=A0=C2=A0=C2=A0 type Driver: KmsDriver;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Return the `drv::Device` for this `ModeObject`
> > +=C2=A0=C2=A0=C2=A0 fn drm_dev(&self) -> &Device<Self::Driver>;
> > +}
>=20
> [...]
>=20
> > diff --git a/rust/kernel/drm/kms/connector.rs
> > b/rust/kernel/drm/kms/connector.rs
> > new file mode 100644
> > index 0000000000000..88dfa946d306b
> > --- /dev/null
> > +++ b/rust/kernel/drm/kms/connector.rs
> > @@ -0,0 +1,404 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! Rust bindings for DRM connectors
> > +
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 bindings,
> > +=C2=A0=C2=A0=C2=A0 sync::ArcBorrow,
> > +=C2=A0=C2=A0=C2=A0 drm::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drv::{Driver, FEAT_MODESET}=
,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device::Device,
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 types::{AlwaysRefCounted, Opaque, ARef},
> > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > +=C2=A0=C2=A0=C2=A0 init::Zeroable,
> > +=C2=A0=C2=A0=C2=A0 error::{to_result, from_result},
> > +=C2=A0=C2=A0=C2=A0 build_error,
> > +};
> > +use core::{
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomPinned,
> > +=C2=A0=C2=A0=C2=A0 ptr::null_mut,
> > +=C2=A0=C2=A0=C2=A0 mem,
> > +=C2=A0=C2=A0=C2=A0 ptr::{self, NonNull},
> > +=C2=A0=C2=A0=C2=A0 ffi::*,
> > +=C2=A0=C2=A0=C2=A0 ops::Deref,
> > +};
> > +use super::{
> > +=C2=A0=C2=A0=C2=A0 ModeObject,
> > +=C2=A0=C2=A0=C2=A0 ModeConfigGuard,
> > +=C2=A0=C2=A0=C2=A0 encoder::{Encoder, DriverEncoder},
> > +=C2=A0=C2=A0=C2=A0 KmsDriver,
> > +};
> > +use macros::pin_data;
> > +
> > +// XXX: This is :\, figure out a better way at some point?
> > +pub use bindings::{
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_Unknown,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_VGA,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DVII,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DVID,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DVIA,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_Composite,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_SVIDEO,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_LVDS,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_Component,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_9PinDIN,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DisplayPort,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_HDMIA,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_HDMIB,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_TV,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_eDP,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_VIRTUAL,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DSI,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_DPI,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_WRITEBACK,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_SPI,
> > +=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_USB,
> > +};
> > +
> > +/// A DRM connector implementation
> > +pub trait DriverConnector: Send + Sync + Sized {
> > +=C2=A0=C2=A0=C2=A0 /// The return type of the new() function. Should b=
e `impl
> > PinInit<Self, Error>`.
> > +=C2=A0=C2=A0=C2=A0 /// TODO: Remove this when return_position_impl_tra=
it_in_trait
> > is stable.
> > +=C2=A0=C2=A0=C2=A0 type Initializer: PinInit<Self, Error>;
>=20
> This has been stabilized in 1.75.0, so now you should be able to
> write
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 fn new(dev: &Device<Self::Driver>, args: Self::A=
rgs) -> impl
> PinInit<Self, Error>;

Ack for this and the below comment as well!

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The data type to use for passing incoming argum=
ents for
> > new `Connector<T>` instances
> > +=C2=A0=C2=A0=C2=A0 /// Drivers which don't care about this can just us=
e `()`
> > +=C2=A0=C2=A0=C2=A0 type Args;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The parent driver for this DRM connector implem=
entation
> > +=C2=A0=C2=A0=C2=A0 type Driver: KmsDriver;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The atomic state implementation for this DRM co=
nnector
> > implementation
> > +=C2=A0=C2=A0=C2=A0 type State: DriverConnectorState;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Create a new instance of the private driver dat=
a struct
> > for this connector in-place
> > +=C2=A0=C2=A0=C2=A0 fn new(dev: &Device<Self::Driver>, args: Self::Args=
) ->
> > Self::Initializer;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Retrieve a list of available display modes for =
this
> > connector
> > +=C2=A0=C2=A0=C2=A0 fn get_modes<'a>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector: ConnectorGuard<'=
a, Self>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard: &ModeConfigGuard<'a,=
 Self::Driver>
> > +=C2=A0=C2=A0=C2=A0 ) -> i32;
> > +}
>=20
> [...]
>=20
> > diff --git a/rust/kernel/drm/kms/crtc.rs
> > b/rust/kernel/drm/kms/crtc.rs
> > new file mode 100644
> > index 0000000000000..3d072028a4884
> > --- /dev/null
> > +++ b/rust/kernel/drm/kms/crtc.rs
> > @@ -0,0 +1,300 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! KMS driver abstractions for rust.
> > +
> > +use super::{
> > +=C2=A0=C2=A0=C2=A0 plane::*,
> > +=C2=A0=C2=A0=C2=A0 ModeObject,
> > +=C2=A0=C2=A0=C2=A0 StaticModeObject,
> > +=C2=A0=C2=A0=C2=A0 KmsDriver
> > +};
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 bindings,
> > +=C2=A0=C2=A0=C2=A0 drm::{drv::Driver, device::Device},
> > +=C2=A0=C2=A0=C2=A0 device,
> > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > +=C2=A0=C2=A0=C2=A0 types::Opaque,
> > +=C2=A0=C2=A0=C2=A0 init::Zeroable,
> > +=C2=A0=C2=A0=C2=A0 sync::Arc,
> > +=C2=A0=C2=A0=C2=A0 error::to_result,
> > +};
> > +use core::{
> > +=C2=A0=C2=A0=C2=A0 cell::UnsafeCell,
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomPinned,
> > +=C2=A0=C2=A0=C2=A0 ptr::{null, null_mut},
> > +=C2=A0=C2=A0=C2=A0 ops::Deref,
> > +};
> > +use macros::vtable;
> > +
> > +/// A typed KMS CRTC with a specific driver.
> > +#[repr(C)]
> > +#[pin_data]
> > +pub struct Crtc<T: DriverCrtc> {
> > +=C2=A0=C2=A0=C2=A0 // The FFI drm_crtc object
> > +=C2=A0=C2=A0=C2=A0 pub(super) crtc: Opaque<bindings::drm_crtc>,
> > +=C2=A0=C2=A0=C2=A0 /// The driver's private inner data
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 inner: T,
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 _p: PhantomPinned,
>=20
> Instead of adding this field, you can mark the `crtc` field above as
> `#[pin]`. This is because of 0b4e3b6f6b79 ("rust: types: make
> `Opaque`
> be `!Unpin`").
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

