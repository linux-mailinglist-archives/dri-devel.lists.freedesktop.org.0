Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0667372F6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D45C10E194;
	Tue, 20 Jun 2023 17:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9475810E194
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:33:22 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a03f54cba5so92796b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687282401; x=1689874401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LYx2BSXmVkjhZKtbosHsNtICM/Opn8luT2i4ms3lVuQ=;
 b=ja1DK+EfVsFLBQonaalHtAvwANSaQo7GYkXNpWbaSp0cRkGtqE79TfQNLI2MYjDCU1
 C49wf3kiE3h0PGyAFglTnKy6qVmYa7shr3ckIaguet+eS2nlEfHYKZlc8duHzk8pZNfo
 iZcVcJKgSRBwRNuCfzCazYBPb+5vsV34CjX2GBOWaBTLTwSHT5/eGeZYST4RiFNT2/Bn
 to8Hus9JQDDWXjHmv4YoPvwAirWpBoXqlQpna7uy+bAftL/zMHsJDFk/HvWiHgYMemQe
 IuctYl5ZxfomNtQF3YvGZ5gfvGqGvdBiu7CcLE9q9wjluTenOOROSJ7f7aAz5sZ7purv
 16TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282401; x=1689874401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYx2BSXmVkjhZKtbosHsNtICM/Opn8luT2i4ms3lVuQ=;
 b=VDa/g+aE/a7wyd2eB4+hlarhCMVred2u7+k8B7pIwFRxsh4XFFh/S69L04HmjDRZQk
 e8Xwh2rS2Se772dZAbKdLjjnZ00x3Hig+5RmHwwvz0Y/HTLmiRNfBmGKvsqL/BSuK9Zn
 QhCgb9f3gBtlDntlFSEFLYw0GPVAa+j44pKe0KfIcp4DxHva1v1R0PFCxDYL0XcHM9SP
 N08C18APAP8GRlOJ4xXdC6uBNfyLAHKBwJii+HRPL+4NHjBN2Fkj5aYK8ukbNR+HBUcm
 i72p9nmIbWXIi6Y0/Et8wgBDbNoYEF5qZloeYovPMO89JxqGjxJUV/JsLVvTQlYC6pay
 CHmg==
X-Gm-Message-State: AC+VfDyblJLoEf3XaPapmtNojSThAsEIc83pdUCzELHmKcFAQ8BNi0Uo
 JBf14WwhYjBKPMQYS5aS2jo=
X-Google-Smtp-Source: ACHHUZ57FL4mMM0ztUiGNzKWrvnIdmSDpZqx10Yh86FtF4X+2axMNl2MqjFENJ9Bah4CWF2BSpFFkg==
X-Received: by 2002:aca:f243:0:b0:39a:b2f4:b60f with SMTP id
 q64-20020acaf243000000b0039ab2f4b60fmr3040845oih.0.1687282401397; 
 Tue, 20 Jun 2023 10:33:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 s203-20020acadbd4000000b00396050dca14sm1371204oig.28.2023.06.20.10.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:33:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 2/3] drm/msm/43xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:33:04 -0300
Message-Id: <20230620173305.896438-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620173305.896438-1-festevam@gmail.com>
References: <20230620173305.896438-1-festevam@gmail.com>
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

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 715436cb3996..2ae072b4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -658,6 +658,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -684,6 +686,25 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
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
 	adreno_gpu->registers = adreno_is_a405(adreno_gpu) ? a405_registers :
 							     a4xx_registers;
 
-- 
2.34.1

