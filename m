Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDPGL+uOrGk9qwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 21:47:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503B22D8EC
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 21:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBD910E174;
	Sat,  7 Mar 2026 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPEEZFYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF2310E174
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 20:47:33 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-38a335d84a0so31921241fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772916452; x=1773521252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p2RX9tgtFR9oSl20g6VT+TR7IjGTBqsL+4pij0Ny+7Q=;
 b=DPEEZFYuTe/w3B+0jjin0d7kkKogq4KpT1RLHAoDX0ljem4tKrZ/h06GLwToFQmZtJ
 49cqhN0rCjH/lt4x1jx+SgXLfDmd9MXmNNV3bFQx7F92Eia1mx4sPC83CtUgpyYvo58R
 Y6GKa6/wgL+4QuComU0NDIOTMhEMLnuRpqYEV1hsQZe0ZCCMhCmKrDHH8q+M02/iACb3
 G2wnU3wz08lRXkrRmiqJE/5kbrh43k0I6jf09prC2yORcRapbiVLTL5ZJBtLFWwO/eZ2
 s1LgVwiFNMzC+kGvJETGnqrTC8qX97K+YD1IaPwxNPCO9XuXx0y7270ZuxLyIVsLCJNr
 Mfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772916452; x=1773521252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2RX9tgtFR9oSl20g6VT+TR7IjGTBqsL+4pij0Ny+7Q=;
 b=Do2nSfhOIrNBjg5+9vfc86CM0hYBww0sOjVMt/+DqyJ+LDNukm+dNRnMn3ZNURSTGa
 PBXLaOs7/jyobUXtejbEYprk9YfOd8mW5OC9UVVpJ96c4ohpqlAItk7JyWbgC+rri75y
 0NewllebrIR5NHKZ2lAjg0+cUdh/UBwDUVvumyai6wx0a4YrbHzB7cLkoFApSCdYjc5G
 tykPGoJetkBrGdN8c9gGs9w12NDVtvU9bloLXe2tzCfCaI/sbfRiCKMlreaQhgapOUuS
 fpebIQraIILTNjZc2rxwkxZ6gsXGwB+LXkCIncgpyH/rm4DzytAGTeOjsdxensPx1W96
 zUDg==
X-Gm-Message-State: AOJu0YwKB9EjqyUQCou9TnvYhhXb8kNmN+CWDJrQTxV2d+8/TGHtTgGe
 UKvXC9uOY71jF7keI/CxR7KDV/dsp/CLAQPy2BT/ORaEQRSPW/MFuE0isMQyZss7
X-Gm-Gg: ATEYQzwhPB7KDAQBrWWa7cruwe2gEQ74ryqwDFr5whA+X74r8XI5KgRvqyv6+XcK4xq
 AG5sqONtcPniP9iBvgAivEd+vgNGsQiXBtSD5P6929nOil7xkJhilSqzH+3n4VIaBvOvo4HkOsc
 b8gcchRlOO7BKFqEAxE6gqMfk8cBGuPLoZ9gG32/GENsOwCvUM4BA/VthcW3ud8pF4yR5JNQvzC
 +606s9oEQEOvqLgcxP1ECxZ0PygLUj3kL3bohR/oL7C5I5kiNOXjB++QxI/HL+1L1nVjWY3/hzn
 PSwEumSOMv3L0nGTqEh5tGIKxpeabK6HiQMCvbYrwaUOC/9ELk9mh+owoJyD1ZIdkgioIBNbptL
 MAfJ8fRm0Tcd9T7ZtPb20QmcfnbtDx8dPxM27YL5UERVJSa+bjWzWDsPqUtQ8zoD9hqxgXm6GhO
 3oxRPfYRsUBkLTSeQ6V1byCj764XU9Gu0tKhle2HC3MRp5AhHHUEBxqnDEZBZX/AcYyXdk2hTeM
 JYcSZjDW+a/IDBnUkH55FY876tH
X-Received: by 2002:a05:651c:993:b0:383:213c:fc41 with SMTP id
 38308e7fff4ca-38a40b2c84fmr18493101fa.7.1772916451530; 
 Sat, 07 Mar 2026 12:47:31 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru.
 [46.138.191.69]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38a420306e7sm7001571fa.34.2026.03.07.12.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 12:47:30 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH] drm/tyr: replace fixed sleeps with read_poll_timeout
Date: Sat,  7 Mar 2026 23:47:08 +0300
Message-ID: <20260307204708.60398-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: 2503B22D8EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iprintercanon@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Tyr driver uses fixed 100ms sleeps followed by manual register
checks in l2_power_on() and issue_soft_reset(). Both functions have
TODO comments noting that read_poll_timeout() was not yet available
in Rust.

read_poll_timeout() has since been implemented in the kernel (at
rust/kernel/io/poll.rs) and is actively used by other Rust drivers.

Replace the fixed sleeps with proper read_poll_timeout() calls:
  - l2_power_on: 100us poll interval, 20ms timeout (matches the C
    panthor driver)
  - issue_soft_reset: 1ms poll interval, 100ms timeout (the C driver
    uses interrupt-driven wait_event_timeout; polling is used here as
    the Tyr driver does not yet have IRQ support)

This also changes the error code on timeout from EIO to ETIMEDOUT,
which better reflects the nature of the failure. No callers in the
driver inspect the specific error code.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/gpu/drm/tyr/driver.rs | 27 ++++++++++-----------------
 drivers/gpu/drm/tyr/gpu.rs    | 21 ++++++++++-----------
 2 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..f54f5f44e923 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -9,6 +9,7 @@
 use kernel::devres::Devres;
 use kernel::drm;
 use kernel::drm::ioctl;
+use kernel::io::poll::read_poll_timeout;
 use kernel::new_mutex;
 use kernel::of;
 use kernel::platform;
@@ -18,7 +19,7 @@
 use kernel::sizes::SZ_2M;
 use kernel::sync::Arc;
 use kernel::sync::Mutex;
-use kernel::time;
+use kernel::time::Delta;
 use kernel::types::ARef;
 
 use crate::file::File;
@@ -68,22 +69,14 @@ unsafe impl Sync for TyrData {}
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
-        dev_err!(dev, "GPU reset failed with errno\n");
-        dev_err!(
-            dev,
-            "GPU_INT_RAWSTAT is {}\n",
-            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
-        );
-
-        return Err(EIO);
-    }
-
-    Ok(())
+    read_poll_timeout(
+        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
+        |val| *val & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED != 0,
+        Delta::from_millis(1),
+        Delta::from_millis(100),
+    )
+    .map(|_| ())
+    .inspect_err(|_| dev_err!(dev, "soft reset timed out\n"))
 }
 
 kernel::of_device_table!(
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..76dfdef054f1 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -4,9 +4,10 @@
 use kernel::device::Bound;
 use kernel::device::Device;
 use kernel::devres::Devres;
+use kernel::io::poll::read_poll_timeout;
 use kernel::platform;
 use kernel::prelude::*;
-use kernel::time;
+use kernel::time::Delta;
 use kernel::transmute::AsBytes;
 
 use crate::driver::IoMem;
@@ -206,14 +207,12 @@ fn from(value: u32) -> Self {
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::L2_PWRON_LO.write(dev, iomem, 1)?;
 
-    // TODO: We cannot poll, as there is no support in Rust currently, so we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
-        dev_err!(dev, "Failed to power on the GPU\n");
-        return Err(EIO);
-    }
-
-    Ok(())
+    read_poll_timeout(
+        || regs::L2_READY_LO.read(dev, iomem),
+        |val| *val == 1,
+        Delta::from_micros(100),
+        Delta::from_millis(20),
+    )
+    .map(|_| ())
+    .inspect_err(|_| dev_err!(dev, "Failed to power on the GPU\n"))
 }
-- 
2.43.0

