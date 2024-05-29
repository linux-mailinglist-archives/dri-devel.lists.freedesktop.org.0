Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B58D32CE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AA110E139;
	Wed, 29 May 2024 09:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+oOdN6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006810E191
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716974415; x=1748510415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2eWD/aliZuypWQYfrX/FM2hkqJCz6h66OR04BByLO3Y=;
 b=T+oOdN6LgapvgwLdfpBjcOIkZNXtV254CvVFtCgSsA6k0R/dGVIx+XoW
 QHUgyVLpK0l6ujaWliAlUFOa/5KEN7EauO+TG/iCZlSh9+vgL9m/32NTG
 cmzniOKLPuT1kjway/aZJ+88HqgYlo5eov+B463vWk0SJ7lC1aOxpU5jw
 gUc5VDiQpRf+OrDMAj2l6jOx3cjet8/Vr3A8+caUgebKawAhiQbsBLj1l
 +vt9R0Kdnlt0RFEqOJuG9lID4Lv1w2XsSQjqMPkWAEU7FgB8wNjfUZakd
 hMBHF9Zt8YDsJiUn1h/fRTzmg0p8VM6Vd08xhtu0cGWodoh4Rdc2/+mUa Q==;
X-CSE-ConnectionGUID: NeXwazIwRiWtqHlvgMRYYw==
X-CSE-MsgGUID: s3DbsOJzRny3Hz8XECpYHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13595909"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13595909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:20:14 -0700
X-CSE-ConnectionGUID: AAoVM9izRIqWMWHclxMjtw==
X-CSE-MsgGUID: NuSi3GfpRECjIlAJFXi2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35306255"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.38])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:20:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedsktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Add a missing Kconfig select
Date: Wed, 29 May 2024 11:19:55 +0200
Message-ID: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix the following warning:

WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..47592b6fc868 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -79,6 +79,7 @@ config DRM_KUNIT_TEST
 	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
-- 
2.44.0

