Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C0CB7456
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37A10E8B0;
	Thu, 11 Dec 2025 22:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WQlYr31J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450C810E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765491023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
 b=WQlYr31J9+DfHBEXABsbaAdlzl6OysVjKum856vN4OCRsQAS34T4bd2ksjlveurEHpMe4F
 VuadNr8gP7ja/zBtDF687OlvYUnh8NUKp/bvYHolgJAYHtoqmF6E1o+M+OnahxFIpxZWeP
 h/2Vt9omDyoJ5h+0MXsv2bZHdcqcmBk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-Yi6KqvqGNM-Yo6QZJJ8hnw-1; Thu, 11 Dec 2025 17:10:21 -0500
X-MC-Unique: Yi6KqvqGNM-Yo6QZJJ8hnw-1
X-Mimecast-MFC-AGG-ID: Yi6KqvqGNM-Yo6QZJJ8hnw_1765491020
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b2ad29140so311944f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765491020; x=1766095820;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
 b=emaDNpQ3DRJq2WfzhBmBzYUodJI7SqWDdQycwZXfDXmYSybwDC79UsSDOF/+DeiMDV
 v/R+Ip+I19+55GGBiw3U5VU2jJGrSG463Ul+YGj5fPwHWfVL7g0YKbCGXb/d1rPH9RD4
 QpnzV/QGDJj8AUrV4iToNcf2FKICAAn50m5oy/9kyovFK4jquZvqRaJJmw9j0qo4EJE9
 YJ6+hVs4Fg0zmueh9Bd9f9JVtgC7zJLWnIXjXsNvECppMgPs1ojxT8mo7se1fOoplgIu
 eyjyMeytP+sjMJvue7f3jQNXPf8na3wygFtX8UCLIgkOGXCaDI8duGnjvO3wP50J+L2n
 pUdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjo38RiVKyghAwy0DaycpntcDCS2DdkBulaxpgYjPUT8B1L03ZtKveM3KHef76v5dafusnFewD9/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwydIz2jc9jqdDShl66CfKlmf0PhRZgvyX/J6n6JgvdNqrtcAp6
 S1/NKXO+qp+wf8joys1cPVTIfo3EZPIswvuDBt8rmknDSRThanWxGTUzt/GKNzE9huhlmJXm1YV
 HcDMTM2YgM4yQwNbRznxCAuiCMIZsz/qy+hu4iVa4vqdsw1+M1z+KYFHRcUBpNOGKmu5/ug==
X-Gm-Gg: AY/fxX4AJM6Ub0joyabN2/vrIIziO7xnCrcZW1k1q/3JN715P1f9TjYBJdeRu2DnZeT
 BkW2nwtSJFVfhymAPNKJcg9iHkzBgV0tq85nfpthQLZzxMZ85IfLSZqw9vQtaufFpY41ZXxFZjh
 FhenrXGz32Nn7Z2buzZM8Z69dz6jZbL+13pJfKo/nSAPyUS/OzjKZmUrOoSso1l4sk6FuQNqlbg
 AuCtQhYBTge/p407wLLOINkX/u7BtbUB9pSt2/Hyn9f+AhLaVw2kA8oGEdVx/iOSRCW6LSEw8DC
 ybGGY4swH27to9vDZmyEBNgBXVgDBR39llghIicDQQRsWj5HH+gyxRtoje57XASKeXN4GNVQiCU
 Dl+cJOR1c7YCzUAanpPglcS7yxKgQpBrLG/Hbr25gbgx9EoftaCtk5Zg=
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id
 ffacd0b85a97d-42fa3b1ef32mr7586033f8f.61.1765491020504; 
 Thu, 11 Dec 2025 14:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFusB0V2Lib9x8KFjWMKFfd38tMcGVkGiclpC9vpvKusJCxtLUq3Q5ZipoVVIeu/ntr7EJIkw==
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id
 ffacd0b85a97d-42fa3b1ef32mr7586020f8f.61.1765491020099; 
 Thu, 11 Dec 2025 14:10:20 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a665e3sm8220590f8f.6.2025.12.11.14.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:10:19 -0800 (PST)
Message-ID: <678b25aba2bdb2e08818780f6ae16470e83fb8ff.camel@redhat.com>
Subject: Re: [PATCH 9/9] gpu: nova-core: simplify str_from_null_terminated
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:10:16 -0500
In-Reply-To: <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fwWMKxJt5ahYUFHdghKkfb74DUXCNf0BKYQ5Wfr3rhI_1765491020
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
> The core library's `CStr` has a `from_bytes_until_nul` method that we
> can leverage to simplify this function.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/util.rs | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-
> core/util.rs
> index 8b2a4b99c55b..2cccbce78c14 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -2,15 +2,10 @@
> =C2=A0
> =C2=A0/// Converts a null-terminated byte slice to a string, or `None` if
> the array does not
> =C2=A0/// contains any null byte or contains invalid characters.
> -///
> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> -/// slice, and not only in the last position.
> =C2=A0pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str=
>
> {
> =C2=A0=C2=A0=C2=A0=C2=A0 use core::ffi::CStr;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 bytes
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iter()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .position(|&b| b =3D=3D 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|null_pos|
> CStr::from_bytes_with_nul(&bytes[..=3Dnull_pos]).ok())
> +=C2=A0=C2=A0=C2=A0 CStr::from_bytes_until_nul(bytes)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ok()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|cstr| cstr.to=
_str().ok())
> =C2=A0}

