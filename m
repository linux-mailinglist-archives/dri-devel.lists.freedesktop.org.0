Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71358E888
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B9AF023B;
	Wed, 10 Aug 2022 08:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2CDF01FC;
 Wed, 10 Aug 2022 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660119434; x=1691655434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U73AnDep73YO2XJNE4CaSMbQa/kfRx40JcjI7QeZNKU=;
 b=dvWEiTqXQcMHEBnaiR1YQ53OlJlmnrzIgrk1+92og4maxkQI9Wt37d61
 PNtRG90joc/crZLt9H7V+zXo7g+lyIhrZ/bumdN4VJ6chgsIpReSbNsgf
 8ZtUvTzYgKKewjLUKQSkIlTWymvuTVUSKqnUZ3UZ5/NIzNKdhzGlP3uT+
 8Ael8zxb+kWBs8FVUQ+te/7UfgwCyQX8bbgQjiGLPsi9AZ9OKi8aEL0GA
 NMtE0eDWRim11jM6I1NGlUynBACLnAqgMrAPbUV5YyqlU5djMpsXnqG/Z
 lSG6x5A3nF4fzrbZX2tPFmQTZpyOQvp+ppGdcP2zKMI1qePthd0CDlYBp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316974622"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="316974622"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 01:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="673211326"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2022 01:17:12 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Add missing DP DSC extended capability definitions.
Date: Wed, 10 Aug 2022 11:17:52 +0300
Message-Id: <20220810081753.12075-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
References: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
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
 manasi.d.navare@intel.com, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding DP DSC register definitions, we might need for further
DSC implementation, supporting MST and DP branch pass-through mode.

v2: - Fixed checkpatch comment warning
v3: - Removed function which is not yet used(Jani Nikula)

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

