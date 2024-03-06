Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C4873F53
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF15113435;
	Wed,  6 Mar 2024 18:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSvSI7Ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E87C113435;
 Wed,  6 Mar 2024 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749979; x=1741285979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PfPtbSVeO2YwqVJeTicNqwEE80nO7YU06WJSz07i18o=;
 b=SSvSI7Ik4UknQFn04Fbj7l4bdmtL6q5VAAvogt59uqwiBXWK9SFDY5iB
 5IdyIYrQ6l0v0nIL0bfg9u7P+odIjV4I5I5uN+UPu56SEb1RGVsahAmb5
 6nioOa7Vtw7lSjmnZnLHmKh9kRLzDFjmDZZe4QgAqV8VGVA7C93EZJeyY
 XJDRMsJuse6zoXwZ7VmfT8UAmbuCyWnjQ7woA4+X4yORxNtZvCkAuacNL
 HpekrmUsiwtv1mML9CcpISt1/xKzSG7uKXJR+TDxYY8atgFKD6NRvQn6P
 faMqtL2PsxnS8tOKDaDJt1tIBK9f6Ku8BwN3Fj+ylvNqat4LIWKg2fRlr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="14958915"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14958915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9927266"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 17/22] drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc
 warnings
Date: Wed,  6 Mar 2024 20:31:22 +0200
Message-Id: <f39bd169d27483aca7bed07929b87869bf8927fe.1709749576.git.jani.nikula@intel.com>
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

Make documentation match code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_pxp_tee_interface.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
index 7d96985f2d05..653e85d6e32b 100644
--- a/include/drm/i915_pxp_tee_interface.h
+++ b/include/drm/i915_pxp_tee_interface.h
@@ -14,12 +14,10 @@ struct scatterlist;
  * struct i915_pxp_component_ops - ops for PXP services.
  * @owner: Module providing the ops
  * @send: sends data to PXP
- * @receive: receives data from PXP
+ * @recv: receives data from PXP
+ * @gsc_command: send gsc command
  */
 struct i915_pxp_component_ops {
-	/**
-	 * @owner: owner of the module provding the ops
-	 */
 	struct module *owner;
 
 	int (*send)(struct device *dev, const void *message, size_t size,
@@ -35,14 +33,21 @@ struct i915_pxp_component_ops {
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

