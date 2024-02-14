Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BD8543D7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F7610E3E8;
	Wed, 14 Feb 2024 08:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUqp13gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAB210E1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898390; x=1739434390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tAnxUw9S6MLPS3imLnJhfJqFqfqBTmobv9jITN8Y5s=;
 b=dUqp13gIH/P7FgB19nYzzOyF/yrenbDGdAulqaJOup4Q//+7geaW6yKx
 z8pI4agh9f9FJnUAJXtNsQZyTpzw/FLahkyolw8dkT2dwX1ecIpaQUIKS
 WVH/DFdGATA5YqoXMVyaf27URRgFi2vbUXcVz9xqsrvqorwdOyOCoLEXv
 vjlPcF4ZKTTigJzY3XmU5SZw7wiBJi49ND83jXQaTMDZXOdaiDIjavCh9
 EC2OsOZHGJ0f0Ql0B1tQc5aVfnTAtYeSfYhj54XO/bGN1M1oZ/N6oCjcC
 ugTWcbfAB1TzJJWqqJQM6hXmixclsVqd1M2MyBx6X4FvfI4VGDFWPVrEH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651646"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407365"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:09 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 1/8] accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
Date: Wed, 14 Feb 2024 09:12:58 +0100
Message-ID: <20240214081305.290108-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove legacy postfix from TILE_SKU_BOTH macro.
This was missed when renaming MTL to VPU37XX.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index f15a93d83057..0e7cde1bb422 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -13,7 +13,7 @@
 #include "ivpu_pm.h"
 
 #define TILE_FUSE_ENABLE_BOTH        0x0
-#define TILE_SKU_BOTH_MTL            0x3630
+#define TILE_SKU_BOTH                0x3630
 
 /* Work point configuration values */
 #define CONFIG_1_TILE                0x01
@@ -599,7 +599,7 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 	struct ivpu_hw_info *hw = vdev->hw;
 
 	hw->tile_fuse = TILE_FUSE_ENABLE_BOTH;
-	hw->sku = TILE_SKU_BOTH_MTL;
+	hw->sku = TILE_SKU_BOTH;
 	hw->config = WP_CONFIG_2_TILE_4_3_RATIO;
 
 	ivpu_pll_init_frequency_ratios(vdev);
-- 
2.43.0

