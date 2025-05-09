Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598AAAB08A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F4E10E24F;
	Fri,  9 May 2025 03:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBDk94l1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A7710E254;
 Fri,  9 May 2025 03:16:21 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-606477d77easo1091472eaf.1; 
 Thu, 08 May 2025 20:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760580; x=1747365380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgkPyXP2i5gRfeGl3BKjJ2HBMJCgCFif2eN30/9zQtw=;
 b=SBDk94l1UnBM7NRilA7Bx2GtKvAthK3A1YhlJaqk3HUFYYjKQvByxpNcGCQDbIWFUh
 Fxrdy3Qa/1SgXKMggF/juuYol7M+xpLK7SX9kP0vjuffqstvD4bK9pcDxOx05uaF0Ymp
 ru0N4z1UAGLYgE2XYDg3PVFHeY22NeoC8nY89wvswMYvD35+FB5JdJBQI8Ng2UNBNW2x
 PdX6EvMIA6VMBIGNzSfonEmcwYqpdOo0ZmN4sCceadJ9sCJM7m8e7f+0XlpT8KOz7vSm
 p/CQ/LKi/bMTMXHNtIyt1Url/Yr2fcEeAc2w+tqeIjgxkARuEjOeUwqiOJWQiyJ6rChq
 YFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760580; x=1747365380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgkPyXP2i5gRfeGl3BKjJ2HBMJCgCFif2eN30/9zQtw=;
 b=OxgXYKyWj8XMZve3cc1WE7am8D2PbNkNcor9C5Gf3pkeHTYxraeUAm9vB9nKWx1wvw
 8umwbajgT2Rf1hfB3d3Kjh/S9543SechQjdw+gqPUFwPortfrGLmUbgvVRRCsHZTBe+G
 zOLa+FOHB0oBBFBjDm+0Hz+AQSAf0hIPjmCuzDj/VFtng/W09UUtlmC8qL/tStRunAU3
 dsbKjUjIKVdxKM/EBwg589ZKUVH/JtKFeGleK0DT8QhN8aTyUSjuBLBalcb4ft5Jzsv0
 TKJqnTkGiS3rLJmlD1KGmgZoGY+ulHcLQVaxQs2fdgv8aHKSc/O8ymxWQjeWc/Dv+2Wk
 R2iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbnWk+9GypXVLvzG9BpcDxKhHa2k2Zf1PnvAESOf76W0WbhRu9FV6NRhR3Tfc17LafysVAaUsQibY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOV4gBXBZDPRVwMOf9IjpdiyuezvUStQxnjA06zG/hB/zdWOH8
 z8JHcGRprskIRbI9fZKckYmOvsidLKZXZ60Z60NHL/nFzyGGAeDo
X-Gm-Gg: ASbGncuDvF+HTGfLO1dVY4TFvYIKiFYkXTnEdkapx6gOdewu/Ct/Esp34oZRj86bYv1
 38L6KZezsf+b/DHOskaUi6ElheFsnOEvmEEZ5Fo0xIZGdWnFPRID5IrBFG3ZHz433lmCoJwNWge
 VBmAaAzqM+gqgjuGhxsEs4DfuAJH8G2AsKmrRGKTJjU2V0hisFumKM5OMeL05Ft6lfcxlFWo4iM
 KjKYTy4B8axmZTzVzHYz8PidOU6mVyUrkUV0POytQb+iaIB3qHOiPhbqlN6xMWXMe22PvFyd7oq
 vuEAfR0jJj+bjiq2DjRGmmlUn5Y+3C7aDc4JkySNlCco3ykMGC69HwhzyYD4KzdfbIYkvE/awKe
 65jAsnqri3N1N
X-Google-Smtp-Source: AGHT+IH8urgl8VEMejBgagFZSyNoUKHWUZQBYtOs/eY97TO9mTbRZX7ET52iy1p9DHHRsCojfEPTyw==
X-Received: by 2002:a05:6820:208c:b0:604:99a6:4e90 with SMTP id
 006d021491bc7-60868ad8738mr995760eaf.0.1746760580306; 
 Thu, 08 May 2025 20:16:20 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:19 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 02/11] rust: io: Replace Io with MMIo using IoAccess trait
Date: Thu,  8 May 2025 22:15:15 -0500
Message-ID: <20250509031524.2604087-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

From: Fiona Behrens <me@kloenk.dev>

Replace the Io struct with a new MMIo struct that uses the different
traits (`IoAccess`, `IoAccess64`, `IoAccessRelaxed` and
`IoAccess64Relaxed).
This allows to later implement PortIo and a generic Io framework.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/io.rs | 443 +++++++++++++++++++++++++++-------------------
 1 file changed, 259 insertions(+), 184 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72d80a6f131e..19bbf802027c 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,211 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+/// Private macro to define the [`IoAccess`] functions.
+macro_rules! define_io_access_function {
+    (@read_derived $(#[$attr:meta])* $name_unchecked:ident, $vis:vis $name:ident, $try_vis:vis $try_name:ident, $type_name:ty) => {
+    /// Read data from a give offset known at compile time.
+    ///
+    /// Bound checks are perfomed on compile time, hence if the offset is not known at compile
+    /// time, the build will fail.
+    $(#[$attr])*
+    #[inline]
+    $vis fn $name(&self, offset: usize) -> $type_name {
+        build_assert!(offset_valid::<$type_name>(offset, SIZE));
+
+        // SAFETY: offset checked to be valid above.
+        unsafe { self.$name_unchecked(offset) }
+    }
+
+    /// Read data from a given offset.
+    ///
+    /// Bound checks are performed on runtime, it fails if the offset (plus type size) is
+    /// out of bounds.
+    $(#[$attr])*
+    #[inline]
+    $try_vis fn $try_name(&self, offset: usize) -> Result<$type_name> {
+        if !(offset_valid::<$type_name>(offset, self.maxsize())) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: offset checked to be valid above.
+        Ok(unsafe { self.$name_unchecked(offset) })
+    }
+    };
+    (@read $(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty) => {
+    /// Read data from a given offset without doing any bound checks.
+    /// The offset is relative to the base address of Self.
+    ///
+    /// # Safety
+    ///
+    /// The offset has to be valid for self.
+    $(#[$attr])*
+    unsafe fn $name_unchecked(&self, offset: usize) -> $type_name;
+
+    define_io_access_function!(@read_derived $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    };
+    (@read $($(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty;)+) => {
+    $(
+        define_io_access_function!(@read $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    )*
+    };
+    (@write_derived $(#[$attr:meta])* $name_unchecked:ident, $vis:vis $name:ident, $try_vis:vis $try_name:ident, $type_name:ty) => {
+    /// Write data to a given offset known at compile time.
+    /// Bound checks are performed on compile time, hence if the offset is not known at compile
+    /// time, the build will fail.
+    $(#[$attr])*
+    #[inline]
+    $vis fn $name(&self, value: $type_name, offset: usize) {
+        build_assert!(offset_valid::<$type_name>(offset, SIZE));
+
+        // SAFETY: offset checked to be valid above.
+        unsafe { self.$name_unchecked(value, offset) }
+    }
+
+    /// Write data to a given offset.
+    ///
+    /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
+    /// out of bounds.
+    $(#[$attr])*
+        #[inline]
+    $try_vis fn $try_name(&self, value: $type_name, offset: usize) -> Result {
+        if !(offset_valid::<$type_name>(offset, self.maxsize())) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: offset checked to be valid above.
+        Ok(unsafe { self.$name_unchecked(value, offset) })
+    }
+    };
+    (@write $(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty) => {
+    /// Write data to a given offset without doing any bound checks.
+    /// The offset is relative to the base address of self.
+    ///
+    /// # Safety
+    ///
+    /// The offset has to be valid for Self.
+    $(#[$attr])*
+    unsafe fn $name_unchecked(&self, value: $type_name, offset: usize);
+
+    define_io_access_function!(@write_derived $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    };
+    (@write $($(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty;)+) => {
+    $(
+        define_io_access_function!(@write $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    )*
+    };
+}
+
+/// Private macro to generate accessor functions that call the correct C functions given as `fn_c`.
+///
+/// This Takes either `@read` or `@write` to generate a single read or write accessor function.
+///
+/// This also can take a list of read write pairs to generate both at the same time.
+macro_rules! impl_accessor_fn {
+    (@read $(#[$attr:meta])* $vis:vis $fn_rust:ident, $fn_c:ident, $type_name:ty) => {
+    $(#[$attr])*
+    $vis unsafe fn $fn_rust(&self, offset: usize) -> $type_name {
+        // SAFETY: by the safety requirement of the function `self.addr() + offset` is valid to read
+        // TODO: once MSRV is >= 1.79.0 replace `+` with `unchecked_add`
+        unsafe { bindings::$fn_c((self.addr() + offset) as _) as _ }
+    }
+    };
+    (@write $(#[$attr:meta])* $vis:vis $fn_rust:ident, $fn_c:ident, $type_name:ty) => {
+    $(#[$attr])*
+    $vis unsafe fn $fn_rust(&self, value: $type_name, offset: usize) {
+        // SAFETY:
+        // by the safety requirement of the function `self.addr() + offset` is valid to write
+        // TODO: once MSRV is >= 1.79.0 replace `+` with `unchecked_add`
+        unsafe { bindings::$fn_c(value, (self.addr() + offset) as _) as _ }
+    }
+    };
+    (
+    $(
+        $(#[$attr:meta])*
+        $vis_read:vis $fn_rust_read:ident, $fn_c_read:ident,
+        $vis_write:vis $fn_rust_write:ident, $fn_c_write:ident,
+        $type_name:ty $(;)?
+    )+
+    ) => {
+    $(
+        impl_accessor_fn!(@read $(#[$attr])* $vis_read $fn_rust_read, $fn_c_read, $type_name);
+        impl_accessor_fn!(@write $(#[$attr])* $vis_write $fn_rust_write, $fn_c_write, $type_name);
+    )+
+    };
+}
+
+/// Check if the offset is valid to still support the type U in the given size
+const fn offset_valid<U>(offset: usize, size: usize) -> bool {
+    let type_size = core::mem::size_of::<U>();
+    if let Some(end) = offset.checked_add(type_size) {
+        end <= size && offset % type_size == 0
+    } else {
+        false
+    }
+}
+
+/// Io Access functions.
+///
+/// # Safety
+///
+/// `SIZE` and `maxsize()` has to always be valid to add to the base address.
+pub unsafe trait IoAccess<const SIZE: usize = 0> {
+    /// Returns the maximum size of the accessed IO area.
+    fn maxsize(&self) -> usize;
+
+    /// Returns the base address of the accessed IO area.
+    fn addr(&self) -> usize;
+
+    define_io_access_function!(@read
+        read8_unchecked, read8, try_read8, u8;
+        read16_unchecked, read16, try_read16, u16;
+        read32_unchecked, read32, try_read32, u32;
+    );
+
+    define_io_access_function!(@write
+        write8_unchecked, write8, try_write8, u8;
+        write16_unchecked, write16, try_write16, u16;
+        write32_unchecked, write32, try_write32, u32;
+    );
+}
+
+/// Extending trait of [`IoAccess`] offering 64 bit functions.
+#[cfg(CONFIG_64BIT)]
+pub trait IoAccess64<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read read64_unchecked, read64, try_read64, u64);
+    define_io_access_function!(@write write64_unchecked, write64, try_write64, u64);
+}
+
+/// Io Relaxed Access functions.
+///
+/// Similar to [`IoAccess`] but using relaxed memory boundries. For [`PortIo`] (when [`Io`]
+/// is a PortIo address) this just calls the functions from [`IoAccess`].
+pub trait IoAccessRelaxed<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read
+        read8_relaxed_unchecked, read8_relaxed, try_read8_relaxed, u8;
+        read16_relaxed_unchecked, read16_relaxed, try_read16_relaxed, u16;
+        read32_relaxed_unchecked, read32_relaxed, try_read32_relaxed, u32;
+    );
+
+    define_io_access_function!(@write
+        write8_relaxed_unchecked, write8_relaxed, try_write8_relaxed, u8;
+        write16_relaxed_unchecked, write16_relaxed, try_write16_relaxed, u16;
+        write32_relaxed_unchecked, write32_relaxed, try_write32_relaxed, u32;
+    );
+}
+
+/// Extending trait of [`IoAccessRelaxed`] offering 64 bit functions.
+#[cfg(CONFIG_64BIT)]
+pub trait IoAccess64Relaxed<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read
+        read64_relaxed_unchecked, read64_relaxed, try_read64_relaxed, u64;
+    );
+
+    define_io_access_function!(@write
+        write64_relaxed_unchecked, write64_relaxed, try_write64_relaxed, u64;
+    );
+}
+
 /// Raw representation of an MMIO region.
 ///
 /// By itself, the existence of an instance of this structure does not provide any guarantees that
@@ -43,218 +248,88 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
+/// IO-mapped memory, starting at the base address [`addr`] and spanning [`maxsize`] bytes.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
-/// mapping, performing an additional region request etc.
-///
-/// # Invariant
-///
-/// `addr` is the start and `maxsize` the length of valid I/O mapped memory region of size
-/// `maxsize`.
-///
-/// # Examples
-///
-/// ```no_run
-/// # use kernel::{bindings, io::{Io, IoRaw}};
-/// # use core::ops::Deref;
+/// mapping, performing an additional region request, etc.
 ///
-/// // See also [`pci::Bar`] for a real example.
-/// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
+/// # Invariants
 ///
-/// impl<const SIZE: usize> IoMem<SIZE> {
-///     /// # Safety
-///     ///
-///     /// [`paddr`, `paddr` + `SIZE`) must be a valid MMIO region that is mappable into the CPUs
-///     /// virtual address space.
-///     unsafe fn new(paddr: usize) -> Result<Self>{
-///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
-///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
-///         if addr.is_null() {
-///             return Err(ENOMEM);
-///         }
+/// [`addr`] is the start and [`maxsize`] the length of valid I/O mapped memory region of
+/// size [`maxsize`].
 ///
-///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
-///     }
-/// }
+/// [`addr`] is valid to access with the C [`read`]/[`write`] family of functions.
 ///
-/// impl<const SIZE: usize> Drop for IoMem<SIZE> {
-///     fn drop(&mut self) {
-///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
-///         unsafe { bindings::iounmap(self.0.addr() as _); };
-///     }
-/// }
-///
-/// impl<const SIZE: usize> Deref for IoMem<SIZE> {
-///    type Target = Io<SIZE>;
-///
-///    fn deref(&self) -> &Self::Target {
-///         // SAFETY: The memory range stored in `self` has been properly mapped in `Self::new`.
-///         unsafe { Io::from_raw(&self.0) }
-///    }
-/// }
-///
-///# fn no_run() -> Result<(), Error> {
-/// // SAFETY: Invalid usage for example purposes.
-/// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
-/// iomem.write32(0x42, 0x0);
-/// assert!(iomem.try_write32(0x42, 0x0).is_ok());
-/// assert!(iomem.try_write32(0x42, 0x4).is_err());
-/// # Ok(())
-/// # }
-/// ```
+/// [`addr`]: IoAccess::addr
+/// [`maxsize`]: IoAccess::maxsize
+/// [`read`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+/// [`write`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 #[repr(transparent)]
-pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
-
-macro_rules! define_read {
-    ($(#[$attr:meta])* $name:ident, $try_name:ident, $c_fn:ident -> $type_name:ty) => {
-        /// Read IO data from a given offset known at compile time.
-        ///
-        /// Bound checks are performed on compile time, hence if the offset is not known at compile
-        /// time, the build will fail.
-        $(#[$attr])*
-        #[inline]
-        pub fn $name(&self, offset: usize) -> $type_name {
-            let addr = self.io_addr_assert::<$type_name>(offset);
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(addr as _) }
-        }
-
-        /// Read IO data from a given offset.
-        ///
-        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
-        /// out of bounds.
-        $(#[$attr])*
-        pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
-            let addr = self.io_addr::<$type_name>(offset)?;
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            Ok(unsafe { bindings::$c_fn(addr as _) })
-        }
-    };
-}
-
-macro_rules! define_write {
-    ($(#[$attr:meta])* $name:ident, $try_name:ident, $c_fn:ident <- $type_name:ty) => {
-        /// Write IO data from a given offset known at compile time.
-        ///
-        /// Bound checks are performed on compile time, hence if the offset is not known at compile
-        /// time, the build will fail.
-        $(#[$attr])*
-        #[inline]
-        pub fn $name(&self, value: $type_name, offset: usize) {
-            let addr = self.io_addr_assert::<$type_name>(offset);
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(value, addr as _, ) }
-        }
+pub struct MMIo<const SIZE: usize = 0>(IoRaw<SIZE>);
 
-        /// Write IO data from a given offset.
-        ///
-        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
-        /// out of bounds.
-        $(#[$attr])*
-        pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
-            let addr = self.io_addr::<$type_name>(offset)?;
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(value, addr as _) }
-            Ok(())
-        }
-    };
-}
-
-impl<const SIZE: usize> Io<SIZE> {
-    /// Converts an `IoRaw` into an `Io` instance, providing the accessors to the MMIO mapping.
+impl<const SIZE: usize> MMIo<SIZE> {
+    /// Convert a [`IoRaw`] into an [`MMIo`] instance, providing the accessors to the MMIO mapping.
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of size
-    /// `maxsize`.
-    pub unsafe fn from_raw(raw: &IoRaw<SIZE>) -> &Self {
-        // SAFETY: `Io` is a transparent wrapper around `IoRaw`.
-        unsafe { &*core::ptr::from_ref(raw).cast() }
-    }
-
-    /// Returns the base address of this mapping.
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
     #[inline]
-    pub fn addr(&self) -> usize {
-        self.0.addr()
-    }
-
-    /// Returns the maximum size of this mapping.
-    #[inline]
-    pub fn maxsize(&self) -> usize {
-        self.0.maxsize()
+    pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
+        Self(raw)
     }
 
+    /// Convert a ref to [`IoRaw`] into an [`MMIo`] instance, providing the accessors to the
+    /// MMIo mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
     #[inline]
-    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
-        let type_size = core::mem::size_of::<U>();
-        if let Some(end) = offset.checked_add(type_size) {
-            end <= size && offset % type_size == 0
-        } else {
-            false
-        }
+    pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
+        // SAFETY: `MMIo` is a transparent wrapper around `IoRaw`.
+        unsafe { &*core::ptr::from_ref(raw).cast() }
     }
+}
 
+// SAFETY: as per invariant `raw` is valid
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for MMIo<SIZE> {
     #[inline]
-    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
-        if !Self::offset_valid::<U>(offset, self.maxsize()) {
-            return Err(EINVAL);
-        }
-
-        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
-        // this can't overflow.
-        self.addr().checked_add(offset).ok_or(EINVAL)
+    fn maxsize(&self) -> usize {
+        self.0.maxsize()
     }
 
     #[inline]
-    fn io_addr_assert<U>(&self, offset: usize) -> usize {
-        build_assert!(Self::offset_valid::<U>(offset, SIZE));
-
-        self.addr() + offset
+    fn addr(&self) -> usize {
+        self.0.addr()
     }
 
-    define_read!(read8, try_read8, readb -> u8);
-    define_read!(read16, try_read16, readw -> u16);
-    define_read!(read32, try_read32, readl -> u32);
-    define_read!(
-        #[cfg(CONFIG_64BIT)]
-        read64,
-        try_read64,
-        readq -> u64
+    impl_accessor_fn!(
+        read8_unchecked, readb, write8_unchecked, writeb, u8;
+        read16_unchecked, readw, write16_unchecked, writew, u16;
+        read32_unchecked, readl, write32_unchecked, writel, u32;
     );
+}
 
-    define_read!(read8_relaxed, try_read8_relaxed, readb_relaxed -> u8);
-    define_read!(read16_relaxed, try_read16_relaxed, readw_relaxed -> u16);
-    define_read!(read32_relaxed, try_read32_relaxed, readl_relaxed -> u32);
-    define_read!(
-        #[cfg(CONFIG_64BIT)]
-        read64_relaxed,
-        try_read64_relaxed,
-        readq_relaxed -> u64
+#[cfg(CONFIG_64BIT)]
+impl<const SIZE: usize> IoAccess64<SIZE> for MMIo<SIZE> {
+    impl_accessor_fn!(
+        read64_unchecked, readq, write64_unchecked, writeq, u64;
     );
+}
 
-    define_write!(write8, try_write8, writeb <- u8);
-    define_write!(write16, try_write16, writew <- u16);
-    define_write!(write32, try_write32, writel <- u32);
-    define_write!(
-        #[cfg(CONFIG_64BIT)]
-        write64,
-        try_write64,
-        writeq <- u64
+impl<const SIZE: usize> IoAccessRelaxed<SIZE> for MMIo<SIZE> {
+    impl_accessor_fn!(
+        read8_relaxed_unchecked, readb_relaxed, write8_relaxed_unchecked, writeb_relaxed, u8;
+        read16_relaxed_unchecked, readw_relaxed, write16_relaxed_unchecked, writew_relaxed, u16;
+        read32_relaxed_unchecked, readl_relaxed, write32_relaxed_unchecked, writel_relaxed, u32;
     );
+}
 
-    define_write!(write8_relaxed, try_write8_relaxed, writeb_relaxed <- u8);
-    define_write!(write16_relaxed, try_write16_relaxed, writew_relaxed <- u16);
-    define_write!(write32_relaxed, try_write32_relaxed, writel_relaxed <- u32);
-    define_write!(
-        #[cfg(CONFIG_64BIT)]
-        write64_relaxed,
-        try_write64_relaxed,
-        writeq_relaxed <- u64
+#[cfg(CONFIG_64BIT)]
+impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for MMIo<SIZE> {
+    impl_accessor_fn!(
+        read64_relaxed_unchecked, readq_relaxed, write64_relaxed_unchecked, writeq_relaxed, u64;
     );
 }
-- 
2.49.0

