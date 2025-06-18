Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2EADEE5B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513D710E849;
	Wed, 18 Jun 2025 13:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lM2ohDQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155B510E849;
 Wed, 18 Jun 2025 13:50:58 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32b3b250621so55315041fa.2; 
 Wed, 18 Jun 2025 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750254656; x=1750859456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWdv2N0cIkk9uXZTWKnqHCXi3z+s1fVxPBhcJKME6wE=;
 b=lM2ohDQTVQcuqi254/wrhuQKe0KmWVHey9Ge5kze403hxL0i+G8mpHZUVErX3gZLTe
 p9UHBsrM72DrbmeRUqSvYrTXfxomDJybWr7pklLEc9dDdEY/q/eQHJ1GXq6anYqYwjlY
 1D38NMjQI05uBZJyGm7CfkHecikJNqdJwLCuDeAzw8C8qha+eccdyBgSLeJsyIkvgH8F
 x4DZpwHFM/Cyv/GTV0Sw4TS4ImcWtoZP03/LPMuAZDYCNecMZVFyusYJrwNDcj3D7XHv
 O1mB0ablkoYc38VdhyZYwI6Tok4rtsBEccWHHFPPa6v2SwBpGAuKi+nrQNgjVUmqjMBR
 DgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254656; x=1750859456;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWdv2N0cIkk9uXZTWKnqHCXi3z+s1fVxPBhcJKME6wE=;
 b=S6e4Y7z4wvAmsxRWUupyFu8LE8Pz7IEqo922PjeRoCrOPDXJQyvCUwTxzE2tZ7ojzw
 NbBPeBouBslULa1FUZu6E3xCiyfoWgb+scD+qXOcn62Seq7PnzOMYAk9dmfqjevDQcB3
 krd/FbsnN0NeOj7fY00D4ygtLka3C6XuOBa45JzrwEFS762ei/eBLBCsb3O+99FaOlsd
 7vhnjDQvsNFq2eIURFBgiPaW44UAw6jIklrQD5Haq+aZ5X4HkR1+nLf8cTPZ/O4mp71W
 NOzaSF+Bnf6z8JV90xebLtrs6qXA2Le8+4LFN77ddrDOgS4PiYaBKG/KDLtjMF0kd+be
 +hTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlWagtwZKHCDVXEO8QOi9TrXILnXypUKFLe0H2goyUfy4J1yMU1DiAsYXtAUhWrp8pphk8eca+Gg==@lists.freedesktop.org,
 AJvYcCWRcNxfTCEyxcf9peeSmMH/i87pMZoEKJwpiCPPsUYusbDqX2trdI4NAb5NNldGHE85uuCmjZcAs68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr2D2/lXn73XEXfF2RDRtjAVU80PnwKA9J5gq875KCBtnitr2l
 1ra/jMHCR6kiRddI1JKXQfwzIBmx+PmViqLPf6V3MxvHtCGYpvqea1GPSdwq+RiLkfDNCGR4mGq
 u2foCA4GWmegXqtunzRBp+QxoY0nOiVA=
X-Gm-Gg: ASbGncuworTumloT6m9TsSm29rzk0r48e94RT38iD67awnH6zJAtO9WTc6vEeM7Yp4I
 o1Dfog0BBou4AIsjXVvcNsNDyNrURJqKzZvDFHwf5NRChP4vS+D/oEvo2aH7eWmr/FKCBfiisDg
 Ov+2guxxfdYVOYVhjL0yoD6SgJFd9z2rQ2pmlHQgiLkTnGbiYkaEHYMn7Zvzs=
X-Google-Smtp-Source: AGHT+IGoc47KrVxU/Wj2sFhYv8DKc+qBJy3QSWc1R3fV7leFu9aAEmgoN70YE6juBnvhmnYd+4gV6719YGwTQW2uFzg=
X-Received: by 2002:a05:651c:4019:b0:327:ef96:dc28 with SMTP id
 38308e7fff4ca-32b4a46e336mr28788691fa.24.1750254655705; Wed, 18 Jun 2025
 06:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 18 Jun 2025 09:50:19 -0400
X-Gm-Features: AX0GCFtbLOx6KfGFMLzBJ-cFYCzDu92PIU-LGXU6wi1dQRtA1T6WyHFinCi2Wi4
Message-ID: <CAJ-ks9k0vAw9UHx-s9uD9u0LufvgnojtrFoG=AH40Gp9HnxEDg@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] rust: enable `clippy::as_underscore` lint
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Sun, Jun 15, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
>
> > The conversion might include lossy conversion or a dangerous cast that
> > might go undetected due to the type being inferred.
> >
> > The lint is allowed by default as using `_` is less wordy than always
> > specifying the type.
>
> Always specifying the type is especially helpful in function call
> contexts where the inferred type may change at a distance. Specifying
> the type also allows Clippy to spot more cases of `useless_conversion`.
>
> The primary downside is the need to specify the type in trivial getters.
> There are 4 such functions: 3 have become slightly less ergonomic, 1 was
> revealed to be a `useless_conversion`.
>
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_unders=
core [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

@Danilo Krummrich could you please have a look for nova?

> ---
>  Makefile                           |  1 +
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  rust/kernel/block/mq/operations.rs |  2 +-
>  rust/kernel/block/mq/request.rs    |  7 ++++-
>  rust/kernel/device_id.rs           |  2 +-
>  rust/kernel/devres.rs              | 13 +++++-----
>  rust/kernel/dma.rs                 |  2 +-
>  rust/kernel/drm/device.rs          |  2 +-
>  rust/kernel/error.rs               |  2 +-
>  rust/kernel/io.rs                  | 18 ++++++-------
>  rust/kernel/miscdevice.rs          |  2 +-
>  rust/kernel/mm/virt.rs             | 52 +++++++++++++++++++-------------=
------
>  rust/kernel/of.rs                  |  6 ++---
>  rust/kernel/pci.rs                 |  9 ++++---
>  rust/kernel/str.rs                 |  8 +++---
>  rust/kernel/workqueue.rs           |  2 +-
>  16 files changed, 70 insertions(+), 60 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bb33023f87c3..0ba22c361de8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -480,6 +480,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>                             -Wunreachable_pub \
>                             -Wclippy::all \
>                             -Wclippy::as_ptr_cast_mut \
> +                           -Wclippy::as_underscore \
>                             -Wclippy::ignored_unit_patterns \
>                             -Wclippy::mut_mut \
>                             -Wclippy::needless_bitwise_bool \
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 8c86101c26cb..a0e435dc4656 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -19,7 +19,7 @@ pub(crate) struct NovaCore {
>      MODULE_PCI_TABLE,
>      <NovaCore as pci::Driver>::IdInfo,
>      [(
> -        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as _),
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as u32),
>          ()
>      )]
>  );
> diff --git a/rust/kernel/block/mq/operations.rs b/rust/kernel/block/mq/op=
erations.rs
> index 864ff379dc91..c2b98f507bcb 100644
> --- a/rust/kernel/block/mq/operations.rs
> +++ b/rust/kernel/block/mq/operations.rs
> @@ -101,7 +101,7 @@ impl<T: Operations> OperationsVTable<T> {
>          if let Err(e) =3D ret {
>              e.to_blk_status()
>          } else {
> -            bindings::BLK_STS_OK as _
> +            bindings::BLK_STS_OK as bindings::blk_status_t
>          }
>      }
>
> diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/reque=
st.rs
> index af5c9ac94f36..fefd394f064a 100644
> --- a/rust/kernel/block/mq/request.rs
> +++ b/rust/kernel/block/mq/request.rs
> @@ -125,7 +125,12 @@ pub fn end_ok(this: ARef<Self>) -> Result<(), ARef<S=
elf>> {
>          // success of the call to `try_set_end` guarantees that there ar=
e no
>          // `ARef`s pointing to this request. Therefore it is safe to han=
d it
>          // back to the block layer.
> -        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK=
_STS_OK as _) };
> +        unsafe {
> +            bindings::blk_mq_end_request(
> +                request_ptr,
> +                bindings::BLK_STS_OK as bindings::blk_status_t,
> +            )
> +        };
>
>          Ok(())
>      }
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index 0a4eb56d98f2..f9d55ac7b9e6 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T, U, N=
> {
>              unsafe {
>                  raw_ids[i]
>                      .as_mut_ptr()
> -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> +                    .byte_add(T::DRIVER_DATA_OFFSET)
>                      .cast::<usize>()
>                      .write(i);
>              }
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 237182446db3..1e44d70687a8 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -59,19 +59,19 @@ struct DevresInner<T> {
>  ///     unsafe fn new(paddr: usize) -> Result<Self>{
>  ///         // SAFETY: By the safety requirements of this function [`pad=
dr`, `paddr` + `SIZE`) is
>  ///         // valid for `ioremap`.
> -///         let addr =3D unsafe { bindings::ioremap(paddr as _, SIZE as =
_) };
> +///         let addr =3D unsafe { bindings::ioremap(paddr as bindings::p=
hys_addr_t, SIZE) };
>  ///         if addr.is_null() {
>  ///             return Err(ENOMEM);
>  ///         }
>  ///
> -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
>  ///     }
>  /// }
>  ///
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapp=
ed by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
>  ///     }
>  /// }
>  ///
> @@ -112,8 +112,9 @@ fn new(dev: &Device<Bound>, data: T, flags: Flags) ->=
 Result<Arc<DevresInner<T>>
>
>          // SAFETY: `devm_add_action` guarantees to call `Self::devres_ca=
llback` once `dev` is
>          // detached.
> -        let ret =3D
> -            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.=
callback), data as _) };
> +        let ret =3D unsafe {
> +            bindings::devm_add_action(dev.as_raw(), Some(inner.callback)=
, data.cast_mut().cast())
> +        };
>
>          if ret !=3D 0 {
>              // SAFETY: We just created another reference to `inner` in o=
rder to pass it to
> @@ -127,7 +128,7 @@ fn new(dev: &Device<Bound>, data: T, flags: Flags) ->=
 Result<Arc<DevresInner<T>>
>      }
>
>      fn as_ptr(&self) -> *const Self {
> -        self as _
> +        self
>      }
>
>      fn remove_action(this: &Arc<Self>) {
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 666bf2d64f9a..8e317005decd 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -38,7 +38,7 @@
>  impl Attrs {
>      /// Get the raw representation of this attribute.
>      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> -        self.0 as _
> +        self.0 as crate::ffi::c_ulong
>      }
>
>      /// Check whether `flags` is contained in `self`.
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index ef66deb7ce23..b7ee3c464a12 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -89,7 +89,7 @@ impl<T: drm::Driver> Device<T> {
>          driver_features: drm::driver::FEAT_GEM,
>          ioctls: T::IOCTLS.as_ptr(),
>          num_ioctls: T::IOCTLS.len() as i32,
> -        fops: &Self::GEM_FOPS as _,
> +        fops: &Self::GEM_FOPS,
>      };
>
>      const GEM_FOPS: bindings::file_operations =3D drm::gem::create_fops(=
);
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index afcb00cb6a75..fd7a8b759437 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -153,7 +153,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_st=
atus_t {
>      /// Returns the error encoded as a pointer.
>      pub fn to_ptr<T>(self) -> *mut T {
>          // SAFETY: `self.0` is a valid error due to its invariant.
> -        unsafe { bindings::ERR_PTR(self.0.get() as _).cast() }
> +        unsafe { bindings::ERR_PTR(self.0.get() as isize).cast() }
>      }
>
>      /// Returns a string representing the error, if one exists.
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 72d80a6f131e..c08de4121637 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -5,7 +5,7 @@
>  //! C header: [`include/asm-generic/io.h`](srctree/include/asm-generic/i=
o.h)
>
>  use crate::error::{code::EINVAL, Result};
> -use crate::{bindings, build_assert};
> +use crate::{bindings, build_assert, ffi::c_void};
>
>  /// Raw representation of an MMIO region.
>  ///
> @@ -56,7 +56,7 @@ pub fn maxsize(&self) -> usize {
>  /// # Examples
>  ///
>  /// ```no_run
> -/// # use kernel::{bindings, io::{Io, IoRaw}};
> +/// # use kernel::{bindings, ffi::c_void, io::{Io, IoRaw}};
>  /// # use core::ops::Deref;
>  ///
>  /// // See also [`pci::Bar`] for a real example.
> @@ -70,19 +70,19 @@ pub fn maxsize(&self) -> usize {
>  ///     unsafe fn new(paddr: usize) -> Result<Self>{
>  ///         // SAFETY: By the safety requirements of this function [`pad=
dr`, `paddr` + `SIZE`) is
>  ///         // valid for `ioremap`.
> -///         let addr =3D unsafe { bindings::ioremap(paddr as _, SIZE as =
_) };
> +///         let addr =3D unsafe { bindings::ioremap(paddr as bindings::p=
hys_addr_t, SIZE) };
>  ///         if addr.is_null() {
>  ///             return Err(ENOMEM);
>  ///         }
>  ///
> -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
>  ///     }
>  /// }
>  ///
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapp=
ed by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
>  ///     }
>  /// }
>  ///
> @@ -119,7 +119,7 @@ pub fn $name(&self, offset: usize) -> $type_name {
>              let addr =3D self.io_addr_assert::<$type_name>(offset);
>
>              // SAFETY: By the type invariant `addr` is a valid address f=
or MMIO operations.
> -            unsafe { bindings::$c_fn(addr as _) }
> +            unsafe { bindings::$c_fn(addr as *const c_void) }
>          }
>
>          /// Read IO data from a given offset.
> @@ -131,7 +131,7 @@ pub fn $try_name(&self, offset: usize) -> Result<$typ=
e_name> {
>              let addr =3D self.io_addr::<$type_name>(offset)?;
>
>              // SAFETY: By the type invariant `addr` is a valid address f=
or MMIO operations.
> -            Ok(unsafe { bindings::$c_fn(addr as _) })
> +            Ok(unsafe { bindings::$c_fn(addr as *const c_void) })
>          }
>      };
>  }
> @@ -148,7 +148,7 @@ pub fn $name(&self, value: $type_name, offset: usize)=
 {
>              let addr =3D self.io_addr_assert::<$type_name>(offset);
>
>              // SAFETY: By the type invariant `addr` is a valid address f=
or MMIO operations.
> -            unsafe { bindings::$c_fn(value, addr as _, ) }
> +            unsafe { bindings::$c_fn(value, addr as *mut c_void) }
>          }
>
>          /// Write IO data from a given offset.
> @@ -160,7 +160,7 @@ pub fn $try_name(&self, value: $type_name, offset: us=
ize) -> Result {
>              let addr =3D self.io_addr::<$type_name>(offset)?;
>
>              // SAFETY: By the type invariant `addr` is a valid address f=
or MMIO operations.
> -            unsafe { bindings::$c_fn(value, addr as _) }
> +            unsafe { bindings::$c_fn(value, addr as *mut c_void) }
>              Ok(())
>          }
>      };
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 939278bc7b03..288f40e79906 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -34,7 +34,7 @@ impl MiscDeviceOptions {
>      pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>          // SAFETY: All zeros is valid for this C type.
>          let mut result: bindings::miscdevice =3D unsafe { MaybeUninit::z=
eroed().assume_init() };
> -        result.minor =3D bindings::MISC_DYNAMIC_MINOR as _;
> +        result.minor =3D bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
>          result.name =3D self.name.as_char_ptr();
>          result.fops =3D MiscdeviceVTable::<T>::build();
>          result
> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> index 31803674aecc..6086ca981b06 100644
> --- a/rust/kernel/mm/virt.rs
> +++ b/rust/kernel/mm/virt.rs
> @@ -392,80 +392,80 @@ pub mod flags {
>      use crate::bindings;
>
>      /// No flags are set.
> -    pub const NONE: vm_flags_t =3D bindings::VM_NONE as _;
> +    pub const NONE: vm_flags_t =3D bindings::VM_NONE as vm_flags_t;
>
>      /// Mapping allows reads.
> -    pub const READ: vm_flags_t =3D bindings::VM_READ as _;
> +    pub const READ: vm_flags_t =3D bindings::VM_READ as vm_flags_t;
>
>      /// Mapping allows writes.
> -    pub const WRITE: vm_flags_t =3D bindings::VM_WRITE as _;
> +    pub const WRITE: vm_flags_t =3D bindings::VM_WRITE as vm_flags_t;
>
>      /// Mapping allows execution.
> -    pub const EXEC: vm_flags_t =3D bindings::VM_EXEC as _;
> +    pub const EXEC: vm_flags_t =3D bindings::VM_EXEC as vm_flags_t;
>
>      /// Mapping is shared.
> -    pub const SHARED: vm_flags_t =3D bindings::VM_SHARED as _;
> +    pub const SHARED: vm_flags_t =3D bindings::VM_SHARED as vm_flags_t;
>
>      /// Mapping may be updated to allow reads.
> -    pub const MAYREAD: vm_flags_t =3D bindings::VM_MAYREAD as _;
> +    pub const MAYREAD: vm_flags_t =3D bindings::VM_MAYREAD as vm_flags_t=
;
>
>      /// Mapping may be updated to allow writes.
> -    pub const MAYWRITE: vm_flags_t =3D bindings::VM_MAYWRITE as _;
> +    pub const MAYWRITE: vm_flags_t =3D bindings::VM_MAYWRITE as vm_flags=
_t;
>
>      /// Mapping may be updated to allow execution.
> -    pub const MAYEXEC: vm_flags_t =3D bindings::VM_MAYEXEC as _;
> +    pub const MAYEXEC: vm_flags_t =3D bindings::VM_MAYEXEC as vm_flags_t=
;
>
>      /// Mapping may be updated to be shared.
> -    pub const MAYSHARE: vm_flags_t =3D bindings::VM_MAYSHARE as _;
> +    pub const MAYSHARE: vm_flags_t =3D bindings::VM_MAYSHARE as vm_flags=
_t;
>
>      /// Page-ranges managed without `struct page`, just pure PFN.
> -    pub const PFNMAP: vm_flags_t =3D bindings::VM_PFNMAP as _;
> +    pub const PFNMAP: vm_flags_t =3D bindings::VM_PFNMAP as vm_flags_t;
>
>      /// Memory mapped I/O or similar.
> -    pub const IO: vm_flags_t =3D bindings::VM_IO as _;
> +    pub const IO: vm_flags_t =3D bindings::VM_IO as vm_flags_t;
>
>      /// Do not copy this vma on fork.
> -    pub const DONTCOPY: vm_flags_t =3D bindings::VM_DONTCOPY as _;
> +    pub const DONTCOPY: vm_flags_t =3D bindings::VM_DONTCOPY as vm_flags=
_t;
>
>      /// Cannot expand with mremap().
> -    pub const DONTEXPAND: vm_flags_t =3D bindings::VM_DONTEXPAND as _;
> +    pub const DONTEXPAND: vm_flags_t =3D bindings::VM_DONTEXPAND as vm_f=
lags_t;
>
>      /// Lock the pages covered when they are faulted in.
> -    pub const LOCKONFAULT: vm_flags_t =3D bindings::VM_LOCKONFAULT as _;
> +    pub const LOCKONFAULT: vm_flags_t =3D bindings::VM_LOCKONFAULT as vm=
_flags_t;
>
>      /// Is a VM accounted object.
> -    pub const ACCOUNT: vm_flags_t =3D bindings::VM_ACCOUNT as _;
> +    pub const ACCOUNT: vm_flags_t =3D bindings::VM_ACCOUNT as vm_flags_t=
;
>
>      /// Should the VM suppress accounting.
> -    pub const NORESERVE: vm_flags_t =3D bindings::VM_NORESERVE as _;
> +    pub const NORESERVE: vm_flags_t =3D bindings::VM_NORESERVE as vm_fla=
gs_t;
>
>      /// Huge TLB Page VM.
> -    pub const HUGETLB: vm_flags_t =3D bindings::VM_HUGETLB as _;
> +    pub const HUGETLB: vm_flags_t =3D bindings::VM_HUGETLB as vm_flags_t=
;
>
>      /// Synchronous page faults. (DAX-specific)
> -    pub const SYNC: vm_flags_t =3D bindings::VM_SYNC as _;
> +    pub const SYNC: vm_flags_t =3D bindings::VM_SYNC as vm_flags_t;
>
>      /// Architecture-specific flag.
> -    pub const ARCH_1: vm_flags_t =3D bindings::VM_ARCH_1 as _;
> +    pub const ARCH_1: vm_flags_t =3D bindings::VM_ARCH_1 as vm_flags_t;
>
>      /// Wipe VMA contents in child on fork.
> -    pub const WIPEONFORK: vm_flags_t =3D bindings::VM_WIPEONFORK as _;
> +    pub const WIPEONFORK: vm_flags_t =3D bindings::VM_WIPEONFORK as vm_f=
lags_t;
>
>      /// Do not include in the core dump.
> -    pub const DONTDUMP: vm_flags_t =3D bindings::VM_DONTDUMP as _;
> +    pub const DONTDUMP: vm_flags_t =3D bindings::VM_DONTDUMP as vm_flags=
_t;
>
>      /// Not soft dirty clean area.
> -    pub const SOFTDIRTY: vm_flags_t =3D bindings::VM_SOFTDIRTY as _;
> +    pub const SOFTDIRTY: vm_flags_t =3D bindings::VM_SOFTDIRTY as vm_fla=
gs_t;
>
>      /// Can contain `struct page` and pure PFN pages.
> -    pub const MIXEDMAP: vm_flags_t =3D bindings::VM_MIXEDMAP as _;
> +    pub const MIXEDMAP: vm_flags_t =3D bindings::VM_MIXEDMAP as vm_flags=
_t;
>
>      /// MADV_HUGEPAGE marked this vma.
> -    pub const HUGEPAGE: vm_flags_t =3D bindings::VM_HUGEPAGE as _;
> +    pub const HUGEPAGE: vm_flags_t =3D bindings::VM_HUGEPAGE as vm_flags=
_t;
>
>      /// MADV_NOHUGEPAGE marked this vma.
> -    pub const NOHUGEPAGE: vm_flags_t =3D bindings::VM_NOHUGEPAGE as _;
> +    pub const NOHUGEPAGE: vm_flags_t =3D bindings::VM_NOHUGEPAGE as vm_f=
lags_t;
>
>      /// KSM may merge identical pages.
> -    pub const MERGEABLE: vm_flags_t =3D bindings::VM_MERGEABLE as _;
> +    pub const MERGEABLE: vm_flags_t =3D bindings::VM_MERGEABLE as vm_fla=
gs_t;
>  }
> diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
> index 04f2d8ef29cb..40d1bd13682c 100644
> --- a/rust/kernel/of.rs
> +++ b/rust/kernel/of.rs
> @@ -22,7 +22,7 @@ unsafe impl RawDeviceId for DeviceId {
>      const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::=
of_device_id, data);
>
>      fn index(&self) -> usize {
> -        self.0.data as _
> +        self.0.data as usize
>      }
>  }
>
> @@ -34,10 +34,10 @@ pub const fn new(compatible: &'static CStr) -> Self {
>          // SAFETY: FFI type is valid to be zero-initialized.
>          let mut of: bindings::of_device_id =3D unsafe { core::mem::zeroe=
d() };
>
> -        // TODO: Use `clone_from_slice` once the corresponding types do =
match.
> +        // TODO: Use `copy_from_slice` once stabilized for `const`.
>          let mut i =3D 0;
>          while i < src.len() {
> -            of.compatible[i] =3D src[i] as _;
> +            of.compatible[i] =3D src[i];
>              i +=3D 1;
>          }
>
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 33ae0bdc433d..f6b19764ad17 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -171,7 +171,7 @@ unsafe impl RawDeviceId for DeviceId {
>      const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::=
pci_device_id, driver_data);
>
>      fn index(&self) -> usize {
> -        self.0.driver_data as _
> +        self.0.driver_data
>      }
>  }
>
> @@ -206,7 +206,10 @@ macro_rules! pci_device_table {
>  ///     MODULE_PCI_TABLE,
>  ///     <MyDriver as pci::Driver>::IdInfo,
>  ///     [
> -///         (pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_REDHAT, bind=
ings::PCI_ANY_ID as _), ())
> +///         (
> +///             pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_REDHAT, b=
indings::PCI_ANY_ID as u32),
> +///             (),
> +///         )
>  ///     ]
>  /// );
>  ///
> @@ -330,7 +333,7 @@ unsafe fn do_release(pdev: &Device, ioptr: usize, num=
: i32) {
>          // `ioptr` is valid by the safety requirements.
>          // `num` is valid by the safety requirements.
>          unsafe {
> -            bindings::pci_iounmap(pdev.as_raw(), ioptr as _);
> +            bindings::pci_iounmap(pdev.as_raw(), ioptr as *mut kernel::f=
fi::c_void);
>              bindings::pci_release_region(pdev.as_raw(), num);
>          }
>      }
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 6a3cb607b332..43597eb7c5c1 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -728,9 +728,9 @@ fn new() -> Self {
>      pub(crate) unsafe fn from_ptrs(pos: *mut u8, end: *mut u8) -> Self {
>          // INVARIANT: The safety requirements guarantee the type invaria=
nts.
>          Self {
> -            beg: pos as _,
> -            pos: pos as _,
> -            end: end as _,
> +            beg: pos as usize,
> +            pos: pos as usize,
> +            end: end as usize,
>          }
>      }
>
> @@ -755,7 +755,7 @@ pub(crate) unsafe fn from_buffer(buf: *mut u8, len: u=
size) -> Self {
>      ///
>      /// N.B. It may point to invalid memory.
>      pub(crate) fn pos(&self) -> *mut u8 {
> -        self.pos as _
> +        self.pos as *mut u8
>      }
>
>      /// Returns the number of bytes written to the formatter.
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index de61374e36bd..89e5c2560eec 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -198,7 +198,7 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::E=
nqueueOutput
>          unsafe {
>              w.__enqueue(move |work_ptr| {
>                  bindings::queue_work_on(
> -                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
> +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_=
int,
>                      queue_ptr,
>                      work_ptr,
>                  )
>
> --
> 2.49.0
>
