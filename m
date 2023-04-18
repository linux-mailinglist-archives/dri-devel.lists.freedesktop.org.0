Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8A6E60C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9855C10E78E;
	Tue, 18 Apr 2023 12:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678F610E152
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so20538171fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819861; x=1684411861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
 b=qMjBZA6z4JwNv9nrY6ZukrVlV+5UNrtliICVTRHPh2CGw8TS41gty9nTL35MX8JJYC
 BV/AGuAdODhe4i8kD0urhXqyIxDomSAZfMUwiJaDRULOVXEtLJ3C83xJWgzTyAb8ItSi
 VaidmBVR8YcdgSk+NgWd+3aCzzIz2J4Mu8u0fN4KOTDxoIBQ6G6WGy0X7jXB/nQ4NUbR
 2yThvJC/cZpurp7BZqr8f99Mclucd1PkJu1RE+8Te0Zm9yAZ0c/hH0U/HvwEllyF+8cg
 M6AalA1t0wbUQwceXnEmIvRoGohFNuPFXkQchMgdco4WH4PARnSVKsLMs3h9f7DWJPLm
 HETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819861; x=1684411861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
 b=YjNKkRtDJi7gXVMxasFl8dft7Xb0TuLFfdtwYyfgDV4de/dfs4f3Qoi+armVYUas+a
 e5vyLXIotLELj/ZmnyfoccfGNFFIjF7KPwV9d09DZcieywN8YGOkicXnw7ha+i4xQ/WT
 z6J5Wv+WayHyJodZwiA3FxaX8M5wIgmpLRdz5J4SI4jWv5EQFjHR+fYHBDrsRCaNTGbo
 OCzTAsr2KB8LFNlzFe8B8Y5T/4RvWcAFJJY4K47/Zk8JCRss9bk1zBsrNDsYoEGWXRGF
 rAvDsk+FaYJE30fQbksy5eCClqfzwXod2+lMFP4ynO2KSkRIeVTYKnhbwLa7qnynWwOC
 RqSg==
X-Gm-Message-State: AAQBX9cjpQ9tRNCidR+OHd5mKqdsXYSifssWvwzu75W3RNH+ZKSrmXSi
 1zgBhhJAWbkZtwNTvpQ7YergwA==
X-Google-Smtp-Source: AKy350YFUr7D3ZA8FFCg0jBRLCUecF1TE4KPX3EM0XpcwN/O7LigF3RcuDV8Htc9b1S2Ec40qe9zRA==
X-Received: by 2002:ac2:4556:0:b0:4ea:f636:6d02 with SMTP id
 j22-20020ac24556000000b004eaf6366d02mr2287331lfm.18.1681819860976; 
 Tue, 18 Apr 2023 05:11:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:11:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:57 +0200
Subject: [PATCH v2 2/5] drm/msm/dpu1: Rename path references to mdp_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-2-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=3187;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RHVX4b0dy7ygKXk/64XZDOzn26jUEVt2/m6N5KVO6Vs=;
 b=r2TFBVO5Hj5SdRdHTZ0YLUP9sN8AtEd+o8gl6ja50IX5vktPr9lMiBBhBuvVF1QlIRM+I182r2iE
 3e7I94N5DkppyOmS4WSIUeWXQZcRNBW8stdmAZtfC7dB3OlvbPvx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..349c6cb3301d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -230,18 +230,18 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
 				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+				  dpu_cstate->new_perf.bw_ctl, kms->num_mdp_paths);
 		}
 	}
 
-	if (!kms->num_paths)
+	if (!kms->num_mdp_paths)
 		return 0;
 
 	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	do_div(avg_bw, (kms->num_mdp_paths * 1000)); /*Bps_to_icc*/
 
-	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+	for (i = 0; i < kms->num_mdp_paths; i++)
+		icc_set_bw(kms->mdp_path[i], avg_bw, perf.max_per_pipe_ib);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..dd6c1c40ab9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -397,12 +397,12 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	dpu_kms->path[0] = path0;
-	dpu_kms->num_paths = 1;
+	dpu_kms->mdp_path[0] = path0;
+	dpu_kms->num_mdp_paths = 1;
 
 	if (!IS_ERR_OR_NULL(path1)) {
-		dpu_kms->path[1] = path1;
-		dpu_kms->num_paths++;
+		dpu_kms->mdp_path[1] = path1;
+		dpu_kms->num_mdp_paths++;
 	}
 	return 0;
 }
@@ -1238,8 +1238,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
-	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0, 0);
+	for (i = 0; i < dpu_kms->num_mdp_paths; i++)
+		icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..d5d9bec90705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -109,8 +109,8 @@ struct dpu_kms {
 	 * when disabled.
 	 */
 	atomic_t bandwidth_ref;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 struct vsync_info {

-- 
2.40.0

