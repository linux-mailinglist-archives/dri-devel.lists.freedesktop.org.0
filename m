Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4BAC8D8D
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 14:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7240210E851;
	Fri, 30 May 2025 12:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dcp6Mbz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B910E848;
 Fri, 30 May 2025 12:28:02 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c5675dec99so206746885a.0; 
 Fri, 30 May 2025 05:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748608082; x=1749212882; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G7jnJ7AlpnOgkaNlu7SRmHaToN0O+rqjJSEWeahti/0=;
 b=Dcp6Mbz77wfT1DxHiRspsYJwOqwgF1GmS0l06Sj3FI0c96fn6BqcI6ZEPCOW8Wrpvs
 H/yxV/9C60guBsBhmVdvDLgOAU20kp4K7FyH2kQZgypEKMJJ1YFrwsaei4pFeIRNQh8C
 HqlkogY8C4cI1Ne5lfe6ctKkwxzNAm3YYQw1frsVYsL3kddhCemfLre/DSGAmU349ohz
 /HICCSJr0x8rmGpl15COqggZ6FtIh1P6y+OoeJyKcKdJYPvBwUGuVjJS4LUd09SEkNF2
 YZbshDNj20dMegMU7TXtF+zT5qAO7bipBLy/mtbXhpSwHt8Pi56C0VYA1h6TkrB8ExGw
 6n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748608082; x=1749212882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7jnJ7AlpnOgkaNlu7SRmHaToN0O+rqjJSEWeahti/0=;
 b=IwK9b2Xv+GE/o1dGxDtUCjdvm8VVZ48reGPuhwChlK3j7QkD2gRyxAI7ft7oGENIJA
 Pd1kQwXLdyxH3spUhLvDxiRVmhzY10NdcDfo0V6+p7gYncGzmyAvCfv011lD0C8sIyQZ
 5fEV2uTOCktu7mGD552/IP0DU8VcX3fXJJBjvPuqjENnaDOskgNcSQEiVkEmhoCZ1vlp
 LpKmFvEi0GuTWms5pJNeK+6O1PpBVf9Lz1kaGZ7dyH/dnY3rLwq/lTZ7mleIxH//dzkY
 ce+PJvVeeDpaFAIvCXmurV7f1r4A/Vnzc2j94eie4UlqwMTcbr4RJEoFASwSE8KeYCAA
 V3lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXix4JOiX8cq3phZz9Vj7wmFA5PRFoBDfpjPymFLacO/M1fWQYgp2IHy4UujYsZlhDljwtuetCrrg=@lists.freedesktop.org,
 AJvYcCWgsxhIO3fNeIgeMDEYe4ZckOwP4CrnomfaXnAi+JFdrv0wbpSyP1dBLEG+2oUhvKazUKM+oN+MDA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEIREZuzrP+jxn7UeCOOdUbpNokn2bmIFvhgU2yrQ3NKp6sYDa
 jUj8ZxTPFSusWHOipSFzYxjzsqy/RN2ACPRr33DI8YKP1gku+NET69rp
X-Gm-Gg: ASbGncvDR+hR+z0LDaBn5RadP/rKGvesUxNuNjOp/QMvrN205k5NbjbSmCSA4CQTsJL
 D3FyQp9OF2pHnzkrnb3uhBZMZcbWop1mbwl/Thq0eTFEEGtJuUILxREmwbvIQbTRXS2WuhhWpqf
 40iWuaEAYLLuCTnXYbvi8penLun/6NXfkuR6URf0NY6jGlhbGgTpCJ2xsPqw8KfHrI4txtEYL6V
 E3SGPuSLZ6/OYzzgXYFo0BIY8qCrJE1fy2NYFEFoSYABMr+ZuYKUBU4L79Mzu8ICjJ310jdhKkk
 WDvY7XRNjPEx9dm4u3kSZIOIzrt3WOnVmL0UWY4GeCfZEY+ykSi8p9veT3EkkC9Gp4zF6/yR9jE
 GbDpvRYJWSXWDOxBB0cC9hFNFyRVvWxTXT9OZfLn7Fxfdj9+SRbkFmXUcSdBs
X-Google-Smtp-Source: AGHT+IH5mqS+/k5lKVHR5A7kT0427JiEKiLRbp8abhViCNWcsWQSsJNPwNzZyuM4w2nU1vb4dsRPIQ==
X-Received: by 2002:a05:620a:4083:b0:7c7:bb07:af07 with SMTP id
 af79cd13be357-7d0a1fe0204mr530721285a.22.1748608081802; 
 Fri, 30 May 2025 05:28:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:fbe8]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a4358ad334sm19700201cf.27.2025.05.30.05.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 05:28:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 30 May 2025 08:27:46 -0400
Subject: [PATCH v11 5/5] rust: remove core::ffi::CStr reexport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-cstr-core-v11-5-cd9c0cbcb902@gmail.com>
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
In-Reply-To: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

Clean up references to `kernel::str::CStr`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs   |  3 ++-
 drivers/gpu/nova-core/firmware.rs |  2 +-
 drivers/net/phy/ax88796b_rust.rs  |  1 +
 drivers/net/phy/qt2025.rs         |  1 +
 rust/kernel/device.rs             |  3 +--
 rust/kernel/driver.rs             |  4 ++--
 rust/kernel/error.rs              |  6 ++----
 rust/kernel/faux.rs               |  5 ++++-
 rust/kernel/firmware.rs           | 15 ++++-----------
 rust/kernel/kunit.rs              |  6 +++---
 rust/kernel/lib.rs                |  2 +-
 rust/kernel/miscdevice.rs         |  3 +--
 rust/kernel/net/phy.rs            |  4 +++-
 rust/kernel/of.rs                 |  3 ++-
 rust/kernel/pci.rs                |  2 +-
 rust/kernel/platform.rs           |  2 +-
 rust/kernel/prelude.rs            |  5 +----
 rust/kernel/str.rs                |  8 +++-----
 rust/kernel/sync/condvar.rs       |  4 ++--
 rust/kernel/sync/lock.rs          |  4 ++--
 rust/kernel/sync/lock/global.rs   |  5 +++--
 rust/kernel/sync/poll.rs          |  1 +
 rust/kernel/workqueue.rs          |  1 +
 rust/macros/module.rs             |  2 +-
 24 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index d8192a9bef63..ba63238d352f 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,7 +27,8 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use kernel::{prelude::*, str::CStr};
+use core::ffi::CStr;
+use kernel::prelude::*;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6e6361c59ca1..0af1f0df2fa5 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,7 +30,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
     }
 
     pub(crate) const fn create(
-        module_name: &'static kernel::str::CStr,
+        module_name: &'static core::ffi::CStr,
     ) -> firmware::ModInfoBuilder<N> {
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..68b8e30ae296 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -4,6 +4,7 @@
 //! Rust Asix PHYs driver
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
+use core::ffi::CStr;
 use kernel::{
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 9ccc75f70219..78ce2866f2b6 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,6 +9,7 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
+use core::ffi::CStr;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 9074322c79e8..2cf5903f7dde 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,10 +6,9 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
-use core::{fmt, ptr};
+use core::{ffi::CStr, fmt, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::str::CStrExt as _;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index ec9166cedfa7..9926664d9ba2 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -6,8 +6,8 @@
 //! register using the [`Registration`] class.
 
 use crate::error::{Error, Result};
-use crate::{device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
-use core::pin::Pin;
+use crate::{device, of, try_pin_init, types::Opaque, ThisModule};
+use core::{ffi::CStr, pin::Pin};
 use pin_init::{pin_data, pinned_drop, PinInit};
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 933c048c04f1..b2b46d26f7b7 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,11 +4,9 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{
-    alloc::{layout::LayoutError, AllocError},
-    str::CStr,
-};
+use crate::alloc::{layout::LayoutError, AllocError};
 
+use core::ffi::CStr;
 use core::fmt;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bb..d9e5cd265101 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,10 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::{
+    ffi::CStr,
+    ptr::{addr_of_mut, null, null_mut, NonNull},
+};
 
 /// The registration of a faux device.
 ///
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 09fd3a27bcf0..4ba5e5589d7b 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -4,15 +4,8 @@
 //!
 //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
-use crate::{
-    bindings,
-    device::Device,
-    error::Error,
-    error::Result,
-    ffi,
-    str::{CStr, CStrExt as _},
-};
-use core::ptr::NonNull;
+use crate::{bindings, device::Device, error::Error, error::Result, ffi, str::CStrExt as _};
+use core::{ffi::CStr, ptr::NonNull};
 
 /// # Invariants
 ///
@@ -168,7 +161,7 @@ unsafe impl Sync for Firmware {}
 ///     const DIR: &'static str = "vendor/chip/";
 ///     const FILES: [&'static str; 3] = [ "foo", "bar", "baz" ];
 ///
-///     const fn create(module_name: &'static kernel::str::CStr) -> firmware::ModInfoBuilder<N> {
+///     const fn create(module_name: &'static core::ffi::CStr) -> firmware::ModInfoBuilder<N> {
 ///         let mut builder = firmware::ModInfoBuilder::new(module_name);
 ///
 ///         let mut i = 0;
@@ -202,7 +195,7 @@ macro_rules! module_firmware {
     // this macro. Hence, we can neither use `expr` nor `ty`.
     ($($builder:tt)*) => {
         const _: () = {
-            const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
+            const __MODULE_FIRMWARE_PREFIX: &'static ::core::ffi::CStr = if cfg!(MODULE) {
                 c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 2bab61910f1e..5504a6216d19 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -57,9 +57,9 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static FILE: &'static $crate::str::CStr = $file;
+            static FILE: &'static ::core::ffi::CStr = $file;
             static LINE: i32 = ::core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr =
+            static CONDITION: &'static ::core::ffi::CStr =
                 $crate::str_to_cstr!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
@@ -195,7 +195,7 @@ pub fn is_test_result_ok(t: impl TestResult) -> bool {
 /// Use [`kunit_case_null`] to generate such a delimiter.
 #[doc(hidden)]
 pub const fn kunit_case(
-    name: &'static kernel::str::CStr,
+    name: &'static core::ffi::CStr,
     run_case: unsafe extern "C" fn(*mut kernel::bindings::kunit),
 ) -> kernel::bindings::kunit_case {
     kernel::bindings::kunit_case {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6e8eb57fb225..1b162973b71d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -152,7 +152,7 @@ fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, error::Erro
 /// Metadata attached to a [`Module`] or [`InPlaceModule`].
 pub trait ModuleMetadata {
     /// The name of the module as specified in the `module!` macro.
-    const NAME: &'static crate::str::CStr;
+    const NAME: &'static core::ffi::CStr;
 }
 
 /// Equivalent to `THIS_MODULE` in the C API.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index d684ec4ef4d0..47f718a9ceb5 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -16,10 +16,9 @@
     fs::File,
     prelude::*,
     seq_file::SeqFile,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{ffi::CStr, marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8129419a3931..72635af8f20e 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::{ffi::CStr, marker::PhantomData, ptr::addr_of_mut};
 
 pub mod reg;
 
@@ -780,6 +780,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -807,6 +808,7 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 12ea65df46de..087ac8e05551 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -2,7 +2,8 @@
 
 //! Device Tree / Open Firmware abstractions.
 
-use crate::{bindings, device_id::RawDeviceId, prelude::*};
+use crate::{bindings, device_id::RawDeviceId};
+use core::ffi::CStr;
 
 /// IdTable type for OF drivers.
 pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c17a32b76d74..86df366bf911 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -13,11 +13,11 @@
     error::{to_result, Result},
     io::Io,
     io::IoRaw,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
 use core::{
+    ffi::CStr,
     marker::PhantomData,
     ops::Deref,
     ptr::{addr_of_mut, NonNull},
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 65916b5936e6..272a7401c0dc 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -9,12 +9,12 @@
     error::{to_result, Result},
     of,
     prelude::*,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
 
 use core::{
+    ffi::CStr,
     marker::PhantomData,
     ops::Deref,
     ptr::{addr_of_mut, NonNull},
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 244b660fa835..3f7ca5a95160 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -40,10 +40,7 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{
-    str::{CStr, CStrExt as _},
-    ThisModule,
-};
+pub use super::{str::CStrExt as _, ThisModule};
 
 pub use super::init::InPlaceInit;
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index ff5ae125be0d..cc882c5a8d67 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::ffi::CStr;
 use core::fmt::{self, Write};
 use core::ops::{Deref, DerefMut, Index};
 
@@ -175,8 +176,6 @@ macro_rules! b_str {
     }};
 }
 
-pub use core::ffi::CStr;
-
 /// Returns a C pointer to the string.
 // It is a free function rather than a method on an extension trait because:
 //
@@ -267,7 +266,6 @@ impl fmt::Display for crate::fmt::Adapter<&CStr> {
     ///
     /// ```
     /// # use kernel::prelude::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
@@ -377,8 +375,8 @@ fn as_ref(&self) -> &BStr {
 /// # Examples
 ///
 /// ```
+/// # use core::ffi::CStr;
 /// # use kernel::str_to_cstr;
-/// # use kernel::str::CStr;
 /// const MY_CSTR: &CStr = str_to_cstr!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -388,7 +386,7 @@ macro_rules! str_to_cstr {
     // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
-        const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
+        const C: &core::ffi::CStr = match core::ffi::CStr::from_bytes_with_nul(S.as_bytes()) {
             Ok(v) => v,
             Err(_) => panic!("string contains interior NUL"),
         };
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 0b6bc7f2878d..09bc35feb451 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -8,14 +8,14 @@
 use super::{lock::Backend, lock::Guard, LockClassKey};
 use crate::{
     ffi::{c_int, c_long},
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
     },
     time::Jiffies,
     types::Opaque,
 };
-use core::{marker::PhantomPinned, pin::Pin, ptr};
+use core::{ffi::CStr, marker::PhantomPinned, pin::Pin, ptr};
 use pin_init::{pin_data, pin_init, PinInit};
 
 /// Creates a [`CondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index a777a22976e0..21deff0bb13b 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,10 +7,10 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
+use core::{cell::UnsafeCell, ffi::CStr, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit};
 
 pub mod mutex;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 9caa9b419f09..ab5a3947fdd6 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -5,13 +5,14 @@
 //! Support for defining statics containing locks.
 
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     sync::lock::{Backend, Guard, Lock},
     sync::{LockClassKey, LockedBy},
     types::Opaque,
 };
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::{PhantomData, PhantomPinned},
     pin::Pin,
 };
@@ -267,7 +268,7 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr =
+            const NAME: &'static ::core::ffi::CStr =
                 $crate::str_to_cstr!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b..bf2fb24d04ea 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -11,6 +11,7 @@
     sync::{CondVar, LockClassKey},
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::ops::Deref;
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index dbec533fd31f..bb3f917204f8 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index ef1906285a55..1ec923eb9383 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -232,7 +232,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             type LocalModule = {type_};
 
             impl ::kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static ::kernel::str::CStr = c\"{name}\";
+                const NAME: &'static ::core::ffi::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.

-- 
2.49.0

