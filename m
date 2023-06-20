Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C065A736FA3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 17:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE7010E2F9;
	Tue, 20 Jun 2023 15:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D27F10E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:01:00 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1a2cc92f12aso1452986fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687273258; x=1689865258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2TwRd2GRGSNMmbo2rxLkYsNhLNVo9AqAACxO9Eh6CAQ=;
 b=msM/Zf8PtGr7U8Vzlq9oAn+oj7azi4iiVyN4a7DNi6UvBmtFR4jqxXwGuin8zNwqnt
 S0gqNQuWrGLeOKdPiKPcHnHdFL5xyCMbrdMYd4QxRY5S3HDwK5bCp6IAs19AOCELwQTG
 DS3scJGEzFslTVGsYwK2386bv3WLJRgudChwldqz6OWelAjKdcQlDN15ooRveR/ZBUJN
 G02a8hF1wsEMwmgX1f6p3TnU7PwrTYZOo3dhc8ZtYfvTySIUq2QycXllICGsGwmAl6UZ
 Fxg/XefjGna8viYlOwA0M0B65FFd5KAHOBG8daqX0zDcSGXlk5H0gpqrkWBwilnNF8MP
 GGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687273258; x=1689865258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2TwRd2GRGSNMmbo2rxLkYsNhLNVo9AqAACxO9Eh6CAQ=;
 b=DA825bqIblg4H6vGAe29b36mGx8PnTO52Yo6HsAu3fJMdF40tE4AziCwP4s+xfc474
 ui1H6tK48ejG66ATDhrL9eKJIWCQndbDTRZL8vPP7bkykcrGf163kWUljILuRLjTh/Ui
 /rm4lS22lNBb6ehaZrCL+026TWvqFEEXZwkDBGx0GkF7CY/qBK8zYcEeqp9Tv5zwoSv7
 MZGrpZX1h5A3WKSQXYUoYSA0ZH6RGGCpfJqs59eP9GuePn2MihrFu+y+V856V1RA7BY4
 PEITAl1ChZ5WrVfMkSUBCtkWW2R8tF2966IkeGK3sQBiaW42LGPZYwzwWbxWPKZclZOA
 +x/g==
X-Gm-Message-State: AC+VfDxHvrM4wmf1TRYrMSvYkTqGQKDGELG43loIYYKx2BOu/Ky6L7nK
 jJaL3/BJ2Av3e2J5UHxRScFRjIa5yek=
X-Google-Smtp-Source: ACHHUZ6HJEZDCl6PhbEuWAltRtId8Zf9+3xEzfmJ5IDpiVNfW2LfZqrKHr2gGepUTleOFKtu6I9a2w==
X-Received: by 2002:a05:6870:3324:b0:1a0:78d4:ab6 with SMTP id
 x36-20020a056870332400b001a078d40ab6mr12151908oae.3.1687273258554; 
 Tue, 20 Jun 2023 08:00:58 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:352b:7d18:ddaa:cf28])
 by smtp.gmail.com with ESMTPSA id
 kv6-20020a056870fb8600b001a9eb707366sm1430087oab.15.2023.06.20.08.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 08:00:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/a2xx: Pass the revision information
Date: Tue, 20 Jun 2023 12:00:51 -0300
Message-Id: <20230620150051.873909-1-festevam@gmail.com>
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

Since commit cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
before being set") the following run-time warning is observed:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/msm/adreno/adreno_gpu.h:171 a2xx_gpu_init+0x138/0x184
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-rc7-next-20230620 #993

Fix the problem by assigning the GPU revision fields like it is
done in a6xx_gpu.

Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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

