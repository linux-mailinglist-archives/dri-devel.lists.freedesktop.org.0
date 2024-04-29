Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3F8B628D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0589110FFB7;
	Mon, 29 Apr 2024 19:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kOt8T5El";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFD910FF53;
 Mon, 29 Apr 2024 19:39:40 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7da939572b5so197143339f.2; 
 Mon, 29 Apr 2024 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419580; x=1715024380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0MeHEZcsgFBBOIcW96muUaq6331rE39MA9kEHJFHdU=;
 b=kOt8T5EllfqszsLdIFu2f8VrOUWEoAvk1kIBh2Ic2P8r3KGRAgXjpG7S65HBtbx9qk
 7ZeYEJVNdX6ugUf9ma9Q0/mh0y7Si/0tVeEX0NjaeoJvUF2lSBIRnZ2SdaXWjQjuEOb6
 NiIw3GTnnClgVJrh3HbeaNdWf75H7vfNARQLQJl+webThAAingaP1PNQDXIweeiUMcUw
 AU5iZEacoUEiBbBhhXP2o/E9kLmYwhySS6rca0ZtRttQCT5+lVilVwljU32nqFV2rZj5
 j8wlhbMbO846Gx7UB+HH3IjSb2vAHkm74LfEY/+0YtquUJBuMYbbRqfRjnJRW7Ky2G0O
 ndiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419580; x=1715024380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0MeHEZcsgFBBOIcW96muUaq6331rE39MA9kEHJFHdU=;
 b=q5oG4exoeSTSg5mmgu4qGHwsnjoPpPwQZ+ZgbF48vDAJ4ZRkme9gDAZx3d9/STAV5w
 /zXnGlAFT1e61JdrV+gfP57tSzcxX94xbNqfuWH589mWp/4h8ZwO0b27vBM0rmcqwmaY
 TqW81sa1es4/VMWqC6RMV/a+aDmyVHTu0C1JHgp/L3gg0Cr0DvIg3V4fx2k/4GYS7kD0
 odBVxKLUviKgbGG82eeYZdQFl38Z56sQlMkdKtxY1TJlIKvkrFfDHmcstNS52tiS7XMP
 pBpO+qy/AGGF0yx2qQD7Fg85knSdbF32vW2q1P4ryLucvFsuzTU9l+k14PUWa6ksk1Tu
 7GmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyy2BThTN8/kMtWAzBpUakoVK/j3MIr8EDjDcxqQdFrBAyEewb975ycFvh/uosjCwPk2wPDWyEbaMHezDGLCam5i3YDnAx9UtLhSGF8UJ6KTKyhFIAvwlXDq3aURQAglRS6ClKPeJLiqu+oGHv51jr/XLg33+UpXh7LFMNByVEsdne1pFuXsA+c1wciRwjfbUcEBooRfl1GiZQFUBh5V2MM2iaGrlV3VhBT8jpTRtuzBrkoAs=
X-Gm-Message-State: AOJu0Yw40Zk+uCJxJTMX3TwY6XkdymIISVzus7hS91NxNZzqS/py2EOP
 EsjFs13pd9ZQ+lMzTXZ7ZCrEVWb+eGRhW1Zw5JX8KHgSwVrM9ryP
X-Google-Smtp-Source: AGHT+IHlUVq3kyXnqc/U6UIcx1yMtr80xS3S0rVakdXkFmPbZcga6S+Hk2XVAzZ4ytI76/jmWP6Ckg==
X-Received: by 2002:a05:6602:275a:b0:7de:d935:de0a with SMTP id
 b26-20020a056602275a00b007ded935de0amr1639049ioe.0.1714419579920; 
 Mon, 29 Apr 2024 12:39:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 30/35] drm+drivers: adapt to use DYNDBG_CLASSMAP_{DEFINE,
 USE}
Date: Mon, 29 Apr 2024 13:39:16 -0600
Message-ID: <20240429193921.66648-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

Follow dynamic_debug API change from DECLARE_DYNDBG_CLASSMAP to
DYNDBG_CLASSMAP_{DEFINE,USE}.

Prior to this, we used DECLARE_DYNDBG_CLASSMAP, which was preserved to
decouple DRM conversion.  I'm unsure of the full functionality
in-between, a round of lkp-testing will help.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 drivers/gpu/drm/drm_crtc_helper.c       | 12 +-----------
 drivers/gpu/drm/drm_print.c             | 25 +++++++++++++------------
 drivers/gpu/drm/i915/i915_params.c      | 12 +-----------
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 12 +-----------
 include/drm/drm_print.h                 |  8 ++++++++
 7 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e4277298cf1a..b287f0cfd8fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -217,17 +217,7 @@ int amdgpu_damage_clips = -1; /* auto */
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f5d4be897866..d3a7df09846f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -41,17 +41,7 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 2dafc39a27cb..e9d229a393f4 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 699b7dbffd7b..4a5f2317229b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index de43048543e8..dccf12d05105 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309..27995c0c9b31 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9cc473e5d353..905fc25bf65a 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -140,6 +140,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.44.0

