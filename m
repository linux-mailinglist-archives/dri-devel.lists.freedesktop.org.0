Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE79A02492
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A665610E642;
	Mon,  6 Jan 2025 11:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQb1DFPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617CD10E642
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:53:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436203f1203so21255625e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 03:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736164343; x=1736769143; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
 b=LQb1DFPNZabkScLh0rEq7nHN1HZZ3pWAtEiZfJDjGVWDmdL3ysAboUoGNVVXyTwYvR
 hnFQNaVR+bW9M4x6nCc0ycfAG6355HCIkdu9jCjm0FZb0nedB4zZY665v9s4HAkegewN
 2O+OG2NC2ziaHRUvD37kDa0ZEe0zhZ4xbXFVMNdKOh28ERSACD878M2lMdVWdbmxR1Kv
 9Y4ZxxEfRrEIgjQB7miHkJ0+hUjVi0VF07fDlu4NkmT5KNXtHtmqPt6cfd66M1BHzmE9
 rmrhZW9IZ0F3sJWYussyajzvw3iNNiDzwV+RnmuuOGGxbCIOwq4s597U9pTelMNfn+xn
 BlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736164343; x=1736769143;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
 b=XlNVzRtjIym8vy5zSfkr8KY2hs21j+k2GbwzM4KDCdpzODC73Q8fr/miYcXNw7xyX8
 gTxlzbnyTD0h5i4sImqsH+MKqrLz7lY9MjEjHtA2DHoFe9Do+tK4zo59I2Vp+LNlh5c8
 NZg72NyBWaxjBvh1fcCCnCRFocrhT82F3kpuvJzOgkWJp5gNH6xGaWoMiNwNrNUhc4aK
 klnlHg4ci+BSMsxilWUKi6NQTkItJ5wRtYwYN4ndAsmEBufWAHe7rJe6cwNeOCVkMTRM
 jx56YnKCSYaGEep/ArZ2njXnL6Xu2hBV7MmXGpVHV0EPYh2pGaHTX0L2AtyZxXJzB3Kc
 3kcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXolcf7AT9GwLBjzEuKf5srSksAC+2BF/yTsY706glUIveWynb/alJFm7M5K+iAdMQC/9z8xta8ds8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQnER1FZZZIejSsshGx440Clhp+9aKMw8wme7ryEiylGv1kqaJ
 j7sO9Utr7Ce0JXk3y6VZ6/sAoY/g/ug+fBi+3Ch0F6Zs4jIcqQNNXwRZRsgWQS5RIIRTny80F0Y
 R
X-Gm-Gg: ASbGnctQqKNu2H1NdsB2F1C2aNb9aAzewhK5e+9WdHMr0HtKiCNWfR2GHQrL9rjOoog
 J06oFc5osaPe68kbCXYK7espmMEFPjwwldtz4cuFA5SO6IHBzajppMeeV0MVoyQoODP2WxnmDuo
 6yF1j7indlJ+2kpyVCvNoAT46rw27oKmKGPuvnauBhPFu0g2+9xOrYxOC+pZrKFWCFkf4niLkkr
 9ckTrlWGT3M/HON1pc0Q5ocLpPfN7Cvh8wRk903gy0OSR5+CVvseefo+4smOu84GQop6vUj
X-Google-Smtp-Source: AGHT+IGuPEKa7Y8wn+0uOc+1jJboUlCaDTd8y6XllLGlDHCj5Ga52ftDkrVG81dndBjt+D74ERoj/g==
X-Received: by 2002:a17:907:7e92:b0:aa6:a674:be3c with SMTP id
 a640c23a62f3a-aac2adb56d7mr2031661366b.5.1736153356335; 
 Mon, 06 Jan 2025 00:49:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:05 +0100
Subject: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lYvt5NktykrU4G4k710RiF9T2No7atg8/NYgEiARUDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kFeF66qxefqCkeKAcrKm6G/RWzKa1Lo5O6x
 9gKuZfWWj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBQAKCRDBN2bmhouD
 13A/EACCArEJHarifsC36OvyaQw2iWP5JpsdZKyCO79MFzugRGcxQEyzTiD76HWcoC2bprBXWcV
 mC0MtsPseAqH8bFRdpYIBGM7Y4Gf47s2G7MRykpCTKhr9LcSYj2IxGGsnGCziJG5v7T5iemwMAj
 uYvAFEnrvcS4mkVUxOzB6aJpEL+DbC3XXtRtx7rdH0/15gEPtcq11hJaxmzSeZ5QJPXnQEqc+Xb
 NBKKOsaO+nafD0HpK3UhrlpuSP8T6TNcuz3k1VO4RxYHAmUmcwYhChjpt/3IstlyS8RG79pNfXV
 jRYO9X2LnBPaa4QgNLk2FwUsKZyieP5oKqpc043UtKAyUrnqEP7JI3dvhnjt9AlgKKaDM410eO/
 wEAzzv67SOIy1MwMh5N68UjcjM6ukxTOnhHw/SUuGPs9LT958aaavKh6vWif7xZWbzWl154Td72
 qbm6cvOdJnltxlMSbzrw/R3OjcgUuwiSO92rmaFCXSPUUHgLmHyHxrpFwdHbCD/TYtki7Kuh00L
 EOAa5y4hs1Sth9fQ59nLsuEz4VEEG/HutyLPpsBNDuoxCdqFQs5R1ek7df1WcGBynYvKkOMpFJs
 QkIo8A83bTFKTMrh2plnrqA4ecPm+yTmDArVLXlrz1bvCXWrslhUr+1g52EsmMbbccfH/OO6Yj8
 W5cpQ0NNLsNjBUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

dsi_clk_init() and msm_dsi_host_init() are called only from platform
driver probe function, so using dev_err_probe is both appropriate and
beneficial:
 - Properly marks device deferred probe status,
 - Avoids dmesg flood on probe deferrals,
 - Already incorporates printing ERR value,
 - Shows device name (in contrast to pr_err()),
 - Makes code smaller and simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 86ac145076416fa7651d18820266a00d28e44b6f..4a2ad04eea7359545a088bdc63907f6b3e5615bd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -200,7 +200,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
-		pr_err("%s: cannot get interface clock\n", __func__);
+		dev_err_probe(dev, PTR_ERR(ahb_clk), "%s: cannot get interface clock\n",
+			      __func__);
 		goto exit;
 	}
 
@@ -208,13 +209,13 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ret = clk_prepare_enable(ahb_clk);
 	if (ret) {
-		pr_err("%s: unable to enable ahb_clk\n", __func__);
+		dev_err_probe(dev, ret, "%s: unable to enable ahb_clk\n", __func__);
 		goto runtime_put;
 	}
 
 	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
 	if (ret) {
-		pr_err("%s: Invalid version\n", __func__);
+		dev_err_probe(dev, ret, "%s: Invalid version\n", __func__);
 		goto disable_clks;
 	}
 
@@ -281,39 +282,31 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	msm_host->num_bus_clks = cfg->num_bus_clks;
 
 	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
-		goto exit;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Unable to get clocks\n");
 
 	/* get link and source clocks */
 	msm_host->byte_clk = msm_clk_get(pdev, "byte");
-	if (IS_ERR(msm_host->byte_clk)) {
-		ret = PTR_ERR(msm_host->byte_clk);
-		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->byte_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->byte_clk),
+				     "%s: can't find dsi_byte clock\n",
+				     __func__);
 
 	msm_host->pixel_clk = msm_clk_get(pdev, "pixel");
-	if (IS_ERR(msm_host->pixel_clk)) {
-		ret = PTR_ERR(msm_host->pixel_clk);
-		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->pixel_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->pixel_clk),
+				     "%s: can't find dsi_pixel clock\n",
+				     __func__);
 
 	msm_host->esc_clk = msm_clk_get(pdev, "core");
-	if (IS_ERR(msm_host->esc_clk)) {
-		ret = PTR_ERR(msm_host->esc_clk);
-		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->esc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->esc_clk),
+				     "%s: can't find dsi_esc clock\n",
+				     __func__);
 
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
-exit:
+
 	return ret;
 }
 
@@ -1879,31 +1872,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	msm_dsi->host = &msm_host->base;
 
 	ret = dsi_host_parse_dt(msm_host);
-	if (ret) {
-		pr_err("%s: failed to parse dt\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: failed to parse dt\n",
+				     __func__);
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
-	if (IS_ERR(msm_host->ctrl_base)) {
-		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		return PTR_ERR(msm_host->ctrl_base);
-	}
+	if (IS_ERR(msm_host->ctrl_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->ctrl_base),
+				     "%s: unable to map Dsi ctrl base\n", __func__);
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
-	if (!msm_host->cfg_hnd) {
-		pr_err("%s: get config failed\n", __func__);
-		return -EINVAL;
-	}
+	if (!msm_host->cfg_hnd)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "%s: get config failed\n", __func__);
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
-	if (msm_host->id < 0) {
-		pr_err("%s: unable to identify DSI host index\n", __func__);
-		return msm_host->id;
-	}
+	if (msm_host->id < 0)
+		return dev_err_probe(&pdev->dev, msm_host->id,
+				     "%s: unable to identify DSI host index\n",
+				     __func__);
 
 	/* fixup base address by io offset */
 	msm_host->ctrl_base += cfg->io_offset;
@@ -1915,10 +1905,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 
 	ret = dsi_clk_init(msm_host);
-	if (ret) {
-		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
@@ -1931,26 +1919,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	/* OPP table is optional */
 	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&pdev->dev, ret, "invalid OPP table in device tree\n");
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!msm_host->irq) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -EINVAL;
-	}
+	if (!msm_host->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get irq\n");
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
 			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ%u\n",
+				     msm_host->irq);
 
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);

-- 
2.43.0

