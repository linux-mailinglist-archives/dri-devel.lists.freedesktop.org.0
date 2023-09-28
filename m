Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589207B1B39
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9775C10E056;
	Thu, 28 Sep 2023 11:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5110E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-503056c8195so21219460e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900940; x=1696505740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hyrq/9p6a7w92czNof0YScrpnYZ5+Pk4V0jGoWuhplI=;
 b=sRhDZ6bNIhiZNTg2HsMFs/sECbebAWdlWp2U5hymjDkGNX6pdvBVETngJuARpcQga0
 dhsSwbUAVDiFyKU+ZRD3DmuLeNJ+jrzVH9LdNIxKtXWs03q/FyxhQO8+qKbSatTAx9WK
 Xl+RXo0+sajoKqsZgOByFp7xRSqy3z6LEgdRf7KWQqyy5VeNyArY4VGLsgntkPyQTk75
 JdKkLwyEsxwkujzHakq/CXLmU54CrJgnvB8jv1vmcq/kMZVdIH3u61ExHjjqVZrlGcWi
 3qVb/M/ZvpwACGHI4igRlCu8CgF7LQvVADtynFUdxKfM0iiB8Q0jBR1QSmzaFfBRTkEl
 AxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900940; x=1696505740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hyrq/9p6a7w92czNof0YScrpnYZ5+Pk4V0jGoWuhplI=;
 b=memkY/tBSbu0s+fi70X5PiUqEE/E3SrJjttJlLUqSp1pl+lv290LRqByK5fyZv6IiU
 wZ86iI6AbiHCgoJSXbt4kuSHMaj+4kAmvqT9AGezqLKuEEtgrUKAKhTFP/DZkogTtkiy
 SSrX9jseeDLty+GPxa2oUbo6sKQwnooIU0cw8ud9aSKi4YpSj5mZbS4cLo7nJ8HDMgJF
 W+F1Ocfz3zfFWDwyJnc/h/RpsSt6OFAq2bf2dPBXvquNT4CU4YJf+HZjjWNSWuWxn4RK
 xCFa37GXs6mQE9qGG38kH2ANDHbC1MxqkX913sq5lYHm8d2kdUjl0IjmgXkCMT2vNE/S
 /IHA==
X-Gm-Message-State: AOJu0YxrcePMxXWP2O0zzayj171EROFIYmyPN7Udpt23VZZ7SjkuWCK2
 FjHYzO4LcgtFC4Lv5OofDRb6hQ==
X-Google-Smtp-Source: AGHT+IFaGDPZIgBROMCTUU7PTRhS1yzBK8TkZGSmBXT8o3kbeOM+J46ZFMC6mXAkSe2H9k0hev+HyQ==
X-Received: by 2002:a05:6512:3d0b:b0:4fe:2f8a:457e with SMTP id
 d11-20020a0565123d0b00b004fe2f8a457emr1000044lfv.43.1695900939987; 
 Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 4/6] drm/msm/mdss: Rename path references to mdp_path
Date: Thu, 28 Sep 2023 14:35:33 +0300
Message-Id: <20230928113535.1217613-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 75ec5e89894d..ec8608e22b24 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -40,8 +40,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -54,13 +54,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -70,8 +70,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
-- 
2.39.2

