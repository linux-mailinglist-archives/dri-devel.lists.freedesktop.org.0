Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA8577BD6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179E8A9E9D;
	Mon, 18 Jul 2022 06:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF56A9D99;
 Mon, 18 Jul 2022 06:39:29 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o2so4131522ill.6;
 Sun, 17 Jul 2022 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3gdUWD1zcCylv4yn+JlBCjkc86Z41xaOFIEzcxWM6o=;
 b=V1OrxqGe4su+GrHuvpwetJpHwfCbSwvk1X5vn1l45IDyrLRamcINoPHdntULb+z0a/
 iDfhXj1aaYc3Vw1xXalRLs6Y62/OsM4E74EBpZHOSUXq7scT8RHiXjrIredWEzim+Ios
 eR5425VNcf3iFn6QEVQ5xyp700ELxrGvwbP0cXc22XPw/ly0OKdGbGb0v2wryoYh9vE/
 3LcXaThkXzBnyusVRIP/FhGLsjc7NSXR+8dJqCQtGOdoCXP9SI11hvWh+18Opra5FEky
 c5iJ5cQn/XbjwQd7awJu5xVQ6XetEUZwRSwwhiDADx04OEihDWEcmkCXpnC81NhFcOtq
 JqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3gdUWD1zcCylv4yn+JlBCjkc86Z41xaOFIEzcxWM6o=;
 b=3JuLc1yEgHIua8hrkgKb2GMjTct3HYROeztYsn8BA3+M6aojFiZ9hb3cUtEZoP0oWZ
 64ibCIzM8A3aGrYHu7Dih+3pWo9/qseddV/8taIX8S/5JEsjhOVdoKEL2hB8e5+i6zL6
 x/cHvhK6EaR/Bouu2hcwv3Ey5hFL//PvjBfmlqEuDZ9rG9CZTra55Kiaoec2ZelZmW6V
 ooeFF8UwYailifU0k1yHS4kPrj6ZoNutPZ8ox+hpzFnuaNJ4htQ7eXkTVVGVBgOGwvoC
 qVkBIeCsEFcwonc+FG+vYoBPCDdADjWvbK9X2H0KJZ8v5CpqkLt0SxYZhzVEHN6hMz2z
 9egA==
X-Gm-Message-State: AJIora9DFeIamhWcORNlwVb7EJ5/iP+hPPeqPS91D4sbEhjRTV4Xk/5/
 iOiuF7uDYjaCp8QFyjZSBN5oVuZixoc=
X-Google-Smtp-Source: AGRyM1v2EP6qPut/6ueSIHNlne8eqxA3nevpVcaNAuaSdlrkjGJxYhDYY0stfRzBZ6BiN1E2xYWlKQ==
X-Received: by 2002:a05:6e02:1a0c:b0:2dc:8921:a8d9 with SMTP id
 s12-20020a056e021a0c00b002dc8921a8d9mr13664803ild.145.1658126369245; 
 Sun, 17 Jul 2022 23:39:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 39/39] wip subdev refine breaks on use
Date: Mon, 18 Jul 2022 00:36:39 -0600
Message-Id: <20220718063641.9179-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 .../drm/nouveau/include/nvkm/core/subdev.h    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  7 ------
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    | 23 +++++++++++++++++++
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index d5f6ca05d5fa..05807403fdd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -19,7 +19,7 @@ struct nvkm_subdev {
 	enum nvkm_subdev_type type;
 	int inst;
 	char name[16];
-	u32 debug;
+	unsigned long debug;
 	struct list_head head;
 
 	void **pself;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 85b63b527877..d45c71ffc09e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -90,13 +90,6 @@ DECLARE_DYNDBG_CLASSMAP(nv_cli_debug_verbose, DD_CLASS_TYPE_VERBOSE, 10,
 			"NV_CLI_DBG_TRACE",
 			"NV_CLI_DBG_SPAM");
 
-DECLARE_DYNDBG_CLASSMAP(nv_subdev_debug_verbose, DD_CLASS_TYPE_VERBOSE, 15,
-			"NV_SUBDEV_DBG_OFF",
-			"NV_SUBDEV_DBG_INFO",
-			"NV_SUBDEV_DBG_DEBUG",
-			"NV_SUBDEV_DBG_TRACE",
-			"NV_SUBDEV_DBG_SPAM");
-
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
index a74b7acb6832..227871c3a749 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -26,6 +26,27 @@
 #include <core/option.h>
 #include <subdev/mc.h>
 
+#include <linux/dynamic_debug.h>
+#include <linux/module.h>
+
+#define DEBUG
+
+DECLARE_DYNDBG_CLASSMAP(nv_subdev_debug_verbose, DD_CLASS_TYPE_VERBOSE, 15,
+			"NV_SUBDEV_DBG_OFF",
+			"NV_SUBDEV_DBG_INFO",
+			"NV_SUBDEV_DBG_DEBUG",
+			"NV_SUBDEV_DBG_TRACE",
+			"NV_SUBDEV_DBG_SPAM");
+
+static struct ddebug_classes_bitmap_param nv_subdev_verbose = {
+	.bits = NULL, // wants &_subdev->debug
+	.flags = "p",
+	.map = &nv_subdev_debug_verbose,
+};
+module_param_cb(debug_subdev, &param_ops_dyndbg_classes, &nv_subdev_verbose, 0600);
+
+
+
 const char *
 nvkm_subdev_type[NVKM_SUBDEV_NR] = {
 #define NVKM_LAYOUT_ONCE(type,data,ptr,...) [type] = #ptr,
@@ -180,6 +201,8 @@ nvkm_subdev_ctor(const struct nvkm_subdev_func *func, struct nvkm_device *device
 	else
 		strscpy(subdev->name, nvkm_subdev_type[type], sizeof(subdev->name));
 	subdev->debug = nvkm_dbgopt(device->dbgopt, subdev->name);
+	nv_subdev_verbose.bits = &subdev->debug;
+	pr_debug("updated bitmap: %px\n", &nv_subdev_verbose.bits);
 	list_add_tail(&subdev->head, &device->subdev);
 }
 
-- 
2.36.1

