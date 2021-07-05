Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A5D3BB4D2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C9789B9E;
	Mon,  5 Jul 2021 01:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ED289B62
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u25so22343147ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8c3sgvuHdJKDI8oSDc/VT13RBuCWzIij8O7ZSxecGZ4=;
 b=CTXDRElAcOyDEOMY/9lotZPieTRYm3AK12V8evu+RlxZzSOJY11pcmsJK03o/SrqYT
 tfB3aUqCnYi4jOYVPRXNqkwWrblRFk+7DAmkdYAfqUDgtHlLpWHBjL5EVt+TikIOToc0
 g5llO5gYdOLnJoZmPTw8yggRWYXeKmUwirBD/k7IrjUd5+zakAXdrrQhcr0mtjtLBWl0
 ll78rBPBCFVqdjAIDm61vJwuU0Tqwpha3rHOvdPQoyM9ToG6UMOkZ7NKuoFYi7PuTN5T
 b0OiJL/uLwF7JA5vP7v/p0att8PRORG1jFJTH3BIuRmpWHzN70nQV26TJscggZRL0bns
 GNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8c3sgvuHdJKDI8oSDc/VT13RBuCWzIij8O7ZSxecGZ4=;
 b=OYJi+K939eU/3lr758+2YHkIYEe2Hi3qH6dcUoUpjpaSP1yFfuZXLTvXl8cvEXDGpK
 lzT2QryPPUj6Bi4zNirFT54xplpIzDJAxCA9ry/cn1t9nw/zaFhFtXMbtp3eezKeLSRm
 a1MoRF5aEa8snaTgxj+/GaMTwyba6L1UyVKuglcFXIYO92QWeYMclwWQKmhsGKMrpVnd
 hP2tAHJTgqgcDvxVlAm3ImBeyz1+eKWJ2EwbuM/5G937XTGpjfIWTWwkYPOf+PgRxK6Z
 dbWE+TbVXYtT8DYfDS4MjcRI9zGUuJe3HJfwUSaxaEVumkSs7BvB411pnG9OD3hEbNOR
 IatQ==
X-Gm-Message-State: AOAM530Cd/I1YvO7YSyYJsBK1T7oPyFSyZIefVubgPH8AvpORRqfDQnM
 Hvegk/0IsKjSTO4MmAulITHEjw==
X-Google-Smtp-Source: ABdhPJxwjPzPvQR/qc+fJbi6y5GLsRoKgiBFYoSJokZ0TbGtORVEQL/F6VxAhMYIiq9moBu8HvLQLg==
X-Received: by 2002:a2e:9e18:: with SMTP id e24mr9397145ljk.336.1625448313539; 
 Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 09/22] drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from
 dpu_plane
Date: Mon,  5 Jul 2021 04:21:02 +0300
Message-Id: <20210705012115.4179824-10-dmitry.baryshkov@linaro.org>
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

Remove struct dpu_hw_pipe_cdp_cfg instance from dpu_plane, it is an
interim configuration structure. Allocate it on stack instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 14 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6f856aeaf6bc..fdae6520c2bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1162,20 +1162,20 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_cdp) {
-			struct dpu_hw_pipe_cdp_cfg *cdp_cfg = &pstate->cdp_cfg;
+			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 
-			memset(cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
+			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
 
-			cdp_cfg->enable = pdpu->catalog->perf.cdp_cfg
+			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
-			cdp_cfg->ubwc_meta_enable =
+			cdp_cfg.ubwc_meta_enable =
 					DPU_FORMAT_IS_UBWC(fmt);
-			cdp_cfg->tile_amortize_enable =
+			cdp_cfg.tile_amortize_enable =
 					DPU_FORMAT_IS_UBWC(fmt) ||
 					DPU_FORMAT_IS_TILE(fmt);
-			cdp_cfg->preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
+			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
+			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3e4ed8a33a3e..48366da5e86e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,7 +23,6 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
- * @cdp_cfg:	CDP configuration
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  */
@@ -36,7 +35,6 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
-	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 	u64 plane_fetch_bw;
 	u64 plane_clk;
 };
-- 
2.30.2

