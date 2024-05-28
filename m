Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F37D8D274B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5310F844;
	Tue, 28 May 2024 21:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m53EpN/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8B410F844;
 Tue, 28 May 2024 21:54:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f347e8f6acso849625ad.1; 
 Tue, 28 May 2024 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716933292; x=1717538092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KzIu37DqkkW+Cz1sVAEbgQDsbfYiYv2kMR+B6yEhDS0=;
 b=m53EpN/Fl5kceh/GbyNkieExB1NR5CNQNTez8QHlIQvsfpBViCTkui98BcF89vr3ME
 LGv2Pu+XrDS0pvFNyP0Zl+h7UJeFupMT7zlU8x8cYr0gVGaBGi4xWx+t8xpWNDxhCViz
 v5OCIi0xwcMJCSXamG8++ahVCwFx7Fun3ec90/2uR44QbvX+fQI/KkZd6JiD/841v8ZN
 WtMn5emIxyNPP34DNB5CoBRju2Ojilr2tMH+M4JuU3/JEm+Puqh/PA/ch9UO62bjEGCw
 XqsJeZbffM4VyksJhV9obdmE9nY79be56DML8KGj3pGb33yUSSpQyHM7b3+CWqKlc98j
 d26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716933292; x=1717538092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KzIu37DqkkW+Cz1sVAEbgQDsbfYiYv2kMR+B6yEhDS0=;
 b=N8+ociCkn/1wF7Np0jmcOz7ygfuhfvRLN1z7FyySMr3xXEu5ZdAdDvdecYhsZo0XOY
 NLHwwum98bm4gRP6VsGqh6yG6RHW+B2T0WVfFEQ/hYvTdj/CyL6uvR2YCx7V4a9lGJfk
 RsScZ+mzysUZnXV2yH0G6buDBa7/kXG9itSC4vECrPIANb6DPATx2oxtvs8+/COUdUV7
 hp9QSgtLTXFM0X7dHbn8rJp6X1OctHQhh206NwQaIjMR165ysw0WpjkldgatbaT71kjQ
 umUUwer2dCYC8NngUfge/p4yAjtn1Nza+IVj8765R/zsK+TNfE5dHi2LQ3H6xty0ALwK
 451g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCQsYA+xNvz7un9hEM8C3OzziVEPDC00jNKD5AvwTXSghlX3TSBrRn+qYA1m2wLeRx4Pkjh+TqsjVWm71l28ZUUTJYjDQgtlv3+ARB0FOeuSqXA1NnutPEY2i0VXtHjkB3t6ohs+H0upkQqdMeYQ==
X-Gm-Message-State: AOJu0YzMfvS1UhfuEFMeKa/IIbHzBHyDZzXJ875hbUAca1abwyzyI9UW
 3JWI7fl71JPUY8F+gy5FIxCHl9suTEXtvpG5kfWY0RuYOVnT1T3o
X-Google-Smtp-Source: AGHT+IHcgJCvLsBRskDkUaDAWfOlyZcYlxZHzOY7xZdSR9m1gVY7jRLbD0C+mCcacgZ/89vJZUaWeQ==
X-Received: by 2002:a17:902:db11:b0:1f4:5ad1:b659 with SMTP id
 d9443c01a7336-1f45ad1c3ecmr132940195ad.3.1716933292537; 
 Tue, 28 May 2024 14:54:52 -0700 (PDT)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f4bcf3a0besm27586795ad.306.2024.05.28.14.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 14:54:52 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] drm/nouveau: don't attempt to schedule hpd_work on headless
 cards
Date: Tue, 28 May 2024 14:52:43 -0700
Message-ID: <20240528215344.2442-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.45.1
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

If the card doesn't have display hardware, hpd_work and hpd_lock are
left uninitialized which causes BUG when attempting to schedule hpd_work
on runtime PM resume.

Fix it by adding headless flag to DRM and skip any hpd if it's set.

Fixes: ae1aadb1eb8d ("nouveau: don't fail driver load if no display hw present.")
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/337
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c |  3 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |  1 +
 5 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 13705c5f1497..4b7497a8755c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -68,7 +68,7 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 	if (nv_two_heads(dev))
 		NVWriteCRTC(dev, 1, NV_PCRTC_INTR_EN_0, 0);
 
-	if (!runtime)
+	if (!runtime && !drm->headless)
 		cancel_work_sync(&drm->hpd_work);
 
 	if (!suspend)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 88728a0b2c25..674dc567e179 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2680,7 +2680,7 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 			nv50_mstm_fini(nouveau_encoder(encoder));
 	}
 
-	if (!runtime)
+	if (!runtime && !drm->headless)
 		cancel_work_sync(&drm->hpd_work);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 856b3ef5edb8..b315a2ef5b28 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1190,6 +1190,9 @@ nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
 	u32 mask = drm_connector_mask(&nv_connector->base);
 	unsigned long flags;
 
+	if (drm->headless)
+		return;
+
 	spin_lock_irqsave(&drm->hpd_lock, flags);
 	if (!(drm->hpd_pending & mask)) {
 		nv_connector->hpd_pending |= bits;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index aed5d5b51b43..1961ef665e97 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -450,6 +450,9 @@ nouveau_display_hpd_resume(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
+	if (drm->headless)
+		return;
+
 	spin_lock_irq(&drm->hpd_lock);
 	drm->hpd_pending = ~0;
 	spin_unlock_irq(&drm->hpd_lock);
@@ -468,6 +471,11 @@ nouveau_display_hpd_work(struct work_struct *work)
 	int changed = 0;
 	struct drm_connector *first_changed_connector = NULL;
 
+	WARN_ON_ONCE(drm->headless);
+
+	if (drm->headless)
+		return;
+
 	pm_runtime_get_sync(dev->dev);
 
 	spin_lock_irq(&drm->hpd_lock);
@@ -635,7 +643,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	if (!runtime)
+	if (!runtime && !drm->headless)
 		cancel_work_sync(&drm->hpd_work);
 
 	drm_kms_helper_poll_disable(dev);
@@ -729,6 +737,7 @@ nouveau_display_create(struct drm_device *dev)
 		/* no display hw */
 		if (ret == -ENODEV) {
 			ret = 0;
+			drm->headless = true;
 			goto disp_create_err;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e239c6bf4afa..25fca98a20bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -276,6 +276,7 @@ struct nouveau_drm {
 	/* modesetting */
 	struct nvbios vbios;
 	struct nouveau_display *display;
+	bool headless;
 	struct work_struct hpd_work;
 	spinlock_t hpd_lock;
 	u32 hpd_pending;
-- 
2.45.1

