Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18595BE1DBB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 09:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5624D10E965;
	Thu, 16 Oct 2025 07:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MajzK9qS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D3710E8D5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:50:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso51353555e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760557825; x=1761162625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdStip0PmH8uNxqvUSt7q9Mj9fkGcDmvgx0joPS4jZo=;
 b=MajzK9qSSDnJdxVhAMbLaenaan2i0j1laS0sigU/w/bbMAYoVd+QZiW9olaKl3x+jT
 G88SAvKAegjHG1YISlZlGyL9KjxWlw7Y/S3VlsZeupdMNZ2pCyoaPN2iDrDecWTIZXVH
 knHsTH314GojSSxyGlawhgBZDQH83Zsn8ef2cZVSkiZVAP8TgLOEfo7rtCurHiD74ojJ
 jXAS/rhOzVpCMxZ0fuBa+BoDh8zNZKTKds+QqXue2zOvVqpwS77l6WbR9s6cWwS0UflL
 R5/u3qtPObVKo81ymYLB0w7Ia/7jqdls7Ift/2o7+2DBVHgfqHAbHo0+nCBoNxjKCgMv
 Niyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760557825; x=1761162625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdStip0PmH8uNxqvUSt7q9Mj9fkGcDmvgx0joPS4jZo=;
 b=PX4/2A8lmsL7A5PwqOR+ipbQXa0/Mia7DgiTlcNQ61nJf7m9+mGeT9aiiB+6UJP8jn
 GVWv0kMkIsQRrVqVCkFUndJA4aUgWhPZLrgcJ74Wu2sQadsc25JN7B1QFeMamWx1qtLM
 0XFdr4GzvbzeLHy8gupHtfak/yo0Xe/NX45SiOoCO/s5I6uOrkQh9oYzg4WDq1+XIPQF
 0IuUZIqqSCWycQpvKHcGdy/Gcd/KyUJXrcSH4FFfOiBcJlQZq+Uxi0yZtGzSu293YEgS
 qIKlPWShpqpXHkum9nAxWFL7KV1PFgLT0wLD9M+19rLlIZiHoUfiZ4zkZHu10xJAaI7M
 xlYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfgHsMDviGc/gWNQ7mJIu4xgnJBuJXFpblpIrT6odgYxIjcfydIUWJScHHNPlVgTgyTJjVK3mYuDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2Mzr5J3OUdWV1dQGlt0Nzqr82FgRThXM71MzBXZhIiISci1Np
 tkXIf3/X0p4v2Uob//w9PXddUsNb6MtEP2RyhYvOGDLr7W3AySkR5C8G
X-Gm-Gg: ASbGncucHyvXimCNBqqofCk+K/AnlTYzW9nNksAqczpZmHiRZY4vIZfd6HwgeV992lG
 W/EqSWG8Y6j2CK3FyCoEb24nzKQ2gV9iZ+pFU/yzp57uenW4RYZmT1bpOcdGCtdnSvaab9Z/hUQ
 ADVJuk8bNJ+ss2mwbgTxs5E6/rYr1ZBjKs+a3vJZcL/szkzh1UY68orXEV5eMt8aM0z8g6kYuUK
 NaezX+ECGZNXyfnn/G4WHdPHf6whJDjz67VftOv8GArIV3ymRAEloVRoU9nt8eqAGR18r9IgdZh
 CInirGoFhsjIkNJfKGQM0dAV/n/8a7m7G41mEFKxWPVqCs8pkEvPAbp9RAY3dr/saapzc7YWbhg
 Bqe02dhtRpHv14XU0TS7tic6RnpYko6zqKLio/HHr74FsP3GjxwJjAq9NB1/u7+fexGuejab69m
 /Mt1ezXt6Y4Zikugsm4sTz+lCGpGRw
X-Google-Smtp-Source: AGHT+IGddGrpCxX7OrSl23A+tvIURBAgb57PvaARooGLmVHLlO5kmYWtSLkEff3kH7Jc2lvzrUziFw==
X-Received: by 2002:a05:600c:1990:b0:46e:37af:f90e with SMTP id
 5b1f17b1804b1-46fa9a8f085mr218854435e9.6.1760557824618; 
 Wed, 15 Oct 2025 12:50:24 -0700 (PDT)
Received: from archito.cern.ch ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm281464675e9.11.2025.10.15.12.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:50:24 -0700 (PDT)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
Date: Wed, 15 Oct 2025 21:49:35 +0200
Message-ID: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Oct 2025 07:06:00 +0000
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

This patch solves the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
I confirmed by talking to Alexandre Courbot, that the reading/writing
methods in `CoherentAllocation` can never be safe, so
this patch doesn't actually change `CoherentAllocation`, but rather
tries to solve the existing references to [COHA].

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 drivers/gpu/nova-core/dma.rs            |  20 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs | 104 ++++++++++--------------
 2 files changed, 50 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..639a99cf72c4 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
     }
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
-            // SAFETY:
-            // - `dma_obj`'s size is at least `data.len()`.
-            // - We have just created this object and there is no other user at this stage.
-            unsafe {
-                core::ptr::copy_nonoverlapping(
-                    data.as_ptr(),
-                    dma_obj.dma.start_ptr_mut(),
-                    data.len(),
-                );
-            }
-
-            dma_obj
-        })
+        let mut dma_obj = Self::new(dev, data.len())?;
+        // SAFETY: We have just created this object and there is no other user at this stage.
+        unsafe { dma_obj.write(data, 0)? };
+
+        Ok(dma_obj)
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..cc5a6200d0de 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -11,12 +11,12 @@
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
 use core::marker::PhantomData;
-use core::mem::{align_of, size_of};
+use core::mem::size_of;
 use core::ops::Deref;
 
 use kernel::device::{self, Device};
 use kernel::prelude::*;
-use kernel::transmute::FromBytes;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
@@ -70,6 +70,8 @@ struct FalconAppifDmemmapperV3 {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -82,6 +84,8 @@ struct ReadVbios {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for ReadVbios {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -94,6 +98,8 @@ struct FrtsRegion {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
@@ -104,6 +110,8 @@ struct FrtsCmd {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FrtsCmd {}
 
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
@@ -149,24 +157,9 @@ impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 ///
 /// Callers must ensure that the region of memory returned is not written for as long as the
 /// returned reference is alive.
-///
-/// TODO[TRSM][COHA]: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is
-/// available and we have a way to transmute objects implementing FromBytes, e.g.:
-/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
-unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a DmaObject,
-    offset: usize,
-) -> Result<&'b T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
+unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
+    // SAFETY: Guaranteed by the safety requirements of the function.
+    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
@@ -176,20 +169,12 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
 ///
 /// Callers must ensure that the region of memory returned is not read or written for as long as
 /// the returned reference is alive.
-unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a mut DmaObject,
+unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
+    fw: &mut DmaObject,
     offset: usize,
-) -> Result<&'b mut T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
+) -> Result<&mut T> {
+    // SAFETY: Guaranteed by the safety requirements of the function.
+    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
@@ -260,32 +245,38 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
         // Find the DMEM mapper section in the firmware.
         for i in 0..hdr.entry_count as usize {
-            let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
-            unsafe {
+            let app: &FalconAppifV1 = unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
                 )
             }?;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
             }
+            let dmem_base = app.dmem_base;
 
             // SAFETY: we have exclusive access to `dma_object`.
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
-                )
+                transmute_mut(&mut dma_object, (desc.imem_load_size + dmem_base) as usize)
             }?;
 
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts {
+                    frts_addr: _,
+                    frts_size: _,
+                } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+            let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
+
             // SAFETY: we have exclusive access to `dma_object`.
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + cmd_in_buffer_offset) as usize,
                 )
             }?;
 
@@ -296,24 +287,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 size: 0,
                 flags: 2,
             };
-
-            dmem_mapper.init_cmd = match cmd {
-                FwsecCommand::Frts {
-                    frts_addr,
-                    frts_size,
-                } => {
-                    frts_cmd.frts_region = FrtsRegion {
-                        ver: 1,
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
-                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
-                    };
-
-                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
-                }
-                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
-            };
+            if let FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } = cmd
+            {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+            }
 
             // Return early as we found and patched the DMEMMAPPER region.
             return Ok(Self(dma_object, PhantomData));
-- 
2.51.0

