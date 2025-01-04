Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BFA01918
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 11:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7FA10E4F5;
	Sun,  5 Jan 2025 10:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oq24gXWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9E10E124
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 18:26:57 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso11097089e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2025 10:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736015154; x=1736619954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p2VHCmxWBoMvk+DMYugvVDUlGFwYim9QSj2dY3xDZ9U=;
 b=Oq24gXWIGJ6R5FzrjfPMUoLS0fQIV1bVjxZG76BViHgu6wEodOoHl/IkXWG1fU+vds
 MujiY76z3HKJaJcxDrq/m5o8ZKEri8al/eQ6hkqD99EYXxbgIHsxG792avsuHZqc7YlC
 gjvRIG22fRE4NKfYGdsviNPXELUfKmArzHdV6gtfXBDNLyh4H0O2awnGa6MvGNHx2PA5
 xjRDecwK6tbnEYln+Y7ql/2xFDy8mxrJMs4mxp4M6k4lzbZxn8LwH/iDqeD1OsDqBBgo
 xvZCEYX/lqcf1hflNLQxnlajXdEDlT7L3V4H65FcZiFkvtnpAq6cbrx8ykK4u2xl442p
 /KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736015154; x=1736619954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2VHCmxWBoMvk+DMYugvVDUlGFwYim9QSj2dY3xDZ9U=;
 b=czEP/Ps14mFTHpKeJOA2cFDdXnmmq9wQKYlSAs3oaVO9uVA13upaipZiNmTlGz/4Je
 X3Vzqy23V4/ws6GvVJMbsXgcJr18M2659s9rmjugP0sgL1m9vxK9ZbasN1HqlsQb83xU
 wlSET+oDFkMG1kC9emhaGSb3Si4EyAjbJeOFWkylVpqJCb/63Ak5TONpztFYKKoUAm/p
 KlHVvCxKgmfsxveSxY8rE08/AaaA77S6EwrTGaK18+FLnKwoLPV7o01oLvKA0GFPGQKg
 jsDwDIb51BDPitHXpP6fZgLpwJhS/Wzki5aiW7t4Jg2h5h25u5p0z/uL35X5bOe5n6Pi
 fzAA==
X-Gm-Message-State: AOJu0YwDkPH2WsiFpPURfzKKiV9+c7MAmUHxgt519AdOzu15i71fniWz
 K2Rx7nQ4MER6nLa32DBnRje6MZfU35KYJtt1roIVWR2hcdMCCniWiw++phSA0PY=
X-Gm-Gg: ASbGncuz7B8hEJmO1W31c+6YDRInvNQ0g1x5KpekEq+VpelJDoZ6EoIEvmM0BIJNV5o
 s5Q+a9hIriBK3oJMZm9rC7uvUMvPess3pm2TPCt9RnJpQVp6K7YusLNZUzE+TKXzFVAz5DkToJq
 QUy711fTc5WJctIPdH4fKMndArIfcUoIZp/Ngu/Zvl5X516B6ZLheHUUHnrl7xDco4Ky3gWTqzA
 qsRQFRhFkrRGKvxgx1g3XqcuHmtUz1bHxjWMIPL76dzQBlK6mZ2xfzqyNTtmamjaCajnDMqXaPF
 J39BRApdyd6tPAkFZJT7OfCuRHufWXv96NzELXm3
X-Google-Smtp-Source: AGHT+IFW7M13m+8AJpWtP+PAeWR4FrAguCXSdiBhgD80jL3pqB8kmIwdSk4A0D8H+uqM1jXhywwFTw==
X-Received: by 2002:a5d:6da4:0:b0:386:3864:5cf2 with SMTP id
 ffacd0b85a97d-38a221f0e37mr42050517f8f.19.1736014767685; 
 Sat, 04 Jan 2025 10:19:27 -0800 (PST)
Received: from KJKCLT3928.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm549477715e9.18.2025.01.04.10.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 10:19:27 -0800 (PST)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Adam Ford <aford173@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
 Jesse Van Gavere <jesseevg@gmail.com>, Liu Ying <victor.liu@nxp.com>
Subject: [PATCH] drm/bridge: adv7511: Switch to atomic operations
Date: Sat,  4 Jan 2025 19:19:08 +0100
Message-Id: <20250104181908.15141-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 05 Jan 2025 10:55:08 +0000
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

Use the atomic version of enable/disable.

Doing so enables it to work in a chain where atomic operations are expected
such as TIDSS

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index eb5919b38263..19c14916ded4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -910,14 +910,16 @@ static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 	return container_of(bridge, struct adv7511, bridge);
 }
 
-static void adv7511_bridge_enable(struct drm_bridge *bridge)
+static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
 	adv7511_power_on(adv);
 }
 
-static void adv7511_bridge_disable(struct drm_bridge *bridge)
+static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
@@ -996,14 +998,18 @@ static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
-	.enable = adv7511_bridge_enable,
-	.disable = adv7511_bridge_disable,
 	.mode_set = adv7511_bridge_mode_set,
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 	.hpd_notify = adv7511_bridge_hpd_notify,
+
+	.atomic_enable = adv7511_bridge_atomic_enable,
+	.atomic_disable = adv7511_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.34.1

