Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C138A76CF36
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 15:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499BF10E191;
	Wed,  2 Aug 2023 13:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2710E191
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 13:51:48 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7658430eb5dso647520785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20221208.gappssmtp.com; s=20221208; t=1690984307; x=1691589107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l1zIwGQ1HZMb0pN+mUSGNHuePnalac4Pl8tVWYqsfVw=;
 b=nn/5AxkS768/jvAiPhVwNmrYfMymkvIhBxizk84LoThX/jtNxpq5b3gruU6lrYUmjS
 yLmNxZXOnJ3yALNI2clOe97krKwCf2yvznzlmKTEau/BsR4mntw25XMynGRXjWaqFMip
 9wsASCi70GrftHbVGekSQyLRUqFTiLc8d0SP9o/SUo2LaJxwl8WP4H0xoEDgCTcnSD41
 Eo2U3DmxIJtXBOsUv3C6VCAIGn3iThTkb+50kSPenb3KkBl/wW73UfggTC6N31jeoVzr
 Ya5YIK3zv0vx0gF9aPvVnsErWu3NXu4jqH/N1DE1pJCkZBwkAL2HUOv1g/M88qwPd9LB
 K5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690984307; x=1691589107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1zIwGQ1HZMb0pN+mUSGNHuePnalac4Pl8tVWYqsfVw=;
 b=bqM73QG/uPH7yAPsi6Rg6hEr4pT6W9Wvbaq6d4H3dKAXNehVGJB9L4+BcZqUV39dKO
 XetswNPpxbETEWNZ5BhrjMs+WNIy5dwnTBiZa7XPhehL4zkYsqcjknbY7GXFVSbvgW1X
 DwyXQQncX9fmgvoCfXink9AeVyXgKnDGdymGEU12c0d+dDYExVkgoLz5fpdsxD7f8go8
 VAv2UxaCmvK5F8Kfx5qfjEMrAEXKzhovg6rZDrtZVNGA6jejckJiEEoK0ras4bgb2UNJ
 NwfGUmVoxUVmMn9NBo7Ob15XHlBdJ5IjxGgTUDi5rWdYBCjDRa7CZ/p3CEYin+zXBvP+
 Tp6g==
X-Gm-Message-State: ABy/qLaVUcd8A/Q1XOu0m7u4hLaMOm1+jxgf69T+FCrMGt9bKXyrxI5l
 ivbH87Od3zbJVFZtKLKd6KrvgA==
X-Google-Smtp-Source: APBJJlFmLcYtLxH6sMGVtzSX8BEJweW9TY6EYu1M71HYfJNUqmKuzhIUPnezEohxfEVeACGveZXtog==
X-Received: by 2002:a0c:e448:0:b0:63d:4a9b:b29f with SMTP id
 d8-20020a0ce448000000b0063d4a9bb29fmr14482083qvm.65.1690984307163; 
 Wed, 02 Aug 2023 06:51:47 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05620a143800b0076c9e981b6bsm3492191qkj.57.2023.08.02.06.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 06:51:46 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
Date: Wed,  2 Aug 2023 09:48:53 -0400
Message-Id: <20230802134900.30435-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sm8550 has 16 vbif clients.

This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
initialized. This fixes DMA4/DMA5 planes not displaying correctly.

Fixes: efcd0107 ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f17b9a7fee85..89a2ac1e840d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -245,8 +245,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.merge_3d = sm8550_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
 	.intf = sm8550_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif_count = ARRAY_SIZE(sm8550_vbif),
+	.vbif = sm8550_vbif,
 	.perf = &sm8550_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..8b17a4a9b438 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -663,6 +663,26 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
+static const struct dpu_vbif_cfg sm8550_vbif[] = {
+	{
+	.name = "vbif_rt", .id = VBIF_RT,
+	.base = 0, .len = 0x1040,
+	.features = BIT(DPU_VBIF_QOS_REMAP),
+	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x40,
+	.qos_rt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
+		.priority_lvl = sdm845_rt_pri_lvl,
+		},
+	.qos_nrt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
+		.priority_lvl = sdm845_nrt_pri_lvl,
+		},
+	.memtype_count = 16,
+	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
+	},
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
-- 
2.26.1

