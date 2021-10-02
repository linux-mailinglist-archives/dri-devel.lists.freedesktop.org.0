Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5D41FCC9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404D189338;
	Sat,  2 Oct 2021 15:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13EC89338
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:45 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id f15so11929191qtv.9
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7nCMGTCgys5hRW4WhI1DxCYZ01ugVhghWDldMJPqiw=;
 b=ZeyVB3Ww5+MndgRRuyKNgtxr4Xg4kU888pfduDgU4Da9wYrVcs0RSOBDqA7sjnLbWF
 ntkU1BR9LIebqEuq3E1U4V6xFqsjmRBILGZTDWbHeIN1WaTIO6/dXDxrHhDoxUi4RVVw
 LUXKPw6ajDT4ZS9d34nTBdp6Xdp3U29OPq8Qj7fGhKE2/88OyYLs2xJzxLhrVMlysO3z
 DeMhm2a70aUOvJxZWZ9lr3QeewUwi630gffYiCOxs5ziujd7Jn5ROzdNl1lfUyz048lH
 OcZ1pqrskrkbuHq/b5f3VQIM2qb2WFeVbZ+pwoMf568DgTS4CZ7Ar7/+RKXIxGZQ4teS
 DxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7nCMGTCgys5hRW4WhI1DxCYZ01ugVhghWDldMJPqiw=;
 b=zqnMcD9tiaggwaoNIJZ1ThCajHMDCiM2HF1J8q8nVSzF9I6Qm3HFmBMYA5wJkcLw3o
 pPUSq1XgccvJBzNOGAZK5qFyxzqGJGJV/n+cyip80Lu2YRqSgx7y90yiL4dS4/t0CGub
 HS9OMtPGArnZHjrTKsA5ZSwSrauxiOw/9aYOA8CCeHjhC8D5i8+SksjJc7XiHgzgZoDq
 x7HhsQ9e59scQGiHJoG/ccefIzSg74Ps3Qgn0g3HwZekZ5cP84auQxpt8pXAqb3cobE+
 WcpctEZjbeJoHEBTzo2LEI9RsB5uDkZmAoc1d5glVFYE6rEAwFwKS2M4gcB8RBtn2819
 EwVA==
X-Gm-Message-State: AOAM533m3ORaLiRcPhcDKuCO1Dj+GdiE/i5EKM6iuHJO9foyMCTq75DX
 RmySO4/OjPPANiIxW1nuqzY12mJW+iM3DA==
X-Google-Smtp-Source: ABdhPJz4Tta3xzWqk6v8cvex6TIIE1hil6jjUKR8RLxF+R9pJLP3Q6jwhOKiCY2c+h7VKis5wS51xg==
X-Received: by 2002:aed:27c1:: with SMTP id m1mr4214009qtg.241.1633189544259; 
 Sat, 02 Oct 2021 08:45:44 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p9sm4682358qkm.23.2021.10.02.08.45.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:43 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 01/16] Revert "drm: cleanup: remove drm_modeset_(un)lock_all()"
Date: Sat,  2 Oct 2021 11:45:27 -0400
Message-Id: <20211002154542.15800-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 8d813d1a535c8c7503a5f4061654a73026be8c5e.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_modeset_lock.c | 94 +++++++++++++++++++++++++++++-
 include/drm/drm_modeset_lock.h     |  2 +
 2 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index afd1351749a5..fcfe1a03c4a1 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -77,6 +77,93 @@
 
 static DEFINE_WW_CLASS(crtc_ww_class);
 
+/**
+ * drm_modeset_lock_all - take all modeset locks
+ * @dev: DRM device
+ *
+ * This function takes all modeset locks, suitable where a more fine-grained
+ * scheme isn't (yet) implemented. Locks must be dropped by calling the
+ * drm_modeset_unlock_all() function.
+ *
+ * This function is deprecated. It allocates a lock acquisition context and
+ * stores it in &drm_device.mode_config. This facilitate conversion of
+ * existing code because it removes the need to manually deal with the
+ * acquisition context, but it is also brittle because the context is global
+ * and care must be taken not to nest calls. New code should use the
+ * drm_modeset_lock_all_ctx() function and pass in the context explicitly.
+ */
+void drm_modeset_lock_all(struct drm_device *dev)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_modeset_acquire_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL | __GFP_NOFAIL);
+	if (WARN_ON(!ctx))
+		return;
+
+	mutex_lock(&config->mutex);
+
+	drm_modeset_acquire_init(ctx, 0);
+
+retry:
+	ret = drm_modeset_lock_all_ctx(dev, ctx);
+	if (ret < 0) {
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(ctx);
+			goto retry;
+		}
+
+		drm_modeset_acquire_fini(ctx);
+		kfree(ctx);
+		return;
+	}
+	ww_acquire_done(&ctx->ww_ctx);
+
+	WARN_ON(config->acquire_ctx);
+
+	/*
+	 * We hold the locks now, so it is safe to stash the acquisition
+	 * context for drm_modeset_unlock_all().
+	 */
+	config->acquire_ctx = ctx;
+
+	drm_warn_on_modeset_not_all_locked(dev);
+}
+EXPORT_SYMBOL(drm_modeset_lock_all);
+
+/**
+ * drm_modeset_unlock_all - drop all modeset locks
+ * @dev: DRM device
+ *
+ * This function drops all modeset locks taken by a previous call to the
+ * drm_modeset_lock_all() function.
+ *
+ * This function is deprecated. It uses the lock acquisition context stored
+ * in &drm_device.mode_config. This facilitates conversion of existing
+ * code because it removes the need to manually deal with the acquisition
+ * context, but it is also brittle because the context is global and care must
+ * be taken not to nest calls. New code should pass the acquisition context
+ * directly to the drm_modeset_drop_locks() function.
+ */
+void drm_modeset_unlock_all(struct drm_device *dev)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_modeset_acquire_ctx *ctx = config->acquire_ctx;
+
+	if (WARN_ON(!ctx))
+		return;
+
+	config->acquire_ctx = NULL;
+	drm_modeset_drop_locks(ctx);
+	drm_modeset_acquire_fini(ctx);
+
+	kfree(ctx);
+
+	mutex_unlock(&dev->mode_config.mutex);
+}
+EXPORT_SYMBOL(drm_modeset_unlock_all);
+
 /**
  * drm_warn_on_modeset_not_all_locked - check that all modeset locks are locked
  * @dev: device
@@ -293,9 +380,10 @@ EXPORT_SYMBOL(drm_modeset_unlock);
  * This function takes all modeset locks, suitable where a more fine-grained
  * scheme isn't (yet) implemented.
  *
- * It doesn't take the &drm_mode_config.mutex since that lock isn't required for
- * modeset state changes. Callers which need to grab that lock too need to do so
- * outside of the acquire context @ctx.
+ * Unlike drm_modeset_lock_all(), it doesn't take the &drm_mode_config.mutex
+ * since that lock isn't required for modeset state changes. Callers which
+ * need to grab that lock too need to do so outside of the acquire context
+ * @ctx.
  *
  * Locks acquired with this function should be released by calling the
  * drm_modeset_drop_locks() function on @ctx.
diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index 865e64bcc4cb..aafd07388eb7 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -132,6 +132,8 @@ struct drm_device;
 struct drm_crtc;
 struct drm_plane;
 
+void drm_modeset_lock_all(struct drm_device *dev);
+void drm_modeset_unlock_all(struct drm_device *dev);
 void drm_warn_on_modeset_not_all_locked(struct drm_device *dev);
 
 int drm_modeset_lock_all_ctx(struct drm_device *dev,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

