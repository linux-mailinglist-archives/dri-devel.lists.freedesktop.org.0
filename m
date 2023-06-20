Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845D737330
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298510E0F7;
	Tue, 20 Jun 2023 17:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005BF10E067;
 Tue, 20 Jun 2023 17:49:29 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b454bc4d6fso406458a34.1; 
 Tue, 20 Jun 2023 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687283367; x=1689875367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aJ6CZE64zC4plyjT4PC0vLkEHuqwnIwxtFdAS1CGai4=;
 b=VOZFv8N3ln0oI40BxkWJn5cUjUR7oWntFaRDntIpYFFxsXNhI0ssi4ibP9yZTzJhXV
 /w+0o4XGPeyJOnJ+uWh0IumyCDc2bn0FITREsTaN8LCpPi1TAMNuEEeSu4ISSfvMsA8x
 DSG9ZPY2t4v3UwG6Y0u1Lu7dOVkCLS6wummhvV8xrxK/y2hkvBVpDe2O9fMcRmtCrMka
 KO2m34vrSGH+qoFBUOIYfQMhr8Tq22C3IpBCOYNG0y3gulaFmDtwS8oWL4mejQbl2bxd
 2397M9QWRU6KgsGwEPASfgdMwgvJxMaVEFOCEQjUwuG/MkSBJ4a8cPJuKTzEcKKb4A3i
 I7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687283367; x=1689875367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJ6CZE64zC4plyjT4PC0vLkEHuqwnIwxtFdAS1CGai4=;
 b=bgH0j978TwLT2pTvVDuQSS02dJOK+rZ7qWzmCYXaTQr/G0HDj9yGWAtt2SlsK4IXAi
 ve/4wDZp0BjXerGEYE6jnvIm9MyOF7QcNnB0aIeqwxKXR8zxSGI5KXq+D+ibu3XozavZ
 KP/g9XOgsBx17lQktBdY25UvlrIcKEqlYrQqsrCPDcRw7FILbjVSg3WKcZDixp7ogyL7
 nltXT8di278zgzirx3T072eerNNOh+G1KC8oEBqpo3SOLt+A83tEAVnMzTCIg6GZ41M3
 jV/w2zpLCwOXVNrG1/dO6xAqw1s/JdvVnFMnMc0/kSQCgUAWCwTZR1+EPKxB2s+2CFgu
 Apxg==
X-Gm-Message-State: AC+VfDxEI6z00r1D62CJQYo7j5acvamE1hPQNsabY2GuXbzSsrb/T+uz
 x2RK174O2M/iPtKy1O/RcCk=
X-Google-Smtp-Source: ACHHUZ4JC2IIZ7msLVwq9F9DQky2gH+eXg2I73oNqV9RlqHdUdSjPeP3IY8eLcBcF2H1JNc3P0J+rg==
X-Received: by 2002:a9d:64cc:0:b0:6b4:26c5:7eab with SMTP id
 n12-20020a9d64cc000000b006b426c57eabmr9010686otl.2.1687283367632; 
 Tue, 20 Jun 2023 10:49:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a9d7cd5000000b006a44338c8efsm1154892otn.44.2023.06.20.10.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:49:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 1/4] drm/msm/a2xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:49:18 -0300
Message-Id: <20230620174921.898275-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dmitry.baryshkov@linaro.org, Fabio Estevam <festevam@denx.de>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Commit cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
before being set") exposes the need of setting the GPU revision fields
prior to using the adreno_is_xxx() functions:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/msm/adreno/adreno_gpu.h:171 a2xx_gpu_init+0x138/0x184
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-rc7-next-20230620 #993

Pass the GPU revision information to avoid run-time warning.

Tested on a imx53-qsb board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Make it part of a single patch series.

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..4e1218462a23 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -520,6 +520,8 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	int ret;
 
 	if (!pdev) {
@@ -540,6 +542,23 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = perfcntrs;
 	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
 
+	/*
+	 * We need to know the platform type before calling into adreno_gpu_init
+	 * so that the hw_apriv flag can be correctly set. Snoop into the info
+	 * and grab the revision number
+	 */
+	info = adreno_info(config->rev);
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
 	if (adreno_is_a20x(adreno_gpu))
 		adreno_gpu->registers = a200_registers;
 	else if (adreno_is_a225(adreno_gpu))
-- 
2.34.1

