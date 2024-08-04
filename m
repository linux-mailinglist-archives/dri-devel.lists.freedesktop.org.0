Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A799A946C39
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A253B10E081;
	Sun,  4 Aug 2024 05:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WiImn97x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88910E083
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:23 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso1230505566b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750021; x=1723354821; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QAmP59CsMg1OmM3gD5Is1pyiJbDBWr21J5h6ZsQbULc=;
 b=WiImn97xzwWhSAgp1a5gFBq7duZlD4F2bZFa52qmToUwMw98lOAW5j9bD9UMfRyUZ7
 HV2to054OV+UtHr170TZi6MrxWmOLT50NWmfg8A0NwNCR6WVAWbNLMywi8JW5YL+KvAA
 +g23CbsMO+xv2tb9UOmyYF+vms8FdtKMQokd+3xfhzi4mo1klpTFD2islasQXDPJ8UHK
 2yVA79FbdJt8YLiKDjY3GWzC6h9I3SbVUXW++HWxjJR+IzAMdtKbPyXL5pYBzwMp30gG
 AH7fSILy4A7w5sn2hPIIKz3C/0opB0QGTeIHuSCxSkDoviwPz2eQZEmMjnx+4sihpW9H
 EHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750021; x=1723354821;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAmP59CsMg1OmM3gD5Is1pyiJbDBWr21J5h6ZsQbULc=;
 b=Mrmqs8BDQ1KkzKS118alYMmJ1rJWPM4iWlLQYsR8i84wapQxBfXCzCkxPm5xbf60mB
 ltfGhHTfFkRrWVQbxs/89GMOTmKDXJ3Fk+bHiXK8x/BOu9Y2kR19Sb42PsTjnfQ956Km
 XCv8YxBt9aE17jJFr1iJxMPsRJ1swyo1gsZ4gpkNvJaPiOjJtPdjkuFiVjL3IyL3n/mB
 qMpgd8P/RyJeaiK23ce+7AZVXuKwPwn3HkPgLiWE4bszL3L8gd08jZKa0HmX3/vR2I5Z
 oPOKYIEtTUm6dBkPfY0Ob0Iy7zVaXIZ2IFT1E5H/reHlb5nlBOmYIkJqOHytKwsMrFYD
 Y56A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNCBdGoW9pGs4OHdWANI6HGDkkRf9IxmDid09qCWLLlYGOXmD8vtDBBqY3upuQp6LUy2bgKVaM+Lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/XJExRqpzH0+1Z/6DITaZDbwuRzzlHLWiG4TYKqnd7tITMSns
 W5T33uVM5WJVz0ObC9f/ItuDg6jKYQkXVXKaH7cAiOANWovIftzd4JkK6g00VYQ=
X-Google-Smtp-Source: AGHT+IFVLTR76CbNV5qahJQoIGpt3Vzypxa8q34XuuIwmITvoXxOKd6/Ru/9TyTfB1g1mcja4mQVgg==
X-Received: by 2002:a17:907:a096:b0:a7d:d1a6:d943 with SMTP id
 a640c23a62f3a-a7dd1a6dec8mr392048566b.40.1722750021473; 
 Sat, 03 Aug 2024 22:40:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:06 +0300
Subject: [PATCH 02/11] clk: qcom: dispcc-sm8250: use special function for
 Lucid 5LPE PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-2-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jmcv3QZDbF0/FB7C2A1nETsdriKJ1dXxo+mdoIZ+Ot8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ+bL7txinbbvtpaZCB41puWCXaqSR2+yfiX
 +7P7Ff+UomJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPgAKCRCLPIo+Aiko
 1c0CCACx/TGWwylNnfimpuNOVKIxADSMA2GbffeGvgGYp+409LFZHjV8RPg5nyWwwhARcdnhDCk
 ZRv9hR4KhHmZF8C/Bmh1c9XxTeaj2mLaH4qwpNgycQavj8ZTli/pQUcCRg+/BEZrxSgsMsVa0F5
 8QvJInBHia3iHgVKJzoh7P7xCsbCudufusswKl3z27BrrQrNVF8QUeMV8/5fQ23LSvQXFj4P1sL
 wI4itM1zoO5ZnBQeyPPpHU0WuctZTd+0NaskZeZeo3y8Mtv4CHuTuVzDlkZ9HU+3igoyrnneVNP
 gtibXN/1UhcT3R5hnWf7rrhn82vRAV1kkitFhrlW2wYWcNDL
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

According to msm-5.10 the lucid 5lpe PLLs have require slightly
different configuration that trion / lucid PLLs, it doesn't set
PLL_UPDATE_BYPASS bit. Add corresponding function and use it for the
display clock controller on Qualcomm SM8350 platform.

Fixes: 205737fe3345 ("clk: qcom: add support for SM8350 DISPCC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 52 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 drivers/clk/qcom/dispcc-sm8250.c |  9 +++++--
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d87314042528..d0b911499cf9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1831,6 +1831,58 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
 
+/**
+ * clk_lucid_5lpe_pll_configure - configure the lucid 5lpe pll
+ *
+ * @pll: clk alpha pll
+ * @regmap: register map
+ * @config: configuration to apply for pll
+ */
+void clk_lucid_5lpe_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config)
+{
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_debug("Lucid 5LPE PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
+				     config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
+				     config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll),
+				     config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
+					config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
+					config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll),
+					config->user_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+					config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+					config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll),
+					config->test_ctl_hi1_val);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
+
+	/* Set operation mode to OFF */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_5lpe_pll_configure);
+
 static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index df8f0fe15531..e2cf5c7e501d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -208,6 +208,8 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void clk_lucid_5lpe_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
 void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index eb78cd5439d0..884bbd3fb305 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1360,8 +1360,13 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
 	}
 
-	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
+		clk_lucid_5lpe_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+		clk_lucid_5lpe_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	} else {
+		clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+		clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	}
 
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x10, 0x10);

-- 
2.39.2

