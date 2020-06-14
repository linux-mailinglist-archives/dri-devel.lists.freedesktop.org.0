Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127441F8FBD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A616E2E8;
	Mon, 15 Jun 2020 07:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4889FBC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:04:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y11so16593770ljm.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
 b=ACmbn+5LXY4ZgSyB5eD2v8bAUH7BhdjMukZJxujxn21BKNuQCWiZ6pskW4u3Tm5yr0
 tDiPjS6qceDlCgDUbJgscgg2oTd5+P+OKeH6aTet8up1loIk7GrZbca3gwLO6ZWhtC6k
 9DBOA9ckjUqT0Hw5EeYNOvsiUYVNxxeWEPZ9ycUTi8JEGh9wjMhDi5c7Sz53SMGozPTz
 7ObH4sMO3A2aHTAMMmPDsjHZZ/kqv8nbR5PqpesorGkwfOGlhTZchvKwB+EtvAGaMEm2
 SNmyqRbk4oasOKl1C6l2Aefo6oBLjDcj19++pAZE3rLyK1NK1BN6ZOUpXqoF3Zvq7Z0e
 s5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
 b=OGsuUdZj3LnelnHbQOMH+J3immivGmBxRFUIcDt3WYgLgytGAAT/TbAJ6QZCnfMeWk
 RIUn3MnAA2dEAOghVnraUJYxrvI/QVmFsVs5BSu+UzqO92Wx3G/emsQ7K5+zDq30eqWP
 Xf2yzN9/7oDQBkbxZb1JiOuRX7uch+lf+GOT7OGWhYMwWOXzO2KMxKns102jy/WGi1/c
 W3uBkVdkrtLbbjK6a2Zof0z1gxv/AG6O/LVaMHw9E9jorQWML/Kntu3AZJanpie02dOP
 XaQ/yE7+G+E99N48sWoh2DOvWw3MUa7SE33y/clDz47GBObtEZ9SEtnm8H/J6izdZZMb
 Zl6g==
X-Gm-Message-State: AOAM5305bmk5oFPC5T4oTnpyQeUpp+mY7+macUy+GwU71MlAZUISG7pQ
 aFR7zFOHRUXP0nJbwf8u6Wo=
X-Google-Smtp-Source: ABdhPJxQT3G2mCw18H746uY1ijS4rGlw8gNoDzHcB1Pz3EhK7VWgAyWf/terviKuL7YatcalbXOC6Q==
X-Received: by 2002:a2e:6c12:: with SMTP id h18mr11938124ljc.62.1592161449972; 
 Sun, 14 Jun 2020 12:04:09 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 12:04:09 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v1 6/6] =?UTF-8?q?drm/tegra:=20plane:=20Support=20180?=
 =?UTF-8?q?=C2=B0=20rotation?=
Date: Sun, 14 Jun 2020 22:03:48 +0300
Message-Id: <20200614190348.12193-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614190348.12193-1-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Combining horizontal and vertical reflections gives us 180 degrees of
rotation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f31bca27cde4..ddd9b88f8fce 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 {
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
 	unsigned int rotation = DRM_MODE_ROTATE_0 |
+				DRM_MODE_ROTATE_180 |
 				DRM_MODE_REFLECT_X |
 				DRM_MODE_REFLECT_Y;
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
@@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	else
 		plane_state->reflect_y = false;
 
+	if (tegra_fb_is_bottom_up(state->fb))
+		plane_state->reflect_y = true;
+
+	if (rotation & DRM_MODE_ROTATE_180) {
+		plane_state->reflect_x = !plane_state->reflect_x;
+		plane_state->reflect_y = !plane_state->reflect_y;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -720,7 +729,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
 	window.reflect_x = state->reflect_x;
-	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
+	window.reflect_y = state->reflect_y;
 
 	/* copy from state */
 	window.zpos = plane->state->normalized_zpos;
@@ -806,6 +815,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
@@ -1094,6 +1104,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
