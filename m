Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429432A5A88
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 00:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAD96E90F;
	Tue,  3 Nov 2020 23:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107A06E90A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 23:27:10 +0000 (UTC)
IronPort-SDR: 3fzQnZwhoyyMDDKZrB2Xr+9xGyuDZgHxAcGL+GESS2GK7nJzbtFfFLe/VpO3T3UcLBWpUfHAQk
 C/LC/7TXolXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="166550718"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="166550718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 15:27:09 -0800
IronPort-SDR: 8yNNT1EBmeLgwxbz02CUilCcrVcu/bnDREHJvztn8IUXlxlgYF9mslR6Ca4DC9Aw3OATc9srA8
 d1nIDfG/gwig==
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="528679739"
Received: from adamreyx-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.36.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Nov 2020 15:26:48 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v12 7/7] drm/kmb: Build files for KeemBay Display driver
Date: Tue,  3 Nov 2020 15:26:18 -0800
Message-Id: <1604445978-14924-8-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: Added Maintainer entry
v3: Added one more Maintainer entry
v3: drop videomode_helpers

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 MAINTAINERS                  |  7 +++++++
 drivers/gpu/drm/Kconfig      |  2 ++
 drivers/gpu/drm/Makefile     |  1 +
 drivers/gpu/drm/kmb/Kconfig  | 12 ++++++++++++
 drivers/gpu/drm/kmb/Makefile |  2 ++
 5 files changed, 24 insertions(+)
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 71e29dc..c82ea76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8961,6 +8961,13 @@ M:	Deepak Saxena <dsaxena@plexity.net>
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
index 64376dd..3dc293c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -268,6 +268,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
 
 source "drivers/gpu/drm/i915/Kconfig"
 
+source "drivers/gpu/drm/kmb/Kconfig"
+
 config DRM_VGEM
 	tristate "Virtual GEM provider"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8156900..fefaff4c 100644
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
index 0000000..2dd7e68
--- /dev/null
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -0,0 +1,12 @@
+config DRM_KMB_DISPLAY
+	tristate "INTEL KEEMBAY DISPLAY"
+	depends on DRM && OF && (ARM || ARM64)
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
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
