Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB90A2DAF7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559E10E47B;
	Sun,  9 Feb 2025 05:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="krXYHKkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD310E46D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-545064389d3so812109e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077627; x=1739682427; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dPGyQgNZ0aCBKHZLfiK3AEZ4dYrfnGwELgJGxdZANgU=;
 b=krXYHKkv8z7MDgW2FMESHc9j4iQkunvmLfNpM2EInUMo9B0yQDJtHM/s2m+Hvc0qs1
 RuscKeGDdQecP0SQ2lMwcPsOzRcz4AfPkigvt8lnzuR7HqJhHE8ZjAoSZTsChZtqx2X3
 9gFIUeofTBPQ2tNTJo+JNYydd+2aK/9dyQE/JR9kUPeE7cJA+Q0FP1dAOP/hoNSm5oNU
 j/N4ISC0bcejhCwaGFDUmzV5Xec++ggmyqmVZ5KPQUgPzlXLDYrUjmxtJm19f4vuUrke
 qjDJIDozwOlsUP1/pp4zkj4/tLeH7A7CpYQugRIJV+pi165LPT6Hy4SQpCm1xnAhocr2
 kbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077627; x=1739682427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPGyQgNZ0aCBKHZLfiK3AEZ4dYrfnGwELgJGxdZANgU=;
 b=hCjUOLgYe7thRiBhK55ponq/yp6wDs92Re23Eq/XlHL/EsmmI4j20iDP4EGU6lORbz
 Zr/4FeLNM+ukoEHhYpDqaDmIZkatT8ZmnNy8qp+cFEwne17LmKCxA7nb+qN1fz0I/stf
 HsI2qoC5cUQChDAcMHTHb1fsVfct+BUDuK5QB8vHA0dRUVejyKGcODrVhn0vCZHkm60d
 AWJQKiZ3Mv2dLFRLcr68LpOoggeKBL7OyW60K6Ew5FST04fbcUck0yVEdwfxG53Z+pkM
 tNhGsip3+bvwIuBPC3qgRIpgCgeP7P68xA1wTw+lcqhRL6JHRgLoubYMkohQM0NMOYm2
 hU7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Zp7FcYkLzDX32/r4DTkOwqrLQNT6I2XgO7qmZd8/j+1XTlInpSpjCJuslUNJPbe3+AoaZhQDhSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUgbQ56Kd13C1541u93a7pT798FOEBLOk0GBVUE9KrtgpMyZ9X
 wLdPorEuNjKKtLMB0lUH0EPIfWvt5QElVrJ1KzsGF8cWQz+2+1kM/ikWIegXMV8=
X-Gm-Gg: ASbGncvtOilbjhyDrFQzhqZHuJQ/us7LCagBxe44wkb+M2aBwX8mUc86xgnW9T2d3H1
 onrZP/r4H6m7+ukse0G1FHEOAiJNRlOghrtnXJVh3fQCU1tKPebKMx6CeRasT+au7G2i1gE1LSq
 mdnht1mgBXYhjKwnz1xCqM2sm0RTKUlFwiTxwJ01WfXxy17rRKrH4VsIbeTEl9aFfdWr94Vv+P7
 Te2o68yRql13joOnTU6LHVdETJKLRG+UCFMuEIkrQ1elgPH5PXxOmbyptDa0DEA4h2aN4v5fo3J
 Ku0+QEx2iBlitLYAJvrqi/k=
X-Google-Smtp-Source: AGHT+IHOgcR2Z0Kqo6vnivPTHmH/O6i7EBOYINI+rp89KZLNIblSE2CYospkx5vQksFw/e13bAf1pg==
X-Received: by 2002:a05:6512:3fc:b0:542:98bb:5674 with SMTP id
 2adb3069b0e04-54414ae0732mr2345723e87.33.1739077627095; 
 Sat, 08 Feb 2025 21:07:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:53 +0200
Subject: [PATCH v4 09/16] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-9-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfia7EBbrd6GV3tmBxCrKU999OvEGr1JbtMF
 Mdzz6fu9ISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1QrVB/92GfoPb+KtYU7kLhhmf8FYFyhFLKMmj7oEBLJB/Vecg7K+hhR0Emve+xmn01ZP2Hue125
 fGhKF5HYwmbu/ANhmsEmvcebBvFD2gQEoQ4Lwt1jRlMBU1ZFsK/jPKRhArWSRPJvb2h7bvze98Z
 iSvNIGpCe6hy46XwhA3JyWsuiCmD5Ixjr+qjSYBazwM3NoF4Tub4SccSG9YC6Rm+A5csfhytRvp
 3Eo7gCWZfST2ZoSjTu3D0TM8xROiS0KPlCgMCL1RHg8fqk6VX6brvVQaw+ho8zcJ/kSrIzbi3P9
 PWmdaxYOgzgmWMYcjBaHqX14VY8iFOCzpKD4as4jMTXz2bWo
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

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5

