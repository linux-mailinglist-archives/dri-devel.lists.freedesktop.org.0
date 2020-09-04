Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC625DC19
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180F16EC2C;
	Fri,  4 Sep 2020 14:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57A6EC1D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so6308171wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4wzMb0717D0Q9qqW/DPit7cYamIg8OSI7Hu5q7RfZo8=;
 b=FbJaaiQ7gF3OOILrYql4OWAxx5r6WzzJ0bEz8ui5wTr7POFM3I4S2Z3RLucFz3kFrj
 eINu46+JLzmlS6kVecpwp6VfQ9lHYdZYsNAoYFE03FzBtcl911UB4ercXx9hm/OvCFA9
 0XLgs5o6ai8jhBo2q++kHPaihwMK4A9R0PXDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wzMb0717D0Q9qqW/DPit7cYamIg8OSI7Hu5q7RfZo8=;
 b=jS9ijRAkagbumJInN6L5x6Ax/v8oZM8o045GoCRFeaJ1jSEezDSbb0x3ucsfYul5ho
 lPvEU0uA/hyg8XzMc9ZioDAnBOjoHrod14hmKqwE33rwS/qipYYd8UZolUkup1wd8cDk
 ZZPUSnl4rqC9GSUwAUM92X9j7wyI8P3u1gTAYud6fGXmhFIt9KkspJPAaM2UIAtGvx6z
 js8oFwxMSdR1M9Ie8J8jdSIu7JwgFYk574+t3nDbmiGssdgSlBdS/3gH/O+UoQu6VZSG
 XJcXiHh6cfkfvNtVLCQo/oxbaqosJxPk55/oryLSTE/VbWLkMud6u2nvXswmsCLnK89g
 B2jw==
X-Gm-Message-State: AOAM5325kV+ZHlvcjI2EtnRwZaLX2GcB54tOFq1lP+HjKSGA2uAWRhhq
 6xkKpy65fpuvy9/Pp8kS8sRT/BXHDwweV3KH
X-Google-Smtp-Source: ABdhPJxrexo6CnLaDXDfaheFkMuCx54WrgSVj5/OsVFjIrOt86j/0JdHt4UbysbIj9V4GI6SwP2YRA==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr8295080wmm.102.1599230416283; 
 Fri, 04 Sep 2020 07:40:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/24] drm/arc: Move to drm/tiny
Date: Fri,  4 Sep 2020 16:39:41 +0200
Message-Id: <20200904143941.110665-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
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
index f92035bfbbcd..b16e80c4d669 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1334,7 +1334,7 @@ ARC PGU DRM DRIVER
 M:	Alexey Brodkin <abrodkin@synopsys.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
-F:	drivers/gpu/drm/arc/
+F:	drivers/gpu/drm/tiny/arcpgu.c
 
 ARCNET NETWORK LAYER
 M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b9674e..9efb82caaa87 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -354,8 +354,6 @@ source "drivers/gpu/drm/vc4/Kconfig"
 
 source "drivers/gpu/drm/etnaviv/Kconfig"
 
-source "drivers/gpu/drm/arc/Kconfig"
-
 source "drivers/gpu/drm/hisilicon/Kconfig"
 
 source "drivers/gpu/drm/mediatek/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2f31579f91d4..6c15ef9b04d6 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -109,7 +109,6 @@ obj-y			+= panel/
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
