Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F998B6292
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1502D10FF53;
	Mon, 29 Apr 2024 19:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gc4wGMjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46C210FFA5;
 Mon, 29 Apr 2024 19:39:44 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7dea2de1301so209158339f.3; 
 Mon, 29 Apr 2024 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419584; x=1715024384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KB/nTGsL6ro7Z1JHc0QfHBM4CeEa1MsqmgZl/vui59g=;
 b=Gc4wGMjOFzrLhiAtP9Xs5An0Q+2j/fsgGzrUP1z+h849tkIvCABYlRerNiEdpCrtXA
 d0OutzKRnVL/z7MGUeldaMN4AJnrhKavZu4w61ovgixdT3Vr2igMaUsqLTvhMKdjHUvC
 6tQwyJwmtEGZ8OZqUFtFXjXOImAqfQsqoW9ui6RjII8P99H6DOdShWThMztwFGu8LbMj
 k5bWgB2rV5RlF3Fc83+luP+m4GF4QcxUdVxKsBusp8OdrMyfbTCRIWHro1zxuNLASxO1
 kBFRI/S/X55QaemX+tmt7ImKyqavuslFLIiqO7PNxSBMan5+h/8O+Xo+uD/wkPdOeClK
 yCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419584; x=1715024384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KB/nTGsL6ro7Z1JHc0QfHBM4CeEa1MsqmgZl/vui59g=;
 b=Qs2BTsd595qALxMuhMf4NOLWRuEQYIS9oXlKmRqVc/WqpXJeDJ6Bkr5amW+I1sGdf2
 COQnnzak9YRAcmk4q6LsVR1Se4iVzFsRXHDPyFLmGYiGB6h7Pq82tgrw4bXHcuzfnpq3
 Uc97kaUR04aOizr/6GIZMInJpIIfklnQ5FloKPti4EXtWaAqm8KmH94hy2jopjGdnxPY
 NmVEd7D87vXY+UNBf3M0qSRk1ECe0fIN6XJwS3uNhXs5tJsfi6xE+z35tXjAclvkGX/X
 nldbpZHzEqB3MDB+dmwLOZvHBmhDxuqagplzUO7/mKoKwQ5bq8fQCayovwcv9EZ2o5gx
 IcLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHBeWYqf6QBn9tXuPQfqE6w2uA92VZL0FCZRqrVTLEtekSWNnrLzeF54UmvR5jZoNmWZ+jMhegi5S5LAVDyidfmbvI5CXFStmbmCPdfXfGJWwOnKBU+NEgf7iNpJnBumrbsCvJpCpe96L7pWM/Qk54LlAMsLoay2XO1TNfQ28GUZ+fvmwNQZuaebyP5P0H1z97GhrxeU+9605Eiuv7OIEpmHS+1P91q9dfVtoUbNqlZw88kts=
X-Gm-Message-State: AOJu0Yy1k3XLWwUYPKjjWZ4VN+AacpIhrnO+r0mN4W9pe9hXgHXhjkRu
 4hqZB/dILnmkgLWC1taps5kUFim9yD6xp2Z8KSFQBDFFKtEwLZ9L
X-Google-Smtp-Source: AGHT+IGe/WUrOgGW0kG9oegUnAjv9bfEDL/4OVg1gOQS+PzK/bL9RrP/0QWZjIHz6Za9U9E0MJD4uQ==
X-Received: by 2002:a6b:7611:0:b0:7de:a511:9edb with SMTP id
 g17-20020a6b7611000000b007dea5119edbmr10188869iom.10.1714419583976; 
 Mon, 29 Apr 2024 12:39:43 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:43 -0700 (PDT)
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
Subject: [PATCH v8 33/35] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of
 drivers, helpers
Date: Mon, 29 Apr 2024 13:39:19 -0600
Message-ID: <20240429193921.66648-14-jim.cromie@gmail.com>
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

Add a DRM_CLASSMAP_USE declaration to 2nd batch of helpers and *_drv.c
files.  For drivers, add the decl just above the module's PARAMs,
since it identifies the "inherited" drm.debug param.

Note: with CONFIG_DRM_USE_DYNAMIC_DEBUG=y, a module not also declaring
DRM_CLASSMAP_USE will have its class'd prdbgs stuck in the initial
(disabled, but for DEBUG) state.

The stuck sites are evident in /proc/dynamic_debug/control as:

   class:_UNKNOWN_ _id:N		# control's last column

rather than a proper "enumeration":

   class:DRM_UT_CORE

TLDR: This set of updates was found by choosing M for all DRM-config
items I found (not allmodconfig), building & modprobing them, and
grepping "class unknown," control.  There may yet be others.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
 drivers/gpu/drm/gud/gud_drv.c          | 2 ++
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 2 ++
 drivers/gpu/drm/qxl/qxl_drv.c          | 2 ++
 drivers/gpu/drm/radeon/radeon_drv.c    | 2 ++
 drivers/gpu/drm/udl/udl_main.c         | 2 ++
 drivers/gpu/drm/vkms/vkms_drv.c        | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd13..066d906e3199 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_IMPORT_NS(DMA_BUF);
 
 /**
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..5b555045fce4 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -31,6 +31,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 573dbe256aa8..88c5e24cc894 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -25,6 +25,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index beee5563031a..1971bfa8a8a6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -65,6 +65,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..d22308328c76 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -247,6 +247,8 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..086797c4b82b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 58fb40c93100..c159f4d186a3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -275,6 +275,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.44.0

