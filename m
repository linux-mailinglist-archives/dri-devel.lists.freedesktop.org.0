Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55936FF4C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 19:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3506F576;
	Fri, 30 Apr 2021 17:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BDB6F573;
 Fri, 30 Apr 2021 17:14:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id e2so32640907plh.8;
 Fri, 30 Apr 2021 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruRmdj//+BrtUTRZyXXenuD+b8S/L8NONyW8idiiQuk=;
 b=Ub8kSGGmxhpGXKFXcqsHa6ydl4thXJFh+bzi40S1hfj/bv9cckLfwspKB85RLYBVMG
 nSody6AIH4eP3yjzJErq+smvpAvJoQTxxLo7AXCTyMdtaKNBTIolxDZTk3z3DvGi0/jW
 9peJujZYZVVBDqcRqCoYs+VKV9hvy2Y/oNZVTvlh3xaA2SkRe0UBE4kueab13d/Kj6aw
 sKD1wbbxn/vBOIrRIp5TaWXd42GtCgwjEVVnmjAjbSrG6w/LI1WdVCMf2C4N2FdT793H
 8l7JFGKJindN17KCychIFimTUVbN7x6xR5gIoePqZysbiA7j4SM8zJAW4mTwVBil/dqP
 2ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruRmdj//+BrtUTRZyXXenuD+b8S/L8NONyW8idiiQuk=;
 b=nQoHYu3uMEupdeEOLvyG4t9oshn9dgBZAJQFTQn4fg1c5uGYMUTU6jWdFBrSHopZWD
 vbwH8yj2LnR98n5vJEOtaCj4S5dNZZxTkUtZx/LCmOzI7rgKx6N5OgAQP0VB1N5n/Sbl
 0GawLG9RaatSkcfIqai6BBO1HzfpHzBkVcv1oC3+XlBrn1DoRA3XPq5NJ9eQ3JVmG1M/
 ByFV7AII//Gw0VoJ9113KBpOGESfB9EwE1Ve69sWi0/JbYztx0gyenoMtCrDZrZMDy14
 b/j5z3f4hmMFjR3Z2lMoB9XrWpfnxgq7LvSDi4YIT5WCcbSYxDRfUwV34IP1egPiWrqG
 7Uog==
X-Gm-Message-State: AOAM530pRNXzgFLfPc2M8lv6byjOUjUcaFuaD88gCfCI8C5DeFE64oHr
 N5bdDvef9RGSaV25sNsWw3iDEvdzFRw=
X-Google-Smtp-Source: ABdhPJz+cZSHpX+PdTPhqIGtB2aPmDQ09HYhfW+2OH0h0BJgZA7/+WE+RaHv6jFvAEEk7KDeC/BV5Q==
X-Received: by 2002:a17:902:b609:b029:ec:e80d:7ebd with SMTP id
 b9-20020a170902b609b02900ece80d7ebdmr6252857pls.75.1619802849785; 
 Fri, 30 Apr 2021 10:14:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b13sm2878096pjl.38.2021.04.30.10.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 10:14:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Delete bonkers code
Date: Fri, 30 Apr 2021 10:17:39 -0700
Message-Id: <20210430171744.1721408-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, Qinglang Miao <miaoqinglang@huawei.com>,
 Maxime Ripard <maxime@cerno.tech>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

dpu_crtc_atomic_flush() was directly poking it's attached planes in a
code path that ended up in dpu_plane_atomic_update(), even if the plane
was not involved in the current atomic update.  While a bit dubious,
this worked before because plane->state would always point to something
valid.  But now using drm_atomic_get_new_plane_state() we could get a
NULL state pointer instead, leading to:

   [   20.873273] Call trace:
   [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
   [   20.880311]  dpu_plane_restore+0x40/0x88
   [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
   [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
   [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
   [   20.898579]  commit_tail+0xa4/0x168
   [   20.902102]  drm_atomic_helper_commit+0x164/0x178
   [   20.906841]  drm_atomic_commit+0x54/0x60
   [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
   [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
   [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
   [   20.926852]  drm_ioctl_kernel+0xd0/0x120
   [   20.930807]  drm_ioctl+0x21c/0x478
   [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
   [   20.938193]  invoke_syscall+0x64/0x130
   [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
   [   20.946716]  do_el0_svc+0x80/0xa0
   [   20.950058]  el0_svc+0x20/0x30
   [   20.953145]  el0_sync_handler+0x88/0xb0
   [   20.957014]  el0_sync+0x13c/0x140

The reason for the codepath seems dubious, the atomic suspend/resume
heplers should handle the power-collapse case.  If not, the CRTC's
atomic_check() should be adding the planes to the atomic update.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Reported-by: John Stultz <john.stultz@linaro.org>
Fixes: 37418bf14c13 drm: Use state helper instead of the plane state pointer
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 16 ----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7c29976be243..18bc76b7f1a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -648,16 +648,6 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (unlikely(!cstate->num_mixers))
 		return;
 
-	/*
-	 * For planes without commit update, drm framework will not add
-	 * those planes to current state since hardware update is not
-	 * required. However, if those planes were power collapsed since
-	 * last commit cycle, driver has to restore the hardware state
-	 * of those planes explicitly here prior to plane flush.
-	 */
-	drm_atomic_crtc_for_each_plane(plane, crtc)
-		dpu_plane_restore(plane, state);
-
 	/* update performance setting before crtc kickoff */
 	dpu_core_perf_crtc_update(crtc, 1, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df7f3d3afd8b..7a993547eb75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1258,22 +1258,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state)
-{
-	struct dpu_plane *pdpu;
-
-	if (!plane || !plane->state) {
-		DPU_ERROR("invalid plane\n");
-		return;
-	}
-
-	pdpu = to_dpu_plane(plane);
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	dpu_plane_atomic_update(plane, state);
-}
-
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 03b6365a750c..34e03ac05f4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -84,12 +84,6 @@ bool is_dpu_plane_virtual(struct drm_plane *plane);
 void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
 		u32 *flush_sspp);
 
-/**
- * dpu_plane_restore - restore hw state if previously power collapsed
- * @plane: Pointer to drm plane structure
- */
-void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
