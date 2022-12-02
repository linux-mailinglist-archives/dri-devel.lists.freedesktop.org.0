Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0EF6408B7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9AE10E6F7;
	Fri,  2 Dec 2022 14:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081A10E143
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:47:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so3955990wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yyvi/DW9V46SY2WuhKDn+T+jmYp9vsYS86YFdGA8dxY=;
 b=nXhrTgCUDA+aVezeVSgnVK/ZPtEjy9sCu160JFCmllj1uCZUzx0AZ3O5NTYv9ojHkp
 kStXFVke+NzRjFXF/d3XEnlowEw+wRYCECaNNygL/nScn9cG6GD43guhEiQJclcBy1eh
 ymArcHg+CUPPGIbwyXVllNZ8vd+E6o9B8v5R9+FdnCKc6MOk1PeHMNlYauhgRogKOY78
 nvlVt4ztm32F91jpzEw1dwD9D3a+aFUxQeMrLwawfbZGnYoxScAWlyNnP788Y6xMB/Cz
 zInNeeEX7cf6zH0FcEFremVqcooUrBWzuxdPfYpTIxh4Gqm1uDMNsJBR+Me0mBB06cGX
 Fo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yyvi/DW9V46SY2WuhKDn+T+jmYp9vsYS86YFdGA8dxY=;
 b=hM0u3sUAXiJLViNU8/S352cNLYGuU43Dz28uw5+hL4oylgoA9mWEV9yYbkddMSqcwI
 /DuwXZO/+NRTsVbvBxYwjUYXH3KmTAQVSCcWHUb2cTF1QKumCYwUe9YeTLhE8NODbhP+
 sbAUYJa5TzfkyVSVgjqOEff9BHzfqUodphnfz8045kf3l/hlsq7w8FJYh6v5W55Ij/Py
 Kopmbn6aE7+sXiVnQKbS4IcAWFdtXtSthGMbBeAQhz0gOjvIsxcI8Q6bM1px/x61bJK9
 Z0h5MqjsxpPS9kn73S6LutgoLijlPkN1m0xmjHuwMj1Bh8siAOO3frj7pghATQDngW+2
 dlvA==
X-Gm-Message-State: ANoB5pkaGd9Ck/5CDejNFnj/332HSltvpm8GHyJifrcSV2gFhRRtE7WO
 u+9zIF74HRgSgGEOc4tT9zy/Ww==
X-Google-Smtp-Source: AA0mqf5Opd7DAmmgtUrgsv5u29HFgj1u3BWfqG6WaLClTPjuOIeK+WQ/cKjGrK6bH2imGAgHI6LeYg==
X-Received: by 2002:a05:600c:5023:b0:3cf:8ed7:7131 with SMTP id
 n35-20020a05600c502300b003cf8ed77131mr52360830wmr.84.1669992452795; 
 Fri, 02 Dec 2022 06:47:32 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm10700152wms.44.2022.12.02.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:47:32 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/bridge: Drop unused drm_bridge_chain functions
Date: Fri,  2 Dec 2022 14:28:13 +0000
Message-Id: <20221202142816.860381-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
References: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andrzej.hajda@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
users left and we have atomic variants that should be used.
Drop them so they do not gain new users.

Adjust a few comments to avoid references to the dropped functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_bridge.c | 110 -----------------------------------
 include/drm/drm_bridge.h     |  28 ---------
 2 files changed, 138 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1545c50fd1c8..bb7fc09267af 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -509,61 +509,6 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
-/**
- * drm_bridge_chain_disable - disables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called before
- * calling the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_disable);
-
-/**
- * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
- *				   encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
- * encoder chain, starting from the first bridge to the last. These are called
- * after completing the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->post_disable)
-			bridge->funcs->post_disable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_post_disable);
-
 /**
  * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
  *			       encoder chain
@@ -593,61 +538,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
-/**
- * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called
- * before calling the encoder's commit op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-
-/**
- * drm_bridge_chain_enable - enables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
- * chain, starting from the first bridge to the last. These are called
- * after completing the encoder's commit op.
- *
- * Note that the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->enable)
-			bridge->funcs->enable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_enable);
-
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6b65b0dfb4fb..796567a203ac 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -297,12 +297,6 @@ struct drm_bridge_funcs {
 	 * not enable the display link feeding the next bridge in the chain (if
 	 * there is one) when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
-	 * implementation of @pre_enable if you are expecting driver calls into
-	 * &drm_bridge_chain_pre_enable.
-	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
@@ -323,11 +317,6 @@ struct drm_bridge_funcs {
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
-	 * It would be prudent to also provide an implementation of @enable if
-	 * you are expecting driver calls into &drm_bridge_chain_enable.
-	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -345,12 +334,6 @@ struct drm_bridge_funcs {
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_disable. It would be prudent to also provide an
-	 * implementation of @disable if you are expecting driver calls into
-	 * &drm_bridge_chain_disable.
-	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -370,13 +353,6 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is no longer running when this callback is
 	 * called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_post_disable.
-	 * It would be prudent to also provide an implementation of
-	 * @post_disable if you are expecting driver calls into
-	 * &drm_bridge_chain_post_disable.
-	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
@@ -876,13 +852,9 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
-void drm_bridge_chain_disable(struct drm_bridge *bridge);
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
-void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
 int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
-- 
2.34.1

