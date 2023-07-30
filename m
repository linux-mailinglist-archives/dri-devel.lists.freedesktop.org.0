Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC0768304
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77510E12A;
	Sun, 30 Jul 2023 01:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECFF10E0DB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:06 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so23537621fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678864; x=1691283664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=u5L9B/3bk5OfURJCO+E4E8xTmHGSqRBRotnOZdwavvZIr6CLuElLXApx9guveEO338
 sh5PyX6Xw+mUpdu+2sMHP117cWRf1wuT8X3dT12WmsgctjHjaWMJiSL/yk+ayHtVCX3H
 bZs05EK0SEBhqig/P3wtUa9g7gdBKZt7KQmNuMkJFYprFSOMriahr0PE9F5BTQxI2h/P
 kT80hrroqpL5LjhQDuuTMmlWCmCNopvHEJXCPU5qC7O0+YJo26u1o+8mRWYCrmcNzxyD
 UNtKGlXiRMAg6ZtMbcSJBm9gNAHhmdT5u3xQEiLnZteCYPX+Oa6K86JAcp+npe4PcL8k
 SkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678864; x=1691283664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=Z+b3htNOP+p6h0Xfgqemm7oHCgYHYo6bjitx1Ho3hVPOoVsCh/PAaOgZaU+lqXkBMA
 qJC0XV0/5BXPdW3z2H1ig39S7ZRlAUnOJBLUJykjjLd2bPNtWPqCj2KfqZGtu8ySt19X
 ikxtyJfrQmhS/BLA/gZPcPhHZOy0QkphKA0XRf01il9T2mE/Oj1ozH9cef9FXFW+IfG+
 24bsNtjLjcwLXcSKjU3ocLCTutX/MZo7VBGLdyrrDlMcK9pL7Vagc8ApBztsVmybZk2j
 lvCw3FqG7OPH8IwMrh7CE8UTDSrAunZ1kZRKazMfdmh/YMg6dcMyF3vr2491j6tutE7Z
 Akgg==
X-Gm-Message-State: ABy/qLYykEDtek1yc4aT3ZVJt4BrjVTtFJTTCRPaNWnAvFAXi/AhoTr1
 ZMpYojbU1k5mZIX0wV23clj5qg==
X-Google-Smtp-Source: APBJJlFoK781J9kOomNbay57OPIT/P+DjfzqSGyXGz5fYGV+p5vTJ7L/vuwbre1VSkLe6Q23a3c+TQ==
X-Received: by 2002:a2e:88ce:0:b0:2b9:a6a1:f20 with SMTP id
 a14-20020a2e88ce000000b002b9a6a10f20mr4795181ljk.42.1690678864689; 
 Sat, 29 Jul 2023 18:01:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 01/10] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date: Sun, 30 Jul 2023 04:00:53 +0300
Message-Id: <20230730010102.350713-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
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

Drop the leftover of bus-client -> interconnect conversion, the enum
dpu_core_perf_data_bus_id.

Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e3795995e145..29bb8ee2bc26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,19 +14,6 @@
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-/**
- * enum dpu_core_perf_data_bus_id - data bus identifier
- * @DPU_CORE_PERF_DATA_BUS_ID_MNOC: DPU/MNOC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_LLCC: MNOC/LLCC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_EBI: LLCC/EBI data bus
- */
-enum dpu_core_perf_data_bus_id {
-	DPU_CORE_PERF_DATA_BUS_ID_MNOC,
-	DPU_CORE_PERF_DATA_BUS_ID_LLCC,
-	DPU_CORE_PERF_DATA_BUS_ID_EBI,
-	DPU_CORE_PERF_DATA_BUS_ID_MAX,
-};
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @max_per_pipe_ib: maximum instantaneous bandwidth request
-- 
2.39.2

