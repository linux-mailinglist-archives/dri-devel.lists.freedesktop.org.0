Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88557C68D9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7686410E47A;
	Thu, 12 Oct 2023 09:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42A10E472
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:01:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so694453f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101297; x=1697706097; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mfh690qFtV0xEZd8SnUdpq8RXFbyNGd6Ki5agnf0gRU=;
 b=e4/qOJb+hIP3rl/ZhAQurpq7AjkvyV3+5lgMLr/QwZyV/VVuZTu9u2ORRoAeyiEQvR
 Ai+OtOiI4nA3VBxuOGx07qqDxCqebJUoJPZ7TD1WACzxz89r880/vBVPCn2LqC/9WCN3
 uBX6/zz5BQd0bCT5dh7iM3WWum0ZrzWAaA32Aq4ZAHyCOVpaCWLTmx2kGZdt4ZWxmjsZ
 wTZJ5OPhGJTKOOky+LQgyhgYg6BPhN/PQHHisfE1uURttSOv1OWIlTPMYpAcEdfmvl7w
 F8rZ4HEx/rcDkpHumzkhTTZ9tlZusc6NR9ajR0UydFo3soWlJFJrwndA2GLyS3mJWctZ
 9iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101297; x=1697706097;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfh690qFtV0xEZd8SnUdpq8RXFbyNGd6Ki5agnf0gRU=;
 b=Cds2wNIzblKQPDSUO41iLMrxYGtqpXW0v8GEM69C/MB/YE9gY7wJNu1MiGimhWafgi
 OsTt1LFQPbw0XT3E23ZboTZHB/RmqVcCqjB/24hldXFlEAApsB6+xkl1Jp3N3ndVCcr7
 nWmJJAP7MerP6KqPh9zqbBqEZhmXFjY4p9r6sMftb6S2PSIzvs4enF7MUb14nwxuMEFQ
 jEixEQH6f7YFV0B32H/TBxnxbPNO36kLxHpMimAvXAFJAICYF3svMNyudVm/X1rZIgPv
 4ZCCnz53IQiC4XfnQAG8vaV2JE2cOZdFfPEWUxcDHu64Lxt+gsMbzasB6s/YModKdta6
 QQ4g==
X-Gm-Message-State: AOJu0Yw1pGYjkmIp6n+O5N0pkDmU5P34xp9+JC0HFoDlo49OwMLNy4EG
 VBRsFOvr/rwka7+ZK0EXdXYCUA==
X-Google-Smtp-Source: AGHT+IEukXtkhxctIYheonW/iYmntlPzi1K2X3CqyaWMuV7bMNSBXvK8qiTl3A40DvzuztZqnJrGGQ==
X-Received: by 2002:adf:fe83:0:b0:32d:9382:e6de with SMTP id
 l3-20020adffe83000000b0032d9382e6demr597604wrr.10.1697101297482; 
 Thu, 12 Oct 2023 02:01:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:01:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 12 Oct 2023 11:01:30 +0200
Subject: [PATCH v3 4/5] drm/msm/dpu: sm8550: remove unused VIG and DMA
 clock controls entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-4-4bcad69812d3@linaro.org>
References: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
In-Reply-To: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=++Bi8cH4RC4Ci18VYdr+nXDkhthNrYLCnBmBz4iTCmk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7XrXb/IO5VJJFZfdsNHX9A+kkQT2nkCTUmnHgwb
 nNgYhGOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16wAKCRB33NvayMhJ0bFSD/
 9OhqCvIyFQ7aUcjymxmgFCeHATQqz9XN+zuhGzRJlsfKekeyzwkMQhcTbTepE6GJNqpGYi9nJzP9KD
 VOj+tr4t5BESw35O1pRKY4H6m3xMgG1aGVuXxULtvpG6r94zMRN76o/950Dg4TSIIDA2bJr2hbeR3x
 wdwBv3k9dB6SCr4rfK71qFSFR7Z1YW3FO//M+77SWvBmmGH9tXLFTMvBLJhqAMHQ1MhK4wwbQek9FC
 pWQ9wfdNG+NmAOnryx4baeaAgIMNuookaPURaStq3oWiRNO/0Pj23zD1D8SxKO63V61RQRpFLA1Eu+
 22aJl8B8TRg5D+7md8KugKPtWplV6hkJmKVo+SuBhfGPgYJJQoJaOJBA4HDYSSDkXiXvkGDMyPgCo9
 n5pswIB3VV9EZmpUXLsrKlwaYZxubu9nxS2/1OZGphOVLGi5wS4COG47zNYflr/n6OGuzOrMnNvoco
 Atr3c2jq8SGxPp0xLeUcI1hyCDYlLcbqum8ncI2VMLhA4Y7pihyGWveUa4yV2HETOTpUPsYbTMyivM
 4L5bmqXBrMDoDMxmNBZpz9kZa5rG0XJeo0cLhAU5X95tO8+FJXD9K9rFix/QjHMFU8qwxaapOlrbpE
 5IAekPyXLFxCvNchvXyfceGSgFTW85cJ+HsI1WB/VNAkN/uIEuD3a/QNfkpg==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SM8550 has the SSPP clk_ctrl in the SSPP registers, remove the
duplicate clock controls from the MDP top.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 7bed819dfc39..4590a01c1252 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -24,16 +24,6 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
-		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
-		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x6330, .bit_off = 0 },
-		[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x8330, .bit_off = 0 },
-		[DPU_CLK_CTRL_VIG3] = { .reg_off = 0xa330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x24330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x26330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x28330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2a330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA4] = { .reg_off = 0x2c330, .bit_off = 0 },
-		[DPU_CLK_CTRL_DMA5] = { .reg_off = 0x2e330, .bit_off = 0 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -81,7 +71,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
-		.clk_ctrl = DPU_CLK_CTRL_VIG0,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
@@ -89,7 +78,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
-		.clk_ctrl = DPU_CLK_CTRL_VIG1,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
@@ -97,7 +85,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
-		.clk_ctrl = DPU_CLK_CTRL_VIG2,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
@@ -105,7 +92,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
-		.clk_ctrl = DPU_CLK_CTRL_VIG3,
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
@@ -113,7 +99,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sdm845_dma_sblk_0,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA0,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
@@ -121,7 +106,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sdm845_dma_sblk_1,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA1,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
@@ -129,7 +113,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sdm845_dma_sblk_2,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA2,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
@@ -137,7 +120,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sdm845_dma_sblk_3,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA3,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
@@ -145,7 +127,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_dma_sblk_4,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA4,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
@@ -153,7 +134,6 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.sblk = &sm8550_dma_sblk_5,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
-		.clk_ctrl = DPU_CLK_CTRL_DMA5,
 	},
 };
 

-- 
2.34.1

