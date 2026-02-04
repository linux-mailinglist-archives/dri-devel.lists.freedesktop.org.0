Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIzSBwqigmlpXAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:34:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292BE076A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 02:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3103810E0F6;
	Wed,  4 Feb 2026 01:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Q6l7BUyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093810E0F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 01:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770168831; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cOMZBIjAul4IicJzjAoYSMzS6G7R9P+pJCFg2Qcuq7UdjTjiotep3ps5JAaIJBPC+VX7Ur5B+cM64Z7wu9SpD63+NAnGw+kCFKIq8nS8FTRkOwZCC2FDEi9qZ3OYzC7S0KGCZKq8EiVIvVkRoJ8pABqlLnl9EixIrPbmLeDwm5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770168831;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NDoSooHbOWHoq6B3Jez/qE8a+VrhFjKPk4qtNUSiX+k=; 
 b=Zg6dG8R15tRNJGN/gagjlbbM0rfiAWYLP9CjTdyb9GIp7V25Emjv61QUf9LyzorwdCwchO3/o65NAQig+Z6mi6JIsC5D+/NxiFINijZqMQFrHBB5lI5tnLgk/kTJHfPMZwmUdx6pRIhIG7qz3gDqEECscFiO7x0X7JG0tgpUzow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770168831; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NDoSooHbOWHoq6B3Jez/qE8a+VrhFjKPk4qtNUSiX+k=;
 b=Q6l7BUyIRkgpZii66fr70eNAfubf+jYXwESaZHenBzmfB4o7Ds2XuWMPLuQlIl0n
 cB+eJDpZsGVOZxYbezvM4WtyX9lwLTMrZJMA+lNg++UiFjCop4q2r80gfrFk77vg5PN
 RoZSjd4yr3vy/EQ+yoAudC95npaKVA+wYdZ/+WJE=
Received: by mx.zohomail.com with SMTPS id 1770168829632966.9758230964605;
 Tue, 3 Feb 2026 17:33:49 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: Use vertical style for imports
Date: Tue,  3 Feb 2026 17:33:31 -0800
Message-ID: <20260204013331.427210-1-deborah.brouwer@collabora.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6292BE076A
X-Rspamd-Action: no action

Currently Tyr uses rustfmt style for imports, but the kernel uses a
vertical layout that makes it easier to resolve conflicts and rebase.

Import guidelines are documented here:
	https://docs.kernel.org/rust/coding-guidelines.html#imports

Change all of Tyr's imports to use the vertical layout. This will
ease the introduction of additional Tyr patches upstream.

There should be no functional changes in this patch.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
 drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
 drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
 drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
 drivers/gpu/drm/tyr/regs.rs   | 14 +++++---
 5 files changed, 88 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 568cb89aaed8..46b65e004a15 100644
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
index bfbf2a1d80e6..affca5b0dc6c 100644
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
index f46933aaa221..a7672fffbba5 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -7,11 +7,15 @@
 // does.
 #![allow(dead_code)]
 
-use kernel::bits::bit_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::prelude::*;
+use kernel::{
+    bits::bit_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    prelude::*, //
+};
 
 use crate::driver::IoMem;
 
-- 
2.52.0

