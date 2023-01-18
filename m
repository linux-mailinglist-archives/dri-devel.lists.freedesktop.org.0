Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A592B671086
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F18210E62C;
	Wed, 18 Jan 2023 02:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE010E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:04:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ud5so79867106ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
 b=xce0Etiznc2C6Eny9wmN+993oebbBhdy1plEpT2xNLnwgtbjQZK+uycwOWloLFB7pK
 wu7FqZeXywddXrUOKuNQ1BgSWUzIBJkVNqMIfj+F6L+OIiZR1Dkv9TU4ZkXkp2qJpQUG
 0c3cJT6rXaJFNfFEiok2W0vMHx0VsjcSuNvJyGP79tZxHfh/k1K+uHpL6a+L9XwXOHe0
 H8ht6TBFkbYEMfnjNH4knTXSL6pMxnZKLsHWb5M3j1vqpcdVqdIdCbRdivMvf6YWO/N5
 EoRgTtlLQ04o+Rn4+EyewyAw240nZ1/gbpHRFhyWAZzPyHeA7V4cMT6KHDTLbgZ9yQ4k
 aymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
 b=BdVgS2W6bwkrbvcDe5aFU63u8M31WD8xgTNFEdSz+LdJnGYtriOsA0RYlcdhQNeu4u
 ICvChv7K1S3ZyHLkYUqtlnAiX8Ru8IewXbv7hSTbFVb1/JKEVt2JIunNs4e6e0CcQ5SY
 ncOgUCgdQ2k6BMRh2v2UNlXATENfPnkAHxmZSLlH/GWqLEcviEyH7x41VkpkDpBGk6tD
 0zai6um3gxpWC0qI9bcSx1iSOqEHcmLyuOMBQPU5Lj491BLCk+GvR00dKO3XuE2Bhyf/
 BK9mKEINwSc2fZllh3azokcJaqFaTAjixwnvMAw47hsUwSsKlIFrQ6Eq4dXoN7JQIlMO
 V5Fg==
X-Gm-Message-State: AFqh2krBQ3R5aAUT3uBN9Q9rm5UT4erOSBfOOsFYdTwsglXtnJX71CWB
 47RAeYhffIZpmJxCqUyt1A22tw==
X-Google-Smtp-Source: AMrXdXvYeU4WMbqNwPwG88LxBwDVokGmvq+fYzLUh89sDzdLlSJb7AUBKwbrSeWY9hSa7ogjHyTA3g==
X-Received: by 2002:a17:906:3f87:b0:809:c1f4:ea09 with SMTP id
 b7-20020a1709063f8700b00809c1f4ea09mr4827344ejj.69.1674007496895; 
 Tue, 17 Jan 2023 18:04:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:04:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
Date: Wed, 18 Jan 2023 04:04:54 +0200
Message-Id: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

SC8280XP configuration missed the reg_dma configuration. We do not use
regdma for now, but let's put the correct pointer anyway.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4375e72a9aab..3d0fbc1746e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = IRQ_SC8280XP_MASK,
 };
-- 
2.39.0

