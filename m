Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DD91367B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A32F10EDF0;
	Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UheQbxGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E410EDED
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:26 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec10324791so35304281fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093745; x=1719698545; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ioH0kSreVM5204+/7ne4leOKqkukfnp1CbQNa7kS3uE=;
 b=UheQbxGt0y4gOF2430i8GbV5bWW7ZscPPyMUEdcCurakTmswcCHRCMGCc06vgeWhME
 I9rpHMnMdqve6+O0FJqurS97M2tLvoxJ09uU7xZQvuboS9Eyk0zuAbJIAtNYXzZPDFc7
 4hASNCuww3YC/FuHt6bFxwTghghD7TiPdFJfvzyf24NmahpQ0yCXCcSeEN7q2SDb1i7/
 vISiZhUPT6Zhip8OMlwaAAnMeZTKEz24MZvwkB9bkaLEaVPkFFKJ5bs1KN/h9zDGnKr7
 2noMFhJI5PoiDb5pkoX3B8m+wMLG2xFN1IGCk2kbp4HOPmUAkYZ5+83mDxht5KSIUxtu
 Uy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093745; x=1719698545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioH0kSreVM5204+/7ne4leOKqkukfnp1CbQNa7kS3uE=;
 b=PufJHdMQzyHFttQbWJ/jnmwR/CxAuFJEnnd2JekkxgwE7KNGR6m7p3YWAVG+jjcC7Q
 4/BQlqKGxHOIr15Ijpdr+WHQwFffe5+Me5wk0D2xr7HYApNWZMRsD3SVhmkPkYaCuWoK
 m5/CNjH/mkRKFQo1/KTcFa61ClJwf/eRuY3tGlIWr0IOnMsYZzbh4el+3w3/L1jpIO6o
 ZEqie8x0rSn3NGX7hNd/AmE+8Qdw4arcM0BfBGmQ3YO9DmwMi+22e1UDmeCabbrojIVI
 z7Au6zR9fKsHw1I4PBXcGBHkvwzTFFz1K6AoAdJ5Mdw9jGV+VKW+2QH357ArJqGnbwJA
 Eipg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHqw71DtCC7lONwAEtc+1zGtAm62gczPAV2JA1evcAO0nN+FxMq0XZ4VUeAqOqKllZR553xCoH6flHEjpoVmG/D6LCPKsF3+wH5zpeOHZJ
X-Gm-Message-State: AOJu0Yx4P/ZXWaUpJ+2Wwu3V/KL3HAd/Ool0cwfJ6V5Jb3a8SejHsZgu
 hsnP1SqZyM1bzWmEatB/v2YHvqsNFsfNxJ+ELxfXBhrZ3VN8P65XL2e1PSYBi1M=
X-Google-Smtp-Source: AGHT+IHLZImmyK/pnWuG95FTV4gPoOc4QrSl/5rfdttMADBUeCz4FORFiopsCOPQ/T2IE9zD/EoBfw==
X-Received: by 2002:a05:651c:158:b0:2ec:55b5:ed51 with SMTP id
 38308e7fff4ca-2ec5b269428mr3933681fa.9.1719093745055; 
 Sat, 22 Jun 2024 15:02:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:22 +0300
Subject: [PATCH v3 09/13] drm/msm/hdmi: rename hpd_clks to pwr_clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-9-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3839;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oep80Z2K2Jlzuj2Eg41CQ0HynF66YnEBtDALprDk3E4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npW5YjQsuxKinGOs6lp8xkrkAjZaRt95LyJ
 DooBKPfNW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1X9aCACRFOh7HaRBPiIiaYjv3mjSh2+kuhlJTYB3/XUytpF2cyr1uqPAkiBwAHEpK93iCoX/Dnd
 CQxgdITWruqkhCdKipQ03Zuv2O/fOWZYkfq2dhASOOENyZnpdn3c3BZxg9/menjtSqwxQGFW4IM
 ws2lqUw4eZ4JHdbpUjpKtN4FeOoPI6TFpgXp7Yz+IzdCGMiznZKMhO0pPoTtxgPNyh92XDw9fPM
 sodwd7TNUvUnUzUuN/ruOywqQ7H3YG2kNLZUoNNFaGRJKWzsLSqYqFsoPAVWHN4EJOICdiqxMbZ
 RR/ln9e7DIXHKCBKVJs33vORXul18MmXpugKbSOUTpu/Lg0s
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
index ba9d4671e722..48dd1843ea1f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -227,19 +227,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 /*
@@ -424,17 +424,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
 
@@ -492,7 +492,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -515,7 +515,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 07a1b3641cb4..9bc4bd6761de 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -88,8 +88,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
-	int hpd_clk_cnt;
+	const char **pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.2

