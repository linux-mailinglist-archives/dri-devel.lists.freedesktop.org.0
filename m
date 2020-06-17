Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E51FEC30
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB5C6EAC9;
	Thu, 18 Jun 2020 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A146E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:41:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y11so5002126ljm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xltqyEfwrx8qT/CORRGTWXmzlbt9i4EassNZ2G9y7tE=;
 b=BEku1n40/Xnsjf59bRGYdTjZwuEud3inCy82ivQq2zFfIDTBIX85BM/9nR3smARZoV
 iaFwihC/aAe4vO2pJBovuMPuEOVeDPjQOqTOgrnh0WAjgKQ21CEh6+Zog4OAtQYG46to
 cEscvGvVVlVXW7vE2KT1cCd/ERsIInyY0S/ZgeFI4BqE/JRaXM1rs4RAUdq0L22pbWRk
 vffAMF/f2nQk0kVBKzC0Nqs4oL45s1+9SwmoCIcSWebPLHTAF6u/CaWGG1Ho/Y35Hnam
 16Zw9dt8qSZ9zJVImUtI/bfP4EDauQu/MyWtES2ZDcZ7i1xVTkWmVCN4OEBIykxHBAfj
 yJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xltqyEfwrx8qT/CORRGTWXmzlbt9i4EassNZ2G9y7tE=;
 b=sSc/e3fWuSFFGJZa9FnmYB1rqEy/s0/+kt7OumbSOqTDRLT5+5ht+rLf00bR6udGLY
 pNv76GBQUQJ5Oj5I+b9Vk1ohG+Qw8DLIqdegyHViB19E125YQAYeSOTya0B1FU1rGBD+
 ARBmybg/J1I7VoMkqQzbuGjtXE1a38dYEw/7kxqEQ8TgcAFaGack8r6NIqa//J0ksRlC
 KG4J/TWJuny58eJTOoo4QbKfCQQqeFmgx4wpTswy/7vhmp4Y66YC+mzimEAT3KzV2q+9
 873jNK5uMhY4bsYbBlw8DfkwXAMEeFXvz74XPNiR7V9jvm/EMrqi3FOoFqNR9ycLHPOg
 B/nQ==
X-Gm-Message-State: AOAM533Kjhyqlghy4xc5OBDg+jbpspUgwjfUiILUJufRAJW38ZXFkGj8
 1SqlQLe4RKxXS0J5wcY7K38=
X-Google-Smtp-Source: ABdhPJzFPcMwk85WsfMjXGVdLczf/bH01bsX9EzaXAeWYS4zo/ADuFMsPuQVPLGoV7fmgcVzpYYJfg==
X-Received: by 2002:a2e:b4c1:: with SMTP id r1mr881604ljm.370.1592437262021;
 Wed, 17 Jun 2020 16:41:02 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id c8sm287871lfc.46.2020.06.17.16.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:41:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v3 1/3] drm/tegra: plane: Rename bottom_up to reflect_y
Date: Thu, 18 Jun 2020 02:40:38 +0300
Message-Id: <20200617234040.1094-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617234040.1094-1-digetx@gmail.com>
References: <20200617234040.1094-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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

This makes the naming consistent with the DRM core.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 10 +++++-----
 drivers/gpu/drm/tegra/dc.h    |  2 +-
 drivers/gpu/drm/tegra/plane.c |  2 +-
 drivers/gpu/drm/tegra/plane.h |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 04d6848d19fc..bb92c1ed44e9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -404,7 +404,7 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		tegra_plane_writel(plane, window->stride[0], DC_WIN_LINE_STRIDE);
 	}
 
-	if (window->bottom_up)
+	if (window->reflect_y)
 		v_offset += window->src.h - 1;
 
 	tegra_plane_writel(plane, h_offset, DC_WINBUF_ADDR_H_OFFSET);
@@ -470,7 +470,7 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		value |= COLOR_EXPAND;
 	}
 
-	if (window->bottom_up)
+	if (window->reflect_y)
 		value |= V_DIRECTION;
 
 	if (tegra_plane_use_horizontal_filtering(plane, window)) {
@@ -642,9 +642,9 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	rotation = drm_rotation_simplify(state->rotation, rotation);
 
 	if (rotation & DRM_MODE_REFLECT_Y)
-		plane_state->bottom_up = true;
+		plane_state->reflect_y = true;
 	else
-		plane_state->bottom_up = false;
+		plane_state->reflect_y = false;
 
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
@@ -706,7 +706,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.w = drm_rect_width(&plane->state->dst);
 	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
-	window.bottom_up = tegra_fb_is_bottom_up(fb) || state->bottom_up;
+	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
 
 	/* copy from state */
 	window.zpos = plane->state->normalized_zpos;
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 3d8ddccd758f..98e1b625168e 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -136,7 +136,7 @@ struct tegra_dc_window {
 	unsigned int stride[2];
 	unsigned long base[3];
 	unsigned int zpos;
-	bool bottom_up;
+	bool reflect_y;
 
 	struct tegra_bo_tiling tiling;
 	u32 format;
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 9ccfb56e9b01..e05ef6013a97 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -61,7 +61,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 	copy->tiling = state->tiling;
 	copy->format = state->format;
 	copy->swap = state->swap;
-	copy->bottom_up = state->bottom_up;
+	copy->reflect_y = state->reflect_y;
 	copy->opaque = state->opaque;
 
 	for (i = 0; i < 2; i++)
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index a158a915109a..8047fc916d8c 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -46,7 +46,7 @@ struct tegra_plane_state {
 	u32 format;
 	u32 swap;
 
-	bool bottom_up;
+	bool reflect_y;
 
 	/* used for legacy blending support only */
 	struct tegra_plane_legacy_blending_state blending[2];
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
