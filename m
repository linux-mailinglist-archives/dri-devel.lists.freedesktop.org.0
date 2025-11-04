Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F65C307E8
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609E10E5B0;
	Tue,  4 Nov 2025 10:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnM1+Dvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB3E10E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251961; x=1793787961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3sShh53fYrSd4j62s8HuQPC8Xg7lkpvQY4CqIMvbLM0=;
 b=FnM1+Dvg6XLf6fA1oETaWeO/ERlmCvJFZZRV3lmQfdEWoWNRRtZNmPXf
 bA6pHq20EDhG4Yl127Ue7M2lojLe63T0MASsUtKg1CV4TvF1dzfR/7dYq
 KfpG0LjTtXiOHxecPvGd54pCSD02Y4TJzdCrC4J0gu0pZ7VWOVqu1VWGN
 EZAO84GdLsGiX8hFg64nSn0LsrJ+OzIiaeITcKvQrvSCRM2xoBYPW2DEc
 e7lZSzYLKQjw5H4N9yqSS0VFQo/nHPhveRi0RXlx+ZujMg16fi5ugmShh
 mOxVf/59BFBfCHpPTy2OrgMLIP7t3mzaHukznQgYwriMndiKe+2GsGuQI Q==;
X-CSE-ConnectionGUID: aImSlS1hTIKfX3vapmTTOw==
X-CSE-MsgGUID: i+FPUx/ISbudUZ+PHh2GHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="66955767"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="66955767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:26:00 -0800
X-CSE-ConnectionGUID: IMOPaWJMSUu43LUXKAqIsQ==
X-CSE-MsgGUID: PSDGeIPIQkSbdGYi2LSj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186979553"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/4] drm/Kconfig: sort driver Kconfig source list
Date: Tue,  4 Nov 2025 12:25:38 +0200
Message-ID: <4fa11ab0b938d5c726b6ad78d28c7527b830f696.1762251845.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762251845.git.jani.nikula@intel.com>
References: <cover.1762251845.git.jani.nikula@intel.com>
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

Sort the driver Kconfig source list, and remove the superfluous blank
lines in between.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: 'git show --color-moved' on the commit is the easiest way to
review.
---
 drivers/gpu/drm/Kconfig | 162 +++++++++++++---------------------------
 1 file changed, 50 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5a9b5f7a40e2..a33b90251530 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -277,133 +277,71 @@ config DRM_PRIVACY_SCREEN
 	bool
 	default n
 
-source "drivers/gpu/drm/sysfb/Kconfig"
-
-source "drivers/gpu/drm/arm/Kconfig"
-
-source "drivers/gpu/drm/radeon/Kconfig"
-
+# DRM driver Kconfig files, sorted
+source "drivers/gpu/drm/adp/Kconfig"
 source "drivers/gpu/drm/amd/amdgpu/Kconfig"
-
-source "drivers/gpu/drm/nouveau/Kconfig"
-
-source "drivers/gpu/drm/nova/Kconfig"
-
-source "drivers/gpu/drm/i915/Kconfig"
-
-source "drivers/gpu/drm/xe/Kconfig"
-
-source "drivers/gpu/drm/kmb/Kconfig"
-
-source "drivers/gpu/drm/vgem/Kconfig"
-
-source "drivers/gpu/drm/vkms/Kconfig"
-
-source "drivers/gpu/drm/exynos/Kconfig"
-
-source "drivers/gpu/drm/rockchip/Kconfig"
-
-source "drivers/gpu/drm/vmwgfx/Kconfig"
-
-source "drivers/gpu/drm/gma500/Kconfig"
-
-source "drivers/gpu/drm/udl/Kconfig"
-
-source "drivers/gpu/drm/ast/Kconfig"
-
-source "drivers/gpu/drm/mgag200/Kconfig"
-
+source "drivers/gpu/drm/arm/Kconfig"
 source "drivers/gpu/drm/armada/Kconfig"
-
+source "drivers/gpu/drm/aspeed/Kconfig"
+source "drivers/gpu/drm/ast/Kconfig"
 source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
-
-source "drivers/gpu/drm/renesas/Kconfig"
-
-source "drivers/gpu/drm/sun4i/Kconfig"
-
-source "drivers/gpu/drm/omapdrm/Kconfig"
-
-source "drivers/gpu/drm/tilcdc/Kconfig"
-
-source "drivers/gpu/drm/qxl/Kconfig"
-
-source "drivers/gpu/drm/virtio/Kconfig"
-
-source "drivers/gpu/drm/msm/Kconfig"
-
-source "drivers/gpu/drm/fsl-dcu/Kconfig"
-
-source "drivers/gpu/drm/tegra/Kconfig"
-
-source "drivers/gpu/drm/stm/Kconfig"
-
-source "drivers/gpu/drm/panel/Kconfig"
-
 source "drivers/gpu/drm/bridge/Kconfig"
-
-source "drivers/gpu/drm/sti/Kconfig"
-
-source "drivers/gpu/drm/imx/Kconfig"
-
-source "drivers/gpu/drm/ingenic/Kconfig"
-
-source "drivers/gpu/drm/v3d/Kconfig"
-
-source "drivers/gpu/drm/vc4/Kconfig"
-
-source "drivers/gpu/drm/loongson/Kconfig"
-
 source "drivers/gpu/drm/etnaviv/Kconfig"
-
+source "drivers/gpu/drm/exynos/Kconfig"
+source "drivers/gpu/drm/fsl-dcu/Kconfig"
+source "drivers/gpu/drm/gma500/Kconfig"
+source "drivers/gpu/drm/gud/Kconfig"
 source "drivers/gpu/drm/hisilicon/Kconfig"
-
+source "drivers/gpu/drm/hyperv/Kconfig"
+source "drivers/gpu/drm/i915/Kconfig"
+source "drivers/gpu/drm/imagination/Kconfig"
+source "drivers/gpu/drm/imx/Kconfig"
+source "drivers/gpu/drm/ingenic/Kconfig"
+source "drivers/gpu/drm/kmb/Kconfig"
+source "drivers/gpu/drm/lima/Kconfig"
 source "drivers/gpu/drm/logicvc/Kconfig"
-
+source "drivers/gpu/drm/loongson/Kconfig"
+source "drivers/gpu/drm/mcde/Kconfig"
 source "drivers/gpu/drm/mediatek/Kconfig"
-
-source "drivers/gpu/drm/mxsfb/Kconfig"
-
 source "drivers/gpu/drm/meson/Kconfig"
-
-source "drivers/gpu/drm/tiny/Kconfig"
-
-source "drivers/gpu/drm/pl111/Kconfig"
-
-source "drivers/gpu/drm/tve200/Kconfig"
-
-source "drivers/gpu/drm/xen/Kconfig"
-
-source "drivers/gpu/drm/vboxvideo/Kconfig"
-
-source "drivers/gpu/drm/lima/Kconfig"
-
+source "drivers/gpu/drm/mgag200/Kconfig"
+source "drivers/gpu/drm/msm/Kconfig"
+source "drivers/gpu/drm/mxsfb/Kconfig"
+source "drivers/gpu/drm/nouveau/Kconfig"
+source "drivers/gpu/drm/nova/Kconfig"
+source "drivers/gpu/drm/omapdrm/Kconfig"
+source "drivers/gpu/drm/panel/Kconfig"
 source "drivers/gpu/drm/panfrost/Kconfig"
-
 source "drivers/gpu/drm/panthor/Kconfig"
-
-source "drivers/gpu/drm/aspeed/Kconfig"
-
-source "drivers/gpu/drm/mcde/Kconfig"
-
-source "drivers/gpu/drm/tidss/Kconfig"
-
-source "drivers/gpu/drm/adp/Kconfig"
-
-source "drivers/gpu/drm/xlnx/Kconfig"
-
-source "drivers/gpu/drm/gud/Kconfig"
-
+source "drivers/gpu/drm/pl111/Kconfig"
+source "drivers/gpu/drm/qxl/Kconfig"
+source "drivers/gpu/drm/radeon/Kconfig"
+source "drivers/gpu/drm/renesas/Kconfig"
+source "drivers/gpu/drm/rockchip/Kconfig"
 source "drivers/gpu/drm/sitronix/Kconfig"
-
 source "drivers/gpu/drm/solomon/Kconfig"
-
 source "drivers/gpu/drm/sprd/Kconfig"
-
-source "drivers/gpu/drm/imagination/Kconfig"
-
+source "drivers/gpu/drm/sti/Kconfig"
+source "drivers/gpu/drm/stm/Kconfig"
+source "drivers/gpu/drm/sun4i/Kconfig"
+source "drivers/gpu/drm/sysfb/Kconfig"
+source "drivers/gpu/drm/tegra/Kconfig"
+source "drivers/gpu/drm/tidss/Kconfig"
+source "drivers/gpu/drm/tilcdc/Kconfig"
+source "drivers/gpu/drm/tiny/Kconfig"
+source "drivers/gpu/drm/tve200/Kconfig"
 source "drivers/gpu/drm/tyr/Kconfig"
-
-source "drivers/gpu/drm/hyperv/Kconfig"
+source "drivers/gpu/drm/udl/Kconfig"
+source "drivers/gpu/drm/v3d/Kconfig"
+source "drivers/gpu/drm/vboxvideo/Kconfig"
+source "drivers/gpu/drm/vc4/Kconfig"
+source "drivers/gpu/drm/vgem/Kconfig"
+source "drivers/gpu/drm/virtio/Kconfig"
+source "drivers/gpu/drm/vkms/Kconfig"
+source "drivers/gpu/drm/vmwgfx/Kconfig"
+source "drivers/gpu/drm/xe/Kconfig"
+source "drivers/gpu/drm/xen/Kconfig"
+source "drivers/gpu/drm/xlnx/Kconfig"
 
 endif
 
-- 
2.47.3

