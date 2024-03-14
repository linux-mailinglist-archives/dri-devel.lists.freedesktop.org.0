Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973487B612
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB5010E9AE;
	Thu, 14 Mar 2024 01:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s4KBLoLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D240810E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:51 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so4746491fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378650; x=1710983450; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AkT0b7xRMHVuIJC0eNZGFO5wcpvp57gRfpmlCIxi9Y4=;
 b=s4KBLoLSaHFcerLKlGXXzp/0qk5LLbbWjmJ+jzYNQz6Jh3maUinWy5XuK2RfrzGKBj
 9BYHWMje+mQwbsOD4NbPnHP90pu8oULwUkz9U+jnuA/vkKwE8CMXJkWr26qa3LqyeLDY
 FUXdVbN3xZ2cOQ2pCl3J/J+hz8j93FBWsvTktQGeJSQEpFZGYGIdap5u3pqjHG+ortX0
 nW0faV018r7ZtiomBBfm+7WJ7W0oxy7GZXK2MiAF0CmNEEFoy44g0IHzo4+68z62Tto3
 +OfvU2fmlqPeZ5N/EJfjGV8t62F55+7Ln6iK4RjIUgXV/xowI+tup9WIpuHQAuUcUTYX
 FikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378650; x=1710983450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkT0b7xRMHVuIJC0eNZGFO5wcpvp57gRfpmlCIxi9Y4=;
 b=rRchYg/Ikfybl62uV7wY3eplRDhi8btu8N7atZ90hMqc+GpvMI5fI+j4PMHQa+wIPt
 BkuDgDw06/BIQjFNDj/jhkvyWVDGRsc8YaRmBlsHL3AWiIu/46PFIL0K6XeUU6Ii0gnE
 gen0vl7WhL9Qf4VWwoxe8hlTkj4yynLNxmQB71xhcmXVzBGzQaYxr70VLVGAGRVNnMKH
 2SiLL+9j11lRxBUYGJM4L+KDxHtuEYIkAZnzUpJXmeiGjchTRgxcz9jP0lMkXe+wnSTu
 KcfDdxFG5LvKBc6Po9kyz7K11OAVZxQUZHKwmPqEhN4kH1zoMYigu+F+x57niOAHKF8k
 9Bpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIM4nU2PPisiSJ3fGBKl8OWBayaK+lASdrJckkchwVGFuHtmrx6Thuun4Ii6aR1sSCCn1Q2wPn5vVHSRkK92DxslckjcgC2FBvNTfhVmss
X-Gm-Message-State: AOJu0Yxa0cEVS+sxyrzwsZseP4zXjdf5c0rF3CE8aD/tYIb/qnU0NZ4/
 lKk/5rXeRpwnmYc/01L4Tm4ARALuxbZpmr0YyS9Oz/hljRE6/0mpm7hjXbwY1ZA=
X-Google-Smtp-Source: AGHT+IHbftlvUJD0VKntserQOB+EnscF+o7ttbHZCzElms73MiWTPm5j4W35pZLrGaf/0ry1Bv4xvg==
X-Received: by 2002:a2e:8187:0:b0:2d4:5d56:e559 with SMTP id
 e7-20020a2e8187000000b002d45d56e559mr94218ljg.47.1710378649994; 
 Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:45 +0200
Subject: [PATCH v3 5/5] drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-5-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HtjO3+r4eD0Q2obHhXvuyUuLiZ1mp8ct03mOrvFNMx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6TPD8BbtAUQpZUbTD3Z/1YlsRo8D0pPIlbn
 OullnlyTpWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkwAKCRCLPIo+Aiko
 1QZcB/9VgPlKys7jt/lpRgWB5rrxlnQ5HZMGHoClHsG0Q1rsFCxp6+pdLWyZvuagrhUp+fNXGDL
 t+193uvDqf2swJeUWWBNdChGRgEZHPnXMHmodThOTq9cYfTFogx8HBwzXVSTIunAAGogNTWBhTB
 VGULPe71s6UNu32IPcbHfYX5AVU3Ny1N2P6YihRpH9RGxf+gk+i4hVe5srVVOPhmG+WbCxbdgEI
 9qT4bWQlzaf4JoM2oPmSxybHJ2F90gf84yzck6z+uKXxhQeKl3yz+mfLrj7U33AB3c4eMbhYAxv
 bPVGgskCjTDZdS//uQIldaPIkypgpyVcadUblq27F38w3s8w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
index 2e78e57665fc..2fc05665dc7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->bw_ctl);
 }
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
@@ -190,9 +189,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
 		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
 			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
@@ -216,7 +212,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-	peak_bw = perf.max_per_pipe_ib;
+	peak_bw = kms->catalog->perf->min_dram_ib;
 
 	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
@@ -321,15 +317,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
index 5a3d18ca9555..a5a9c3389718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,12 +14,10 @@
 
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
index 88c2e51ab166..771c04c1a5ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1389,8 +1389,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
-				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }

-- 
2.39.2

