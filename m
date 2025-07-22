Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB27B0E523
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 22:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88610E165;
	Tue, 22 Jul 2025 20:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iFiQ8+Yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26310E165
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:57:15 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4ab752e0b76so14872701cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753217835; x=1753822635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ni4reSpg/ovbb+dQzWuFGbKfq/xFDZYYdVHUx+/XF8=;
 b=iFiQ8+YlHcOUyEqUbP0iTEI41wOiiugDG5yzqI5cV1m8zGlVUstg2AzT/yAsvdhTrv
 2cgUcAfM4DTwzg9cPSRWrWlU71ux2VE6VwIymoJ3+uN4/xp0FBqQxZtsAoMIzXW/gltp
 Y/6ohGWPYLOAd7b8ibUA9RduYnzmZmkyRjLrxWqYvJLB3+TKJj3yps4BwkPar4qkLBKc
 Kno00SUOeXwGpvEdpaFT9JFCtd9Ex0K9MSEWxHXbS3wuylTsnhlew8cuFk2j7zxVadlq
 4QKh20xzl2ghB9dYYYL+Tonsx8iGkPo54asDvgzh8+Ns8bfP2CGlmSiS046se7Dr2Kss
 CnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753217835; x=1753822635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Ni4reSpg/ovbb+dQzWuFGbKfq/xFDZYYdVHUx+/XF8=;
 b=Tp9Y1ZgSa3P8yHeyeEMMJuFDj+QJs/qsanpP7Ts/BGwg3kNK1E+fpaNkAg/jJ3qyYZ
 gHXN/7y0O0gcXecltDC9lfvwT3ENZHSrzQpIuxjCqETTh2mdGttle8lKza5Toiq05OyX
 IShaGAB+I5EokFKpG4KV/wvlHJ9OTdiWWZs1MXDEgpwcWTH2sSi2AUyUWoM0N1NXYNHA
 43QHyI9kktRd0NDb8kRtD0sQEmu5YH/che0H5RlUoV2Wg7gpd2rgWep6CRojRMDq/V0V
 F7K8wIYrhiXdTif6uOz8dcvu5HmmCYpWzupZsTH5bHESOGpfI9yaNpSe8f+2mD4T1G0S
 BtVQ==
X-Gm-Message-State: AOJu0YyWGoJgW0QCSKsvbx3kfBWoAOK4HZcJbTbUCjISd9Dv7WKybJEK
 /JiyUKsBlleWCBtDPGhfoVLpgkla5XL+N52+/PWTJ2VorJKFKVf0IDc=
X-Gm-Gg: ASbGncumccTm3eTir5jRVFmOA6YhMvfM2ghbQWo9Dvy3zIhM5Xpoa5bc3db0b4Kk4Ez
 eXUaZj/uaQwqPcgYSa1LpAg98v75lMumCmp8XjC9JDZwCJMqqtV7gy3+SUt6aCzBJ/K8V6rlVVy
 XSwojLclvcBsK8yI2JzGmTm06q0WQ3yGOad8gt7VzQsFDjIUYb/ArV5j38e4PhLXWJXUIMn3Nij
 JV4VrKxswbWhI+y2IxDW7vGdtlA4knW1/wTE93jK/xA0zslUc+cReylmeEd3Oqu92zc70VTaoX7
 7fVjWx4vHQ0sfTJQ10XrEUV7DkhoqbJJWQtjHYYPEMGT8zIASJgOMQRX/0NDsQ1Ug3ACrvkRSnu
 h8tOpAfgsldCWMeT4iaA=
X-Google-Smtp-Source: AGHT+IFI703RqUMPXBkK6u4DMpbC2ERSWtTtuSuXl4kfMXLj5oteqvHgAkjlrCVXUcf5ncI2KnMTyg==
X-Received: by 2002:a05:620a:3720:b0:7e3:30a8:4c90 with SMTP id
 af79cd13be357-7e62a134a91mr49551185a.3.1753217834709; 
 Tue, 22 Jul 2025 13:57:14 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c9230asm570181385a.93.2025.07.22.13.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 13:57:14 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/bridge: lt9211: Add null pointer check for LT9211
Date: Tue, 22 Jul 2025 15:57:12 -0500
Message-Id: <20250722205712.3527922-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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

drm_atomic_get_new_connector_for_encoder and
drm_atomic_get_new_connector_state could return Null.
Thus, add the null pointer check for them with a similar format with
lt9611_bridge_atomic_enable in LT9611.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 9b2dac9bd63c..6be30c8bdf15 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -463,6 +463,7 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
 	struct drm_crtc *crtc;
 	bool lvds_format_24bpp;
 	bool lvds_format_jeida;
@@ -516,8 +517,18 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
 	 */
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
-	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc = conn_state->crtc;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
 	mode = &crtc_state->adjusted_mode;
 
 	ret = lt9211_read_chipid(ctx);
-- 
2.34.1

