Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97E4B856A7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E8510E051;
	Thu, 18 Sep 2025 15:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ruMrK+fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444910E051
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:02:23 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45b467f5173so9410295e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758207742; x=1758812542;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l7zJnB3yDJu54j7XDPcUHBWHQ2xjhdYOpr3OUldWhZI=;
 b=ruMrK+fu6sxw28tL8amzZvQxViP4EfO1xyg5VYAzNUgmHU6NnI0K8fpwChFARoABnG
 bedzaF06tc0HRcPEySPQePQ2ORRz64To9P+datQADihwWEucaaEzCTalwCIL7nrXB16u
 L6bEK7rM83RHUHK2Ja8dFTJ+tPUl6OF3WZAC3BslAaolUTT7S2FZOFsr6xLhH0cQVphD
 MBh4mvBPs5vhnNmx/rhidEgtVJgfUPyqldy/bkrtJG1LC5InsykjLfrS26h4+E7MlcBo
 B6CL4ZQK3XY+UpG/zcyZOjwUwt7Ef9OM002iUWEJJ3SNiK+BXcEKRgrr6cwnn2UPoqP1
 GzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758207742; x=1758812542;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l7zJnB3yDJu54j7XDPcUHBWHQ2xjhdYOpr3OUldWhZI=;
 b=Ox0Q5eWKNcCBnz0+Jw6dPmtzZzjW4Q6wtfSYR1Jq4d2CQXUbTYigJs+NChJh8fbHMu
 nviFOTi2QpteDhMOJd5QFTKlaVFZAFz55DDhioE1gg9PpC65mXmteTEf9gFf4Wfryijl
 +Xv5+Gr0xSP5D6YR1IV1t9sYfq6px9NLqyYSvY75KRXdlxLDqOpRfDjxgVEYuivFUiIO
 7dUqPC23InuFyOO9ft4PZX6EbvzN9ra7yslLqzVpG6i2jc56BqC3zgWdWxvnOdk5OpIx
 s3ZX7QkAUfU2pUryC+oPmwOQvNNw+scX4B2En/wMcgXJji6P0o/EnIWrNbpWMvUmicA7
 +2/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs0jxNhuWo69iIZ9Bxz5QHMhfnL1vyb33zZ+TWwKE0bUzlUi4MBISqYOTSz7rMoHgT9IfMHr8Vn8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvNGe/41Qe2nUyjiM+XBA6OEQ4E6K3H5fKuo+pRwLP8DMMuRDD
 mwev+XLQpQKC8mqGVe4L7rQ1HA/3eLkM/uRJoqvLawBmsEsazoHjq9gbcTDLjP5hVJH3EXqXXg7
 QOJQM/8icVhZDLqFlJA==
X-Google-Smtp-Source: AGHT+IGPi4MZRXFcoOWPdUNlDZJMVbEdW8oLBAH+1jAR+Diom6ppak8B/S5RDukjmv+fduoTwCEAHE4877UjRK8=
X-Received: from wmbay25.prod.google.com ([2002:a05:600c:1e19:b0:464:f7d9:6b0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e93:b0:45f:2d21:cb36 with SMTP id
 5b1f17b1804b1-462074c576amr51491305e9.35.1758207742039; 
 Thu, 18 Sep 2025 08:02:22 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:02:11 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPIezGgC/x3MQQqEMAxA0atI1gbaqKBeRVw4NdVsWmmKDoh3t
 7h8i/9vUE7CCmN1Q+JTVGIosHUFbl/CxihrMZChzgy2xytJZozeK2d0MWhG86PGupZ64gVKeCT
 28v+m0/w8L+9hGf9kAAAA
X-Change-Id: 20250918-write-offset-const-0b231c4282ea
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7310; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=vJ54JE6+riZlcAldU+0faKQxu82OqxHqyvNXkYI5oGI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBozB748rOfzrnjjSiHKGsX0n/x0Z3PtJbpWHfqq
 gTHB11OZYyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaMwe+AAKCRAEWL7uWMY5
 Rl4RD/4t8Nbnz6TBtCmQoNUw/ZfJv6wR1kk4pmCvIL62u/kkC7XWhfJGvi1fvuVUZNAsyCukNOb
 S0+2aa463z8u2qomYAZNc8ronaonyjtPh8NNcdI3G0b73niWeexkLA7J619ZUlfMxHddicnVACb
 387tj0pEiWOqKBTAm4dxcr/+IyglGnhIgMkSsJdgzjpOODll2GE5zwJJnuQTzw+HxtNM5sxIPPa
 DIUAG71t3yxrqpQBxUBIkD4f8Z+QgNAy+eBzjWMRQXz+nrLve/UcrY9Tbmg8v1qMutTTsrLLVCM
 ghZhVL/Gy0QXTPzEOQBZ2FFHh4Y6LkoRWOn6X90gwyEfoFLn7P00LIxKU9RXwW4tRN9HwSWLqAE
 /r4ftVa79WR5/TiYyB4eMmiYcsCmxbqv3GEwdnIihYn/ioNDllGczIlZ5MzbsRaOB6c4z1E8X1Y
 V+V/fZ9VITnZggfsta5SeDYXrsN5/krxJ/EkD2717cEvfHgLxI45/7ruAiL/+WJ7WvXjGBwytIf
 QtvHPOljIsnugLwZHCGwpAbQQCZXLHKOxsV/dutoOFxODJ8NITd4vurbhyMu21T43/h0HyamWQE
 qCdE4RhoFXxy4z06spZHRF2O6KU8EnLuiQLMetP37LiyVQ+P3wd45B1WGHm6iOREbrDSN0pCWvO
 OENwPwQjM3fbOLA==
X-Mailer: b4 0.14.2
Message-ID: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
Subject: [PATCH] rust: io: use const generics for read/write offsets
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "=?utf-8?q?Krzysztof_Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-pci@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Using build_assert! to assert that offsets are in bounds is really
fragile and likely to result in spurious and hard-to-debug build
failures. Therefore, build_assert! should be avoided for this case.
Thus, update the code to perform the check in const evaluation instead.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/regs.rs     |  4 ++--
 rust/kernel/devres.rs           |  4 ++--
 rust/kernel/io.rs               | 18 ++++++++++--------
 rust/kernel/io/mem.rs           |  6 +++---
 samples/rust/rust_driver_pci.rs | 10 +++++-----
 5 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index f46933aaa2214ee0ac58b1ea2a6aa99506a35b70..e3c306e48e86d1d6047cab7944e0fe000901d48b 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -25,13 +25,13 @@
 impl<const OFFSET: usize> Register<OFFSET> {
     #[inline]
     pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
-        let value = (*iomem).access(dev)?.read32(OFFSET);
+        let value = (*iomem).access(dev)?.read32::<OFFSET>();
         Ok(value)
     }
 
     #[inline]
     pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
-        (*iomem).access(dev)?.write32(value, OFFSET);
+        (*iomem).access(dev)?.write32::<OFFSET>(value);
         Ok(())
     }
 }
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index da18091143a67fcfbb247e7cb4f59f5a4932cac5..3e66e10c05fa078e42162c7a367161fbf735a07f 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -96,7 +96,7 @@ struct Inner<T: Send> {
 /// let devres = KBox::pin_init(Devres::new(dev, iomem), GFP_KERNEL)?;
 ///
 /// let res = devres.try_access().ok_or(ENXIO)?;
-/// res.write8(0x42, 0x0);
+/// res.write8::<0x0>(0x42);
 /// # Ok(())
 /// # }
 /// ```
@@ -232,7 +232,7 @@ pub fn device(&self) -> &Device {
     ///
     ///     // might_sleep()
     ///
-    ///     bar.write32(0x42, 0x0);
+    ///     bar.write32::<0x0>(0x42);
     ///
     ///     Ok(())
     /// }
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 03b467722b8651ebecd660ac0e2d849cf88dc915..563ff8488100d9e07a7f4bffeb085db7bd7e9d6a 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -103,7 +103,7 @@ pub fn maxsize(&self) -> usize {
 ///# fn no_run() -> Result<(), Error> {
 /// // SAFETY: Invalid usage for example purposes.
 /// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
-/// iomem.write32(0x42, 0x0);
+/// iomem.write32::<0x0>(0x42);
 /// assert!(iomem.try_write32(0x42, 0x0).is_ok());
 /// assert!(iomem.try_write32(0x42, 0x4).is_err());
 /// # Ok(())
@@ -120,8 +120,8 @@ macro_rules! define_read {
         /// time, the build will fail.
         $(#[$attr])*
         #[inline]
-        pub fn $name(&self, offset: usize) -> $type_name {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+        pub fn $name<const OFF: usize>(&self) -> $type_name {
+            let addr = self.io_addr_assert::<$type_name, OFF>();
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$c_fn(addr as *const c_void) }
@@ -149,8 +149,8 @@ macro_rules! define_write {
         /// time, the build will fail.
         $(#[$attr])*
         #[inline]
-        pub fn $name(&self, value: $type_name, offset: usize) {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+        pub fn $name<const OFF: usize>(&self, value: $type_name) {
+            let addr = self.io_addr_assert::<$type_name, OFF>();
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$c_fn(value, addr as *mut c_void) }
@@ -217,10 +217,12 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
     }
 
     #[inline]
-    fn io_addr_assert<U>(&self, offset: usize) -> usize {
-        build_assert!(Self::offset_valid::<U>(offset, SIZE));
+    fn io_addr_assert<U, const OFF: usize>(&self) -> usize {
+        const {
+            build_assert!(Self::offset_valid::<U>(OFF, SIZE));
+        }
 
-        self.addr() + offset
+        self.addr() + OFF
     }
 
     define_read!(read8, try_read8, readb -> u8);
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 6f99510bfc3a63dd72c1d47dc661dcd48fa7f54e..b73557f5f57c955ac251a46c9bdd6df0687411e2 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -54,7 +54,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///       pdev: &platform::Device<Core>,
     ///       info: Option<&Self::IdInfo>,
     ///    ) -> Result<Pin<KBox<Self>>> {
-    ///       let offset = 0; // Some offset.
+    ///       const OFFSET: usize = 0; // Some offset.
     ///
     ///       // If the size is known at compile time, use [`Self::iomap_sized`].
     ///       //
@@ -66,9 +66,9 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///       let io = iomem.access(pdev.as_ref())?;
     ///
     ///       // Read and write a 32-bit value at `offset`.
-    ///       let data = io.read32_relaxed(offset);
+    ///       let data = io.read32_relaxed::<OFFSET>();
     ///
-    ///       io.write32_relaxed(data, offset);
+    ///       io.write32_relaxed::<OFFSET>(data);
     ///
     ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
     ///     }
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 606946ff4d7fd98e206ee6420a620d1c44eb0377..6f0388853e2b36e0800df5125a5dd8b20a6d5912 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -46,17 +46,17 @@ struct SampleDriver {
 impl SampleDriver {
     fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
         // Select the test.
-        bar.write8(index.0, Regs::TEST);
+        bar.write8::<{ Regs::TEST }>(index.0);
 
-        let offset = u32::from_le(bar.read32(Regs::OFFSET)) as usize;
-        let data = bar.read8(Regs::DATA);
+        let offset = u32::from_le(bar.read32::<{ Regs::OFFSET }>()) as usize;
+        let data = bar.read8::<{ Regs::DATA }>();
 
         // Write `data` to `offset` to increase `count` by one.
         //
         // Note that we need `try_write8`, since `offset` can't be checked at compile-time.
         bar.try_write8(data, offset)?;
 
-        Ok(bar.read32(Regs::COUNT))
+        Ok(bar.read32::<{ Regs::COUNT }>())
     }
 }
 
@@ -98,7 +98,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
         if let Ok(bar) = this.bar.access(pdev.as_ref()) {
             // Reset pci-testdev by writing a new test index.
-            bar.write8(this.index.0, Regs::TEST);
+            bar.write8::<{ Regs::TEST }>(this.index.0);
         }
     }
 }

---
base-commit: cf4fd52e323604ccfa8390917593e1fb965653ee
change-id: 20250918-write-offset-const-0b231c4282ea

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

