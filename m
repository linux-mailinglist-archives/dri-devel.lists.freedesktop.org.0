Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE212237B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6EC6ED82;
	Fri, 17 Jul 2020 09:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5C6ED74
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so10108628wrj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MKH1tJ9qSuHfCI8dt54bEoTHWg3poixNtCDKdvH1gQ=;
 b=XxFKPRx8LfXHA16pus5atxoDUpZPcUkKZ2LoWPgKri23uU3qI4XyE5Zc+dmIA0ZzYo
 QPEf1pRk2Vqt1IOKUbnWbuGDoDjLoGkSW8k3YpdGnM30MpUGA1x4q150kzEejsAzhQ7K
 fe8WYU4Ru4lvfApxCMefZTn8aIjI2dMpGmWqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MKH1tJ9qSuHfCI8dt54bEoTHWg3poixNtCDKdvH1gQ=;
 b=Or+9crsvsJpLL6AsqVA9ZUuVX51vUb8/qXYagfOuuvHeiAuekE1lAh70/dB4sGpH9m
 ZSsburdVMUZDomdqY1TO7I6MV368lw4lMr4EvsGZChFggS4PpR0H2sVVmPmKHZXWN/bs
 3O8UZhrflgVT6GoAw7v2y6n7xDa8PNa3o6v96HSywCU+ech3+V8QW0dZagOnsLD8ZSoy
 7djcM1GGLAAS8YLPyUkouj5Jz3zwGrwJHS//sekYfYUxEMfZrJm1RZCfNaeiLawAL10L
 j5I2a8ULSQTbxjVRaF9SbdgzjcDy3jW7P7js43kw4kzxsfxaQjNrZJDDPMc0IAKH5Byw
 kiZA==
X-Gm-Message-State: AOAM531mbLFn6A7lQFTsRAY20SqfzfePjqtKvEfEBrvSg6R78PmfyY8h
 kZU+eA7Nd9oTkWV6X+iSTLd9a6ulGkU=
X-Google-Smtp-Source: ABdhPJy87J04mCCJi3dPYXNTmym8RxU7SrkWeIvYHdcll3PmRtppmZAv5T80hzZacVjuiBt+YxLiWg==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr9123202wrt.274.1594976691380; 
 Fri, 17 Jul 2020 02:04:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/18] drm/arc: Move to drm/tiny
Date: Fri, 17 Jul 2020 11:04:29 +0200
Message-Id: <20200717090430.1146256-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because it is.

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
index 415954a98934..0ed6c36004e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1322,7 +1322,7 @@ ARC PGU DRM DRIVER
 M:	Alexey Brodkin <abrodkin@synopsys.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
-F:	drivers/gpu/drm/arc/
+F:	drivers/gpu/drm/tiny/arcpgu.c
 
 ARCNET NETWORK LAYER
 M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c4fd57d8b717..d44c6eac2c58 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -354,8 +354,6 @@ source "drivers/gpu/drm/vc4/Kconfig"
 
 source "drivers/gpu/drm/etnaviv/Kconfig"
 
-source "drivers/gpu/drm/arc/Kconfig"
-
 source "drivers/gpu/drm/hisilicon/Kconfig"
 
 source "drivers/gpu/drm/mediatek/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c0e5a7e5953..e69eafbf9e39 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
