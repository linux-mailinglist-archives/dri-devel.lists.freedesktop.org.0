Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHHvD4LvnGkaMQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:23:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530E180317
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3910E07A;
	Tue, 24 Feb 2026 00:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="bBet/m9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65310E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 00:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771892602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZnGvM+OjEuJSu0rxNwTBIL5b6cQ3hlfzSkhA4a2E4gvhf23ZmjWY3OogwwbWvtkn54Z9Gei3fZ4N9AVsQX7q4u2ZNb4BppYMcji7YXe/PypQs8VaBK+hNbTz0BFPYNF6vx54yCdStfVeSAzklNBvNQiNd0rXJFouhhCjI9KA/Tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771892602;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CI7aESVSHPcmOkxY+BwLF80O1NQq1ArBaTxw6r28HKc=; 
 b=BmFeYNwI0LHjJzd/M2jDZuM1mjDIGbEFKGv6yfj0VyF8lLDPgy02gwH11TYM355HADUKPv6Qgda3P32llEUO3QEOgAOt2BK89JNPrpKV2brhHEG6P6Z/l6SuWR8/osn51X4/G1RSSGkf1mSVvGGbR7Hnmoa6e4t6yMXq/+CAB8w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771892602; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CI7aESVSHPcmOkxY+BwLF80O1NQq1ArBaTxw6r28HKc=;
 b=bBet/m9j/nI0SJzIlrBHVq4O71ynK/mElaq9WaQGRAyjTfxEyhzaKs8aoXYC1Zr6
 2SVjQPznoN2yfrI0dvA9Uj1Z+aUsDd4YSsDK0MwjOnBNNjZYOszgcovjVGPGgAIrJl7
 Djh2eT2zFlTJulpKd9xJ3ZZPtyOQTuD2rTtKECnc=
Received: by mx.zohomail.com with SMTPS id 1771892601649311.60930839879256;
 Mon, 23 Feb 2026 16:23:21 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, dakr@kernel.org,
 deborah.brouwer@collabora.com
Subject: [PATCH v3] drm/tyr: Clarify driver/device type names
Date: Mon, 23 Feb 2026 16:23:14 -0800
Message-ID: <20260224002314.344675-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9530E180317
X-Rspamd-Action: no action

Currently the `TyrDriver` struct implements both `platform::Driver` and
`drm::Driver`. For clarity, split up these two roles:
 - Introduce `TyrPlatformDriverData` to implement `platform::Driver`, and
 - Introduce `TyrDrmDriver` to implement `drm::Driver`.

Also rename other variables to reflect their roles in the DRM context:
- Rename `TyrDevice` to `TyrDrmDevice`
- Rename `TyrData` to `TyrDrmDeviceData`
- Rename `File` to `TyrDrmFileData`
- Rename `DrmFile` to `TyrDrmFile`

No functional changes are intended.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v3:
- Rename `TyrPlatformDeviceData` to `TyrPlatformDriverData`
Link to v2: https://lore.kernel.org/rust-for-linux/20260223204648.208886-1-deborah.brouwer@collabora.com/

Changes in v2:
- Move the import TyrDrmDriver to a single line.
- Rename the variable `tdev` -> `ddev` in file.rs to be
consistent with the name used in driver.rs.
Link to v1: https://lore.kernel.org/rust-for-linux/20260205185906.40940-1-deborah.brouwer@collabora.com/

This patch depends on: 
[PATCH v2] drm/tyr: Use vertical style for imports
https://lore.kernel.org/rust-for-linux/20260223203833.207955-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 40 ++++++++++++++++++-----------------
 drivers/gpu/drm/tyr/file.rs   | 23 +++++++++-----------
 drivers/gpu/drm/tyr/gem.rs    |  9 +++-----
 drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
 4 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 259a5157eb47..611434641580 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -30,7 +30,7 @@
 };
 
 use crate::{
-    file::File,
+    file::TyrDrmFileData,
     gem::TyrObject,
     gpu,
     gpu::GpuInfo,
@@ -39,16 +39,18 @@
 
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
+pub(crate) struct TyrDrmDriver;
+
 /// Convenience type alias for the DRM device type for this driver.
-pub(crate) type TyrDevice = drm::Device<TyrDriver>;
+pub(crate) type TyrDrmDevice = drm::Device<TyrDrmDriver>;
 
 #[pin_data(PinnedDrop)]
-pub(crate) struct TyrDriver {
-    _device: ARef<TyrDevice>,
+pub(crate) struct TyrPlatformDriverData {
+    _device: ARef<TyrDrmDevice>,
 }
 
 #[pin_data(PinnedDrop)]
-pub(crate) struct TyrData {
+pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
     #[pin]
@@ -71,9 +73,9 @@ pub(crate) struct TyrData {
 // that it will be removed in a future patch.
 //
 // SAFETY: This will be removed in a future patch.
-unsafe impl Send for TyrData {}
+unsafe impl Send for TyrDrmDeviceData {}
 // SAFETY: This will be removed in a future patch.
-unsafe impl Sync for TyrData {}
+unsafe impl Sync for TyrDrmDeviceData {}
 
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
@@ -92,14 +94,14 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
 kernel::of_device_table!(
     OF_TABLE,
     MODULE_OF_TABLE,
-    <TyrDriver as platform::Driver>::IdInfo,
+    <TyrPlatformDriverData as platform::Driver>::IdInfo,
     [
         (of::DeviceId::new(c"rockchip,rk3588-mali"), ()),
         (of::DeviceId::new(c"arm,mali-valhall-csf"), ())
     ]
 );
 
-impl platform::Driver for TyrDriver {
+impl platform::Driver for TyrPlatformDriverData {
     type IdInfo = ();
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
 
@@ -129,7 +131,7 @@ fn probe(
 
         let platform: ARef<platform::Device> = pdev.into();
 
-        let data = try_pin_init!(TyrData {
+        let data = try_pin_init!(TyrDrmDeviceData {
                 pdev: platform.clone(),
                 clks <- new_mutex!(Clocks {
                     core: core_clk,
@@ -143,10 +145,10 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
-        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
+        let ddev: ARef<TyrDrmDevice> = drm::Device::new(pdev.as_ref(), data)?;
+        drm::driver::Registration::new_foreign_owned(&ddev, pdev.as_ref(), 0)?;
 
-        let driver = TyrDriver { _device: tdev };
+        let driver = TyrPlatformDriverData { _device: ddev };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
@@ -156,12 +158,12 @@ fn probe(
 }
 
 #[pinned_drop]
-impl PinnedDrop for TyrDriver {
+impl PinnedDrop for TyrPlatformDriverData {
     fn drop(self: Pin<&mut Self>) {}
 }
 
 #[pinned_drop]
-impl PinnedDrop for TyrData {
+impl PinnedDrop for TyrDrmDeviceData {
     fn drop(self: Pin<&mut Self>) {
         // TODO: the type-state pattern for Clks will fix this.
         let clks = self.clks.lock();
@@ -182,15 +184,15 @@ fn drop(self: Pin<&mut Self>) {
 };
 
 #[vtable]
-impl drm::Driver for TyrDriver {
-    type Data = TyrData;
-    type File = File;
+impl drm::Driver for TyrDrmDriver {
+    type Data = TyrDrmDeviceData;
+    type File = TyrDrmFileData;
     type Object = drm::gem::Object<TyrObject>;
 
     const INFO: drm::DriverInfo = INFO;
 
     kernel::declare_drm_ioctls! {
-        (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, File::dev_query),
+        (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 48bff4476d74..450be5ab9aaf 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -7,35 +7,32 @@
     uapi, //
 };
 
-use crate::{
-    driver::TyrDevice,
-    TyrDriver, //
-};
+use crate::driver::TyrDrmDriver;
 
 #[pin_data]
-pub(crate) struct File {}
+pub(crate) struct TyrDrmFileData {}
 
 /// Convenience type alias for our DRM `File` type
-pub(crate) type DrmFile = drm::file::File<File>;
+pub(crate) type TyrDrmFile = drm::file::File<TyrDrmFileData>;
 
-impl drm::file::DriverFile for File {
-    type Driver = TyrDriver;
+impl drm::file::DriverFile for TyrDrmFileData {
+    type Driver = TyrDrmDriver;
 
     fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
         KBox::try_pin_init(try_pin_init!(Self {}), GFP_KERNEL)
     }
 }
 
-impl File {
+impl TyrDrmFileData {
     pub(crate) fn dev_query(
-        tdev: &TyrDevice,
+        ddev: &drm::Device<TyrDrmDriver>,
         devquery: &mut uapi::drm_panthor_dev_query,
-        _file: &DrmFile,
+        _file: &TyrDrmFile,
     ) -> Result<u32> {
         if devquery.pointer == 0 {
             match devquery.type_ {
                 uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
-                    devquery.size = core::mem::size_of_val(&tdev.gpu_info) as u32;
+                    devquery.size = core::mem::size_of_val(&ddev.gpu_info) as u32;
                     Ok(0)
                 }
                 _ => Err(EINVAL),
@@ -49,7 +46,7 @@ pub(crate) fn dev_query(
                     )
                     .writer();
 
-                    writer.write(&tdev.gpu_info)?;
+                    writer.write(&ddev.gpu_info)?;
 
                     Ok(0)
                 }
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 8f2d23e3c093..514524ae07ef 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -5,19 +5,16 @@
     prelude::*, //
 };
 
-use crate::driver::{
-    TyrDevice,
-    TyrDriver, //
-};
+use crate::driver::TyrDrmDriver;
 
 /// GEM Object inner driver data
 #[pin_data]
 pub(crate) struct TyrObject {}
 
 impl gem::DriverObject for TyrObject {
-    type Driver = TyrDriver;
+    type Driver = TyrDrmDriver;
 
-    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &kernel::drm::Device<TyrDrmDriver>, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 861d1db43072..9432ddd6b5b8 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -5,7 +5,7 @@
 //! The name "Tyr" is inspired by Norse mythology, reflecting Arm's tradition of
 //! naming their GPUs after Nordic mythological figures and places.
 
-use crate::driver::TyrDriver;
+use crate::driver::TyrPlatformDriverData;
 
 mod driver;
 mod file;
@@ -14,7 +14,7 @@
 mod regs;
 
 kernel::module_platform_driver! {
-    type: TyrDriver,
+    type: TyrPlatformDriverData,
     name: "tyr",
     authors: ["The Tyr driver authors"],
     description: "Arm Mali Tyr DRM driver",
-- 
2.52.0

