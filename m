Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2476768EF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274510E426;
	Sat, 21 Jan 2023 20:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0D510E3D0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C66B60BC5;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DC53C433A7;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331674;
 bh=PK4HsnboUXgpnfL1UJJxPlP3DzJX+6Bsjb9I5Ql2w38=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=inlO6pBj/EU4SXx8ueye6Mn0mCp+XrsFgUTDJAoZdtZ/8JDmMW8yFrN1fh+qWDHFT
 PoBNsYtmM8JF3AE0tmL6AdhIL2reN1oKbqhnChnW16NNrbd8EorHOS5HrKDanqF7ik
 7JAJUwnwJWkC8twd5h667tEPctZm2DtyFew0tfAafazdGcZgn6cGYjGjc+helI/7g7
 J3Qgv56GdO/+piy77IYjJgGjIiuoW8JGRwHMKbQjXjIZJoUcalpBz89nOgW1wmmYhb
 a0CY7on4Q3v+hr/sWGPmq44TZ5FTzs/Nt7ykMXTiMWpbOneRIjxHp+uah6+2USaczX
 Q5IwrztpYtIUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 20CD8C54E94;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:09:04 +0100
Subject: [PATCH 86/86] drm: Move drm_get_panel_orientation_quirk prototype
 to drm_panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-86-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=3297;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=ZsBaKl2SrwvcyrN3qfNa9m8+QTAVcEdj8gRaVh06Jtc=; =?utf-8?q?b=3DOrxWFm2Gz2Zk?=
 =?utf-8?q?dkYFuiY7dbEe7/RE+lXrwGbtf/i5gvPa4KtY4sAkozvqvoT4fuRfyFVumgYyKA9j?=
 sD2YuIp6C8Jbo32bsJ2I8bux5UvhjLEgyhFqTEMIJ3v8GMEtAjyg
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

drm_panel already contain some panel orientation stuff,
So this is a good home for the prototype.

Update all users of drm_get_panel_orientation_quirk.
Remove drm_utils.h header as it is no longer used.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
[https://lore.kernel.org/dri-devel/20190527185311.GS21222@phenom.ffwll.local/]
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_connector.c                |  1 -
 drivers/gpu/drm/drm_panel_orientation_quirks.c |  2 +-
 drivers/video/fbdev/efifb.c                    |  2 +-
 include/drm/drm_panel.h                        |  1 +
 include/drm/drm_utils.h                        | 17 -----------------
 5 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9d0250c28e9b..b39f4e807685 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -31,7 +31,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
-#include <drm/drm_utils.h>
 
 #include <linux/fb.h>
 #include <linux/uaccess.h>
diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index ca531dbb749d..589adb3e26c6 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -11,7 +11,7 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <drm/drm_connector.h>
-#include <drm/drm_utils.h>
+#include <drm/drm_panel.h>
 
 #ifdef CONFIG_DMI
 
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index a5779fb453a2..37487b945007 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -20,8 +20,8 @@
 #include <linux/pm_runtime.h>
 #include <video/vga.h>
 #include <asm/efi.h>
-#include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
 #include <drm/drm_connector.h>  /* For DRM_MODE_PANEL_ORIENTATION_* */
+#include <drm/drm_panel.h> /* For drm_get_panel_orientation_quirk */
 
 struct bmp_file_header {
 	u16 id;
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 432fab2347eb..95e509feba75 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -200,6 +200,7 @@ struct drm_panel {
 	bool prepare_prev_first;
 };
 
+int drm_get_panel_orientation_quirk(int width, int height);
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
deleted file mode 100644
index bae225f0a24b..000000000000
--- a/include/drm/drm_utils.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Function prototypes for misc. drm utility functions.
- * Specifically this file is for function prototypes for functions which
- * may also be used outside of drm code (e.g. in fbdev drivers).
- *
- * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
- */
-
-#ifndef __DRM_UTILS_H__
-#define __DRM_UTILS_H__
-
-#include <linux/types.h>
-
-int drm_get_panel_orientation_quirk(int width, int height);
-
-#endif

-- 
2.34.1

