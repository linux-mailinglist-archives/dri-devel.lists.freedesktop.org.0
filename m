Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371F6E0A1E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D43710E135;
	Thu, 13 Apr 2023 09:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBFB10E135
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:24:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-505048d50aeso177557a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681377841; x=1683969841;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=njfKQpwLuv9TM47N/8Q44JKVE3mB36cKGfD6ZSMFaBE=;
 b=EpRabewTf14VvElILrLEJatAS47TvJfs81peIsQ94s+dmaW++3x2x8tODlZ6l1yBtN
 LrT6Bt5U/KEK2PS9WktPnrnreCYGHIFA8GndZ6gMj9DN9AwCUH0Y6U6Szi/LeXl3Cihu
 uOKVavtaRS2RcDiWSbmx8CJSudF/h7SFcuU9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681377841; x=1683969841;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njfKQpwLuv9TM47N/8Q44JKVE3mB36cKGfD6ZSMFaBE=;
 b=W6RmU07GEOuuTANEA1dLuVlqfhgsxUZf7gOOvVqWkA5LPqm9lqPs9/l8wzMGyGN+Xi
 sfk6a+WuqnVV8UGleD0EejnRrspwnysuHFgix4dlcZLxbSIl0n4Tg4oYCE7tIEVNuMcn
 KVZ/2O0ezrZ21AJuVOwdQK5QHHYwCLwn04N/qXQgy0z8eeRZ/fo/4dYagh71Fr/yjA+j
 IHfyxvWAO+7OAyQItE2lvTX6QFgBtJJIPjhflxAoUsd4DAIu+rfdykeQKbxkDWXE8C+a
 nnat1rd3gDKbdjRRGHUksIMeLm31tP/wo692IoaUmiyX95233v+JMJb3WQThA025octh
 ku7A==
X-Gm-Message-State: AAQBX9ch631HMrcO3Y8PCJhrNAWVXVp/HHMQhR7q1aBJ78SDIZYREh/i
 yVvVUfVizgmS5hKZjscTUJgc7Q==
X-Google-Smtp-Source: AKy350YQ6zAXTaLzpC/COJc60JZlW4nm7Tqb3mO4pquC2nITZvuCWwMbff4F81iA5Se0zE8ajB0UhQ==
X-Received: by 2002:a17:906:7297:b0:94a:5f0d:d9d6 with SMTP id
 b23-20020a170906729700b0094a5f0dd9d6mr1671149ejl.4.1681377841465; 
 Thu, 13 Apr 2023 02:24:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u24-20020a1709064ad800b0094dffd03d7asm680000ejt.182.2023.04.13.02.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:24:01 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:23:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
Message-ID: <ZDfKLjKOfDHkEc1V@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:26PM +0900, Asahi Lina wrote:
> DRM drivers need to be able to declare which driver-specific ioctls they
> support. This abstraction adds the required types and a helper macro to
> generate the ioctl definition inside the DRM driver.
> 
> Note that this macro is not usable until further bits of the
> abstraction are in place (but it will not fail to compile on its own, if
> not called).
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

A bunch of thoughts/questions:

- You have the pub functions to create ioctl numbers, but it looks like
  most drivers just do this in the C uapi headers instead and then use the
  direct number from the bindings? I wonder whether we shouldn't just use
  that as standard way, since in the end we do need the C headers for
  userspace to use the ioctls/structs. Or could we generate the headers
  from rust?

- More type safety would be nice. You have the one for device, but not yet
  for DrmFile. At least if I read the examples in asahi/vgem right. Also
  the FIXME for how to make sure you generate the table for the right kind
  of driver would be nice to fix.

- Type safety against the size of the struct an ioctl number is great!

- I wonder whether we could adjust the type according to _IOR/W/RW, i.e.
  if you have W then your ioctl function is Result<Struct>, if not then
  Result<()> since it's just errno, and you get the paramater only when
  you have R set. We had in the past confusions where people got this
  wrong and wondered why their parameters don't make it to userspace.

- There's also the question of drm_ioctl() zero-extending the ioctl
  parameter struct both ways (i.e. kernel kernel or newer userspace). I
  think trying to encode that with Some() is overkill, but maybe worth a
  thought.

- It would be _really_ great if rust ioctl abstractions enforce
  https://dri.freedesktop.org/docs/drm/process/botching-up-ioctls.html at
  the type level, i.e. everything naturally aligned, no gaps, all that
  stuff. This would also hold for get/put_user and all these things (I
  didn't look into that stuff yet in the drivers when you pull in entire
  arrays).

Cheers, Daniel
> ---
>  drivers/gpu/drm/Kconfig         |   7 ++
>  rust/bindings/bindings_helper.h |   2 +
>  rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   5 ++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 163 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dc0f94f02a82..dab8f0f9aa96 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -27,6 +27,13 @@ menuconfig DRM
>  	  details.  You should also select and configure AGP
>  	  (/dev/agpgart) support if it is available for your platform.
>  
> +# Rust abstractions cannot be built as modules currently, so force them as
> +# bool by using these intermediate symbols. In the future these could be
> +# tristate once abstractions themselves can be built as modules.
> +config RUST_DRM
> +	bool "Rust support for the DRM subsystem"
> +	depends on DRM=y
> +
>  config DRM_MIPI_DBI
>  	tristate
>  	depends on DRM
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 91bb7906ca5a..2687bef1676f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,6 +6,7 @@
>   * Sorted alphabetically.
>   */
>  
> +#include <drm/drm_ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> @@ -23,6 +24,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/timekeeping.h>
>  #include <linux/xarray.h>
> +#include <uapi/drm/drm.h>
>  
>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> new file mode 100644
> index 000000000000..10304efbd5f1
> --- /dev/null
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +#![allow(non_snake_case)]
> +
> +//! DRM IOCTL definitions.
> +//!
> +//! C header: [`include/linux/drm/drm_ioctl.h`](../../../../include/linux/drm/drm_ioctl.h)
> +
> +use crate::ioctl;
> +
> +const BASE: u32 = bindings::DRM_IOCTL_BASE as u32;
> +
> +/// Construct a DRM ioctl number with no argument.
> +pub const fn IO(nr: u32) -> u32 {
> +    ioctl::_IO(BASE, nr)
> +}
> +
> +/// Construct a DRM ioctl number with a read-only argument.
> +pub const fn IOR<T>(nr: u32) -> u32 {
> +    ioctl::_IOR::<T>(BASE, nr)
> +}
> +
> +/// Construct a DRM ioctl number with a write-only argument.
> +pub const fn IOW<T>(nr: u32) -> u32 {
> +    ioctl::_IOW::<T>(BASE, nr)
> +}
> +
> +/// Construct a DRM ioctl number with a read-write argument.
> +pub const fn IOWR<T>(nr: u32) -> u32 {
> +    ioctl::_IOWR::<T>(BASE, nr)
> +}
> +
> +/// Descriptor type for DRM ioctls. Use the `declare_drm_ioctls!{}` macro to construct them.
> +pub type DrmIoctlDescriptor = bindings::drm_ioctl_desc;
> +
> +/// This is for ioctl which are used for rendering, and require that the file descriptor is either
> +/// for a render node, or if it’s a legacy/primary node, then it must be authenticated.
> +pub const AUTH: u32 = bindings::drm_ioctl_flags_DRM_AUTH;
> +
> +/// This must be set for any ioctl which can change the modeset or display state. Userspace must
> +/// call the ioctl through a primary node, while it is the active master.
> +///
> +/// Note that read-only modeset ioctl can also be called by unauthenticated clients, or when a
> +/// master is not the currently active one.
> +pub const MASTER: u32 = bindings::drm_ioctl_flags_DRM_MASTER;
> +
> +/// Anything that could potentially wreak a master file descriptor needs to have this flag set.
> +///
> +/// Current that’s only for the SETMASTER and DROPMASTER ioctl, which e.g. logind can call to force
> +/// a non-behaving master (display compositor) into compliance.
> +///
> +/// This is equivalent to callers with the SYSADMIN capability.
> +pub const ROOT_ONLY: u32 = bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
> +
> +/// Whether drm_ioctl_desc.func should be called with the DRM BKL held or not. Enforced as the
> +/// default for all modern drivers, hence there should never be a need to set this flag.
> +///
> +/// Do not use anywhere else than for the VBLANK_WAIT IOCTL, which is the only legacy IOCTL which
> +/// needs this.
> +pub const UNLOCKED: u32 = bindings::drm_ioctl_flags_DRM_UNLOCKED;
> +
> +/// This is used for all ioctl needed for rendering only, for drivers which support render nodes.
> +/// This should be all new render drivers, and hence it should be always set for any ioctl with
> +/// `AUTH` set. Note though that read-only query ioctl might have this set, but have not set
> +/// DRM_AUTH because they do not require authentication.
> +pub const RENDER_ALLOW: u32 = bindings::drm_ioctl_flags_DRM_RENDER_ALLOW;
> +
> +/// Declare the DRM ioctls for a driver.
> +///
> +/// Each entry in the list should have the form:
> +///
> +/// `(ioctl_number, argument_type, flags, user_callback),`
> +///
> +/// `argument_type` is the type name within the `bindings` crate.
> +/// `user_callback` should have the following prototype:
> +///
> +/// ```
> +/// fn foo(device: &kernel::drm::device::Device<Self>,
> +///        data: &mut bindings::argument_type,
> +///        file: &kernel::drm::file::File<Self::File>,
> +/// )
> +/// ```
> +/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::declare_drm_ioctls! {
> +///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
> +/// }
> +/// ```
> +///
> +#[macro_export]
> +macro_rules! declare_drm_ioctls {
> +    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
> +        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
> +            const _:() = {
> +                let i: u32 = $crate::bindings::DRM_COMMAND_BASE;
> +                // Assert that all the IOCTLs are in the right order and there are no gaps,
> +                // and that the sizeof of the specified type is correct.
> +                $(
> +                    let cmd: u32 = $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd);
> +                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
> +                    ::core::assert!(core::mem::size_of::<$crate::bindings::$struct>() == $crate::ioctl::_IOC_SIZE(cmd));
> +                    let i: u32 = i + 1;
> +                )*
> +            };
> +
> +            let ioctls = &[$(
> +                $crate::bindings::drm_ioctl_desc {
> +                    cmd: $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd) as u32,
> +                    func: {
> +                        #[allow(non_snake_case)]
> +                        unsafe extern "C" fn $cmd(
> +                                raw_dev: *mut $crate::bindings::drm_device,
> +                                raw_data: *mut ::core::ffi::c_void,
> +                                raw_file_priv: *mut $crate::bindings::drm_file,
> +                        ) -> core::ffi::c_int {
> +                            // SAFETY: We never drop this, and the DRM core ensures the device lives
> +                            // while callbacks are being called.
> +                            //
> +                            // FIXME: Currently there is nothing enforcing that the types of the
> +                            // dev/file match the current driver these ioctls are being declared
> +                            // for, and it's not clear how to enforce this within the type system.
> +                            let dev = ::core::mem::ManuallyDrop::new(unsafe {
> +                                $crate::drm::device::Device::from_raw(raw_dev)
> +                            });
> +                            // SAFETY: This is just the ioctl argument, which hopefully has the right type
> +                            // (we've done our best checking the size).
> +                            let data = unsafe { &mut *(raw_data as *mut $crate::bindings::$struct) };
> +                            // SAFETY: This is just the DRM file structure
> +                            let file = unsafe { $crate::drm::file::File::from_raw(raw_file_priv) };
> +
> +                            match $func(&*dev, data, &file) {
> +                                Err(e) => e.to_kernel_errno(),
> +                                Ok(i) => i.try_into().unwrap_or(ERANGE.to_kernel_errno()),
> +                            }
> +                        }
> +                        Some($cmd)
> +                    },
> +                    flags: $flags,
> +                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
> +                }
> +            ),*];
> +            ioctls
> +        };
> +    };
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> new file mode 100644
> index 000000000000..9ec6d7cbcaf3
> --- /dev/null
> +++ b/rust/kernel/drm/mod.rs
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM subsystem abstractions.
> +
> +pub mod ioctl;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7903490816bf..cb23d24c6718 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,8 @@ mod build_assert;
>  pub mod delay;
>  pub mod device;
>  pub mod driver;
> +#[cfg(CONFIG_RUST_DRM)]
> +pub mod drm;
>  pub mod error;
>  pub mod io_buffer;
>  pub mod io_mem;
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
