Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88E60E57A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1983895B9;
	Wed, 26 Oct 2022 16:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 676 seconds by postgrey-1.36 at gabe;
 Wed, 26 Oct 2022 16:31:00 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB572895B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:31:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29QGJabm072366;
 Wed, 26 Oct 2022 11:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1666801176;
 bh=l1vp561FteMlH3jxCuu+0T2ruGtkXDp3ftyq72WmFa0=;
 h=From:To:CC:Subject:Date;
 b=yv4SKmgmQvJdt3+cVpMnT7I4XAgBBVB/KBqY7vonS5QqQ8+VpvuvO3XOxyz+Xer9P
 LOJOT7nmmKBTm/AeA/RKhYvMozjO8d3QX7xPhV0ij3xjBJNsT7yyiZa62pbnXolOo/
 5J2Smva13rsDPcNONUkrFKjkx22how20CefP4aL0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29QGJajI015800
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Oct 2022 11:19:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 26
 Oct 2022 11:19:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 26 Oct 2022 11:19:35 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29QGJZX4021292;
 Wed, 26 Oct 2022 11:19:35 -0500
From: Andrew Davis <afd@ti.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Randy Dunlap
 <rdunlap@infradead.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm: Move radeon and amdgpu Kconfig options into their
 directories
Date: Wed, 26 Oct 2022 11:19:35 -0500
Message-ID: <20221026161935.6491-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Davis <afd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most Kconfig options to enable a driver are in the Kconfig file
inside the relevant directory, move these two to the same.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---

Changes from v2:
 - Rebased on latest

Changes from v1:
 - Fix whitespace issue pointed out by Randy

 drivers/gpu/drm/Kconfig            | 57 ------------------------------
 drivers/gpu/drm/amd/amdgpu/Kconfig | 29 +++++++++++++++
 drivers/gpu/drm/radeon/Kconfig     | 30 ++++++++++++++++
 3 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fa986075e8fb..9c2d9495cb3c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -233,65 +233,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
 
-config DRM_RADEON
-	tristate "ATI Radeon"
-	depends on DRM && PCI && MMU
-	depends on AGP || !AGP
-	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-        select DRM_KMS_HELPER
-        select DRM_TTM
-	select DRM_TTM_HELPER
-	select SND_HDA_COMPONENT if SND_HDA_CORE
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	# radeon depends on ACPI_VIDEO when ACPI is enabled, for select to work
-	# ACPI_VIDEO's dependencies must also be selected.
-	select INPUT if ACPI
-	select ACPI_VIDEO if ACPI
-	# On x86 ACPI_VIDEO also needs ACPI_WMI
-	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
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
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_KMS_HELPER
-	select DRM_SCHED
-	select DRM_TTM
-	select DRM_TTM_HELPER
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	select DRM_BUDDY
-	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
-	# ACPI_VIDEO's dependencies must also be selected.
-	select INPUT if ACPI
-	select ACPI_VIDEO if ACPI
-	# On x86 ACPI_VIDEO also needs ACPI_WMI
-	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
-	help
-	  Choose this option if you have a recent AMD Radeon graphics card.
-
-	  If M is selected, the module will be called amdgpu.
-
 source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 7777d55275de..5fcd510f1abb 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,4 +1,33 @@
 # SPDX-License-Identifier: MIT
+
+config DRM_AMDGPU
+	tristate "AMD GPU"
+	depends on DRM && PCI && MMU
+	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SCHED
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	select DRM_BUDDY
+	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
+	# ACPI_VIDEO's dependencies must also be selected.
+	select INPUT if ACPI
+	select ACPI_VIDEO if ACPI
+	# On x86 ACPI_VIDEO also needs ACPI_WMI
+	select X86_PLATFORM_DEVICES if ACPI && X86
+	select ACPI_WMI if ACPI && X86
+	help
+	  Choose this option if you have a recent AMD Radeon graphics card.
+
+	  If M is selected, the module will be called amdgpu.
+
 config DRM_AMDGPU_SI
 	bool "Enable amdgpu support for SI parts"
 	depends on DRM_AMDGPU
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 52819e7f1fca..2267c501f724 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -1,4 +1,34 @@
 # SPDX-License-Identifier: MIT
+
+config DRM_RADEON
+	tristate "ATI Radeon"
+	depends on DRM && PCI && MMU
+	depends on AGP || !AGP
+	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select SND_HDA_COMPONENT if SND_HDA_CORE
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	# radeon depends on ACPI_VIDEO when ACPI is enabled, for select to work
+	# ACPI_VIDEO's dependencies must also be selected.
+	select INPUT if ACPI
+	select ACPI_VIDEO if ACPI
+	# On x86 ACPI_VIDEO also needs ACPI_WMI
+	select X86_PLATFORM_DEVICES if ACPI && X86
+	select ACPI_WMI if ACPI && X86
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
2.37.3

