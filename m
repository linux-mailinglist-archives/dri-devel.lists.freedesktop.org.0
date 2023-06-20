Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FC7372F5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCE010E085;
	Tue, 20 Jun 2023 17:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BFE10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:33:20 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a03f54cba5so92791b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687282399; x=1689874399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uywTz2HjDvRs3bSDIsxko9mYKEgfSs8wTKl7lYuf5kM=;
 b=hi1M9o/ENWN0nNRLmDYKCz87i3dkzgfgEebX79F9k69jlQxqlk4LcDXbSLc12Vsc6p
 sbGM/sWGd1q5p2ZKmoQN+24i7PGJOBeAflK8Sp89lfgbo0pcKGplcy8O/ferQInvTAAl
 zu9t4jQ3vlvKz8bz6H0zQ9UvExcNKfKvtCSHl4EseRGaNTno0rJsuNzOJ3dMwK7+Ctzm
 8EA0zA7x/5VVC0e5j0cczPz8xD4CAUblz0C/pGD1Ibjmsf0ppcsuyeanx3w8rkkUEZ4g
 gbV0D1ix+1PjbDTyiDeYQdgbPQVbiRCsJwOlxf6Y0R3jXykaHhPhB0uiUjPy8OqFKyVi
 0pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282399; x=1689874399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uywTz2HjDvRs3bSDIsxko9mYKEgfSs8wTKl7lYuf5kM=;
 b=Zb7FqZXj2e+3Dq5puX66TuTE/VOFyT0LSxpKD9EGZpBxrJAbkmR6QwXhfAy/OQuJzb
 DafBmf6FGRKfvKrkm38AG4co6CW82j210c11etopLMQYt2JG4Plmk7R/P7RxtfUEVc9M
 S5tKYD5elH7btTDbOJXp7eaeOfLd+sGt6lH8AqT8y6/cjWCjSDnPRDSEErsywgo2HctZ
 BvtkMooE9EjhLGYu5C3PPIalvouwCLozxmEbX8oZxyoTQ79ObukBzppLVPQ6OKT/8e/s
 pHC4up/OPNZdsQvEAXaJ5eIHSYgfXAMA+RmTXeiDW+1ykq/ELvEngnhmHqzeAOokPNdj
 qz8g==
X-Gm-Message-State: AC+VfDxQ3/pURddjTQrQd+hsAGudyqC+OaqN6VK1+BBNd5Rk/OOLS/iW
 3UO6GhchonokChru0JYrObw=
X-Google-Smtp-Source: ACHHUZ4byoWYgxmehOrpJhH05zRnsXCphmto+2TSJq0+IoYCLCAm2ki8B2eMzI0LzAfi2NDyXcuYsw==
X-Received: by 2002:aca:bd54:0:b0:3a0:457f:4412 with SMTP id
 n81-20020acabd54000000b003a0457f4412mr655oif.5.1687282399309; 
 Tue, 20 Jun 2023 10:33:19 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 s203-20020acadbd4000000b00396050dca14sm1371204oig.28.2023.06.20.10.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:33:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 1/3] drm/msm/a3xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:33:03 -0300
Message-Id: <20230620173305.896438-1-festevam@gmail.com>
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
 dri-devel@lists.freedesktop.org
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

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index c86b377f6f0d..fc23810d7684 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -530,6 +530,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -558,6 +560,25 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
+	/*
+	 * We need to know the platform type before calling into adreno_gpu_init
+	 * so that the hw_apriv flag can be correctly set. Snoop into the info
+	 * and grab the revision number
+	 */
+	info = adreno_info(config->rev);
+	if (!info) {
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
 	/* if needed, allocate gmem: */
 	if (adreno_is_a330(adreno_gpu)) {
 		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
-- 
2.34.1

