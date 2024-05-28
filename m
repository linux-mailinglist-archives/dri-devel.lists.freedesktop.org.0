Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2DA8D1AA1
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 14:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B2A10E2F8;
	Tue, 28 May 2024 12:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RPuw5AS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2C210E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716897968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLEjYGiTYeLFgoVu4bQs/gBaZOQcM96bm/LzCSVLjfU=;
 b=RPuw5AS7ughNPmCJw+TAHoLVQWGaThHErgsbaebP+Ug8yY29SbNXVR4zgZab6B+6nfOqT2
 2yoXrdOFfJLnos+E3sCQZV51SUxGjc09KM9NXkSNdvSchqCSIsaRNEF8GWfh5jY0oeoNlp
 EzT6L6lve3IbfoCngNfsRcFCEFQM330=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-9CwXtfRnMKer3jS6lMQbsQ-1; Tue, 28 May 2024 08:06:06 -0400
X-MC-Unique: 9CwXtfRnMKer3jS6lMQbsQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-420eed123a2so4954965e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 05:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716897965; x=1717502765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLEjYGiTYeLFgoVu4bQs/gBaZOQcM96bm/LzCSVLjfU=;
 b=tF37MurGtwDZBiBckJFd3DaUIe0x+JvU3t/wSj6nEe10PwEj8vnCOZitmY0Kp85ttz
 EjjGaKl/oK548Fr7Gp6Pe3BfK+IUP0R4ZfV0vWl19EGsjnUtbFiw7PV/JWPfvCS1REFX
 xnLCTjPPwe2xXAEacS+pp13cdccD1ATzV764qaqP0K+TUax8TFVzjtc/E2IHYVnCyOAe
 FKXCnL0NwiDw1/F5fredrgNajjsOKvmA2LmlBvblCXrEm1MpWPKG6brqPqPxE+M6WMd1
 uBoTrdPoxpHf1RmrRjBoSoZ6QaGVQjKF/fnwEuKpYRLHoWmlm71e2e3Vi61BnbN6CDkp
 tTWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaIhlg/AzPA/Z02JXEKmdJ8SlQHTQs3dMpfkBbx1u1ZlBORvuyxmJQgFKN6ZQ3M7ZQHMePcG+CgZ853wx9KqkfQ3x93CtVIUCgA0btKJuk
X-Gm-Message-State: AOJu0YwRm4V5IxCmO4F0AoxPU/lsLemkMIMosP9fY6UoWmAYkx2We02Z
 2/l5mIbPbFrigvbpeNfKnLF09c3hTjPIe1ZOH8rrixWsuz3701zPD6npd4I8ry6mXli5lOyt4O3
 CMvl9abzqjnmRVQ8H6Bi/zyPp84DQxcWYo+C8EtNS9dV6Qv93ZqUWTz77waQIqkD6JQ==
X-Received: by 2002:a05:600c:224e:b0:420:fb99:ed02 with SMTP id
 5b1f17b1804b1-421089b2283mr108674405e9.6.1716897964861; 
 Tue, 28 May 2024 05:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2HiZe7uGe9pWa7Wbq32ofGG4/IWCdspSBizPTMDvPcqYld+XGgRZoH5Gh3MTab962khuH4w==
X-Received: by 2002:a05:600c:224e:b0:420:fb99:ed02 with SMTP id
 5b1f17b1804b1-421089b2283mr108674155e9.6.1716897964409; 
 Tue, 28 May 2024 05:06:04 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210896676bsm141143395e9.4.2024.05.28.05.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:06:03 -0700 (PDT)
Date: Tue, 28 May 2024 14:06:01 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org, russ.weight@linux.dev
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com,
 fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXIqYRu1u3QXeGC@pollux>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240520172422.181763-4-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Luis and Russ,

I just noted I forgot to add you to this patch, sorry for that.

Please find the full series and previous discussions in [1].

- Danilo

[1] https://lore.kernel.org/rust-for-linux/20240520172059.181256-1-dakr@redhat.com/

On Mon, May 20, 2024 at 07:24:19PM +0200, Danilo Krummrich wrote:
> Add an abstraction around the kernels firmware API to request firmware
> images. The abstraction provides functions to access the firmware
> buffer and / or copy it to a new buffer allocated with a given allocator
> backend.
> 
> The firmware is released once the abstraction is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 rust/kernel/firmware.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index b245db8d5a87..e4ffc47da5ec 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -14,6 +14,7 @@
>  #include <kunit/test.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
> +#include <linux/firmware.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
>  #include <linux/pci.h>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> new file mode 100644
> index 000000000000..700504fb3c9c
> --- /dev/null
> +++ b/rust/kernel/firmware.rs
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Firmware abstraction
> +//!
> +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> +
> +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> +
> +/// Abstraction around a C firmware struct.
> +///
> +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> +/// firmware is released once [`Firmware`] is dropped.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> +/// driver_load_firmware(fw.data());
> +/// ```
> +pub struct Firmware(Opaque<*const bindings::firmware>);
> +
> +impl Firmware {
> +    /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
> +    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> +        let fw = Opaque::uninit();
> +
> +        let ret = unsafe { bindings::request_firmware(fw.get(), name.as_char_ptr(), dev.as_raw()) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Firmware(fw))
> +    }
> +
> +    /// Send a request for an optional fw module. See also `bindings::request_firmware_nowarn`.
> +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
> +        let fw = Opaque::uninit();
> +
> +        let ret = unsafe {
> +            bindings::firmware_request_nowarn(fw.get(), name.as_char_ptr(), dev.as_raw())
> +        };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Firmware(fw))
> +    }
> +
> +    /// Returns the size of the requested firmware in bytes.
> +    pub fn size(&self) -> usize {
> +        unsafe { (*(*self.0.get())).size }
> +    }
> +
> +    /// Returns the requested firmware as `&[u8]`.
> +    pub fn data(&self) -> &[u8] {
> +        unsafe { core::slice::from_raw_parts((*(*self.0.get())).data, self.size()) }
> +    }
> +}
> +
> +impl Drop for Firmware {
> +    fn drop(&mut self) {
> +        unsafe { bindings::release_firmware(*self.0.get()) };
> +    }
> +}
> +
> +// SAFETY: `Firmware` only holds a pointer to a C firmware struct, which is safe to be used from any
> +// thread.
> +unsafe impl Send for Firmware {}
> +
> +// SAFETY: `Firmware` only holds a pointer to a C firmware struct, references to which are safe to
> +// be used from any thread.
> +unsafe impl Sync for Firmware {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6415968ee3b8..ed97d131661a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -35,6 +35,7 @@
>  #[cfg(CONFIG_DRM = "y")]
>  pub mod drm;
>  pub mod error;
> +pub mod firmware;
>  pub mod init;
>  pub mod ioctl;
>  #[cfg(CONFIG_KUNIT)]
> -- 
> 2.45.1
> 

