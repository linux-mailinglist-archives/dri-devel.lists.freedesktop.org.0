Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1C87B60D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975910E753;
	Thu, 14 Mar 2024 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U/XCFqOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052210E753
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:50 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d228a132acso5476201fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378649; x=1710983449; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vIoXYbu3MygYy7U6DbcLTmPcPWwgndAXgG/VdYHaBOk=;
 b=U/XCFqOIg8dVHq4GlRpFgS9tdZoLGTmEzL0VDB0Dzz8/rYIpPCKHyoFINKwBvSiRSm
 YNbqDbznwGqhWygu7HJkX4q4InHNg7iCQLQPwlzztOdhYlprD7UlncS6AzsZOKe7U3Wr
 6yxRsKXVcF/9pDmctiJa+JveskV57WRLIsIHkU5SI/knf4QP1t50tUNDNTVF9mpr4VT5
 Rkf8YLjwMsznvhoA+Pj4pUw4aVhQwCbx+2DmGzHc6Mk5dsUjek/PedQlHvfunOc3Uyco
 4OS80E30d14/vdxKg5jlYRVkCnO9lVJKRviId+Wn3e9UbPVyXRyAiQV2wnc+2wiVsuHq
 Flwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378649; x=1710983449;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIoXYbu3MygYy7U6DbcLTmPcPWwgndAXgG/VdYHaBOk=;
 b=EAleBzY4i5tbvI9yhdLco3JQQCLAf4XLzZ20DTHynhmxtbUP3XNFY0/IOsqNZ6Ph2+
 yhvfFGD+XyxBCt8UKC7KT8qlnBf6VRn791sdR+UJNrTpRiLsBlOK10vW5XfD3ex8BlKY
 opt5uvjp6oPB+UWgf4Yix9G1AO4db5laiNqAGJsaLvhvV2OEvD0J4KKKzvkLEPT3TsnU
 eaDHwEwbKGh+aFgR1utUIdyzKoYXoTAFvdM42TYzy+h4jsPgVUCoHCaAxOAfIQx+e2JF
 kVKsxYfjzvypUt6TJPwFUgI4tVO/RXveotIP1QIekjUdGYZIqpEuIYJ41S09EuVd4/hE
 K9pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDiwHDpsypjDnjWKmyrJtPlxEcA3kMAV9zS2cJZ8+x7qrJyt2s7GBZD+eOz6ISjfkKQY2xdkjk9vjImzKzt9x8uXHlEXqU5GQfJHi9UwBh
X-Gm-Message-State: AOJu0YxCUH20Cusz+aWty3YAbg8UTvR8FPaz1rdHJqMyHUHc04AsboZW
 CsUJXB56hRgzMpnyOLspcoF59cfOAiDLdZIW/SGdr3xZUZU564vFqcArj3J+HCs=
X-Google-Smtp-Source: AGHT+IGq9lqZjLRsr1HGz2LENujhC5IVIdwuN01iFheK8+jN3o594B/n/y/dYcd1AfeMDzDEuMw/Jg==
X-Received: by 2002:a05:651c:204a:b0:2d2:7702:cb74 with SMTP id
 t10-20020a05651c204a00b002d27702cb74mr120452ljo.20.1710378648902; 
 Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:44 +0200
Subject: [PATCH v3 4/5] drm/msm/dpu: rework core_perf debugfs overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-4-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YsE1Cp7o2/VYepcndYMfJwYo6XOZZyfG72U7gsT/rjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6TPJ73CcFgvbMkQBgykdG8ysiSDjorTTk2D
 2TA8Oavs2OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkwAKCRCLPIo+Aiko
 1XZeB/9hmGxD8GltmoQnMnjJdW7u/veufebGarszbXeg4m+VVW5rkTGFgb0bFTynIf1c/OwaEZe
 XnGALFa1nD5B686QnkBTzXkzo7ZNKrUPU7zqlm2q7BvC/yQiyhb01MgdkdUGvag4u3zge6GxB5D
 8Z0gw+Tu//B9vFeS8ipaF803pW+HrVP9TKo7x8xJvljb880oV/VJQ1ZNYShNjzZoULCT8QuwnhN
 M67C5WVu5khZQABLoytiH3jTHQKUghQe+Q0OBmNcaHM0oAWiSwloVvPoaSKvfUNov5jMSSOZ7X/
 kRJfWx/pA+dizwt8eCAuHDifCINGFMaYZqdx2vfT7yW83gE0
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

Currently debugfs provides separate 'modes' to override calculated
MDP_CLK rate and interconnect bandwidth votes. Change that to allow
overriding individual values (e.g. one can override just clock or just
average bandwidth vote).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
 2 files changed, 9 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ff2942a6a678..2e78e57665fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -17,20 +17,6 @@
 #include "dpu_crtc.h"
 #include "dpu_core_perf.h"
 
-/**
- * enum dpu_perf_mode - performance tuning mode
- * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
- * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
- * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
- * @DPU_PERF_MODE_MAX: maximum value, used for error checking
- */
-enum dpu_perf_mode {
-	DPU_PERF_MODE_NORMAL,
-	DPU_PERF_MODE_MINIMUM,
-	DPU_PERF_MODE_FIXED,
-	DPU_PERF_MODE_MAX
-};
-
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
@@ -227,18 +213,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	if (!kms->num_paths)
 		return 0;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		avg_bw = 0;
-		peak_bw = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+	peak_bw = perf.max_per_pipe_ib;
+
+	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
-		peak_bw = kms->perf.fix_core_ib_vote;
-	} else {
-		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-		peak_bw = perf.max_per_pipe_ib;
-	}
+	if (kms->perf.fix_core_ib_vote)
+		peak_bw = kms->perf.fix_core_ib_vote;
 
 	avg_bw /= kms->num_paths;
 
@@ -287,12 +271,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+	if (kms->perf.fix_core_clk_rate)
 		return kms->perf.fix_core_clk_rate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
-		return kms->perf.max_core_clk_rate;
-
 	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
@@ -402,54 +383,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 #ifdef CONFIG_DEBUG_FS
 
-static ssize_t _dpu_core_perf_mode_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	u32 perf_mode = 0;
-	int ret;
-
-	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
-	if (ret)
-		return ret;
-
-	if (perf_mode >= DPU_PERF_MODE_MAX)
-		return -EINVAL;
-
-	if (perf_mode == DPU_PERF_MODE_FIXED) {
-		DRM_INFO("fix performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
-		/* run the driver with max clk and BW vote */
-		DRM_INFO("minimum performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
-		/* reset the perf tune params to 0 */
-		DRM_INFO("normal performance mode\n");
-	}
-	perf->perf_tune.mode = perf_mode;
-
-	return count;
-}
-
-static ssize_t _dpu_core_perf_mode_read(struct file *file,
-			char __user *buff, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	int len;
-	char buf[128];
-
-	len = scnprintf(buf, sizeof(buf),
-			"mode %d\n",
-			perf->perf_tune.mode);
-
-	return simple_read_from_buffer(buff, count, ppos, buf, len);
-}
-
-static const struct file_operations dpu_core_perf_mode_fops = {
-	.open = simple_open,
-	.read = _dpu_core_perf_mode_read,
-	.write = _dpu_core_perf_mode_write,
-};
-
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
@@ -473,8 +406,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 4186977390bd..5a3d18ca9555 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -24,20 +24,11 @@ struct dpu_core_perf_params {
 	u64 core_clk_rate;
 };
 
-/**
- * struct dpu_core_perf_tune - definition of performance tuning control
- * @mode: performance mode
- */
-struct dpu_core_perf_tune {
-	u32 mode;
-};
-
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
- * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
@@ -47,7 +38,6 @@ struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
-	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u64 fix_core_ib_vote;

-- 
2.39.2

