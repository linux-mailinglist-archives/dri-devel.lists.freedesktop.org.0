Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C16737336
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB8610E067;
	Tue, 20 Jun 2023 17:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E2910E31D;
 Tue, 20 Jun 2023 17:49:35 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b454bc4d6fso406479a34.1; 
 Tue, 20 Jun 2023 10:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687283375; x=1689875375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6yg/UXXCTS23FtiZhzKJT6LicQlX76xtAqA3HUyO/Y=;
 b=oYIh/xreAC67lnF013+BBxFXULxrGnlYWOp6bOA2fEs14dq3GXQWA9tHqzyUoE17FH
 TBf66ma6VLOPMALj4WHvWJjsToHlR8BMbQFTsNFtSuJwLUVysnTW43rivBfU19AhwW21
 SWLeb/vHOpuWO3DS2PSuQ63IzZwzRZH5Uca5g69rABANBs4WJcdY+6l40sj0PAJwslFi
 4b8iBga/WWYsj4ZX4bJZjCt2ZqCkP2qw5tEIn0BD6760T4aBUqczHwyppCzvp0ZwS+5Q
 bMtef0RBJ8hyA+VKi5320YAukU4Wstd+3uavmkQELqYPfeiA7+38SZQr9UnQY6iZLx8z
 K0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687283375; x=1689875375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6yg/UXXCTS23FtiZhzKJT6LicQlX76xtAqA3HUyO/Y=;
 b=khmdhJ0PBmbHQNpuDw2bFHZSWyrRYMxlgu3eoG1/fCI9zd7lh9r0XLvI69J0gRHdnx
 asC8dLy+FaErk+N0t7ecHzczH4SU+Drujsyi7lOfz3E9wvy8vFvxoMntTAuphow6jSq4
 BCKIoUobF9bnxy1GoeZ+XkG9oNMOnz2iBAtqo+SPEJhFqFCvk4p/gl/Pe5FL5IYHbtn1
 RWvc03JWpEZ6FYrvi3kloK/2HkytGXJRRYbt4vgPYDwAbYh/BdLEpiPvZ1AJIAJjeo4E
 WdOZ6ah6oTty+oNXM2KrRsqoZxDyc8BEKsCGm+lSjaQe1zyDu73g9tdleZd6tsdC+kNk
 XDzg==
X-Gm-Message-State: AC+VfDwA4wtfMp2/DWVWwf7T8e2EKOfccfdCvf9bVhhBrn50sq8325j3
 i1+yrdQxuR0An5sWmnQzjS4=
X-Google-Smtp-Source: ACHHUZ4jcLaDExhYzfOI1CbsqKjXXPVUdobLo/LGSCqkmcVglCZ9O70lwlLPfChrmk19JriV2A7qjw==
X-Received: by 2002:a05:6830:19c1:b0:6b1:6db4:556f with SMTP id
 p1-20020a05683019c100b006b16db4556fmr7375023otp.3.1687283374819; 
 Tue, 20 Jun 2023 10:49:34 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a9d7cd5000000b006a44338c8efsm1154892otn.44.2023.06.20.10.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:49:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 4/4] drm/msm/a5xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:49:21 -0300
Message-Id: <20230620174921.898275-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620174921.898275-1-festevam@gmail.com>
References: <20230620174921.898275-1-festevam@gmail.com>
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
prior to using the adreno_is_xxx() functions.

Pass the GPU revision information to avoid run-time warning.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Build-tested only.

Changes since v1:
- None

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a99310b68793..b4c1720ba89c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1744,6 +1744,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1770,6 +1771,23 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	nr_rings = 4;
 
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
 	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
 		nr_rings = 1;
 
-- 
2.34.1

