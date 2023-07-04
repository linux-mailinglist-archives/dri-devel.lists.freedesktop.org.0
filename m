Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271907474D9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495F10E2E5;
	Tue,  4 Jul 2023 15:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C466410E1B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso93426121fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483041; x=1691075041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xfPypxFqykUBs8DXR2db7NbjKez4rMFtYrZsmQ/UkM=;
 b=nZnOYoZOKaEVk6NkhRGdHZMAK3aQGPlGERb2FVf6omw09wam7MNXh1mQ09dQXnzZWE
 PtPRG3SR7dXHoTLnKpISbitH8wkOtx1oMCOMPZupiHnoCwooE0xWqlktY5DkpWYzYRm+
 u73LoIwAkrZQqrwk8PR6ONbvnQ5QqA6nYU4L9Bc//vZSm661ymh2tigyMcMi9em+aWnm
 h4UaH7l+NVnZ1GR66PjRKko+HcnUyYfDLi+UHzAXW2BgFIxe7oqDE2eIoKbViCM2Ec/D
 s2LSEnjUs1mzZJk5VU3fhBHPmwAEp5MDhIRqIAlXbOxztwP/sKKJPTwXS7grbeMZhzKH
 XuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483041; x=1691075041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xfPypxFqykUBs8DXR2db7NbjKez4rMFtYrZsmQ/UkM=;
 b=BMJwf33xgskfHeAYPcz7jIj/5gICuX+mSRFBt2a2W4iMma7kXVMkRPm1PTdJ5Y9EBc
 9soz0nUOwb1wO0i8nz4QpE9vw1kXhYKjr+GiJjJ9lgvewjad0WkxU9wn2fyQXTwO+8eD
 UNPBTJnSHngD8DMmFbh9QKJTZJPfqdLRamMPn0yUEKGZzknCkjrzXkmDNVqlT3IubDu3
 rT0SzHT6l9kp2A0DCMBQfHFZBr4bqpXnz9OLdf1a1sIaqTxwKKsX1n0NU0HP1ZWFwsyR
 K1RbjRD/52VgPClYskNZf+b5IM83YaE33mJLSuy8hduzj6bLiquZPHcM9OjHz7rH5XkJ
 psIg==
X-Gm-Message-State: ABy/qLZbkXlGP9oW4C+kMQuKPMa9KzES9QSkNkg4GqXeKdqV0JOGtZJt
 w8NIh4OpcHMPk/w9tUv3g8zCmQ==
X-Google-Smtp-Source: APBJJlHgdDuWNvb36YPG861rnaXrGdDxH9+okUmR51RjD8IMJWomcZXD0a/OJqm2yabBWZ84AjrHsA==
X-Received: by 2002:a2e:9159:0:b0:2b4:78f6:d335 with SMTP id
 q25-20020a2e9159000000b002b478f6d335mr10684449ljg.8.1688483041140; 
 Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:04:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 07/14] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Date: Tue,  4 Jul 2023 18:03:47 +0300
Message-Id: <20230704150354.159882-8-dmitry.baryshkov@linaro.org>
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

The max_per_pipe_ib is a constant across all CRTCs and is read from the
catalog. Drop corresponding calculations and read the value directly at
icc_set_bw() time.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 23a29f159eff..fe4d7e08ac1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -103,13 +103,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 	}
 
 	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->bw_ctl);
 }
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
@@ -192,9 +191,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
 		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
 			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
@@ -218,7 +214,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-	peak_bw = perf.max_per_pipe_ib;
+	peak_bw = kms->catalog->perf->min_dram_ib;
 
 	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
@@ -333,15 +329,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		 * 2. new bandwidth vote - "ab or ib vote" is lower
 		 *    than current vote at end of commit or stop.
 		 */
-		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
-			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
-			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
-			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
+		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
+		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
 			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
 				crtc->base.id, params_changed,
 				new->bw_ctl, old->bw_ctl);
 			old->bw_ctl = new->bw_ctl;
-			old->max_per_pipe_ib = new->max_per_pipe_ib;
 			update_bus = true;
 		}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 1b791b170c6b..4f362bb6a520 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -16,12 +16,10 @@
 
 /**
  * struct dpu_core_perf_params - definition of performance parameters
- * @max_per_pipe_ib: maximum instantaneous bandwidth request
  * @bw_ctl: arbitrated bandwidth request
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1edf2b6b0a26..ff5d306b95ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1400,8 +1400,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
-				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }
-- 
2.39.2

