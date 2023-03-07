Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC96ADF8C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348B110E4A5;
	Tue,  7 Mar 2023 13:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0B710E264
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g17so16971748lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=55lMFXFd7GmMBP4PF1xB1lq9Cw+L1BmijVr1G6D/aP0=;
 b=fRfy53cEsWZ9faDm5Cd0zlm9rKYQXRpJVLFZt2OVknK3ljQGsqfc1ZQHGRstMJeatU
 OPNPlp0mlLvJU24T7Nyi8DLtqzcFambcmfWwoxANwdKOiJ65QD+CQO9PA2/l83lX8D11
 S5anBLqxPqO+SvQKASzZmsVM83CV4tb83LwMfSs+zLGWggOAgOAMu6EFsexpad7x81Pc
 GSrwhcqCcXOxQO2j+/LxxXQzHyRjggC+mjiIZ+fXZIijnNGYN3u9OaKMiZ0Ii1+2Q8kB
 gCki9l2R1n6B1KK/Cid/IQf8Opf09tq/aIn3JN/BAPB3PtCUE7cB2LMgVBnNY6pM4W19
 34AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55lMFXFd7GmMBP4PF1xB1lq9Cw+L1BmijVr1G6D/aP0=;
 b=0sD9HZHwpM13FOTz6BbjyhWtapN8yKbYi3Zu8FUFUyqR6mHZPbgfbo0onZ8jY12VWR
 9Es+ilrgHhiAuGrTYOImBDJwShcFJBhXV7xEU5m2cLR8N2htcdk3yv9WrTb1UGWx7DJr
 JkBS0j8gp2utm3OGVeewgyceofxjgDMt88JRtE3ZgrQEO+J2PTOWgNYaLEiqlMu4obF5
 Rpro7BcN/Yk3dMQqbWacNPE6GuGW1rdz0A//E00QZKGEyWTHdB1KASAehvekIc0rKZHY
 eAZo34kSZ+i5nWpKE9mVyLUzkWrCKOyp5OSfFMtTZRXXkMt2Pcexgyhl31gQEp//96Eu
 woUg==
X-Gm-Message-State: AO0yUKVKbs3nSxElggUINGBM/8Zr/89KgZCIMV1SewCtcdOHqja1HnbH
 sxk/MsWe5k9+aXHAm+ACQDzcVw==
X-Google-Smtp-Source: AK7set87sMy1FszPQ3DFVXd9IWgFz6raEtqYLt7QEcdv4tEsY/E1WspeaJtD9IFkiPEzi5szujvaZg==
X-Received: by 2002:ac2:5df6:0:b0:4b5:964d:499e with SMTP id
 z22-20020ac25df6000000b004b5964d499emr3789572lfq.8.1678194109317; 
 Tue, 07 Mar 2023 05:01:49 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:49 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:43 +0100
Subject: [PATCH v3 05/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-5-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=2145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FABCSvB5sJjrFfkmtzbHoBqH7FB7e/a49B1A9lWjwfw=;
 b=TJaWnNwL/YZbaSACXrVBkph5QhvBKJ7DBK7miT7PVfOpKqHUafq2Dask7moFQVTIwwTzqjuhfKpq
 l3JDU3AHBjIqQEBaUWt+8I/wXLi5YvT06nylSKUYBAdJoiNNtp9y
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
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
2.39.2

