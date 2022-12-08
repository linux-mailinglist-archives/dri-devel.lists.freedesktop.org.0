Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7C6465AF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DCF10E449;
	Thu,  8 Dec 2022 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD70810E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:08:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x11so22709482ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbAKHJWrOTkMAELbvt2QMnXAO5NByRRluyCbsXhWCPs=;
 b=jAl25flR7nlMAESp+VUdSq60nP/4NJRliKy7nLuYm0k6v0QZA8n/Jqoab30ZmYhmfT
 m/vCR9nw3EVb08VIhiJwt9LCzUQShMLJNUUQq9GlRt6Hh+MZ7N3BpCdBZxenc8RO3VeW
 56orTWP4d/jCXamGptBZ8pwv+xh44UCVtDcvGga/rW4KFXdYexs2MCCbfpREHRPVArB8
 i14AJ6bvVLYkWeaAB78VqZLoEj68WSI/52y1IW7zydgXM+aqAz9SEjABK3yPQ1dOrcTy
 6w3le9b1XJ5H6VgfHTywpm3dgwzMzaIkuJuKzn73XSqgrS17MWNlWk9p64RnM4P7zVcI
 Er1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbAKHJWrOTkMAELbvt2QMnXAO5NByRRluyCbsXhWCPs=;
 b=oHogyQ3e4sy0pRnQ0WmBWXa/UlYNW4vNn2hhFJwGDVL7s68C+Zmp4dZa+cU2kCUnQs
 MGI7dW4sJW3aLnwcTquLumQoz12e6pjvp24dFkAY0+dCtuqu5e9pkcGybNCk9/z8eKWA
 q0O0SjZLsA4NOfzJTLnIu6ASrUB7Y4YFKQxqIMk/pCNJPmVaW3lubOrOogN/ATY5WNLL
 3nes+6o53KAheeMKy0BrruvBlZN3Xw72AG6+2oMuUb1Vgh2OaLpsgvnh+Z8Ejulf767G
 Qd+bxWSyUcu1ZDaRJYE5sAYVFYR5qh+lF7ZPmyew1F3u7uG3zBHLccneUHfuKCwaxcS6
 UcQA==
X-Gm-Message-State: ANoB5pnhwIqbTBjOCYNcV21j9EptaLPXZ1aUEBy1ZoITNW7i4FN5LtzT
 8h6obsJzSZUmk6+fFGsYZO8RFA==
X-Google-Smtp-Source: AA0mqf6rg1/8mcTW/Evo411C8zTcTr3dplVLsHsFrB4xVnO0HLWXUW2rx18TnyUEHHMZp8ooRWO9bg==
X-Received: by 2002:a2e:a717:0:b0:27a:176f:5263 with SMTP id
 s23-20020a2ea717000000b0027a176f5263mr2232103lje.451.1670458134634; 
 Wed, 07 Dec 2022 16:08:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:08:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 4/4] drm/msm/mdss: add the sdm845 data for completeness
Date: Thu,  8 Dec 2022 02:08:50 +0200
Message-Id: <20221208000850.312548-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
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

Add the platform data for sdm845 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 5e19ec897670..b2c6e8b12469 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,6 +532,11 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm845_data = {
+	.ubwc_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.highest_bank_bit = 2,
@@ -556,7 +561,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-- 
2.35.1

