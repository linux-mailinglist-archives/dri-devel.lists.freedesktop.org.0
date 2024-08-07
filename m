Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D794A83E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E0E10E50B;
	Wed,  7 Aug 2024 13:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nIs/WRe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD310E509;
 Wed,  7 Aug 2024 13:05:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4280b3a7efaso11937355e9.0; 
 Wed, 07 Aug 2024 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723035915; x=1723640715; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1oksB2lPljdtr262j2OTvXCtWbemaDGwEg2PJlYW6+0=;
 b=nIs/WRe8i0pjaMg0OBfRCq+N2ZaQPNnSPxyGgTR2JNBr61OuhlLxuh+7TDhqbc1H44
 opr2eMrJt0xi5VEVbBQJrTDjwtGMuZnep2gB6060soezJEL6ESlovLlwOLWU45bOs9md
 xcvYRXqnKtlC1Zf8Gva9gtg7W5C8A/dU2PQLzgOH9+MqAwgSdF2jgZ9o9irx6bPzx2Qw
 r/LErywB/Gg2DSf5F9SrD+Wt5SFlhk3c8Mi8jwWV3LXBOLFpyQcZSHzYgOzbqQbHz75H
 DWaA6uq6Sizeta24i6V2JM7Ln9ESV4Won6YO+6UfDGlYthXHHhJk/M2lCFVFN+/TSMwX
 Qmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723035915; x=1723640715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oksB2lPljdtr262j2OTvXCtWbemaDGwEg2PJlYW6+0=;
 b=H6Un5S0n30g5wie7+p5n+RL4+F6iTaNQmnVCWHAbT3F2uVeNGOaBCiQOBMyGD9Y7WJ
 uHXM6SJJtykilj1G/RlXs8pvwUZDuckXiEOSb+NtxGpT8bnwMNSUwIzWL8c4wvXCqc2x
 NYTqcM4Ba3g4haSoEaDyUVrSO+JRSQZEu6G9ZiP81XF3BaGcV4S6P6i4xVaqEO3n2JNs
 P+DSiySON2zi+0mvZ3ZDRH6eZZgq2ybXHWguAMx/m2WSRdHnvWuMe4cx/MQnIJzjL26Z
 bdI+7u3+XgKFciFh1hA4tlY/QiIqzsI2MtX2CdDaT7TDJpZpq1FQ2xZfGb9qIkYotLd0
 /VAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqdYsfC974zZHLJ8Snoho0MgQqO0RsVfnRwKeiN5uaN2W102o7CiVOn5JychCCvjo8Jlg3ORhxmVfWYxo+vwjMQpDYq8SwbQuJ0heyAMivM2Tx/KmZkM03EBfoafBwAbpNQJKqXqT3DaLFNQWnhcZp
X-Gm-Message-State: AOJu0YzwgMe73HapB2VnPTSPxDNFPqcmqKgaUrFGeef3dP0cK6Aegzf+
 EUQsX7Y44w6suKJxclj2py0UF32yRGwKZ13qaYNhHyzgo8sRQwIR
X-Google-Smtp-Source: AGHT+IF8+PrPZHWV2T+bDUo5FDlFFDLNOBnPVtzIKhRd7aZ73nUs+zF448eTPJkidsAIpuR0rNlmYQ==
X-Received: by 2002:adf:e644:0:b0:365:980c:d281 with SMTP id
 ffacd0b85a97d-36bbc1bcce8mr10627386f8f.45.1723035914892; 
 Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:59 +0100
Subject: [PATCH v3 4/4] drm/msm: Fix UBWC macrotile_mode for a680
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-4-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=955;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/7yQqe2NBmmAI7rwVzTr03fHyeDp7IBl0NXw+ehR9bo=;
 b=NRs0NJvx7j8M5zqZYO/fc7C48wEQeY0hvIuRQ+ibgD3REpZMOSfpYrZ2wBj5shMArAsIl758E
 qMPqBlBFximDcNQMDNwJW+j/OoXvlGvDhCiIWPK7t6HjJRfEhX8LT1y
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Make it match the MDSS settings for sc8180x and downstream.

Note that without the previous commit that exposes the value of
macrotile_mode to mesa, this will break mesa which expects the legacy
default value of 0. Therefore we do *not* want to backport it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7c2fdd1e7684..7ceca633ceea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -519,6 +519,9 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a640_family(gpu))
 		gpu->ubwc_config.amsbc = 1;
 
+	if (adreno_is_a680(gpu))
+		gpu->ubwc_config.macrotile_mode = 1;
+
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
 	    adreno_is_a690(gpu) ||

-- 
2.31.1

