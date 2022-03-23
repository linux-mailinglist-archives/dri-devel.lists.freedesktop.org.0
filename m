Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5384E506B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310F10E671;
	Wed, 23 Mar 2022 10:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3817610E671
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:35:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a26so1917827lfg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKB5fmiWOvzOX14q2kw2udn22WzFeSJad1vyh/bFUeU=;
 b=hUDeR1gYXCpZoo8aJ9xzuPNvlOSYwSMooYjSow4DM1nBMfcwBwTiswCutViipiCKWo
 IN3RPVc1OUza5FLP1mscbYuQAgsMGZ6Po207HTlzHjmWDRdRsTf10EricuEaL5K1mrM6
 ycEwsPavC9greW/zcSZ2jX0vX4aHdqIRHTDDa+0VFyP1wWkvvhHQH4o6F0e0CL420gFG
 bPfvWCBUrn7sQJaolSiEmWRhoH7gpXWR0zBSo17kVM/mUgPaTw3wY3QS+5RQIa/S4h5O
 IfbzCoP4EpFBKqQ1EozjYbJ9+Sk9QrOB2Caz8uD7OaH/RzMcy2bMRFoYWsViYLquQfZZ
 0f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKB5fmiWOvzOX14q2kw2udn22WzFeSJad1vyh/bFUeU=;
 b=gG4Hx0944V73ttIcQuG54mZsN1dSuCyj2nawsPLWM8wADoTfBYfhqGA6a0rxicCVMr
 xihLfWyQ1LR3yyjV/J+xL48vrt/4jyRwxnA9cirj/Yfnjh9qSxei03Y/Bt4KB6yGpX2N
 62DIVm3h3OeARf5ELW11swClUqjdwUXPnqhUvqv3je8DvtWAICBXwt59QfU2YkTKSdKh
 +hclqjgLpGpw1ZXWyLePUGsZm0s7JL4HD0OLrytJpEGyDqsOMNGxZ3REJ+oRS8NHqwPu
 1zIBxZtD+ycmCPj2pRUEzklWMS4SGq4BamsCgpy4BR9BVTmnQH24o8eS6nH2Nt1UzgXY
 3xvg==
X-Gm-Message-State: AOAM5335PMVBWE6Pn9/2YNSCMNmeoghSX4t52SaRVicaANSS7E1RQuU7
 ShSRxyeGPf9AT/znmk0AnhYcCg==
X-Google-Smtp-Source: ABdhPJxz66eq0PKhDvhJx3A0bfCwuf3GxcLxf1SXuGJA/glHt4BWKczUOwm6tFaN4A0Hqfb0uLZdvA==
X-Received: by 2002:a05:6512:3194:b0:44a:3acd:2078 with SMTP id
 i20-20020a056512319400b0044a3acd2078mr5718858lfe.483.1648031749566; 
 Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field from
 dp_panel/dp_display
Date: Wed, 23 Mar 2022 13:35:46 +0300
Message-Id: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the last commit, the max_pclk_khz became constant, it's set to
DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
and use DP_MAX_PIXEL_CLK_KHZ directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 1 -
 drivers/gpu/drm/msm/dp/dp_display.h | 2 --
 drivers/gpu/drm/msm/dp/dp_drm.c     | 4 +---
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 -
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f9c943f12d5..5e35033ba3e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -44,8 +44,6 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 	drm_mode = &debug->panel->dp_mode.drm_mode;
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
-	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
-			debug->panel->max_pclk_khz);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
 			debug->panel->link_info.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index be1e9c558fda..aeb08416b309 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -370,7 +370,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
-	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
 	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6efb5c853c89..f3a9d7449a1c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,8 +24,6 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
-	u32 max_pclk_khz;
-
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index af5f1b001192..a94c9b34f397 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 
 	dp_disp = to_dp_connector(connector)->dp_display;
 
-	if ((dp_disp->max_pclk_khz <= 0) ||
-			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
-			(mode->clock > dp_disp->max_pclk_khz))
+	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_BAD;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9fa6e524832c..d861197ac1c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -49,7 +49,6 @@ struct dp_panel {
 	bool video_test;
 
 	u32 vic;
-	u32 max_pclk_khz;
 	u32 max_dp_lanes;
 
 	u32 max_bw_code;
-- 
2.35.1

