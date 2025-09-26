Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FFABA3257
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500C210E364;
	Fri, 26 Sep 2025 09:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/kmGC9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BCD10E364
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:30:31 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso1849900a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758879031; x=1759483831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xIrcfuajKloRdvJjcJcWDV/tHO/j0RB4pp+HMPl3L4g=;
 b=L/kmGC9OMEKanr7O0aj9kxkW/zd4JPba73BRfvu2wcJfTjzK03nPr9D2lJ60g6m+23
 U6GHWQhJXt2NPE60n/oW5GP/ThBnybdG0FG+TePPd37DCWFe+RF2wloeqQHEBZy56pqQ
 M61iYGE4qDaCkFKDcsQn73qrOSfBqCvMIX0MlVa3d1KS+RjVGN1UcbQCWpWQLDomLJP4
 P7iaL77TnGs35aKDmeZxgPCytU79rwpEapZFN/mzqdSZIDdhNEaMLxI6YoxjHN1dTp6B
 FXPmwEVE+F74K+awCac3e6qbRq6HtirU3scFriGVDYUv0MvdYwMBpAt8FdWsGyyaLj0H
 jFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758879031; x=1759483831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIrcfuajKloRdvJjcJcWDV/tHO/j0RB4pp+HMPl3L4g=;
 b=bdNBngbh7wFX6xDtgR60UjVYLsCmusN+ZRJrhhG8ixJqMvW7ITDX0Y3GWsOB3p+DzU
 YnNXQs7tFdU99mgWseLpXyHlB1d5CqXmjCDkCZWUklG33aqs8Z0xUH1ysi6CKLbhtsbZ
 wTzgI5JK0KIIwijnZ/HEMr4pYXGbKzvBe8qZ9VVfET6y73RnKOTE99huV1OGb6kbcN9w
 /lgbiTyFN9u7bFn+rABxyIN8Dv9o2pITqYjMuMja/UGpS4adTQBWLK/q13YoIH2mt8M+
 ZusrWWNyK+v+JR8oXlnc8sk6EfQR6Qv8Qgbh1K1jxbLW+sdy1tLsEfTVo/WuX48AHmlP
 3Jrg==
X-Gm-Message-State: AOJu0YzLlXqjs+1B0XG7y9UF9bcyBjCQ3WyPF/PZXSR4YoAcEuaYJFIq
 Q1Zvb2sEv6vEmAcjwajiM/aOD0Vv/C+PcCN6FKgUpyKv2UPoF4MS1k47
X-Gm-Gg: ASbGncszHDSaXTnUZwT+LpaaRu9vVqKj0kCRB+lgUT82ZWyV7MiHpe7QdbldRdCdKEA
 LFRjTa7+QkQIYuSyBHlTH8HZiAs3UsRSyX/OCOa6TfO/JYfX7Dk2u/mfrzbd3dovA2rKhGSuiBZ
 GES9b1v1TO8psM4UgVa46H+RKkZEznxQZPmvqytDykV1dPy6a3Jz1gIL/K2/u6ryb+jjDT58aEV
 1Sf85UmLQ46AVTxYbNiMR8XNexj4JfynYEdY+EBLCEcd1Tb+Si61I/vWx+iolaSm8nlMcZ28VyV
 xKGhSekkl7FyLd3ScbpIj/jF8Wkc3EB9fZUoBymY7JNuNr64qggo+5QoHVeKQYmC+tKs8sWCExL
 RQl3ROHdCecz9UmHDvl3j38+6Y/rXI2cbYVG5y7MnNS96JT0=
X-Google-Smtp-Source: AGHT+IFh/+YHDIq4RGXYffEQZgqis2V02Xt7mq2qDUgh7Tj46rZmWeOaWQ9Ju5fqSzoyMvNSy1QcEA==
X-Received: by 2002:a05:6a20:9150:b0:249:d3d:a4d4 with SMTP id
 adf61e73a8af0-2e7c7ea3a75mr8452854637.26.1758879031332; 
 Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7810238b19dsm4048646b3a.10.2025.09.26.02.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_* with
 drm_device parameter
Date: Fri, 26 Sep 2025 15:00:08 +0530
Message-ID: <20250926093008.1949131-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
Changes since v2:
- Added Reviewed-by tag from Liviu Dudau

Link to v1:
https://lore.kernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com/
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 31 +++++++++++--------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..5a66948ffd24 100644
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
@@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,
 				struct komeda_pipeline *pipe,
 				struct drm_encoder *encoder)
 {
+	struct drm_device *drm = encoder->dev;
 	struct drm_bridge *bridge;
 	int err;
 
@@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err)
-		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
+		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
 			of_node_full_name(pipe->of_node));
 
 	return err;
-- 
2.43.0

