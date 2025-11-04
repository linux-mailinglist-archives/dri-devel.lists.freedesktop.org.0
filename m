Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0CC307D8
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53810E5AF;
	Tue,  4 Nov 2025 10:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRffIyL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5251B10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251948; x=1793787948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=965aJsIqgOkpQEgVrFQ3L4oiZ3/Q+inzlCH9zPepxsA=;
 b=VRffIyL/MSUVUIv6IXH7LWKhI9ypLPx/0F2J+cxot63woI3RiQqUPi+n
 V5DmCYoCtKOwmik+cZzYCyyta8Ip76VZnOkp+MeifGKN4GkCGvATnTYWV
 JQBF9tVoS8bULK6S1AHdK+W8bcz+FO/Wt1XpELPrmx4WheXPBPq03Te42
 3VG1ttx0hZnkxNP7JWY0LVimGSRgjQtqSFk+uLP0v5R/oltl5zhoKzFCF
 PJBm9R5iBgabzKMLpwHumglnKn/yVVnjPZey40g/selBSRdBxz8QGpU1V
 S+cNaBONfEi8VzwZDnGvd4rvs8qjQVikIyKYJmlIVYWq0SpcAczupjn+Y A==;
X-CSE-ConnectionGUID: oih1npMqQhKm08wpZEWpNA==
X-CSE-MsgGUID: Wp7XlUPiRsKvSOfEuYbw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68201645"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="68201645"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:48 -0800
X-CSE-ConnectionGUID: 9cW1KbhQSveQb/NMF6tsLw==
X-CSE-MsgGUID: pJodjoYmRWCeAxR3Or1oXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187568717"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Deepak Rawat <drawat.floss@gmail.com>
Subject: [PATCH 1/4] drm/hyperv: move Kconfig under driver directory
Date: Tue,  4 Nov 2025 12:25:35 +0200
Message-ID: <4923196ab968bfdbcc2d7572d9be9886c32c06c9.1762251845.git.jani.nikula@intel.com>
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
under driver directories. Follow suit in hyperv.

Cc: Deepak Rawat <drawat.floss@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig        | 14 +-------------
 drivers/gpu/drm/hyperv/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/hyperv/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7e6bc0b3a589..15c2f941a4cd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -398,19 +398,7 @@ source "drivers/gpu/drm/imagination/Kconfig"
 
 source "drivers/gpu/drm/tyr/Kconfig"
 
-config DRM_HYPERV
-	tristate "DRM Support for Hyper-V synthetic video device"
-	depends on DRM && PCI && HYPERV_VMBUS
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
-	help
-	 This is a KMS driver for Hyper-V synthetic video device. Choose this
-	 option if you would like to enable drm driver for Hyper-V virtual
-	 machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) so
-	 that DRM driver is used by default.
-
-	 If M is selected the module will be called hyperv_drm.
+source "drivers/gpu/drm/hyperv/Kconfig"
 
 # Separate option as not all DRM drivers use it
 config DRM_PANEL_BACKLIGHT_QUIRKS
diff --git a/drivers/gpu/drm/hyperv/Kconfig b/drivers/gpu/drm/hyperv/Kconfig
new file mode 100644
index 000000000000..86234f6a73f2
--- /dev/null
+++ b/drivers/gpu/drm/hyperv/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_HYPERV
+	tristate "DRM Support for Hyper-V synthetic video device"
+	depends on DRM && PCI && HYPERV_VMBUS
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	help
+	 This is a KMS driver for Hyper-V synthetic video device. Choose this
+	 option if you would like to enable drm driver for Hyper-V virtual
+	 machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) so
+	 that DRM driver is used by default.
+
+	 If M is selected the module will be called hyperv_drm.
-- 
2.47.3

