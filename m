Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CE6768F0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2C010E41F;
	Sat, 21 Jan 2023 20:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972610E3F7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B428D60BA8;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87C5EC433AC;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=8dIs6zw9BMDb90ljaa+75KbtdpDymUqVYxPeyZGULeM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=YXJDUY/lYclJ3YDK60vQoPjJ339YJJUxehNkw9LFMSEL5why0q5HCqy7SxieGrLLE
 9RujXZaOkVJDnwvfWXqhJkZDMffvMRwclrxl1fOJe3uVLHYi+iwJ/j/PzlUi6B8Wn9
 y8sXjx2XLHG/B+xePQmdoekF6ACDc7XWC33xNIqJ/AWMR0L/Om9znSNkmKJdx43HIS
 onQVB9BXTCBzHEC64fi3NZg1UsLf25lNDR9y32AXNFMJbALssoELbzoCy2fdeaycLG
 T4R9m0BHmhjDksIoOfxpsEmDWHeHfJf2jKaQVLNLCzoOGQd6CbzjKFko3zKMEzDFqS
 8cqvnrThxPIFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 79D34C54EED;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:47 +0100
Subject: [PATCH 69/86] drm/sti: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-69-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=5364;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=hBXi3TseUAIaY1mOqQMEy+COUR00sgOpcd3o32Hs+wc=; =?utf-8?q?b=3DVlJrbTMcKMUj?=
 =?utf-8?q?OJRAJeRTIULtlO1SO7KvTCu26BF+9ocm5TViyKfk/us/Sdc7wnHi5e5XUAm/8kI5?=
 1Dt53Iz/BAwWeIjhOCpfYfEr0EWQ5jhGBuiSta51xcaF7f2HbhAj
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
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/sti/sti_crtc.c   | 2 ++
 drivers/gpu/drm/sti/sti_cursor.c | 2 ++
 drivers/gpu/drm/sti/sti_dvo.c    | 2 ++
 drivers/gpu/drm/sti/sti_gdp.c    | 2 ++
 drivers/gpu/drm/sti/sti_hda.c    | 2 ++
 drivers/gpu/drm/sti/sti_hdmi.c   | 2 ++
 drivers/gpu/drm/sti/sti_hqvdp.c  | 2 ++
 drivers/gpu/drm/sti/sti_tvout.c  | 1 +
 drivers/gpu/drm/sti/sti_vid.c    | 1 +
 9 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..5887c7056a74 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -10,8 +10,10 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index db0a1eb53532..22bc2d0c4769 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -10,10 +10,12 @@
 #include <linux/seq_file.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "sti_compositor.h"
 #include "sti_cursor.h"
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 577c477b5f46..3d5660ac886e 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -12,8 +12,10 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 43c72c2604a0..bbec2b44a096 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -11,11 +11,13 @@
 #include <linux/seq_file.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "sti_compositor.h"
 #include "sti_gdp.h"
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 15097ac67931..1a13007b5807 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -13,10 +13,12 @@
 #include <linux/seq_file.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 8539fe1fedc4..6388cfc54e66 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -15,11 +15,13 @@
 #include <linux/reset.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_file.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 02b77279f6e4..388da64092d1 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -15,11 +15,13 @@
 #include <linux/seq_file.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "sti_compositor.h"
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 2499715a69b7..3a86c4e57b57 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -19,6 +19,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 
 #include "sti_crtc.h"
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2d818397918d..e10e57c76230 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -5,6 +5,7 @@
  */
 #include <linux/seq_file.h>
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>

-- 
2.34.1

