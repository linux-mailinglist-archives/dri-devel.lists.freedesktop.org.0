Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8D801F2A
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5F610E22B;
	Sat,  2 Dec 2023 22:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1410E22C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:42:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bc4fe8158so4741950e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701556970; x=1702161770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tg6ik6jkhCoYifkR5PJD5UGVthg925S5B4jBHf5xlEE=;
 b=TBP2SNdLmQlQjhyYWeEwdu5T9EwOcjW523vDHBfG0UuPLOwckbZLG0yEEB025K5MuK
 7i7CYOEF/z6VWI5FKHGOWo8kmq+7bxzkujEOGVftWSpSY296Yp15Nwn2CYA4M+Ap1zWR
 DZmfXhualaOyrbR+8XlajAl/09LdASLiGjIEVePrdlGaIP92Xz5ubOCdMJVfL4Trc0g8
 g11Qutkupd8h4GhZfsZIN1vqplWQSbK4T7/BwyKDJCEo+OGdpJNESOHl3vGyfnMoGboB
 QgYmmQvuEGY5odJUdjj+7zUIbKqqNUhCrTgR3QdlA9dU3msX3tXlmb2RG5a+F5gM4FjS
 sC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556970; x=1702161770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tg6ik6jkhCoYifkR5PJD5UGVthg925S5B4jBHf5xlEE=;
 b=m9hNwGSIk8isK1ndd1YsoxGEgJivumwNAi0UMa5D7DsR7SQgVYWKfvv0wEE9Wt8Hqi
 oGCpW6BzLcv4I3ZSXbnsKdEmxe/KZYosEp/L7c/SCm0L2sLFZUGxLbD8VaoMa2n3io9Y
 Ko4cddBoAsYQCryTUp52j35CCCIUUiqr2UdjVAfrcv/Gw0aQSeenu75dwEUH6hKB1Jl8
 0GNVPD75kpgzG0DPr6Sxo9pUy9/BA3LXcdQ8Zjsjc5ybIdp/GyFZvJd7PR7JdhGB5ojj
 Z4ePILKl0fO6q39/SN47AvspjcKjS9iPmdWoR5SnM2y3PpZH9hZqAJa1+d6enzbag9Nu
 7ykw==
X-Gm-Message-State: AOJu0YwsTQJ1UR5aH8U+F2eC+b+xUTFXh0qDC28fiqMBxjN947/ayR3b
 0mQjQ1NCpfb5yrpxLepepcRD+Q==
X-Google-Smtp-Source: AGHT+IEye2IVR+NrlvezqDcD6ayk0gBP0mIG/TZ5I9WBZeru+5TsGk2sWcqpSzPVYcFa+ELtckQ6iw==
X-Received: by 2002:ac2:5e83:0:b0:50b:ef70:8d66 with SMTP id
 b3-20020ac25e83000000b0050bef708d66mr333083lfq.26.1701556969996; 
 Sat, 02 Dec 2023 14:42:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:42:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 2/4] drm/msm/mdss: Rename path references to mdp_path
Date: Sun,  3 Dec 2023 01:42:45 +0300
Message-Id: <20231202224247.1282567-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
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
index 53bc496ace99..e1b208fd072e 100644
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

