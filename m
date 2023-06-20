Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF3973607C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63F210E160;
	Tue, 20 Jun 2023 00:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9383010E034
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f871c93a5fso2097147e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219729; x=1689811729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qY6e3BcGHB5HqqmRhctZWM9TDd08JVLy31I9q/9L3g0=;
 b=nBc3RcEg6OUBHBQYSkD83uVwdM0wzxa5lji2S8JfySTKwqWPHykZz8uoLbMyeXVg2L
 HmlB0eBgzwVzX4ioeBV6H6df7Ud7973HiWyXVMv5m+MbB5Dls2FcVVTVifqCvAyLBOLd
 eesnDlkDwUYzhbN5nyE/NRFXY6+Kg5M1woTEYvTD+7zH4gfTE4pb+C1CjAax49ENfU0V
 Ns45PRNvxFeOOAq+tWWbuSVW/JI3TxMI4ORQ124KN54377uU9bZSp0g8nQ7KSbw72k9B
 kKwMx0YdEo2SYHqv+rALRW0n3y9gxmsN3eD9qFWJURcAel02DgGGu5Ud+9mA0jhF3Lj2
 TfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219729; x=1689811729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qY6e3BcGHB5HqqmRhctZWM9TDd08JVLy31I9q/9L3g0=;
 b=BOD04Sccl2mYihBFT+mON5H6/IvJ7bdsLUtsa1gxezUFAnXglHhKXDK87uLP3lvKxO
 +iaFwrptiQYqT4zcfkwB0SrWl15imGyCXp4ubIAeTFVqlEQSffi3PXGWcsGw4sSKvEBi
 Lws2FC7B/JM+shPc/rUuCNYDgfwr/shww1c6++d3b0WkVdUJ8szTN9Pl9xK+LHwp6jN8
 tehUusFSM+9yCOfJLUSigJC6zGSbDSAxp9tOE5mhX91BSlIEVkpMpCmi2fUiXiOrhub1
 8Kooa8XhShCmOxDvLnNP3kJiEgAOClt3vGnI2oiYy/SkZ90ivma5P+xo4/VuGmLe8kiN
 XdvA==
X-Gm-Message-State: AC+VfDxOWIY6IIilKXr3X9u/ODgEt1mYiiEdNAXw7fmaJDu/wlLoY6IK
 WOOlMGFb7pltvhZRSP7J4qsotA==
X-Google-Smtp-Source: ACHHUZ7zTw/Jb39q7JK5W617T6BIFyTxDQ5jHjaDpQfH31/vwv5Nulj9H7LEEnL/aPlNL+NPV1ARhg==
X-Received: by 2002:a05:6512:3125:b0:4f8:5864:3cb5 with SMTP id
 p5-20020a056512312500b004f858643cb5mr6207021lfd.13.1687219729504; 
 Mon, 19 Jun 2023 17:08:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/8] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Date: Tue, 20 Jun 2023 03:08:39 +0300
Message-Id: <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the leftover of bus-client -> interconnect conversion, the enum
dpu_core_perf_data_bus_id.

Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
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

