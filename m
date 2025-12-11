Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2ACB744A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C3C10E89C;
	Thu, 11 Dec 2025 22:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ElOKf1kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A610E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1O7V3uHqYBRFQTCFqzVy63thnPnR5+8cC39VQTSAaE=;
 b=ElOKf1klTVlLgXFX6ktXDb/Ui/XA2ovcSuwhCbvQqrvuOvmLONcXIIiPkM5g6KQZOOAGrV
 H9jjbFdKowuZIyB+0TzDsLN+sbfVoGtIa27QQIaSZ49ojRK/GF8mkY1iBEgWnGTEXkmZ1j
 WuIEsP4ITEygcImbIyDSVnrUOyXudio=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-5S8mVpDwNGuo0DrOuo_peA-1; Thu, 11 Dec 2025 17:09:19 -0500
X-MC-Unique: 5S8mVpDwNGuo0DrOuo_peA-1
X-Mimecast-MFC-AGG-ID: 5S8mVpDwNGuo0DrOuo_peA_1765490958
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8824292911cso13257636d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490958; x=1766095758;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1O7V3uHqYBRFQTCFqzVy63thnPnR5+8cC39VQTSAaE=;
 b=wmB46j+H/+OybC74ZFY2/o8k8U5CjgSBG0vcOjoyJk8yh3WV8pNqZfURbZyOc1GQN1
 h1ZkMjXug6cwUgFzEqVManSnOqutv/cnFjax2JWPAKYKkc9Ms626Mr7fFXxm1zBAAbws
 lVpo5ZaN4aKgJgk3QjEUimvNFF/q6HRIp03mZwv1Ts6OXwfRZrAlMlx2akcfTYB6/ENJ
 CuBwk/COiItl9Mwn47cn3vE8JCPAgg/AF25uNv5TnRsusCMj2N+Qdu4qsYgh4jt7VvZi
 9ur/7Z3UehQLH5tCfise+NFFCgM5IhctHCjgu2HiZNNOML9x0+VNSFoXH+/Nk4j8Jk5Z
 Lcxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV7MoNFAmF7j2l7p20U6wRw4C7/sGNKHKVoSDLdEjln9kCd41qG/SPwpc+3vApvzehHsyCCaJwvWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUzSaonO8EABVg6RJrJM/Dlc4Vcqj3FhJLXhEDjlYO5irUc4lB
 4RCXobGsJ5W9IqKYHwh+N2OkoBfoKFi126ori/V/Nk19mgNzFnlT2S2XVtOVCmp2nS2iQLp4zI1
 KNGxuLNHuVB6WGTCFag/3zNpH92LLhXtu2CmbiHngIQ2/kLCcXhgq/Sva3wvHWQk5nUnpUg==
X-Gm-Gg: AY/fxX7C9y8gaA8oPYCI+exfcK5ufXjq+cnk1wnhK5WxeVRfa84/glk4iDm/J/yY5F0
 aNL4S7kP/V4oBbm6yfAS+6D2xUCBnsiQaIh4ax2FD/Nh3Uvm8OMV7g2AWB1Je667X8IfFAfe5Tp
 2O8nvaXVCxYKgRntJMdfIV9lKI+bt/3yfN1DWBXeZR+BbfkSuw4kgXPn8zDv3ij2dUOYSOUmvUh
 BLUAlScvu1KTiUNVGvrA0JMUT0Pm8ifnJdsvKCGQlH5ZVXCDvCWKv+RjjcTjRsDJ21/fmtsV90d
 A1H+lJ8txRQEnROQQ+oP6nQlLN64mwPMjOJb6Q128c7yRglnLEdHchUlnEoonZ7tKw0AtNB4t5l
 DnO/R7Ld1cdrfS9JA5G4mqv3uE4nBtgr5k/ayjm9b4z4AygRY+k2aHoo=
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id
 d75a77b69052e-4f1bfe7d21cmr49692671cf.41.1765490958499; 
 Thu, 11 Dec 2025 14:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKiMuyVXq1Y18ZPJmxWCrvSzCOmjyB0gpUsQRsIZiL+/Y+mf2tNT73tJxLC2mGV7AoiB82QA==
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id
 d75a77b69052e-4f1bfe7d21cmr49691521cf.41.1765490957363; 
 Thu, 11 Dec 2025 14:09:17 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5665b6fsm314872685a.12.2025.12.11.14.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:09:16 -0800 (PST)
Message-ID: <2f4c3d869a1a47c31fe0c1b387511a33836a9647.camel@redhat.com>
Subject: Re: [PATCH 8/9] gpu: nova-core: use core library's CStr instead of
 kernel one
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:09:16 -0500
In-Reply-To: <20251208-nova-misc-v1-8-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-8-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5CFVyny3w6EiTIxGe6_192qCVBq3sxM2nK84AxBOR5s_1765490958
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:27 +0900, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/firmware.rs=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/nova-core/firmware/gsp.rs | 6 ++++--
> =C2=A0drivers/gpu/nova-core/nova_core.rs=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/nova-core/util.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 ++--
> =C2=A04 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-
> core/firmware.rs
> index 2d2008b33fb4..672f6cd24d4b 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -229,7 +229,7 @@ const fn make_entry_chipset(self, chipset: &str)
> -> Self {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 pub(crate) const fn create(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module_name: &'static kernel:=
:str::CStr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module_name: &'static core::f=
fi::CStr,
> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> firmware::ModInfoBuilder<N> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut this =3D
> Self(firmware::ModInfoBuilder::new(module_name));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut i =3D 0;
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs
> b/drivers/gpu/nova-core/firmware/gsp.rs
> index 0549805282ab..53fdbf1de27e 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -34,10 +34,12 @@
> =C2=A0/// that scheme before nova-core becomes stable, which means this
> module will eventually be
> =C2=A0/// removed.
> =C2=A0mod elf {
> -=C2=A0=C2=A0=C2=A0 use core::mem::size_of;
> +=C2=A0=C2=A0=C2=A0 use core::{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ffi::CStr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem::size_of, //
> +=C2=A0=C2=A0=C2=A0 };
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 use kernel::bindings;
> -=C2=A0=C2=A0=C2=A0 use kernel::str::CStr;
> =C2=A0=C2=A0=C2=A0=C2=A0 use kernel::transmute::FromBytes;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Newtype to provide a [`FromBytes`] implement=
ation.
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-
> core/nova_core.rs
> index b98a1c03f13d..3c26cf0b7c6e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -19,7 +19,7 @@
> =C2=A0mod util;
> =C2=A0mod vbios;
> =C2=A0
> -pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as
> kernel::ModuleMetadata>::NAME;
> +pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as
> kernel::ModuleMetadata>::NAME;
> =C2=A0
> =C2=A0kernel::module_pci_driver! {
> =C2=A0=C2=A0=C2=A0=C2=A0 type: driver::NovaCore,
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-
> core/util.rs
> index 4b503249a3ef..8b2a4b99c55b 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -3,10 +3,10 @@
> =C2=A0/// Converts a null-terminated byte slice to a string, or `None` if
> the array does not
> =C2=A0/// contains any null byte or contains invalid characters.
> =C2=A0///
> -/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> +/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> =C2=A0/// slice, and not only in the last position.
> =C2=A0pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str=
>
> {
> -=C2=A0=C2=A0=C2=A0 use kernel::str::CStr;
> +=C2=A0=C2=A0=C2=A0 use core::ffi::CStr;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 bytes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iter()

