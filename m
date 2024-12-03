Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08919E2906
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BD210E47E;
	Tue,  3 Dec 2024 17:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpsMnQQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DBD10E47E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:22:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-434a14d6bf4so52475235e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733246523; x=1733851323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LDrSaH5SCKXFsRBXZmgdwR2EOhLbo3un31COyXQgzFk=;
 b=dpsMnQQls+XF5eLI8XujoKiydq2nvbJaEvxWzygLunL7umjNeeVIVeitkjI9hSX1iB
 kvdwzkjWuZGzgzqjq6s3gA4rfSOdcqZrr48z4V0AeL+sfxaVKQ58a915dJ4fIO/cw3YW
 NRvLivz720IZ4Ug9uDnj9lusB9Opt/Yo33yOq6ySlYONCzZmTGno/DU33ZEllkxFG3Y3
 N6lgatHaoxokaX7OiyzxghAnRRmWmFhMgnTVTs37oRmZXmesGdZSnOKGsh6iXmVwrRlA
 KLILTTHWexRrxvo7KhboHLUnQIh/ce0nfdkylTIStvXko6wZBnB6aIULleHZaUACMEWv
 zxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246523; x=1733851323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDrSaH5SCKXFsRBXZmgdwR2EOhLbo3un31COyXQgzFk=;
 b=WGaVLxwRXiCL4P/HqA6hfz8WAasCDiWAlmJbararLTdHOVII9CXm42ncgjJvhHA3XV
 JmD3wQ5DSfXoXX2Of+q4Nhq+NBV9EW75EVZ3acBIpWBtyD1Ehxw8iG9OwCSSKCkqMc8T
 O+Z7Mpzt0gQUPUiIfiWwh+Kwm0azWLmRNKDTJYkwYXLl2SFegtfgaFwLVtVHtd5rvTm+
 LMs3kOGAGFOGQd66mmLM3F+v/wOCvUbfyRkLf2yRCeQUuDpZOtRu7fu4PtBvkLuSrg5j
 OKQ+gOwg64Ijga4AMCrTMI7kgnRG9ujL+gx/LCZuvJNydzLZ7rXscmVvzoR37sIkohnh
 iIQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUme6mSlsByNv/7hkX2q1AfG16OMy1la4D7JfBxOCxp2LmgWknNFLHA4/sLXzHY/Rs65CeEy/BFt5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/kYz2QZRNP1ssKbI7o1mHiIeGmvW5WkKIk5lXzQk98hQ7Z1tz
 mSMNdMI6wjfhmN10AmRvDNJVKyczl44hM8v3ORGGw5XRhbT0nJn5
X-Gm-Gg: ASbGncsGdTKk2LLw+R09dqTkMo/+JgazSd8KmzFuMLouz25zgt1qZT9AYsRL38QfKXV
 J0wTJdMDCZ3peUoMkeL9pHiBWP/BS2e5EUYrb/z0yyfP+Q59GHm/DHy0HPVXvONqDyn1UP5P34P
 HJEFRG7oID4EuimDyqJorso9cnts2jyKDKuhqtSj31O4YJLMtjgESL4IWxMcE6oiUPCLtnwLzt+
 yUo0QuhPnl4iUyhodkwQytyhOJDtdJpIUpglIBePzuY1kGD5xIdUlkUMv+gJvBG4bdXjRZAhPEn
 8MrZxI+4vZ8dyOY/tHF8UstVtS6E2Z7Nw4Ai4LE2SJYC5Q==
X-Google-Smtp-Source: AGHT+IHf2fdYtDx1rwtIPEdB0BycampUt/lo8/MCwVi4A8/NjisEkxdV8VZFFWTSSBwN37r6fxWJqA==
X-Received: by 2002:a5d:5f94:0:b0:385:fae7:fe50 with SMTP id
 ffacd0b85a97d-385fd423b82mr2951236f8f.42.1733246522761; 
 Tue, 03 Dec 2024 09:22:02 -0800 (PST)
Received: from tom-desktop.station (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ee2c7559sm7826658f8f.12.2024.12.03.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:22:02 -0800 (PST)
From: tomm.merciai@gmail.com
X-Google-Original-From: tommaso.merciai.xr@bp.renesas.com
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Date: Tue,  3 Dec 2024 18:21:29 +0100
Message-Id: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
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
it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
format by selecting the LVDS input format based on the LVDS data mapping
and thereby support both JEIDA and VESA input formats.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..83d1db29157a 100644
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
 
+static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
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

