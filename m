Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0E8FD72A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5F10E811;
	Wed,  5 Jun 2024 20:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ovv+zy1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9810E807
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so339414e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618230; x=1718223030; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vAbdSxwRmKncrPynMCBXXpukCSmqzvxbpgxPB115kMQ=;
 b=Ovv+zy1FYJF2lxAACTGcmqD1yH33u54BeKb4BTfiP+0/7om9EcImpvBeOAd9R8dOq0
 8M2gEypx3i36B/9u3QpQZJ7qH1p1YwaUxz8FWBCB65LXNEJDE3q7Hom1PVmyliCegf7G
 +ZMXWaYoPKIszR681xMTLC/0L1xcnfALvEY73bDqekdMU2uiFncCi30aFdYtdNTZnC+n
 qxcOP/6PwffDYXCEPhjl/Kcw16fD4U4/pxzg6gPEOcFPOfGmysCtFGKhB9i+x6KC+Xx6
 u9fAH1+yYmz4XubQKR3keqNkj0rW1qEdNswV6fmMxtAQKWS2QPnYDKBu62E5dCVmZtIX
 fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618230; x=1718223030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAbdSxwRmKncrPynMCBXXpukCSmqzvxbpgxPB115kMQ=;
 b=FUdgJEE/RCH6P7w7pgcqNy8uoE2Fr0MYmvzEhkUhzqyy8vZ726jwedvRTah2XYMUD4
 iPL9xl4H3TWcW/OQiJD1rp9qYD6W/UMrK3XzpyIrzjFcapth+MM04tceKFay12ptkGX7
 HHNhOCC2UOOpsww3uX5yC/yCGsTm37RZcT2+5+FoTNh8ReQ7gCmEPC6D4lwPWEGmpMNi
 gm5V2UFBtgSTiWuMmZn+KlintbqFYffkfUernUPtd/LioFBRaAYkMGFy63ulLzzEpoHt
 WnUJgodvXAQppwlVJU9Mg+bkHJWNdY8GtiSvO3yLI2Vtaa3SNkkvM/7yE21BumAaCX6Q
 cvCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOKeeXezNVNkGFx8TDQVMZaFF08AH6N2/ZnvBkHCum2D546zVOm7rJ3C9sHf3TT1Ze58YgHK65tGipPyTeuK3zSgAF8NjndMJ0WJ/xqdHZ
X-Gm-Message-State: AOJu0YxB33sHMVl69lxaFf/4UVBFwF603VmazVDd8lbUQRxPNd3prCRP
 bNlS59zh7Q6WmUcwvs0lkzcSxbYWdSpVoVBXDxT14nSk3PGQHJXg5o3YjIB4okqFbTIA2E+Mmz5
 FHZ8=
X-Google-Smtp-Source: AGHT+IGmE9OokaTql4LLWxH8WUk7Bm6os+aJLAvG1X8lHm2C2s5wY34QXKPicExRZInMxGNV/wgPkA==
X-Received: by 2002:ac2:5322:0:b0:522:80d:5dc5 with SMTP id
 2adb3069b0e04-52bab4bd036mr2102755e87.27.1717618230691; 
 Wed, 05 Jun 2024 13:10:30 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:18 +0200
Subject: [PATCH v2 5/7] drm/msm/adreno: Define A530 speed bins explicitly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-5-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

In preparation for commonizing the speedbin handling code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e00eef8099ae..66f7868ff476 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -258,6 +258,12 @@ static const struct adreno_info gpulist[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 2 },
+			{ 3, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,

-- 
2.43.0

