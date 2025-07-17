Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58AB08EFE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B5510E831;
	Thu, 17 Jul 2025 14:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BpU1GG3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29410E830
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:22:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-555163cd09aso865323e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752762127; x=1753366927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
 b=BpU1GG3KrktPQNCx2WwAEKrbtSG7R2JTYjhWNthPAICgGArq6S37mZIHWbpYjqZbnj
 xDcFgfLILTLDprQiBo/a2l65dQ1ZTm+IWER21g0e8sk4aKrJRIgom7eYMu9b/2h9guic
 bGFeT3RMkHwt4Rf9vcYUq0W1ZcRbyepHniDB7+etVMwjpYsxXtduFCTm1jKgnBLgRYQE
 b5H9mJoWhBsg2+Tn8w9k3aIZG9Eb64gFFl8kykD8bj1dizf4kkjbfO2P/GznjR/Vxf5d
 RPYQ37zx0tmUOpQDB3apCbEs/34/7TO7dHuEZ1YfMW9X2t9RBcMovdh+ZPfwiJ4dJXuc
 sPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752762127; x=1753366927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
 b=A063NNVyFQCauwUsdHZvibJirs1MdlXCdc+6p7kQ6w/bqLyD8x3mSbVCOemvNlLskW
 jdcYQPy/zFLe+NuER9YM9kzmnVLziBf+xsTdCXApm4pK+r++HNWCMxycx9FmouoBe1wB
 GFSFkU0qdKqOtXeQa7I6wThrlnaR+uLDp9ReCCU0+n4KSltos2Rb2cMXqT4Gg3XgQgi3
 EKLMDrOQKfwoqOJ29vroXnJligp7NCtdkrP6RkUesHwdPoCAX5dnXem6WMJjNCeHn2m1
 SMtFz3l7lhtZ03XmWuf7G3T2l8QL8VmJkDLGYT6gxGB0EIlW5ilrOXiRBxt5tbhQ4qWo
 A0Jg==
X-Gm-Message-State: AOJu0Yy8IXka/tqLl+HO07liKb0xS7WNbpiExNUZRznwE/LDpNrx06T4
 DVxMCz7i7Krp7jCG4T/q/FVpwhL0axMoyBiCzgD3/u0J3vCjSuYjZNoS
X-Gm-Gg: ASbGnctvzM5qV59Sy2u/IAjA6yZK33Mnc3yHHpWDmvNU90Vqm2ZAANmTnbDeKxSdHNM
 kWYSGljCw9XoPSirBkmFj/qmRxcWrFxIlZJ1kgvZ938zoUwMwUMryBC8ah61GvfjQ+XJuZ3xGeQ
 vumSZNIINEGK+y6ToDRq7/noUZxAtDnOXnOm/x50J1yHxCWVgPtyaI+Z1i/WJlhPG98wx99Mwqv
 VADC+uDxi/5t7pkBp0voMD3qQp/mZELNW3IjOQy6iCgsUnOneHctz58RcJxnKMzOVRbUO+0GhNY
 SHc7TzfLDFUTpwkH/91+A5LFEA4W6RpxSHG/+tf8cbbvLYIpPNOn/UgElFWbohvREo9RHKfF6P0
 XAxZFSO2l5xodJw==
X-Google-Smtp-Source: AGHT+IGrbN5mHRPiiMtppVmbuHGOd3g9rJ3Oq45Lxs0VPpdE/NlkM5b45zOZqDMAcFqvsAHYbXrcfw==
X-Received: by 2002:a05:6512:39d6:b0:553:2a16:2513 with SMTP id
 2adb3069b0e04-55a2971a2afmr1090464e87.47.1752762126484; 
 Thu, 17 Jul 2025 07:22:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 07:22:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:38 +0300
Message-ID: <20250717142139.57621-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
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

Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apart
clock configuration and MIPI calibration which are addressed by this patch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c |  2 ++
 drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/dsi.h | 10 ++++++
 3 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..5d64cd57e764 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1x_drm_suspend,
 
 static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-dc", },
+	{ .compatible = "nvidia,tegra20-dsi", },
 	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ .compatible = "nvidia,tegra20-gr2d", },
 	{ .compatible = "nvidia,tegra20-gr3d", },
 	{ .compatible = "nvidia,tegra30-dc", },
+	{ .compatible = "nvidia,tegra30-dsi", },
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra30-gr3d", },
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3f91a24ebef2..85bcb8bee1ae 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 {
 	u32 value;
 
-	value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	/* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
+	if (of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-dsi") ||
+	    of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-dsi")) {
+		value = DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_LPDNADJ(0x1) |
+			DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) |
+			DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_PDIO(0) |
+			DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	} else {
+		/*
+		 * XXX Is this still needed? The module reset is deasserted right
+		 * before this function is called.
+		 */
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
+
+		value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+
+		value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
+			DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
+			DSI_PAD_OUT_CLK(0x0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
+
+		value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
+			DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
+	}
 
 	return 0;
 }
 
 static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 {
-	u32 value;
 	int err;
 
-	/*
-	 * XXX Is this still needed? The module reset is deasserted right
-	 * before this function is called.
-	 */
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
-
 	/* start calibration */
 	tegra_dsi_pad_enable(dsi);
 
-	value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
-		DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
-		DSI_PAD_OUT_CLK(0x0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
-
-	value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
-		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
-
 	err = tegra_mipi_start_calibration(dsi->mipi);
 	if (err < 0)
 		return err;
@@ -1615,7 +1624,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1636,10 +1645,14 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	err = tegra_dsi_setup_clocks(dsi);
-	if (err < 0) {
-		dev_err(&pdev->dev, "cannot setup clocks\n");
-		goto remove;
+	/* Tegra20/Tegra30 do not use DSI parent muxing */
+	if (!of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-dsi") &&
+	    !of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-dsi")) {
+		err = tegra_dsi_setup_clocks(dsi);
+		if (err < 0) {
+			dev_err(&pdev->dev, "cannot setup clocks\n");
+			return err;
+		}
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1709,6 +1722,8 @@ static const struct of_device_id tegra_dsi_of_match[] = {
 	{ .compatible = "nvidia,tegra132-dsi", },
 	{ .compatible = "nvidia,tegra124-dsi", },
 	{ .compatible = "nvidia,tegra114-dsi", },
+	{ .compatible = "nvidia,tegra30-dsi", },
+	{ .compatible = "nvidia,tegra20-dsi", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
index f39594e65e97..d834ac0c47ab 100644
--- a/drivers/gpu/drm/tegra/dsi.h
+++ b/drivers/gpu/drm/tegra/dsi.h
@@ -95,6 +95,16 @@
 #define DSI_TALLY_LRX(x)		(((x) & 0xff) <<  8)
 #define DSI_TALLY_HTX(x)		(((x) & 0xff) <<  0)
 #define DSI_PAD_CONTROL_0		0x4b
+/* Tegra20/Tegra30 */
+#define DSI_PAD_CONTROL_PULLDN_ENAB(x)	(((x) & 0x1) << 28)
+#define DSI_PAD_CONTROL_SLEWUPADJ(x)	(((x) & 0x7) << 24)
+#define DSI_PAD_CONTROL_SLEWDNADJ(x)	(((x) & 0x7) << 20)
+#define DSI_PAD_CONTROL_PREEMP_EN(x)	(((x) & 0x1) << 19)
+#define DSI_PAD_CONTROL_PDIO_CLK(x)	(((x) & 0x1) << 18)
+#define DSI_PAD_CONTROL_PDIO(x)		(((x) & 0x3) << 16)
+#define DSI_PAD_CONTROL_LPUPADJ(x)	(((x) & 0x3) << 14)
+#define DSI_PAD_CONTROL_LPDNADJ(x)	(((x) & 0x3) << 12)
+/* Tegra114+ */
 #define DSI_PAD_CONTROL_VS1_PDIO(x)	(((x) & 0xf) <<  0)
 #define DSI_PAD_CONTROL_VS1_PDIO_CLK	(1 <<  8)
 #define DSI_PAD_CONTROL_VS1_PULLDN(x)	(((x) & 0xf) << 16)
-- 
2.48.1

