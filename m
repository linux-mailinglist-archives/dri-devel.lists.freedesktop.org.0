Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D472CE06
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE27210E2BC;
	Mon, 12 Jun 2023 18:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B9710E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:25:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f619c2ba18so5290480e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686594336; x=1689186336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9Wojx8CKa0fNsj3PWh9HoNqa1CUIodoAFt77duCrjQ=;
 b=nFgAZCUI/1tlMnEtguQZ4L2eUtklwJLryWFg4VXcDBpX1AieZuKajcF5QBL3D/HEBk
 tNB6rZaOAlO/wKSqoa7m+FJI/m2asfcl23y2xYuQLuLskk0nnn5L3UyW2OHt/IvdnW5S
 7K8JAoiq8tKDzsaBaxlxGuFSh6S984x2qVFHokyforSiSPos1YlYPCBWg1Ux9V4/qlvZ
 c6T/LB72ftaiAadxE5eD32wo51kyGW0H/EkSA/necv9SS9GPh+Iprfls5Xtj7mYmzsb7
 1A5GY9x3Cs2ABCu9B4NSzJmUT6aL0U3zUax6IEkwOjsNnhoY6NGGc1q5a8Sn/U4A2aMf
 ov9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594336; x=1689186336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9Wojx8CKa0fNsj3PWh9HoNqa1CUIodoAFt77duCrjQ=;
 b=UPEspSFPm0Vk58UTHqkJPFm4U5uflAzk75UY/0IY02cep4/rCh0OgzFcKHWxWypDP3
 8StH0YAsI+P24CbHmC3S3ORd/YWNa9Ing2lFbRa5r4z6xM38dB1sumVo3bFCQpzSg4Zm
 DRyPyCqGhHCOeHhO3fCoDY+rW0GuF3sRgr8iKwmLexkhNDbGR0qNS6sn3Z+yt4NmKkre
 SZcspH368gtB5+86k4+CZvPyhotnwtTAZ6gQCCI5VBZBdx5Wz4btAfPdjih3y8l91Ylk
 tFhyRTUERr/8Wvi8uVUhMpwKQ+XNGHSmNgfY/ZDkore18ejaVYPJPZ51zZNeb9KHVtGZ
 QUag==
X-Gm-Message-State: AC+VfDxGZEK24SutSM0xS+RszfXhuMkl54rY28lJAV5LNJ2O5MpfciMQ
 u5zWUUA0qIwZ+NZOkD6ZMsCU3w==
X-Google-Smtp-Source: ACHHUZ6578JElAAJEDCsUrnC1f/XMi/IpFjcTFO30GFGBTTaAAIYCSZWM5flDs14jhM0MPgfoXrnRg==
X-Received: by 2002:a05:6512:44b:b0:4f2:6817:2379 with SMTP id
 y11-20020a056512044b00b004f268172379mr3843186lfk.23.1686594336223; 
 Mon, 12 Jun 2023 11:25:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v16-20020ac25930000000b004f63dd1dab0sm1503396lfi.98.2023.06.12.11.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks found on sdm845
Date: Mon, 12 Jun 2023 21:25:34 +0300
Message-Id: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definitions of DSPP blocks present on the sdm845 platform. This
should enable color-management on sdm845-bassed devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 36ea1af10894..b6098141bb9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 
 static const struct dpu_lm_cfg sdm845_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sdm845_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.sspp = sdm845_sspp,
 	.mixer_count = ARRAY_SIZE(sdm845_lm),
 	.mixer = sdm845_lm,
+	.dspp_count = ARRAY_SIZE(sdm845_dspp),
+	.dspp = sdm845_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
-- 
2.39.2

