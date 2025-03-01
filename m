Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB35A4A9F7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEAF10E186;
	Sat,  1 Mar 2025 09:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nLhQPO9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890A10E17C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:08 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5495c63bdc0so275970e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821107; x=1741425907; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
 b=nLhQPO9QNXy1O1JHzFPUgBAedUqzqG1QFFe44PsvFl0xykDxy4SrOGA2CqWdyQ5QTR
 gs7/vHsoPgnoyga2KJKfABlTmoDSK6gRhM1rFsxe66thlu7Y10NLn8JLWHF1J4sAnfoP
 eJnpi9mR1SjH/HzI97k110m6As3GOmJZOpMCGr24yglekUx1PeDFH/qsnCjRyr7e7I9y
 RM52BH9RHGEcQKqwmYwuLBzF3S81aDQPfJu+uh6oAxHfq5BdxIRc94mgCvPTawQQDuOJ
 awZou6/gt2Y4JfHhVCKuFN9zncfYdaPO8w3mGV8aq1BOLYBX78JZts6TjSguKP/vmedd
 7llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821107; x=1741425907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
 b=aqhVtM4X9ZinerMG01insI2Sx8Dcv9Fc0iQ6/sMdfengoogghXCmlUbnoMSTuhYTLM
 5+CqWp64xnOVcQdixQiO/MltvhO3IMltgcff9OVQULi+BPVBh1jEqDfShTBthiymIyma
 sBHB3uBiFZ1g1JT46pEqe56rA7qierLROm+icwuRTQ6BeKvt/2a+CHtbBm5xww35NJ8+
 vz/2YEDb6OvjV9Zahxewj8xHTY/a5Mee3NEEl8WWtj1Cz2Kjnne7h2TDzZs6E2f1ZGL9
 SASX2SEQdtWZ0rPJ+bSNH72HYURHIOiVw3SJ01xuzArUYXEuKw9mqb6T9UklsnEv41n9
 5cPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXvIzF3S/iFKfYmPK5fk5PQ7KC22kIoC0TQGXGHxd8JJHDKV8B+QaXBbEPKpNz6bbawGHVq8OLX0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgszGS3j7Xu94XKlHiZc3xzJoQy6waK/h9vior/9oTJaC1DZw0
 HUDaVJS1rBN6atm0qHeLf8e3CzgLI/DxE/1cbzBRYpBRP0bXfe2kwqztINFERcM=
X-Gm-Gg: ASbGncvuCRtOWhMCNdOiojD3qi3WGFBErd3tKO5uGiTMqERU7X0I/5tVsZKE6cW2NNF
 DARUSHLy+l9RHDFz5xigkpmRqsjsuY/SuV5CyjNjLSkHOhWhaTBWkGbIGBLfuMdfxQVgKTYp2AT
 SIUxbU9DH0paoeJpCuRxYzM6m5kwB7pnxZEq5spG2xKCGXWGU8M4DkftapEQR7KJOhUyF378Cfm
 6OB1MR31ZueUq5aqyqtPuoHztlFkVoq3aqPlj42exIpmWMFHymQ2Fhrk1KIRGZy6fbrQaCFBUez
 xGWbtjEFlIS7V+HUqXOc/1kuZZTaSkhZGcyQElGOq6j+v8iGg+ha
X-Google-Smtp-Source: AGHT+IFTUhe/p95CZNKJGAqG1p7sHLGDOvpr/WdekUKr6EplX6n/Lb/C1JadtiI3JNxmPIfMMazmMw==
X-Received: by 2002:a05:6512:398e:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-5494c11b5a4mr3148909e87.16.1740821106875; 
 Sat, 01 Mar 2025 01:25:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:56 +0200
Subject: [PATCH v2 3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-3-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3KiS1JFwz6siEC5WVugc4OTInSpbOeJ8pCpFDBbI8EA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qhSxlfJgT2tZu2nzENWHi/au3+z5m5nxaGzpnq4P/Ne
 +WEhAKhTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZK0cB8Pkny1u1dbz98w3
 jqnft7fvUZfdeRapjeq/K1zXCGwv+vQ5OyG287DkzhQThQ+v/q+/8fnkqYtWp3fMv2IRVqj3pWO
 /bnH/D3bTz8fuaeSapm81eBdUtT9AxPpnfFa/cuua0A7VyutlBVqXq+IP852//86N5bzHhf1X4z
 RbfgpM4Wn95bpEbabUKh3JPgURhfqQhtOhrh3yi9M3bF+4adsKE18Zl4QVlTpeD0O/qyrHyhz2F
 YhYXZh4e9/OzvjS1FldamaTroWLb89O8zlS9qU+eG0Xt49wLwePs27vhckxhZYPLU44bo7XTPHb
 NuthlVZG7Jz0I36mhz4Ksjea75xTLDPNZoWSVtGxWQavAA==
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

The MSM8953 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..04f2021a7bef1bdefee77ab34074c06713f80487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5

