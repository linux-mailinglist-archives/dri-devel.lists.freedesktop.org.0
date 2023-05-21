Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA670AF23
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBF810E1E5;
	Sun, 21 May 2023 17:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5789E10E1E1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3a99b9177so3768005e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689030; x=1687281030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jI7VDuf+wVk0mRAdywf1CkCHbY9wYZmWigDIurIrlRc=;
 b=yEuJsz0R4N4jUpU7qbl1T1cm+gRjwnF5uhNv7yiVyejSvlEu1+1ZrPXiIhbssKeqQM
 HJ/yEPW0WJ2jnyJL1jwvHQiq0TVeEvgGSt0lI+9NxlzHFhKG7DrLa16nLUBtcuLQHgT9
 2ZwEBRID1J6Ohad08tUx/uwD9U6mJow09jFj6gXzKsyDItYqYopdJikE1MCRNWgE/okY
 zzybXLwJ/Ezrc+trXHaQG7OOBbl46Eb0eLLV6rhJiKWizvJEIqjrqdczSVYL1llZAMUw
 drda8aCr4+C8m5NZoevs3dJU8IkHSm0BuMQ//lOwSbj+mmAIEajB1TbytFMx4MI21nal
 +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689030; x=1687281030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jI7VDuf+wVk0mRAdywf1CkCHbY9wYZmWigDIurIrlRc=;
 b=A/yvbZ660Mue6oN7nUP0Ag4jsh5ruyMnodFArT3juDB/H5UmG7WrLpnFbNy3Tspq/o
 nUa0uJUedlpnEAhQ6KFAarXPxSgVJ9ifsjSsWDl3BFMYfm71HA260XsV7WCYY41gvceo
 wOc7z09QiDZJJqEXPzqDKfc14mKvEqIv5VFgoBUlSa9qXOAJM8p8JXlKDbjRJQ1KWbBG
 Sev7QOQt/YpvHWJQWkRsxos8vzR17NSBaWDXFxPl3exnw4wcBS+kovaQ6CnNwVd07ggi
 E3UxYPg80tOoPSdnzVUmm5VEGYKqlHjLiXf7dhZXAi0ihVkNyEfy1HoJwJaZJKBBJ/uF
 yuUQ==
X-Gm-Message-State: AC+VfDw+w+S39LKZanTQvMXn0jTMCuywVzW4VF3SYduedl1y/9bwTfE5
 1nGM1+gKPsw5OQxV9oRnFi4AzA==
X-Google-Smtp-Source: ACHHUZ5chHgC9+Q8T7lmlsR5sggu9lK5opSGjKGFGPLKPUwSYG8GdhGtjedD7sTACl6VCVxkCczfHw==
X-Received: by 2002:ac2:5feb:0:b0:4f3:843a:7290 with SMTP id
 s11-20020ac25feb000000b004f3843a7290mr2218366lfg.52.1684689030081; 
 Sun, 21 May 2023 10:10:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/6] drm/msm/mdss: rename ubwc_version to ubwc_enc_version
Date: Sun, 21 May 2023 20:10:22 +0300
Message-Id: <20230521171026.4159495-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the ubwc_version field to ubwc_enc_version, it denotes the
version of the UBWC encoder, not the "UBWC version".

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4ae6fac20e48..d1e57099b517 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -27,7 +27,7 @@
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
 struct msm_mdss_data {
-	u32 ubwc_version;
+	u32 ubwc_enc_version;
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
@@ -205,10 +205,10 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x3) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	if (data->ubwc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= BIT(10);
 
-	if (data->ubwc_version == UBWC_1_0)
+	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
@@ -224,7 +224,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 
-	if (data->ubwc_version == UBWC_3_0) {
+	if (data->ubwc_enc_version == UBWC_3_0) {
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
@@ -507,13 +507,13 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct msm_mdss_data sc7180_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 };
 
 static const struct msm_mdss_data sc7280_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -522,14 +522,14 @@ static const struct msm_mdss_data sc7280_data = {
 };
 
 static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -538,26 +538,26 @@ static const struct msm_mdss_data sc8280xp_data = {
 };
 
 static const struct msm_mdss_data sdm845_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm8150_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
 
 static const struct msm_mdss_data sm8250_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -567,7 +567,7 @@ static const struct msm_mdss_data sm8250_data = {
 };
 
 static const struct msm_mdss_data sm8550_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-- 
2.39.2

