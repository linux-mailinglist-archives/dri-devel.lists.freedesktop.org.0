Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC998AB8BB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4710F0AE;
	Sat, 20 Apr 2024 02:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E1BYiWNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57E210F057
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:33:06 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2da01cb187cso45985771fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580385; x=1714185185; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qDk5fHKqnh3Ymuh3Yv85wCMuAKGtkk4BBfWgOawHww4=;
 b=E1BYiWNcvJz2AoZ/c2UOQpd3YVoi9K2cJbFw01Q/ll8fG1BJ4UzuACJgEhe5rFRWs4
 ZvjyyTB3tmzvTgR7ChDnZOzKCYRDAqDdPqy+iTIAs6HpizsEshZuNUIIzbomcDaUP25a
 XmBPRKVtelEahTXAC0w5TqeIL1jMf5SUuerP4D0f64zu6zywqJESXA8iVmW6E9+/rPCQ
 l7b4OKkLSr/DfBhnAnLfxJLmY0K/V8jwDFgNiHK68bIwh6+NktLF+n1kTBVP5kzOy7cM
 QAE4dM+C0MjDecLl8MhnD4UwpAedsmqwxulAELrhys5Atp9sTsnGkduIExDBMsixeI2A
 fbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580385; x=1714185185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDk5fHKqnh3Ymuh3Yv85wCMuAKGtkk4BBfWgOawHww4=;
 b=APNw2ahLmg9I2ilbNYlAsCGq7iAveqG9xKjGFICGAKeDRhJ+s0ni6Ah1/1yVsJ/1Nk
 aGDjzx5hiZxEfxgCgPOxp7vs7au0nH/exxy5uxwRPI56vMZ5tKy720+mq/QDSL5PyIXR
 vKr9eSS4Swbb5e60bmg2a5fUwagr0WBxnxqjz9FOrajpjkIGTo3dCFcXGsazyCGKFjZH
 4gPfRzQRT2E6g5Slzd8P6eHKH6ezsEiRjk0eLMJZGKX1Am1VQBaAFmLACUvMdjGv3iLQ
 Q8oWeaFElyvqBNsyt9pDadYIuuMsPLxoCdGxs7dL6ySZaAycPO72tyrmPA0rY1TCiijz
 xwwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQgA8wnDGMVaH4loFLGjqP7QMVbQseUbKrAmEsAAs6MMkByfbiP9OUjaWlJzJvii7rbislHUIu1pJ5mI9ToQal+Asce/XeFoHxL0I3Ii3C
X-Gm-Message-State: AOJu0YxFK2ZEzdrFZ0OtcZ76dC48kNFKd/p1bUhP/l+zWbyaeW7jHW9H
 4uT868w9S0w11iKsehU/jpA+LT7+27aokv84grNKgy9LXDzAxiDTJKGNeWXud2o=
X-Google-Smtp-Source: AGHT+IGFYxHPEv2nSz87/BQG1vu5Ypasi44ZiSz0Hd7YZdpw3Mv7a1b7WxKcr9RE6G9H+Hjktfr6oQ==
X-Received: by 2002:a2e:b0f8:0:b0:2d4:6a34:97bf with SMTP id
 h24-20020a2eb0f8000000b002d46a3497bfmr2467906ljl.49.1713580384898; 
 Fri, 19 Apr 2024 19:33:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:33:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:33:02 +0300
Subject: [PATCH 2/3] drm/msm/mdp4: don't destroy mdp4_kms in mdp4_kms_init
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-mdp4-fixes-v1-2-96a70f64fa85@linaro.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
In-Reply-To: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GQzVVYo33W2Hu30tmAXW3x/XysFC6yW9pZ62iPoS2M8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIyleU+XAbOqMszZPcfnbC9pF4dSLOlWp+Ro35
 4c0yo6gjzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiMpXgAKCRCLPIo+Aiko
 1cWhCACZKliWZcXp6bbxQIhR8oxBlqI4DLHnHBVhq6OGdyyjnViPn5pQU9Q4fK12Q6KNcX9mBdz
 EgvXq3S8n2+eBQB7talFGSVCorXGTfgcd0HnpnrzidpOyP08gJ7FLEOTvVHvIBoMHtcGcYwOhMM
 W0IfSH0gYVQp/C/SVFt2SOdiB+RsH9n3HhrFoy4DXbnklviFLSyKlnSm9jJTqD+CpnhZfxP9J2R
 W2RXl5oRc7pyT0y2BkkX+eVWc7pO8MZf7sTczYMI3+b3MbcTIBYUL4VCMRWP86xVoEriWWwJ5Sg
 zEFC+g6BtQrPpwvvZKVQ5EHSF7/w/l5r5B4D05AcWtuR9nX0
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

Since commit 3c74682637e6 ("drm/msm/mdp4: move resource allocation to
the _probe function") the mdp4_kms data is allocated during probe. It is
an error to destroy it during mdp4_kms_init(), as the data is still
referenced by the drivers's data and can be used later in case of probe
deferral.

Fixes: 3c74682637e6 ("drm/msm/mdp4: move resource allocation to the _probe function")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4ba1cb74ad76..4c5f72b7e0e5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -392,7 +392,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
-		goto fail;
+		return ret;
 	}
 
 	kms = priv->kms;
@@ -403,7 +403,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			goto fail;
+			return ret;
 		}
 	}
 
@@ -414,8 +414,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	if (major != 4) {
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
-		ret = -ENXIO;
-		goto fail;
+		return -ENXIO;
 	}
 
 	mdp4_kms->rev = minor;
@@ -423,8 +422,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	if (mdp4_kms->rev >= 2) {
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
-			ret = -ENODEV;
-			goto fail;
+			return -ENODEV;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -445,8 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 
 	mmu = msm_iommu_new(&pdev->dev, 0);
 	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
-		goto fail;
+		return PTR_ERR(mmu);
 	} else if (!mmu) {
 		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
 				"contig buffers for scanout\n");
@@ -458,8 +455,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (IS_ERR(aspace)) {
 			if (!IS_ERR(mmu))
 				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(aspace);
-			goto fail;
+			return PTR_ERR(aspace);
 		}
 
 		kms->aspace = aspace;
@@ -468,7 +464,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
@@ -476,14 +472,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		goto fail;
+		return ret;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->aspace,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -492,12 +488,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_height = 2048;
 
 	return 0;
-
-fail:
-	if (kms)
-		mdp4_destroy(kms);
-
-	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.39.2

