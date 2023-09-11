Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF1A79AC77
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5739110E37D;
	Mon, 11 Sep 2023 23:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724B910E396;
 Mon, 11 Sep 2023 23:09:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-79275d86bc3so159750639f.0; 
 Mon, 11 Sep 2023 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473750; x=1695078550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sg6cE/x2UUPlr07T7fY2WapJd57AiLvtF5oOk9nL6T4=;
 b=Y3Pf6ew/o8XLcUVs0KzrEN9NKNbc6BWHhuvO6KXa4WqdFO0kC+LGzNKsqnkucleXpV
 BoNbcusN1ISOPpKS0BroUL4OiIPc79ot/QfbfASinat/EIsS2Y5YEGY5MvN2ZLgtAz/l
 kaCwOfH+89U+euUqjbf130cKjmInHLkP6TlbxQYZFY5ls3zmPt5cUE+fPV3oFabFPbBu
 Q9Q148mBQh6XqZ4QCQrF77v/t88hRy4Nrc9KE78g8iVb2zrhf4nQSrLLwBsAgNS+V7+i
 nDhlgrjgqEJv3pBOv4fLBRuYJO0n6inrVSJnwzanGSEozBlnGZ/GYcvPXhKIKqrjPsLj
 palw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473750; x=1695078550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sg6cE/x2UUPlr07T7fY2WapJd57AiLvtF5oOk9nL6T4=;
 b=QEl2E/zv3mV+f7FgCGgqwX+/OlX32kh9mvR5aBrkjNoqOD3GgFtD6u6xcvTI+Y34Nl
 nnOd0F6t2XgQbwHm7xi0cDZchoWyXYrnHGSsFUwYEMA86VVXY2I+JSD8XEcxh66WNqDS
 0PcPwD7rW94Vyv5lM/xAhuxkQi5dlT6DFV3/kW+sOlkaGkSaxeHLheunor0LcxxYBD5H
 JyMAlYRDUnZF6fvmfdLY6DXXNyW1Bu6LKr2iR4GsEH2w8i8XPMTQMmD2sIliyUgWdamV
 Fmb+EPp13Q7CEUAtthSpK+rFbv+Ic8cn4QxNhJBs8IEvBZCl1ZkAZ8H5na6MAyrcVpyS
 Suqg==
X-Gm-Message-State: AOJu0YxRzIFylyWVSLkNoyrzxOhJHNcJrtSiKR0cuxABdkgQyLqBI+TT
 yv7/yow3MVOpddjcAFiDCAU=
X-Google-Smtp-Source: AGHT+IGZBso+YJhrY7t/VYPk/2yLAsPpkHexYrSGfYFJHFWMcssIeOmFtlcZJ94GnWtgRM+asWeoAw==
X-Received: by 2002:a6b:5c18:0:b0:785:5917:a35f with SMTP id
 z24-20020a6b5c18000000b007855917a35fmr13374513ioh.8.1694473750661; 
 Mon, 11 Sep 2023 16:09:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 22/22] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of
 drivers, helpers
Date: Mon, 11 Sep 2023 17:08:38 -0600
Message-ID: <20230911230838.14461-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DRM_CLASSMAP_USE declaration to 2nd batch of helpers and *_drv.c
files.  For drivers, add the decl just above the module's PARAMs,
since it identifies the "inherited" drm.debug param.

Note: with CONFIG_DRM_USE_DYNAMIC_DEBUG=y, a module not also declaring
DRM_CLASSMAP_USE will have its class'd prdbgs stuck in the initial
(disabled, but for DEBUG) state.

The stuck sites are evident in /proc/dynamic_debug/control as:

   class unknown, _id:N		# control's last column

rather than a proper "enumeration":

   class:DRM_UT_CORE

This set of updates was found by choosing M for all DRM-config items I
found (not allmodconfig), building & modprobing them, and grepping
"class unknown," control.  There may yet be others.

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
index baaf0e0feb06..097d87f1ad74 100644
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
index 976f0ab2006b..a1b2be1c27f6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -24,6 +24,8 @@ int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index a3b83f89e061..12600f557c23 100644
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
index e4374814f0ef..4219276ade6a 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -274,6 +274,8 @@ int radeon_cik_support = 1;
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
index e3c9c9571c8d..38252f29f983 100644
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
index 8b24ecf60e3e..9cb6be422621 100644
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
2.41.0

