Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE379A730
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44810E27E;
	Mon, 11 Sep 2023 10:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C60410E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694427502; x=1725963502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+AhGvM74X6uja7fPWldk9HwUxSQjtZJhtzVLo6iez60=;
 b=U1kAQh/IFuvP1Kr0ffPBV1QjOn/GxKhGg4uE0956M9h3KJqO0t7Nedl9
 QD7SinzA5PtoqCxjZkXWShgOzeOb+mQ3oKsQOF4wFSGQ+n2kuAVycSQv8
 mJilg3ZnBjiTm8iRY3s8KFbmECEveyXC5zC/CE4kWycV3+v2BDeR7op/B
 /s2ngMOYsfAqtSAOWcSD+Js7RvZjm5YAL0YzNI5dFGL+JUkoGrSilq/9B
 nzJ9LRGbAGykmJ/ZHjDTmNv2VNnd5yoHTf4xvN1NyXJojoBOVgwCNUmlX
 AqdFD/QWkSpDc2GEfDX0apVj5q/dq8HhbT6XbQIl4lDeO1jLrhpcUe5X7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="409013058"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="409013058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772533025"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="772533025"
Received: from adolasin-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:19 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Date: Mon, 11 Sep 2023 12:17:56 +0200
Message-Id: <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694422112.git.karolina.stolarek@intel.com>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update Makefile so it can produce a module that consists of TTM tests.
This will allow us to test non-exported functions when KUnit tests
are built as a module. Remove the tests' Makefile.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
---
 drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
 drivers/gpu/drm/ttm/tests/Makefile |  6 ------
 2 files changed, 13 insertions(+), 11 deletions(-)
 delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..6322a33e65ed 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -2,10 +2,18 @@
 #
 # Makefile for the drm device driver.  This driver provides support for the
 
-ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
-	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
+       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
+       ttm_device.o ttm_sys_manager.o
+obj-$(CONFIG_DRM_TTM) += $(ttm)
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
-obj-$(CONFIG_DRM_TTM) += ttm.o
-obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
+ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
+             tests/ttm_pool_test.o
+
+ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
+    ttm-test-objs := $(ttm) $(ttm-tests)
+    obj-m := ttm-test.o
+else
+    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
+endif
diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
deleted file mode 100644
index ec87c4fc1ad5..000000000000
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 AND MIT
-
-obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
-        ttm_device_test.o \
-        ttm_pool_test.o \
-        ttm_kunit_helpers.o
-- 
2.25.1

