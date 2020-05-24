Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243851DFC72
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 04:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091036E235;
	Sun, 24 May 2020 02:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637746E235;
 Sun, 24 May 2020 02:26:38 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 5so6816721pjd.0;
 Sat, 23 May 2020 19:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q62HbLQF29AE0RBjNDiL0u701W1ygVc3UIAH2JHM1pI=;
 b=ekXSkH+e6TgJipaJVgrSFArO090SmCB6+zGXQQWZZTJu2Tu942uLeXi4qtkeROIdag
 Z4RswYGWFDXtAiNzA6eKzqLNKQfhJDPTCF3MrbcEPI0psPUdkwZ6byXw0gSBtDrVyO2r
 S1vtFTieT+sp1xAOk7miE3NB0cu9D7O5nR/stUmCoZdMiqnFSiHpbfA4tbsYLLk5uo6f
 9FIPBj6InOxBKVI78hq22WLcR0KnXykQtPpflGWvqCG5/MDNvBJbz+zcbB5tlVdBD35J
 5tDAM1RbB4cPPSdTgqLWnx/JrbllMhko7PgJh3bX9gbGSSvFNZWZgwFNgj3D5gkSuObq
 zAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q62HbLQF29AE0RBjNDiL0u701W1ygVc3UIAH2JHM1pI=;
 b=GqdZVI+ulEt4nQnHE9OR31wWtCoiSbAPpkl2z6F1mxJZa8D2UgDGkIhF0V5UgV+0mL
 dStr95QuYLhLxLIt7rOTKWeFdYo1FtD42P9ICpr4uD9kaI9eAlqNR2InWoRuzQR2AfZA
 NY6VmicvJ0WW/iCfmoeH8NvxRSm6kYhC9VVI5jDToQlVuftcy4KZ0mOplWT4IbfXvfKJ
 J80fM2HjDAMcPrr2oqdsNmXBbNlFkhJDRIC8VoUiFBynGz9BgrKlVAIMWqIQGCQ3p9jP
 xh4hR82UwQyna1Cp1JmhjDexKtVF0shEnQn+wS2ppuVZkIPqtfeE/qldw3IlBrbKpAAT
 2qiQ==
X-Gm-Message-State: AOAM530UqSRUECywa3hxoPPkDlfLpAN1RtyShYii95eIhTTK/HMpwi34
 v+ul5xExdkNk4qSNVlpaRnA=
X-Google-Smtp-Source: ABdhPJxxVJURz9EbY7Cysd58vv2JDmpJaC7CJ6LeSeuDVcDHjylSZOTmsjVC4/updmz2VDgc38cF4A==
X-Received: by 2002:a17:90a:8b:: with SMTP id
 a11mr12805713pja.163.1590287197890; 
 Sat, 23 May 2020 19:26:37 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id r69sm10206598pfc.209.2020.05.23.19.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 19:26:37 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/qxl: Replace deprecated function in qxl_display
Date: Sun, 24 May 2020 11:26:23 +0900
Message-Id: <20200524022624.10363-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave.

This is resended e-mail for your advice.

I'm a newbie interested in linux kernel and qxl module.
Please check this patch and give me advice for me.
Also I'll be glad if there is any task that you bothered.
Thanks.

Sidong.

Replace deprecated function drm_modeset_lock/unlock_all with
helper function DRM_MODESET_LOCK_ALL_BEGIN/END.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 1082cd5d2fd4..07e164cee868 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -162,7 +162,8 @@ static void qxl_update_offset_props(struct qxl_device *qdev)
 void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
 {
 	struct drm_device *dev = &qdev->ddev;
-	int status, retries;
+	struct drm_modeset_acquire_ctx ctx;
+	int status, retries, ret;
 
 	for (retries = 0; retries < 10; retries++) {
 		status = qxl_display_copy_rom_client_monitors_config(qdev);
@@ -183,9 +184,9 @@ void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
 		return;
 	}
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 	qxl_update_offset_props(qdev);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 	if (!drm_helper_hpd_irq_event(dev)) {
 		/* notify that the monitor configuration changed, to
 		   adjust at the arbitrary resolution */
@@ -403,18 +404,17 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 	struct qxl_device *qdev = to_qxl(fb->dev);
 	struct drm_clip_rect norect;
 	struct qxl_bo *qobj;
+	struct drm_modeset_acquire_ctx ctx;
 	bool is_primary;
-	int inc = 1;
+	int inc = 1, ret;
 
-	drm_modeset_lock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 
 	qobj = gem_to_qxl_bo(fb->obj[0]);
 	/* if we aren't primary surface ignore this */
 	is_primary = qobj->shadow ? qobj->shadow->is_primary : qobj->is_primary;
-	if (!is_primary) {
-		drm_modeset_unlock_all(fb->dev);
-		return 0;
-	}
+	if (!is_primary)
+		goto out_lock_end;
 
 	if (!num_clips) {
 		num_clips = 1;
@@ -430,7 +430,8 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 	qxl_draw_dirty_fb(qdev, fb, qobj, flags, color,
 			  clips, num_clips, inc, 0);
 
-	drm_modeset_unlock_all(fb->dev);
+out_lock_end:
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
