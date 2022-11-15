Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29B62971D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2578B10E3A2;
	Tue, 15 Nov 2022 11:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFF910E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:17:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s5so5171494edc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hrGveRHtb758Cq8dNpj5YeNPoOq0dxmeWZsx/PFkuqU=;
 b=wPIr2QyM4TXPHxrBhk86NI7MLxmXhxV5fy1U8mplxl2k9kUPlNoatw8IkmpXjiF37n
 Azcs0Z6Du0JONg81MSZ3MVxtXek5uDq5mX0MpGDVPt+WdGu3smpVIoxp5xzRFKQ9gFWP
 bzAoMXm+B3dOgDTFeltMu/dStKrvH2014zbEDSlIoXeQgKk6jHJixKSCBLvX9HLsTMko
 B3MKnL5ZbtyOXiwzNHvoGGDH2Z8qq/gpcuQqXz6b/UJEp/eCsZMzpTynJa06FsiLK6J2
 vELCmCPNkM5icGYA3Uoq8uXyJCDwM2cC1ZlPIP+GTxu2BnPWr5qwmuiQJluN9EDkU0tO
 d1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrGveRHtb758Cq8dNpj5YeNPoOq0dxmeWZsx/PFkuqU=;
 b=53PzBGo3HK+Tst2YKrl/mPPfwr2xykOHA8o4/NQSmFtGh9r75Da6b7mC74Ieos99sV
 l4oRBFqe57XcLTfS7DCVyheUKc4l3do0JGNtfNXt1H2pOMA3vLYy9NAVwIxOeMb8lAvW
 3fxbK8yAtCOmo004zqZYyiehEguR52KLXdb8aokUVEvP6HRJOhCf7fX6UWc5rJZoZTct
 eWKVkwj9nuXphMO76hAtgNuCzfRodoBHy2QrPOVp4l9N82Y/Fn94CvlvYl3sSQ2sCkKY
 Kdjzr/99dwyv4Hi3yzxgUMCLIkefOvnu9Nk4/kpWtDG09+Asc8sz10aijP8jrA6ttieX
 WZ5g==
X-Gm-Message-State: ANoB5plwULB21mAfQbTs9pFFfBOaTN1zzJWwqBYT/kNEvwufGEZKFZ6A
 9XpGNz7HIiVb0o1wRBiqQaEv1A==
X-Google-Smtp-Source: AA0mqf78alD/NNz9Bp9fD990P3oo3VlMa/dbTMy/fN7ovaLbWIJVLcruichbaiGy5WkmIGuoUEDBig==
X-Received: by 2002:a05:6402:1141:b0:467:3ea2:3ec4 with SMTP id
 g1-20020a056402114100b004673ea23ec4mr14673116edw.351.1668511065973; 
 Tue, 15 Nov 2022 03:17:45 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm5973519edb.27.2022.11.15.03.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 03:17:45 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, quic_vpolimer@quicinc.com, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 03/12] drm/msm/dpu: Refactor sc7280_pp location
Date: Tue, 15 Nov 2022 12:17:12 +0100
Message-Id: <20221115111721.891404-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115111721.891404-1-robert.foss@linaro.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc7280_pp declaration is not located by the other _pp
declarations, but rather hidden around the _merge_3d
declarations. Let's fix this to avoid confusion.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4dac90ee5b8a..8f2d634f7b6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1294,6 +1294,13 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1352,13 +1359,6 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.34.1

