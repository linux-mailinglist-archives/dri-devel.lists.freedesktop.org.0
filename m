Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417DB873F51
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15095113445;
	Wed,  6 Mar 2024 18:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3ny92Bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D3113443;
 Wed,  6 Mar 2024 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749973; x=1741285973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NG4hki+P2ftt8nZnVOoplw/Pepw4C/fW++QYecAGW2I=;
 b=Q3ny92BtKxutnx9h9E8/8gp/yU8U4dAZhn29ZteW4iY+NPl3ag24JPxK
 N+RDHqqpQ9/U15TOSK4uQhEQZfJMSqqUGcoRqw3ZRgatDTmpmuZr2fvlj
 pj8aeKNhsGkjz+P1JcWkpKlhtb2ot8BMuo7NXEEhPJJR88tw8CqdvG7WY
 xOOeM8vO0t9i4aJWd7F+kASCCIhM8W/sLVMgpBBcZ1WDHCT6ot+7W1JMe
 PoADHY+VQP75C0Z2M493pMh/d1moFQMCl8j7c+N6NU/lODa7NVvlwUs4b
 3A3/SyROaIdeEWns2Nk770sQZD/G5bCpeYyYWXLaOdg9btB87n2+5CWHZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8195806"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8195806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14496686"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 16/22] drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc
 warnings
Date: Wed,  6 Mar 2024 20:31:21 +0200
Message-Id: <bafcefd0cdfbfad86b15d80d63d66476de917fff.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Make the documentation match code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_hdcp_interface.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/drm/i915_hdcp_interface.h b/include/drm/i915_hdcp_interface.h
index 4c9c8167c2d5..a9f2ee576de8 100644
--- a/include/drm/i915_hdcp_interface.h
+++ b/include/drm/i915_hdcp_interface.h
@@ -54,7 +54,7 @@ enum hdcp_ddi {
 };
 
 /**
- * enum hdcp_tc - ME/GSC Firmware defined index for transcoders
+ * enum hdcp_transcoder - ME/GSC Firmware defined index for transcoders
  * @HDCP_INVALID_TRANSCODER: Index for Invalid transcoder
  * @HDCP_TRANSCODER_EDP: Index for EDP Transcoder
  * @HDCP_TRANSCODER_DSI0: Index for DSI0 Transcoder
@@ -106,7 +106,7 @@ struct hdcp_port_data {
  *			    And Prepare AKE_Init.
  * @verify_receiver_cert_prepare_km: Verify the Receiver Certificate
  *				     AKE_Send_Cert and prepare
-				     AKE_Stored_Km/AKE_No_Stored_Km
+ *				     AKE_Stored_Km/AKE_No_Stored_Km
  * @verify_hprime: Verify AKE_Send_H_prime
  * @store_pairing_info: Store pairing info received
  * @initiate_locality_check: Prepare LC_Init
@@ -170,14 +170,22 @@ struct i915_hdcp_ops {
 /**
  * struct i915_hdcp_arbiter - Used for communication between i915
  * and hdcp drivers for the HDCP2.2 services
- * @hdcp_dev: device that provide the HDCP2.2 service from MEI Bus.
- * @hdcp_ops: Ops implemented by hdcp driver or intel_hdcp_gsc , used by i915 driver.
  */
 struct i915_hdcp_arbiter {
+	/**
+	 * @hdcp_dev: device that provide the HDCP2.2 service from MEI Bus.
+	 */
 	struct device *hdcp_dev;
+
+	/**
+	 * @ops: Ops implemented by hdcp driver or intel_hdcp_gsc , used by i915
+	 * driver.
+	 */
 	const struct i915_hdcp_ops *ops;
 
-	/* To protect the above members. */
+	/**
+	 * @mutex: To protect the above members.
+	 */
 	struct mutex mutex;
 };
 
-- 
2.39.2

