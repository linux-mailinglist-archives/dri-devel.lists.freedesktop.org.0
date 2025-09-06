Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE7B46F40
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473610E385;
	Sat,  6 Sep 2025 13:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CpncDv27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C1910E381
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:19 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55f7ad815ceso3350107e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166858; x=1757771658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
 b=CpncDv27fTJkzn+zPeCSdguFM2DWIIMa8tJk2RNk/RdA0fx3k+eduPcmO9vFKGzK2m
 yDQ+XztY7CN0x2Gey1pSqIzOkC46YjWvDOZE/GQMaclKf+qw6jKAM+Hw2CEIW76kRSE9
 xDclKlzxeDTAVMPl0fBNdXB28Jh8BmGDXSj4agl1ys/6dWRk4B3CnnAyJ5TmIAxQ2xai
 OKbMTZJDF5GpVg77N6av2BrtbEs4VcOqEuksw/S/7i5yo718GnR7wSoEb+nTluyW9tdw
 pKBv3cct20LimCekbuIQFyQ56t0XKewF9zH6i87tCUbkh2JTaJx8g5vRGgdXwqApPH4p
 UO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166858; x=1757771658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
 b=u+3y5QXlgvH179hPN8fDvDfGxR/w8WPKkCVFrPD0X8ucBa55TRSKquKwjiA/dOUe7L
 5t1qNUzj0G9D6jRXuhGq7GOVJQ708bxPu6h9xGgACEjihkMSQYern4iokn9pJf8PUu9H
 5bSlvEGNvfh/RhdVBVMWrufbxquS7mY70He1BMMCGEXvGgl8mQBdPp8Knd1EchCqPadz
 +eqAO2xaTR/wqBxfInH7BKLtWIGXYSC+6oG/D2SoogxwQVgK/lV4D17vOFDAkrhOtrtB
 Erzr8mYYAEgYevto7cM3j4URAnSGYRgSGEC25Vof6ZakZnp353gBWUf3ysqyZIC0cl/a
 vsTw==
X-Gm-Message-State: AOJu0YxV55y6aVyu47TRm6NLhQSUEyhlhU4sJtRYGncq1My70buqhUu+
 LL7NPIPbyVF13nlKftEDO/iSJaw0ckmW1aVwgvypc9A9Tcdec54+VBrJ
X-Gm-Gg: ASbGncuSCjbAmhMP8jtUgNEsaPDW40UJttqvFxK1V6odxmheKKy2hwlTiTuodaw/CYc
 ePXCa8MfIsbiKf0XI8bw3rkzr6LyIH+d6Wetknbv6Aa0bIGzMujOdC3vK/6bMWxIq4NYqYgKX79
 qMafZCwnBLfSZtvNv7QhX9Qkvqaa86zV3kujIpq6/HZAhrV79b6136OOpfzO0X8F07GUkg5vYaX
 LnqrzxvRhdond+8JstJ5T42rSbUS2VTuUGx6/f5Q9H/pQJMpmOAXIdOwzJMO4hqAbG3k2e4AvN6
 jxMG5yZhQRlCiKXLNDf83ARggbrcltxdFd4YXaLCBSTc2bay8ACZSE/14QN5i61jzMQ3WJ0jVA/
 3+zQAt6j7oOG20Q==
X-Google-Smtp-Source: AGHT+IH8I2Auff/z35J3ggxpo1vwJ884ltjyjaLfaaaFMsTd6bn72w00EmrUSpTJ7lT5WXdLaRygAQ==
X-Received: by 2002:a05:6512:1546:10b0:562:d04d:fa05 with SMTP id
 2adb3069b0e04-562d04dfad0mr274283e87.54.1757166857844; 
 Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 10/23] staging: media: tegra-video: csi: add support for
 SoCs with integrated MIPI calibration
Date: Sat,  6 Sep 2025 16:53:31 +0300
Message-ID: <20250906135345.241229-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
MIME-Version: 1.0
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

Tegra20/Tegra30 SoC have MIPI calibration logic integrated into CSI block.
This commit adds support for using the entire CSI block for MIPI
calibration not only for CSI itself but for DSI too.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/host1x/mipi.c                     | 18 ++++++++---
 drivers/staging/media/tegra-video/csi.c       |  7 +++-
 drivers/staging/media/tegra-video/tegra20.c   |  1 +
 drivers/staging/media/tegra-video/tegra210.c  |  2 +-
 drivers/staging/media/tegra-video/vi.h        |  3 +-
 .../csi.h => include/linux/tegra-csi.h        |  6 ++++
 include/linux/tegra-mipi-cal.h                | 32 +++++++++++++++++++
 7 files changed, 61 insertions(+), 8 deletions(-)
 rename drivers/staging/media/tegra-video/csi.h => include/linux/tegra-csi.h (95%)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 2fa339a428f3..262f71296b75 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -215,10 +215,20 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 		goto free;
 	}
 
-	dev->mipi = platform_get_drvdata(dev->pdev);
-	if (!dev->mipi) {
-		err = -EPROBE_DEFER;
-		goto put;
+	/* Tegra20/Tegra30 add CSI structure to MIPI device */
+	if (of_machine_is_compatible("nvidia,tegra20") ||
+	    of_machine_is_compatible("nvidia,tegra30")) {
+		dev->csi = platform_get_drvdata(dev->pdev);
+		if (!dev->csi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
+	} else {
+		dev->mipi = platform_get_drvdata(dev->pdev);
+		if (!dev->mipi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
 	}
 
 	of_node_put(args.np);
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..3d1d5e1615c2 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,11 +12,11 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-csi.h>
 #include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
-#include "csi.h"
 #include "video.h"
 
 #define MHZ			1000000
@@ -794,6 +794,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 
 	csi->dev = &pdev->dev;
 	csi->ops = csi->soc->ops;
+	if (csi->soc->mipi_ops)
+		csi->mipi_ops = csi->soc->mipi_ops;
+
+	mutex_init(&csi->mipi_lock);
+
 	platform_set_drvdata(pdev, csi);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..461593c49594 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -16,6 +16,7 @@
 #include <linux/host1x.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 #include <linux/v4l2-mediabus.h>
 
 #include "vip.h"
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..59224c2f9948 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -13,8 +13,8 @@
 #include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 
-#include "csi.h"
 #include "vi.h"
 
 #define TEGRA210_MIN_WIDTH	32U
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..64655ac1b41f 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/tegra-csi.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -21,8 +22,6 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "csi.h"
-
 #define V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY	(V4L2_CTRL_CLASS_CAMERA | 0x1001)
 
 #define TEGRA_DEF_WIDTH		1920
diff --git a/drivers/staging/media/tegra-video/csi.h b/include/linux/tegra-csi.h
similarity index 95%
rename from drivers/staging/media/tegra-video/csi.h
rename to include/linux/tegra-csi.h
index 3ed2dbc73ce9..b47f48ef7115 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/include/linux/tegra-csi.h
@@ -115,6 +115,7 @@ struct tegra_csi_ops {
  * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
  *
  * @ops: csi hardware operations
+ * @mipi_ops: MIPI calibration operations
  * @csi_max_channels: supported max streaming channels
  * @clk_names: csi and cil clock names
  * @num_clks: total clocks count
@@ -123,6 +124,7 @@ struct tegra_csi_ops {
  */
 struct tegra_csi_soc {
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
 	unsigned int csi_max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
@@ -139,6 +141,8 @@ struct tegra_csi_soc {
  * @clks: clock for CSI and CIL
  * @soc: pointer to SoC data structure
  * @ops: csi operations
+ * @mipi_ops: MIPI calibration operations
+ * @mipi_lock: for MIPI calibration operations
  * @csi_chans: list head for CSI channels
  */
 struct tegra_csi {
@@ -148,6 +152,8 @@ struct tegra_csi {
 	struct clk_bulk_data *clks;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
+	struct mutex mipi_lock;
 	struct list_head csi_chans;
 };
 
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
index 2bfdbfd3cb77..81784b1f2135 100644
--- a/include/linux/tegra-mipi-cal.h
+++ b/include/linux/tegra-mipi-cal.h
@@ -3,6 +3,8 @@
 #ifndef __TEGRA_MIPI_CAL_H_
 #define __TEGRA_MIPI_CAL_H_
 
+#include <linux/tegra-csi.h>
+
 struct tegra_mipi {
 	const struct tegra_mipi_soc *soc;
 	const struct tegra_mipi_ops *ops;
@@ -17,6 +19,7 @@ struct tegra_mipi {
 struct tegra_mipi_device {
 	struct platform_device *pdev;
 	struct tegra_mipi *mipi;
+	struct tegra_csi *csi;
 	struct device *device;
 	unsigned long pads;
 };
@@ -69,6 +72,14 @@ static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_enable(device);
 	}
 
+	/* Tegra20/Tegra30 have MIPI calibration logic inside CSI block */
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_enable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_enable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -81,6 +92,13 @@ static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_disable(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_disable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_disable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -93,6 +111,13 @@ static inline int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_start_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_start_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_start_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -105,6 +130,13 @@ static inline int tegra_mipi_finish_calibration(struct tegra_mipi_device *device
 		return device->mipi->ops->tegra_mipi_finish_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_finish_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_finish_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
-- 
2.48.1

