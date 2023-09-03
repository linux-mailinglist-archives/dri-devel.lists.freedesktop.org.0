Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7377790D8E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E4D10E1F4;
	Sun,  3 Sep 2023 18:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F45410E06B;
 Sun,  3 Sep 2023 18:46:15 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-79536bc6697so22152739f.1; 
 Sun, 03 Sep 2023 11:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766774; x=1694371574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7joZjSDNylfwIjlN/v1EJKsLNVMUogPTU5+zZ+4Y2sA=;
 b=JCdB2JyUs215ve1xZsK0Pz6TtiG/b/L1m3rWJpR3MwvpbWHiC43XpsJvNeHo3r5bv+
 yoTrkq1NnQRqW1oWkcWEuNT68g5Dxhx22F743WbOckqszhDC1FXAT82dPhBIPqHmQ/WO
 wkAQrMFJg7C1ZDs5EQpg0y4zyEgQmkhPkcGxBNYTDaXiTKwiS3FWYux9RsT2q5ecE2Hs
 By5dlBcbGSfiaxw4GExPgb3tfvNDNotsHF3f2zMBh/7QhntdYwA5J/Cxgz3/oN6Situu
 +Uj/DZsoXanCUJriVbbIWzu8mHR9IU7zTykCODsmY+AVNcCj1F8Dr1EdwI0rRieseokZ
 rdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766774; x=1694371574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7joZjSDNylfwIjlN/v1EJKsLNVMUogPTU5+zZ+4Y2sA=;
 b=kf2dfEg85LWaZmtXdiZG9pbBcKizSjsJslssx1MvxmX5m9Hx8l4/cFSWmohp42P5Zf
 es3BHi1pjRbiFfHzBpAqfAKRS1e026QdrZZCkyc2r8QA3rEdF+mjHmb3ZfM37ZuL8rMW
 uHDmQkpqFWQ0vZh+MwCevO+STF0X2Pck1I5A4vFW1ffPsPSaDlUnkArJrsibhqaCCp2d
 T2Hrrr+tomTp6Mx0jvGBNpo6dpwk/M62Gcq4Ih9WTdXv7hdb88wdH6v7I2bxNQX87x45
 1lO187nWn/mRYZYLl2kmYGE/7ygbcNIvT7KXn6wqnibdszq2IcAh9Kh+NPtGh89qx/Mc
 cfyg==
X-Gm-Message-State: AOJu0YyuMIx95WDrN4voJldLsgiqIX07qTvCzoJTmTWfz4hyULwU7skf
 TY9y0zzkbBDKnFVGn96FsKg=
X-Google-Smtp-Source: AGHT+IHUzoCTyhxdX6icAGEBT8dXiH/ioOo1c7WiBYkDqk/qvBXBfPW/4NAojWOMT3RGaqLcGBJwug==
X-Received: by 2002:a05:6e02:964:b0:34c:abcb:97e8 with SMTP id
 q4-20020a056e02096400b0034cabcb97e8mr7956738ilt.24.1693766774237; 
 Sun, 03 Sep 2023 11:46:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm_dbg: add trailing newlines to msgs
Date: Sun,  3 Sep 2023 12:45:59 -0600
Message-ID: <20230903184607.272198-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 Edmund Dea <edmund.j.dea@intel.com>, seanpaul@chromium.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  | 10 +++++-----
 drivers/gpu/drm/kmb/kmb_plane.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 647872f65bff..a58baf25322d 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -94,7 +94,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc,
 	vm.hback_porch = 0;
 	vm.hsync_len = 28;
 
-	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hsync-l=%d",
+	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hsync-l=%d\n",
 		__func__, __LINE__,
 			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
 			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
@@ -194,24 +194,24 @@ static enum drm_mode_status
 	int vfp = mode->vsync_start - mode->vdisplay;
 
 	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
-		drm_dbg(dev, "height = %d less than %d",
+		drm_dbg(dev, "height = %d less than %d\n",
 			mode->vdisplay, KMB_CRTC_MAX_HEIGHT);
 		return MODE_BAD_VVALUE;
 	}
 	if (mode->hdisplay < KMB_CRTC_MAX_WIDTH) {
-		drm_dbg(dev, "width = %d less than %d",
+		drm_dbg(dev, "width = %d less than %d\n",
 			mode->hdisplay, KMB_CRTC_MAX_WIDTH);
 		return MODE_BAD_HVALUE;
 	}
 	refresh = drm_mode_vrefresh(mode);
 	if (refresh < KMB_MIN_VREFRESH || refresh > KMB_MAX_VREFRESH) {
-		drm_dbg(dev, "refresh = %d less than %d or greater than %d",
+		drm_dbg(dev, "refresh = %d less than %d or greater than %d\n",
 			refresh, KMB_MIN_VREFRESH, KMB_MAX_VREFRESH);
 		return MODE_BAD;
 	}
 
 	if (vfp < KMB_CRTC_MIN_VFP) {
-		drm_dbg(dev, "vfp = %d less than %d", vfp, KMB_CRTC_MIN_VFP);
+		drm_dbg(dev, "vfp = %d less than %d\n", vfp, KMB_CRTC_MIN_VFP);
 		return MODE_BAD;
 	}
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..308bd1cb50c8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -78,7 +78,7 @@ static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 	 * plane configuration is not supported.
 	 */
 	if (init_disp_cfg.format && init_disp_cfg.format != format) {
-		drm_dbg(&kmb->drm, "Cannot change format after initial plane configuration");
+		drm_dbg(&kmb->drm, "Cannot change format after initial plane configuration\n");
 		return -EINVAL;
 	}
 	for (i = 0; i < plane->format_count; i++) {
@@ -124,7 +124,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	if ((init_disp_cfg.width && init_disp_cfg.height) &&
 	    (init_disp_cfg.width != fb->width ||
 	    init_disp_cfg.height != fb->height)) {
-		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration");
+		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration\n");
 		return -EINVAL;
 	}
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
@@ -375,7 +375,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	spin_lock_irq(&kmb->irq_lock);
 	if (kmb->kmb_under_flow || kmb->kmb_flush_done) {
 		spin_unlock_irq(&kmb->irq_lock);
-		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning");
+		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning\n");
 		return;
 	}
 	spin_unlock_irq(&kmb->irq_lock);
-- 
2.41.0

