Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7212D197
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 16:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A16689DC7;
	Mon, 30 Dec 2019 15:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2926D89DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 15:54:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUFslYT107724;
 Mon, 30 Dec 2019 09:54:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1577721287;
 bh=717YTbPxt9H6OLOqeAdytOQWGa7WnNOXnJX7AvQNYc0=;
 h=From:To:CC:Subject:Date;
 b=epJvuCq4AhWIKClnhqjqahRxF6Nl+jO/ft3fjmVY8Zta+yPzB1+Qom7zjDh7x6C8M
 dxWnA/BxMYcchHx9MBx34fuDKdvNoNp/qvuE2m5KBqg0edKxuhgfdYloTuT3mCKWab
 FnYk8voaE0zOhsb6/o1ZJfYHPeOUXkWV4EjPOYjc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUFslDp031569;
 Mon, 30 Dec 2019 09:54:47 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 09:54:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 09:54:47 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUFsldo090087;
 Mon, 30 Dec 2019 09:54:47 -0600
Received: from localhost ([10.250.65.50])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBUFsku26998; 
 Mon, 30 Dec 2019 09:54:46 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: Move radeon and amdgpu Kconfig options into their
 directories
Date: Mon, 30 Dec 2019 10:54:46 -0500
Message-ID: <20191230155446.11345-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Andrew
 F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most Kconfig options to enable a driver are in the Kconfig file
inside the relevant directory, move these two to the same.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---

Changes from v1:
 - Rebased

 drivers/gpu/drm/Kconfig            | 34 ------------------------------
 drivers/gpu/drm/amd/amdgpu/Kconfig | 18 ++++++++++++++++
 drivers/gpu/drm/radeon/Kconfig     | 18 ++++++++++++++++
 3 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index bfdadc3667e0..714ae842b7ce 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -231,42 +231,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
 
-config DRM_RADEON
-	tristate "ATI Radeon"
-	depends on DRM && PCI && MMU
-	select FW_LOADER
-        select DRM_KMS_HELPER
-        select DRM_TTM
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	help
-	  Choose this option if you have an ATI Radeon graphics card.  There
-	  are both PCI and AGP versions.  You don't need to choose this to
-	  run the Radeon in plain VGA mode.
-
-	  If M is selected, the module will be called radeon.
-
 source "drivers/gpu/drm/radeon/Kconfig"
 
-config DRM_AMDGPU
-	tristate "AMD GPU"
-	depends on DRM && PCI && MMU
-	select FW_LOADER
-	select DRM_KMS_HELPER
-	select DRM_SCHED
-	select DRM_TTM
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	select CHASH
-	help
-	  Choose this option if you have a recent AMD Radeon graphics card.
-
-	  If M is selected, the module will be called amdgpu.
-
 source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 9375e7f12420..f6100cb193fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,4 +1,22 @@
 # SPDX-License-Identifier: MIT
+
+config DRM_AMDGPU
+	tristate "AMD GPU"
+	depends on DRM && PCI && MMU
+	select FW_LOADER
+	select DRM_KMS_HELPER
+	select DRM_SCHED
+	select DRM_TTM
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	select CHASH
+	help
+	  Choose this option if you have a recent AMD Radeon graphics card.
+
+	  If M is selected, the module will be called amdgpu.
+
 config DRM_AMDGPU_SI
 	bool "Enable amdgpu support for SI parts"
 	depends on DRM_AMDGPU
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 6f60f4840cc5..ba67b879d31d 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -1,4 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_RADEON
+	tristate "ATI Radeon"
+	depends on DRM && PCI && MMU
+	select FW_LOADER
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	help
+	  Choose this option if you have an ATI Radeon graphics card.  There
+	  are both PCI and AGP versions.  You don't need to choose this to
+	  run the Radeon in plain VGA mode.
+
+	  If M is selected, the module will be called radeon.
+
 config DRM_RADEON_USERPTR
 	bool "Always enable userptr support"
 	depends on DRM_RADEON
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
