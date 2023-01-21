Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208F06768D7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A5310E3FF;
	Sat, 21 Jan 2023 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1695810E3DC
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42D84B80917;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25785C433B0;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=PLeL4y0H6QrbBlSE03urvaXr4s4Bd/Y7xnji7MH8bqY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Sa2grwzuajE9qetrG9Hnq1V8Y9UCX/XfXit4m/TCsD7MFEp4ZBmIfCVLImJOX40wr
 nqvq11AQL3kh0D2a9LL/A2oN8eZ+9dGzVPEEiXaWihNTn+RlZI4v3fU2tSL79nE6eO
 jJ8YNScjEFQv2046imyC/4rpcorrPT/oHzH28m1FDVnBeO88UTeG5jADzBRnUQZ4K9
 tsKALEwCwzr7h3R47fHSLTcfqaPNe/IhesftfiM6RTSzI4Wwllcs2q8aZmOPrNuUUb
 3uSZtk+5fGp/MnhjAbQA3XOoOlruGgpSw5jn8hLC5Wgf09MQ6auGG7qSFTE4fSi2AO
 BT/TGVx+CQr7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 14226C38159;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:53 +0100
Subject: [PATCH 15/86] drm/i915: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230113-drm-include-v1-v1-15-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=1961;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=8UI+rVb3Xa7p9It0Y4FaZV3HuJwLBciCKf8V4++b8CQ=; =?utf-8?q?b=3DzCouiaQ9PgNG?=
 =?utf-8?q?Lypv+3QCkeyr5sc+f9LRXYHFMZm3KpMC46ZezmNeqI3KVtQiTCRbHPuzbRkwQs3t?=
 2Sab81l5D+MaZbDnynLlyqjVyZkfPwVnyi3Kj95kD9KOe6QKmLXM
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/i915/display/intel_dmc.c   | 1 +
 drivers/gpu/drm/i915/i915_debugfs.c        | 1 +
 drivers/gpu/drm/i915/i915_debugfs_params.c | 1 +
 drivers/gpu/drm/i915/i915_params.c         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 4124b3d37110..8e127c22c755 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 6c7ac73b69a5..415086050aa6 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -26,6 +26,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/string_helpers.h>
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 783c8676eee2..72eee814f631 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -3,6 +3,7 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 
 #include "i915_debugfs_params.h"
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 5b24dd50fb6a..e0aed6fabe2a 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -22,6 +22,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <linux/dynamic_debug.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>

-- 
2.34.1

