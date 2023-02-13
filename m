Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08669455B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BFE10E58A;
	Mon, 13 Feb 2023 12:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218F10E593
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n10so4357066ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CCpIfLPbXHR0+gI6eH61855DNORB1t4V7ruf8s/UBM=;
 b=e6Aan7qtCOxr5uDXtDUzG8ZzspEzCH1OWMJ0ANGQcXzyajvonRNGcX6E0PQhMK4ubp
 EsPdEK1Wt604WHWLzA3gocqn/O1Yq94/qGEba8CgTeyagFyb7flx3QKyfofC3W/xkCgX
 o+sXtRr2XFkzKQ1IHWlOe974Tx8NyoXi7U1wDyvxRwE9dY5XiLtkhS4ZD1H0NH8ZWpoL
 QmsZQtnpFQUC6s9T5aIBzqb3aZSSAp8pptCpVljhu8TnskssVtGavxxFQh6KU+/uJ2Ku
 jWqb8xl9JCMUm2kAVGuq7rgS1xyblVvB4EaXZwNwCI1JYGR/a6KtL9g0vx2gUxCoc6p/
 BErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CCpIfLPbXHR0+gI6eH61855DNORB1t4V7ruf8s/UBM=;
 b=w/26wArcW8btnupShe3kT/n6RjyVDPSA9u6nNlBMCrT8W3OT6lEFmJy1JuA9eakaoD
 zPKsGDQAriAkZ0LAWBIyOd6rqYmEt6HbhBUrg0QKxIRXjL3cMgqr5swTmwYCUUkcJ25e
 on7j4rNt2lbK8ZpNMcpegTjKmnNf8IpkxTIkhesNYj6ZxS0fnti/bb68/skxE8QoDHih
 FfVRN4UHbDcx+Tse/dRADVbv6uxMyof2Wa1WkX4KRS+U3gvim6MwbYLBhpChE88KMYm+
 t90BS4mW62ElE+BLwluAbE6c3/T1kQtIPi5CL2tMePCgf2MfMgNVpYXNLQ7r8qINacSc
 MvOQ==
X-Gm-Message-State: AO0yUKXwFDguGIQqQEts3aATSkUn3W2mKDvv7R8b1KbQ4VV3KkQK+pIe
 WkMsqYDf1irsSEGR8WACaSe00A==
X-Google-Smtp-Source: AK7set9FUwNWxLhIYL/63n4aMNiaV4/BAVMRT1B+FTa/0pk9vzPH8kUQq52WhJU8S50AgOqvsrqlYw==
X-Received: by 2002:a17:906:584:b0:888:6294:a1fa with SMTP id
 4-20020a170906058400b008886294a1famr24306942ejn.14.1676290230754; 
 Mon, 13 Feb 2023 04:10:30 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:30 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 5/9] drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
Date: Mon, 13 Feb 2023 13:10:08 +0100
Message-Id: <20230213121012.1768296-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index d39521850018..6d4b2ce4b918 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
 	},
 };
 
@@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config sc7180_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0xae94000 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
-- 
2.39.1

