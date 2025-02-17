Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B96A38E32
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 22:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B3A10E03F;
	Mon, 17 Feb 2025 21:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ufx33ohB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4110E293;
 Mon, 17 Feb 2025 20:48:07 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3092643f4aaso26412331fa.1; 
 Mon, 17 Feb 2025 12:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739825285; x=1740430085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBnEtgDXrS3Iq43NK/WiujJi82KZNp8oMdM7dL15NAw=;
 b=Ufx33ohBvOTYxjorvZ7pTrayR61R7zYu73lohCxVSxWtnVto3NDNOW0RYcdFXR72vs
 TjKYbZ1VgREm0BcLl/wAP761smNHBHSg0UDgZOZHbA8ogko4tzE/fG3xDXZJ9d/twvpO
 pvRifFq6nDSngJsdnDjNqcyRmS1q7gX1euROhNqk8Xzmkc/aJ9b38ECiSDN05uO0Xb0c
 jr5UURPUsEioQqCLULTOGGqnLHO3DOP7RtxACyvBx00Y7CPPSOv3qp4EEQVNkgpaEZfn
 PSdvylSGeC62bwkbEb4WC2dWjqC0gG9oCNZ48tQ9yzwTmbGaACoBldtZp6qUJvIRyEMb
 rr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739825285; x=1740430085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBnEtgDXrS3Iq43NK/WiujJi82KZNp8oMdM7dL15NAw=;
 b=qAbhjwdxTTS1DtCiUxMY8Qw4uNe0dd2vP9r4LUTPdiBT1kFx0MtvcnfeCziMdrX3UH
 cZtGITt3UNxPZv1xvkjQ6ne7EErCiQNSDEgZcOe/3hL7yimdKUm2eu3L9R8EksHgr2m1
 iFClXM0HFarSpN3d+D4gNadheg9UwWlrhGWRfoS8qkygC7u3DHa+pA8E/yg6HCGd9PZM
 /FcS4UMUSlyMaSLgygeDSE+ktaSNNDaeHHTwbu8vd0UYp5lJIjNj59J/5KzC1mALsmix
 N16dIyegl6Q5RpsaOcivJ/sCj5E8QIJNqGGI7a0PMT5FBlkQRwJe8sZlxmYXU/KDXbvl
 GQfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJlv3pMiFgcIyh4fPNWfhxIZRwPqQafOGq4WW4LyBdk2iWPNMZ3+FXX5SNXaJM0vkyW4Z+dmQ1zg==@lists.freedesktop.org,
 AJvYcCW7RkXyyzNOeYZ+o7+lsVC6cU1WttnAxfjEMy1n/oWaxIU2jxtSDAYW8Y6R/hNTyeI+KAp+AHSQSlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/rIUvSb1XZkroqvQam7Tpvlo7MUCSXEIcMp4wdplhNkk/qAJg
 HfgvJhLtzTwW02SW2cCimlotz2qzqsoFJS9kMn2ie3p/h64oHcGmsX62ejnLlr+BBjk9rrn3Tyb
 KsHMQg66Szrh/16wLccPhH5Gsnwk=
X-Gm-Gg: ASbGncseode7crOKuXK2iEPe+LAVdTV4tNxUQZcjq9+nl5tof8F7bedHh62l1KxmQoJ
 UJpcg9E/HuPgPe5PJmDGCXo0/rpuzhjMP9woMJECdptrkdGIRvjXN37gTgS4jxiAvQMrMFD0=
X-Google-Smtp-Source: AGHT+IE2HIK55IZ0WC8oiPzUGf3+qIkZjooYuFgwlxN7ic0lMuYmKdXdCrYqMbDIIPjb16hn+uYvN37aRRh2Mmw54r8=
X-Received: by 2002:a2e:8615:0:b0:309:1f1a:276b with SMTP id
 38308e7fff4ca-309288dd3d9mr24735151fa.10.1739825285303; Mon, 17 Feb 2025
 12:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
In-Reply-To: <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Mon, 17 Feb 2025 21:47:29 +0100
X-Gm-Features: AWEUYZkhMupaOKDqUFGG02klV236GSJkG6vgCUJ5hwk1HNdZbu8uVT8mYAd_O24
Message-ID: <CAA76j90OV5OpCVLGFrGVL4-DRSFreZDj8FUmx_nkOq9HL1x2cQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Feb 2025 21:39:50 +0000
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

On Mon, 17 Feb 2025 at 15:07, Alexandre Courbot <acourbot@nvidia.com> wrote=
:
>
> It is common to build a u64 from its high and low parts obtained from
> two 32-bit registers. Conversely, it is also common to split a u64 into
> two u32s to write them into registers. Add an extension trait for u64
> that implement these methods in a new `num` module.
>
> It is expected that this trait will be extended with other useful
> operations, and similar extension traits implemented for other types.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444be=
3e03878650ddf77 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -59,6 +59,7 @@
>  pub mod miscdevice;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f506605=
80dc4c5683f8c2b
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// Useful operations for `u64`.
> +pub trait U64Ext {
> +    /// Build a `u64` by combining its `high` and `low` parts.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89=
abcdef);
> +    /// ```
> +    fn from_u32s(high: u32, low: u32) -> Self;
> +
> +    /// Returns the `(high, low)` u32s that constitute `self`.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x89=
abcdef));
> +    /// ```
> +    fn into_u32s(self) -> (u32, u32);
> +}
> +
> +impl U64Ext for u64 {
> +    fn from_u32s(high: u32, low: u32) -> Self {
> +        ((high as u64) << u32::BITS) | low as u64
> +    }
> +
> +    fn into_u32s(self) -> (u32, u32) {
> +        ((self >> u32::BITS) as u32, self as u32)
> +    }
> +}
>
> --
> 2.48.1
>
>
Looks good :)
Reviewed-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
