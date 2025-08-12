Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D12B246D1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F2610E6DB;
	Wed, 13 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dNu9h2jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828C810E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 10:11:43 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76bc61152d8so4503781b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754993503; x=1755598303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3fgtXN5rRXHOe1ck5n3dKX8NCGLvm4nzF6Ux8XvV2gs=;
 b=dNu9h2jLGsOINFdLY/b/d3V03WeFtfnvD5RPXIs4oDAWwCETbvt8r1+NiHNv7mwzhe
 VZbVOliAvo6WGtzqk4uhCODQGqtuabchVleXRUONDt8Gh1tNF1t9vAnBZEkbh8RQ02dX
 kHcgrka2UfclzDJcI//td3mvqRejuK2JvepAiv6iGDWJcd8n6i+vgKAbsKCU4r85YvBU
 62fjfmP3Tv41iEJF9Qm3eIGJUBqvKSS+lZ68twmnxKQQfsAQhPrIxXzkXzWusX+O9IQE
 prelPgH/JkSvLFSUuDlsHmQRIEvG2qZpR2+vIJgixWMC+5TemWNYr4pH2CmmVVrMyc3G
 OcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754993503; x=1755598303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fgtXN5rRXHOe1ck5n3dKX8NCGLvm4nzF6Ux8XvV2gs=;
 b=Hq8h66v+kOHbEvCs1uaqGrtrKpf+WJIdIoGn/p0shGMHI9p8z9TTfwfId9CiImJXzQ
 szhpjDDlbQGHjjMLRgEurMh3O5pxV9lBTTrt33MlqRGeBZAJR2GDW45OgzEJ7igmTqAD
 TcCcT5iXc4LQakEqS+9OZ1r8zOKfPhorumM96P0wDPHHhYTh7WjqGZcCPLvpFw5VJNu9
 epUAUoXZU78c44odKAcq2Aa15h0zASG3o28vg35x3NwniCRgffKVxPhlScPFSqPjR+kQ
 klCWoRkOnv6VY/JlC5nYPTUX4piVsLkSe9soY3wvGia3PWnNj0D90ze4F+PTKKTlu9jz
 Ws9A==
X-Gm-Message-State: AOJu0YwbbfKzTpBmd0F0chv4DU6vGc9s+w6xOxRGtBBKSVMIeqfNRt/0
 TSor3YdLxxS5zFK2/n96zI8AeUQ6aVpRi0A954IYayruV8O/SE1e8tuI
X-Gm-Gg: ASbGncul/H4NnitcigVAG/scEromgCpNcdxWu5mIun015tD4EwLBPCqkSK3jTQ9e9OD
 6K1dnhMO95sOMB2clw/qfKm5MKTvMR90E0c0mTMkhL68qGXZx6O6yX5zFiCi1J6Fdy+nSI0BngY
 jO3VEBidQHJcpy+/yzsmcPVrL0fnWELD4dUCCSifL4XqEkdk8358rGx1m+oXzf/GFn87E74nVmw
 uFBXv43wC5GQkaMTb7PJ8WUWu239lz6IFr6zthGDTgMiKhhRzkgHN1UoU1R6gMAgOk+Guen/kI4
 Ny/RQ4p+52IMdIkOosNmMGAzG2W0qo+Gn4nhu+VoY3mS+B5xlo7IF9kRVz281RtMyvbhEhD8HL+
 vbpzrazUkxbSXSvLIN2cYX1E/2OmdarAcaXPV
X-Google-Smtp-Source: AGHT+IFZMB56+TLUK9FTTWXt/xVo62vy3KzcAIw48udlpbEJwb+VtWN52sGJtvdTKBAk/gkhpGIqWQ==
X-Received: by 2002:a05:6a00:92a7:b0:76b:ffd1:7728 with SMTP id
 d2e1a72fcca58-76e0dfa08d3mr3840831b3a.17.1754993502833; 
 Tue, 12 Aug 2025 03:11:42 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccead450sm29125124b3a.54.2025.08.12.03.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:11:42 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_* with
 drm_device parameter
Date: Tue, 12 Aug 2025 15:41:19 +0530
Message-ID: <20250812101119.2506-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..e4cc1fb34e94 100644
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
@@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
 			  mdev->dpmode, new_mode);
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
@@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
 			  mdev->dpmode, new_mode);
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

