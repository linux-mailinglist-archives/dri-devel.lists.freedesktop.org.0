Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B1AEA061
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AF510E2B3;
	Thu, 26 Jun 2025 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="by03yo2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF8C10E2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:22:58 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748ece799bdso803375b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750947777; x=1751552577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMM3xSjjvtkN9sNymINSQ4aTR9MjXM5qmSlYZv1dEyw=;
 b=by03yo2UQQ53QuR7KIAvXGJjPyESlq+Y4qex8i0ebZxJWK60aSCoTr2tlHjUbrLiA1
 eNFTGIgOzUdP2SxHbQULxgNogjaB5lh6ovWU3Krz5/BZANiI9q+ZLREHZCjuSxXPHJLL
 F8XHUuxj8uuq8MsXHOX0lVfwfBo+I83mQUENQOmdoi2+eE7FH4Puu3HB/YcOmZFBoKkX
 JHv5VOQeKlF5r7s49EIiPaAEcNt5g8FesEZ/0EpWcKVUByvrvK00RYs+yf+UCRBX3/wZ
 Ec/CYWIgmrYQ9JIpziNUqNFJbPw7gB+g9X9LeanKJgSvE9IxXna5TBJ2bwGEie4MQ84U
 3dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750947777; x=1751552577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMM3xSjjvtkN9sNymINSQ4aTR9MjXM5qmSlYZv1dEyw=;
 b=LpSAWElA9yxcFMgYBslrIErRsWoopeEVMBzTrPXbS9AqcgbvjPgd6ZWC0vkuEJCgGz
 lpghQIBmMTHL8y+bjU62Ad2hRNB+737k186oGqToXxzOEoCYoBAhQ5BUIX2bpCt1WOVS
 tUT9MoCdc44mMNL5QkSwIEFOSxCaNK7G0AERWHth2xtfbYFM4u+1IcCGDVYE143Qxr1z
 IKt2RG/0XQVjrw8Ho10kBm1QXKJkUg0Z2SwGEw5tyCifMC5C57r2TII5iAlXbLbSdr3B
 CEiho4TwzEeZ0QdI+OBhaivmD2mOrpkW3sQlyf9NgOIIFcO+p69ZMnlJYej3pAmpWOyW
 pdkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWAXMKTWI8EkntPnvCCzff580kn3yM9ZrRB84R1ppJuHPplR/fDZbDlY/MZIlBeijJxRd5Ycv439Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfMXzJSGeLvmaBM1OdmIJCNo7Mj5XjGM0+TIN8z+UxD3iVOGY8
 EyhWnWuXRj7z62I2bMv9G5+/mGT7mVmH/X1XIKYYkn/qziEAucd6CW/M
X-Gm-Gg: ASbGncvKdUlTxzxYMql5faC7BI11yDDKHz1WMvIjK7YndcnTbCx1jY4/VLdBpm351nH
 iWbDMc1xYg23KezrSdEyJfNoV/IDViWkvacfA+7FO8+kiEELCW6VyCxryFllczPgUC32bY0Tab/
 fPzcbaN2FJuXtgj92MyzOrdG3CufNunz3t1TRxEVDUcsA9EkepUkv0venhLVGAHoRnNndNhujVa
 JxvVRTI2NcpSkqItlFKYpv8YHsy2Jgf9iGTNYH/myErh7L+njPyIoDmQmgoeIKA4zTVhCoj8WS8
 RV8HimVED9RRbswhNP6PYt77/zblArXHHOVgcuLYdcvPFFW8WgCz+nthWCblE8hpQ3vBE2WWvTD
 e8yZZVTEorgK73Ve1LA==
X-Google-Smtp-Source: AGHT+IHvPgEXqKwWC3H8FLqec238NOxqpv7452gpGXmtMjCrr6s266Ccdd9P8x3NxP0Pg4hK8zFHVA==
X-Received: by 2002:a05:6a21:3298:b0:1f5:591b:4f7a with SMTP id
 adf61e73a8af0-2207f31ac43mr11593474637.38.1750947777297; 
 Thu, 26 Jun 2025 07:22:57 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c67:6116:afb5:b6ab:2dc8:4a21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8872629sm7129288b3a.164.2025.06.26.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 07:22:56 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mcanal@igalia.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 stable@vger.kernel.org, gregkh@linuxfoundation.org, sashal@kernel.org,
 Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
Date: Thu, 26 Jun 2025 19:52:43 +0530
Message-ID: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Maíra Canal <mcanal@igalia.com>

[ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]

Currently, it is possible for the composer to be set as enabled and then
as disabled without a proper call for the vkms_vblank_simulate(). This
is problematic, because the driver would skip one CRC output, causing CRC
tests to fail. Therefore, we need to make sure that, for each time the
composer is set as enabled, a composer job is added to the queue.

In order to provide this guarantee, add a mutex that will lock before
the composer is set as enabled and will unlock only after the composer
job is added to the queue. This way, we can have a guarantee that the
driver won't skip a CRC entry.

This race-condition is affecting the IGT test "writeback-check-output",
making the test fail and also, leaking writeback framebuffers, as the
writeback job is queued, but it is not signaled. This patch avoids both
problems.

[v2]:
    * Create a new mutex and keep the spinlock across the atomic commit in
      order to avoid interrupts that could result in deadlocks.

[ Backport to 5.15: context cleanly applied with no semantic changes.
Build-tested. ]

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.173976-1-mcanal@igalia.com
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 9 +++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     | 9 +++++----
 drivers/gpu/drm/vkms/vkms_drv.h      | 4 +++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..77fced36af55 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -332,10 +332,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
 	if (enabled)
 		drm_crtc_vblank_get(&out->crtc);
 
-	spin_lock_irq(&out->lock);
+	mutex_lock(&out->enabled_lock);
 	old_enabled = out->composer_enabled;
 	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+
+	/* the composition wasn't enabled, so unlock the lock to make sure the lock
+	 * will be balanced even if we have a failed commit
+	 */
+	if (!out->composer_enabled)
+		mutex_unlock(&out->enabled_lock);
 
 	if (old_enabled)
 		drm_crtc_vblank_put(&out->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..1b02dee8587a 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret, fence_cookie;
+	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
@@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
+	composer_enabled = output->composer_enabled;
+	mutex_unlock(&output->enabled_lock);
 
-	if (state && output->composer_enabled) {
+	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -293,6 +293,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
+	mutex_init(&vkms_out->enabled_lock);
 
 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_out->composer_workq)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..666997e2bcab 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -83,8 +83,10 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	/* protects concurrent access to composer */
 	spinlock_t lock;
+	/* guarantees that if the composer is enabled, a job will be queued */
+	struct mutex enabled_lock;
 
-	/* protected by @lock */
+	/* protected by @enabled_lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;
 
-- 
2.49.0

