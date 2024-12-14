Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D009F1FC0
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 16:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386510E4A9;
	Sat, 14 Dec 2024 15:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FdEZY1BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977210E4A5
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 15:35:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso2916686e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734190550; x=1734795350; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KZPMimRDyOPmrHk2P3ntOObHSO5fF1Ty+Zfxp6w4+z4=;
 b=FdEZY1BJtkHylWXa9y2R6vDbSBRsvPGNtPBeSZftL/Soba84EMMSY6R9/k8cHZV+tk
 FS+KJYvFa+CgV+W1pJ1BL5/hW68cSjJEHcpklzf+WELJlWje0uMnhm3AyMhcDD9rLlxI
 NXIZ/KyToyJHVStmbArhRsPhmJufYbdvxi9uyY8qYVzp6NqH9UxxxNOCOuH3JT0rKzgN
 aNBnqfjesaLmvU8a/MKIvNu7Hzy2AF3YGwa8ZGrExF7827V2ALLx3j8X31BRZoqExlaI
 Qt6NyJ+YyQRSQhLlpIIo15eluBlPLISCrCwtXVLkWUz4UQA2RpYmbHrV+edqvHszmj20
 tmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734190550; x=1734795350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZPMimRDyOPmrHk2P3ntOObHSO5fF1Ty+Zfxp6w4+z4=;
 b=eJuJhjShOKgSYx9TnHz2kJ39MMIBrEyFCDYOp7l32ULyxfHzzaWnafwFbEfIOYQYEY
 9NoeFuqhn53UthcOUizk8d0hel8tUVk8/VvS/LLbZZHZkvBgdlrgdj/W9IW5qyDPt/Iv
 QZoiggAUAGd151Od8zOOS859bZb/ehYuiLasl5KeB8/8I+RxX1GoBLGM73IpsCM04qdU
 Ot5JpuE2S2FGWpJTlmYgf94hgW6ho0Ue3SKerVWUdE53O6gc9s/+hIT7UDow/Pl2xmXm
 vTUeRmHz00Qm1zSZQ2MlyVy3EdBJ4BWuVEjFvdyO9yLMfxqenbVEV6bPUtf7uZAo4a1L
 INxQ==
X-Gm-Message-State: AOJu0YwRPxqMCkHk8g/XbacWGan7C8i6VncDHvHGKVTtLWfjI4mLmLl3
 MvSn2Dl96KPY6BLWHdUxEWJo6E2crKnd244ylalL+M3nyk5Z+HKPFSLV0ZDiskQ=
X-Gm-Gg: ASbGncuwbx7uzfO7ETF+l2p8ICbIzVFBWZbnUydt8bzvz4x/dK7f5dhfz9A/OCOFDg5
 ZL9vIzWCF2txtWJg56iMn0DjGrnuEy4BzUhzbS5geYzlwejaecYRA9XHoeO+ATfC+r2BU7TecRg
 OnGEvLNJgG9KrlWM9bYfkxhtaxXemd0IVbM6iGYlLZIkx2Y+EixAGo0ETivG6+pFeos3X81YMGQ
 9P5xkTpYtxw09c+vGGJMOA9EfOucfGFxYAiQwdCCOQmhl42nWNlpIxeuZnJnI6G
X-Google-Smtp-Source: AGHT+IF4824okURcZ8IVtc3fuOUyKMzTtnxfMvIh8EwCwuYsWttCdeE0CtzcguYMExNjzfyDwjVYrA==
X-Received: by 2002:a05:6512:1388:b0:53e:38c3:5f7e with SMTP id
 2adb3069b0e04-54090595789mr1997987e87.45.1734190550096; 
 Sat, 14 Dec 2024 07:35:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1357csm249821e87.182.2024.12.14.07.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 07:35:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 17:35:44 +0200
Subject: [PATCH 1/2] drm/nouveau: incorporate I2C TV encoder drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-nouveau-encoder-slave-v1-1-beda767472e3@linaro.org>
References: <20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org>
In-Reply-To: <20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7526;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6ybU/ZryBFo9P9r00mNGI18e/mMgAW9p72+Pg5jFvU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXaXQfJfNKmGcRWBMaBaTs5fhcrn/7EEVSqTOh
 mWArJPEz5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12l0AAKCRCLPIo+Aiko
 1XcjB/4g21FLQVlpzajzWFU60jHrhYQ2Drihbj+Mr/CQq/mB8WLU874QL53oHKDEfI+k64lEob/
 kqpK8zQTkMZHriuXk1zYy7xEfoCKksXLPnUr+M8zpE4a5jn43ERIFVndwmWr+8DRF8oC7UnLdJc
 b8FSB4ac9CTmgsHq6QaX66cgStNGsq+vVus7P2cDkzNcNVI5hSIK7BvziWJyQWBjy9IA8nuaFok
 bB041vxZSDy0mY2lYWBSdNLExmLNi9yN/SZSom+PWKOAnWlsWQp7LHkffIF7J4nzrTHZfIc4lRI
 VCBqCaYBmh779C5XYkNEH/dIQxC/6rFdwgXyqzgfEWi+bMsq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Chrontel CH7006 and Silicon Image sil164 drivers use drm_encoder_slave
interface which is being used only by the nouveau driver. It doesn't
make sense to keep this interface inside the DRM subsystem. In
preparation to moving this set of helpers to the nouveau driver, move
the only two I2C driver that use that interface to the nouveau driver
too.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i2c/Kconfig                          | 18 ------------------
 drivers/gpu/drm/i2c/Makefile                         |  6 ------
 drivers/gpu/drm/nouveau/Kconfig                      | 20 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild              |  2 ++
 drivers/gpu/drm/nouveau/dispnv04/dfp.c               |  2 +-
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c  |  0
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c |  0
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h |  3 ++-
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c  |  3 ++-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c            |  2 +-
 .../gpu/drm/nouveau/include}/i2c/ch7006.h            |  0
 .../gpu/drm/nouveau/include}/i2c/sil164.h            |  0
 12 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..d5200f67958e68a8ec73401f1d3b79cbe0aa303d 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -2,24 +2,6 @@
 menu "I2C encoder or helper chips"
      depends on DRM && DRM_KMS_HELPER && I2C
 
-config DRM_I2C_CH7006
-	tristate "Chrontel ch7006 TV encoder"
-	default m if DRM_NOUVEAU
-	help
-	  Support for Chrontel ch7006 and similar TV encoders, found
-	  on some nVidia video cards.
-
-	  This driver is currently only useful if you're also using
-	  the nouveau driver.
-
-config DRM_I2C_SIL164
-	tristate "Silicon Image sil164 TMDS transmitter"
-	default m if DRM_NOUVEAU
-	help
-	  Support for sil164 and similar single-link (or dual-link
-	  when used in pairs) TMDS transmitters, used in some nVidia
-	  video cards.
-
 config DRM_I2C_NXP_TDA998X
 	tristate "NXP Semiconductors TDA998X HDMI encoder"
 	default m if DRM_TILCDC
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index a962f6f085686674ed33010345730db776815ebe..31fd35527d99d7eb23851d290175a3ff0c756772 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -1,10 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ch7006-y := ch7006_drv.o ch7006_mode.o
-obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
-
-sil164-y := sil164_drv.o
-obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
-
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index ce840300578d8a4011c448b61caf830cef3805bf..4cffac26f90ae6130ef30ba389b2a8c9b732058c 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -109,3 +109,23 @@ config DRM_NOUVEAU_GSP_DEFAULT
 	help
 	  Say Y here if you want to use the GSP codepaths by default on
 	  Turing and Ampere GPUs.
+
+config DRM_NOUVEAU_CH7006
+	tristate "Chrontel ch7006 TV encoder"
+	depends on DRM_NOUVEAU
+	default m
+	help
+	  Support for Chrontel ch7006 and similar TV encoders, found
+	  on some nVidia video cards.
+
+	  This driver is currently only useful if you're also using
+	  the nouveau driver.
+
+config DRM_NOUVEAU_SIL164
+	tristate "Silicon Image sil164 TMDS transmitter"
+	depends on DRM_NOUVEAU
+	default m
+	help
+	  Support for sil164 and similar single-link (or dual-link
+	  when used in pairs) TMDS transmitters, used in some nVidia
+	  video cards.
diff --git a/drivers/gpu/drm/nouveau/dispnv04/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
index 975c4e2269366d57e928eedbbbc669d24744379f..949802882ebd53c15e124c218a092af9693d36bc 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
@@ -10,3 +10,5 @@ nouveau-y += dispnv04/overlay.o
 nouveau-y += dispnv04/tvmodesnv17.o
 nouveau-y += dispnv04/tvnv04.o
 nouveau-y += dispnv04/tvnv17.o
+
+include $(src)/dispnv04/i2c/Kbuild
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 504c421aa176ef3d944592a0109cb72e21fd47b7..28a42ab5cb900ebe8a526e154f9e90598333356c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -35,7 +35,7 @@
 #include "hw.h"
 #include "nvreg.h"
 
-#include <drm/i2c/sil164.h>
+#include <i2c/sil164.h>
 
 #include <subdev/i2c.h>
 
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
similarity index 100%
rename from drivers/gpu/drm/i2c/ch7006_drv.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
diff --git a/drivers/gpu/drm/i2c/ch7006_mode.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
similarity index 100%
rename from drivers/gpu/drm/i2c/ch7006_mode.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
similarity index 99%
rename from drivers/gpu/drm/i2c/ch7006_priv.h
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
index 052bdc48a339df47073ab305f224f96c8630d66c..c66ca7f525034bb9fd113c5edf10c371a01c3c79 100644
--- a/drivers/gpu/drm/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
@@ -29,7 +29,8 @@
 
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/i2c/ch7006.h>
+
+#include <i2c/ch7006.h>
 
 typedef int64_t fixed;
 #define fixed1 (1LL << 32)
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
similarity index 99%
rename from drivers/gpu/drm/i2c/sil164_drv.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index ff23422727fce290a188e495d343e32bc2c373ec..74fc961c0d0de06f1fe8dd93d351452cd20cead7 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -30,7 +30,8 @@
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/i2c/sil164.h>
+
+#include <i2c/sil164.h>
 
 struct sil164_priv {
 	struct sil164_encoder_params config;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index d3014027a8122be499b85459b038fdcce5800720..67f3e0ac0e109b223ca8ec4ddc4e688247373b2e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -32,7 +32,7 @@
 #include "hw.h"
 #include <drm/drm_modeset_helper_vtables.h>
 
-#include <drm/i2c/ch7006.h>
+#include <i2c/ch7006.h>
 
 static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
 	{
diff --git a/include/drm/i2c/ch7006.h b/drivers/gpu/drm/nouveau/include/i2c/ch7006.h
similarity index 100%
rename from include/drm/i2c/ch7006.h
rename to drivers/gpu/drm/nouveau/include/i2c/ch7006.h
diff --git a/include/drm/i2c/sil164.h b/drivers/gpu/drm/nouveau/include/i2c/sil164.h
similarity index 100%
rename from include/drm/i2c/sil164.h
rename to drivers/gpu/drm/nouveau/include/i2c/sil164.h

-- 
2.39.5

