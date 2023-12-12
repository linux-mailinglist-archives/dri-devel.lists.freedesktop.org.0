Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03280EE98
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D110E614;
	Tue, 12 Dec 2023 14:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880710E614
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702391057; x=1733927057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+WqteZjNXiXFUqUfy0YtsA4/JhEpKi9URcDUxPzjKr8=;
 b=XwgsLbI0MMihMRStpg86IA0P6aqjl2/Wcb+ZqY62MkemzqOp8sBI/p3x
 e5HIlpRKYs05tw3dIJOnEHy+r7dm3HAPUFX3soJt+zt7JqqOxu/yfZ3xH
 praoDEfK4KpDSEZb+91dbuZqOEK+UNW7NEFFo871jH2t8Y4fGEMpJ7q6Z
 yaFa3LPo1Lm32fl6Ig/ur7m8ak60YtocsprcKT2dkrDd5hGYvoLmoCukp
 yPwYGJ26V5K6x6GL3L4J9NPT5E4zbxdn6t9b7zqVrnLSV9PA5XfcGbGod
 /YV8/qx1lS4t6XaGX69dLHVl1BYGRtJwtxmFz/fpu74Q51GaFtJyxabz+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1968439"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1968439"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891608935"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="891608935"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:24:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tegra: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 16:24:09 +0200
Message-Id: <20231212142409.3826544-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce the need for rebuilds when drm_edid.h is modified by including it
only where needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/drm.h    | 2 +-
 drivers/gpu/drm/tegra/output.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ccb5d74fa227..682011166a8f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -13,7 +13,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
@@ -26,6 +25,7 @@
 /* XXX move to include/uapi/drm/drm_fourcc.h? */
 #define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT_ULL(22)
 
+struct edid;
 struct reset_control;
 
 struct tegra_drm {
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index dc2dcb5ca1c8..88af956ad0e7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
-- 
2.39.2

