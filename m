Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B893C8763C8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7292B10F9BB;
	Fri,  8 Mar 2024 11:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv9nkQeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76822113899;
 Fri,  8 Mar 2024 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899017; x=1741435017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CiyAoGYZGai14HYlsnf44c0YjkSUv+QGeyyuybfNDtY=;
 b=gv9nkQeX9yh5eJGUfDvOp2ALTPbTVveuln1jjNLOm+T06/lcjU0EGBUo
 mumZ2Y+HlQwbA6MK+3Ek4yy0hCS3ZWcHVuZTtM6ZmTadYMOXTpdlr78DI
 4R89tgdpXhEqI3RE6bTeXjNMRRI573XVyUHem7UIyvPof/EBw3hmjLPQl
 1OUpluvdM5ZHMhHQMZQuc00rgfqRcVsnHemzRlh5rCJwTd6U3WwqgTrxV
 SDkCkl/uby/dTq7jB1eyDlOKgXStA1N1YEj/0QkVMPzkPD0C+11xXh9xz
 SDHQpX3GcbiMOQsN6VqKV5S1oF755Cqb6HJaFDQI8XPxUNrzNO6XdaTz7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794534"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378561"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 07/16] drm/i915/pxp: fix i915_pxp_tee_interface.h
 kernel-doc warnings
Date: Fri,  8 Mar 2024 13:55:45 +0200
Message-Id: <7c26256dc00f970f94d145b73e341c36f553dfe4.1709898638.git.jani.nikula@intel.com>
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

Make documentation match code. Slightly fix up the documentation
comments while at it.

v2:
- Move comments next to members instead of struct comment (Lucas)
- Small fixups while at it

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_pxp_tee_interface.h | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
index 7d96985f2d05..a532d32f58f3 100644
--- a/include/drm/i915_pxp_tee_interface.h
+++ b/include/drm/i915_pxp_tee_interface.h
@@ -12,20 +12,26 @@ struct scatterlist;
 
 /**
  * struct i915_pxp_component_ops - ops for PXP services.
- * @owner: Module providing the ops
- * @send: sends data to PXP
- * @receive: receives data from PXP
  */
 struct i915_pxp_component_ops {
 	/**
-	 * @owner: owner of the module provding the ops
+	 * @owner: Module providing the ops.
 	 */
 	struct module *owner;
 
+	/**
+	 * @send: Send a PXP message.
+	 */
 	int (*send)(struct device *dev, const void *message, size_t size,
 		    unsigned long timeout_ms);
+	/**
+	 * @recv: Receive a PXP message.
+	 */
 	int (*recv)(struct device *dev, void *buffer, size_t size,
 		    unsigned long timeout_ms);
+	/**
+	 * @gsc_command: Send a GSC command.
+	 */
 	ssize_t (*gsc_command)(struct device *dev, u8 client_id, u32 fence_id,
 			       struct scatterlist *sg_in, size_t total_in_len,
 			       struct scatterlist *sg_out);
@@ -35,14 +41,21 @@ struct i915_pxp_component_ops {
 /**
  * struct i915_pxp_component - Used for communication between i915 and TEE
  * drivers for the PXP services
- * @tee_dev: device that provide the PXP service from TEE Bus.
- * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
  */
 struct i915_pxp_component {
+	/**
+	 * @tee_dev: device that provide the PXP service from TEE Bus.
+	 */
 	struct device *tee_dev;
+
+	/**
+	 * @ops: Ops implemented by TEE driver, used by i915 driver.
+	 */
 	const struct i915_pxp_component_ops *ops;
 
-	/* To protect the above members. */
+	/**
+	 * @mutex: To protect the above members.
+	 */
 	struct mutex mutex;
 };
 
-- 
2.39.2

