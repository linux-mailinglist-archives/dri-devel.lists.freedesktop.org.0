Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA4A48EBC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47DE10EBDF;
	Fri, 28 Feb 2025 02:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SAs4kyOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B7210EBE2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:47 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso15906871fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710445; x=1741315245; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=21TVA0G0gojITtd03fcIP3wwFgnkOgv1z7AmIqkOOEg=;
 b=SAs4kyOuhn3FkSYGWDCoTXA5YExzV2SZrMNoDL5raidWrKxlm/0D+1fYYnXaIt9MMK
 ELZZ5LRCGcKJ9U4o4VLmdwtFT1ZSU4aLYba14RchNlWQb+2UK/bRb/+qe8Y1DARxjqKh
 tYehuGAR88Zss+B4gysfuDIB3ymKKjacI/8SAc2fpUuqe9+W3KR0xKjuBmtSytdg/4hW
 lfsA4mRRUj9Ha/FuSLCWXQDyZj02RT9c12eqGyX3roRBr26l5xC3q2tTppfdZVs/hpbp
 VysKrxpTDPF1NhKMARDw5hdocXAxOjEca1WqPgOlzaqpsXnNE6LtCmhzDL6ZsGgCud3T
 J6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710445; x=1741315245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21TVA0G0gojITtd03fcIP3wwFgnkOgv1z7AmIqkOOEg=;
 b=rpHuSeRAHtQtri9D1xKmDDurY/N1U+MUaNkFUrDgTsqpwOD/ahk//oaEf7kL2AF5yJ
 AqxzcterLzR9kSyDf8mCtwguZXXOwxZMtXT82P0pt7y+6VX9gC2IUVVkg5SM3TORM6We
 9Gs9doWtdYoaicBIQGXHlKltXXoEHuEiF2pNStaio2eY5WuLGVvGKxwF8wZ1ePrWQSY9
 QL1rsOLwAeV0cLhXnhw7R1qDggRpriEtuKWhSdd8FAUwn0UtGtaAln2PKQHOcDUQketg
 u8TkUyZ5HqQn74rweLA7oEDaT/a30KMD4FgpfqaadhVeX0XxMIFuIyZqkWWUGhLMur2t
 LJJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVstq2uEDmVHd27/7l8kHke2XKab+ERN290dHSUfvId3zJmyykBeDdBE4vw2IyTclbv6Cx0EOsR+Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw29zryiIj2xQU5vWd7Rld3diwM5wEy7jkQNZIFPU2RoRDm4biv
 xHTdbkn2mcbHRPTrA/RPmxPzpPzhAqW09meuDE8fMsdIZN/SaERwApj217aWY+E=
X-Gm-Gg: ASbGncsq10SPkaFEetnLRrAT1RhPl3e++LvDZndaHrGH9CExHqaVCGfQ5MSqYmw1qvE
 adDZvPvo2OQ2/JKR67P8BSgT4A8Ro9fhPLEy0JD0pjtVBCL8oG3IImPp4a6LGqlUoNWxpEVqBwC
 J4OGMI+nj2WO81nZPAOSNURQl3GEzHc2wS4EJtROCCPtr8fEUx2lP80+bP+plGKNYKPzmdXK/Ih
 qV4+F69LOdXzUskvv4IJgKUZPrga1etCPjIaRZSh2KmuLx4V6a9deHthrp+CBCervEA+4wDniOs
 PrkqyU77MejZY1ZQwDME07MPgVM+/V/qkw==
X-Google-Smtp-Source: AGHT+IE7Mky/M2fDSKSULiY34EQmUiMxEjS62GBJfX2zcyCayPQhXRzgX2IA/oB8JS7VImdstOeq7Q==
X-Received: by 2002:a2e:be9e:0:b0:2ff:d3c6:9cf4 with SMTP id
 38308e7fff4ca-30b93200529mr4213001fa.1.1740710445348; 
 Thu, 27 Feb 2025 18:40:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:38 +0200
Subject: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7BzZsMBnZu1h07UISleUgszbH3T6+OpRP/jWCT7kc0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIouiJGhGOZyYTg9iPINN+LzRYzfnPSJR5m8
 KuNAd1pze+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1cATB/9IAWUW3l3iAA5pqb5DkZfeWKaw/TMntlcwc4Bb6aqNPNgO66bOsVK00C5ogk6vFwOFct4
 PnmRtKjTfFCYwEzwXiNDfOq+Ua7F1PmHEuAlCwH5nZGx0H7/N9tuCYrPSA9hmqEbEroie1zHG0s
 kTnOeXsw9p9puyTdXaGzHOrU/nizHJsXuCuBX3aSAGQmXCeAYXPy7k7HCb3aRqQrSeAsSfg6rYy
 Td0GRICCFRhTJJ6mQWHO+0IXlXfE5B3fu141VPJ5vs5doAJMkBIq67op4EGTsg7ehQCQB4iTZ9i
 MIiT1DyLeWTiMoh8f27DcnrTEMaQpbsqCxCxiiVZcih9G4fa
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

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..a848f825c5948c5819758e131af60b83b543b15a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
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

