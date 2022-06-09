Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF30544BE5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9011BEBE;
	Thu,  9 Jun 2022 12:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D7811BE7D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m25so22632948lji.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
 b=mmT9KWDi+BmGJTdwCedNj/txduFmZEyZRfecsqYUQx5J3STr9BV/oS9mpQIibZCmRd
 bJ6EKmy5AqwicxxxBaKPSs4re83uxQ7/efc3Stt9OxpUPefYp6FmADdCTnGWHoi9iDp/
 vzUlznup5QmJPMkS3IbYlnlwqxY371zo17YN4z8NJ74awlHRbWy8zIewsxAJEfwsx406
 wS0Dpyu6Gp8npMjbJG0xwJ3r0aKfPG5Pfx7UNGmJSnnPpGOXjuQUURknae7ukgDWLdpv
 npVouhbC3Jyez1CK+Muk02WJ+E9WNIoT1/PdkHd9Jh50XT1UZuAHT2APO8z6XboF5qg3
 JJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
 b=Q2j/1ZaGEqPtNDLSmvUeWpxQpPCWhmCt75amEWLutNUcKgn/Ka9HBfQ7IkydpBDxug
 oM1LeqoaLUBBG26H1I9nu3B7mrEc2kInh7ZKzlW8ILgCse/2omanm28xqsSwT+U+V58+
 ToQ9Xjx+fQVDtcO+TRen9alnihy5LLORkyQXydMGq/cHoTVRtmaFmG4luJRE9yFFRKlu
 0i2hixzuJ/aYZYo3mzCvb09MUXlSXZHjgHP4e4dPBT/NYguMmfz/uSjGi5jpnrL7Znok
 TSMXLCiZWo082clVNDX8pjo9mdfOrnMkItB0Hz5AwObQcSEqssCmkmrPoJkY+Dkjkl5Y
 FXgw==
X-Gm-Message-State: AOAM532jTrRY1786/+GeLzGwbP3j5+g8cysu9Els0jt0zI3JGVOfZXcH
 NqqScvtJ19MqnzZB6oh5JCMXTQ==
X-Google-Smtp-Source: ABdhPJwzLnPBNshBT9ozlBlmQIEA8JA3fN9m2SqapRLtuvq1rdctLl0zL0rtACOU9xkPyRuJpr5blg==
X-Received: by 2002:a2e:8803:0:b0:255:8be7:c03a with SMTP id
 x3-20020a2e8803000000b002558be7c03amr14052361ljh.487.1654777440885; 
 Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 10/14] drm/msm/hdmi: merge platform config for
 8974/8084/8994/8996
Date: Thu,  9 Jun 2022 15:23:46 +0300
Message-Id: <20220609122350.3157529-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 48cd6b9a7565..0f1c63f68569 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -392,27 +392,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
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
@@ -583,9 +562,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
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

