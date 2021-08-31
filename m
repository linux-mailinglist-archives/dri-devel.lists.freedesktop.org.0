Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960753FC987
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED496E041;
	Tue, 31 Aug 2021 14:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C789FA0;
 Tue, 31 Aug 2021 14:17:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="215352970"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="215352970"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="498309237"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 1/6] drm/displayid: re-align data block macros
Date: Tue, 31 Aug 2021 17:17:30 +0300
Message-Id: <b73d3ff2d5e4b23834ed0005186c5cf3a9de5c9e.1630419362.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630419362.git.jani.nikula@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
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
2.30.2

