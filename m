Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C484E3A0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63A810E868;
	Thu,  8 Feb 2024 15:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GGLYL3jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4FA10E868
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:01:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5116ec49081so745204e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707404473; x=1708009273; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=micFdpjWEfE2iQhufUDk7TfjTaVtXdHcamWR3jJ5CU4=;
 b=GGLYL3jcZUlccATx4gqHS2cE+50zv+Cv3PYzD58wbGBkRRgwKpr5PKKJrjcERDSj8b
 KK3OZwsBbdeTDy18hk2O3RZZAS5NePyQYWGYDMrnfTQep74FzL/6aLBHdXthEnfwEAsU
 dg6psa72WTSQouly84meTMVxkZyvYdRopOk3tcE5gPxeM4E8iaQvbUV0uzJvhWZjGAmg
 L1muhq9kJOdnpOavcQdxyE4Q1w2CD99Gsf8yczkm39l9zuEkKusIEpyHSfltpSKMQUVF
 zWGTsG9FVs6TKUX9LtZQRObcTwEzm1HOncrRQ57JxKPikmia3r6gLOUJAcetimR3EHCF
 uHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707404473; x=1708009273;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=micFdpjWEfE2iQhufUDk7TfjTaVtXdHcamWR3jJ5CU4=;
 b=BxjHV1S0jayMvo9hYmcaOywm6dc1PwrkGYtNPqbVo6x4MR2BUJ9pcM00oVSzP31bxp
 ILBLBUN1h4RY5LYvz1qsHE8U7+bTDO8Dxbv3oRX3LBAp4m4vFVlz/B4GwcCD6kK1yKHY
 vJGnkvFTf1Zwnw+8i44ekdaSHw5FhN6s2D48rtDiRCOaNmUM5IIAPc2SctSZ7PJ/247U
 HsVq3Qac5S94EVhHG3/V2r2ibFHV0FwCDuypxJAp9QBWU7L+yqsm9vLsSCxHAdWmG886
 EBJ3q6Rl6B4w2Jqm+jB3yXpmj/j4rJM828NpbqhN/DrBBqcBqT1bgLUKny2Aq3ffEp9f
 1N4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmm4SgILj0Hps3tXyGnSgMkQ7xwmJnKr/7Gk95OfYqDV/fLhmyK823jKpYxwO+/fokd7w6fMueeozyGDywlIR9OR0hRrN1a9rGvgKZjec/
X-Gm-Message-State: AOJu0YwRX/6F1a3/K23EDuPIUl/DlAudcTQ2I2iL5k1Bfd3wPxZNwnFz
 5GKoyUjCDepaooxG/+gfwcRQDylGjrSxaj/RaNsbN6IraTFUVTl+4xzX6mpM9jE=
X-Google-Smtp-Source: AGHT+IEKxPQuiTEdGhUliODLyt4bKlkDiajbJE1Yhvua8o8q9WNLMvK1bFBsNZmn04FP0yj1fhvsgA==
X-Received: by 2002:a05:6512:3e21:b0:511:60ba:a02e with SMTP id
 i33-20020a0565123e2100b0051160baa02emr6791569lfv.40.1707404472753; 
 Thu, 08 Feb 2024 07:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUWfyO+YUwrNmX5OGaP+HqleZPdYsG04Ds7ao0CeWN16bbHuQt3u+aO+Zw/SCkAHi6YQHBMr6BF3JbiHNQrsPzMKJTTshL+0u4rDBRdYPtnL5efQBnazgpDhCExpUH7BigN16hrMXoeJjzsCOdHqucZuF2AxCXJPtfSu1/5rBwDxYGLtynw47Sb/EOFtiYER6Lps3TUjHoFnG6NPvUcd3l+DEyPVgyj+sppMkIJhUvWmahWsfimK/UTiTsJ4B+ESdfz4GCNNo5b+ey5XcpQr8QposgPycipvMd7yUeTqydglqcbgGqqmr4Yu3EEgTw8ODw2ygMHISmyM3Ek2uWyVRI/GfOYzaD7gBcqtX4yerpcH9wx3GPibsCq05J94ceEj7v9XT4suzx4BFx
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x18-20020a19f612000000b00511498107b8sm22444lfe.65.2024.02.08.07.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:01:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:01:10 +0200
Subject: [PATCH v4 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd-migrate-mdp5-v4-3-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>, Carl Vanderlip <quic_carlv@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3850;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l8WXS3ws5bU0POmatEizYV75CbeDLs5zSep1gpGQJz8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOy1s+We5gpCU3SazjAx5Xh8bF6Dy+O/eQgD0
 CopwZ+OHzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTstQAKCRCLPIo+Aiko
 1Ua4CACsjd27gTUByFMcUJ8n8OTcCFjUb9uZPstAvEqrs4SpLWihGrO1a1tObcml0Qo0mARRxzn
 9Y5ZAIPnolxR0/LzVuQFe1ZA5fpzqUFAi48/aEOBi4PGj/1zGLygX8lNDsp0g07A6F9FLElvxVa
 Cmjk3LLvkLezQEDGkLqQ9w+EQDwdY216C5ee/rU8HyA16vpgBAnTIVvMmcBV7t4qPGdFF7pG8rU
 5o27SeeQTPBMcSAg+16wcIrmPgaDnpVMNcYBRH/ZtEZihdP4hpAYWIuEBmgjYtE5czLunKUW/Pk
 HZFC70zd/MT0triJoZnBYu5TBE1smnpHfqFiYwZUdK4vyIRU
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

For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
possible to support this platform via the DPU driver (e.g. to provide
support for DP, multirect, etc). Add a modparam to be able to switch
between these two drivers.

All platforms supported by both drivers are by default handled by the
MDP5 driver. To let them be handled by the DPU driver pass the
`msm.prefer_mdp5=false` kernel param.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5de1861f608e..4fab3544e4f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1276,6 +1276,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
 	int irq;
 	int ret = 0;
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0827634664ae..43d05851c54d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -866,6 +866,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 50b65ffc24b1..f79134fc6cc0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
 	return 0;
 }
 
+#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+#else
+
+static bool prefer_mdp5 = true;
+MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
+module_param(prefer_mdp5, bool, 0444);
+
+/* list all platforms supported by both mdp5 and dpu drivers */
+static const char *const msm_mdp5_dpu_migration[] = {
+	NULL,
+};
+
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If it is not an MDP5 device, do not try MDP5 driver */
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
+		return dpu_driver;
+
+	/* If it is not in the migration list, use MDP5 */
+	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
+		return !dpu_driver;
+
+	return prefer_mdp5 ? !dpu_driver : dpu_driver;
+}
+#endif
+
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 01e783130054..762e13e2df74 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -563,5 +563,6 @@ int msm_drv_probe(struct device *dev,
 	struct msm_kms *kms);
 void msm_kms_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */

-- 
2.39.2

