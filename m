Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AB675F3C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDBB10EAA9;
	Fri, 20 Jan 2023 21:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5615B10E29C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so16943521ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
 b=VhpZPNA/QWJFVRprlhHEdvq+/+4H7v3FVGVD04GyVD/EUEJFdD8RyMe84kgUEPUhWd
 CSPM+LH1fCURhYgTQa64yUSi3WnWL6zjKgNrnJwZnLqsAmscVxGSMUxPpNSJBAWPLAR6
 lUsuDtnasVrrYyhkGq9VB/ZHvxzTw2o3nc/q6OBvDQRT+WN28CE+7zlbdJTO/DrtdM9P
 kAx4wx9IGN1sWaBT2h3CHNexWt7VBNhIZ3a/7+uxHYWSNjz8Z+AJSA1c4l4/oVMG9q+R
 ZHPNZRWukpuWZCcns72TNlvqN2y/UGD3CjG94LU1GCQloe+M1+8iPwj7GTWVCD3mPjBg
 2frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
 b=kpdd8E/Bk/qtrofXGUDFjPHE4YvsVj6MIEzk7pMirbx3sD8GryqEkZ2CNccdeW9yIU
 qjA3R3elytt6O3GsLQgvRqYRkzJ/4DbudF7vNMf5eBscLHYHxbxLtIc/Wx8GYd9VXgxr
 Tr2lmEdISJ+MEHk6w0cstTRRKGf0Mc+Ad+ZdWkaWs2u8Fqe0ga0vwG1RS4U5Qh3O/jVU
 TMsbbPLZyNEgnZUXkGNICwi9A1FMWnyyeq7+mOPGbDBvI5UeN6BwDt2LANqzAKoPp4oK
 QUMWNpqXSFZqSNO/bXueogl1Re8/lNpfAImVJCVhzNekubWnVhnswBcqr88FiM/K7/j8
 fG6w==
X-Gm-Message-State: AFqh2ko3M78levdZOQqVZUi6JUC0a8tO46gRoplOs3qGBhnUil52pQcK
 sIgisKSBgONqcDSA0UCWhL8HBw==
X-Google-Smtp-Source: AMrXdXuKJBPk9bfYe2DX44R2Ihfk454JoHlIi3euiHm+P/rLKqXOFKfrzF2JNOubZZ/RoJp5TRlvPg==
X-Received: by 2002:a17:906:3741:b0:861:eb6e:8019 with SMTP id
 e1-20020a170906374100b00861eb6e8019mr14749113ejc.69.1674248472796; 
 Fri, 20 Jan 2023 13:01:12 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
Date: Fri, 20 Jan 2023 22:00:53 +0100
Message-Id: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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
 Loic Poulain <loic.poulain@linaro.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2.5.0 support was originally added for SC7280, but this hw is also
present on SM8350, which has one more DSI host. Bump up the dsi count
and fill in the register of the secondary host to allow it to probe.

This should not have any adverse effects on SC7280, as the secondary
CTRL will only be touched if it's defined, anyway.

Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 33884ebd2f86..6d21f0b33411 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -223,8 +223,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
-	.io_start = { 0xae94000 },
-	.num_dsi = 1,
+	.io_start = { 0xae94000, 0xae96000 },
+	.num_dsi = 2,
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
-- 
2.39.1

