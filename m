Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFD642EE7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70D10E270;
	Mon,  5 Dec 2022 17:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9286210E26C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f18so19732009wrj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yyvi/DW9V46SY2WuhKDn+T+jmYp9vsYS86YFdGA8dxY=;
 b=lb1VP2XCA0D1x1NTihsMPEN0l7HGUX6TXJRp15KsgcsWmftiu+J5z8u6AwBNTmEc+W
 9rK2b8ianIE8hSUnjLMBC/bfOsTjWuKR/q7EnGhaIpfMtadrUmnxcQ/rWOxQlpH5R5jL
 YBwwtJjdAIvkFgVqaW+chjg4UvPAPhNUeyektjtN7S3Z6vg+wXPbZLpDUb7mWqMnFKCo
 Iz+ynHSXJr63E201ZGwlNM56og3O/uVyT7+WNqkjBPw81gax0md5lZIFI+x5C17Zg5oy
 mku6prNeY4eOGlNszcMSgf3dOSVqfIovLRIDiKfD2tvYr1rPo1qwSqjdJP2LJEd+1YTj
 FgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yyvi/DW9V46SY2WuhKDn+T+jmYp9vsYS86YFdGA8dxY=;
 b=qDurY7+S2mich97uamI0y5kjyMqSR2fq7mVAldHU8Ph+uFsBD837mylujFGauf6G+j
 Mv7ILUu5hqLIOMHlCSUFRaZZ6ZT1NHTvQIpAiHLhhNbomAgXAnnu465Y0C9bfC6XdjQx
 w8plO7fubauZQTyT0I/kYms4YtunhBMNa5yqdAKKXGP/0Gi4NH1rDJeW2getwLtYnQfq
 HVdRYJQUz4eMo4g/A2yqNuSBvoJ40yMQulo83nMep+MArDkFjoyCtYG8F/ug67G0SL72
 oVHGrLAHAKBW/YPBZU9jHVZVkctBVXEAN/o8cjkeEXlLo/ZwmmUDgc0yLfSPvB99AxUN
 iAYw==
X-Gm-Message-State: ANoB5pmSD/WF6joU30gQNbMst2TGAkvzkWYww/D7vx7pV3QH4AOAczUR
 Wz0esAnB0QX5UL+UzWVUAv304g==
X-Google-Smtp-Source: AA0mqf45nBTD8aVbTv67KbQiK3ZXuzbI8JKPBhaN7yZtDFtdqRB79kvYBs3SAqMG9oTteYxvEOzoLA==
X-Received: by 2002:a5d:66c5:0:b0:242:1809:7e14 with SMTP id
 k5-20020a5d66c5000000b0024218097e14mr21141505wrw.202.1670261628956; 
 Mon, 05 Dec 2022 09:33:48 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/6] drm/bridge: Drop unused drm_bridge_chain functions
Date: Mon,  5 Dec 2022 17:33:25 +0000
Message-Id: <20221205173328.1395350-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

