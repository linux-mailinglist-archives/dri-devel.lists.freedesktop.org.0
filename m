Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BFC8C084
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B98B10E6E7;
	Wed, 26 Nov 2025 21:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ICmjWXsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695310E6E7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:32:09 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b7697e8b01aso52283066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764192728; x=1764797528; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/IjEkSbir+5iDrD+cjTkZjSpdltDA21ZlX4G/dyJhg=;
 b=ICmjWXsAXF5ZiruqL1qi67XgnHQFYoOHBLgB1syQBKpxe+YkJWIlR9Pwp0AjDoIVTJ
 JEakWxUHPnT38kpzYFN3kKLpzFo85ykXH39h71RB4GikvenLfpnn4mH8vXrLa5lRs/4F
 pw9sWnVX136g3PhvwQUSeJ4mmxDe+1shLzkWkeCWiA0vKdaWoAN4q2zh1Ac3JWpL3lb+
 sF6slTgteARMPKzdvABJOqg5nll0ejn7LMFRn6yCKJKxx+eTPxa3Io77Fp595sKMsFuP
 tKvog+sXjEZhPGkqW76AjnOlRfqJOm7opEzoadUUcaT44UCXlfrJ3qjV/IsDsNeaD1J2
 vwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764192728; x=1764797528;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/IjEkSbir+5iDrD+cjTkZjSpdltDA21ZlX4G/dyJhg=;
 b=va9fp7CBDzyUUeay5h9QRXbPhA758jU197qhn3Qvr2Iy6DOQUR6R91HhNnJMk4EKTI
 1m/Fw6sPILVJYVSwa3doZL27obf6851Zho+jc7al5gr1xETWY+D4flragyS83Elohlpm
 V4pt5/5ki1lL5XKuPMsWH6gKb0g6ERZBtDWbIkN+hzF5ELkuF6o7s/ItjiMAPpJy+kVg
 WkQ2trOIL6TafTeooUMUaL9I5Ig48cbONk/yjKwI5RtI0DE2TTkhyGbFYgceOVS6Iafy
 SnJEE5h9KZO2DH6Obwmy5L3Cc4Azrt2U1WuskuIRDZvrbyQk1KejEPKSbRmKE4uQHZ28
 9++Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKc+d7mjOv7ZizYR0oIIJR0oKw6SOanhJdgAQPRv4kH2ggWgIlLY+Mc3thMIHkriRRXgkCkwxCpuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZXf9vQ99CSNysk2dVy9DcUAdaiG19Q+r9kK9zRkeqN6Slm0hE
 exRoQZiKdvo9ToF/nEKcYDHdCF9yOKnqpAVDRYc97d1RbSfrD0Hu1a4=
X-Gm-Gg: ASbGncs+nc5TgsEpod6RcUhBK/NC1oavvCKXgM0jpkyIUhjFUJswJ84IrC1rJtIacgM
 9X7dzZOooSNNcY0C3JEFnf68VjCJLuW5+FTt9lAb4KZSN4Kvu1gmZjGkRhEIvg7DqlWELcw5vrF
 bGlQ6fn9KxcotesI4qcuOetqM7dSQb031LUxTAQoPZvi5E17qy1Y5XpfA37zf8D+02Fd3e4R2Kj
 yemgiwz+Vvp8k5OOQ0ipQ+urMKVIen0iTdsND7L3hVuvxnnwZj5//Ks1SOfAsKZyG+RovKHFSeM
 DnxchsORSF7wPvc5J9900PjaL+g8R9rMW8iY3lWxULlBq+uiEMruZ6ujGfRLYqPRFiRtx898Ofa
 aO4ByirIg+XcIV/ygmhsVvFGUx7Ct6m2YWpnH1vJeVPr6tWpfFURhfFB5a6iyk2RXO7Jr+J7bZT
 1njyNxp0Ft1s6eyOeMv53NPIts10bx813ZUEF/PMpWhChSbvjfYA3eWh4MosE6h2EDJee2hX0V3
 w==
X-Google-Smtp-Source: AGHT+IGvpQiDa98vuZ+r2RJ8KvDkUmhL1X9QjLRFojlbAheA3iOOln2ak/2qbylZFWsWbYzCZDCEow==
X-Received: by 2002:a17:906:50e:b0:b76:bb8e:9291 with SMTP id
 a640c23a62f3a-b76bb8e9627mr777562366b.0.1764192727897; 
 Wed, 26 Nov 2025 13:32:07 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it.
 [87.16.172.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ce15e7sm2007828266b.8.2025.11.26.13.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 13:32:07 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 26 Nov 2025 22:31:30 +0100
Subject: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
X-B4-Tracking: v=1; b=H4sIALFxJ2kC/3XMQQrCMBCF4auUWRtpJkaLK+8hRUIyaQdsU5Ial
 JK7G7t3+T943waJIlOCa7NBpMyJw1wDDw3Y0cwDCXa1AVvUUuJZsF/sw4bXvFJMgjqnlTcKNRL
 UzxLJ83v37n3tkdMa4mfns/yt/6QshRQenaZLe+pahbdhMvw82jBBX0r5AjpbfQqqAAAA
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764192726; l=1193;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=LilEzDhcWjY57veICYfWfLCwFQ8k3uO5J7lq6Uiq/yQ=;
 b=M/RIo1ohGCP4894QLZEeWHawQG421ypp8IgRCofThp6HqeZ3mrMcKYA3M691q+HNdFzOqT7b3
 o0RZiLYLO6xBaRZQ2hYP5JFmJVxtFFr5EaW/d1sVYGhM2cJld5cxQgQ
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Added Fixes tag
- Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

