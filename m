Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBC6F487B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 18:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D0110E5A2;
	Tue,  2 May 2023 16:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EBA10E183;
 Tue,  2 May 2023 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683045556; x=1714581556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5U99HzjOt4rO0hWH0XeL5t22Wu0472GBnpbwGWnV4pQ=;
 b=le0UrPrw1jH7rbvtxuqC3PXWiF8RKg4Wp14KECf3pg5+TsX25+rQfk1E
 rPQkKlwvfWjUBIw7/u9kOJdJtycQlhbioN8pHq5ydK3JcKTDAc1K/qCSk
 XUvnWhWok84fUAF/YlUg+G61F9OVdPojxX+h/3wYTtZ8MSZqZt4E3MTIR
 BsPiLZB5jAaAqyDfVA8rTF5zmQQ04KP2919dnbEHh8c6plXAcIh1pkHeU
 sNERdsbqD3sA5KnHLqWQVoVzDxa06H44XTeOinXED68sEYYg9ARIuJmRR
 teguW7MZdgrz3dRXcheMcRUWuKKni4VTELzn5tGExLYuc6SrRmMi/aIBJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411595948"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="411595948"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 09:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026160910"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="1026160910"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 09:39:06 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/i915/mtl: Define GSC Proxy component interface
Date: Tue,  2 May 2023 09:38:51 -0700
Message-Id: <20230502163854.317653-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
References: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

GSC Proxy component is used for communication between the
Intel graphics driver and MEI driver.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

v2: Improve documentation, remove unneeded includes

 include/drm/i915_component.h               |  3 +-
 include/drm/i915_gsc_proxy_mei_interface.h | 53 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
index c1e2a43d2d1e..56a84ee1c64c 100644
--- a/include/drm/i915_component.h
+++ b/include/drm/i915_component.h
@@ -29,7 +29,8 @@
 enum i915_component_type {
 	I915_COMPONENT_AUDIO = 1,
 	I915_COMPONENT_HDCP,
-	I915_COMPONENT_PXP
+	I915_COMPONENT_PXP,
+	I915_COMPONENT_GSC_PROXY,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/i915_gsc_proxy_mei_interface.h
new file mode 100644
index 000000000000..9462341d3ae1
--- /dev/null
+++ b/include/drm/i915_gsc_proxy_mei_interface.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2022-2023 Intel Corporation
+ */
+
+#ifndef _I915_GSC_PROXY_MEI_INTERFACE_H_
+#define _I915_GSC_PROXY_MEI_INTERFACE_H_
+
+#include <linux/types.h>
+
+struct device;
+struct module;
+
+/**
+ * struct i915_gsc_proxy_component_ops - ops for GSC Proxy services.
+ * @owner: Module providing the ops
+ * @send: sends a proxy message from GSC FW to ME FW
+ * @recv: receives a proxy message for GSC FW from ME FW
+ */
+struct i915_gsc_proxy_component_ops {
+	struct module *owner;
+
+	/**
+	 * send - Sends a proxy message to ME FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @buf: message buffer to send
+	 * @size: size of the message
+	 * Return: bytes sent on success, negative errno value on failure
+	 */
+	int (*send)(struct device *dev, const void *buf, size_t size);
+
+	/**
+	 * recv - Receives a proxy message from ME FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @buf: message buffer to contain the received message
+	 * @size: size of the buffer
+	 * Return: bytes received on success, negative errno value on failure
+	 */
+	int (*recv)(struct device *dev, void *buf, size_t size);
+};
+
+/**
+ * struct i915_gsc_proxy_component - Used for communication between i915 and
+ * MEI drivers for GSC proxy services
+ * @mei_dev: device that provide the GSC proxy service.
+ * @ops: Ops implemented by GSC proxy driver, used by i915 driver.
+ */
+struct i915_gsc_proxy_component {
+	struct device *mei_dev;
+	const struct i915_gsc_proxy_component_ops *ops;
+};
+
+#endif /* _I915_GSC_PROXY_MEI_INTERFACE_H_ */
-- 
2.40.0

