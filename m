Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B388763C6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B11113898;
	Fri,  8 Mar 2024 11:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMYGzpNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931D3113895;
 Fri,  8 Mar 2024 11:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899010; x=1741435010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JwmzW4U97OcFzhsYUgZu7ZmtooXKIzJVIR2+CjQ5nMU=;
 b=NMYGzpNhbr12yRG07m8nw8DESrybRjU3G3tO44o+BAcE7qGwk217FjeZ
 qejioz+omQALd6sxuSNBima60koYpRBEZ1IkGM2NO0MRDGSFUs2uzbmA6
 YwFLRlCLgFWWDWj0i7523u1dHc1qsrTHHZNO9wUFsZM2Jj0kHE4gKzokQ
 EQNVFvEnBj/nFcf1NXbGdKUyiQ4wFdkIHcEmwZ8O07oFmLQ9PA42gs7//
 BguKKhk+GTx9X3c2V/l/PHm5npktr1xF+LWxK52r3SfeLWrsXcgdOYfP8
 uuksGX3bZ+XDRE2CrbPxTr+A7U/ZMJobUpi41OM7kT7Z6vW3sNk2ii/MG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15336102"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15336102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10542720"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 06/16] drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc
 warnings
Date: Fri,  8 Mar 2024 13:55:44 +0200
Message-Id: <5c7ba8db172101c40b686463f169ec579a509f29.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

v2: Small fixups while at it (Lucas)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_hdcp_interface.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/drm/i915_hdcp_interface.h b/include/drm/i915_hdcp_interface.h
index 4c9c8167c2d5..d776ed7dcd00 100644
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
+	 * @hdcp_dev: device that provides the HDCP2.2 service from MEI Bus.
+	 */
 	struct device *hdcp_dev;
+
+	/**
+	 * @ops: Ops implemented by hdcp driver or intel_hdcp_gsc, used by i915
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

