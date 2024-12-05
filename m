Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD49E4F2A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5166B10EDEB;
	Thu,  5 Dec 2024 08:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a7KpLZL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7510EDEB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 08:02:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so3844075e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 00:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733385766; x=1733990566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2poFn90IvIGBtzG2EWAUZGpuEmS5DRhKZhsmpRGoplA=;
 b=a7KpLZL0tFsJ4Vv8nYlKe3sqRKzdC6EiAr0xcR6Ha7Z64HEMTv/TPXSZb9vW2mx6el
 3rWXUudzHBtrm9gVo5ra8K3ZqhTV1Wd7FZeTGZguJ2WKqtM8nUQ/uVJMsRh+iQUDQBrX
 Y6kxAqY+K1YZwjKqEAAJJb7+wsSOaO+m4kzIZ6HDs/A0lndi93HwwzX+UgIGDdfVuXok
 7oI+X62GNUvdL62i9CF239/rGlRd+yvVdGMPS6ms0vOv9yHY+Lou0w8I6RJbMZNsqroy
 wonabF7eyRTWMIYxU9P3HVhs6YyQifTEUtykuPzDxVJNwm7ogNQOiy7GbdKroB3CVxjq
 8wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733385766; x=1733990566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2poFn90IvIGBtzG2EWAUZGpuEmS5DRhKZhsmpRGoplA=;
 b=Q8tLd/rTAGMpprJUyzTN/ffzMGLWteha3t9IcAGhBbeqhhEfDKLf0VIY8Kg6bIR1K7
 CqcgCTcOuamgCxy/6FlxFcp/Z2Xru1ShofFeq3tgPWnRiACIkyXk19lIvEhtRnSkHmMC
 8OzKmGOLQuVz9rDaiPlKL/UWu2SnovKkGX9nJFc4ymBPzmML0jHfSB4/QoQu6wNMMG7o
 Umrkj+k/8lLWmst/tilNUMpjjBb1sBVmPPz9ZXLgcBS4xax4cxvbBVqVA82jUXxmOW78
 0LPT6zbpCBb8ufkX2wMT0i4qfEwyRda8XK21CDoHFApOTKfRVoloVrAkh0V+f3lrwJWg
 Qn0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZqzbpzz4jPRXNNgdMAzIQ9Mx01LURpMk5krNa/X/wSj3zMhooRl0bn0q95hde8xYPcB6ak5/xIRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWSilQ7ZHIV4ngeaMRe6u776l49h/UVOpl1v68Dv/NczaaDPOr
 rHg434EqLArTCotlsit4h/sm81gLNWCXeLIE8GHNhVckwJMRq0SF
X-Gm-Gg: ASbGncs3q2g/rgUiz5LBmDyMWndRy8LjKVlRz92oM/6ifdKu6ZmGTmFSSAyYZ6SYbpD
 5Shmb3ymU4Xb5IZGLWAQ380Sa8GoWoSSIg3IqwslDKQIjhieGbzLLisXmpg2pMB6uFey9b/gMqD
 WIvrYViG/syFXaVciXp6Gz9q7JDjWautS+IglaqDwJkk2iN0f7Pgn1x50fgBPMAkFuB2R1C484Q
 +GzIP7ljEgNfFPUhSPW69FtXcU8DazCwXVqT3RTTz6NDc0eaV2EMoMrnswUp09nmnh71f+UXchl
 vXKX0xgf4UpzRCtN0tKrkuA8/IPBPYIhoJuBJg1d4x+V0Q==
X-Google-Smtp-Source: AGHT+IEpIcsbkEUIxoJSGurHGX79hiCXl10cyrZAo8yPKXdRyxTQFUbRSJ2mng7AM2ZpzwvZtyJ6KQ==
X-Received: by 2002:a05:600c:358e:b0:431:5187:28dd with SMTP id
 5b1f17b1804b1-434d3fe3393mr48299055e9.28.1733385766264; 
 Thu, 05 Dec 2024 00:02:46 -0800 (PST)
Received: from tom-desktop.station (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527395csm51843075e9.17.2024.12.05.00.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 00:02:45 -0800 (PST)
From: tomm.merciai@gmail.com
X-Google-Original-From: tommaso.merciai.xr@bp.renesas.com
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Date: Thu,  5 Dec 2024 09:02:10 +0100
Message-Id: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
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

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Introduce it6263_is_input_bus_fmt_valid() and refactor the
it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
format by selecting the LVDS input format based on the LVDS data mapping
and thereby support both JEIDA-24 and VESA-24 input formats.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Inline it6263_is_input_bus_fmt_valid() as suggested by LYing
 - Fixed it6263_is_input_bus_fmt_valid() param from u32 to int as suggested by LYing
 - Fixed commit msg as suggested by LYing
 - Fixed commit body as suggested by LYing
 - Collected DBaryshkov tag

 drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..3fc5c6795487 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -48,6 +48,7 @@
 #define  REG_COL_DEP			GENMASK(1, 0)
 #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
 #define  OUT_MAP			BIT(4)
+#define  VESA				BIT(4)
 #define  JEIDA				0
 #define  REG_DESSC_ENB			BIT(6)
 #define  DMODE				BIT(7)
@@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
 	fsleep(10000);
 }
 
+static inline bool it6263_is_input_bus_fmt_valid(int input_fmt)
+{
+	switch (input_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		return true;
+	}
+	return false;
+}
+
 static inline void it6263_lvds_set_interface(struct it6263 *it)
 {
+	u8 fmt;
+
 	/* color depth */
 	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+
+	if (it->lvds_data_mapping == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
+		fmt = VESA;
+	else
+		fmt = JEIDA;
+
 	/* output mapping */
-	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);
 
 	if (it->lvds_dual_link) {
 		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
@@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 
 	*num_input_fmts = 0;
 
-	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
+	if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
 		return NULL;
 
 	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 
-	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	input_fmts[0] = it->lvds_data_mapping;
 	*num_input_fmts = 1;
 
 	return input_fmts;
-- 
2.34.1

