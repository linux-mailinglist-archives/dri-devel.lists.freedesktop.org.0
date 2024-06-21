Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57A912959
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ADB10F1E6;
	Fri, 21 Jun 2024 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="f9fO/nmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFDE10F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:37 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6fb696d2e5so250839966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983296; x=1719588096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7e8MI52CZU9jUZa9s09qgFB9GZaF0zzy0rpv0rqfpj8=;
 b=f9fO/nmj5agvyb3OvMGfULCdkXYFXM2aYnERdY56AyYKMa93+GLyFsK5XkS/Z507Y8
 sOTaNryYbjgKq3y7zH3gThntJ+MsZkKBa9nTAYUPzSTfW4L0wBiGc/7fN2NSMHC1X6lU
 x9ZuzeCqx/CaRJ229BIawHnaNcKjVg5mn2okdkIhR75pv+UIlH6yI6ItMNGM/xkgi7Ai
 YOcmRAMqPuNGe7w47AhktpftUdD3U/G5f52h51vqirOXXI+bg/jfEiNdJv4V5CX+zxvz
 +jp3/4JZlxTHu4LVciFI2+1TywuRcSrhrS0Ye+Lci6qi3/1SAf0C/gjURN7GAZrLDlkg
 I1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983296; x=1719588096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7e8MI52CZU9jUZa9s09qgFB9GZaF0zzy0rpv0rqfpj8=;
 b=SykBCCRazkbV4Wcd8GGZLxHGFy8ckOatkBDEuy/NzXeYJFiU3kv+3Y/to5GYXk+iZe
 /3rTYdQ8IBS0gmE/3kwEB9z6xmgXz6qua5s2mxYdOjxMUuBsOS5I3eOfVEXPYgXUE3Fe
 QtVaEGNx/nDKFZzzyFjYc+sq4w1SbrKqlbHMoAFXmlI99nUBHwcxcuFP679baN3ZCMR9
 jfFaR3xc8CFPg0X1FpeWMDr9PVSOScfKITGKRYR8lfVzTC2E2mFYQ0VIda2Nlkbq/+Rl
 JgVbUXO4Q00+5EYTw7FBivCwP7jKOwjoJuzCuEjCl2y7ayxddRddHIGkrcV8/vq2rwhT
 ouyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXey0tEut8gya+PLsg6Lk6nTLkHmGzhFNpZ+55lmWBRxB+1t4cipE7Zq+7IE60ZHmws05q17jfv+zI4v/Fi8UndYjKXRbD/OvQT0lSsCcvw
X-Gm-Message-State: AOJu0YwK/DaS3rsYqftNLF0iXYfPuC8HHMUYrYPuPyRAtfXttRdfuuEJ
 lJledhzOHMrscA62lkCItnjB1jZVtK42yyAlOK1K4HFK4VveCqNwExQ8AtCxvETA8FiXeFxBvNI
 B1BX2vl6sLHJKke+uvGWNlSFlfmah+YlX
X-Google-Smtp-Source: AGHT+IFc7M+2TFhL7RTuhRrbyBsm27e6jzd59dq6M77nPlTvp7DviXi3h1+BEizkCjhVLv6WzfBNIiL89Ltc
X-Received: by 2002:a17:906:d8a:b0:a6f:4c90:7951 with SMTP id
 a640c23a62f3a-a6fab60bcc3mr472697366b.8.1718983296384; 
 Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf485fc3sm5618066b.82.2024.06.21.08.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 10/31] drm/vc4: hvs: Print error if we fail an allocation
Date: Fri, 21 Jun 2024 16:20:34 +0100
Message-Id: <20240621152055.4180873-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

We need to allocate a few additional structures when checking our
atomic_state, especially related to hardware SRAM that will hold the
plane descriptors (DLIST) and the current line context (LBM) during
composition.

Since those allocation can fail, let's add some error message in that
case to help debug what goes wrong.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 4 +++-
 drivers/gpu/drm/vc4/vc4_plane.c | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 189d00fcf4c2..2c69b74b25a7 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -475,8 +475,10 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
 				 dlist_count);
 	spin_unlock_irqrestore(&vc4->hvs->mm_lock, flags);
-	if (ret)
+	if (ret) {
+		drm_err(dev, "Failed to allocate DLIST entry: %d\n", ret);
 		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 978433554f3d..e4fcef11cf6f 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -739,7 +739,8 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 
 static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
+	struct drm_device *drm = state->plane->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	unsigned long irqflags;
 	u32 lbm_size;
@@ -765,8 +766,10 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
-		if (ret)
+		if (ret) {
+			drm_err(drm, "Failed to allocate LBM entry: %d\n", ret);
 			return ret;
+		}
 	} else {
 		WARN_ON_ONCE(lbm_size != vc4_state->lbm.size);
 	}
-- 
2.34.1

