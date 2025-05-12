Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34479AB305A
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50B910E2E7;
	Mon, 12 May 2025 07:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cxJdMY+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BEC10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:15:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54fcd7186dfso2120397e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747034121; x=1747638921; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5H9PCtqs7pSwDmGWl4jj80wvSQsw1NuyFxzjhTKO1TQ=;
 b=cxJdMY+YjCmbP9i78DzurIrvKaadYImQazb/OJKSIhaiDzhN9BsFwKxBzOc8Ma7BQW
 E6Sjx/KKWTZcpedpZm9m6tQigpzgvLl6GAN8ETEtexA0WCHkQEvqX0oy2eaCsGEwG3ex
 QM6rNNm7DJ75pIBmXxBEm7S50GCvTXRmihR0LG6cPQGT/l1nx2pCNm2lyOWSOxDwLV6q
 gQa7Z6k0qEaOYX9M9tVL9RvnbTZ9Ulb7JiKYJ+TAiC/0YRwAu3ea5HVzOdKzZcjZ5aWH
 sDw+ON15UFXZ+9uM9Y2qwEmTeRyjWxkQx5GYInvz8+w4z0/hIySXRoL58Pc23L5f0ByM
 o2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747034121; x=1747638921;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5H9PCtqs7pSwDmGWl4jj80wvSQsw1NuyFxzjhTKO1TQ=;
 b=n3ptKJYzcH2JroHr+41wBHMa9FrMbfi0okBQ5K1obcfyqNo4LC+fU4aq8qYTX/P+/l
 ydb2jUIklIHdNH4UTKD0EgpzwYWHvTc5H67PudlPQyqnFzaKbMXyO9SezCT+NcTZ1+Ef
 Qv9D3X2tOw6hoUmjTwXLvJ0ydkaThThdNyqy9Hkh9fsbIfGnYBupIAahH+bvmHh2lhm0
 5xn3kmxUo9gCis//+UaKtLc16dBrMAc+rAq8hV1Vrg3ViXE/b5Zq3wOv1ymsbOtzRBLQ
 JyG/1rUWvPVQ00x3KcPKcSaZNoziGLUQtUciIWQcEPAPUzA4WOJ1ogVrP/spqt+e56Ap
 KArg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq98Antm8xyX7GG35Gm84noXPAd5e01XUlCcCNGRMTfBAoRcAlObfMP3+KZhARr1JmSCw5LPkWOSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYCF/w/08iEW4CdHjleD9vlvUFv0oprLmEzfw/NvaOb00kHQOt
 Q/SnC5fk805AZE7trA9T4kIImrtMM5mOw5TcsySbOqUItqP3ZSd4
X-Gm-Gg: ASbGncsBiRJ0bHuVw+T8jVjWA5SoySVn1Jh6/d7f9j7Ji9FGApam5HlWyfzQhgdkQGk
 4D04FhX6GhG9XN5AlrXvfe/dvU3k8BLw+LZbg9L2msUeD1MuAALLK2V2je9QrdOyiYBZZVNzhyK
 GEU71B1RNq4tc6LkJ9y5Xw/o7oLLFrv07bI1zJn7N/oN6HoBhRj6ba+Nj1CGz0aDKW2nPky6hlj
 tOOSNAOkSvOggHGimsnkedI9QSATCQ5i3mBetGWJGw9AQzd9M5Cv+voS8ReSpfDRS8tGKV1upBY
 +paRyRbQk6r4k0+VilBXGF4z5Zndh/yjBEus5DSg3IPPMEtd7e0cyvl+jLOxf/RjYAuY+zeZqVE
 +L/fo54v8IlgIwzOtEsO94ZCzAX7m8Q==
X-Google-Smtp-Source: AGHT+IG+WfSzwR+gxVxkYn9gVEsLYQ2zWFzk7qexVsbsxDALFIaD/vho/tC0vyTT9oNARLGDzXu0mg==
X-Received: by 2002:a05:6512:608b:b0:54e:8183:eaa9 with SMTP id
 2adb3069b0e04-54fc67cdd05mr3918959e87.34.1747034120277; 
 Mon, 12 May 2025 00:15:20 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6bbesm1387855e87.154.2025.05.12.00.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 00:15:19 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 12 May 2025 09:15:11 +0200
Subject: [PATCH v3] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sitronix-v3-1-bbf6cc413698@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP+fIWgC/02MQQ6DIBQFr2JYlwYQKHbVezRdIH71J1UaMMTGe
 PeiSaPLeXkzC4kQECK5FwsJkDCiHzOUl4K43o4dUGwyE8GEYlJIGnEKfsSZCsdbbWqpjdYk3z8
 BWpz31POVucc4+fDdy4lv6z9ijkjilFMJN+eYNbxS9tENFt9X5weyRZI4RMXKkyiyqKCtoTGVr
 kGcxXVdf1qSZ4XZAAAA
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8836;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CLiO9Ve9S1ULV4vc7KBrQ1Gf/SwPIYYIBNr0FjAg8Ao=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoIaABrsM0FLYZaAi/kxfN8HubO9rwZDzwWliBS
 FQSg+zWiIyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaCGgAQAKCRCIgE5vWV1S
 MkSHEACi9k7ra8wTUc51s36KTU9R1I8o3qon8bN+i/KqFEzo8OQmVcxNe9nvQOEctv7AL1fJSgc
 xl0qcTrzFnxKPpDoAyjqoqMG0g7gWpuo57xfJwH2ZdkwwFrmO1CjbS+gs2tHUapOHcgfm+w7rMY
 IGVJCWrsWEJmkfM2QwuCWR5iWahwdgFZt2cTnZ5Snn1uvW76PmwurM5XcP5Nwd7DoX3Y9oZKiJk
 erTdAh77gKrwZUJnNWVZikzfN9k+uRtpJlFRjnkebklMNUMpab+pBGrRBsYW8FoAXiwld9AwI9k
 NOwgBncwq3xGCYoErl2L6nqST+LqYL+8w5kOvBQJ//t+TBkNDcv3mbPb2hAmvPnIqa4HpOBlmXK
 DZaqJRNxzxT0qQ+hexPMFI3vkUKY04svXxjb6FBX79K9qljl7/M1djablF1s9VKQVMo3dP5+Ve5
 Awu5wf4ExrFSiPDmqfsKZOpXYiOgDQnWTH48sdO9hOcGqzCe2OjoVPhOgVYdcsoiPQc67r67HHF
 8CDeHAtZqlRRtz9E7h2Ec9G8ZIMOt6DqXleHf0ewLOHZDeLW087gbMht7GnVFB3sUPR4QlPnbj+
 CH6SOTHhcuOsgrHH3Kq5VqRZoReWU6i0EYsGSbNQr+RB9u1ShgixUZPsEAGmdCm6ZvfpdpOTd6T
 25Y6JbiZ1xs54XQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

We start to have support many Sitronix displays in the tiny directory,
and we expect more to come.

Move them to their own subdirectory.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Keep old Kconfig symbols and let the new one defaults to it
- Link to v2: https://lore.kernel.org/r/20250503-sitronix-v2-1-5efbed896be2@gmail.com

Changes in v2:
- Rebase on drm-misc-next
- Link to v1: https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com
---
 MAINTAINERS                                     |  6 +--
 drivers/gpu/drm/Kconfig                         |  2 +
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 41 --------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 60 insertions(+), 47 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81b81cc68ca2482f2965b801693ff8a43bbf2053..6b2d3d4c467b8b360317437027e20c4014c97a21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7680,13 +7680,13 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
-F:	drivers/gpu/drm/tiny/st7586.c
+F:	drivers/gpu/drm/sitronix/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7571 PANELS
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
-F:	drivers/gpu/drm/tiny/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-i2c.c
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
@@ -7707,7 +7707,7 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
-F:	drivers/gpu/drm/tiny/st7735r.c
+F:	drivers/gpu/drm/sitronix/st7735r.c
 
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3921772ae61214e6ac0337edc147a46af0010070..cc7385c334eb6ad484688d9eb483c2c6a9c39e11 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -385,6 +385,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
 
 source "drivers/gpu/drm/gud/Kconfig"
 
+source "drivers/gpu/drm/sitronix/Kconfig"
+
 source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b5d5561bbe5fd72f3915e6a52f325fdb79c7981e..70510620f29c874e376c795fb05d426a0faae05c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -221,6 +221,7 @@ obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
+obj-y			+= sitronix/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..c069d0d417753bcf62343bd2456b5b98d60b730b
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,51 @@
+config DRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C && MMU
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  DRM driver for Sitronix ST7571 panels controlled over I2C.
+
+	  if M is selected the module will be called st7571-i2c.
+
+config TINYDRM_ST7586
+	tristate
+	default n
+
+config DRM_ST7586
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	default TINYDRM_ST7586
+	help
+	  DRM driver for the following Sitronix ST7586 panels:
+	  * LEGO MINDSTORMS EV3
+
+	  If M is selected the module will be called st7586.
+
+config TINYDRM_ST7735R
+	tristate
+	default n
+
+config DRM_ST7735R
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	default TINYDRM_ST7735R
+	help
+	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
+	  LCDs:
+	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
+	  * Okaya RH128128T 1.44" 128x128 TFT
+
+	  If M is selected the module will be called st7735r.
+
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..bd139e5a6995fa026cc635b3c29782473d1efad7
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7586)		+= st7586.o
+obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7571-i2c.c
rename to drivers/gpu/drm/sitronix/st7571-i2c.c
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7586.c
rename to drivers/gpu/drm/sitronix/st7586.c
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7735r.c
rename to drivers/gpu/drm/sitronix/st7735r.c
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index daa1adbb1b43325d644ae13f3cabfc1bb01ff4d8..6d1b3e2cb3fbd8630864824ae985897b9d8095c7 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -199,44 +199,3 @@ config TINYDRM_SHARP_MEMORY
 	  * 4.40" Sharp Memory LCD (LS044Q7DH01)
 
 	  If M is selected the module will be called sharp_memory.
-
-config TINYDRM_ST7586
-	tristate "DRM support for Sitronix ST7586 display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	help
-	  DRM driver for the following Sitronix ST7586 panels:
-	  * LEGO MINDSTORMS EV3
-
-	  If M is selected the module will be called st7586.
-
-config DRM_ST7571_I2C
-	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
-	depends on DRM && I2C && MMU
-	select DRM_CLIENT_SELECTION
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	select REGMAP_I2C
-	help
-	  DRM driver for Sitronix ST7571 panels controlled over I2C.
-
-	  if M is selected the module will be called st7571-i2c.
-
-config TINYDRM_ST7735R
-	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
-	help
-	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
-	  LCDs:
-	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
-	  * Okaya RH128128T 1.44" 128x128 TFT
-
-	  If M is selected the module will be called st7735r.
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0151590db5cbd80aebde0629afd03f47b83c3045..4a9ff61ec25420e2c0a648c04eaab7ca25dd5407 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -6,7 +6,6 @@ obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
-obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
@@ -15,5 +14,3 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
-obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
-obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o

---
base-commit: e782ac936941cff4c5580bb5cc2ec0e91468068c
change-id: 20250424-sitronix-2c1f68b46866

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

