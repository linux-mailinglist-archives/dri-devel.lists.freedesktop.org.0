Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7A26015D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 19:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3DF6E516;
	Mon,  7 Sep 2020 17:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208096E509;
 Mon,  7 Sep 2020 17:03:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w7so8899139pfi.4;
 Mon, 07 Sep 2020 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqcpdSDPs0LRIseaVhQGu6lq6otZWIdGFe5nmwipIPY=;
 b=nh4IZq0a7cB1grKRk0BQOjqiQdJevhCjPIE3Oy6x4m6BbVWLFoq9yhe8gcIdyQ+7lP
 L/ARBz4ee8hPFMVgcd6jyHh5ZfZ/Dj44nfJpJHIh5mjtp17CcTtMVH18DHpw5OvJb5Cb
 mep0jPyaO4Gl8sZGlvBTmQot8x/DCEkaI4jQWZqaXYzl2pQ/ErTjq3AYqwIjxOLwsXsB
 1e/b+4Bi4jsxW5+AODtnFMmLTT2LHHWKpfz/zlRbjS2MTSIQ0wK7l3XoOdf0oR5PR9Mc
 EiAkStykT6uUsa15ttcLY70EvLYXZOET/EEdKgqlFkZ/18UM9G1LZwTiODpcmVH9JGYM
 dVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqcpdSDPs0LRIseaVhQGu6lq6otZWIdGFe5nmwipIPY=;
 b=T74SuQ0UOmYka71ojPI7b8Bpi0W1yEqaXBEKLR8X7nq/3TxJstFPy/ouHZLuKI4TCz
 gChYdX0ZAK3MnTz7DKUG6EkUH3CvpoiVWYY6vzF1djnZG5VTutjohF8aO/uFNW6+i8Wt
 7cXy0ehgRtyQLlHam7iIxRKjnVp4UMjNRoxMNGzJVmJ9/yaD2IQusxADY58HU1XHOrJT
 reaHQj+HI5zKlybRlXnSu+FI+5cloFjVVb+g1KODBIourRwL8EFEfmg8RjDoVj13k5lb
 a9ImmvoLVkdf1HcQMjDmVi2fNpLLeBoIt9rk/ZMZPWjqYmbLer+Era2sWyndfZ+2Eb1v
 OkDA==
X-Gm-Message-State: AOAM531Yav6hd7iKLxD1/FA5vWfFzBEmB0csO2aPJwbO1w0i8RrZZ2uc
 kzKlRp23X9w7jYDbt5yUJY7hW5uvgUu51w==
X-Google-Smtp-Source: ABdhPJw3IiW7lQ4CJE9PK3gspPmWTcTtJzvH3rq+m+ZOuCjZ76vbaISC0I/9xcIgB2sB9xvdcANNaA==
X-Received: by 2002:a62:5cc4:: with SMTP id q187mr21209157pfb.95.1599498238018; 
 Mon, 07 Sep 2020 10:03:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l12sm12705425pjq.31.2020.09.07.10.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:03:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: clean up some impossibilities
Date: Mon,  7 Sep 2020 10:04:48 -0700
Message-Id: <20200907170450.370122-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907170450.370122-1-robdclark@gmail.com>
References: <20200907170450.370122-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 81 ++++--------------------
 1 file changed, 12 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 89c0245b5de5..ad49b0e17fcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -265,11 +265,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
 
-	if (!crtc) {
-		DPU_ERROR("invalid crtc\n");
-		return INTF_MODE_NONE;
-	}
-
 	/*
 	 * TODO: This function is called from dpu debugfs and as part of atomic
 	 * check. When called from debugfs, the crtc->mutex must be held to
@@ -500,12 +495,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct dpu_crtc_state *cstate;
 	struct drm_encoder *encoder;
 	struct drm_device *dev;
-	unsigned long flags;
-
-	if (!crtc) {
-		DPU_ERROR("invalid crtc\n");
-		return;
-	}
 
 	if (!crtc->state->enable) {
 		DPU_DEBUG("crtc%d -> enable %d, skip atomic_begin\n",
@@ -521,15 +510,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
 
-	if (dpu_crtc->event) {
-		WARN_ON(dpu_crtc->event);
-	} else {
-		spin_lock_irqsave(&dev->event_lock, flags);
-		dpu_crtc->event = crtc->state->event;
-		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	}
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);
@@ -583,14 +563,11 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 		return;
 	}
 
-	if (dpu_crtc->event) {
-		DPU_DEBUG("already received dpu_crtc->event\n");
-	} else {
-		spin_lock_irqsave(&dev->event_lock, flags);
-		dpu_crtc->event = crtc->state->event;
-		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	}
+	WARN_ON(dpu_crtc->event);
+	spin_lock_irqsave(&dev->event_lock, flags);
+	dpu_crtc->event = crtc->state->event;
+	crtc->state->event = NULL;
+	spin_unlock_irqrestore(&dev->event_lock, flags);
 
 	/*
 	 * If no mixers has been allocated in dpu_crtc_atomic_check(),
@@ -635,14 +612,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 static void dpu_crtc_destroy_state(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
-	struct dpu_crtc_state *cstate;
-
-	if (!crtc || !state) {
-		DPU_ERROR("invalid argument(s)\n");
-		return;
-	}
-
-	cstate = to_dpu_crtc_state(state);
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 
 	DPU_DEBUG("crtc%d\n", crtc->base.id);
 
@@ -731,14 +701,8 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
  */
 static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 {
-	struct dpu_crtc_state *cstate, *old_cstate;
-
-	if (!crtc || !crtc->state) {
-		DPU_ERROR("invalid argument(s)\n");
-		return NULL;
-	}
+	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
 
-	old_cstate = to_dpu_crtc_state(crtc->state);
 	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
 	if (!cstate) {
 		DPU_ERROR("failed to allocate state\n");
@@ -754,19 +718,12 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 static void dpu_crtc_disable(struct drm_crtc *crtc,
 			     struct drm_crtc_state *old_crtc_state)
 {
-	struct dpu_crtc *dpu_crtc;
-	struct dpu_crtc_state *cstate;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct drm_encoder *encoder;
 	unsigned long flags;
 	bool release_bandwidth = false;
 
-	if (!crtc || !crtc->state) {
-		DPU_ERROR("invalid crtc\n");
-		return;
-	}
-	dpu_crtc = to_dpu_crtc(crtc);
-	cstate = to_dpu_crtc_state(crtc->state);
-
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
 
 	/* Disable/save vblank irq handling */
@@ -825,19 +782,13 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 static void dpu_crtc_enable(struct drm_crtc *crtc,
 		struct drm_crtc_state *old_crtc_state)
 {
-	struct dpu_crtc *dpu_crtc;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct drm_encoder *encoder;
 	bool request_bandwidth = false;
 
-	if (!crtc) {
-		DPU_ERROR("invalid crtc\n");
-		return;
-	}
-
 	pm_runtime_get_sync(crtc->dev->dev);
 
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
-	dpu_crtc = to_dpu_crtc(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
 		/* in video mode, we hold an extra bandwidth reference
@@ -873,9 +824,9 @@ struct plane_state {
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
-	struct dpu_crtc *dpu_crtc;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct plane_state *pstates;
-	struct dpu_crtc_state *cstate;
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -889,16 +840,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	int left_zpos_cnt = 0, right_zpos_cnt = 0;
 	struct drm_rect crtc_rect = { 0 };
 
-	if (!crtc) {
-		DPU_ERROR("invalid crtc\n");
-		return -EINVAL;
-	}
-
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
 
-	dpu_crtc = to_dpu_crtc(crtc);
-	cstate = to_dpu_crtc_state(state);
-
 	if (!state->enable || !state->active) {
 		DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, state->enable, state->active);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
