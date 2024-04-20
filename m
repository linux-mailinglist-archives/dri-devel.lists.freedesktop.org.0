Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908E8AB8BD
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2010F0B3;
	Sat, 20 Apr 2024 02:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i4uXnUe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3D10E077
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:33:05 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2dd2bd8b1a6so327951fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580384; x=1714185184; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ns3D7U89w4Ga44opBEB2b5k+fkMy5ilMmgKD+0mYkkQ=;
 b=i4uXnUe3aoI4oEk7akG+SsHtYpilBUzneuCXsLgdIVixFfAQ9lyhFhJCg8XYVdHbNr
 c80vZKBr+N69t/eJxY181Wt5b85MTVZd4/x1bXRDt/qAOXO1ZipQ/BGQoXH3xqOVuECD
 CJgY+PM8cI7Jafuo8GuHykhPZLoIJerT/gI+OS3xH3MDS1KzeA35RQ0rJrbEWYiOsQMG
 J/ZePHoqMdKHofD6e9d3JteFJV6cWXkIgiY5YTfUBbYAjYY15eUcQhUGMub4vQwHCqQ9
 ZAZV7wLUkTlBBOsmqaQ3W8dfYUAC9wHQHisMWCTKGzMvhlGNEYhM5PFga9rd20l0pg1E
 ShnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580384; x=1714185184;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ns3D7U89w4Ga44opBEB2b5k+fkMy5ilMmgKD+0mYkkQ=;
 b=ZnaG19EkNJFEwBLD0jLAqQBRHBFCfx6TWrDxVSbXNlZezI63GHTS8W/ZUyoUMgNIdE
 ba/iSyC7heVjCdJNYbBqpU+2Bh4DJqBrHEQEgUOPYqpwzLAtuDYXrjKAOtSZc6qr5OXD
 2Nmm3IMnKXnaMOFYrcbYUfm9tiNNaxLcIlGFXC2aUAdsn/SDzT611j81cCaqz+1FORRC
 z8rtHrZK64MB7Fo/pMKsgmRNUS/m9hNzbwBKGTRZI1BhzBPkJCWPUTWVgStecOY5dqAr
 0+LuWCXLPzDvkDj4vJHXkheUowM+zVWLt3rmODhAO1H87eN2rXYHQdpKJnbfeQmlx0Aj
 dp/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGwZlP5u+ZI9yeJU1WFNff0NFM4Sj2U50uRcs9kQOu0cpyR3DEJ/BITUY9dVEDteE/Imo5yUEaWEqCd1zzcXwWJfwV5abPufkZmLmPud2I
X-Gm-Message-State: AOJu0YzVA5XftUJoKYent5fUwHZ35N/cnCXLT9wGPx7ZPtgP6BECVtUX
 uLiwiA5tsAaI2GzpGyB2lVd1hX6Pu75XQAxBUXB2/BMGCuiWomnR1GhWVib+WJw=
X-Google-Smtp-Source: AGHT+IG3I4ixwxPsmaplHRUzztsZvIFLMMDzdAjALXBbvS+/rMtUD4mjeAfYPtC43oL1zExWhd7xEQ==
X-Received: by 2002:a2e:7011:0:b0:2d8:a98d:19b with SMTP id
 l17-20020a2e7011000000b002d8a98d019bmr2455649ljc.21.1713580384053; 
 Fri, 19 Apr 2024 19:33:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:33:01 +0300
Subject: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yIKy5VG5u8KAYmiLe9XQJJZeBeuGfwXNunL1nP2gaBc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIyleJlJ2DCp/R/B/8g1KjRr9UcYKM48kdCVTr
 3+p2/cKymOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiMpXgAKCRCLPIo+Aiko
 1alaCACxlDsy/3INrV/gtG7PKl+wld/wdpLUyEmZkvoUlGPMCid2wrFBqyPbG02h6AMEmtNva5h
 LdNtwFdCTwbfK7dOQCG2RhZnESNeoQCd5w3Ioj/BEb63A3kKe7wHS6lb5kmoLc2FQkTkngB/Qaz
 bwhkqam0inth6CygsfsvHNbID7yXl9MPnJLH8bZru3RJ44oLjews07I8EZl+lSfKTOZTQ88Kk9L
 uhNoeLdOpHJUNDBTWDGUbd6qnI5OeLgn55eG5geOUoX6suqS+EZWGdjiuxwaG3t5qM3fRL/JB/3
 8apENvOKLPMX3V9IIdj0pH2OvA0aivLxPBJRZwVs2CIMCFgS
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

MSM display drivers provide kms structure allocated during probe().
Don't clean up priv->kms field in case of an error. Otherwise probe
functions might fail after KMS probe deferral.

Fixes: a2ab5d5bb6b1 ("drm/msm: allow passing struct msm_kms to msm_drv_probe()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index af6a6fcb1173..6749f0fbca96 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -244,7 +244,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		priv->kms = NULL;
 		return ret;
 	}
 

-- 
2.39.2

