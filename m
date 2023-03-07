Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509E6AE334
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3673910E4CB;
	Tue,  7 Mar 2023 14:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9210E4CB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678200533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEcJ1Ioa5rcUn7+lKergEBYkkirnPMObuZdVZ/fudgM=;
 b=CtzX+Tr/QJYeLecSz5zm/7RXBm6G8HRLLGzGLV70c8nraWGcdMJ9yUHv+zQfbvgEqF0FyQ
 HR9QHZoTLU67Psd8ggKnl9Pq0C7YJ1KNzHLAspUZyA8Rl6yfjvyPNnMTkBA04FwGqV1u4s
 x6o7T/ritOokFw5JIezAMxV4WSrFnSk=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-6wcKZSzVPKmX8hg46jom3g-1; Tue, 07 Mar 2023 09:48:52 -0500
X-MC-Unique: 6wcKZSzVPKmX8hg46jom3g-1
Received: by mail-lf1-f70.google.com with SMTP id
 o29-20020a198c1d000000b004d584f37a04so3744381lfd.21
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 06:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEcJ1Ioa5rcUn7+lKergEBYkkirnPMObuZdVZ/fudgM=;
 b=yxhj2eQn8lr0+Wf+Cv1bQu6dwy3mYacxoL+MGDwbep7W3gdHfkM13Q4fTZ/FzvrQ40
 2IpdBCYTqu6GZpaAMCkGXL/Rg3J+ZNA0cmOk6+4d3wDgxjOn0XBEyEhx40Ma23j3d1Zy
 n/3JaqIk9giqVITupE9e9UlligHsq6YJoYh7cEGkrWRAiGjB2VCKmZ4be2Tx6pRXzQ/Q
 XsmwsJVrW0svkGJL/6GptNxZVWcBtNrJ7uMpDudxTp29aR+Q7uwEzDEWaNzwdEaUss4A
 QcsRQZUv3LS+1977PUh0AxHFQ1vJQkxPHJGhh1X7/lCl6UXthtWHJh8H/hVANjNy/pLd
 9GfA==
X-Gm-Message-State: AO0yUKWlVb84LlVbGn4VBhYRuCrFc/dlgGVuXj6uMLA7nPBuDc21u8cQ
 8jmdYD75cJa+OFMz7JaELj7HI8o8F2cdkWgsRFmZ2PrHgLdquPJwCTI0n1MlzfwygUoGW4OqU6X
 QqOPwTK8OrsQZZtBgtFfVp+Ml6UPEgEuu0F90iHIfSRmy
X-Received: by 2002:a2e:aa8b:0:b0:295:acea:5875 with SMTP id
 bj11-20020a2eaa8b000000b00295acea5875mr4477660ljb.2.1678200526197; 
 Tue, 07 Mar 2023 06:48:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9Nm+BnCAuFWBT6ldo5btnOpcoIa+hBu7QQtIIrMaTiFSsqO2edyNtRlc3Vd4Z8J6sUmTfu+uOU+Y0OU1Lgfbw=
X-Received: by 2002:a2e:aa8b:0:b0:295:acea:5875 with SMTP id
 bj11-20020a2eaa8b000000b00295acea5875mr4477655ljb.2.1678200525832; Tue, 07
 Mar 2023 06:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Mar 2023 15:48:33 +0100
Message-ID: <CACO55tt7NQASBq=G08h6nZBGk-5DOpzPZ3_wBVfEWBfdyydaAA@mail.gmail.com>
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
To: Asahi Lina <lina@asahilina.net>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ella Stanforth <ella@iglunix.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, linux-media@vger.kernel.org,
 Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 3:27=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> DRM drivers need to be able to declare which driver-specific ioctls they
> support. This abstraction adds the required types and a helper macro to
> generate the ioctl definition inside the DRM driver.
>
> Note that this macro is not usable until further bits of the
> abstraction are in place (but it will not fail to compile on its own, if
> not called).
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  drivers/gpu/drm/Kconfig         |   7 ++
>  rust/bindings/bindings_helper.h |   2 +
>  rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/drm/mod.rs          |   5 ++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 163 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dc0f94f02a82..dab8f0f9aa96 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -27,6 +27,13 @@ menuconfig DRM
>           details.  You should also select and configure AGP
>           (/dev/agpgart) support if it is available for your platform.
>
> +# Rust abstractions cannot be built as modules currently, so force them =
as
> +# bool by using these intermediate symbols. In the future these could be
> +# tristate once abstractions themselves can be built as modules.
> +config RUST_DRM
> +       bool "Rust support for the DRM subsystem"
> +       depends on DRM=3Dy
> +
>  config DRM_MIPI_DBI
>         tristate
>         depends on DRM
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
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

might make more sense to add this chunk to the patch actually needing it

>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL =3D GFP_KERNEL;
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
> +//! C header: [`include/linux/drm/drm_ioctl.h`](../../../../include/linu=
x/drm/drm_ioctl.h)
> +
> +use crate::ioctl;
> +
> +const BASE: u32 =3D bindings::DRM_IOCTL_BASE as u32;
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
> +/// Descriptor type for DRM ioctls. Use the `declare_drm_ioctls!{}` macr=
o to construct them.
> +pub type DrmIoctlDescriptor =3D bindings::drm_ioctl_desc;
> +
> +/// This is for ioctl which are used for rendering, and require that the=
 file descriptor is either
> +/// for a render node, or if it=E2=80=99s a legacy/primary node, then it=
 must be authenticated.
> +pub const AUTH: u32 =3D bindings::drm_ioctl_flags_DRM_AUTH;
> +
> +/// This must be set for any ioctl which can change the modeset or displ=
ay state. Userspace must
> +/// call the ioctl through a primary node, while it is the active master=
.
> +///
> +/// Note that read-only modeset ioctl can also be called by unauthentica=
ted clients, or when a
> +/// master is not the currently active one.
> +pub const MASTER: u32 =3D bindings::drm_ioctl_flags_DRM_MASTER;
> +
> +/// Anything that could potentially wreak a master file descriptor needs=
 to have this flag set.
> +///
> +/// Current that=E2=80=99s only for the SETMASTER and DROPMASTER ioctl, =
which e.g. logind can call to force
> +/// a non-behaving master (display compositor) into compliance.
> +///
> +/// This is equivalent to callers with the SYSADMIN capability.
> +pub const ROOT_ONLY: u32 =3D bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
> +
> +/// Whether drm_ioctl_desc.func should be called with the DRM BKL held o=
r not. Enforced as the
> +/// default for all modern drivers, hence there should never be a need t=
o set this flag.
> +///
> +/// Do not use anywhere else than for the VBLANK_WAIT IOCTL, which is th=
e only legacy IOCTL which
> +/// needs this.
> +pub const UNLOCKED: u32 =3D bindings::drm_ioctl_flags_DRM_UNLOCKED;
> +
> +/// This is used for all ioctl needed for rendering only, for drivers wh=
ich support render nodes.
> +/// This should be all new render drivers, and hence it should be always=
 set for any ioctl with
> +/// `AUTH` set. Note though that read-only query ioctl might have this s=
et, but have not set
> +/// DRM_AUTH because they do not require authentication.
> +pub const RENDER_ALLOW: u32 =3D bindings::drm_ioctl_flags_DRM_RENDER_ALL=
OW;
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
> +/// where `Self` is the drm::drv::Driver implementation these ioctls are=
 being declared within.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::declare_drm_ioctls! {
> +///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_p=
aram_handler),
> +/// }

I am wondering.. couldn't we make it a proc_macro and just tag all the
functions instead? Though I also see the point of having a central
list of all ioctls... Maybe we should have some higher level
discussions around on _how_ we want things to look like.

> +/// ```
> +///
> +#[macro_export]
> +macro_rules! declare_drm_ioctls {
> +    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) =
=3D> {
> +        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] =
=3D {
> +            const _:() =3D {
> +                let i: u32 =3D $crate::bindings::DRM_COMMAND_BASE;
> +                // Assert that all the IOCTLs are in the right order and=
 there are no gaps,
> +                // and that the sizeof of the specified type is correct.
> +                $(
> +                    let cmd: u32 =3D $crate::macros::concat_idents!($cra=
te::bindings::DRM_IOCTL_, $cmd);
> +                    ::core::assert!(i =3D=3D $crate::ioctl::_IOC_NR(cmd)=
);
> +                    ::core::assert!(core::mem::size_of::<$crate::binding=
s::$struct>() =3D=3D $crate::ioctl::_IOC_SIZE(cmd));

::core::mem::size_of

> +                    let i: u32 =3D i + 1;
> +                )*
> +            };
> +
> +            let ioctls =3D &[$(
> +                $crate::bindings::drm_ioctl_desc {
> +                    cmd: $crate::macros::concat_idents!($crate::bindings=
::DRM_IOCTL_, $cmd) as u32,
> +                    func: {
> +                        #[allow(non_snake_case)]
> +                        unsafe extern "C" fn $cmd(
> +                                raw_dev: *mut $crate::bindings::drm_devi=
ce,
> +                                raw_data: *mut ::core::ffi::c_void,
> +                                raw_file_priv: *mut $crate::bindings::dr=
m_file,
> +                        ) -> core::ffi::c_int {

::core

> +                            // SAFETY: We never drop this, and the DRM c=
ore ensures the device lives
> +                            // while callbacks are being called.
> +                            //
> +                            // FIXME: Currently there is nothing enforci=
ng that the types of the
> +                            // dev/file match the current driver these i=
octls are being declared
> +                            // for, and it's not clear how to enforce th=
is within the type system.
> +                            let dev =3D ::core::mem::ManuallyDrop::new(u=
nsafe {
> +                                $crate::drm::device::Device::from_raw(ra=
w_dev)
> +                            });
> +                            // SAFETY: This is just the ioctl argument, =
which hopefully has the right type
> +                            // (we've done our best checking the size).
> +                            let data =3D unsafe { &mut *(raw_data as *mu=
t $crate::bindings::$struct) };
> +                            // SAFETY: This is just the DRM file structu=
re
> +                            let file =3D unsafe { $crate::drm::file::Fil=
e::from_raw(raw_file_priv) };
> +
> +                            match $func(&*dev, data, &file) {
> +                                Err(e) =3D> e.to_kernel_errno(),
> +                                Ok(i) =3D> i.try_into().unwrap_or(ERANGE=
.to_kernel_errno()),

need to specify the namespace on ERANGE, no?

> +                            }
> +                        }
> +                        Some($cmd)
> +                    },
> +                    flags: $flags,
> +                    name: $crate::c_str!(::core::stringify!($cmd)).as_ch=
ar_ptr(),
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

