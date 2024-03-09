Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC98771CF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 16:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048FC11213B;
	Sat,  9 Mar 2024 15:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iksRSDwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ED310E39C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 15:09:11 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso22103021fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996950; x=1710601750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R79kFi5q6h2xuMcDgiL3xD0MGpR9aHNwztoW/ysGcfk=;
 b=iksRSDwRDSH+dO21FikY/oyt9EMTEe6z2h0+ljz1XvwF6x1VvwUtP4d+qiN5ZE/qxB
 opjEo+HqnHvbwdooQo0o9ADj/Mm3L32twVA5PEB4mxum3s34uBW3rBJ4ZYfNzvQnOQIN
 DCD72Y6kqWaLZiwbyrvUdiL9/bn/8//PdkE7CPFhCjWE3HuBiBgiJrYebS/MPiEDGFPZ
 hJwt09UqgtygVY+CNBal1S271evyaiUJTMykIwHj8xVRskq0HHRJHwvntzjiZ5r4e6vV
 B3+oZZdU+Ymv6MnMbx632lDgRwgKcXlgTz43SNqtgCTeZxwRLmRp2HTGDCZTK6XsGrP0
 P2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996950; x=1710601750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R79kFi5q6h2xuMcDgiL3xD0MGpR9aHNwztoW/ysGcfk=;
 b=d+DF3RhnguLmEOBFxGwPzJtW7QHoszdF0R7768AjLBo1n+neCu0lVZEvZiuujIuVCT
 yz9N26/wb5yC0QW7R7nSEJSUT0qfL0dygQpUTKprsWwKffQWVxpCMggNmAmfJwn/glEo
 FSrBl0K8S5k7Z6das0HW9yOVEJOSRhlM79lvFNCa/VmtbHqaAFHcevIG5EF0kUhfLYHG
 goVNs50lxWxRNIZkdV5mMUUkp9DJ6dSR1Y5BLwPbvj6+aCJmh1uNPCwyldzDSSO6eWJC
 rJEasoVXJKunr+ILz1EOeSSN0U7SnLvSa8stro9JN5935c7H0UgKDq5ZnHu4XRC0Q67e
 Edyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqoI+wxeZek4TPiBq0okk0teWHYxylr7Gi4YjrfIRmtM7bCjFjh3adXbs30ZKOXP043vWJEEFigfrw8yR0VVkXQXWCpH9vXgOJY6t7EYje
X-Gm-Message-State: AOJu0Yy8LvvF0VpuBA7fz3aLxih7pRCdJhYcxTsAp0//e06GI0ZQyAnj
 Vpd0sE5ZA4b1MsLGLFCWeqAOf1JDRsBUwzqZeQX4obKcQiV+win47YYUblskSZw=
X-Google-Smtp-Source: AGHT+IF10RdRaEvCv2MBr+YeGRYtPmBijFVM+6qaB/W22c/QZiNOF6sehdHZcf/RnA+ICJGFiv516g==
X-Received: by 2002:a05:651c:218:b0:2d4:31cc:87d7 with SMTP id
 y24-20020a05651c021800b002d431cc87d7mr108841ljn.28.1709996949687; 
 Sat, 09 Mar 2024 07:09:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:09:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:06 +0200
Subject: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2851;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OYTBWb/J609udo4PjWcZWo+dNYpRZDjaYBzF/KuEgrE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSPV7ttgcma4S2K4UnNqtxQz1m7V6TPk4Nd
 Brshdy3BfeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1Y8PB/4ju7I8KPNnBZAuwfztOn6XPapfqb0/O+pAbLVoCzMKZGRHsHZdSpt0mFYzzVoMrfrHOhE
 XrVazcgFuVv7Xrq9QIB7B8NHvDsR2qHObpSNe24vRNcSHuFWardbaco+YEXWsRniWzafJby1lA7
 9JM1bFtUzUQQxr/4RmOuL+JdFnzj7kXfl8rXpz1A7lL3aVhrPvUybcGY9euo6bcDvkbRaXDAYgI
 asJKK743VLnRLx7Fhxcz5aOtjr7Rc1J050h8uwksdHVYy/7CHUxcbS+8kqFUsFRRKjMVy9VHlEa
 hmECpG/9TM1ql1DOrj+EW+MQK1zYYvkvGoX2sT7EnM1ELAfg
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

Currently the MSM DSI driver looks for the next bridge during
msm_dsi_modeset_init(). If the bridge is not registered at that point,
this might result in -EPROBE_DEFER, which can be problematic that late
during the device probe process. Move next bridge acquisition to the
dsi_bind state so that probe deferral is returned as early as possible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 37c4c07005fe..38f10f7a10d3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -120,6 +120,22 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
+	/*
+	 * Next bridge doesn't exist for the secondary DSI host in a bonded
+	 * pair.
+	 */
+	if (!msm_dsi_is_bonded_dsi(msm_dsi) ||
+	    msm_dsi_is_master_dsi(msm_dsi)) {
+		struct drm_bridge *ext_bridge;
+
+		ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
+						    msm_dsi->pdev->dev.of_node, 1, 0);
+		if (IS_ERR(ext_bridge))
+			return PTR_ERR(ext_bridge);
+
+		msm_dsi->next_bridge = ext_bridge;
+	}
+
 	priv->dsi[msm_dsi->id] = msm_dsi;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2ad9a842c678..0adef65be1de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -38,6 +38,8 @@ struct msm_dsi {
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
+	struct drm_bridge *next_bridge;
+
 	struct device *phy_dev;
 	bool phy_enabled;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a7c7f85b73e4..b7c52b14c790 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -464,18 +464,12 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
-	struct drm_bridge *ext_bridge;
 	struct drm_connector *connector;
 	int ret;
 
-	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
-					    msm_dsi->pdev->dev.of_node, 1, 0);
-	if (IS_ERR(ext_bridge))
-		return PTR_ERR(ext_bridge);
-
 	encoder = int_bridge->encoder;
 
-	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
+	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
 			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;

-- 
2.39.2

