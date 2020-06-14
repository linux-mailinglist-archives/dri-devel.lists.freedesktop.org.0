Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE91F8FA9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35716E0D1;
	Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB80F89FAD
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:04:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n23so16547603ljh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ye8LBDqYIu3EMl0SpXZiBgFDVin4wanrCIFCoDUlTCY=;
 b=lWA21eD5Zk5I44oSNWVi8lPf1+OiG9NoVYobu2YDCitzaIbXYxMWu6KCSGjP2CfwXR
 Yyi98taZ/99CCIdTM04RG3JncNPOBcJThLWBsTq0ka+1tOFxHhAMERjhmS/ym4mCVRnD
 mr/VlnBHemWMS/Y5rNS5LTd0gfrajlTAxoGA51gVt0h1pWbG3Ay6q8hbYhyMghmPrtBD
 vAys9NzIkmhguLsQDydvcjIh5hakbQyNG5HWvpNNgUrvRPX6KRJ8IF3C8kl4TwtPAE27
 FiQDOr7ZaOIcJ+Bz4n0pdU0SXYAiEHhlmXYEcur1VkD5AhG87InFCfqmOOX2X89wFf2/
 kYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye8LBDqYIu3EMl0SpXZiBgFDVin4wanrCIFCoDUlTCY=;
 b=IOc6U0z4ZxumvC3fIAtITxYqb516VUVSPcteL+PxMMi+HeUi7JnkPD2oAE9GncJx+c
 dSIpM4WxmvQBaj7vf9yD0CltXw/IQGHCa435cWIrrk/ux4IQLuImwAAQCSESYCfx9iNp
 y/PfzI9httDtCqNbcGq6ayOOUHNAB3MZdCIxSUlIARNgZZuAAsNCXqYICaKy/+4r2FyO
 e3cm6rStk1698FVjVQbtHhexLrEnOFZ8RK8XChtQcpTsXoe8yDW8h4D4SAei7E3H8O0Q
 5cddeCgZLp/Gt3aFDhOrn8Tz+aPwLIyr57bThR47jyYM8Oy8ULcPyUBPfgZFfgXG9nLy
 UXVQ==
X-Gm-Message-State: AOAM530PqOBv82CowuHB52VthKEZYm1+or9Vr8ZtnDyJgz34yyc9jQUJ
 C8MS8PYuSRcMD22RWGg577w=
X-Google-Smtp-Source: ABdhPJydq3O7wM9zT04En/+a1wqWXkBZL51pkj7tiQD3UNNMIhI879CJqKO/A2fgNVQHGp4WYUhJNw==
X-Received: by 2002:a2e:8705:: with SMTP id m5mr10782304lji.269.1592161447898; 
 Sun, 14 Jun 2020 12:04:07 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 12:04:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v1 4/6] drm/tegra: plane: Rename bottom_up to reflect_y
Date: Sun, 14 Jun 2020 22:03:46 +0300
Message-Id: <20200614190348.12193-5-digetx@gmail.com>
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
