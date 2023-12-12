Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D080EE24
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C93210E1CD;
	Tue, 12 Dec 2023 13:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1810E1CD;
 Tue, 12 Dec 2023 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702389226; x=1733925226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+3lHOrz2iNZ5BiwoCQtwsUK0FLciuRrcFHfVaTqSzC8=;
 b=ipuckBliDn/mpSW0TzvqS6YX9rzS72KmttvOLE71EnvKwp7H9hNle7bd
 KWvsrskmE/oZb3ZCewLqX2uSQfZbvFwLSF3CrozxGr4wtB4MnjVzdtZ3C
 qINvgT1EuqMibuGoC1lH66gRBaf/yisd5mOVm4FEtDnpRnvbgZwoumepG
 mYL6FLNu528/bfdp7Ye398Opx06EJJZRoynr9uh1jI0QDVY7fZLr52MOp
 fUS7OSrtcn3l26RLdlIK/HwgUwST3jR1FnGX2PcwGp+l6f4njGWgNyRrQ
 NfVjQqgQfLbF7BvepuOGyzo9E26PxuKAX3kMoNuJQb18cfnvXSnLnaKN+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="16359519"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="16359519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946768063"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="946768063"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:53:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 15:53:38 +0200
Message-Id: <20231212135338.3816669-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Including drm_edid.h from radeon_mode.h causes the rebuild of more than
a hundred files when drm_edid.h is modified, while there are only a
handful of files that actually need to include drm_edid.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/radeon/atombios_encoders.c | 1 +
 drivers/gpu/drm/radeon/dce3_1_afmt.c       | 1 +
 drivers/gpu/drm/radeon/dce6_afmt.c         | 1 +
 drivers/gpu/drm/radeon/evergreen.c         | 1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.c    | 1 +
 drivers/gpu/drm/radeon/radeon_atombios.c   | 1 +
 drivers/gpu/drm/radeon/radeon_audio.c      | 1 +
 drivers/gpu/drm/radeon/radeon_audio.h      | 4 +++-
 drivers/gpu/drm/radeon/radeon_combios.c    | 1 +
 drivers/gpu/drm/radeon/radeon_encoders.c   | 1 +
 drivers/gpu/drm/radeon/radeon_mode.h       | 2 +-
 11 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 4aca09cab4b8..6e537c5bd295 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -29,6 +29,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/radeon_drm.h>
diff --git a/drivers/gpu/drm/radeon/dce3_1_afmt.c b/drivers/gpu/drm/radeon/dce3_1_afmt.c
index e8fe239b9d79..324e9b765098 100644
--- a/drivers/gpu/drm/radeon/dce3_1_afmt.c
+++ b/drivers/gpu/drm/radeon/dce3_1_afmt.c
@@ -21,6 +21,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <linux/hdmi.h>
+#include <drm/drm_edid.h>
 
 #include "radeon.h"
 #include "radeon_asic.h"
diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
index 4a1d5447eac1..4c06f47453fd 100644
--- a/drivers/gpu/drm/radeon/dce6_afmt.c
+++ b/drivers/gpu/drm/radeon/dce6_afmt.c
@@ -21,6 +21,7 @@
  *
  */
 #include <linux/hdmi.h>
+#include <drm/drm_edid.h>
 
 #include "dce6_afmt.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index f0ae087be914..a424b86008b8 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
+#include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/radeon_drm.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/radeon/evergreen_hdmi.c
index 5f3078f8ab95..681119c91d94 100644
--- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
+++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
@@ -26,6 +26,7 @@
  */
 #include <linux/hdmi.h>
 
+#include <drm/drm_edid.h>
 #include <drm/radeon_drm.h>
 #include "evergreen_hdmi.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 85c4bb186203..3596ea4a8b60 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -27,6 +27,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 279bf130a18c..053058c5c1fa 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -26,6 +26,7 @@
 #include <linux/component.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 #include "dce6_afmt.h"
 #include "evergreen_hdmi.h"
diff --git a/drivers/gpu/drm/radeon/radeon_audio.h b/drivers/gpu/drm/radeon/radeon_audio.h
index 05e67867469b..dacaaa007051 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.h
+++ b/drivers/gpu/drm/radeon/radeon_audio.h
@@ -27,7 +27,9 @@
 
 #include <linux/types.h>
 
-#define RREG32_ENDPOINT(block, reg)		\
+struct cea_sad;
+
+#define RREG32_ENDPOINT(block, reg)				\
 	radeon_audio_endpoint_rreg(rdev, (block), (reg))
 #define WREG32_ENDPOINT(block, reg, v)	\
 	radeon_audio_endpoint_wreg(rdev, (block), (reg), (v))
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 2620efc7c675..6952b1273b0f 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -28,6 +28,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 9cb6401fe97e..3de3dce9e89d 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -26,6 +26,7 @@
 
 #include <linux/pci.h>
 
+#include <drm/drm_edid.h>
 #include <drm/drm_device.h>
 #include <drm/radeon_drm.h>
 
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 1decdcec0264..59c4db13d90a 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -32,13 +32,13 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct edid;
 struct radeon_bo;
 struct radeon_device;
 
-- 
2.39.2

