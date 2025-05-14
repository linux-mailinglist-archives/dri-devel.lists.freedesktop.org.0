Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20267AB694F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B4A10E60C;
	Wed, 14 May 2025 10:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ldcn47hJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9B10E60C;
 Wed, 14 May 2025 10:58:45 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-731e277a6b0so6177759a34.1; 
 Wed, 14 May 2025 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220324; x=1747825124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hu8TOexpRWewY07dDXJsWt38JoGIzWPjMFqMEoSL2F8=;
 b=ldcn47hJuuxnNev2vvZH7R07BeAne21gJV/1qYOMwNbe+oS2q0ZpYddSEFHjnZajVP
 a1KUeFl7Du/3DHGNtCyuoCkncZkKSzc9RR/htkKUFSIIVMvgx5vLZJN2CBb24XzTpuYF
 vjDfva4shO718MtW4TERHQmn42gqKiYt04ey/wfLsZP4BuGVamFQ3/OtDegWJJF5ogy+
 3TgBBWqQZiriNvMb0WT8GADHaIX7He4yjOIUTc2VitMNHg1INmGxT45NLLyu6FyyVYGl
 IBhVKH46zno8BT26rBmVmnOoWyH6HKRZ17KI/qe8GF/nUdRwmO6klLejdKIWvD5n/BZW
 I5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220324; x=1747825124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu8TOexpRWewY07dDXJsWt38JoGIzWPjMFqMEoSL2F8=;
 b=vbtgGWnflf0Uoi1f3FVsmq3xIv5TEBgo0Upc6b/RZ/ZC0lR2CGxmzgbrazZY2c8ZHG
 6VM0gp9Py7iS0DsM10buHtzJ9AsryPwmrZGnRScN4yg0UKfFCX4NScrudLqz8V8Z3AUq
 8QWLDiLG13UE2TlDQwVAfZAT/i4ieGyqUkk4ofjaPXy7eZXlsdpXy/Ude1UxTb8iBadT
 E57WBcp6IqbibxPqQCBwQ1HLnJUtKQu1MkOAq4psBYRPG3qX1b4l7ydIZB3cyzejO2eQ
 swg0dX9t8bpcvWv/zDZCaaLdkyS7KRDHGlSr9fIO4Muti3EyZKuFOLkB20LLAt/GsEWT
 3YDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfwzSKmicb+jZ+vDSD7HjHw6z1LSsBCS+guzbb+nQ7qzlvgE3ScVESo+fqPvccNmvaOSVd7vhR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuVh0478/BvCzRs9bxlTD78WpZRSW3elyjsqOs72co9ZB+AWOp
 mDLoQCIipUIuw1dtk5rHZ4MkkpqVYG3obYrSKLkkxysvoGDbc2Ku
X-Gm-Gg: ASbGncv+Ay3TGB85PCizP+RTNsa8ShncNwow4K6e8VeDpwXslgSdENEoE0HlHM97rPU
 X0NCWnOA/ODDW7GT+SgtRFNIOFMPrYgy038HejMyHdEF22u08T9qfV36t+1IzGMTXzuFsgMbPNZ
 3NitPmjTOpskvrjDaWbiVkLKXc6e+YXeMhH3vGva88gsa0dm7cSboOUdILzv2QU/ONtLRely9uh
 T+2pB6MyYP5dJ4ROaAPxik+Llvd5HYxfJfm/+f/MLNWEOkBrjGsuxcCwh7Jxz3UtI7qmIG74bjo
 ZNn6bDOJruOK1eZieYePZn615DITnmUqa9PYN5chXIW3csKUrH+LVFxclBt2nvf8VZ9gxUuwEU1
 SfXhApVYjmUzLwL3c97JZBmo=
X-Google-Smtp-Source: AGHT+IGXkVccnY53tGuxSpCAUCholjM/YozYw8rMeLEOV6h73hwItyLwj6abwZHjjSwc7RwgLDceeg==
X-Received: by 2002:a05:6870:b022:b0:2e0:15a3:3b0f with SMTP id
 586e51a60fabf-2e348815239mr1434508fac.31.1747220324164; 
 Wed, 14 May 2025 03:58:44 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:43 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 andrewjballance@gmail.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, benno.lossin@proton.me, bhelgaas@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 3/6] rust: io: add new Io type
Date: Wed, 14 May 2025 05:57:31 -0500
Message-ID: <20250514105734.3898411-4-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
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

adds a new Io type that uses the C ioread/iowrite family of functions
and implements the IoAccess trait for it and renames the old `Io`
to `MMIo`.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/helpers/io.c |  7 ++++
 rust/kernel/io.rs | 97 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index d419b5b3b7c7..a138914523c8 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -52,3 +52,10 @@ define_rust_io_write_helper(rust_helper_writel_relaxed, writel_relaxed, u32);
 define_rust_io_write_helper(rust_helper_writeq_relaxed, writeq_relaxed, u64);
 #endif
 
+define_rust_io_read_helper(rust_helper_ioread8, ioread8, u8);
+define_rust_io_read_helper(rust_helper_ioread16, ioread16, u16);
+define_rust_io_read_helper(rust_helper_ioread32, ioread32, u32);
+
+define_rust_io_write_helper(rust_helper_iowrite8, iowrite8, u8);
+define_rust_io_write_helper(rust_helper_iowrite16, iowrite16, u16);
+define_rust_io_write_helper(rust_helper_iowrite32, iowrite32, u32);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 368167d57863..ce044c155b16 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -264,9 +264,9 @@ pub fn maxsize(&self) -> usize {
 /// [`read`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 /// [`write`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 #[repr(transparent)]
-pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
+pub struct MMIo<const SIZE: usize = 0>(IoRaw<SIZE>);
 
-impl<const SIZE: usize> Io<SIZE> {
+impl<const SIZE: usize> MMIo<SIZE> {
     /// Convert a [`IoRaw`] into an [`MMIo`] instance, providing the accessors to the MMIO mapping.
     ///
     /// # Safety
@@ -293,7 +293,7 @@ pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
 }
 
 // SAFETY: as per invariant `raw` is valid
-unsafe impl<const SIZE: usize> IoAccess<SIZE> for Io<SIZE> {
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for MMIo<SIZE> {
     #[inline]
     fn maxsize(&self) -> usize {
         self.0.maxsize()
@@ -312,13 +312,13 @@ fn addr(&self) -> usize {
 }
 
 #[cfg(CONFIG_64BIT)]
-impl<const SIZE: usize> IoAccess64<SIZE> for Io<SIZE> {
+impl<const SIZE: usize> IoAccess64<SIZE> for MMIo<SIZE> {
     impl_accessor_fn!(
         read64_unchecked, readq, write64_unchecked, writeq, u64;
     );
 }
 
-impl<const SIZE: usize> IoAccessRelaxed<SIZE> for Io<SIZE> {
+impl<const SIZE: usize> IoAccessRelaxed<SIZE> for MMIo<SIZE> {
     impl_accessor_fn!(
         read8_relaxed_unchecked, readb_relaxed, write8_relaxed_unchecked, writeb_relaxed, u8;
         read16_relaxed_unchecked, readw_relaxed, write16_relaxed_unchecked, writew_relaxed, u16;
@@ -327,8 +327,93 @@ impl<const SIZE: usize> IoAccessRelaxed<SIZE> for Io<SIZE> {
 }
 
 #[cfg(CONFIG_64BIT)]
-impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for Io<SIZE> {
+impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for MMIo<SIZE> {
     impl_accessor_fn!(
         read64_relaxed_unchecked, readq_relaxed, write64_relaxed_unchecked, writeq_relaxed, u64;
     );
 }
+
+/// Io that can be either PortIo or MMIo,
+/// starting at the base address [`addr`] and spanning [`maxsize`] bytes.
+///
+/// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
+/// mapping, performing an additional region request, etc.
+///
+/// # Invariants
+///
+/// [`addr`] is the start and [`maxsize`] the length of a valid io region of size [`maxsize`].
+///
+/// [`addr`] is valid to access with the C [`ioread`]/[`iowrite`] family of functions.
+///
+/// [`addr`]: IoAccess::addr
+/// [`maxsize`]: IoAccess::maxsize
+/// [`ioread`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+/// [`iowrite`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[repr(transparent)]
+pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
+
+impl<const SIZE: usize> Io<SIZE> {
+    /// Convert a [`IoRaw`] into an [`Io`] instance, providing the accessors to the
+    /// Io mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O region of size `maxsize`.
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, Io, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let io: Io<2> = unsafe { Io::from_raw(raw) };
+    /// # assert_eq!(0xDEADBEEFC0DE, io.addr());
+    /// # assert_eq!(2, io.maxsize());
+    /// ```
+    pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
+        Self(raw)
+    }
+
+    /// Convert a ref to [`IoRaw`] into an [`Io`] instance, providing the accessors to
+    /// the Io mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, Io, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let io: &Io<2> = unsafe { Io::from_raw_ref(&raw) };
+    /// # assert_eq!(raw.addr(), io.addr());
+    /// # assert_eq!(raw.maxsize(), io.maxsize());
+    /// ```
+    #[inline]
+    pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
+        // SAFETY: `Io` is a transparent wrapper around `IoRaw`.
+        unsafe { &*core::ptr::from_ref(raw).cast() }
+    }
+}
+
+// SAFETY: as per invariant `raw` is valid
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for Io<SIZE> {
+    #[inline]
+    fn addr(&self) -> usize {
+        self.0.addr()
+    }
+
+    #[inline]
+    fn maxsize(&self) -> usize {
+        self.0.maxsize()
+    }
+
+    impl_accessor_fn!(
+        read8_unchecked, ioread8, write8_unchecked, iowrite8, u8;
+        read16_unchecked, ioread16, write16_unchecked, iowrite16, u16;
+        read32_unchecked, ioread32, write32_unchecked, iowrite32, u32;
+    );
+}
-- 
2.49.0

