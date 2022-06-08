Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CFE542FD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12C10FB3C;
	Wed,  8 Jun 2022 12:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E62010FAF9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be31so32919474lfb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
 b=W352pZ9uwwqTyUYzKspeDxpFa9JgGekJNoMxQ7pmUZ7l/p80RV+Ryr94k0lmvB1qwu
 rxUQA/N2fIMnMcYDMMcp1hYwVsar3595xrtL0S3bkxfsIMZMkwFaiGDqkFdEHr65t7A7
 HDjMfBcU3UiYD2ctQ90WqQCEnzXYWceRV/Ccz3yxxgtlO3IRGem3syoItABwbsuLZeoZ
 JHpwOVGSSjz1WuvME7liMYnDHUEdia6JYqj8SvOvIvErvWHaF8u8HltJqPF8u8kQu20f
 o8tEDaTWHDvkqLFLmDEVqxmyOhiYqNunMVAG2kqXezfZkX2SV/7gUJl5p3yHoXFq0WnQ
 7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
 b=ccS4OqSF0wxmgNV/Er5Xsk7wFyLeXSd8kyv78rgJKm9rg0kGfPn0pjJ4Vy61ZZ0Bvz
 XuUHHOf1AFpphvOBhAOnIJMQ37bGXlIUw8CmneqV5OcEvAGTXNF6cRtdViTZbHSj9eHk
 ZExNOqfVNCsuJ2qXZNQqhbsPiOBRGh0bIlDVVjgZoCK2JF7ELpUpRi0EZkaOVM8t3sRn
 0sH2RfLcC3CbSEKuV0Y0iLw3lzgSYaaUbSFMJOxn7a057iEZPfQCjYVd3Z9tji/4X5JK
 G4+UQ427X4oDFUpL+cQOY2V9vZ54L9wwc0j8eTV4/IAc6ITZ507S/Z1rKXLSCQv9lxVP
 jnyg==
X-Gm-Message-State: AOAM531lWy4CtZWjdlLlyzBFwQB/ndVVFrjXL84dvwxbCEXfSJBVBJRT
 ZzFNpZWKjOzbwcr708OmAN5U1g==
X-Google-Smtp-Source: ABdhPJywThmG5UQP/hMKt/YeXsy3uQeZ4OTnQen1exape5w/rd16un0mDKKLSFaIaUKX36jU6pW4FQ==
X-Received: by 2002:a05:6512:3f11:b0:478:9795:4a45 with SMTP id
 y17-20020a0565123f1100b0047897954a45mr49913632lfa.491.1654690055910; 
 Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 10/12] drm/msm/hdmi: merge platform config for
 8974/8084/8994/8996
Date: Wed,  8 Jun 2022 15:07:21 +0300
Message-Id: <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since there is no more difference between the HDMI platform data
between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
single entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index bc6ec6aa2cb9..a718e0ebf6cd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -375,27 +375,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static struct hdmi_platform_config hdmi_tx_8084_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8994_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -577,9 +556,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8996_config },
-	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8994_config },
-	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8084_config },
+	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
-- 
2.35.1

