Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49F287FC4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 03:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2C6EB9E;
	Fri,  9 Oct 2020 01:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB88899D4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 01:04:20 +0000 (UTC)
IronPort-SDR: HPrXGdJJX3/HpC1k2d2JUDHjW5lAc7ak3nkw6MeI/j0XkEHVa8KYLlsen5/HYdX8yyr+sKbBMv
 K/OHmsoA0Iag==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="162789788"
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="162789788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 18:04:20 -0700
IronPort-SDR: 5d0EwFXvYjAz0cTFq7BiqLSfJewK0E79P1AQIbBR/9WXz/LjtotWWOrFWBUoMoSOotr6oA7a1F
 I7BJGEmqGv9w==
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="343626295"
Received: from mgleaso-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.146.83])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 08 Oct 2020 18:04:20 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 devicetree@vger.kernel.org
Subject: [PATCH v9 5/5] drm/kmb: Build files for KeemBay Display driver
Date: Thu,  8 Oct 2020 18:04:03 -0700
Message-Id: <1602205443-9036-6-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, edmund.j.dea@intel.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: Added Maintainer entry
v3: Added one more Maintainer entry

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 MAINTAINERS                  |  7 +++++++
 drivers/gpu/drm/Kconfig      |  2 ++
 drivers/gpu/drm/Makefile     |  1 +
 drivers/gpu/drm/kmb/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/kmb/Makefile |  2 ++
 5 files changed, 25 insertions(+)
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index c0f494c..a27de1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8899,6 +8899,13 @@ M:	Deepak Saxena <dsaxena@plexity.net>
 S:	Maintained
 F:	drivers/char/hw_random/ixp4xx-rng.c
 
+INTEL KEEMBAY DRM DRIVER
+M:	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+M:	Edmund Dea <edmund.j.dea@intel.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/intel,kmb_display.yaml
+F:	drivers/gpu/drm/kmb/
+
 INTEL MANAGEMENT ENGINE (mei)
 M:	Tomas Winkler <tomas.winkler@intel.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b..97a1631b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -275,6 +275,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
 
 source "drivers/gpu/drm/i915/Kconfig"
 
+source "drivers/gpu/drm/kmb/Kconfig"
+
 config DRM_VGEM
 	tristate "Virtual GEM provider"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8156900..fefaff4 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_MGA)	+= mga/
 obj-$(CONFIG_DRM_I810)	+= i810/
 obj-$(CONFIG_DRM_I915)	+= i915/
+obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
new file mode 100644
index 0000000..e18b74c
--- /dev/null
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -0,0 +1,13 @@
+config DRM_KMB_DISPLAY
+	tristate "INTEL KEEMBAY DISPLAY"
+	depends on DRM && OF && (ARM || ARM64)
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	select VIDEOMODE_HELPERS
+	help
+	Choose this option if you have Intel's KeemBay SOC which integrates
+	an ARM Cortex A53 CPU with an Intel Movidius VPU.
+
+	If M is selected the module will be called kmb-drm.
diff --git a/drivers/gpu/drm/kmb/Makefile b/drivers/gpu/drm/kmb/Makefile
new file mode 100644
index 0000000..527d737
--- /dev/null
+++ b/drivers/gpu/drm/kmb/Makefile
@@ -0,0 +1,2 @@
+kmb-drm-y := kmb_crtc.o kmb_drv.o kmb_plane.o kmb_dsi.o
+obj-$(CONFIG_DRM_KMB_DISPLAY)	+= kmb-drm.o
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
