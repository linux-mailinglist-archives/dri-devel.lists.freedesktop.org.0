Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBF4FC233
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579FF10E3B4;
	Mon, 11 Apr 2022 16:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5FF10E3C4;
 Mon, 11 Apr 2022 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649694272; x=1681230272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oA4k1gcjh3h8gKZhIi1ShQq0Em7rBOQHFufJ3cE+9rc=;
 b=CzswYRNCWBYPARe+upxNgdyQGayGlLiEIlvtBVtIlAFeshyjzOxIU3mZ
 YVt9CGfTNL/nZbWrqzxO48RqFEr1XYGk4DHZhwvBigKeX3Pio5aLGvuE1
 jk3FP5DKPeFpqr20PsFnYVGDXxFxMdTPKsA7mI3tJ1rl7cuPELXNASeXy
 xhmqoQfQpfOGoksVqb2BOTXrck8a7JvSKL57uCyDORNFn9t44pveXajHC
 vwrSbANOOWavC2/U9yQW2UkV6YV018Eo0S6EqDIXRqpQQBTij7k+GCoTa
 P9913l8Gz8fd9IvXI5LYCquWRuUjkexKrs6XpsttFsB9DhKQVlXs9okZ/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261901404"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261901404"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="801776678"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2022 09:24:30 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Add missing DP DSC extended capability definitions.
Date: Mon, 11 Apr 2022 19:25:17 +0300
Message-Id: <20220411162518.9352-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220411162518.9352-1-stanislav.lisovskiy@intel.com>
References: <20220411162518.9352-1-stanislav.lisovskiy@intel.com>
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
Cc: Stanislav.Lisovskiy@intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding DP DSC register definitions, we might need for further
DSC implementation, supporting MST and DP branch pass-through mode.

v2: - Fixed checkpatch comment warning
v3: - Removed function which is not yet used(Jani Nikula)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 include/drm/dp/drm_dp_helper.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 1eccd9741943..272e687ae25f 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -246,6 +246,9 @@ struct drm_panel;
 
 #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
 # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
+# define DP_DSC_PASS_THROUGH_IS_SUPPORTED   (1 << 1)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
 
 #define DP_DSC_REV                          0x061
 # define DP_DSC_MAJOR_MASK                  (0xf << 0)
@@ -284,12 +287,15 @@ struct drm_panel;
 
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
@@ -351,11 +357,13 @@ struct drm_panel;
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

