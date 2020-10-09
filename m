Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57528909C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 20:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E94D6ED7D;
	Fri,  9 Oct 2020 18:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6C16ED78
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 18:12:07 +0000 (UTC)
IronPort-SDR: Zm4CfkgFey2pWMFnJFmP1VTUv2b0mlxdwzpSFN1m/WCn2PneYPg+zOej3v2xFVspy/xKyQ8sfN
 qzHqRS8AqZaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165633823"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165633823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 11:12:07 -0700
IronPort-SDR: 379XKykzMF27u0VEGdp5vDMyFcxAyqKrkO4qsUnwq21Q34KNgLwoa7y6rBK0Qe7AO4vcLWDYFV
 fbvpwlLcNkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="518774973"
Received: from kkang6-desktop.kssm.intel.com ([172.21.194.67])
 by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2020 11:12:06 -0700
From: kuhanh.murugasen.krishnan@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 4/4] drm: hantro: Keem Bay VPU DRM build files
Date: Fri,  9 Oct 2020 19:57:55 +0800
Message-Id: <1602244675-8785-5-git-send-email-kuhanh.murugasen.krishnan@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
References: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>

Signed-off-by: Murugasen Krishnan, Kuhanh <kuhanh.murugasen.krishnan@intel.com>
---
 drivers/gpu/drm/Kconfig         |  2 ++
 drivers/gpu/drm/Makefile        |  1 +
 drivers/gpu/drm/hantro/Kconfig  | 21 +++++++++++++++++++++
 drivers/gpu/drm/hantro/Makefile |  6 ++++++
 4 files changed, 30 insertions(+)
 create mode 100644 drivers/gpu/drm/hantro/Kconfig
 create mode 100644 drivers/gpu/drm/hantro/Makefile

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b..723aa68 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -275,6 +275,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
 
 source "drivers/gpu/drm/i915/Kconfig"
 
+source "drivers/gpu/drm/hantro/Kconfig"
+
 config DRM_VGEM
 	tristate "Virtual GEM provider"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2f31579..d79d1fc 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_MGA)	+= mga/
 obj-$(CONFIG_DRM_I810)	+= i810/
 obj-$(CONFIG_DRM_I915)	+= i915/
+obj-$(CONFIG_DRM_HANTRO)  += hantro/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
diff --git a/drivers/gpu/drm/hantro/Kconfig b/drivers/gpu/drm/hantro/Kconfig
new file mode 100644
index 0000000..cbf6d99
--- /dev/null
+++ b/drivers/gpu/drm/hantro/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_HANTRO
+	tristate "Hantro DRM"
+	depends on DRM
+	depends on ARM64
+	select DRM_PANEL
+	select DRM_KMS_HELPER
+	help
+	  Choose this option if you have a system that has "Keem
+	  Bay VPU" hardware which supports Verisilicon's Hantro
+	  Video Processor Unit (VPU) IP, a series of video decoder
+	  and encoder semiconductor IP cores which can be flexibly
+	  configured for video surveillance, multimedia consumer
+	  products, Internet of Things, cloud service products, data
+	  centers, aerial photography and recorders, thereby providing
+	  video transconding and multi-channel HD video encoding and
+	  decoding.
+
+	  Hantro VC8000D allows 4K decoding that supports H264 and HEVC
+	  video formats. Hantro VC8000E allows 4K encoding that supports
+	  H264 and HEVC video formats.
diff --git a/drivers/gpu/drm/hantro/Makefile b/drivers/gpu/drm/hantro/Makefile
new file mode 100644
index 0000000..ade521e7
--- /dev/null
+++ b/drivers/gpu/drm/hantro/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Hantro DRM media codec driver. This driver provides
+# support for Keem Bay Hantro VPU IP.
+hantro-objs := hantro_drm.o hantro_enc.o hantro_dec.o hantro_fence.o
+obj-$(CONFIG_DRM_HANTRO) += hantro.o
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
