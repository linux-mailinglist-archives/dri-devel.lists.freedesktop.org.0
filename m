Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638988C1590
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27310ECD2;
	Thu,  9 May 2024 19:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X170h4NS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DAF10EBDE;
 Thu,  9 May 2024 19:40:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a599eedc8eeso334940066b.1; 
 Thu, 09 May 2024 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715283645; x=1715888445; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4PT/MoPGuaS1M3d3mLhAo2ZTc6fbniavNZr/SQBEv4=;
 b=X170h4NSBawTsdXocQdAnzGPh4UpSCsUC8zeDIOg9bq1aqqV25Cm+Wt/CFjyh3Uknq
 WbPP+BwVWCoytOtKI3qVY76yZd5VU0mzxgQz0/3pWZCrDmasvv8CxA06ginVPMmcsX8x
 yhS4IOcMiJ2SxACBWM1M30Kg3E6VhMYNYjN25cWWdUsRpw//w+UjkAX2fb/zGdjzsMDb
 z6+GIML0BQCH4jy7YGT1u1vgHQ4YqFBX8NN5vXE9wECnA5PSX1bfX3LVSwT7ouIwZ2lP
 /sWUcmaKncT6dTdJVKeepfbmrR5KaG5SKzLPBwstsUDL7X0I+l6mGpUYFMKE5VFx95z3
 cV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715283645; x=1715888445;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4PT/MoPGuaS1M3d3mLhAo2ZTc6fbniavNZr/SQBEv4=;
 b=J77BttDzno6ALAg1Q2BVUVXx7kcmqmFheFGxokD+CpVdcNiOO8K162i206GKqQu6Ey
 tvE4a6zFTve3qFucrqRCRtbWYL2WEh3RsVetrV2Ci/vjeRm6n/nFdsPhDdz7MIIO3RWW
 z2SWGXmoe+Ou9RPVapQSA5FpM+Lg2rERn52NFW8DioLsw2VcDrAJJ7CK7dIqunXLtVuZ
 /gs6iBCC4E71iIncsrlG8QtRnYIZYtg+K81y2oeFArqHK3otwO5ZCsBe7y/bhdzXHLTb
 YRVgesaxXpb4D+vyWOFftFruFLtzg8m34iSVRu7tFiguQZu6UEe8IWbGbGIn5k5kuMcW
 sc3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXywR/WvUQbH6NbEv78AAA2kIyr6/zQpQecPxrD56nE2tFjuco36ojZ1TDLZj2qz0RKOvsDwqceqkjVND6uKZrL3G93BWUzadZE64ndDOB6nNEiWZMR7nE2TDxcTaj0sqQc2nk6sJvfE951Rtxi9AzS
X-Gm-Message-State: AOJu0Yw+LoimZmi3f27zaBzzYlVIp4SrK5OA2LssjQoUysZGUt63OUSw
 o0XvRc5nh8IdULEzonv5Vf7x1h+CQJTybAhvED/mQVUwr7Xfc9Gq
X-Google-Smtp-Source: AGHT+IHiO7Yr5WIi7nR3XWhfO60riQOA4TSD1gQ1bqLHTx1IqEBI50QKKl536wB4J5uETi16lW6qmg==
X-Received: by 2002:a50:cd42:0:b0:570:5b71:4859 with SMTP id
 4fb4d7f45d1cf-5734d704dc8mr352178a12.41.1715283645237; 
 Thu, 09 May 2024 12:40:45 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu.
 [81.182.220.224]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c61sm1032619a12.86.2024.05.09.12.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 12:40:44 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 21:40:41 +0200
Subject: [PATCH v2] drm/msm/dpu: fix encoder irq wait skip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
X-B4-Tracking: v=1; b=H4sIALgmPWYC/23MQQ7CIBCF4as0sxYDdCrWlfcwjSF0bCexRaFBT
 cPdxa5d/i8v3wqRAlOEU7VCoMSR/VxC7ypwo50HEtyXBi01yka2gsPz+rK8CGwR0ZE1hjSU+yP
 Qjd8bdelKjxwXHz6bnNRv/YMkJZRA1R+ammpzRDoPk+X73vkJupzzF9MsxU+gAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

The irq_idx is unsigned so it cannot be lower than zero, better
to change the condition to check if it is equal with zero.
It could not cause any issue because a valid irq index starts from one.

Fixes: 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1")
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Add Fixes in commit message.
- Link to v1: https://lore.kernel.org/r/20240509-irq_wait-v1-1-41d653e3784e@gmail.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..cf7d769ab3b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		return -EWOULDBLOCK;
 	}
 
-	if (irq_idx < 0) {
+	if (irq_idx == 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-irq_wait-49444cea77e2

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

