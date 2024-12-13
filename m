Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A81F9F189B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6675310F109;
	Fri, 13 Dec 2024 22:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QEkQMjHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2AD10F109
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:49 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30229d5b1caso20973831fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128147; x=1734732947; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q8CJ5PyGkkM5Ge4k8pgvd7rSlPr0G4VhT2YhYoApx+0=;
 b=QEkQMjHHoM4G1vD0xrxfOYgLsIYwnoo3m5zZPTjL7yV2JsYqpdbxqAI4mvGekagqbI
 tIaNU/6wAUyY9vdwXJ4lQ/l0+ZuHw1uf1vU8zizhxYuoBVXOY6zQjMSKdet8Iu+KLtp0
 YDRDue/4jAtgzu6XLc63NoarG8f0j2fs192tyWd9B/baKbNmJ3UrHaKgZe+kvVvVkUCO
 CSitWrarPBQrl4RO7OsXYcTdxMrFtbeMWTJgKmiQrP5ptJ2bB2LdXKzJW4G5xr+7F3zz
 l58bY8SnQODw94eAGcUyAkIumMVhN3WQS9Oh8wwp7EZQ5+R1fiIPLh5zrqhnJ10sL5F4
 CO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128147; x=1734732947;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8CJ5PyGkkM5Ge4k8pgvd7rSlPr0G4VhT2YhYoApx+0=;
 b=cm/Ihfr5Wu3NakWi/J9e+Rb8mULobfp/ekF3dhJVTXp0PTwWJFXCjl/6ZG7bcBMmCa
 jdGSwlXKNI9zZ6/6YexulzSrOkfrYy4yUY8m3VOLO6fhau04gHPkfVfHeZXkv30Fc1AT
 Im0nA4ClVPN9olsQcDhye/TT1p5G3+XkxoQYzZ3oH7TVBuqx+k1DAp0L1Hz+Fp+z6O08
 odnINHwYuUIGoHDqjaxeXs8MfQPVE9Mx1p0F1wCGyAm7hu20b74CJomup+ushxB7juJC
 u6WQ5mYqhSxT+gZn/AjpDJplnMRunMVrODV+ThrBC8NX7Ja24N/yYrC5L6cjIeBHreM3
 haJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxN1Zhj9CeDryA5WlhjBq1bDRRzkVb3fVOSg4bGduyJkmiKFqiKwvMOf0wl43qcIH50ERutogNdrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZhk7xBIjXRbM+EGrC480S4fNeGKuhjQBy7updOhL6ZkWQ7NBb
 kz+Yzw/pqULBhn1UMfb+qZfxZK516G8zdPNJ/H92/3UkpsJ6AM8/J7sOud2x3R2FCF8ROsdHyaS
 hpGrygQ==
X-Gm-Gg: ASbGncsjo654tt5Z9CrWbuOM4th5RDj0Vpcf23WfgBlp4/1TrT651zob0+fBCKA2eyq
 pMAkx5lHPnIbWUC39vliel6m/KKoQQgKUhP2M4E14y6qiP7k4vZwRbapxnhUmvVmmfoKT3v/m5E
 LRgr9Z4VhuODtkAqge33yFi54OgP8z9jNk0ZMrYdttCfJ219VXFjThs9X4JQYr0UhAvpYK2Cb2T
 kcwxCCIbuCwxMnEjCEUwoZrc1VxkD1+qaHJhrrZWYItIyCxXnjLmqUJqkuTocxL
X-Google-Smtp-Source: AGHT+IGvudpnoHreCO5KIQhK9qwIa5L6cho7TQJdvBqPzj2l+x7eTsmEjbphk2uP/+FGeeeXkorPRw==
X-Received: by 2002:a05:651c:a0a:b0:302:1b18:2c06 with SMTP id
 38308e7fff4ca-3025454f5d6mr11743491fa.17.1734128147557; 
 Fri, 13 Dec 2024 14:15:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:47 +0200
Subject: [PATCH 31/35] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-31-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hlCOG/IMMVZjQpDe5hK7mWJQbmUOCcipcbOQSkwTM8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHIdKb5IbiCWlXlzhohjog6fJ8jvk2mR1h3c
 HTkOqwlKaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1SVJB/0YyiYeGnl9rwP5nT9T++SfpIT+VYC5j3zaEY83RzxKkMjVnZkWG48601WHyzHBtNf+eM7
 PlTDH5WkWsy/Pk10fKH1iYynd56f3RNnt8eLrwsp4dd3FW/wcmf+o9m5lndxHLPHbf5f7s9jL1e
 DKXkhFxoZpM7EUo8/kuc8BDzGLncnudWMHDzDlsLtKsQJx0ZOq6jx4nFWN4tWzLZM6ChP3eco8/
 vvLOzKUqhR7uHhCtbsZtaPpnfPkWUUWHjdRK7tW/dZ+FCG2b5jQ3HQLN3VoqL3teZMgjZjMI/2Q
 1ZNcSfs23kcsR9wbXF6ExDeARq/Qgp985O2EdHeDCKycwmGx
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

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 178c5440a9f4439b3e53719aaafa9458e353e58e..3267a145d8927c458545668607bfc1d82a6b028c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

