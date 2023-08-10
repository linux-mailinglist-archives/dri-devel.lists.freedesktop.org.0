Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD1777247
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 10:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271E210E4EB;
	Thu, 10 Aug 2023 08:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793810E4EB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691654989; x=1723190989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IGvDYI8tw8XCk3r8xQTNWfLpvJAoku0Yyo9x7IbfACQ=;
 b=NdMwSOgd67wevc5irGWG0oClAiy6UQiPgqJKK9oXgl+TaMB7QGBEXQDB
 EkcdaT8n/Lfci6lWyphbj7+dDU/Ra4nCHzdRf3d2o/qQQngavWbVdsqo0
 4QpCvxSb7+Ez2a4YxTzKGiJYvxltIOcpOrsYbitAH8zfGHJLg7/y14hVu
 a0B6tuonwY6x/USSzfJjUlrfPE4Rop9/DaWZbVA9fxLIRvlT+2epb82TK
 1pWCZ0/RSi+qAApx3jEPl1BMucM+Ws1tDSP5HBPvONbc8vJ/4YUYCGT34
 43+biPXOcZtCrPGZcalTazbeFXvAgtMHr8N/CmzHDbGUOomFbEkYW267C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435227066"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="435227066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 01:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822148391"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="822148391"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 01:07:09 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
Date: Thu, 10 Aug 2023 10:07:07 +0200
Message-Id: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments regarding new DRM_IVPU_PARAM_CAPABILITIES param.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 include/uapi/drm/ivpu_accel.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index a58a14c9f222..7d1ecc5bbac3 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -69,8 +69,21 @@ extern "C" {
 #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
 #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
 
-#define DRM_IVPU_CAP_METRIC_STREAMER	    1
-#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
+/**
+ * DRM_IVPU_CAP_METRIC_STREAMER
+ *
+ * Metric streamer support, provides sampling of various hardware
+ * performance metrics (like DMA bandwidth, cache miss/hits),
+ * can be used for profiling.
+ */
+#define DRM_IVPU_CAP_METRIC_STREAMER	1
+/**
+ * DRM_IVPU_CAP_DMA_MEMORY_RANGE
+ *
+ * Driver has capability to allocate separate memory range
+ * accessible by hardware DMA.
+ */
+#define DRM_IVPU_CAP_DMA_MEMORY_RANGE	2
 
 /**
  * struct drm_ivpu_param - Get/Set VPU parameters
@@ -123,6 +136,8 @@ struct drm_ivpu_param {
 	 * %DRM_IVPU_PARAM_SKU:
 	 * VPU SKU ID (read-only)
 	 *
+	 * %DRM_IVPU_PARAM_CAPABILITIES:
+	 * Supported capabilities (read-only)
 	 */
 	__u32 param;
 
-- 
2.25.1

