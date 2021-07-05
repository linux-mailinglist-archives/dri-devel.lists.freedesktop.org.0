Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A93BB4B7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E9189B03;
	Mon,  5 Jul 2021 01:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F2689AEA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p16so2030231lfc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUMTyMrUgUh3fG+Mf/N14gZsUnvHUSJ7GKGw9bXuGME=;
 b=NgWbkKtQYMlotdEQMAfW3L67nOB3jPS3iG68f6NOncYUkKua/OHgPJsaoApKimLCVv
 W8Qbo6pgZnoma1ICd0yyeJ8nuAEynR2I8Vh+E/v+hFGxbuhvcXSpYgqcOrzmzJ69zk/2
 c3q039uG4GIeaH9NxPg8I7HOlIwtA8jkmHwGrr85kJzhzxz9JkM9i5Janf4l8vobz1Pa
 CoBbYYNXQO+8ng5OiYO0p3XbSX0oKgYc5idmTTGHeK8Bx1FYquyR2mWpcxY9O2omE6gI
 9ZJJunfhiwLz0m3wPkXEJuOADsMOPkNzvy3i0mmMs8RS7s0z55KGFR71cR0Rk4n/cLzt
 /+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUMTyMrUgUh3fG+Mf/N14gZsUnvHUSJ7GKGw9bXuGME=;
 b=fZ5YtIZqEmN8MCnzfMBQLyu46PxRlWVzcYAPimz+Up0rLARKtdd3nkayxolts7d3fM
 gwH94XNzVYfWprClKbJYgXln8jp7A0/l30tQ+xA/lkGKXwGZvhRZai1bDayTfAhYjKPG
 c/g3w4FPv84NXLBzClG5PxDKwFExuSR4UbuH++xus+35zmXvHSnwkRStBshVZE3Yrxs8
 g+Qh1HfzdeMegRMQOe4B1scrzN43D/5WkJOHRmSg1oDCgtqZasPeG2SPT81+fQqvuDpF
 lXBqLNapgm1GD2sTWcfKwdtIZazHcynMyOg/kL6EZ66B5FicmTkxs5TKN3i/jM0tSsxp
 17Iw==
X-Gm-Message-State: AOAM532WOdX20uTEvzh6YQtUK2JwgG0CDiOpPoFe9sbtXK61cgnfLuVl
 rRLfV2nJ8orAQzz65vNLEHF9dg==
X-Google-Smtp-Source: ABdhPJxUc04KVSa22R0+UdPYrCWXrsIWLwihbisSbViNo/f1m9IFgKR/x0ITyhwG1Esb2Pu/hbZQOg==
X-Received: by 2002:ac2:4189:: with SMTP id z9mr3853198lfh.516.1625448307751; 
 Sun, 04 Jul 2021 18:25:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 02/22] drm/msm/dpu: remove pipe_qos_cfg from struct
 dpu_plane
Date: Mon,  5 Jul 2021 04:20:55 +0300
Message-Id: <20210705012115.4179824-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pipe_qos_cfg is used only in _dpu_plane_set_qos_ctrl(), so remove it
from the dpu_plane struct and allocate it on stack when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1e2c53a3f47b..20ff1832c958 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -105,7 +105,6 @@ struct dpu_plane {
 
 	struct dpu_hw_pipe *pipe_hw;
 	struct dpu_hw_pipe_cfg pipe_cfg;
-	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -422,38 +421,41 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
+
+	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pdpu->pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
-		pdpu->pipe_qos_cfg.danger_vblank =
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.danger_vblank =
 				pdpu->pipe_sblk->danger_vblank;
-		pdpu->pipe_qos_cfg.vblank_en = enable;
+		pipe_qos_cfg.vblank_en = enable;
 	}
 
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
 		/* this feature overrules previous VBLANK_CTRL */
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
 
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
-		pdpu->pipe_qos_cfg.danger_safe_en = enable;
+		pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe) {
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.danger_safe_en = false;
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.danger_safe_en = false;
 	}
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
-		pdpu->pipe_qos_cfg.danger_safe_en,
-		pdpu->pipe_qos_cfg.vblank_en,
-		pdpu->pipe_qos_cfg.creq_vblank,
-		pdpu->pipe_qos_cfg.danger_vblank,
+		pipe_qos_cfg.danger_safe_en,
+		pipe_qos_cfg.vblank_en,
+		pipe_qos_cfg.creq_vblank,
+		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
-			&pdpu->pipe_qos_cfg);
+			&pipe_qos_cfg);
 }
 
 /**
-- 
2.30.2

