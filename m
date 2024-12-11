Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA19EC736
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29F10EAB4;
	Wed, 11 Dec 2024 08:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bUt4hcOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BC610EAA3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so7347605e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905800; x=1734510600; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=bUt4hcOp7jkQxNk48+TvGhEnzFoA6NlL6iQOaOrGYgpM7QLC89mbpHF5LxCrMnlxvc
 fP9PHhxUHoP5attq9St7kB3dYRZAAmEbUL4JwfbmF4r+xjOejDLXieGBTcENSBdAO+D4
 4vFiO61lsU6Cbn2loWZzKW+a62Lkvs+o5ey6EQme9IAZGHiS6VnbhCqx5piBZIGNA4Cc
 1nv8ovDqJ2LhfY/HfKA4GgYKrBYNJ0e1UjA2OEQO+Ql7zmPK6mA+xLbH/Ugl7iZTSx/w
 JArj4oZ8TyquCJ6jbau3pwsKVeY2GtKSmylGmJLbSwECxrWuQ3kIHvmP90bRvmHzufK3
 L+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905800; x=1734510600;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=dXCHJpZ1jtDZE6XwSpMSDsfLSKo5nP/NjghyQ11xp387c3E8kVctmM7vIH1oDMpFvt
 d9WXz5worWgg2jVRi1RhMZmS4/vArDVdP82BCthOT/H4KSYpKt8CaRWIauRlepha3i0G
 4m3IRJ5BoeN/nIRcMrF7k1m3t58CB68THx1COEXFAdSuy9JNevHn4QnK0DbCXcSW7D+z
 Pk46n3FGj6A/pGTTnaFy1kRcBpgDN3tXrm/VS/WH/iolh1QP3M0pUrzcLnvV2GsLLclX
 cYJn4vAvcIrUNciaDWekn0PNbF7nsdXamPonh3dTPMAdpm33RpSjQF749Pp4RcedT2hE
 WkIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkmjDd/UwpOKikN6xbEKZlgFkuY4kwogFS+cbiGTU/vjrxZJmTDnk4mt8sXks77Md+ayNWBO1JsEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyroa60kkamkz7Nk1uDW8sScj9MhHaAQjlr6DgUGpoZ82GOLrPZ
 RAbVPsZjBdNNcM2YAQgWtfxvf/yiApIRV/AMRgnju1K4JjjtcTAJwMuahh9zOJc=
X-Gm-Gg: ASbGnctLFhkbxMTYJqY34UC5hkm/vywz6t3L5XWNTqf+VZM5et3cERwHsr8xaXcXOJo
 JE+hm7q7yAoY1CHMeE/Lb+dNCm12AnO2V6WcDxnkjzAZ4xABEZPqt12Ny9fy7KuHT4zhLv3aI5L
 ye7ZG7CxFPbcNcZqgQmTeHRc6rgrUtZ5UsBBTCfj8qxSx8Wg3+Q/kOigyX7Wglx40/buV0su5Ts
 G8YduvAUfd9rucxdkwWPgnnDSH9wKoiFOFF2Hu/ZsZ16O59gdYCPttq88sdCPpyguQRjPJqCQk=
X-Google-Smtp-Source: AGHT+IF7oHwnm8rIiEG12aOaCAXXwee4iH7RzxDw44Dh26ZuhO0Z1q9I0gkOLUHLoDLf9lIQrU/4qQ==
X-Received: by 2002:a05:600c:1d20:b0:435:9ed3:5688 with SMTP id
 5b1f17b1804b1-4361c3d6ac7mr12286655e9.18.1733905800503; 
 Wed, 11 Dec 2024 00:30:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:51 +0100
Subject: [PATCH v5 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-1-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uvbHEXTw+a2tX2idu+ViK6cwh2GKBsinSbc9Nbsj/3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2DzREykEvfRyTTeu2PJL3doUmLN4VZtaUtdXPl
 KCE67taJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNgwAKCRB33NvayMhJ0YlyD/
 9n1F55iW7tro2Ht/1yZuYHXbYF6L5n48SpHNqIT9F63uycOIBIA9C4UMVOHyQqLuGLrQxLQynDpIxe
 mpwriIFAbvwCOBf55h5iC0R1iVBnhTDaAHMm9sjNVGV0PB4PFzWtGwSDpfrqMWA40iHE5foCF0P40S
 biH0o0BEQy7iUbRjL0WRxybwkrQbAsOF1nqPfwpuqEFuWM906zWyZh63dqYLqrP7frbdiqD2oHVxXw
 Fd7rFTVBt695oaYLAKXvlqkmq71pOi6hxEy92dB0rmCFrr5fd1brrl3hqr0L8MZS3rdA8I646n0Aop
 eODmDQyX+Mj2aLW2Y26OoJsz4sAspQ1pksIsHc+rMwRL5MB9+9LsyLXHa/IP0eiTq5BAlsxdXvxtII
 JTlwvcFp04nKV6lGssJhXBFR1BFE1IxQG5PV5ZVJPoZYJMejeyiAT1T/2LNNXjNIBH1fNqUmXrTFpi
 rD5yzrQRZHF8vWsT70jtPABLg4uUmtvXsHuXkT0VLOLVIIJ8EEs+a3Q2zjcUgZAdtiHIlX1ZcjdQLZ
 Qfcgp90wnmg2KWS8PvxdI8A1UWEHnmBRiNUjb322vpciOOyKxrKyTJxPoB3y9jN49tkpOuvgY2xoVd
 LMIiXMhznpNbE3Xr60+5UbPHUnR+358wuB0n+lAOgxyt7MruKoawUvHbRAgQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1

