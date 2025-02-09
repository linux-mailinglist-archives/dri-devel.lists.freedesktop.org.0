Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C1A2DAF9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9909A10E47D;
	Sun,  9 Feb 2025 05:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXndE7p4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85CB10E481
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:13 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-545054d78edso856399e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077632; x=1739682432; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rImDBJcwLqN/bA8K9yZBJSkxES6sl/gp3TQ1UcsOkUQ=;
 b=NXndE7p4qudpxFULq3Zt5sBZ+b989tU5RDa6p5Tsly35J4DGGS9gHgCND6S2NKTzDQ
 jreSgxddIEUjyhyM8hABdj78SIsyrM2GaofF46HYnnuVhnrCd15xp0G29NCRGll21XVZ
 Tcc2r79Sw6WrY6uf9eO8JceosFzUu/+y97j3g0tE7VKSjZTQHiwzfbO5NQ4F06meAx/f
 Ju5H0btVhYRMyTAU0TuH+HU8K7OqQNV9CITuUSzxMIiqwQeEvhLnK/0Ci9vLitddKTyG
 a+rWWoV62kguHE5IngcIdmCfR2dxpkmnp0m0ESFctsv3A8I+WuZ4/nal8WPhaBPO35uk
 89sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077632; x=1739682432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rImDBJcwLqN/bA8K9yZBJSkxES6sl/gp3TQ1UcsOkUQ=;
 b=QoxSMpxcz7SaCrFADeg6wGBBrfAQO4pMF3VlL3H2lNO590WqMtlJ0XuBxD/pfenlSx
 J1TT+OuumQ0PDMZZG/vBT0fmQma8s7fWextosyarqSPkYeUFfmTY3ubgfmlFUblJyTXN
 FXfdn9k1v4AR2TUQGCfVwFvBM6oGZuV7D5TZi2cAvtUe+99VF1z1YFNRfHDdFLuitbBD
 YG88I4KTYZ1sgs4z6ux04hYN50tSm4hJHNyERwrP2Db+kzxiakJw/5KwPjGqlstB1n1c
 8KQDRBDTw+NiC7kSIHkJ6JYwTPDjiVlHtD8mRTeGz1dIoYkLBJyJYbVIld6XnoDt2tbW
 Uwkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcGthVhYNUO7m40pPtIwBI4Mzwm/36Wfhw9jjXvdWVVppK6cwmZF6md7Xxz3+brLiYbJb+HYEaa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmkh7VsgYyU4bbeszC9+xOsE7oXBP9/WteTZgM6iNX7aA6NXaU
 GyFZ7TRuNAR9enq2OYsJERfayt1UGBulDRyPO/DyxoP65NhHAlc2St0yfohjeWA=
X-Gm-Gg: ASbGnctl2FFA6lWNNhjwQ70q5uu6qU3BGZtdAd6HcPTcW+aLDRJy6h4dS93YqsEMerH
 Ik5+UQGeiE4sSLz3EGh1g1ewPjgkZxOHsIS5PIc+SU5P1PpSUzhAxdc1Wg5dIz29/vOKBM5r2Ai
 DbZzx6ccC1AoJJpivwwudy6qBP5II3sJcO8/wDXRUuSCfbLQ7GUQepKpY+SZlbO2pGaOtdgct3k
 +8LQKcUhTwRMP6/QfCdYGpYcxpP2FKRBnjp9rdZvyMjk/e0MVIFlAwiH6ofpk+uUBhOg4KvqTd5
 RUkK5StBDypfWAuwhTKFsFE=
X-Google-Smtp-Source: AGHT+IE2QJZGzfLvREQjZ2Yj5CakhCNV2ut93H8ain0VcaXqhSAifxC/qDGCZKxvSJtMnQOIOHh9hQ==
X-Received: by 2002:a19:8c55:0:b0:545:441:52d4 with SMTP id
 2adb3069b0e04-5450441553dmr1026473e87.26.1739077631945; 
 Sat, 08 Feb 2025 21:07:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:55 +0200
Subject: [PATCH v4 11/16] drm/msm/hdmi: rename hpd_clks to pwr_clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-11-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+WpYll0ay0xnF4O7o5nyBXY9cEIfu8gX+WDGXWRK1Mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfjf8OBc8uSGwCTBq4PbhEA1GDOaqya+TI2F
 VrQN8it+xKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34wAKCRCLPIo+Aiko
 1WmrCACsjaJLkXpv4v5MNIIXG7ds98d+aS/Ra33MbEb/9rTGuEBP8CIdMTldJfwvQfHRoNnJCMI
 A/j+3tq2UuhxUrLtxzo9NC2I0hI2BTZ55dOQPgn1ou3bqJiXzwaJ37XA9+vu4hAkpZ6L33xB6DE
 A119TuMSildDZgGfpg6fmxNmZHOIEa6cg1COY+UcpNKOp/QlQU01BMCzifnmBW441EgV+yPufpL
 AMB2jTVSlke2qeSPU1QkNyhgnOG5X9RIMGQXfOiXhJ/CKUNiUXFLUITYNiVMdjYof8nnLs5xhOf
 4P/QTx1Hq89+lFKvj0L9A3arcHDUkAmQQrlf5dcdJSnr+LWB
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

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ded20176aa805db98b0599e617eb6ea9bce122d8..8e6e3e6a04bd2d86bcbd23c110f3533f56c17887 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -226,19 +226,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
-static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
@@ -333,17 +333,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -401,7 +401,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -424,7 +424,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 7e3c035cf913d713ed63379a843897fad96b23ab..a28437beb1574553c1dc00a0c693b390389353e0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,7 +48,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -87,8 +87,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char * const *hpd_clk_names;
-	int hpd_clk_cnt;
+	const char * const *pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.5

