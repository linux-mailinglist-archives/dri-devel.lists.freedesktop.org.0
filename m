Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248CBA024E2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0A210E654;
	Mon,  6 Jan 2025 12:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PIetPnze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57310E654
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:12:02 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso94912465e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 04:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736165461; x=1736770261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hWuPN5QBQBPprwovQgoKqCFGisJ0M7al/KGkXe1y2Gs=;
 b=PIetPnzeXDnnS2Fb4NWLWoEmVciO2DMknJLurOtS3zumbw2q5plyAlWqE81nOAp/Rz
 jeXiSageLBYru+HWzPyo1T3QMCemyAC7mVFT2oHMr02JhJcMZO/8hWcfgVH0GLUPwB4j
 N3OMtJO4B0ZGxe/Q1R+I6KOnCHsImOiIkja9t/6CPgBrhzyLeYmx2hGmIyzz4B9dsmYF
 lwMnuJ2kDjbwrEWkqkDA/HMSnjILoLJ+0ctBvLqiaCcC0wQaQp3clL5F5W7ZssDEcZEq
 YyP0TLHxQACeaWFMnSZifImpTeeZLDmk84xS8IKcpBfz/A28b26Y0G7hnmXyj7WPX1mP
 2C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736165461; x=1736770261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hWuPN5QBQBPprwovQgoKqCFGisJ0M7al/KGkXe1y2Gs=;
 b=N9MGbIMPiPBJbayKr8YPKkPGV7zLl30eRlu9EeB88pSfCWg62G5QeWyzJZaNA51srJ
 oJCcUPkBtW3FDPR7yk0GlqjgBQ3ysc0p6VVI6l6OU3GmE7RKg8RlFy3QG1Q622QNhrLj
 n8vP3QwsyQmJt1qqvYQxZfWeUTplM2wx3bbuiRYKciEHLFtqbUBXNL+O3GRnJKyUpDNw
 zMa7UFJ3n95a4TNoWYSZXqYvPD3DgasIsFQseXz5Lqee3Ff4meB8XXKfcOOn/7W3Tp76
 45AJpA5psX+zyWWALkvg1f4yvvy1GomhNUBZcZal3c/txZB1WSlRMLtvNktHCpvqjTa+
 sj6w==
X-Gm-Message-State: AOJu0Ywl5231WX3b4VsH5w7ly7RjQps9esWBG+Hl6+6xFbeFVwrtJSE2
 f5TeOe0njQ4LO3ZfXytgg1j5HF0JHLyVuDXFqrlPvXSULmoOClNglT253Ok3
X-Gm-Gg: ASbGnctnbxEyaWd4cJekiNwM31vzIR9hcHaohNBjcUWwR2lJ2dfzfF0XAFsD7QFUpb6
 O3W2zIpoSjTAyE7kmM6iRExTsdsEbtE7Q3vQo/1Cy54TYGI6D0TdK4S2J9XPwrZJDLeMl9LpxO/
 IWA+PZM2LFZfAQmTxhucJSs3636j8koLPVdmZdcL5JDxGetLpFgmyXUkszq0Tob14ERvvHlLkLb
 cnZUxifHZ+V/0w2n0+V8cLCBYaGlnEUeE5OQeqFB20qFOCxoYQyCh6h2AwpHYzQ/8lNpgPd
X-Google-Smtp-Source: AGHT+IFMYQ2j/dU8L/9U/fJcN/ydai9BkZNbwlfdO38gSwPvuq1tXGC1IjoRanNc2qzvxNX1bPthfA==
X-Received: by 2002:a05:600c:46c7:b0:434:a1d3:a331 with SMTP id
 5b1f17b1804b1-43668b5f36amr468688875e9.22.1736165460828; 
 Mon, 06 Jan 2025 04:11:00 -0800 (PST)
Received: from KJKCLT3928.esterline.net ([144.178.111.91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b441bbsm597496585e9.40.2025.01.06.04.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 04:11:00 -0800 (PST)
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
Subject: [PATCH v2] drm/bridge: adv7511: Switch to atomic operations
Date: Mon,  6 Jan 2025 13:10:54 +0100
Message-Id: <20250106121054.96739-1-jesseevg@gmail.com>
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

Use the atomic version of enable/disable.

To support bridges where bus format negotiation is needed such as TIDSS we
need to implement atomic_get_input_bus_fmts, prepare the driver for this by
switching the existing operations to it's atomic variants.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
Changes in v2:
- Reword commit message to make clear this commit is to prepare for adding
  input bus formats to make the driver work with systems like TIDSS which
  expect this capability as suggested by Dmitry
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

