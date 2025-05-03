Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B24AA7F60
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 10:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6810E074;
	Sat,  3 May 2025 08:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cbqeKAIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BBC10E074
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 08:13:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso3705924e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746260030; x=1746864830; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8sWrBJj6gfHpTqpyh7pT+JCavfPofDc7ziZnIEFASfM=;
 b=cbqeKAICooc05NcPdJTzHGl/cWdc1o8rhZN5eT0ZU5jsUFqQMoZhzVTl7Vl7E/LOox
 zVitg7zEkJgWYtV0Fj7YFbGuWECybFApWCUJe+nAZdG9ndK5HP5hY2m0QQ+kbIwYlIt+
 EOE3loXJKOgm4jbgynwPZ3zcxJXMO4XT9PFJIgDg7fLnSRzG6trgUeEmS55FKFfPT6zi
 AsYsjKKkc/fgtDbWlqC4NLu/e2i96i7d9jvaFOLmRqoQ82+Kb9iwshajX+o67oFfj+vp
 CFgID3cGYd5/HmpQ+lnrQSe8H5edGGuoGeDG5+p9pEeWKlhGoRX85xpp/Og7zsvg5LJu
 r2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746260030; x=1746864830;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8sWrBJj6gfHpTqpyh7pT+JCavfPofDc7ziZnIEFASfM=;
 b=qUJMgASSv1k9Fo2F20+I52O90Hub3GLGFBtIwQSiuDzUU3UWUzUfPbWSvECAGA6580
 kwJaP2J0egs51UhdiLC9/wIfQUUPBYXn3xgUOtc4la0yUewVfyDuzCaWmLhKhCGmbye6
 oZngdh7BUncGfFMcwCMVKC+nec8mUqPYOLKtEoEnYsRvRVWMFerT2rVg4qiCMdnamiGu
 K+oyIeNYkW1htLJ7EFVCuAiJnM5JH70QCup4AILJemW2n/NOUtt6wUX01Z1oeQCBX53e
 9XGNZZHr7KMkSaknNqDPx/4svUENDSRdlMVy9OIsSn6+8mJAmVks+WHBrTPx/Aw0zOJw
 Gf8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlU6S/346rDRxGTAbS9W15F5MghCpgPgO7SNPmJCf6/RWPVzblnUpyJ2IwY7lNnvJjQgFBMtLnHoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzstzZKbMAISDGXxGlybZaU8rtoxzto/juSzi8GHhMA5uHmG5Jm
 O3QETKwX7Stv0KTH1H5tIc1YwCAEpRkxE1QHUqTr12VrdwKNiPCs
X-Gm-Gg: ASbGncu0nvMC+j8YCjBPdq1Kh/q944RakTQ9JoK3WOzYpsj9Tr7mNezrIa0LIn2cdIW
 Uhc4QXs3yctZFgyCgtDA22mIlY/DhayVh8MwaPPBcDvdksVQULn6kEeSb5gZBww8eYGokc6NsJE
 mfQX4NLb8MlEF98RWlNzg5O30w2OSonRDa+j2jHW1CNVII0uppeJtfzyxDYNz3nl/tBLXLMfMGJ
 cKC3J5UFIWyVDR5ARzTUjqMawuF/2LQ51rTC1bipaHQY8kSxXDvPAsPmufzr+NjdUNnhizj3bEH
 MeHgcnN7H2riErxVX2iGj/bYfi8bGi4hZ6VRb1EbUgq4dRT8TUYXL6bSywhYSAiacgV/iUDxo+g
 c632w4VYjeJSt7th/0NMu
X-Google-Smtp-Source: AGHT+IHTURik6XJQXQtn9hy97s6kSGrL10STZD54xof5ds1w3TV4rLWUJ/qTkZwS/Pa9E2+vZoQpjQ==
X-Received: by 2002:a05:6512:b23:b0:54e:8db5:68eb with SMTP id
 2adb3069b0e04-54eb2444e63mr465250e87.28.1746260030156; 
 Sat, 03 May 2025 01:13:50 -0700 (PDT)
Received: from [192.168.1.129] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f18fdsm687959e87.188.2025.05.03.01.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 01:13:49 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 03 May 2025 10:13:40 +0200
Subject: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
X-B4-Tracking: v=1; b=H4sIADPQFWgC/0XMQQrDIBCF4auEWdeiYqztqvcoWRg7SQYaLRokJ
 Xj32EDp8n88vg0SRsIEt2aDiJkSBV9Dnhpwk/UjMnrWBslly5VULNESg6eVSScGbXqljdZQ7++
 IA60H9ehqT5SWED+HnMV3/SHmj2TBBFN4cY5bI66tvY+zpdfZhRm6UsoOoV/naaAAAAA=
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8517;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=owgqsJPUhQVJigfpn3+1SLtLjqMBYTNE/puBPwv/h6A=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoFdA1Cr+4oA21qO27FVpfOXqgHyV+EglRt85d/
 kE0UeisDlaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaBXQNQAKCRCIgE5vWV1S
 MruFEADQzo7S4p4nptwGvkLPg42H41vt5oIKxwk1Wwh9Kn2+xosYI8iLBRCMLtasNBdT1hmekPd
 jaRRcHQ47irU6HVtjcqH99hZoU+fvI+IA9OpiQiZ4bNi5q7BRM71ybmu97R8wqylEQtPSuR78PE
 pDjSluomn8BxEiq7gmWG0idUDHBFxvSqOIDuw96duW71vgDXR8BDUQXi9qSGwP3UPdxFMiCT+dx
 HmB69tWHRJXruAXbeyalkBBQbt/OHhjInULN7CszLQWKDm6WSbNACV9FTuFgDgTtyRXmG4wC5P5
 oJF5kj84yClAchD62tuiZ+vFmprsNhRk3wkv4ASQnTOV45tbynUpdyQeHKyJJNLqv8Psie5+JVz
 v2T02vgTE45URrbX5xuXDTl8oepAESZiN6xFZRL1upOpyKp8f0sOlnbZjnD1JgF3Vv9H1bNokDI
 QAiA/vX2KOeksBUKb8m1qbRLy9IC45TLUE6cqmEgPjURHbsX9Psttgna5dKz+ZU6xTrjqnTJp6x
 RmBUhi9oGEwIJookFn0L3RN42MofrwUf546xVo5aiPLJCiYOBzYBsi7IlhqOt6pCzyJ/4sBEWnW
 C0qGkGyiamzMK13DZNhlkxgGEwZGYd5jfZ0v6RlLV9arSJRMZ+t3M9YGXzWXlxqnNAf8OSwsobU
 Tpl52L4Ezyzsuow==
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
Changes in v2:
- Rebase on drm-misc-next
- Link to v1: https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com
---
 MAINTAINERS                                     |  6 ++--
 drivers/gpu/drm/Kconfig                         |  2 ++
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 41 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 41 -------------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 50 insertions(+), 47 deletions(-)

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
index 0000000000000000000000000000000000000000..25cae32e5c3ec11399a12f1f2bb2ede91c27d4d4
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,41 @@
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
+config DRM_ST7586
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  DRM driver for the following Sitronix ST7586 panels:
+	  * LEGO MINDSTORMS EV3
+
+	  If M is selected the module will be called st7586.
+
+config DRM_ST7735R
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
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

