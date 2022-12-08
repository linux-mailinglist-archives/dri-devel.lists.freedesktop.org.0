Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFA6465B3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8126910E443;
	Thu,  8 Dec 2022 00:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9702A88FF9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:08:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bn5so22730703ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFLaHZzkiofOVWIbXQa8n2M4jPc4703bol8Amy6xF6Q=;
 b=q4QZscJbVJ4+cMD+Sd5P4PS2VTHzKRk2e5IlSgibIu5y9guIxKS1LXNQaHZiPWm+Fc
 WcoZOAgLCb+qxrKwRDeRVhVHreqdTjhSe+WAx5zlUsgFtjyC475KrjNUDZP008mHnZcz
 IJQMhkfX7EN+R8zZWOrry4aLzuzUz9ghbsSSA9byzC0s2AOchiyiGRHxhZ6dPLy9Ld3k
 9dwcT0a8ipDVgUE5JnoDekBjuRNTJyJBJEdgRCO8EhXu5+uFXVdS2jUnuJKDqP8Rho22
 54ZegU8t5SOwNKSOu0Rka/1mJyjEbpcSHC7PKAWpwnDgFCocDPRnbB67X9qqwU5wXxYH
 1x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFLaHZzkiofOVWIbXQa8n2M4jPc4703bol8Amy6xF6Q=;
 b=tiJS7MJ1HuryAocjmZlZHCynu+tH4l+/tXZPcbn+wyA3UDjnFud0o8X8s8AQNuhzH2
 bVMGr+WaA3ECrvz1iWTP7lilpavjF9Z773juS30YDWdCLInGGXjB/C8MUILhttLrtdiB
 L5dyBn/LwZT+vosdjgp53v1SalT4sPFgBlHphcsAsl3eQzmX7tdkbHLWGHzRQJJ4N9Rh
 xDpvfY7V978lmscOT75q5o1Xc7YgDY4GKFGc93hPXKvEEkv01rmzW0U0ZZ+i87BG8QRq
 dtYSwGG2wD6GqPpPEkMYjWpou7nscbPoQE6DeuBZlD3F9ZfcTsqD03adNZpVjyjBrHqr
 mpzA==
X-Gm-Message-State: ANoB5pnVz6aRMAfMDn0L/H/U0GZZ/+tz3CG51QuWm2oVzQMHidBB+AQ+
 RysvI6ENSWB6BqfVJpjsTX2z6w==
X-Google-Smtp-Source: AA0mqf5OGwIKsS/5oBYlLFBiB9Kk6hm9x1GyIUM8OdXypovLhfvBw+K61Qeka6zugKsZ01GiELeeAA==
X-Received: by 2002:a05:651c:171c:b0:279:f169:9b53 with SMTP id
 be28-20020a05651c171c00b00279f1699b53mr5898335ljb.132.1670458133887; 
 Wed, 07 Dec 2022 16:08:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:08:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 3/4] drm/msm/mdss: add data for sc8180xp
Date: Thu,  8 Dec 2022 02:08:49 +0200
Message-Id: <20221208000850.312548-4-dmitry.baryshkov@linaro.org>
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

Add platform data for sc8180xp based on sdmshrike-sde.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4401f945b966..5e19ec897670 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -518,6 +518,12 @@ static const struct msm_mdss_data sc7280_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sc8180x_data = {
+	.ubwc_version = UBWC_3_0,
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
@@ -553,7 +559,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
-- 
2.35.1

