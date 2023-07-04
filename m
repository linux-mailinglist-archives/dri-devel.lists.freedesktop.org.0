Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7F7474C0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792A210E2C9;
	Tue,  4 Jul 2023 15:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88110E1B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:58 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so71771701fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483036; x=1691075036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=rrDHjT1XdohbcAEb7K/I45P6WCTri8lRvdqh3U1QdxZ/OUDMVh/obCczQoyxUHIxhm
 C4Ww9VKXvnn4H4JfqMi+mUBaYbvvemW7181yFoUzLMHW8SIk3MT7zla3qY8zpgF7MAa4
 lUGL+5Y3JfcpTJbsoHAZO5eS9QKDA6oB0n2bU5+MWA2uYZq+uwtJxx9zo5bUSKSKnvdD
 7VUs5FoyCQDWEGESI5puZ8yDV1UpLbwUodPjp6igqx06YqMaMYN/B51Rx/59I+Yf9oHV
 6O9Jo68S7N4P/eQafgYzjlrW5B/gmWIYfRZH8PP7HzzZFNTnux+y7hkI6/+aVJ8WQPkT
 72nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483036; x=1691075036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=B02CIrdqgNnngSKyd7n9jSPvjgfacPlld3UoYg7s+Lj8bW3PEsgScx9sMYOb208nSS
 QUXmGo6d0n9Al49CAvj/fSMiL5ZIwK1eGYw7xj0/cBKDk/NR5x4tskijuxxSFfrFa9oY
 V7oOQzaS9lel2ZmhtQqVOzB4UvvM9zmMNNMFMqTbC8Y3M23v1Y+Sxcy8Aon+O9fgElaz
 RhkXVnCUlb37qgRfL9Gjc5vL+QIycf3xWm+biitHAGh9ni3YAoQfABsLxsq5PR5cGMQn
 r4CVTK0Eb23AZquu1edB1T+LIZhD6azs8S6F3Yltdt2ntbhxwJg6ATFHGFoRPuYFdJYy
 O/Dg==
X-Gm-Message-State: AC+VfDydgZJS5BK+eyNw2NAou0GVLtiDX55yNcFynp2DJhsifb0+6Nzq
 +OWSeIMuViqBIkSI+qk3mu5xSA==
X-Google-Smtp-Source: ACHHUZ6Z6+YzUGt6Z0XsYxLyOrcysDN2d2wGK/OHEBQBcN1Z6cxNKGbIrIhPPmdtll8oMChE0BI+tw==
X-Received: by 2002:a05:651c:1309:b0:2b6:9f54:af9a with SMTP id
 u9-20020a05651c130900b002b69f54af9amr6875576lja.8.1688483036141; 
 Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 01/14] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date: Tue,  4 Jul 2023 18:03:41 +0300
Message-Id: <20230704150354.159882-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

