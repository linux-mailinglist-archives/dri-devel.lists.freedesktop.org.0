Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F57C6A06AA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F8D10E4AE;
	Thu, 23 Feb 2023 10:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7334410E050
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m7so13196668lfj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Za3E13sEZpZGy0TRJfvtiuOwvhVoLyHtf80EvRj/pZk=;
 b=MDFq7rd08fXsre18G6E1RTIFFlyssmJ+vfcqlTduSLfBAGaBXeUbiqS2FYeUnFxlcz
 xqtsu6wHR3yzgazAaEoSAJKqkJ57YROo71Zl14aE19ixcfjFQzMGFV50Vy1/z2DQVDyr
 WdlBgzz0BxgwxqgBKgpyDZQu8NGtXGD6YrZ5+il7oThfUPtAGqfADDnSJdpp1leUlB0R
 RiOldLJvkKRaZzEWYhLcbXaVYwM7pxE7Kb8fcth7iPB91UC2KdLvMuBZKhhTamILNn+Z
 G5DnB02Pmi6FLAiHyMVQ9Q7tE1sNtXlPF+uQPWB5JSp0bequVliG6odKHsCDWfrhW+ph
 JJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Za3E13sEZpZGy0TRJfvtiuOwvhVoLyHtf80EvRj/pZk=;
 b=y+4nb0JmLAbIaMfSC79sYy0r8GtNhVQYg+AkMcmKpOXHvdWI/0IhEQ/7JXpeUjZhYP
 QaMap2KC+MXe5381sonsbq9eI5fEaYDrSsL+B/VXMW37Q8Paz7Yxuf8olhGUMjjQl7aj
 9F0ECyYIyME4V/fHYfbir96//B6K2D+ZVdcsyCfSFIo7sNniMop1LR91rxIaB9YSeVe8
 tw1sLxwicLWTVhJdzw/r20G4ZzTAxbNb1HWRl3x6GzmjF6UJoLWlq/PQlHptgtE+BqFS
 ozGpXSiYbFBwdYdaPzlwWCbM3Vy0NwEHKTB/HpSKjURwpZC5K0Eg/2VHjMkBJGV7b2aj
 u6dw==
X-Gm-Message-State: AO0yUKXDGQgi6jpF1j39cyFFnXTgmP0n/TKG+wgDWvl2/NwmY8kOo15i
 yZ2b7HUs1mkmieXKN3dUG6XORw==
X-Google-Smtp-Source: AK7set+INuNTeXBO0iROBK4FB6M/NFho1ZgSth/f6jVVon+fZ6e/xF2oYOFwXv7MXdUhShIA2QVsYA==
X-Received: by 2002:ac2:53b3:0:b0:4db:1e4a:74a1 with SMTP id
 j19-20020ac253b3000000b004db1e4a74a1mr3691416lfh.0.1677149526474; 
 Thu, 23 Feb 2023 02:52:06 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:51:58 +0100
Subject: [PATCH v3 2/7] drm/msm/a2xx: Add REG_A2XX_RBBM_PM_OVERRIDE2 to XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-2-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=1718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rz6HoVcDmCXeKasABEEZkTNc5/V8jfFkA4B1KcOgBnk=;
 b=SV+lLJPnQxMiG/KFu5RTsHoCbIyFDh3U+cxdnLtWr+2iKgpzxvA+vL+isiIzxDQu0WWLaAFkiOco
 5fsAxgM/ChvKgPuWKpvD2Uc6+EI07YVG76reRZTaxRAM7YZWZsqV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a partial merge of [1], subject to be dropped if a header
update is executed.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21484

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx.xml.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx.xml.h b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
index b85fdc082bc1..fbac25f66c67 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
@@ -1313,6 +1313,18 @@ static inline uint32_t A2XX_MH_MMU_VA_RANGE_VA_BASE(uint32_t val)
 #define A2XX_RBBM_PM_OVERRIDE1_MH_TCROQ_SCLK_PM_OVERRIDE	0x80000000
 
 #define REG_A2XX_RBBM_PM_OVERRIDE2				0x0000039d
+#define A2XX_RBBM_PM_OVERRIDE2_PA_REG_SCLK_PM_OVERRIDE		0x00000001
+#define A2XX_RBBM_PM_OVERRIDE2_PA_PA_SCLK_PM_OVERRIDE		0x00000002
+#define A2XX_RBBM_PM_OVERRIDE2_PA_AG_SCLK_PM_OVERRIDE		0x00000004
+#define A2XX_RBBM_PM_OVERRIDE2_VGT_REG_SCLK_PM_OVERRIDE		0x00000008
+#define A2XX_RBBM_PM_OVERRIDE2_VGT_FIFOS_SCLK_PM_OVERRIDE	0x00000010
+#define A2XX_RBBM_PM_OVERRIDE2_VGT_VGT_SCLK_PM_OVERRIDE		0x00000020
+#define A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE	0x00000040
+#define A2XX_RBBM_PM_OVERRIDE2_PERM_SCLK_PM_OVERRIDE		0x00000080
+#define A2XX_RBBM_PM_OVERRIDE2_GC_GA_GMEM0_PM_OVERRIDE		0x00000100
+#define A2XX_RBBM_PM_OVERRIDE2_GC_GA_GMEM1_PM_OVERRIDE		0x00000200
+#define A2XX_RBBM_PM_OVERRIDE2_GC_GA_GMEM2_PM_OVERRIDE		0x00000400
+#define A2XX_RBBM_PM_OVERRIDE2_GC_GA_GMEM3_PM_OVERRIDE		0x00000800
 
 #define REG_A2XX_RBBM_DEBUG_OUT					0x000003a0
 

-- 
2.39.2

