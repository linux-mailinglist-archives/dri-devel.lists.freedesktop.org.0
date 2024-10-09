Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFEB996D31
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9FD10E735;
	Wed,  9 Oct 2024 14:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZBL4AEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D322410E731
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728482715; x=1760018715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+RcdG33kM26lU8gV00I0eEdx5IVJum437p9861Mbh+E=;
 b=dZBL4AEYmNsAukeU2dKNd6/Aig9SD+kz4PTS1njoaH3A3PkcSqX5rL94
 GQkwS/AeSM9UV8A3RGJcoP3LU0DQ6TQS6+p6zaJP4CrP+JnOKW8KiR3gk
 WOo3DSbFAobsHpMDSNr3YOF1h5dcsHps90MG91Y+XGR1Y9XTSuZCf62IP
 K8mkTuEangh1djGzUNAGgVRhR2CbVDveyWYk2H3GKGQKmAo2v6ZTJQffC
 eiMrQTrDj+QYd6vlN7IAaKThI2NonqgNfqtIZHtbf0g3UA0nrjslfIplE
 ftrX4D43l9w40245JRZO7/ZJMbW63EhPpDzDxjboNuVWMkP3+rcT5/W5O A==;
X-CSE-ConnectionGUID: h0L2k/dNQomIeDEYy1Ba2A==
X-CSE-MsgGUID: V2pZZu19R32tdMAO36wfkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31679337"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31679337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:05:02 -0700
X-CSE-ConnectionGUID: IqgK93AjT/GmyPQQHQc6CQ==
X-CSE-MsgGUID: 5EyCHrbxSQGGYeWY21+fxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="81067851"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:04:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/imx: add forward declarations for types
Date: Wed,  9 Oct 2024 17:04:52 +0300
Message-Id: <20241009140452.1981175-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

The imx.h header does not forward declare the types it uses, and the
header is not self-contained. Fix it.

Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/bridge/imx.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
index e14f429a9ca2..b93f719fe0e7 100644
--- a/include/drm/bridge/imx.h
+++ b/include/drm/bridge/imx.h
@@ -6,6 +6,10 @@
 #ifndef DRM_IMX_BRIDGE_H
 #define DRM_IMX_BRIDGE_H
 
+struct device;
+struct device_node;
+struct drm_bridge;
+
 struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 					      struct device_node *np,
 					      int type);
-- 
2.39.5

