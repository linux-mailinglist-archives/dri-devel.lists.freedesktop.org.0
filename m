Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6462F2A42
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914E6E151;
	Tue, 12 Jan 2021 08:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1A56E140
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d13so1507745wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmmsbGkaB6zq+1LZSq6n8dOr5YNFbvWrXSRh1IwGpQU=;
 b=R5rXvbAqsEiU9Cp1lAo4XLMoja3x2jCFMqAk9hN1hbYssErZlrP1GJ3oy+9w8Mur6o
 N7NFdoYkBj2GR+SmDhxQkG2VG8rt9vwVaJMWvl261SVxSMJLU7w3wC650n39d02rihgI
 8qktF+CFFb+iXdtftF9fialL5FoAZGTdLBWOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmmsbGkaB6zq+1LZSq6n8dOr5YNFbvWrXSRh1IwGpQU=;
 b=lQHZ46DWclrui4hD5nprtoct5M0mqkx4y87ihdFUFBWSk8eavTczFFW8cszYzehul4
 3p1bIEufngZk7nVdtwMdy/vGAP8ZGy8YizyTKlvgG5ivo59RGgAF8jSYPdzwz5mf1uBw
 GvrCR0xvLabK2/p5YrgwCzCPtthU49hKqpl91j+BGq0zKHRAkZ5VpLEJja0idJV5m4xQ
 jIyZQyqOLOnSBFbGws3fAcGTHCnYbUmc5PxRccAs7y74DiJd2HLxuNibrDDoIwH7sM5A
 bCjfZ9b5alWIvIm71nBeKOe6+x28jEfJH/7fkpeuObgsBW3JKIvzaCLvIxihnx0O1S+S
 jP3A==
X-Gm-Message-State: AOAM533qTA7LacUnrJ8EZq1BbzyG/HSiFP/nFq4aBiZ8xs2NvffWNJ2Q
 npY5yhylCcDtQZcZXj0GIxiGvFM+4/CF17Lx
X-Google-Smtp-Source: ABdhPJz7obIH6Qe3d0LnEUDNyPMwr0BqWxIn5VRn69h64pk1CP7TInJUSETA+G7lROBOMByXvAExjg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr3041556wrv.397.1610441061503; 
 Tue, 12 Jan 2021 00:44:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/15] drm/arc: Move to drm/tiny
Date: Tue, 12 Jan 2021 09:43:58 +0100
Message-Id: <20210112084358.2771527-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because it is.

v2: Delete now unused crtc funcs (0day)

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 MAINTAINERS                                         |  2 +-
 drivers/gpu/drm/Kconfig                             |  2 --
 drivers/gpu/drm/Makefile                            |  1 -
 drivers/gpu/drm/arc/Kconfig                         | 10 ----------
 drivers/gpu/drm/arc/Makefile                        |  3 ---
 drivers/gpu/drm/tiny/Kconfig                        | 10 ++++++++++
 drivers/gpu/drm/tiny/Makefile                       |  1 +
 drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} |  0
 8 files changed, 12 insertions(+), 17 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/Kconfig
 delete mode 100644 drivers/gpu/drm/arc/Makefile
 rename drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17b92e6a0f06..9330902cc9e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1307,7 +1307,7 @@ ARC PGU DRM DRIVER
 M:	Alexey Brodkin <abrodkin@synopsys.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
-F:	drivers/gpu/drm/arc/
+F:	drivers/gpu/drm/tiny/arcpgu.c
 
 ARCNET NETWORK LAYER
 M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0973f408d75f..041af75ee6fa 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -352,8 +352,6 @@ source "drivers/gpu/drm/vc4/Kconfig"
 
 source "drivers/gpu/drm/etnaviv/Kconfig"
 
-source "drivers/gpu/drm/arc/Kconfig"
-
 source "drivers/gpu/drm/hisilicon/Kconfig"
 
 source "drivers/gpu/drm/mediatek/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index fefaff4c832d..4e4937609269 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -110,7 +110,6 @@ obj-y			+= panel/
 obj-y			+= bridge/
 obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
 obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
-obj-$(CONFIG_DRM_ARCPGU)+= arc/
 obj-y			+= hisilicon/
 obj-$(CONFIG_DRM_ZTE)	+= zte/
 obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
deleted file mode 100644
index e8f3d63e0b91..000000000000
--- a/drivers/gpu/drm/arc/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config DRM_ARCPGU
-	tristate "ARC PGU"
-	depends on DRM && OF
-	select DRM_KMS_CMA_HELPER
-	select DRM_KMS_HELPER
-	help
-	  Choose this option if you have an ARC PGU controller.
-
-	  If M is selected the module will be called arcpgu.
diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
deleted file mode 100644
index b26f2495c532..000000000000
--- a/drivers/gpu/drm/arc/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-arcpgu-y := arcpgu_drv.o
-obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 2b6414f0fa75..9bbaa1a69050 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config DRM_ARCPGU
+	tristate "ARC PGU"
+	depends on DRM && OF
+	select DRM_KMS_CMA_HELPER
+	select DRM_KMS_HELPER
+	help
+	  Choose this option if you have an ARC PGU controller.
+
+	  If M is selected the module will be called arcpgu.
+
 config DRM_CIRRUS_QEMU
 	tristate "Cirrus driver for QEMU emulated device"
 	depends on DRM && PCI && MMU
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 6ae4e9e5a35f..bef6780bdd6f 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/tiny/arcpgu.c
similarity index 100%
rename from drivers/gpu/drm/arc/arcpgu_drv.c
rename to drivers/gpu/drm/tiny/arcpgu.c
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
