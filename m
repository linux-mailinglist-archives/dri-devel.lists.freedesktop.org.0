Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348966D848F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD38510E1C9;
	Wed,  5 Apr 2023 17:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D21E10E1C9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:10:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9333b408ee7so3664866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680714609;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hb0s11wzWUtncbdbj1+tJGRJTpj0TLkIHZg2ChvIYvU=;
 b=AIepK3u1s3NY52wFU0VpMZvX2NKO+NsK4/OuLn3pWaxT/kbRpMn2pPm2RDRoAs9H1Q
 r78d6VKmoz/o52L5nGumO00t5txi23tC0S6+HCYSVU5Qg3B+PD5siZRuIEpkSZ2BPmZ6
 G2s2mC3moD8U//YHMlyb8n+RQcerj0M/2FLys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680714609;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hb0s11wzWUtncbdbj1+tJGRJTpj0TLkIHZg2ChvIYvU=;
 b=GGu1t/iJowfZX8PR+ajzg7g726viuJTtvh1T6WPCNkOR8b5PMm6cd6sl+/p6pmohPZ
 xEsy1ph3qwobGgQnHJcx+ohqTUkRNAJgDBl/Fz2oqk0sWt5IjBejeYXHumyJ4q99mRYs
 Wtc3xgLs7l+lCIqXr7cOYPIDxjsdKdYwEBUvdd3pCTol7T00S9u5hDmMGCDw8wBea6k2
 vvJH9zSCM0xtsgJaKl4nLJVzPOcXrEM9PNgLUwvzB9IIk81i7CqmiLpg2cYQ9XOuy2m/
 OC/ps2GSdB0MY26k1bCLDqW7jNy3LbfeJtqM8JtUudCDORYpJZSjm/Uws1v4r2AHp4IP
 UHaQ==
X-Gm-Message-State: AAQBX9fM+tzMd/2Srf5U92zJN71AfQ79k0YbG2qVFK9E1MY7AQXWQI4z
 baXZXJfo0jalQR3LWDfGjp0tTQ==
X-Google-Smtp-Source: AKy350ZCiVwHTUx+2dgaPIvaAFhh9EdAw+52UQeR48M9LnuKBPf1LtMAP5BhHlf7cEoZUQl4Bkru1Q==
X-Received: by 2002:a05:6402:2811:b0:502:465:28e1 with SMTP id
 h17-20020a056402281100b00502046528e1mr3106022ede.0.1680714608441; 
 Wed, 05 Apr 2023 10:10:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 tq24-20020a170907c51800b00947abb70c93sm7264820ejc.112.2023.04.05.10.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:10:07 -0700 (PDT)
Date: Wed, 5 Apr 2023 19:10:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
Message-ID: <ZC2rbZzho2YMi5cq@phenom.ffwll.local>
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
 <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
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

On Tue, Mar 07, 2023 at 11:25:27PM +0900, Asahi Lina wrote:
> Add the initial abstractions for DRM drivers and devices. These go
> together in one commit since they are fairly tightly coupled types.
> 
> A few things have been stubbed out, to be implemented as further bits of
> the DRM subsystem are introduced.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Ok so this is fairly fundamental lifetime fun and might be fairly
orthogonal to most of the things you actually want to do with a drm driver
(like implement gem or whatever). So separate mail.

So upfront short intro. There's 3 different lifetimes involved in building
a drm driver:

- struct drm_driver. It's refcounted because it's fundamentally an uapi
  interface thing, and all the various uapi interfaces that build on top
  of this (drm_file, dma_buf, ...) need to hold references on it. It's
  supposed to survive for as long as userspace needs it or the underlying
  driver is bound, whichever is longer.

- struct device. Refcounted and good for dmesg printing, nothing else.
  Yes, because ...

- ... the actual hardware resource, in many places also represented by struct
  device. Not refcounted, instead it's limited by hotunplug or more
  precisiely, how long your driver is bound to the struct device. You
  could make a case that in C this is represented by the bus specific type
  (e.g. platform_device), and the bus-specific hooks delineate the
  lifetime (for platform devices that's that's from ->probe to ->remove).
  Since there's no C type for this I'll call this hwdevice.

I think for rust it would be good if we model a bit more precisely in
rust. It might be possible to use the bus-specific types as the hwdevice,
but that's not entirely right either because each bus device is both
representing the hwdevice and the refcounted struct device.

Now onto lifetimes, or at least how this is usually handled.

- struct device should be obvious, the important part really is that the
  rust wrappers should not allow anything to be done with that which is
  tied to the hwdevice lifetime. Which is almost everything you want to do
  with a struct (platform_)device (aside from pure sw stuff like dmesg
  printing).

- the hwdevice is _not_ refcounted. I think in rust this maps to borrow
  semantics, to make sure that the reference only stays valid during a
  driver callback. The driver core/bus driver ensure that all the various
  callbacks (pm_ops, platform_driver, ...) finish before the ->remove
  callback starts.

- usually the the link from hwdevice to drm_device is done with a
  refcounted drm_device stored with dev_set_drvdata. For rust it'd be nice
  if that's the Driver and fully typesafe and automatically cleaned up.

- which brings us to how hwdevice cleanup works in C: That's done with all
  the devm_ helpers for practically anything you might want to set up for
  hw access: mappings, interrupts, .... Note that there's also
  devm_*malloc functions, when drivers use them that's almost always a bug
  because generally allocations should stick around with the drm_device
  and not go down with the non-refcounted hwdevice lifetime.

  For added fun the bus/driver core also uses devm_ to mange things tied
  to the refcounted struct device, which works because devm_ nests and
  ->probe opens up a new devm_ bucket which is torn down at ->remove time.
  But luckily drivers should never deal with that, so for them (on the C
  side at least) devm_ is the right lifetime model for things tied to the
  hwdevice lifetime.

  For rust this means that we really should try to tie all the hw related
  things into devm or equivalent, and make both sure it's automatically
  cleaned up at that point, but also no later (because if you clean up hw
  stuff after ->remove you have a driver bug).

- Similarly on the drm_device side we have drmm_. You can have some
  refcounted things within the lifetime of drm_device (like dma_buf), but
  if things the driver creates survive past the point of drm_device, then
  probably something went really wrong. Either a leak or you'll blow up in
  the C code.

  So again for rust I think we should try to model this, and make sure
  (with borrow semantics and avoiding full refcounting like the plague in
  driver code) that driver structs and other sw things can't outlive the
  drm_device, but also don't hold it alive unduly.

- Since the point of a drm_device is to drive hardware, you need to be
  able to safely dereference the drm_device->dev pointer and know whether
  it's still a hwdevice (i.e. useful) or just a struct device because the
  hw is gone. That's done with drm_dev_enter/exit and making sure that
  ->remove calls drm_dev_unplug as the very first thing, before it starts
  tearing down hw resources like mappings, interrupts, ...

  On the C side we entirely rely on review for this, and it just doesn't
  work. Unless exhaustively tested, hotunplug just dies, and I think for
  more complex drivers this is something where Rust type enforcement could
  really shine: We'd need to make sure that a driver can only get at the
  hwtype where it's safe (bus/driver core callbacks or drm_dev_enter/exit
  as a mutex-guard thing). Furthermore we need to ensure that that
  drm_dev_unplug really is the first thing done in ->remove (and by
  symmetry drm_dev_register the last thing probe does). I think a neat way
  would be if ->probe would return a container of things that implement a
  Uapi trait, which has register and unplug functions, and then the rust
  glue calls that.

  More aggressively would be to outright not implement ->remove for rust
  drivers and entirely rely on the devm stack of cleanup actions. This
  would still need a type trick to ensure that drm_dev_register is the
  very last thing that's called (to make sure the matching drm_dev_unplug
  is the first thing).

- Despite that we have refcounted pointers going both ways from
  drm_device<->device there's no loop, because the device->drm_device
  reference is dropped with hwdevice lifetime (through devm if you're
  using devm_drm_dev_alloc in a C driver), which breaks the loop. Note
  that the drm_device->device refcount/pointer stays until the very end of
  drm_device (need that for dmesg printing), but outside of
  drm_dev_enter/exit it's really just a temption for bugs.

- I think ideally drivers themselves should not even try to refcount
  drm_device or device, but instead have all it all tied directly. The
  exceptions really are only for when you have separate, free-standing
  uapi objects (like dma_buf or dma_fence or drm_file), and in those cases
  the combo of C code + rust glue should ensure that the refcounting is
  done right. If a rust driver has any additional refcounting need for
  these structs then I think we've screwed up the data lifetime model.

Apologies for the wall of text. I hope I didn't forget anything crucial,
I've been pondering this for a few weeks now :-)

Imo this doesn't need to be fixed before we merge asahi, but it is
something that I think really should fix because despite years of effort
and all the auto-cleanup infrastructure like devm_ and drmm_ C drivers are
still buggy by default, there's no clear understanding outside of a select
few about the problems ("devm_kmalloc considered harmful" is some actual
talk title), and I think this is something where Rust typing and borrow
checker really could substantially improve the state of the art.

And yes for a soc driver that's all fairly irrelevant, because it's
physically not possible to remove a device, but for most drm drivers it is
absolutely possible to burn them with a hotunplug (hotunplug of device
pass-through to a vm if you can't physically hotunplug the device itself),
so this isn't academic at all.

I'll try and type up the separate mail about semantics of gem drivers and
all that stuff tomorrow.

Cheers, Daniel

> ---
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/drm/device.rs       |  76 +++++++++
>  rust/kernel/drm/drv.rs          | 339 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   2 +
>  4 files changed, 420 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 2687bef1676f..2a999138c4ae 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,10 +6,13 @@
>   * Sorted alphabetically.
>   */
>  
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/fs.h>
>  #include <linux/ioctl.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/ktime.h>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> new file mode 100644
> index 000000000000..6007f941137a
> --- /dev/null
> +++ b/rust/kernel/drm/device.rs
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM device.
> +//!
> +//! C header: [`include/linux/drm/drm_device.h`](../../../../include/linux/drm/drm_device.h)
> +
> +use crate::{bindings, device, drm, types::ForeignOwnable};
> +use core::marker::PhantomData;
> +
> +/// Represents a reference to a DRM device. The device is reference-counted and is guaranteed to
> +/// not be dropped while this object is alive.
> +pub struct Device<T: drm::drv::Driver> {
> +    // Type invariant: ptr must be a valid and initialized drm_device,
> +    // and this value must either own a reference to it or the caller
> +    // must ensure that it is never dropped if the reference is borrowed.
> +    pub(super) ptr: *mut bindings::drm_device,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: drm::drv::Driver> Device<T> {
> +    // Not intended to be called externally, except via declare_drm_ioctls!()
> +    #[doc(hidden)]
> +    pub unsafe fn from_raw(raw: *mut bindings::drm_device) -> Device<T> {
> +        Device {
> +            ptr: raw,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    #[allow(dead_code)]
> +    pub(crate) fn raw(&self) -> *const bindings::drm_device {
> +        self.ptr
> +    }
> +
> +    pub(crate) fn raw_mut(&mut self) -> *mut bindings::drm_device {
> +        self.ptr
> +    }
> +
> +    /// Returns a borrowed reference to the user data associated with this Device.
> +    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
> +        unsafe { T::Data::borrow((*self.ptr).dev_private) }
> +    }
> +}
> +
> +impl<T: drm::drv::Driver> Drop for Device<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
> +        // relinquish it now.
> +        unsafe { bindings::drm_dev_put(self.ptr) };
> +    }
> +}
> +
> +impl<T: drm::drv::Driver> Clone for Device<T> {
> +    fn clone(&self) -> Self {
> +        // SAFETY: We get a new reference and then create a new owning object from the raw pointer
> +        unsafe {
> +            bindings::drm_dev_get(self.ptr);
> +            Device::from_raw(self.ptr)
> +        }
> +    }
> +}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> +unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> +// from any thread.
> +unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
> +
> +// Make drm::Device work for dev_info!() and friends
> +unsafe impl<T: drm::drv::Driver> device::RawDevice for Device<T> {
> +    fn raw_device(&self) -> *mut bindings::device {
> +        // SAFETY: ptr must be valid per the type invariant
> +        unsafe { (*self.ptr).dev }
> +    }
> +}
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> new file mode 100644
> index 000000000000..29a465515dc9
> --- /dev/null
> +++ b/rust/kernel/drm/drv.rs
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM driver core.
> +//!
> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> +
> +use crate::{
> +    bindings, device, drm,
> +    error::code::*,
> +    error::from_kernel_err_ptr,
> +    error::{Error, Result},
> +    prelude::*,
> +    private::Sealed,
> +    str::CStr,
> +    types::ForeignOwnable,
> +    ThisModule,
> +};
> +use core::{
> +    marker::{PhantomData, PhantomPinned},
> +    pin::Pin,
> +};
> +use macros::vtable;
> +
> +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports mode setting interfaces (KMS).
> +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> +/// Driver supports dedicated render nodes.
> +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> +/// Driver supports the full atomic modesetting userspace API.
> +///
> +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> +/// should not set this flag.
> +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> +/// submission.
> +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> +
> +/// Information data for a DRM Driver.
> +pub struct DriverInfo {
> +    /// Driver major version.
> +    pub major: i32,
> +    /// Driver minor version.
> +    pub minor: i32,
> +    /// Driver patchlevel version.
> +    pub patchlevel: i32,
> +    /// Driver name.
> +    pub name: &'static CStr,
> +    /// Driver description.
> +    pub desc: &'static CStr,
> +    /// Driver date.
> +    pub date: &'static CStr,
> +}
> +
> +/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
> +///
> +/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
> +pub struct AllocOps {
> +    pub(crate) gem_create_object: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            size: usize,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) prime_handle_to_fd: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            handle: u32,
> +            flags: u32,
> +            prime_fd: *mut core::ffi::c_int,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) prime_fd_to_handle: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            prime_fd: core::ffi::c_int,
> +            handle: *mut u32,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) gem_prime_import: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            dma_buf: *mut bindings::dma_buf,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) gem_prime_import_sg_table: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            attach: *mut bindings::dma_buf_attachment,
> +            sgt: *mut bindings::sg_table,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) gem_prime_mmap: Option<
> +        unsafe extern "C" fn(
> +            obj: *mut bindings::drm_gem_object,
> +            vma: *mut bindings::vm_area_struct,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_create: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            args: *mut bindings::drm_mode_create_dumb,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_map_offset: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            handle: u32,
> +            offset: *mut u64,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_destroy: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            handle: u32,
> +        ) -> core::ffi::c_int,
> +    >,
> +}
> +
> +/// Trait for memory manager implementations. Implemented internally.
> +pub trait AllocImpl: Sealed {
> +    /// The C callback operations for this memory manager.
> +    const ALLOC_OPS: AllocOps;
> +}
> +
> +/// A DRM driver implementation.
> +#[vtable]
> +pub trait Driver {
> +    /// Context data associated with the DRM driver
> +    ///
> +    /// Determines the type of the context data passed to each of the methods of the trait.
> +    type Data: ForeignOwnable + Sync + Send;
> +
> +    /// The type used to manage memory for this driver.
> +    ///
> +    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
> +    type Object: AllocImpl;
> +
> +    /// Driver metadata
> +    const INFO: DriverInfo;
> +
> +    /// Feature flags
> +    const FEATURES: u32;
> +
> +    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
> +    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> +}
> +
> +/// A registration of a DRM device
> +///
> +/// # Invariants:
> +///
> +/// drm is always a valid pointer to an allocated drm_device
> +pub struct Registration<T: Driver> {
> +    drm: drm::device::Device<T>,
> +    registered: bool,
> +    fops: bindings::file_operations,
> +    vtable: Pin<Box<bindings::drm_driver>>,
> +    _p: PhantomData<T>,
> +    _pin: PhantomPinned,
> +}
> +
> +#[cfg(CONFIG_DRM_LEGACY)]
> +macro_rules! drm_legacy_fields {
> +    ( $($field:ident: $val:expr),* $(,)? ) => {
> +        bindings::drm_driver {
> +            $( $field: $val ),*,
> +            firstopen: None,
> +            preclose: None,
> +            dma_ioctl: None,
> +            dma_quiescent: None,
> +            context_dtor: None,
> +            irq_handler: None,
> +            irq_preinstall: None,
> +            irq_postinstall: None,
> +            irq_uninstall: None,
> +            get_vblank_counter: None,
> +            enable_vblank: None,
> +            disable_vblank: None,
> +            dev_priv_size: 0,
> +        }
> +    }
> +}
> +
> +#[cfg(not(CONFIG_DRM_LEGACY))]
> +macro_rules! drm_legacy_fields {
> +    ( $($field:ident: $val:expr),* $(,)? ) => {
> +        bindings::drm_driver {
> +            $( $field: $val ),*
> +        }
> +    }
> +}
> +
> +/// Registers a DRM device with the rest of the kernel.
> +///
> +/// It automatically picks up THIS_MODULE.
> +#[allow(clippy::crate_in_macro_def)]
> +#[macro_export]
> +macro_rules! drm_device_register {
> +    ($reg:expr, $data:expr, $flags:expr $(,)?) => {{
> +        $crate::drm::drv::Registration::register($reg, $data, $flags, &crate::THIS_MODULE)
> +    }};
> +}
> +
> +impl<T: Driver> Registration<T> {
> +    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
> +        load: None,
> +        open: None, // TODO: File abstraction
> +        postclose: None, // TODO: File abstraction
> +        lastclose: None,
> +        unload: None,
> +        release: None,
> +        master_set: None,
> +        master_drop: None,
> +        debugfs_init: None,
> +        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
> +        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
> +        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
> +        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
> +        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
> +        gem_prime_mmap: T::Object::ALLOC_OPS.gem_prime_mmap,
> +        dumb_create: T::Object::ALLOC_OPS.dumb_create,
> +        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
> +        dumb_destroy: T::Object::ALLOC_OPS.dumb_destroy,
> +
> +        major: T::INFO.major,
> +        minor: T::INFO.minor,
> +        patchlevel: T::INFO.patchlevel,
> +        name: T::INFO.name.as_char_ptr() as *mut _,
> +        desc: T::INFO.desc.as_char_ptr() as *mut _,
> +        date: T::INFO.date.as_char_ptr() as *mut _,
> +
> +        driver_features: T::FEATURES,
> +        ioctls: T::IOCTLS.as_ptr(),
> +        num_ioctls: T::IOCTLS.len() as i32,
> +        fops: core::ptr::null_mut(),
> +    };
> +
> +    /// Creates a new [`Registration`] but does not register it yet.
> +    ///
> +    /// It is allowed to move.
> +    pub fn new(parent: &dyn device::RawDevice) -> Result<Self> {
> +        let vtable = Pin::new(Box::try_new(Self::VTABLE)?);
> +        let raw_drm = unsafe { bindings::drm_dev_alloc(&*vtable, parent.raw_device()) };
> +        let raw_drm = from_kernel_err_ptr(raw_drm)?;
> +
> +        // The reference count is one, and now we take ownership of that reference as a
> +        // drm::device::Device.
> +        let drm = unsafe { drm::device::Device::from_raw(raw_drm) };
> +
> +        Ok(Self {
> +            drm,
> +            registered: false,
> +            vtable,
> +            fops: Default::default(), // TODO: GEM abstraction
> +            _pin: PhantomPinned,
> +            _p: PhantomData,
> +        })
> +    }
> +
> +    /// Registers a DRM device with the rest of the kernel.
> +    ///
> +    /// Users are encouraged to use the [`drm_device_register!()`] macro because it automatically
> +    /// picks up the current module.
> +    pub fn register(
> +        self: Pin<&mut Self>,
> +        data: T::Data,
> +        flags: usize,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        if self.registered {
> +            // Already registered.
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We never move out of `this`.
> +        let this = unsafe { self.get_unchecked_mut() };
> +        let data_pointer = <T::Data as ForeignOwnable>::into_foreign(data);
> +        // SAFETY: `drm` is valid per the type invariant
> +        unsafe {
> +            (*this.drm.raw_mut()).dev_private = data_pointer as *mut _;
> +        }
> +
> +        this.fops.owner = module.0;
> +        this.vtable.fops = &this.fops;
> +
> +        // SAFETY: The device is now initialized and ready to be registered.
> +        let ret = unsafe { bindings::drm_dev_register(this.drm.raw_mut(), flags as u64) };
> +        if ret < 0 {
> +            // SAFETY: `data_pointer` was returned by `into_foreign` above.
> +            unsafe { T::Data::from_foreign(data_pointer) };
> +            return Err(Error::from_kernel_errno(ret));
> +        }
> +
> +        this.registered = true;
> +        Ok(())
> +    }
> +
> +    /// Returns a reference to the `Device` instance for this registration.
> +    pub fn device(&self) -> &drm::device::Device<T> {
> +        &self.drm
> +    }
> +}
> +
> +// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
> +// or CPUs, so it is safe to share it.
> +unsafe impl<T: Driver> Sync for Registration<T> {}
> +
> +// SAFETY: Registration with and unregistration from the drm subsystem can happen from any thread.
> +// Additionally, `T::Data` (which is dropped during unregistration) is `Send`, so it is ok to move
> +// `Registration` to different threads.
> +#[allow(clippy::non_send_fields_in_send_ty)]
> +unsafe impl<T: Driver> Send for Registration<T> {}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    /// Removes the registration from the kernel if it has completed successfully before.
> +    fn drop(&mut self) {
> +        if self.registered {
> +            // Get a pointer to the data stored in device before destroying it.
> +            // SAFETY: `drm` is valid per the type invariant
> +            let data_pointer = unsafe { (*self.drm.raw_mut()).dev_private };
> +
> +            // SAFETY: Since `registered` is true, `self.drm` is both valid and registered.
> +            unsafe { bindings::drm_dev_unregister(self.drm.raw_mut()) };
> +
> +            // Free data as well.
> +            // SAFETY: `data_pointer` was returned by `into_foreign` during registration.
> +            unsafe { <T::Data as ForeignOwnable>::from_foreign(data_pointer) };
> +        }
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 9ec6d7cbcaf3..69376b3c6db9 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -2,4 +2,6 @@
>  
>  //! DRM subsystem abstractions.
>  
> +pub mod device;
> +pub mod drv;
>  pub mod ioctl;
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
