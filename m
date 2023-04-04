Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764356D622B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59F010E6A6;
	Tue,  4 Apr 2023 13:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1AA10E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:22 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e9so18488912ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBf12OnN85lLXr2S1kvH2mCy0ARrul8R7LBr6YoJ4Hs=;
 b=n08Z3q4kPDlYbx6WmVcXB4A2/x+Uxd2LjIypA4O14tNKszfXh6kFRJSGdxpXrtq5+w
 FKr7MGHXIIZwE7F4ZJTQGidl0smtZnhFpX3dJb8rvH33vNS4TQm24V6w4YSl4DUW0LLE
 cptR7BcM13xG2DhocBlGvPyk0numZ2zOGeL0RCgv1xnz8l+fYYes3EDhe6ePVt0/ITJG
 Gn7VF/r50pfRhQ+NIvmCUqe8V3JTz9oqJtOiElK1xXpv3CX5N44f1QzlcHtOw+0L9ujz
 bTiyz6+blXntt0pCoZdGMDB78D6EhN0iDNL3+KZD4Ddeact66S/WGJZuQz7w+tCo9ZGV
 QSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBf12OnN85lLXr2S1kvH2mCy0ARrul8R7LBr6YoJ4Hs=;
 b=WUDPkWCd6T3opNYltiq5yq/MqWvCBbkAN7vUYdzStj3aU6FvZpRP6SHz7srcVcg8Qg
 Ti+HRVRlvW71PJJKET7lMCnZwhdIP7NcWrM4Uh/ydPXc821PsgGlBpNwHjYMdQEUlmC6
 pSNgPtPZChc6zMQceo/ztc9SzySPFC2/FGPGss3tNpOUakzb6UjZBpv3kGl9fZ7tnfLN
 BrGaiVhCyvm9g6S9g5VOqcwzPOhoJZcLBSOtQE8jKTEE7dDmdwS0BtNu1MhPSx9VVioj
 dEld9LogJtqLWTXqwa5bs4vSI+KCE9PI2DJIq6SH6Td3MMD2D7lS2vKmp2NHsB2HwUHd
 IkKQ==
X-Gm-Message-State: AAQBX9e+tq9S3PrFiEhoDYwL0b8CnK+3B3mRlx9Xbubh6L3cOYkt/Vri
 dko6TQGg1aP9zXBwZtoPY2y10g==
X-Google-Smtp-Source: AKy350bqsGv91//A8AnJM+l62bqmiv6ipFocDcqOBaM6Emk/muHRvdLKpYAxgHpkZHc7sMJeU/jdpg==
X-Received: by 2002:a2e:a307:0:b0:2a6:18c0:2b3c with SMTP id
 l7-20020a2ea307000000b002a618c02b3cmr954134lje.0.1680613761645; 
 Tue, 04 Apr 2023 06:09:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 27/42] drm/msm/dpu: expand sm6115 catalog
Date: Tue,  4 Apr 2023 16:06:07 +0300
Message-Id: <20230404130622.509628-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

Duplicate qcm2290 catalog entries to sm6115 to remove dependencies
between DPU instances.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 50 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 2 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index f6db2d42a0ed..e741cb3e7888 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -33,6 +33,15 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm6115_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -40,6 +49,27 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
+static const struct dpu_lm_cfg sm6115_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
+static const struct dpu_dspp_cfg sm6115_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sm6115_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+};
+
+static const struct dpu_intf_cfg sm6115_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
 static const struct dpu_perf_cfg sm6115_perf_data = {
 	.max_bw_low = 3100000,
 	.max_bw_high = 4000000,
@@ -74,18 +104,18 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
 	.mdp = sm6115_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
+	.ctl_count = ARRAY_SIZE(sm6115_ctl),
+	.ctl = sm6115_ctl,
 	.sspp_count = ARRAY_SIZE(sm6115_sspp),
 	.sspp = sm6115_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
+	.mixer_count = ARRAY_SIZE(sm6115_lm),
+	.mixer = sm6115_lm,
+	.dspp_count = ARRAY_SIZE(sm6115_dspp),
+	.dspp = sm6115_dspp,
+	.pingpong_count = ARRAY_SIZE(sm6115_pp),
+	.pingpong = sm6115_pp,
+	.intf_count = ARRAY_SIZE(sm6115_intf),
+	.intf = sm6115_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 105fa05454e1..e338155e2b82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -884,8 +884,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_6_0_sm8250.h"
 #include "catalog/dpu_6_2_sc7180.h"
-#include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
+#include "catalog/dpu_6_5_qcm2290.h"
 
 #include "catalog/dpu_7_0_sm8350.h"
 #include "catalog/dpu_7_2_sc7280.h"
-- 
2.39.2

