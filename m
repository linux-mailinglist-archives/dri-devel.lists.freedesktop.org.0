Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB71F8FC3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F0B6E26F;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F88289F06
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 20:01:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s1so16694563ljo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
 b=jQ4is4o3msNRctJPE8x/rXfdtxgqL+UaT5OUefWyjpSdGCCCRnJTJD8hwrAK+7dPak
 ccLE732RqdOIO/h1BblHTlMoyhV6snAr+fWgyjo2ypIIksW1HO090SR7hNyA74nKJ6/5
 am79uNqc5PvmxUBgiI7DxAt+1ki57FYP2g/LNw1/WiArCa6EES4f+ZwZaXqFbvM8WLiG
 73o+tLz0aSqAxnAUFfKgQQYFmlipvKHJWrOFKIsFuhb+NW/FS6TCteBvhKhFvRplnG7N
 QgdOsenUoIWC55wmJq6fPfYqWFpBf9CNRsDhakCSfMBa625Z6xw25OV8BPkh3+zeM+/v
 kJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tlVNSxgPSIVY7njRp82EoP3y9oei5GEhi6LB4YQ4wY=;
 b=ZhM7tIBXjJvhkxnBn94Ri0iOaWvsedwV6kYmKQ3i8TvCqoXvIqgI24Rf4Kdq1oK5Mp
 2XT5JsVKg2M8t3ezzzLPbt4oGi0lLJZqziVIP+GgiAwFaHYNrJE2DaET/608kcbJrEpA
 0aWfHjL3Py4+og3usa+dgQTvY/78apLxBoMs44ueMAW7cVpYiWtNsRxkH1EtozrChU2H
 sxWL1dmD7IFH8qx0mU3JsYQ1Q++u4BUApIIhMCkTMh8CRPGYVzAMDsysWtnB3C0rp7iN
 XbafwFJauLJiSFEKHoUsmA+do8WST+ogIly6fk3QrZ93aL+wepL5ccM86iDDZflktvWA
 7MPw==
X-Gm-Message-State: AOAM531ZdscWATw/QaG83MwgfNPE8ca0FbGDCfj0AKyUfBThxX+lf++a
 ZfefF28Mebchyrzd2nVEOtY=
X-Google-Smtp-Source: ABdhPJwkjAohrFdbnjXNIyKjz2EOPAHBkTIDfMEzdvwoiExIpOvjnhuRzO8/1I+pHiLBdhjK8q9qyw==
X-Received: by 2002:a05:651c:1193:: with SMTP id
 w19mr11737184ljo.121.1592164906663; 
 Sun, 14 Jun 2020 13:01:46 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 13:01:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 5/5] =?UTF-8?q?drm/tegra:=20plane:=20Support=20180?=
 =?UTF-8?q?=C2=B0=20rotation?=
Date: Sun, 14 Jun 2020 23:01:21 +0300
Message-Id: <20200614200121.14147-6-digetx@gmail.com>
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
