Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C126A2DA85
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA4010E475;
	Sun,  9 Feb 2025 03:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y8Ap7KB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0510E479
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5439e331cceso3820432e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071303; x=1739676103; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Oi1Az+d17IMWsJWKpM/Z7vG/JaxyEjq4HPEfn1poENE=;
 b=Y8Ap7KB78hJVKINHQdZxPlUu0Ev7ttX0wZ+GCrxynOVWT1aswuC3KL2UaXN6Q6K9fP
 i3mDNlltzNH1JwSD5JyXuVxzgodIT0q9bVNg4TCkIYAw68Ovyg9Nvnqk6wib4awwiN1u
 o+WTMMzydgNtybqlKsAoyBjwW0uXX9wDw1YqHkciU5jmV3VWDcgqI4I0+2RbLjwCvxo4
 K0l9uRAO4DKR6wMv+Jt3pBdvcWxTltqx0iktX4vWHKasfCK2+A/DyBYGqLJvcClVatrY
 R8dfja60sr4QTsVt3EfpdyyWUBYRrcAGILNxd8lQYGs2kSiwXer0UDi4pcUI51yx16v0
 SpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071303; x=1739676103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oi1Az+d17IMWsJWKpM/Z7vG/JaxyEjq4HPEfn1poENE=;
 b=RXA8EdsEJwORoh7UULAVXcXanOLfLPqs+EPeDj/f1rR6ChR5pWT+jzDRligyyyKgpq
 ijCshW/6zOJO7otqEbFMKtojmlBbmrstXOwZ2KSuknyhGCB0fkwHeUCRJg0wpHGxu7Vl
 YMlvnZvVhCHGMQ9I0hs1HeI+tW4nrmH+/PlsFVyvygoJifgto1OucttyanDsq4/vX6mB
 eY4bAXM8YCjgLuWuv6I6fbntxphTXB+t6Zk5EpgT9/fyuaYVc5vQXrck6JxrahICowft
 5v9wEEOlIHr0vPF9wXrY201deSdsItR7eQyMWM5k3aDPwcORkKziyj55GDiqY2dIVDpy
 tIkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo7GSttHPhgHGxqGZ1DBTWPQk7uPi8EvUgjPDtKH4R8ovNeEqG1v41Wi4GztdcXmT6jVVTzMak2Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXMzz/FDBKSxKYPH6cQQqvbQpWPdInF/BI+4oOR1o1H/VZmBY0
 qIA6P9ZYkWS4kaCUc+xB8ak/guCNYytI9mxcUkfuKw+yz8BMsBWtJsCXb5KHlxE=
X-Gm-Gg: ASbGncvKdRwoI8NXqMHCK6ClOpdFjsC5dg3OFvYuX5mf5EI1bmq643H9mMQI05ZgrCy
 +cYcWz+MiU1Keunm7Gfn0VQU3ORWqtgsaMoVXwrQK30BINqG1Z+4K3fdQYWvpg3XL7hnd6oHHYc
 vv3wK8I19TVjNq9TJ4Uy2iLyZDjRnxH7UgMPNWUCvFO9DJlceZAtJZCC75oucZynjOo4zBMrAtE
 7scd5wEABtYTojpuyEHup3trFp58i1IO5OK2tTwzIbKWXcDG5fj37nn928rqQ0AMvtfqFQ9BoSg
 Ofhf4XRB4ieMgThCHnVmNf0=
X-Google-Smtp-Source: AGHT+IFEZWwhATFiIjC/mq/2iOVr1pCkgPVkoAotYXpYl7oqtRxrDKn/6LcJLuTgNAVp6QR7gFdePQ==
X-Received: by 2002:a05:6512:2355:b0:540:2022:e3c6 with SMTP id
 2adb3069b0e04-54414ae134cmr2990351e87.35.1739071303093; 
 Sat, 08 Feb 2025 19:21:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:18 +0200
Subject: [PATCH v5 8/8] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-8-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EjVnzSvwGeLB3HXokJpPau5v3ni0TOZS9ZUms7htZ/E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8x64F2cJNeOu1Uli/yCTGic6MsHG4iZAHU0
 xuYkcG1bUyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1dRQB/9KevaeocmmMuzIO8TfX0MVz2QgpEIEX19HB0AkRYNpfMcBZFYbPMOEOjm7UT+GjkTHz5Q
 oQQ/7zMIqsyW/6ObGU75R3mPz9vZ8iV9oa/yZ8lv1c3/VSqliYLdwO+gebs92S3DS6ZxGmgTG8c
 a1I83mr92Vh1pxUJDygWzDiflhiVd0KxhTWIjXiyb4Iflz8RET3n+qv8scrqFNe+7RYOx8cIeF2
 cljFJWxAmaIDHdQvvcK/rWlaBdTahxLsET4m7fYFBv0ZM+nptASfNzpI8wRg5aQWf+yUwIQ39si
 dwX5THa0LLAZkrWtLqS8NVfCSd8hKtLkWrV59iILpHtN8zCk
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

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting. This better reflects user requirements in the case
of different resolutions being set on different CRTCs: instead of using
the same bandwidth for each CRTC (which is incorrect) user can now
calculate overall bandwidth required by all outputs and use that value.

Note #2: this also disables threshold checks for user-entered bandwidth
values. First of all, it doesn't make sense to fail atomic commits
because of the debugfs input. Compositors have no way to correlate
failing commits with debugfs settings. Second, it makes sense to allow
users to go beyond these values and check whether this makes any
difference or fixes the issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c8e20be08aa83c8bdd70065643b46676eeed610f..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,20 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
@@ -220,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }

-- 
2.39.5

