Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07F900DED
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 00:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF1610E012;
	Fri,  7 Jun 2024 22:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IVAF0mGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE410E012;
 Fri,  7 Jun 2024 22:11:49 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7e22af6fed5so5780739f.2; 
 Fri, 07 Jun 2024 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717798308; x=1718403108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3jaei81jj8xUrmWQKSpfLOPLqiUY8YCzCHgaZkL3Ss=;
 b=IVAF0mGrk8Bt1ZLwZMzZJmTbRv1Vn+jXDVY5jcgiIoX396mvVev/m9Cc9PFQvTZOHK
 2FEyy5vZbCU2PpP5rXRhUXw9SYzmlhxrRJoOjdpq/Lhiq7Ub6bpOos30hwm/XxrrYwJS
 JDbmgeroUWWUGJKGjLw2tGW8IWw+oY4lMO4xVmaAxd0UjP+A2cj4ZdWWFPpnTiAOh9g3
 75TsKz0P8IaAlGpxuXg+nhxDvVyZDreWaT0AZokYqnDg6ElEEVhMzA9nnRtCEUK4Rdk2
 UI1Uargi/eIqMVmNZUOdAXE6Y5Bx2aSFp42gA39roY8dXNUzMkBj6u2hjLL77luve5sO
 wuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717798308; x=1718403108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3jaei81jj8xUrmWQKSpfLOPLqiUY8YCzCHgaZkL3Ss=;
 b=qdEHmGMWHgVoSTHcUr6TPhtGR+sK0rMzO/Gwr6D1rTcooG4u/bSinmQY0JP5kkWYTW
 wH3kjJ14/YyH4L9YdOaX/qMhguDVg+5lCDbO1Toq+5R7KPoXLTdOzVY9asYseMMaRX+Q
 NdyL6VPzk54tIlZVWEiXDt/kbE018uaHshi77S0TavVR4/2J0SmnrbsGR5uSzolinyMX
 +FPbv/ZUZVMWgBOR7mQYkJXZxrSB5qiSUqEb9r6OoDpLmFgGBQk7OJHZ1FaHETWyUv67
 +IX3B/6Dc6uEJVJRJwrtB3CyLIUNN7Upi9FILnsuSdceNIam/B1TKZroVMgVOwcvuwE1
 ueoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvM8ccLNgI9bvBwLwu2nK0FvY26WH1yXPJr4oE7DbgFpNjFzhM0HVcA4Sz1tYPabUgwj92isPDEoDzbiLWTdCKOqbD3kst/9AQ14xd5Qx4HWAWQ2gtXfBhsLYDAubT1LLg4/ExEx+FENLYKO7BJg==
X-Gm-Message-State: AOJu0Yzyu/VHzdr5YFzS4uKvMgBdpo7dJrztm1aXp7YpoPUr94G2rR5v
 ejzebVF8c1d7rW8wjy0mywoBncvYIhVVysr2SX618j6fMpvoFhux
X-Google-Smtp-Source: AGHT+IEiBcOfSXobqq6vAjMYAgLdx8kDIz1R2uqyhzhEyQKksb63efpVJodqm6bSkTa6En2Bu04cLA==
X-Received: by 2002:a05:6602:2094:b0:7eb:3aa3:8b02 with SMTP id
 ca18e2360f4ac-7eb5724ac8fmr371097539f.2.1717798308411; 
 Fri, 07 Jun 2024 15:11:48 -0700 (PDT)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6de2221b28asm3238416a12.39.2024.06.07.15.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 15:11:47 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
Date: Fri,  7 Jun 2024 15:09:32 -0700
Message-ID: <20240607221032.25918-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.45.2
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
v2: drop extra checks in nouveau_display_hpd_work() and
nouveau_connector_hpd()

 drivers/gpu/drm/nouveau/dispnv04/disp.c   | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c | 6 +++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h     | 1 +
 4 files changed, 8 insertions(+), 3 deletions(-)

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
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index aed5d5b51b43..d4725a968827 100644
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
@@ -635,7 +638,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	if (!runtime)
+	if (!runtime && !drm->headless)
 		cancel_work_sync(&drm->hpd_work);
 
 	drm_kms_helper_poll_disable(dev);
@@ -729,6 +732,7 @@ nouveau_display_create(struct drm_device *dev)
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
2.45.2

