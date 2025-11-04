Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224CEC307ED
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741A510E5B1;
	Tue,  4 Nov 2025 10:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6D5rLLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FE610E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251964; x=1793787964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3x0H91IA9ZzAv4+8Ff8r6xLFNmq7Vh3uD8ly63cfFo=;
 b=I6D5rLLRyzT79tQO+jglupdVg3HYRul8A8k/iewHdhe9I4MkGzvr8e5g
 mAyIMnUf9IxaZUd39hNLJseHiK/SKSb02QlEbHVRFZ+HCR1LEHnBxhXtw
 YeBFY1x931DPIzEpnurWcfa3FPpf3weh4+iMyKMrpugV2Y0UOxlOKTZaL
 RqWRRK0P21TYG4xXDvVLsQIsJsL38YUXSnQFVwGWvONrw1ufJbbN+WWNV
 GVMSFsVuGkPJEEiQPjKp13wOqzrBbaJA9XkEvDUsmYQIfXvCWWHBotbIz
 jzo1do9P5H9i92++l0Uqd7lcY33NiFSeBxjyGYxh4ljwLVy8dM+pkZ+KV w==;
X-CSE-ConnectionGUID: jvJItOvdRtu3qXm34xJidg==
X-CSE-MsgGUID: fpd+V13hTBi7G4OWTd7WdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51912940"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="51912940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:53 -0800
X-CSE-ConnectionGUID: seM8ffqOTHGJbG5JuCr/qQ==
X-CSE-MsgGUID: FNiIFUurT5KDB9Z74/E+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187430556"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/4] drm/vgem: move Kconfig under driver directory
Date: Tue,  4 Nov 2025 12:25:36 +0200
Message-ID: <51935bfb299e8c64beae5a654d908231e2ec9c7f.1762251845.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762251845.git.jani.nikula@intel.com>
References: <cover.1762251845.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Almost all DRM driver Kconfig options are in dedicated Kconfig files
under driver directories. Follow suit in vgem.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig      | 9 +--------
 drivers/gpu/drm/vgem/Kconfig | 9 +++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/vgem/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 15c2f941a4cd..8ec9c06b45b7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -283,14 +283,7 @@ source "drivers/gpu/drm/xe/Kconfig"
 
 source "drivers/gpu/drm/kmb/Kconfig"
 
-config DRM_VGEM
-	tristate "Virtual GEM provider"
-	depends on DRM && MMU
-	select DRM_GEM_SHMEM_HELPER
-	help
-	  Choose this option to get a virtual graphics memory manager,
-	  as used by Mesa's software renderer for enhanced performance.
-	  If M is selected the module will be called vgem.
+source "drivers/gpu/drm/vgem/Kconfig"
 
 source "drivers/gpu/drm/vkms/Kconfig"
 
diff --git a/drivers/gpu/drm/vgem/Kconfig b/drivers/gpu/drm/vgem/Kconfig
new file mode 100644
index 000000000000..c419cdadd54c
--- /dev/null
+++ b/drivers/gpu/drm/vgem/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_VGEM
+	tristate "Virtual GEM provider"
+	depends on DRM && MMU
+	select DRM_GEM_SHMEM_HELPER
+	help
+	  Choose this option to get a virtual graphics memory manager,
+	  as used by Mesa's software renderer for enhanced performance.
+	  If M is selected the module will be called vgem.
-- 
2.47.3

