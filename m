Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C2282076
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 04:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9F6EA12;
	Sat,  3 Oct 2020 02:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F456EA09
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 02:17:33 +0000 (UTC)
IronPort-SDR: LVJE0r+VrgPTOwa3Jl1kAJvc4oe7/188cRpyJA94HbDoMdxQ9VXSr9mX6jRDpEKYonsY30komS
 GxgvpMMabVug==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247871951"
X-IronPort-AV: E=Sophos;i="5.77,330,1596524400"; d="scan'208";a="247871951"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 19:17:32 -0700
IronPort-SDR: wo9yGm0J5wIheeS2uG35Ft5VnbH51IyEiFOBrH7aQP7g7M9pAzwPSpFdGzQHWSjr/S0nb9jHYJ
 NmJDNYGH+hFA==
X-IronPort-AV: E=Sophos;i="5.77,330,1596524400"; d="scan'208";a="340197150"
Received: from cshinn-mobl1.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.255.91.49])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2020 19:17:32 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v8 4/4] drm/kmb: Build files for KeemBay Display driver
Date: Fri,  2 Oct 2020 19:17:02 -0700
Message-Id: <1601691422-12851-5-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601691422-12851-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1601691422-12851-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: Added Maintainer entry

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 MAINTAINERS                  |  6 ++++++
 drivers/gpu/drm/Kconfig      |  2 ++
 drivers/gpu/drm/Makefile     |  1 +
 drivers/gpu/drm/kmb/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/kmb/Makefile |  2 ++
 5 files changed, 24 insertions(+)
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index c0f494c..8574f2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8899,6 +8899,12 @@ M:	Deepak Saxena <dsaxena@plexity.net>
 S:	Maintained
 F:	drivers/char/hw_random/ixp4xx-rng.c
 
+INTEL KEEMBAY DRM DRIVER
+M:	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
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
