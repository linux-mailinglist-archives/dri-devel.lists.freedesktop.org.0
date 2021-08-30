Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193B3FB3E3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D402889DC0;
	Mon, 30 Aug 2021 10:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BFE89DC0;
 Mon, 30 Aug 2021 10:29:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197811431"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="197811431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="497453615"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/5] drm/displayid: re-align data block macros
Date: Mon, 30 Aug 2021 13:28:59 +0300
Message-Id: <1cbbea07dfcce46df37854d53f769a40a058a92d.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630319138.git.jani.nikula@intel.com>
References: <cover.1630319138.git.jani.nikula@intel.com>
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

Make the values easier to read. Also add DisplayID Structure version and
revision information (this is different from the spec version).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_displayid.h | 57 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index ec64d141f578..0ed9445b5482 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -26,35 +26,36 @@
 
 struct edid;
 
-#define DATA_BLOCK_PRODUCT_ID 0x00
-#define DATA_BLOCK_DISPLAY_PARAMETERS 0x01
-#define DATA_BLOCK_COLOR_CHARACTERISTICS 0x02
-#define DATA_BLOCK_TYPE_1_DETAILED_TIMING 0x03
-#define DATA_BLOCK_TYPE_2_DETAILED_TIMING 0x04
-#define DATA_BLOCK_TYPE_3_SHORT_TIMING 0x05
-#define DATA_BLOCK_TYPE_4_DMT_TIMING 0x06
-#define DATA_BLOCK_VESA_TIMING 0x07
-#define DATA_BLOCK_CEA_TIMING 0x08
-#define DATA_BLOCK_VIDEO_TIMING_RANGE 0x09
-#define DATA_BLOCK_PRODUCT_SERIAL_NUMBER 0x0a
-#define DATA_BLOCK_GP_ASCII_STRING 0x0b
-#define DATA_BLOCK_DISPLAY_DEVICE_DATA 0x0c
-#define DATA_BLOCK_INTERFACE_POWER_SEQUENCING 0x0d
-#define DATA_BLOCK_TRANSFER_CHARACTERISTICS 0x0e
-#define DATA_BLOCK_DISPLAY_INTERFACE 0x0f
-#define DATA_BLOCK_STEREO_DISPLAY_INTERFACE 0x10
-#define DATA_BLOCK_TILED_DISPLAY 0x12
-#define DATA_BLOCK_CTA 0x81
+/* DisplayID Structure v1r2 Data Blocks */
+#define DATA_BLOCK_PRODUCT_ID			0x00
+#define DATA_BLOCK_DISPLAY_PARAMETERS		0x01
+#define DATA_BLOCK_COLOR_CHARACTERISTICS	0x02
+#define DATA_BLOCK_TYPE_1_DETAILED_TIMING	0x03
+#define DATA_BLOCK_TYPE_2_DETAILED_TIMING	0x04
+#define DATA_BLOCK_TYPE_3_SHORT_TIMING		0x05
+#define DATA_BLOCK_TYPE_4_DMT_TIMING		0x06
+#define DATA_BLOCK_VESA_TIMING			0x07
+#define DATA_BLOCK_CEA_TIMING			0x08
+#define DATA_BLOCK_VIDEO_TIMING_RANGE		0x09
+#define DATA_BLOCK_PRODUCT_SERIAL_NUMBER	0x0a
+#define DATA_BLOCK_GP_ASCII_STRING		0x0b
+#define DATA_BLOCK_DISPLAY_DEVICE_DATA		0x0c
+#define DATA_BLOCK_INTERFACE_POWER_SEQUENCING	0x0d
+#define DATA_BLOCK_TRANSFER_CHARACTERISTICS	0x0e
+#define DATA_BLOCK_DISPLAY_INTERFACE		0x0f
+#define DATA_BLOCK_STEREO_DISPLAY_INTERFACE	0x10
+#define DATA_BLOCK_TILED_DISPLAY		0x12
+#define DATA_BLOCK_VENDOR_SPECIFIC		0x7f
+#define DATA_BLOCK_CTA				0x81
 
-#define DATA_BLOCK_VENDOR_SPECIFIC 0x7f
-
-#define PRODUCT_TYPE_EXTENSION 0
-#define PRODUCT_TYPE_TEST 1
-#define PRODUCT_TYPE_PANEL 2
-#define PRODUCT_TYPE_MONITOR 3
-#define PRODUCT_TYPE_TV 4
-#define PRODUCT_TYPE_REPEATER 5
-#define PRODUCT_TYPE_DIRECT_DRIVE 6
+/* DisplayID Structure v1r2 Product Type */
+#define PRODUCT_TYPE_EXTENSION			0
+#define PRODUCT_TYPE_TEST			1
+#define PRODUCT_TYPE_PANEL			2
+#define PRODUCT_TYPE_MONITOR			3
+#define PRODUCT_TYPE_TV				4
+#define PRODUCT_TYPE_REPEATER			5
+#define PRODUCT_TYPE_DIRECT_DRIVE		6
 
 struct displayid_header {
 	u8 rev;
-- 
2.20.1

