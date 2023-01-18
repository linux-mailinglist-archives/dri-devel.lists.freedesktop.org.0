Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB083670F5D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503E110E622;
	Wed, 18 Jan 2023 01:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C56610E610
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id vw16so16454401ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
 b=AT1Pog3PcNorxTSf251HHthQzeLgINleh4Jm7oHRlPpYH46sS0Q9oNfI68pErWMRG6
 /q7+OS1uKFtcOdefn/Kjyolkv62aWR1x/RBGZCTuDeJzu4VJvnjwlnRhgs0q5SI8TJeO
 gmUCY1vVe+E0kJ8zmn4ZfS/xmDUew6CofUd9M9IrgmAsLSXznbzj0DyVDQFCYzY4koHH
 teGSYAXgu++y0E42dA6+39ASkg1ycXfRXfcLDKRNYPnYLm4u8fQDTyEp/qtOVI+Z0bDw
 qj7XJgi2NennnXnJhsLJCJUao89TzxZqSG1dXjX6mAopTlsURaVetzCrZ0eNuH/RDWJv
 zq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
 b=h61CLpYmJMDHHnmC3niwItBOvf0cxKfjaxKeYDnO1Ne6UTc4APoHwaALL7qJmPkOC7
 M2AW1dObjHKisCFJA95ri/RMguoWtFYz+elPuvdQXqBqDAyCc6QMlJJQ0NLmAMTGd6XH
 hieB3qaavoJnEHPUghEh/KMtcZwAh3gKoa1JGEIyefCWDY4VEcAJp8wh3QbkOVQyIPX+
 Nc6nSy27DAOst21DfV+k6ERgtPQ54vz8W5IUlaUWeK2EdxyVZSaZvIS90wjxQSDh/kGh
 Doo5h3IM0R/kMimX/CFQw34rDBfiVnzodz0xKwyLfl/XNoLgOk5z4Hi2Sc+44I31BYnr
 MNMA==
X-Gm-Message-State: AFqh2kodegXFolmG5om74kiSPXyz6XdEJNOlJWe1DnIw7wxTMU3B97Pv
 lAR/dJzTW8O7JZq66MPx+9htZQ==
X-Google-Smtp-Source: AMrXdXv/DJl6VMwscZYu1N4Y0oWY34Lil+ABtbQJSPHsIb6SSMQ41aYxuz+VnhkOiNw6WUGvnwkCNA==
X-Received: by 2002:a17:906:1911:b0:870:29fd:be41 with SMTP id
 a17-20020a170906191100b0087029fdbe41mr1043765eje.48.1674003872748; 
 Tue, 17 Jan 2023 17:04:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:04:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm/mdss: add the sdm845 data for completeness
Date: Wed, 18 Jan 2023 03:04:28 +0200
Message-Id: <20230118010428.1671443-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 158d7850c4ba..c15d1e2dc718 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,6 +532,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm845_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -559,7 +565,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-- 
2.39.0

