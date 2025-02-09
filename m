Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1CA2DAF0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CA110E476;
	Sun,  9 Feb 2025 05:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QCJgt/Tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E507210E481
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:03 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5440d5b30a8so3972252e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077622; x=1739682422; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3rGXodl7UY6Xisbn+xeFyyE0+oLCJlfYiSTPpiZkjaU=;
 b=QCJgt/Tb939yUUUHhxv5VnV5q+8LQDDnn1zI6EPq1RGkl+IXa3bDSIKJFRQ+iiJ00u
 ftDO+S694UtVXzVUrfi8GECvQGklU1k2S6HEEV7HROQ/R0A8rbGqIP2kFvfEvmIMzbUG
 sGm4mJKPUs6DRnelBOwtvjoh0w5DA26LOxbb+uQjigUE7ZqD/vJLiepehkRR0KV5LxUF
 E5mbmXtm0QoRT73fGwH2nMZkKKP6PtCnlwqvwNuUZfW88HBQLDtlROYRVGnj02A/0zK7
 d9896TaM5fG3Tut9iBW1U7Tt+MOzJGWY7O/Gi/nNU9vTk0hZOq9+YSdHQs0gupgjIfcb
 Hw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077622; x=1739682422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rGXodl7UY6Xisbn+xeFyyE0+oLCJlfYiSTPpiZkjaU=;
 b=mMoo5fBu/i3uH53bH2DDZw7fpzBAGyWxjUpTlZNYvIhDjOOJ4gmoFwmWmuGFhlQsQ0
 KsQKJncySlIjaCaqi+VS+JvHGdEWmp1tcwOuqTZ2RAOz4AOwbl/Pl54sTwO5KeSPKa2A
 Yan/8v0b6CSkrnFg2PicGw0N9hScAhmu0O7tT1Tr+MiH6EBFLggqIQwx7P3W1mwr1pQ3
 KN3dLxXT2wropxiRx5gpSet2UewJ7qYes7uU+TMa1zMgxX8NjfMHGheuR1vheJusQFBK
 JuTrD1A38tl+B9rOAqztfHce4QmmtqLSd82uDy6BxSIAlUmoVXEN0KfHteTqBVHkcEWI
 BAcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD88J1lvgGacmJPziiSDgqrx25JgdqJzrTX54COmDi3IZ96XmKqikwDNyR2+J5MnaxmQQ8om+POhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg6DFU6P28haLAeT3RSxYUWpaaXQZYPOuKeJx9QaUeqiN+edb4
 xkaBnec0rH1ubXC00oR72Nt0z9S8SuU4Z15q9yzy38dRBjWtglxyKFLDxFGgdRU=
X-Gm-Gg: ASbGncuj3ynvswSu4qiaynI29d17qaDDmbCNzjIYeOHk+KSHA3MhdtyY0lRgMXpesmr
 jF986I6x60mZjP/XoevqglCZUNhuUTlHf4jzHgG3hg4CQo+Wqy7l4q+NxJbDbl/aJQIxgQOlbtX
 D5Hzg3H6ueU09XRZcwzokSISvpxysy1bl9sG4cdgSszSSOIeN+DZ3vcXESkhncQydMQPWWLTwd3
 90VjLXYH5gvRc8+7tL0gv56NVrO12VVlTHzym1utWTahppvpowwRmrpCN4sknaE/UQCIplnKzQl
 8nVhZcCTjEsYpmHk7lMDGs4=
X-Google-Smtp-Source: AGHT+IECHEx5wXU3DMO4GB2MoLvqoEOcXJmE/ykw6Obq3xv/T+mDtoQLue2OeXH2anuyCE0mx+aqFQ==
X-Received: by 2002:a05:6512:3288:b0:545:5d:a5c3 with SMTP id
 2adb3069b0e04-545005da7eemr1544729e87.4.1739077622154; 
 Sat, 08 Feb 2025 21:07:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:51 +0200
Subject: [PATCH v4 07/16] drm/msm/hdmi: switch to clk_bulk API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-7-6224568ed87f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4477;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cNUywERI8hGQBw9l50SO0xvsuUis2RpMcSyOPQXrk1Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfirTeg+xg3ns1vJT9Om7aF9A1HlE9Ki2qvq
 Wcj5oDl6S+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1QwlCACPy8ChP+BZLQp5Xs97+XIJG4ERSgqmkT99waymkQsollnei9VfA03mFzmQJkW2a608nqr
 L5hf1Hocdm6VaP5m0DmgdQL1SSEIAvYNgKVI0226bwTODULT1WmwqVSbJs91U/BNxmAksLvZ1W9
 LCJ+NZR8NcpybuMAHMqSLaM/kOnySq6cz4sxXtHi6bmng0esJFC8qkTZoFxj6g9XbyMOPsm/r3S
 wuWZgR2/S7Iz8AEjzCQeGT0JegDCja7uP4kSz1sY2mV53hZuFrogOsq9Wdh/Ox9bsjirav/Z+Or
 1elUQHYLq/3ap0Jnsb8mgqSKXCqOm3AHtoGGePqGhVqz878w
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

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6f09920c58190a9c195de0407e4c2dcc3d58b30f..69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,17 +353,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e93d49d9e86936cb6c1f852a958398de2e134ad4..3f87535bcf43e20f0618d3016307fe1642d7baf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953f0ee6deea8a216bfa9d3616b09af..e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	u32 hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.5

