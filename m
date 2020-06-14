Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FF1F8FBF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198E86E2B1;
	Mon, 15 Jun 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B5989ED3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 20:01:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w15so8262102lfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ye8LBDqYIu3EMl0SpXZiBgFDVin4wanrCIFCoDUlTCY=;
 b=SoB/4euzW5k9CYw5Ii/nVBn2BfJ2i2v+InpObJBSDnnxtZ/To/YPToipPIeTij/I5z
 Uqd/0q9ppDSmpzW7/9JEiPB6JCfceumQrwKAzRtZlXZKZ0TcxriVt0hgx8fZMBsd4gQj
 uUW+ZzjRWNR5Q2aULIGx96jcpJv6zBygMjitVZAmW+q/RU4cSVXthXzIXHT8g0QXjWfP
 diEjpSI6ZOAk8Xbk1s6ermwghWT8VlUH3A+NzxgnIyG8q/vZahTEHBalwSG1C5Umi83C
 fTuY2IGmZYbVbfqiisGf0zLZrIlDsCFxgb4bCpHS9wHyweDFoPmp+NcxyMac1F9eS4U5
 dw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye8LBDqYIu3EMl0SpXZiBgFDVin4wanrCIFCoDUlTCY=;
 b=gQM1cjPu0zrnGbn9x79Wv9LhT9Cz6AUHNq3swT1qkpLYGOpGqENlWR3Omh+MBFUrk/
 79ln4uoguB/78WnuHErr86R0SG410QDFUMYuVOgXz1EvtygKLQatHg2CVIvbPp+QjtH5
 WuFvZkXvP3QlGV1VaoeBQGBXxMb5rtnacmC+fsglo/GNNl4et5Sdcah/nsmmMZSgoKJ3
 Cqc2+mVGnhYqVzdRdvKL8dsS4Uemd3H3uxel0wx3zXDLg9rM/RBMXIdF8/7ZWIL+HwZm
 Eq1qRVb1lhbY2yPiUakIhGM3/m5/IZXCGhoXRbcqNR8uOHMICBSP5wFpa6ufVddGfEM7
 B1qw==
X-Gm-Message-State: AOAM532PImgkcOhjgKQBy68ATUQ8/g2gM0a713rDTK2E1rWqlEFevgVH
 LkYx3miMhaWs/J5cVczWr3k=
X-Google-Smtp-Source: ABdhPJz3xWCaB9MQX7FZu+cXBk094pgmQx9brJzlxQLAMXmhXUdExTSG1KrVTTnUUAI2TC5it+n3gw==
X-Received: by 2002:a19:a405:: with SMTP id q5mr11586700lfc.164.1592164904535; 
 Sun, 14 Jun 2020 13:01:44 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 13:01:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 3/5] drm/tegra: plane: Rename bottom_up to reflect_y
Date: Sun, 14 Jun 2020 23:01:19 +0300
Message-Id: <20200614200121.14147-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614200121.14147-1-digetx@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
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

This makes the naming consistent with the DRM core.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 10 +++++-----
 drivers/gpu/drm/tegra/dc.h    |  2 +-
 drivers/gpu/drm/tegra/plane.c |  2 +-
 drivers/gpu/drm/tegra/plane.h |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..ed282f88e409 100644
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
