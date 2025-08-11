Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBECB20017
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72E10E37F;
	Mon, 11 Aug 2025 07:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+2cd5Fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB9210E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 05:45:24 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-242d8dff9deso12922355ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754891124; x=1755495924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k+SbwLGlkzo48QtnyEGdu0tVgjZp6bv0qkAFAWLUh5M=;
 b=Y+2cd5FhjC7GZfdx8bN8lDLk2mKwEuYjZlIHEpOHaOmkkVNw/YHGKqg8ff1PM4F3Qm
 FSo/jJwQHJTu5trtpYClxm4C7r+ER6YXyfGUQpr4xQF+bRRPvnDLRHBjE01Lsoz7Ptoc
 kbyF267dUoKJc6BHr3WbhgyB2fiyFJz6sTpnlBLN3AhOwmDOMWb757/mMMZrG+gIu9ff
 K8tMDkkWaOtL90cpMibNkbBe+/p3T+UMAp7vFR7XdCjpbgp2yUyTxt6HQ024CiMSnCXt
 nffLxFps1SS0sVxirBDDYJ67akNfWtCN0BwV9okUIqFON0tBVRoFxxThjqTwxgxsuERg
 EH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754891124; x=1755495924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+SbwLGlkzo48QtnyEGdu0tVgjZp6bv0qkAFAWLUh5M=;
 b=e0q4LKob/GE8sy/pYBjDZyyKBbPV0ln+jr2iz+bgxagokbL1PGQCRFPxMY7uyuyrJe
 2FKkPf1Ec7uq4Dsv4+FtWMEtcZ6gh9DRlRgg6Q4GdefJbh0uU8MgLUsi3l4vmwe97fRV
 +IK5ynTH9kt0GpoTYY9J+IVOWQewNFBuUZm+gY61pAsrALsW+Nc0eBSgnAHs7MT2Ih72
 rqz4ExVHxagzbY/cujzT+z8jTlINtLfyqNgH/U4dIVp9fzvFDasm+xg4n7R3J0x48ZtB
 ung6bQ4s/XtprTwf/qcSYyZs190AjB2cv8QlM20Y1M33JXfecfHeGkg/PpZQWcdDOWNH
 pDNg==
X-Gm-Message-State: AOJu0YzMDHoic2N2/qazjnxBchmXKhTZGLoZfQpkb4w0Gn8FeQdpo4kf
 gWjJz8ESKlbB+6zWWYD+Ut1qdoiGfqUj4I2VhZqT05h+HwoS8l6/j5+e
X-Gm-Gg: ASbGncuxfFvSEkUa1P0raKYGE0B7Pbls3Z8+A+3j0Y7ZTCEErzo4eCNe2pVv6RX7ImG
 eyqnq0n12LrCzcsHJYXmXiPKCcaj5xPAEsAgJIWcIqFQOkxM72fYlaSqDEbwo8wbg+h2hJTcOqF
 PSHyqiR/JPcjknkjVxXJmYEqK/ZzAgasYuFm/RBQcBJqc6BqN2A/I/kI4CTsw4UJejbYDM37dVO
 nJfNYl38XUJ1XHSfIUsQLeuuj6JxF+BGjt0V5s4E9P5iR81yctQFmp8Hfzsxssxyw9unSM8Cpg3
 66XFtRnUByeZrpTApVMb/NooPoRBWUUvt8hQMAaFBlx38Y3n8GMJdwxUr4uVBU8hHARY2SESfVG
 1QDi0sa2jZmKN2hP8gU8jaBaipwfLxxedPrEF
X-Google-Smtp-Source: AGHT+IExwAT9Sif1a2vkzk3Xy0KYiI6G1iRI9mcV03pG4buJeritwA3KFQH/LWMzNVpt++ddECdstA==
X-Received: by 2002:a17:902:e5ca:b0:240:9f9:46b1 with SMTP id
 d9443c01a7336-242c21df7ccmr155670745ad.37.1754891124095; 
 Sun, 10 Aug 2025 22:45:24 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e89a3acfsm262957025ad.146.2025.08.10.22.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 22:45:23 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_* with
 drm_device parameter
Date: Mon, 11 Aug 2025 11:14:59 +0530
Message-ID: <20250811054459.15851-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
corresponding drm_err(), drm_warn(), and drm_info() helpers.

The new drm_*() logging functions take a struct drm_device * as the
first argument. This allows the DRM core to prefix log messages with
the specific DRM device name and instance, which is essential for
distinguishing logs when multiple GPUs or display controllers are present.

This change aligns komeda with the DRM TODO item: "Convert logging to
drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 37 +++++++++++--------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..b50ce3653ff6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
 static int
 komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
@@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
-			  mdev->dpmode, new_mode);
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
+			mdev->dpmode, new_mode);
 		goto unlock;
 	}
 
@@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 	if (new_mode != KOMEDA_MODE_DUAL_DISP) {
 		err = clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcrtc_st));
 		if (err)
-			DRM_ERROR("failed to set aclk.\n");
+			drm_err(drm, "failed to set aclk.\n");
 		err = clk_prepare_enable(mdev->aclk);
 		if (err)
-			DRM_ERROR("failed to enable aclk.\n");
+			drm_err(drm, "failed to enable aclk.\n");
 	}
 
 	err = clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
 	if (err)
-		DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id);
+		drm_err(drm, "failed to set pxlclk for pipe%d\n", master->id);
 	err = clk_prepare_enable(master->pxlclk);
 	if (err)
-		DRM_ERROR("failed to enable pxl clk for pipe%d.\n", master->id);
+		drm_err(drm, "failed to enable pxl clk for pipe%d.\n", master->id);
 
 unlock:
 	mutex_unlock(&mdev->lock);
@@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 static int
 komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	u32 new_mode;
@@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
-			  mdev->dpmode, new_mode);
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
+			mdev->dpmode, new_mode);
 		goto unlock;
 	}
 
@@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			      struct komeda_events *evts)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct drm_crtc *crtc = &kcrtc->base;
 	u32 events = evts->pipes[kcrtc->master->id];
 
@@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		if (wb_conn)
 			drm_writeback_signal_completion(&wb_conn->base, 0);
 		else
-			DRM_WARN("CRTC[%d]: EOW happen but no wb_connector.\n",
+			drm_warn(drm, "CRTC[%d]: EOW happen but no wb_connector.\n",
 				 drm_crtc_index(&kcrtc->base));
 	}
 	/* will handle it together with the write back support */
@@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			crtc->state->event = NULL;
 			drm_crtc_send_vblank_event(crtc, event);
 		} else {
-			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
+			drm_warn(drm, "CRTC[%d]: FLIP happened but no pending commit.\n",
 				 drm_crtc_index(&kcrtc->base));
 		}
 		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
@@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 
 	/* wait the flip take affect.*/
 	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
-		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
+		drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->master->id);
 		if (!input_flip_done) {
 			unsigned long flags;
 
@@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs = {
 int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
 			   struct komeda_dev *mdev)
 {
+	struct drm_device *drm = &kms->base;
 	struct komeda_crtc *crtc;
 	struct komeda_pipeline *master;
 	char str[16];
@@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
 		else
 			sprintf(str, "None");
 
-		DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
+		drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
 			 kms->n_crtcs, master->id, str);
 
 		kms->n_crtcs++;
@@ -609,10 +613,11 @@ get_crtc_primary(struct komeda_kms_dev *kms, struct komeda_crtc *crtc)
 	return NULL;
 }
 
-static int komeda_attach_bridge(struct device *dev,
-				struct komeda_pipeline *pipe,
+static int komeda_attach_bridge(struct komeda_pipeline *pipe,
 				struct drm_encoder *encoder)
 {
+	struct drm_device *drm = pipe->mdev->drm;
+	struct device *dev = drm->dev;
 	struct drm_bridge *bridge;
 	int err;
 
@@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err)
-		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
+		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
 			of_node_full_name(pipe->of_node));
 
 	return err;
@@ -658,7 +663,7 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 		return err;
 
 	if (pipe->of_output_links[0]) {
-		err = komeda_attach_bridge(base->dev, pipe, encoder);
+		err = komeda_attach_bridge(pipe, encoder);
 		if (err)
 			return err;
 	}
-- 
2.43.0

