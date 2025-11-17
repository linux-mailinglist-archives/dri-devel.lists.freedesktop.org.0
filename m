Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB34C6308C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C7710E31A;
	Mon, 17 Nov 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDfYU1IZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F910E328
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:29 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5942bac322dso3746072e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370267; x=1763975067; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OSUsJtZmVyJFMumy5C75Kafona0a7fDMqaNggZdL9to=;
 b=JDfYU1IZ5g8trhSq/EYnklGA2cu3oqBunrivLcZwgLsEw6VFUerXAhh0FW4h1PvOKm
 lkd7UUQ6Yl/OfMNdC87cXBUSiGY1acFsYuzGV2lu/NTO6d0YlzFDS5Zkp0rVPLtPhctH
 Rc2bGyvfopY8oJmKC3wO5AOrnmNmkWLd+8hQ5yseGrx9GoS8wWYiLJJtbxBsPcyErEh8
 qZlt6YDQQgiKO1YXhpoAz5mTFl508ldKeixML1h6BLe5moROJrcdOdVP/6djX+r7W6b6
 9rGvlWudnrCt1I0cJWrfi937p3UecepRgPB5NiZe6QplAXIVV5tc2W4uCdcp2337ShVD
 52Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370267; x=1763975067;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OSUsJtZmVyJFMumy5C75Kafona0a7fDMqaNggZdL9to=;
 b=wMrDnI2vThmZsTrRuH3vMtcA+tDgnX/7efC/C8nJEPAfTnuj0gXyUxKNQSE2J/oGta
 BgMXC/hfV+8191DzVDdYUaYjCL7Esaa/REq+ZuFgcDvWsFZMIO+C0Vbqn1boc7QKa93W
 iBnEy4YgVBA/6TLE1S3DffZ1BJ+zji9YUgfocuUSNU3y1czOo6r0Ga08EyCVn26luKo3
 a7Gome/M36op8nJ0tNKmms6jX6rJo3X9mtCF1jzXIUYJ8HuXoo2GGHF9zjWzpjb5UAQd
 BN8eM+M+dorXTazxkgYcp2iYGcDFfA0Ca3tigSm5NR+Tifqg2jTw70NFDJNCn/vbYRCB
 +0OA==
X-Gm-Message-State: AOJu0YzhY/hyLC4pCIJ7CdlwYayxcieKyxY6Bm76dc6ppAEIBFPWYOe7
 xBr8M4eVH99I8/90Juow6IWOGQzEg1VE2L6nSQFZDxPnzZ9jp2I1l7fo
X-Gm-Gg: ASbGncu4jEJ7Z9oiNJji5NDbE14Wg0w3cYMbbaExOMTUqbN2XkMIAiG2nDxxltKRpiS
 LCBOMw46kf6qe1YETXlTM07n8Os8c80ejJuCXPCkvn9bqh79KuDgzl1fk+7TH7fP5pQ/37C97OG
 mvsZLfyK5qs0WmaAnRcVUPKQcyUic4Irc5zLkOJbLmoFlPF4N16G49eDyIR4ZJOpUnQpPZPF6qF
 8n5XWPp2auGcQdeZ9N4XzCpu2Bds0IkefUIX57DuNthcQRf3hJsqtfMSZHOaWvLfgFsl7aThXR9
 MNeD1BtDa8YMiEhl39o0HQjf9Y5dD6l5HG0KCfyUfuU4W+N+Y5t0uL4DOK5ri8phayLzNBsEH4q
 /T5r7xP+uSphGnMDlm+c1+1BJI+3VpWIHYpVV3g2T2MtBuckfwPjTF8h1GlMRcqQpMwBmMvEjPC
 Pv7dOvuaXzDUYGOwnhkgdY7n+SySLsIv7rF5wRlbnhKRyoMgEhuz8S1RDI
X-Google-Smtp-Source: AGHT+IF6v1pPFJSOX4sjF4HiLAqQJJbCSdFrQkg8rHxLDUdArkdi7963QKA0EZ/jatCr/bSa6Jg1Iw==
X-Received: by 2002:a05:6512:2216:b0:594:36b3:d1f9 with SMTP id
 2adb3069b0e04-595841bf10emr3326397e87.25.1763370267121; 
 Mon, 17 Nov 2025 01:04:27 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:26 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:03:48 +0100
Subject: [PATCH RESEND v2 6/6] drm/sitronix/st7571-spi: add support for SPI
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-st7571-split-v2-6-13189da95265@gmail.com>
References: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
In-Reply-To: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=M2AEWs1PlE4kHIlUXzPT49FDEzkCCXRLe8Ws9kBRYLc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuUN7S0eSUy0WeRQVSetr6IPo5Cq1Hkfsuut/
 +1sV0FwKLKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlDQAKCRCIgE5vWV1S
 Mv3aD/9TeQ5VkNPagHzqU66aEpO8JzLUXxjTFXFZhPrtClpp79RSb928M1WjKKH+daFwrjwZHhv
 0JL1KAjFSTH8XbSBCZl3N08xxfZU4Yu+Y598VIVpft1WsJc9bgVFMYtmHNoclMILi0qpAuYbFGq
 hNdDGXyIDgLLsoHbaeph22oObecqUF73rrPg2GSRQnXqZwZCpEpzeEQiimf9mZZqoIe0Gsftv0Z
 G7X05V2rq6Nxk4YPzy0tzY762ozblSMooq+uEpc8uOkBd6rPBfuaKT6nzihECYNVKDLAvdtO4jn
 3bi2atEJ6FPRT9l66OTo2zS/nEwQtifL7cx+4KO78XglF0OotyoqPRjIILlHRslvrncy2ozZUQL
 mPXJnGRNuXhvs6DZWhQuz2oOt9K4gwSWczlt4tKEnnRboHC3KjXH31PFYHazWiC52TTszwIxKW4
 7P/X7beFDWrxnb1Mce0pLT9ly5d6vw/U//ZXXtBYbpW6rvDTaoa0A+4Dh4M6cRJNmYl28VXULp2
 ksKhpCFCUozYemsTkvK1ahoeiggeGsN9fm6Bv5vgn8UtRAZlzjAVhgI13odA2I9f03sR+rLBkoL
 vFNaQbT3g+1EVEtGrDH7GH3E+3VpJMuoXZQSH0xavT9Tl+Mr8FgZftOutVQEi8k3dYu+Uid/2Jw
 s1qJ8ydBX3N223w==
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

Add support for ST7561/ST7571 connected to SPI bus.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |  1 +
 drivers/gpu/drm/sitronix/Kconfig      | 12 ++++++
 drivers/gpu/drm/sitronix/Makefile     |  1 +
 drivers/gpu/drm/sitronix/st7571-spi.c | 76 +++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66e9ffb757c8..c89e521cafa1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8083,6 +8083,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-spi.c
 F:	drivers/gpu/drm/sitronix/st7571.c
 F:	drivers/gpu/drm/sitronix/st7571.h
 
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 0676a86661ca..2204250ab413 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -27,6 +27,18 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
+config DRM_ST7571_SPI
+	tristate "DRM support for Sitronix ST7567/ST7571 display panels (SPI)"
+	depends on DRM_ST7571 && SPI
+	select REGMAP_SPI
+	help
+	  Sitronix ST7571 is a driver and controller for 4-level gray
+	  scale and monochrome dot matrix LCD panels.
+
+	  DRM driver for Sitronix ST7565/ST7571 panels connected via SPI bus.
+
+	  if M is selected the module will be called st7571-spi.
+
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
index 8073bb776ff9..c631e3359c3d 100644
--- a/drivers/gpu/drm/sitronix/Makefile
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_ST7571)		+= st7571.o
 obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7571_SPI)		+= st7571-spi.o
 obj-$(CONFIG_DRM_ST7586)		+= st7586.o
 obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/sitronix/st7571-spi.c b/drivers/gpu/drm/sitronix/st7571-spi.c
new file mode 100644
index 000000000000..0206e9162f1c
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571-spi.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Sitronix ST7571 connected via SPI bus.
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "st7571.h"
+
+static const struct regmap_config st7571_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.can_multi_write = true,
+};
+
+static int st7571_spi_probe(struct spi_device *spi)
+{
+	struct st7571_device *st7571;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &st7571_spi_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	}
+
+	st7571 = st7571_probe(&spi->dev, regmap);
+	if (IS_ERR(st7571))
+		return dev_err_probe(&spi->dev, PTR_ERR(st7571),
+				     "Failed to initialize regmap\n");
+
+	spi_set_drvdata(spi, st7571);
+	return 0;
+}
+
+static void st7571_spi_remove(struct spi_device *spi)
+{
+	struct st7571_device *st7571 = spi_get_drvdata(spi);
+
+	st7571_remove(st7571);
+}
+
+static const struct of_device_id st7571_of_match[] = {
+	{ .compatible = "sitronix,st7567", .data = &st7567_config },
+	{ .compatible = "sitronix,st7571", .data = &st7571_config },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7571_of_match);
+
+static const struct spi_device_id st7571_spi_id[] = {
+	{ "st7567", 0 },
+	{ "st7571", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, st7571_spi_id);
+
+static struct spi_driver st7571_spi_driver = {
+	.driver = {
+		.name = "st7571-spi",
+		.of_match_table = st7571_of_match,
+	},
+	.probe = st7571_spi_probe,
+	.remove = st7571_spi_remove,
+	.id_table = st7571_spi_id,
+};
+
+module_spi_driver(st7571_spi_driver);
+
+MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
+MODULE_DESCRIPTION("DRM Driver for Sitronix ST7571 LCD controller (SPI)");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DRM_ST7571");

-- 
2.51.2

