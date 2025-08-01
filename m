Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC19B17F17
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DAA10E0CD;
	Fri,  1 Aug 2025 09:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Vnz6CZlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3E10E0CD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:18:49 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45359bfe631so8477285e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754039927; x=1754644727;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TPJ/V5RI8K47BlVRi/QYNKYG6CvA+YvGWmagXwaMydA=;
 b=Vnz6CZlA7ObxianQpIjkiE5+a96kkEkSSilZpkgR8o4iiv5/VvYfa+bGEXGXLg0I3Q
 28ASuX3XfspCdInQ/qP+VFImTxEgmrStRWFtnlquzcSvUbjdfDAYCtcwGxZDBCMVkS11
 nN8iXeEf7o68xQCgkzp0mnNRLWu4myckdaxIrMXf1+2IqHoX9vdbW529kEKSGJZb703L
 MTUYEBo/EDYOTXKKTGmyayvEdgl4tWKrOPGq5KJMnDNYCUk3QuFjR3AE/5Bht3d2OK/L
 /+7I8Vn9obeNxQpA/uliWxvzy8fCzeGCrjq+OccaRtZP9pw2Olz4LTUWXflTO8bcGU/L
 fJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754039927; x=1754644727;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPJ/V5RI8K47BlVRi/QYNKYG6CvA+YvGWmagXwaMydA=;
 b=j67y//BsDEi/svdDE6bQ0XmBJEiLNnVhOl9YBrwi5TgUubC9YKw9SYtHHUd5wGcnOG
 NfHdKd1IldG9P/dEYMAGu81n4aWDvRTQFWTt0r3ivw9luO/NZd3C7wSYS4IigztIGSgl
 FXmJFCffBkyollexv3qhVk6BSAMr9dY0eG3DcIzGnR60Tmg9sUAJoALJTod/2VmepIyv
 NIqT2gAJJ4MI80zO2xESEZAJVg5A2jfXuLrH/656mnwP4REBJPoHq+HSZmBJn1O9d5T9
 SIhHZ0tXYpUCiNR71PPv8kb5FIWPFeLX4qDeBEXwl0W9bsqVf1Jm6pGjRtMHhbLFdZw9
 +EYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHUnn3C0NhHLKfFdT1kRkkIp9KOWRxCaiR9c8fFZ+WAARmwBXIwRvLDYCT1TzF2Y7xl4k36zNXy2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDGhgGNCzcj/HRqQpQoN3Q3rtYjXFHfv3NpgwT2ss02kQEWKeK
 J5f6MdI5yefkRCiMB1oHhJ0T+31sTCt2ZWbNr05E1SUTSqsZJKNzYj/Yw0YSFK8BaD6Ul1iBrR4
 bARwiWvhGDJxZnk2adw==
X-Google-Smtp-Source: AGHT+IG5NOG6HNujXCAaZiDz9P+DKaUO9EQNwoy/JaT1RYCYpKkIaBQBCpy2nJhwB2K8nNEaJFZ6PYv/FKhZr48=
X-Received: from wmbhj26.prod.google.com
 ([2002:a05:600c:529a:b0:458:a7c9:d6e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e12:b0:456:161c:3d6f with SMTP id
 5b1f17b1804b1-45892b9e2ecmr91292135e9.11.1754039927660; 
 Fri, 01 Aug 2025 02:18:47 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:18:46 +0000
In-Reply-To: <20250731154919.4132-3-dakr@kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-3-dakr@kernel.org>
Message-ID: <aIyGdr8vKV4XE6Io@google.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Thu, Jul 31, 2025 at 05:48:07PM +0200, Danilo Krummrich wrote:
> drm::Device is allocated through __drm_dev_alloc() (which uses
> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> initialized in-place.
> 
> Due to the order of fields in drm::Device
> 
>   pub struct Device<T: drm::Driver> {
>      dev: Opaque<bindings::drm_device>,
>      data: T::Data,
>   }

I'm not convinced this patch is right.

Imagine this scenario: T::Data has size and alignment both equal to 16,
and lets say that drm_device has a size that is a multiple of 8 but not
16 such as 72. In that case, you will allocate 72+16=88 bytes for
Device, but actually the size of Device is 96 because there is 8 bytes
of padding between dev and data.

Alice

> even with an arbitrary large alignment requirement of T::Data it can't
> happen that the size of Device is smaller than its alignment requirement.
> 
> However, let's not rely on this subtle circumstance and create a proper
> kmalloc() compatible Layout.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/drm/device.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3bb7c83966cf..d19410deaf6c 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -5,6 +5,7 @@
>  //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
>  
>  use crate::{
> +    alloc::allocator::Kmalloc,
>      bindings, device, drm,
>      drm::driver::AllocImpl,
>      error::from_err_ptr,
> @@ -12,7 +13,7 @@
>      prelude::*,
>      types::{ARef, AlwaysRefCounted, Opaque},
>  };
> -use core::{mem, ops::Deref, ptr, ptr::NonNull};
> +use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
>  
>  #[cfg(CONFIG_DRM_LEGACY)]
>  macro_rules! drm_legacy_fields {
> @@ -96,6 +97,10 @@ impl<T: drm::Driver> Device<T> {
>  
>      /// Create a new `drm::Device` for a `drm::Driver`.
>      pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
> +        // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
> +        // compatible `Layout`.
> +        let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
> +
>          // SAFETY:
>          // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
>          // - `dev` is valid by its type invarants,
> @@ -103,7 +108,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>              bindings::__drm_dev_alloc(
>                  dev.as_raw(),
>                  &Self::VTABLE,
> -                mem::size_of::<Self>(),
> +                layout.size(),
>                  mem::offset_of!(Self, dev),
>              )
>          }
> -- 
> 2.50.0
> 
