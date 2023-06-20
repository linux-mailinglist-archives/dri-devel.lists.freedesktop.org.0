Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DE7372F7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37DF10E306;
	Tue, 20 Jun 2023 17:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B210E194
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:33:24 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1a9e88d21d4so1213868fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687282403; x=1689874403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESFewTyZPM1OZhlLkTTRzDuiv/Xt5eFtjuIGmwBh8EU=;
 b=VcNP8VPoeXjf8XzzY44xuIAy5XVftRzxUBSgwq4xXNKnyh2419rLqYC1+/Wap+LJSk
 QXAk4TsuMKdkintyweMt+tS6zHQ9DMQt6fXwqIYOvbQ6UbUIO8L60ilj6o/6dhylcMet
 tUUeXUZ108ZfMeecTioGnntMKiB2VIjDV2v1AokopJoAZvbb0Yu9VFdo2vdqXIlfd1HY
 82+3BsgNYV/GcP8doZz7iFs8lz+kdnxtkowYlRnL8D9NrirCWQ6KJLH29WDPy1S1WRrE
 dFAZcbBbBDUgRbxy3GmUdFXVXu6MCwC1vSgzWNCzajaOLhbgVNVK0LsQFhSyogy4gMW/
 pQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282403; x=1689874403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESFewTyZPM1OZhlLkTTRzDuiv/Xt5eFtjuIGmwBh8EU=;
 b=T1LubFfYUGxSIXL512kAeZW3E0QxLFTrCjbNJDoc9ShQebvXa55IsPG+VhQYsWtCDZ
 Z/pEWXw3o4rhCjF6Zamp5g8bGc9Hr9p/njBbvK/Outw8WhWHVhK2+EaN6bm2PQ1pkzCi
 0POO/Rh0prO3GB60uqzIZ5KvueYmwrRxA+YcfpdVS3LtqdAOCaDHRnizVjUC4R+TCGWo
 rsEJEb/I7mt/rLf9+m4Qh/RYQr+HX5Ow71r81du8fp71XhiFPSk1Q+d0aKdGAT2X+3sj
 iVQmuPJ4QkTCL1zuoCtHp5/uoJDbXHv1P9F+ZPtURRLLeZiR5X9fh9URKm+TdWQLkpKI
 p1FQ==
X-Gm-Message-State: AC+VfDyQkVqo4vvbh+Pl65wT8X6HU0ZdbofSjgQxzGstwyGuf6isqwd4
 tcLwEhxecN0LmZBTJPQ5iak=
X-Google-Smtp-Source: ACHHUZ6+UrC4TZhz6QGK2px+UHwY9GWTptXgVSILSEf+PDFxewEanXrVq0nv2OesI2usdYOBO9u2Zw==
X-Received: by 2002:aca:3405:0:b0:39e:ced8:8122 with SMTP id
 b5-20020aca3405000000b0039eced88122mr4697432oia.2.1687282403488; 
 Tue, 20 Jun 2023 10:33:23 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 s203-20020acadbd4000000b00396050dca14sm1371204oig.28.2023.06.20.10.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:33:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 3/3] drm/msm/a5xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:33:05 -0300
Message-Id: <20230620173305.896438-3-festevam@gmail.com>
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

