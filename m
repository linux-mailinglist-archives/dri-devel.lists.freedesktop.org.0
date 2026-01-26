Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKc0Kz8jd2mZcgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA785633
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CD510E3EE;
	Mon, 26 Jan 2026 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8410E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:17:58 +0000 (UTC)
X-UUID: 820eee04fa8f11f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:428aca61-9cdf-4562-98cc-f49a3323049a, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:64da72c85922e324a961fe177d2a7718,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
 ,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
 SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 820eee04fa8f11f0b0f03b4cfa9209d1-20260126
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 831919726; Mon, 26 Jan 2026 16:17:51 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH v1 v1 3/4] rust: fb: add framebuffer driver support
Date: Mon, 26 Jan 2026 16:17:43 +0800
Message-Id: <20260126081744.781392-4-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:tzimmermann@suse.de,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:pengfuyuan@kylinos.cn,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pengfuyuan@kylinos.cn,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,suse.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org,kylinos.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengfuyuan@kylinos.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.813];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.red:url,0.blue:url]
X-Rspamd-Queue-Id: D0FA785633
X-Rspamd-Action: no action

Add Rust bindings and safe abstractions for the Linux framebuffer subsystem.

This implementation provides Rust abstractions for the framebuffer subsystem,
following the same patterns established in the DRM subsystem. The abstraction
wraps the existing C framebuffer infrastructure (`struct fb_info`, `struct
fb_ops`) with type-safe Rust interfaces, allowing drivers to be implemented
in Rust while maintaining full compatibility with the existing C framebuffer
subsystem.

The implementation includes:

- Device abstraction (`device.rs`): Provides a typed `fb::Device` wrapper
  around `struct fb_info` with reference counting via `AlwaysRefCounted`. The
  device abstraction provides safe access to screen information (`var()`,
  `fix()`), memory mappings (`screen_base()`, `screen_size()`), and
  driver-specific data (via `data()` or direct dereference). Device lifecycle
  is managed through `ARef` and the `destroy_callback` which properly cleans
  up driver resources.

- Driver abstractions (`driver.rs`): Defines the `Driver` trait (which
  specifies driver metadata via `DriverInfo` and associates an `Operations`
  implementation) and the `Operations` trait (corresponding to `struct fb_ops`).
  The `Operations` trait provides methods for reading, writing, color register
  management (`setcolreg`), blitting operations (`fillrect`, `copyarea`,
  `imageblit`), memory mapping (`mmap`), and resource cleanup (`destroy`).
  The `Registration` type manages device registration and unregistration with
  the framebuffer subsystem.

- Screen information (`screeninfo.rs`): Safe wrappers for `fb_var_screeninfo`
  and `fb_fix_screeninfo` structures. Provides accessors for screen parameters
  (resolution, color depth, memory layout) and color component bitfields
  (`red()`, `green()`, `blue()`, `transp()`). Also includes related constants
  for framebuffer types, visual modes, acceleration, activation, and video
  modes.

- I/O operations (`io.rs`): Safe wrappers for the generic framebuffer I/O
  helpers (`fb_io_read`, `fb_io_write`, `fb_io_mmap`). These functions provide
  generic implementations for reading from, writing to, and memory-mapping
  framebuffer devices, which can be used by drivers that don't implement
  custom I/O operations.

- Blit operations (`blit.rs`): Safe wrappers for framebuffer blit operation
  structures (`FillRect` for `fb_fillrect`, `CopyArea` for `fb_copyarea`,
  `Image` for `fb_image`) and software implementation functions
  (`cfb_fillrect`, `cfb_copyarea`, `cfb_imageblit`). These software functions
  provide generic implementations for rectangle filling, area copying, and
  image blitting, which can be used by drivers that don't implement hardware
  acceleration.

The implementation follows Rust for Linux safety guidelines:
- C callbacks (`read_callback`, `write_callback`, `setcolreg_callback`, etc.)
  are properly bridged to Rust trait methods via the `Operations` trait
- Memory safety is ensured through proper use of `Opaque<fb_info>`, `ARef`,
  and `AlwaysRefCounted` for reference counting
- Type invariants are documented (e.g., `Device` invariants) and enforced
  through the type system
- Resource cleanup is handled via RAII: `Registration` uses `Drop` for
  unregistration, and `destroy_callback` ensures proper cleanup order
  (driver resources via `T::Ops::destroy`, driver data via `drop_in_place`,
  then `fb_info` structure via `framebuffer_release`)

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/fb/blit.rs          | 106 ++++++++
 rust/kernel/fb/device.rs        | 463 ++++++++++++++++++++++++++++++++
 rust/kernel/fb/driver.rs        | 169 ++++++++++++
 rust/kernel/fb/io.rs            |  76 ++++++
 rust/kernel/fb/mod.rs           |  23 ++
 rust/kernel/fb/screeninfo.rs    | 318 ++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 8 files changed, 1158 insertions(+)
 create mode 100644 rust/kernel/fb/blit.rs
 create mode 100644 rust/kernel/fb/device.rs
 create mode 100644 rust/kernel/fb/driver.rs
 create mode 100644 rust/kernel/fb/io.rs
 create mode 100644 rust/kernel/fb/mod.rs
 create mode 100644 rust/kernel/fb/screeninfo.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..bc47806eb365 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -53,6 +53,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
+#include <linux/fb.h>
 #include <linux/fdtable.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
diff --git a/rust/kernel/fb/blit.rs b/rust/kernel/fb/blit.rs
new file mode 100644
index 000000000000..b5378694d88d
--- /dev/null
+++ b/rust/kernel/fb/blit.rs
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer blit operations.
+//!
+//! This module provides safe wrappers for framebuffer blit operation structures and functions.
+//!
+//! C header: [`include/linux/fb.h`](srctree/include/linux/fb.h)
+
+use crate::{bindings, fb};
+
+/// Wrapper for `fb_fillrect` with safe accessors.
+///
+/// Describes a filled rectangle operation for framebuffer devices.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct FillRect(bindings::fb_fillrect);
+
+impl FillRect {
+    /// Create a new `FillRect` from the raw C structure.
+    ///
+    /// `fb_fillrect` is a POD type, so any bit pattern is valid.
+    pub const fn from_raw(raw: bindings::fb_fillrect) -> Self {
+        Self(raw)
+    }
+
+    /// Returns a reference to the underlying C `fb_fillrect` structure.
+    #[inline]
+    fn as_raw(&self) -> &bindings::fb_fillrect {
+        &self.0
+    }
+}
+
+/// Wrapper for `fb_copyarea` with safe accessors.
+///
+/// Describes a copy area operation for framebuffer devices.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct CopyArea(bindings::fb_copyarea);
+
+impl CopyArea {
+    /// Create a new `CopyArea` from the raw C structure.
+    ///
+    /// `fb_copyarea` is a POD type, so any bit pattern is valid.
+    pub const fn from_raw(raw: bindings::fb_copyarea) -> Self {
+        Self(raw)
+    }
+
+    /// Returns a reference to the underlying C `fb_copyarea` structure.
+    #[inline]
+    fn as_raw(&self) -> &bindings::fb_copyarea {
+        &self.0
+    }
+}
+
+/// Wrapper for `fb_image` with safe accessors.
+///
+/// Describes an image blit operation for framebuffer devices.
+#[repr(transparent)]
+pub struct Image(bindings::fb_image);
+
+impl Image {
+    /// Create a new `Image` from the raw C structure.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `raw` is properly initialized.
+    pub const unsafe fn from_raw(raw: bindings::fb_image) -> Self {
+        Self(raw)
+    }
+
+    /// Returns a reference to the underlying C `fb_image` structure.
+    #[inline]
+    fn as_raw(&self) -> &bindings::fb_image {
+        &self.0
+    }
+}
+
+/// Software rectangle fill operation.
+///
+/// Invokes the generic `cfb_fillrect` helper.
+pub fn cfb_fillrect<T: fb::Driver>(device: &fb::Device<T>, rect: &FillRect) {
+    // SAFETY: Both `device.as_raw()` and `rect.as_raw()` return valid pointers by type invariants.
+    unsafe {
+        bindings::cfb_fillrect(device.as_raw(), rect.as_raw());
+    }
+}
+
+/// Software area copy operation.
+///
+/// Invokes the generic `cfb_copyarea` helper.
+pub fn cfb_copyarea<T: fb::Driver>(device: &fb::Device<T>, area: &CopyArea) {
+    // SAFETY: Both `device.as_raw()` and `area.as_raw()` return valid pointers by type invariants.
+    unsafe {
+        bindings::cfb_copyarea(device.as_raw(), area.as_raw());
+    }
+}
+
+/// Software image blit operation.
+///
+/// Invokes the generic `cfb_imageblit` helper.
+pub fn cfb_imageblit<T: fb::Driver>(device: &fb::Device<T>, image: &Image) {
+    // SAFETY: Both `device.as_raw()` and `image.as_raw()` return valid pointers by type invariants.
+    unsafe {
+        bindings::cfb_imageblit(device.as_raw(), image.as_raw());
+    }
+}
diff --git a/rust/kernel/fb/device.rs b/rust/kernel/fb/device.rs
new file mode 100644
index 000000000000..7e7f36e5e4b8
--- /dev/null
+++ b/rust/kernel/fb/device.rs
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer device.
+//!
+//! This module provides the core abstractions for framebuffer device management.
+//!
+//! C header: [`include/linux/fb.h`]
+
+use crate::{
+    bindings, device,
+    error::from_err_ptr,
+    fb,
+    fb::driver::Operations,
+    fs::file,
+    mm,
+    prelude::*,
+    sync::{
+        aref::{ARef, AlwaysRefCounted},
+        Refcount,
+    },
+    types::Opaque,
+};
+use core::{
+    ffi::{c_int, c_uint},
+    marker::PhantomData,
+    mem,
+    ops::Deref,
+    ptr,
+    ptr::NonNull,
+};
+
+/// A typed framebuffer device with a specific `fb::Driver` implementation.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct fb_info` created by the C portion of the kernel.
+///
+/// - `self.0` is a valid pointer to a `struct fb_info`.
+/// - The `fb_info.par` field points to a valid `T::Data` instance.
+/// - The `fb_info.fbops` field always points to `Self::FBOPS` and is never null.
+///
+/// Instances of this type are always reference-counted.
+#[repr(transparent)]
+pub struct Device<T: fb::Driver>(Opaque<bindings::fb_info>, PhantomData<T>);
+
+impl<T: fb::Driver> Device<T> {
+    /// Returns a reference to the underlying C `struct fb_info`.
+    #[inline]
+    fn as_ref(&self) -> &bindings::fb_info {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        unsafe { &*self.as_raw() }
+    }
+
+    /// Returns the variable screen info.
+    pub fn var(&self) -> &fb::VarScreenInfo {
+        // SAFETY: `var` is a valid field of `fb_info` and remains valid for the lifetime of `self`.
+        unsafe { fb::VarScreenInfo::from_raw(&self.as_ref().var) }
+    }
+
+    /// Returns the fixed screen info.
+    pub fn fix(&self) -> &fb::FixScreenInfo {
+        // SAFETY: `fix` is a valid field of `fb_info` and remains valid for the lifetime of `self`.
+        unsafe { fb::FixScreenInfo::from_raw(&self.as_ref().fix) }
+    }
+
+    /// Returns the screen base address.
+    pub fn screen_base(&self) -> *mut u8 {
+        // SAFETY: `screen_base` is a union field accessed via the generated union.
+        unsafe { self.as_ref().__bindgen_anon_1.screen_base as *mut u8 }
+    }
+
+    /// Returns the screen size.
+    pub fn screen_size(&self) -> usize {
+        self.as_ref().screen_size as usize
+    }
+
+    /// Returns the pseudo palette pointer.
+    pub fn pseudo_palette(&self) -> *mut core::ffi::c_void {
+        self.as_ref().pseudo_palette
+    }
+
+    /// Returns the framebuffer device node number.
+    ///
+    /// This is the device node identifier assigned by the framebuffer subsystem
+    /// when the device is registered (e.g., 0 for /dev/fb0, 1 for /dev/fb1, etc.).
+    pub fn node(&self) -> i32 {
+        self.as_ref().node
+    }
+
+    /// Configures the fixed screen information.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that:
+    /// - The device is not yet registered with the framebuffer subsystem
+    /// - The provided configuration is valid for this device
+    pub unsafe fn configure_fix<F>(&self, f: F)
+    where
+        F: FnOnce(&mut bindings::fb_fix_screeninfo),
+    {
+        // SAFETY: By the safety requirements, we have exclusive access to the device during
+        // initialization, before registration.
+        let info_ptr = self.as_raw();
+        unsafe {
+            f(&mut (*info_ptr).fix);
+        }
+    }
+
+    /// Configures the variable screen information.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that:
+    /// - The device is not yet registered with the framebuffer subsystem
+    /// - The provided configuration is valid for this device
+    pub unsafe fn configure_var<F>(&self, f: F)
+    where
+        F: FnOnce(&mut bindings::fb_var_screeninfo),
+    {
+        // SAFETY: By the safety requirements, we have exclusive access to the device during
+        // initialization, before registration.
+        let info_ptr = self.as_raw();
+        unsafe {
+            f(&mut (*info_ptr).var);
+        }
+    }
+
+    /// Sets the screen base address.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that:
+    /// - The device is not yet registered with the framebuffer subsystem
+    /// - The address points to valid, mapped framebuffer memory
+    /// - The memory remains valid for the lifetime of the device
+    pub unsafe fn set_screen_base(&self, addr: *mut u8) {
+        // SAFETY: By the safety requirements, we have exclusive access during initialization.
+        let info_ptr = self.as_raw();
+        unsafe {
+            (*info_ptr).__bindgen_anon_1.screen_base = addr;
+        }
+    }
+
+    /// Sets the pseudo palette pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that:
+    /// - The device is not yet registered with the framebuffer subsystem
+    /// - The pointer points to valid memory with sufficient size
+    /// - The memory remains valid for the lifetime of the device
+    pub unsafe fn set_pseudo_palette(&self, palette: *mut core::ffi::c_void) {
+        // SAFETY: By the safety requirements, we have exclusive access during initialization.
+        let info_ptr = self.as_raw();
+        unsafe {
+            (*info_ptr).pseudo_palette = palette;
+        }
+    }
+
+    /// Callback for reading from framebuffers with non-linear layouts.
+    extern "C" fn read_callback(
+        info: *mut bindings::fb_info,
+        buf: *mut core::ffi::c_char,
+        count: usize,
+        ppos: *mut bindings::loff_t,
+    ) -> isize {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: C code ensures `buf` and `ppos` are valid. `buf` is a valid buffer pointer with
+        // `count` bytes, and `ppos` is a valid `file::Offset` pointer with exclusive access.
+        let pos: &mut file::Offset = unsafe { &mut *ppos };
+        let result = T::Ops::read(
+            &device,
+            unsafe { core::slice::from_raw_parts_mut(buf as *mut u8, count) },
+            pos,
+        );
+        match result {
+            Ok(n) => n as isize,
+            Err(e) => -(e.to_errno() as isize),
+        }
+    }
+
+    /// Callback for writing to framebuffers with non-linear layouts.
+    extern "C" fn write_callback(
+        info: *mut bindings::fb_info,
+        buf: *const core::ffi::c_char,
+        count: usize,
+        ppos: *mut bindings::loff_t,
+    ) -> isize {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: C code ensures `buf` and `ppos` are valid. `buf` is a valid buffer pointer with
+        // `count` bytes, and `ppos` is a valid `file::Offset` pointer with exclusive access.
+        let pos: &mut file::Offset = unsafe { &mut *ppos };
+        let result = T::Ops::write(
+            &device,
+            unsafe { core::slice::from_raw_parts(buf as *const u8, count) },
+            pos,
+        );
+        match result {
+            Ok(n) => n as isize,
+            Err(e) => -(e.to_errno() as isize),
+        }
+    }
+
+    /// Callback for setting color registers.
+    extern "C" fn setcolreg_callback(
+        regno: c_uint,
+        red: c_uint,
+        green: c_uint,
+        blue: c_uint,
+        transp: c_uint,
+        info: *mut bindings::fb_info,
+    ) -> c_int {
+        let device = unsafe { Self::from_raw(info) };
+        let result = T::Ops::setcolreg(&device, regno, red, green, blue, transp);
+        match result {
+            Ok(()) => 0,
+            Err(e) => e.to_errno() as c_int,
+        }
+    }
+
+    /// Callback for filling a rectangle.
+    extern "C" fn fillrect_callback(
+        info: *mut bindings::fb_info,
+        rect: *const bindings::fb_fillrect,
+    ) {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: C code ensures `rect` is valid and points to a properly initialized `fb_fillrect`.
+        let rect = unsafe { fb::FillRect::from_raw(*rect) };
+        T::Ops::fillrect(&device, &rect);
+    }
+
+    /// Callback for copying an area.
+    extern "C" fn copyarea_callback(
+        info: *mut bindings::fb_info,
+        area: *const bindings::fb_copyarea,
+    ) {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: C code ensures `area` is valid and points to a properly initialized `fb_copyarea`.
+        let area = unsafe { fb::CopyArea::from_raw(*area) };
+        T::Ops::copyarea(&device, &area);
+    }
+
+    /// Callback for blitting an image.
+    extern "C" fn imageblit_callback(
+        info: *mut bindings::fb_info,
+        image: *const bindings::fb_image,
+    ) {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: C code ensures `image` is valid and points to a properly initialized `fb_image`.
+        let image = unsafe { fb::Image::from_raw(*image) };
+        T::Ops::imageblit(&device, &image);
+    }
+
+    /// Callback for memory mapping the framebuffer.
+    extern "C" fn mmap_callback(
+        info: *mut bindings::fb_info,
+        vma: *mut bindings::vm_area_struct,
+    ) -> c_int {
+        let device = unsafe { Self::from_raw(info) };
+        // SAFETY: The caller provides a `vma` that is undergoing initial VMA setup.
+        let area = unsafe { mm::virt::VmaNew::from_raw(vma) };
+        let result = T::Ops::mmap(&device, area);
+        match result {
+            Ok(()) => 0,
+            Err(e) => e.to_errno() as c_int,
+        }
+    }
+
+    /// Callback for destroying the framebuffer device.
+    ///
+    /// Performs cleanup in the correct order: driver resources, driver data, and finally
+    /// the fb_info structure itself.
+    extern "C" fn destroy_callback(info: *mut bindings::fb_info) {
+        let device = unsafe { Self::from_raw(info) };
+
+        // First, let the driver clean up its own resources (iounmap, release_mem_region, etc.)
+        T::Ops::destroy(&device);
+
+        // Get the pointer to the driver data (stored in `info->par`).
+        // SAFETY: `info` is valid and was allocated by `framebuffer_alloc` in `Device::new()`.
+        let par_ptr = unsafe { (*info).par };
+        if !par_ptr.is_null() {
+            // Manually call `Drop` for the driver data before `framebuffer_release`, since
+            // `framebuffer_release` will `kfree` the entire `fb_info` structure (including `par`),
+            // and `kfree` doesn't call Rust's `Drop`.
+            // SAFETY: `par_ptr` points to a valid `T::Data` instance that was initialized in
+            // `Device::new()`. This is the last access to the data before it's freed.
+            unsafe {
+                core::ptr::drop_in_place(par_ptr.cast::<T::Data>());
+            }
+        }
+
+        // Release the `fb_info` structure that was allocated by `framebuffer_alloc`.
+        // SAFETY: `info` is valid and was allocated by `framebuffer_alloc` in `Device::new()`.
+        unsafe {
+            bindings::framebuffer_release(info);
+        }
+    }
+
+    /// Static `fb_ops` table for this driver type.
+    ///
+    /// This table is shared by all instances of this driver type.
+    const FBOPS: bindings::fb_ops = bindings::fb_ops {
+        owner: core::ptr::null_mut(),
+        fb_open: None,
+        fb_release: None,
+        fb_read: Some(Self::read_callback),
+        fb_write: Some(Self::write_callback),
+        fb_check_var: None,
+        fb_set_par: None,
+        fb_setcolreg: Some(Self::setcolreg_callback),
+        fb_setcmap: None,
+        fb_blank: None,
+        fb_pan_display: None,
+        fb_fillrect: Some(Self::fillrect_callback),
+        fb_copyarea: Some(Self::copyarea_callback),
+        fb_imageblit: Some(Self::imageblit_callback),
+        fb_cursor: None,
+        fb_sync: None,
+        fb_ioctl: None,
+        fb_compat_ioctl: None,
+        fb_mmap: Some(Self::mmap_callback),
+        fb_get_caps: None,
+        fb_destroy: Some(Self::destroy_callback),
+        fb_debug_enter: None,
+        fb_debug_leave: None,
+    };
+
+    /// Creates a new `fb::Device` for a `fb::Driver`.
+    ///
+    /// The C `framebuffer_alloc` function allocates memory as:
+    /// `[fb_info][padding][driver_data]`
+    ///
+    /// `Device<T>` is `#[repr(transparent)]` around `Opaque<fb_info>`, so a `Device<T>` pointer
+    /// is actually just an `fb_info` pointer. The driver data `T::Data` is stored in `info->par`.
+    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
+        let data_size = mem::size_of::<T::Data>();
+
+        // SAFETY: `dev.as_raw()` is valid by its type invariants.
+        let raw_info = unsafe { bindings::framebuffer_alloc(data_size, dev.as_raw()) };
+
+        let raw_info = NonNull::new(from_err_ptr(raw_info)?).ok_or(ENOMEM)?;
+
+        // SAFETY: `raw_info` is valid and non-null.
+        let par_ptr = unsafe { (*raw_info.as_ptr()).par };
+        if par_ptr.is_null() && data_size > 0 {
+            // SAFETY: We just allocated this, so it's safe to free.
+            unsafe { bindings::framebuffer_release(raw_info.as_ptr()) };
+            return Err(ENOMEM);
+        }
+
+        // Cast `par` to our data type pointer.
+        // SAFETY: `framebuffer_alloc` allocated enough space for `T::Data`.
+        let data_ptr = par_ptr.cast::<T::Data>();
+
+        // Initialize the data.
+        // SAFETY: `data_ptr` is a valid pointer to uninitialized memory of the correct size, and
+        // will not move until it is dropped.
+        if let Err(e) = unsafe { data.__pinned_init(data_ptr) } {
+            // SAFETY: We just allocated this, so it's safe to free.
+            unsafe { bindings::framebuffer_release(raw_info.as_ptr()) };
+            return Err(e);
+        }
+
+        // Set up `fb_ops`.
+        // SAFETY: `raw_info` is valid.
+        unsafe {
+            (*raw_info.as_ptr()).fbops = &Self::FBOPS;
+        }
+
+        // Initialize refcount to 1 for the `ARef` we're about to return.
+        // SAFETY: `raw_info` is valid and points to a properly allocated `fb_info`.
+        let device_ref = unsafe { &*raw_info.cast::<Self>().as_ptr() };
+        // SAFETY: `device_ref` is valid and points to a properly allocated `fb_info`.
+        unsafe {
+            device_ref.refcount().set(1);
+        }
+
+        // SAFETY: We've initialized the refcount to 1, and we're taking ownership of it.
+        // `Device<T>` is `#[repr(transparent)]` around `Opaque<fb_info>`, so this cast is valid.
+        Ok(unsafe { ARef::from_raw(raw_info.cast::<Self>()) })
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::fb_info {
+        self.0.get()
+    }
+
+    /// Returns a reference to the refcount field of the `fb_info`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `self.as_raw()` is valid.
+    unsafe fn refcount(&self) -> &Refcount {
+        // SAFETY: `Refcount` is a transparent wrapper around `refcount_t`, and `count` is the
+        // first field of `fb_info`. By the safety requirements, `self.as_raw()` is valid.
+        unsafe {
+            let count_ptr = ptr::addr_of_mut!((*self.as_raw()).count);
+            &*count_ptr.cast::<Refcount>()
+        }
+    }
+
+    /// Creates a reference from a raw `fb_info` pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and points to an `fb_info`
+    /// that was created by `Device::<T>::new()`.
+    pub(crate) unsafe fn from_raw<'a>(ptr: *const bindings::fb_info) -> &'a Self {
+        // SAFETY: `Device<T>` is a transparent wrapper around `Opaque<fb_info>`.
+        unsafe { &*ptr.cast::<Self>() }
+    }
+
+    /// Returns a reference to the driver data stored in `fb_info.par`.
+    pub fn data(&self) -> &T::Data {
+        // SAFETY: By the type invariant, `info->par` points to a valid `T::Data` instance.
+        unsafe {
+            let par = (*self.as_raw()).par;
+            &*par.cast::<T::Data>()
+        }
+    }
+}
+
+impl<T: fb::Driver> Deref for Device<T> {
+    type Target = T::Data;
+
+    fn deref(&self) -> &Self::Target {
+        self.data()
+    }
+}
+
+// SAFETY: Framebuffer device objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: fb::Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { self.refcount().inc() };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: By the safety requirements, `obj` is valid.
+        let device = unsafe { &*obj.as_ptr() };
+
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        if unsafe { device.refcount().dec_and_test() } {
+            Self::destroy_callback(device.as_raw());
+        }
+    }
+}
+
+impl<T: fb::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `fb_info::device` is valid as long as the `fb_info` itself is valid, which is
+        // guaranteed by the type invariant.
+        unsafe { device::Device::from_raw((*self.as_raw()).device) }
+    }
+}
+
+// SAFETY: `Device<T>` can be sent to any thread.
+unsafe impl<T: fb::Driver> Send for Device<T> {}
+
+// SAFETY: `Device<T>` can be shared among threads because all immutable methods are protected by
+// the synchronization in `struct fb_info`.
+unsafe impl<T: fb::Driver> Sync for Device<T> {}
diff --git a/rust/kernel/fb/driver.rs b/rust/kernel/fb/driver.rs
new file mode 100644
index 000000000000..fa06a613c909
--- /dev/null
+++ b/rust/kernel/fb/driver.rs
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer driver core.
+//!
+//! This module provides the core abstractions for implementing framebuffer drivers.
+//!
+//! C header: [`include/linux/fb.h`]
+
+use crate::{
+    bindings, device, devres, error::to_result, fb, fs::file, mm, prelude::*, sync::aref::ARef,
+};
+use macros::vtable;
+
+/// Framebuffer driver information.
+pub struct DriverInfo {
+    /// Driver name.
+    pub name: &'static CStr,
+    /// Driver description.
+    pub desc: &'static CStr,
+}
+
+/// Framebuffer operations trait.
+///
+/// This trait defines the operations that a framebuffer driver must or can implement.
+/// It corresponds to `struct fb_ops` in C.
+///
+/// All methods receive a `device` parameter that provides access to both driver-specific data
+/// (via `device.data()` or direct dereference) and generic framebuffer info (via `device.var()`,
+/// `device.fix()`, etc.).
+#[vtable]
+pub trait Operations {
+    /// Driver-specific data type for operations context.
+    type Data: Sync + Send;
+
+    /// Read from framebuffer device.
+    ///
+    /// For framebuffers with strange non-linear layouts or that do not work with normal memory
+    /// mapped access.
+    fn read(
+        _device: &fb::Device<impl Driver<Data = Self::Data>>,
+        _buf: &mut [u8],
+        _ppos: &mut file::Offset,
+    ) -> Result<usize> {
+        Err(EINVAL)
+    }
+
+    /// Write to framebuffer device.
+    ///
+    /// For framebuffers with strange non-linear layouts or that do not work with normal memory
+    /// mapped access.
+    fn write(
+        _device: &fb::Device<impl Driver<Data = Self::Data>>,
+        _buf: &[u8],
+        _ppos: &mut file::Offset,
+    ) -> Result<usize> {
+        Err(EINVAL)
+    }
+
+    /// Set a color register.
+    fn setcolreg(
+        _device: &fb::Device<impl Driver<Data = Self::Data>>,
+        _regno: u32,
+        _red: u32,
+        _green: u32,
+        _blue: u32,
+        _transp: u32,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Draws a rectangle.
+    fn fillrect(_device: &fb::Device<impl Driver<Data = Self::Data>>, _rect: &fb::FillRect) {
+        // Default: no-op (driver may rely on software fallback or macro)
+    }
+
+    /// Copy data from area to another.
+    fn copyarea(_device: &fb::Device<impl Driver<Data = Self::Data>>, _area: &fb::CopyArea) {
+        // Default: no-op (driver may rely on software fallback or macro)
+    }
+
+    /// Draws an image to the display.
+    fn imageblit(_device: &fb::Device<impl Driver<Data = Self::Data>>, _image: &fb::Image) {
+        // Default: no-op (driver may rely on software fallback or macro)
+    }
+
+    /// Perform framebuffer-specific mmap.
+    fn mmap(
+        _device: &fb::Device<impl Driver<Data = Self::Data>>,
+        _vma: &mm::virt::VmaNew,
+    ) -> Result {
+        Err(EINVAL)
+    }
+
+    /// Teardown any resources to do with this framebuffer.
+    ///
+    /// Called when the last reference to the framebuffer is dropped. Use this to clean up
+    /// driver-specific resources.
+    ///
+    /// Note: The framework automatically calls `framebuffer_release()` after this method
+    /// returns, so drivers should *not* call `framebuffer_release()` themselves. This follows
+    /// RAII principles: since `Device::new()` calls `framebuffer_alloc()`, the framework is
+    /// responsible for calling `framebuffer_release()`.
+    fn destroy(_device: &fb::Device<impl Driver<Data = Self::Data>>) {}
+}
+
+/// Trait for framebuffer drivers.
+#[vtable]
+pub trait Driver {
+    /// Driver-specific context data.
+    type Data: Sync + Send;
+
+    /// Operations implementation for this driver.
+    type Ops: Operations<Data = Self::Data>;
+
+    /// Driver metadata.
+    const INFO: DriverInfo;
+}
+
+/// Registration for a framebuffer device.
+///
+/// The device is unregistered when this structure is dropped.
+pub struct Registration<T: Driver>(ARef<fb::Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Creates a new [`Registration`] and registers the framebuffer device.
+    fn new(fb: &fb::Device<T>) -> Result<Self> {
+        // SAFETY: `fb.as_raw()` is valid by the invariants of `fb::Device`.
+        to_result(unsafe { bindings::register_framebuffer(fb::Device::as_raw(fb)) })?;
+
+        Ok(Self(ARef::from(fb)))
+    }
+
+    /// Creates a new [`Registration`] and transfers ownership to devres.
+    pub fn new_foreign_owned(fb: &fb::Device<T>, dev: &device::Device<device::Bound>) -> Result
+    where
+        T: 'static,
+    {
+        // Verify that the device in fb_info matches the provided device
+        let fb_device = <fb::Device<T> as AsRef<device::Device>>::as_ref(fb);
+        if fb_device.as_raw() != dev.as_raw() {
+            return Err(EINVAL);
+        }
+
+        let reg = Registration::<T>::new(fb)?;
+
+        devres::register(dev, reg, GFP_KERNEL)
+    }
+
+    /// Returns a reference to the registered framebuffer device.
+    pub fn device(&self) -> &fb::Device<T> {
+        &self.0
+    }
+}
+
+// SAFETY: All `&self` methods on this type are thread-safe. `ARef<fb::Device<T>>` and
+// `fb::Device<T>` are `Sync`, so it is safe to share `Registration` between threads.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration and unregistration from the framebuffer subsystem can happen from any
+// thread.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    fn drop(&mut self) {
+        // SAFETY: `self.0` is guaranteed to be valid for the lifetime of `Registration`. The
+        // existence of this `Registration` guarantees that the device is registered.
+        unsafe { bindings::unregister_framebuffer(fb::Device::as_raw(&self.0)) };
+    }
+}
diff --git a/rust/kernel/fb/io.rs b/rust/kernel/fb/io.rs
new file mode 100644
index 000000000000..fde7d9eab7b7
--- /dev/null
+++ b/rust/kernel/fb/io.rs
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer I/O helpers.
+//!
+//! This module provides safe wrappers for the C `fb_io_*` helpers.
+//!
+//! C header: [`include/linux/fb.h`](srctree/include/linux/fb.h)
+
+use crate::{
+    bindings,
+    error::{to_result, Result},
+    fb,
+    fs::file,
+    mm,
+    prelude::*,
+};
+
+/// Generic framebuffer read helper.
+///
+/// Calls the C `fb_io_read` helper.
+pub fn fb_io_read<T: fb::Driver>(
+    device: &fb::Device<T>,
+    buf: &mut [u8],
+    ppos: &mut file::Offset,
+) -> Result<usize> {
+    // SAFETY: Both `device.as_raw()` and `ppos` are valid by type invariants, and `buf` is a valid
+    // mutable slice. The C helper treats the buffer pointer as `__user` and will return `-EFAULT`
+    // if it is not a valid user pointer.
+    let result = unsafe {
+        bindings::fb_io_read(
+            device.as_raw(),
+            buf.as_mut_ptr() as *mut core::ffi::c_char,
+            buf.len(),
+            ppos as *mut file::Offset as *mut bindings::loff_t,
+        )
+    };
+    if result < 0 {
+        Err(Error::from_errno(result as i32))
+    } else {
+        Ok(result as usize)
+    }
+}
+
+/// Generic framebuffer write helper.
+///
+/// Calls the C `fb_io_write` helper.
+pub fn fb_io_write<T: fb::Driver>(
+    device: &fb::Device<T>,
+    buf: &[u8],
+    ppos: &mut file::Offset,
+) -> Result<usize> {
+    // SAFETY: Both `device.as_raw()` and `ppos` are valid by type invariants, and `buf` is a valid
+    // slice. The C helper treats the buffer pointer as `__user` and will return `-EFAULT` if it is
+    // not a valid user pointer.
+    let result = unsafe {
+        bindings::fb_io_write(
+            device.as_raw(),
+            buf.as_ptr() as *const core::ffi::c_char,
+            buf.len(),
+            ppos as *mut file::Offset as *mut bindings::loff_t,
+        )
+    };
+    if result < 0 {
+        Err(Error::from_errno(result as i32))
+    } else {
+        Ok(result as usize)
+    }
+}
+
+/// Generic framebuffer mmap helper.
+///
+/// Calls the C `fb_io_mmap` helper.
+pub fn fb_io_mmap<T: fb::Driver>(device: &fb::Device<T>, vma: &mm::virt::VmaNew) -> Result {
+    // SAFETY: Both `device.as_raw()` and `vma.as_ptr()` are valid by type invariants.
+    unsafe { to_result(bindings::fb_io_mmap(device.as_raw(), vma.as_ptr())) }
+}
diff --git a/rust/kernel/fb/mod.rs b/rust/kernel/fb/mod.rs
new file mode 100644
index 000000000000..d9a40488a4bd
--- /dev/null
+++ b/rust/kernel/fb/mod.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer subsystem.
+//!
+//! This module provides abstractions for the Linux framebuffer subsystem,
+//! allowing drivers to be written in Rust.
+//!
+//! C headers:
+//! - [`include/linux/fb.h`](srctree/include/linux/fb.h)
+
+pub mod blit;
+pub mod device;
+pub mod driver;
+pub mod io;
+pub mod screeninfo;
+
+pub use blit::{cfb_copyarea, cfb_fillrect, cfb_imageblit, CopyArea, FillRect, Image};
+pub use device::Device;
+pub use driver::{Driver, DriverInfo, Operations, Registration};
+pub use io::{fb_io_mmap, fb_io_read, fb_io_write};
+pub use screeninfo::{
+    accel, activate, types, visual, vmode, Bitfield, FixScreenInfo, VarScreenInfo,
+};
diff --git a/rust/kernel/fb/screeninfo.rs b/rust/kernel/fb/screeninfo.rs
new file mode 100644
index 000000000000..41315131b53f
--- /dev/null
+++ b/rust/kernel/fb/screeninfo.rs
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Framebuffer screen information types.
+//!
+//! This module provides safe wrappers for framebuffer screen information structures and
+//! related constants.
+//!
+//! C header: [`include/linux/fb.h`](srctree/include/linux/fb.h)
+
+use crate::{bindings, ffi, prelude::*};
+
+/// Framebuffer type constants.
+pub mod types {
+    /// Packed pixels.
+    pub const FB_TYPE_PACKED_PIXELS: u32 = crate::bindings::FB_TYPE_PACKED_PIXELS;
+}
+
+/// Framebuffer visual constants.
+pub mod visual {
+    /// True color.
+    pub const FB_VISUAL_TRUECOLOR: u32 = crate::bindings::FB_VISUAL_TRUECOLOR;
+}
+
+/// Framebuffer acceleration constants.
+pub mod accel {
+    /// No hardware accelerator.
+    pub const FB_ACCEL_NONE: u32 = crate::bindings::FB_ACCEL_NONE;
+}
+
+/// Framebuffer activation constants.
+pub mod activate {
+    /// Set values immediately (or at vblank).
+    pub const FB_ACTIVATE_NOW: u32 = crate::bindings::FB_ACTIVATE_NOW;
+}
+
+/// Framebuffer video mode constants.
+pub mod vmode {
+    /// Non-interlaced.
+    pub const FB_VMODE_NONINTERLACED: u32 = crate::bindings::FB_VMODE_NONINTERLACED;
+}
+
+/// Wrapper for `fb_bitfield`.
+///
+/// Describes a bitfield within a pixel, typically used for color components.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct Bitfield(bindings::fb_bitfield);
+
+impl Bitfield {
+    /// Create a new `Bitfield`.
+    pub const fn new(offset: u32, length: u32, msb_right: u32) -> Self {
+        Self(bindings::fb_bitfield {
+            offset,
+            length,
+            msb_right,
+        })
+    }
+
+    /// Create a new `Bitfield` from the raw C structure.
+    ///
+    /// `fb_bitfield` is a POD type, so any bit pattern is valid.
+    pub(crate) const fn from_raw(raw: bindings::fb_bitfield) -> Self {
+        Self(raw)
+    }
+
+    /// Returns the wrapped C structure.
+    pub(crate) const fn into_raw(self) -> bindings::fb_bitfield {
+        self.0
+    }
+
+    /// Bit offset within the pixel.
+    pub const fn offset(&self) -> u32 {
+        self.0.offset
+    }
+
+    /// Bitfield length in bits.
+    pub const fn length(&self) -> u32 {
+        self.0.length
+    }
+}
+
+/// Wrapper for `fb_var_screeninfo`.
+///
+/// Describes variable screen parameters that can be changed by the user or driver
+/// (e.g., resolution, color depth).
+#[repr(transparent)]
+pub struct VarScreenInfo(bindings::fb_var_screeninfo);
+
+impl VarScreenInfo {
+    /// Create a zeroed `VarScreenInfo`.
+    ///
+    /// Most fields will need to be set by the driver.
+    ///
+    /// `fb_var_screeninfo` is a POD type, so the all-zero bit pattern is valid.
+    pub const fn new_zeroed() -> Self {
+        Self(unsafe { core::mem::zeroed() })
+    }
+
+    /// Create a reference from a raw C structure pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
+    /// of the returned reference.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::fb_var_screeninfo) -> &'a Self {
+        // SAFETY: `VarScreenInfo` is a transparent wrapper around `bindings::fb_var_screeninfo`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns the wrapped C structure.
+    pub fn into_raw(self) -> bindings::fb_var_screeninfo {
+        self.0
+    }
+
+    /// Visible resolution (horizontal).
+    #[inline]
+    pub fn xres(&self) -> u32 {
+        self.0.xres
+    }
+
+    /// Visible resolution (vertical).
+    #[inline]
+    pub fn yres(&self) -> u32 {
+        self.0.yres
+    }
+
+    /// Bits per pixel.
+    pub fn bits_per_pixel(&self) -> u32 {
+        self.0.bits_per_pixel
+    }
+
+    /// Red color bitfield.
+    pub fn red(&self) -> Bitfield {
+        Bitfield::from_raw(self.0.red)
+    }
+
+    /// Green color bitfield.
+    pub fn green(&self) -> Bitfield {
+        Bitfield::from_raw(self.0.green)
+    }
+
+    /// Blue color bitfield.
+    pub fn blue(&self) -> Bitfield {
+        Bitfield::from_raw(self.0.blue)
+    }
+
+    /// Transparency/alpha color bitfield.
+    pub fn transp(&self) -> Bitfield {
+        Bitfield::from_raw(self.0.transp)
+    }
+
+    /// Set the visible resolution (horizontal).
+    pub fn set_xres(&mut self, xres: u32) {
+        self.0.xres = xres;
+    }
+
+    /// Set the visible resolution (vertical).
+    pub fn set_yres(&mut self, yres: u32) {
+        self.0.yres = yres;
+    }
+
+    /// Set the virtual resolution (horizontal).
+    pub fn set_xres_virtual(&mut self, xres_virtual: u32) {
+        self.0.xres_virtual = xres_virtual;
+    }
+
+    /// Set the virtual resolution (vertical).
+    pub fn set_yres_virtual(&mut self, yres_virtual: u32) {
+        self.0.yres_virtual = yres_virtual;
+    }
+
+    /// Set bits per pixel.
+    pub fn set_bits_per_pixel(&mut self, bits_per_pixel: u32) {
+        self.0.bits_per_pixel = bits_per_pixel;
+    }
+
+    /// Set the red color bitfield.
+    pub fn set_red(&mut self, red: Bitfield) {
+        self.0.red = red.into_raw();
+    }
+
+    /// Set the green color bitfield.
+    pub fn set_green(&mut self, green: Bitfield) {
+        self.0.green = green.into_raw();
+    }
+
+    /// Set the blue color bitfield.
+    pub fn set_blue(&mut self, blue: Bitfield) {
+        self.0.blue = blue.into_raw();
+    }
+
+    /// Set the transparency (alpha) color bitfield.
+    pub fn set_transp(&mut self, transp: Bitfield) {
+        self.0.transp = transp.into_raw();
+    }
+
+    /// Set the activation flags.
+    pub fn set_activate(&mut self, activate: u32) {
+        self.0.activate = activate;
+    }
+
+    /// Set the video mode flags.
+    pub fn set_vmode(&mut self, vmode: u32) {
+        self.0.vmode = vmode;
+    }
+
+    /// Set the width (for compatibility, typically same as xres).
+    pub fn set_width(&mut self, width: u32) {
+        self.0.width = width;
+    }
+
+    /// Set the height (for compatibility, typically same as yres).
+    pub fn set_height(&mut self, height: u32) {
+        self.0.height = height;
+    }
+}
+
+/// Wrapper for `fb_fix_screeninfo`.
+///
+/// Describes fixed screen parameters that cannot be changed by the user
+/// (e.g., framebuffer memory address, type).
+#[repr(transparent)]
+pub struct FixScreenInfo(bindings::fb_fix_screeninfo);
+
+impl FixScreenInfo {
+    /// Create a zeroed `FixScreenInfo`.
+    ///
+    /// Most fields will need to be set by the driver.
+    ///
+    /// `fb_fix_screeninfo` is a POD type, so the all-zero bit pattern is valid.
+    pub const fn new_zeroed() -> Self {
+        Self(unsafe { core::mem::zeroed() })
+    }
+
+    /// Create a reference from a raw C structure pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
+    /// of the returned reference.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::fb_fix_screeninfo) -> &'a Self {
+        // SAFETY: `FixScreenInfo` is a transparent wrapper around `bindings::fb_fix_screeninfo`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns the wrapped C structure.
+    pub fn into_raw(self) -> bindings::fb_fix_screeninfo {
+        self.0
+    }
+
+    /// Framebuffer memory start (physical address).
+    #[inline]
+    pub fn smem_start(&self) -> usize {
+        self.0.smem_start as usize
+    }
+
+    /// Length of framebuffer memory in bytes.
+    #[inline]
+    pub fn smem_len(&self) -> u32 {
+        self.0.smem_len
+    }
+
+    /// Length of a line in bytes.
+    #[inline]
+    pub fn line_length(&self) -> u32 {
+        self.0.line_length
+    }
+
+    /// Set the framebuffer identification string.
+    ///
+    /// The string (including NUL terminator) is truncated to 16 bytes if it exceeds that length.
+    pub fn set_id(&mut self, id: &'static CStr) {
+        const FB_ID_LEN: usize = 16;
+        let src = id.to_bytes_with_nul();
+
+        // Copy the string into the id array
+        let len = core::cmp::min(src.len(), FB_ID_LEN);
+        for (i, &byte) in src.iter().take(len).enumerate() {
+            self.0.id[i] = byte as ffi::c_char;
+        }
+        // Zero out the rest of the array if the string is shorter
+        for i in len..FB_ID_LEN {
+            self.0.id[i] = 0;
+        }
+    }
+
+    /// Set the framebuffer type.
+    pub fn set_type(&mut self, type_: u32) {
+        self.0.type_ = type_;
+    }
+
+    /// Set the visual type.
+    pub fn set_visual(&mut self, visual: u32) {
+        self.0.visual = visual;
+    }
+
+    /// Set the acceleration type.
+    pub fn set_accel(&mut self, accel: u32) {
+        self.0.accel = accel;
+    }
+
+    /// Set the physical address of framebuffer memory start.
+    pub fn set_smem_start(&mut self, start: usize) {
+        self.0.smem_start = start;
+    }
+
+    /// Set the length of framebuffer memory in bytes.
+    pub fn set_smem_len(&mut self, len: u32) {
+        self.0.smem_len = len;
+    }
+
+    /// Set the length of a line in bytes.
+    pub fn set_line_length(&mut self, length: u32) {
+        self.0.line_length = length;
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..feebfe3aa032 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -93,6 +93,8 @@
 pub mod drm;
 pub mod error;
 pub mod faux;
+#[cfg(CONFIG_FB)]
+pub mod fb;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fmt;
-- 
2.25.1

