Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7335A2411
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4A510E7C8;
	Fri, 26 Aug 2022 09:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6802E10E7B3;
 Fri, 26 Aug 2022 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505577; x=1693041577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=04l72mGa5RZDA9Jfx1Flib/jQulzbYfdi65CrNhdyTg=;
 b=bhOmZxoTatR5M5vjNTIvOavnmF90pOid46AGH6iLyPNSUj3/5XbSvzQ4
 PkQDa78fehCxV3276Yyj7qDGD4Iu2DE7RGgO63dCbm1jtri6yO9Xke1rD
 JAq/v0r4VSQipz0+IqYDjcmfJ91LiFO+5TjLbeFEfYYofChDdoNRUE65d
 oCVN0w+pv/XjItKBdmpY4VQRi31h/ojGKduTn/0BO8zC2swOhNKL/Y7iG
 RQky0+D2cDxSlYSe+gG34oskFVdm/bs5T7+J6v+cl4tI+3v4q1yCMBe7F
 y3Yr1NHclBV5GeOXCIp/uCGbEGrSHj8w8Pi209ZQEFZZ4HrBf5qrp66Ka Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274217125"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="274217125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="752816370"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 02:19:33 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm: Add missing DP DSC extended capability definitions.
Date: Fri, 26 Aug 2022 12:20:16 +0300
Message-Id: <20220826092019.23151-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
References: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding DP DSC register definitions, we might need for further
DSC implementation, supporting MST and DP branch pass-through mode.

v2: - Fixed checkpatch comment warning
v3: - Removed function which is not yet used(Jani Nikula)

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 include/drm/display/drm_dp.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 9e3aff7e68bb..0d05e3172f96 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -239,6 +239,9 @@
 
 #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
 # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
+# define DP_DSC_PASS_THROUGH_IS_SUPPORTED   (1 << 1)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
 
 #define DP_DSC_REV                          0x061
 # define DP_DSC_MAJOR_MASK                  (0xf << 0)
@@ -277,12 +280,15 @@
 
 #define DP_DSC_BLK_PREDICTION_SUPPORT       0x066
 # define DP_DSC_BLK_PREDICTION_IS_SUPPORTED (1 << 0)
+# define DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT (1 << 1)
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_LOW       0x067   /* eDP 1.4 */
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
+# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
+# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
 
 #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
 # define DP_DSC_RGB                         (1 << 0)
@@ -344,11 +350,13 @@
 # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
 
 #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
+# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
+# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
 # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
 # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
 # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
 # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
-# define DP_DSC_BITS_PER_PIXEL_1            0x4
+# define DP_DSC_BITS_PER_PIXEL_1_1          0x4
 
 #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
 # define DP_PSR_IS_SUPPORTED                1
-- 
2.24.1.485.gad05a3d8e5

