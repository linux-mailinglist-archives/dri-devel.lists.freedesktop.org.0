Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78F907962
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A3510EB47;
	Thu, 13 Jun 2024 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XRny4edm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AD610EB42
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:15 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52bc121fb1eso1753779e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298311; x=1718903111; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=riizenq3L8DXhy6NcFp3E1fNog5NOwudZRa/v8cMvOY=;
 b=XRny4edmBxo0Nbwzg7HLAzzmHa947mBopWut7IfXc6+8kPJKpI8y4+MCDoUSgRohid
 u+/6URvyQuk4nup5KwHMzYSH6LXrboqCG3PfXFfutWySAefeXFv/yGwpFfS7lNC6Z5ui
 zw48ObAs1mD9CT0S7+wvex0ojAAVuCgYt+vhBtH04PkF5Og+Lk9jnNt0l+9KgDbsMtdR
 XrJCEYniPLH91chqx32wtjETlvUu8n2ns9+Rzq2xdJ7JGEqzdPv5IkStmkgwS+SWEjPs
 2xq+Ugm0wBYgpqHG68cF626DvLJs2FAv1X5M4AeWUhL7o8Z9e/5q9GFEbzzteDR1pouf
 Y2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298311; x=1718903111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riizenq3L8DXhy6NcFp3E1fNog5NOwudZRa/v8cMvOY=;
 b=G4FpXWrH13iGNt+fG6GPm2CB1RwGcIOcKO6I3PXmlGdSjOFM21iEXzJxsqWY/OVNXY
 3Wu8AhAo43I2tENyBIvxa5FTBvbJt4Nq30ZtdN3F0SbvuryDZ4JbliJGnAQvjRjdUFu/
 JmkppDBZ0zy8v3eo5tX7/fN2iZD775XhBZyO3Lm+gn7ZfEM/t81543q/9e/TOAMg6GRr
 4HmEjirLL+CsxEHNZTMIp5+bWRvx6QXypngO+ySScfSjtr8DqIZA2FoVwG58MPayy8A0
 GOAQdyCFr+YRCk4Czs7FEyIm+kRn7TOBKdUmbBsS1upg3pjcce7F3lE7iwE3TxrRWIAP
 i3ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUspuCfE4AVdFBzhWnJnA3zO4hE15T8dcw5Sf3lhaOghOxU972bDiFD1H/NwNzcQ90Wf2Hrn9rivo70r3bWZQyO5fGVT5aFvajTy5+NIz79
X-Gm-Message-State: AOJu0YylykIaE27NFaz/wOqudhzrNtHqtmieQX11JUO3mYxZ4fvOJitK
 blyiO8FsarOZbcER6cYK2OaQveMrXfVuQ88KngkS/fSpbt7dsijhkOIEklD/eEA=
X-Google-Smtp-Source: AGHT+IGf02+SM4/sdJmC/eEG5H+J63h6e/5s84OXjM0q6E/nqPnNJNsTbstfAFOasBEHe8VYopvujw==
X-Received: by 2002:a05:6512:402:b0:51d:4595:3527 with SMTP id
 2adb3069b0e04-52ca6e99c90mr204031e87.61.1718298311298; 
 Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:09 +0300
Subject: [PATCH v2 6/8] drm/msm/dsi: parse vsync source from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-6-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDZH3Se3yEXeok1v+4xcgwo8ckhAiicjF4WPwysF+hY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybB2LKaRw9mB+qJ3Wcyy+ofJN/TyAW6ZOgMG
 +BEZKGyyn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1RvtB/4lo66prEsmuaIsbxhLnN5kdIup7X3NKwqkkVugXSxRS3KGlGbjuMRWGlC9PnUCnI6+AWa
 opaaFF+z3OoCPe9e1j/YhneHyHRoAWKpkQ88893u3CkGgvLXTfV/jhP1qjB/ZqUKrtN63lD2Ja7
 ZmPU+Cpg0mAIBiC3psYh5K9u9crLtO6dLT6MYTACjXoui443ZpVZHqanmFiF7ARAihHvcjf/zRM
 U23qB0Nx3lQD25w2l0BPYT0ncHtyWVPa3oP/dkGxkoWuO0A1FN33z8/0tuRLQbBACJkJAskIzpW
 xUSW968YgQcYVAaXkgiQ/bpUQy8ZXQrac4NjraKf7QyzXHWL
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

Allow board's device tree to specify the vsync source (aka TE source).
If the property is omitted, the display controller driver will use the
default setting.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 +++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 +++++
 drivers/gpu/drm/msm/msm_drv.h         |  6 ++++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index afc290408ba4..87496db203d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -37,6 +37,7 @@ struct msm_dsi {
 
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
+	const char *te_source;
 
 	struct drm_bridge *next_bridge;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c4d72562c95a..c26ad0fed54d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1786,9 +1786,11 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
+	struct msm_dsi *msm_dsi = platform_get_drvdata(msm_host->pdev);
 	struct device *dev = &msm_host->pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *endpoint;
+	const char *te_source;
 	int ret = 0;
 
 	/*
@@ -1811,6 +1813,15 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		goto err;
 	}
 
+	ret = of_property_read_string(endpoint, "qcom,te-source", &te_source);
+	if (ret && ret != -EINVAL) {
+		DRM_DEV_ERROR(dev, "%s: invalid TE source configuration %d\n",
+			__func__, ret);
+		goto err;
+	}
+	if (!ret)
+		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
+
 	if (of_property_read_bool(np, "syscon-sfpb")) {
 		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
 					"syscon-sfpb");
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 5b3f3068fd92..a210b7c9e5ca 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -603,3 +603,8 @@ bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return IS_MASTER_DSI_LINK(msm_dsi->id);
 }
+
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return msm_dsi->te_source;
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 912ebaa5df84..afd98dffea99 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -330,6 +330,7 @@ bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,6 +368,11 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 {
 	return NULL;
 }
+
+static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP

-- 
2.39.2

