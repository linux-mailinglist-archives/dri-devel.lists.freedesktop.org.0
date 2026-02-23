Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Vg2rMem6nGlSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:39:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3517D042
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4651510E44B;
	Mon, 23 Feb 2026 20:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="UsMuN/oq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE62410E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771879138; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GMnowRh0krmvdpE3oRruRSwLl1B9fWJNiwEYZcgtdKRLTCnGWxo9lwHnB7ZLw606fWIyPOp4HQNV1jCjOH41QxaWI52JUY8Fykcy9spHoS6IUjaSDzGTj4to8db/9erDaYIW97d0wzkY70c78jvYCflYOYlMCY9T42CErmDgKmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771879138;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YBEMS5r/nnD0iEh12Fd7f7OZuFjomMPbKhT20bRYBFQ=; 
 b=bp/0/zg2RRzZlJxPb1NKiZXwerhPf05L0OZuvtIasOUcOTqNdY5eDSqO5J+WtmPSZqOHIAoIrewD2aw49z85JsKv6cMB572fd1Hg5+uf6FKSQwjJrkOBmNgYzc9z0wf1Z6OGVWqpXq1REiMpbra+E+jWxXQpxtf8+C9cEIqGDEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771879138; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YBEMS5r/nnD0iEh12Fd7f7OZuFjomMPbKhT20bRYBFQ=;
 b=UsMuN/oq1F+9IHMIIo33VVadFKygj6bpm3ieBRIQ4RIqG30WtLWHYy9hHu8RCXnc
 jWRd+PYVnEZ6xRWZRz7V5G1EyrGK3bqZzzCBJ/xcGTLS/Jxf3n2zpbz2LWetXZbZJek
 rYUngmlAEajv+TV/oY0bqp6hsWheDufPE5l765IQ=
Received: by mx.zohomail.com with SMTPS id 17718791373186.443931383479821;
 Mon, 23 Feb 2026 12:38:57 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, deborah.brouwer@collabora.com
Subject: [PATCH v2] drm/tyr: Use vertical style for imports
Date: Mon, 23 Feb 2026 12:38:33 -0800
Message-ID: <20260223203833.207955-1-deborah.brouwer@collabora.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 2AB3517D042
X-Rspamd-Action: no action

Currently Tyr uses rustfmt style for imports, but the kernel uses a
vertical layout that makes it easier to resolve conflicts and rebase.

Import guidelines are documented here:
	https://docs.kernel.org/rust/coding-guidelines.html#imports

Change all of Tyr's imports to use the vertical layout. This will
ease the introduction of additional Tyr patches upstream.

There should be no functional changes in this patch.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add import io::Io import in regs.rs to resolve conflict with v6.19.
- Pick up Reviewed-by tag

Link to v1: https://lore.kernel.org/rust-for-linux/20260204013331.427210-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
 drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
 drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
 drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
 drivers/gpu/drm/tyr/regs.rs   | 16 +++++----
 5 files changed, 89 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index beeffe36b6cb..259a5157eb47 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -1,31 +1,41 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use kernel::clk::Clk;
-use kernel::clk::OptionalClk;
-use kernel::device::Bound;
-use kernel::device::Core;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::drm;
-use kernel::drm::ioctl;
-use kernel::io::poll;
-use kernel::new_mutex;
-use kernel::of;
-use kernel::platform;
-use kernel::prelude::*;
-use kernel::regulator;
-use kernel::regulator::Regulator;
-use kernel::sizes::SZ_2M;
-use kernel::sync::aref::ARef;
-use kernel::sync::Arc;
-use kernel::sync::Mutex;
-use kernel::time;
-
-use crate::file::File;
-use crate::gem::TyrObject;
-use crate::gpu;
-use crate::gpu::GpuInfo;
-use crate::regs;
+use kernel::{
+    clk::{
+        Clk,
+        OptionalClk, //
+    },
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
+    devres::Devres,
+    drm,
+    drm::ioctl,
+    io::poll,
+    new_mutex,
+    of,
+    platform,
+    prelude::*,
+    regulator,
+    regulator::Regulator,
+    sizes::SZ_2M,
+    sync::{
+        aref::ARef,
+        Arc,
+        Mutex, //
+    },
+    time, //
+};
+
+use crate::{
+    file::File,
+    gem::TyrObject,
+    gpu,
+    gpu::GpuInfo,
+    regs, //
+};
 
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 0ef432947b73..48bff4476d74 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use kernel::drm;
-use kernel::prelude::*;
-use kernel::uaccess::UserSlice;
-use kernel::uapi;
-
-use crate::driver::TyrDevice;
-use crate::TyrDriver;
+use kernel::{
+    drm,
+    prelude::*,
+    uaccess::UserSlice,
+    uapi, //
+};
+
+use crate::{
+    driver::TyrDevice,
+    TyrDriver, //
+};
 
 #[pin_data]
 pub(crate) struct File {}
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 1273bf89dbd5..8f2d23e3c093 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,9 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use crate::driver::TyrDevice;
-use crate::driver::TyrDriver;
-use kernel::drm::gem;
-use kernel::prelude::*;
+use kernel::{
+    drm::gem,
+    prelude::*, //
+};
+
+use crate::driver::{
+    TyrDevice,
+    TyrDriver, //
+};
 
 /// GEM Object inner driver data
 #[pin_data]
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index ca2a6309e760..a88775160f98 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -1,20 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use core::ops::Deref;
-use core::ops::DerefMut;
-use kernel::bits::genmask_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::io::poll;
-use kernel::platform;
-use kernel::prelude::*;
-use kernel::time::Delta;
-use kernel::transmute::AsBytes;
-use kernel::uapi;
-
-use crate::driver::IoMem;
-use crate::regs;
+use core::ops::{
+    Deref,
+    DerefMut, //
+};
+use kernel::{
+    bits::genmask_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    io::poll,
+    platform,
+    prelude::*,
+    time::Delta,
+    transmute::AsBytes,
+    uapi, //
+};
+
+use crate::{
+    driver::IoMem,
+    regs, //
+};
 
 /// Struct containing information that can be queried by userspace. This is read from
 /// the GPU's registers.
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index d3a541cb37c6..611870c2e6af 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -7,12 +7,16 @@
 // does.
 #![allow(dead_code)]
 
-use kernel::bits::bit_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::io::Io;
-use kernel::prelude::*;
+use kernel::{
+    bits::bit_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    io::Io,
+    prelude::*, //
+};
 
 use crate::driver::IoMem;
 
-- 
2.52.0

