Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD5910A5D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8004C10EA82;
	Thu, 20 Jun 2024 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XmQMJm64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380710EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:46 +0000 (UTC)
Received: by mail-wr1-f100.google.com with SMTP id
 ffacd0b85a97d-36336aa7ca1so809293f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898405; x=1719503205;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkP9iEWnJ8+fD4l5BsM+e7XVkTfgNWUmArUwP2Fi9iU=;
 b=XmQMJm64ZCN7O1qU1xUFxAEPhHSis2vNVUvn7YVzdv4HkA3PynpckOhWjqqNRz0fdG
 wZOUAc2+nFFivBkYJunZmE56jmc0ND6D3Ol8OSv7FJCwgIRdymlRiJ1d5hjSrwSYBCfW
 77iqPw8FsI8X7iZ20ttYbZQvJ3tp0j2lV3lOQ6PfFIcNjEa6MH04Uu2i5iBkmWUMzKfE
 yIbnmMHWQ8idmGUHZYM4d6p6tyhdaa+0oCudUhIkWZRWrPnMccQ9XWSH5o4ZulaQ2+FP
 oloZ+GPKiajvyCRJZ8wNpOL1LYnVShIAF/yZV695oDLjnN1caTO1wGxa4JQ0oqU2f+5c
 OfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898405; x=1719503205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkP9iEWnJ8+fD4l5BsM+e7XVkTfgNWUmArUwP2Fi9iU=;
 b=sQtwylNVvRoLIXsuCIi7BgDWJQB7NJy6lkGv+91SooUK012VslFLEgMQjqa7CUU9Um
 fp7zRhMYIbQnDA8yFn1iKidRW8go3C9BE4wbf/GkASa78+QKF1kRL05kqW8kqAXIEtBq
 NoteOBZJWQ3lzdOqwKPrhE4n3xjLL889mYKfxymxQORv/Lg/41aS+fq8ZdhZpMol87+F
 NYcOe8kOt9kJh8SQIaqWwpCN1gn9NHNnFj909z/X/4v4ttrx1cH7qxV0hOqbMa9SONnV
 xLgREQT8GlTkFQgTjEh8hgbL8SCADPQwQA1ZH19m+/lj4Jsa6jbFG6/Pf/djQAg9tttg
 lGkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/5DF2AWZz0NyZETEvTBufNaeRONe/r83++aMZgJvVUJU2UxgnvcypXpVclz+A1eu6evsVkzbaKstdwpGkwrgeZeb3NclCvgajdTjhCvaI
X-Gm-Message-State: AOJu0YwjuFr6CHA+0R08regUUKzoQN1GlSk9fEnsad949PTtal1SmyJr
 90zeX05XRr2WDNHPO2pfPbxmI7p89DPU3Ehmj/88tTh4tSVFRYfJ2WcK+9dsvgBwEPQiX/UhGbo
 iwtBL5NfedqyltDenHkU1tnBMt98f/iAv
X-Google-Smtp-Source: AGHT+IFxjRXQTxViWEue3TNlnvvlutSm0vkDR3s6yzSDmhyNwT4pNT2iQpFKiq5JG83kbHmkPbB83TSgpFwi
X-Received: by 2002:a05:6000:1108:b0:35f:1753:7159 with SMTP id
 ffacd0b85a97d-363177a3ba3mr4060519f8f.19.1718898405183; 
 Thu, 20 Jun 2024 08:46:45 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-360750b76a1sm913906f8f.20.2024.06.20.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:45 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 11/31] drm/vc4: hvs: Print error if we fail an allocation
Date: Thu, 20 Jun 2024 16:46:12 +0100
Message-Id: <20240620154632.4125308-12-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

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

