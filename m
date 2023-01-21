Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603396768B2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C606010E3D0;
	Sat, 21 Jan 2023 20:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17A10E3D0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BCF960B73;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D060C43443;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=zcW/0tskQygwNQfDkIw6vJymwO3V+HOzf/ZMcHo9zRk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=AQG4lihN27KaMlUX/BrE9gGNMahv7b6bialWaiA5doqZnMaK451i13eMaAEcYn4Zm
 4A2kerwy9UVIdCD4IT089lroj73xfP1pM20E/mcxJdBUh82woiDMp/gNkPKIgSnN2L
 lIlSajd5VXVL7+RA+8xfeJ08UfLiY5z+L81aIPzC5SUo3vr1YQYFYEiZqkPgHvOqCU
 E7RN/NgKDNNjX2ZuiKRc7Dm9jxkEAVEIgfR1dmXc/2LitXsjKVNyT3PxACb82L/5/7
 wTQuCvLA+gpPKDeUGRdeFcAsbucPMXS1zwVOxnwU2pbQt2o8xIPpfoEwrcEXkbDeH1
 34PqfZLLsV54A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB91C38142;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:57 +0100
Subject: [PATCH 19/86] drm/komeda: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-19-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=4386;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=MaVyEG3unCCQ7eOIu0gTFZBZa1q93wdVIyS4c3s8KGc=; =?utf-8?q?b=3DrJVG2Ufh8usA?=
 =?utf-8?q?MmpWq1jUdR6YPQppqqwvkLLcWedtUrSc4I/Xytg5bcGLJG6fDNzB0v+ANqj1ygT3?=
 /IVEVwTRD/3SVPs/XCn0xE28FK48kNId1W8BAr++JFKuKt/LIOXG
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
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c         | 2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c          | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c  | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c          | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c        | 2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c  | 3 +++
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 2 ++
 7 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index cea3fd5772b5..449e121c77ab 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -10,6 +10,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 28f76e07dd95..4e98317c6453 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -11,6 +11,7 @@
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
 #include <drm/drm_fbdev_generic.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index df5da5a44755..f550cc887c70 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
 
 #include "komeda_framebuffer.h"
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 62dc64550793..72d5ee77e0d2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index c20ff72f0ae5..dd9ba6142514 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -6,7 +6,9 @@
  */
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 914400c4af73..f0a38cce1e3a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -4,6 +4,9 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+
+#include <drm/drm_atomic_state_helper.h>
+
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index ebccb74306a7..23d61fd61fa9 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -4,7 +4,9 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 

-- 
2.34.1

