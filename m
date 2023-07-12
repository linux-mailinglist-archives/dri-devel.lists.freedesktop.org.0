Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C375135E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB9C10E5EB;
	Wed, 12 Jul 2023 22:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167A10E09D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:45 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b7430a07b7so4929921fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199904; x=1689804704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
 b=rVuupT85qWdSAbnUF3rDBecpUJzSwFPoZDWDdmyJ7XQ4KRb9vuiiOQU2WseFdV6glE
 Yv6SiAOeoW9Dyn88J3dbXayLGmVwVMRWi/zQVYMuScrI8+S3bM5RiFhRuskt2wEaiens
 0g8Y52AoIQzeG5vz01diRLIkSKdfqMG3xy6AHC9COGSq+WGU2+KARqu6EG0RFt5T7+LO
 fgjO1tyzS/N7jocbp7S5W+S9+4EV14YxMrb3uGGTbACky6EcdCvS5ANKk0skxpd/wiFR
 7MBpiSeBiztIz/egBUcWqj9Aw2a5BSO1e/SWCAU2Ggnf6M4jlMMXSpExC976Y4lBu4Nr
 dBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199904; x=1689804704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
 b=AP8cT+1H2tfz/q3mm7xQXxM7PiVDiKsRitTKJbpAgDMQv/m1V1c39mdrg6s3rY69Gi
 MH9Zt90eRASSxCT6jsUqwGDtnM4zyGx2VbWiISvdNYJmJRtXai32DgXtt1FxlmmM4OE2
 jYIiQSZMqTXQfvVGWuWpEuyAW8RNFzRtSHfm+UYQ9rJ8h/L+uuYZfqVzTHnlLskiY3sz
 m2SoPT6sUYym14E9ZIH54SbSpz2EJS93tvnRZk74zLvsUvwy8Xuma4CrMmX9Bs/XlTi+
 hB+dpebpG4iqSTiMvVF1hPe4s48+s+rUewiPZBGeZQbcqDTBrynGLno2xTEropVt61Dj
 Bm7Q==
X-Gm-Message-State: ABy/qLY8oTSIhRihlOKyId0xRpDbA35DCU8mpAx0dFcV3hvRD4q6KJMz
 F36O6lBdJGU32wo+WfIZ+XxGRA==
X-Google-Smtp-Source: APBJJlGQNS1YTzCBpsZUchsi6L/GVRPzj9zzQdd8jYukqlbz5CtMlEj14dRIljkdXqQ+0+paMHFqfQ==
X-Received: by 2002:a05:6512:3b3:b0:4f9:571d:c50e with SMTP id
 v19-20020a05651203b300b004f9571dc50emr15810889lfp.36.1689199904391; 
 Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 05/11] drm/msm/dpu: rework indentation in dpu_core_perf
Date: Thu, 13 Jul 2023 01:11:33 +0300
Message-Id: <20230712221139.313729-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f9f44cfcfbf2..841e1fc0c6a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -173,8 +173,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -365,10 +365,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

