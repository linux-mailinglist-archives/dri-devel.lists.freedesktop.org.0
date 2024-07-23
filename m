Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C709399AD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 08:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E6F10E43E;
	Tue, 23 Jul 2024 06:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="yvtgQt8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EB510E427
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:26:35 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fc49c1f3e5so38312745ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721715995; x=1722320795; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a4U/lX5wwRXFBYNa5qyfaellagLlJY0UfTFYRgdibjk=;
 b=yvtgQt8vCZYfW30TT60+S5LNQb2of4ZVCjnaZrwnykDA88y7qmyn84wwxYt+74yLEh
 dKXL5yW9IGGTRcxO+3vrb0WF99AwCIsmQJjU5XfP2JD2TEdFGYwv+ogvjDhwtdSG9Izz
 XfLr1PMeBRZBCWqlWMiivZ49mcDqLqZvUMmYF+d7sMS6Tnt1ivp8fxEFqveoBw7LVSIL
 7a0kjhSiAQ1E5crqbpfAWvuMXDNVZERLaYvl6siboDRONTKar8wYTbbCNmSnpWzsaGBi
 D5cxrqNx8tgYnFYOQC3qaXKGGa4ZViOIWc4Si9iKulsfXiU0Psh8MuMuaGYRuo6+owNZ
 VuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721715995; x=1722320795;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a4U/lX5wwRXFBYNa5qyfaellagLlJY0UfTFYRgdibjk=;
 b=gNjUNPH6bf0vyAHb36oVhJ9cmRvt/f4hhxyq4Kt73qrNgLU1bTH9WmduFuCMN/SYwE
 B98XCfKv6Ek78xbr08ToU1XS+YEHlPXWSE6hlDNPEqvKf0xb6gGbmiZIA7pdVN2SLNgV
 G1o9qnncMtN5/K7DXZI909FIdL23YxPjyQBkkRQyVMNGMN1avrpnbCVzUrAX9l+H54xk
 NYchKtjzARifsgv5JJXZUl/VT+0UVJr1396tClzFZli4cPHc9EQEzKg79GDFDTFXQHTZ
 p7JnpRj2LEBM4nRyVx3kzcEu2eK34Pu/304Tt7NpjTolcdhGILBBYHoTuE5A1cM4VY4b
 HIpA==
X-Gm-Message-State: AOJu0Yxyg+7PGepsjmQjJO/uepDonHyV6GApsRqIhL3lMJBgmaE7nEEH
 0cpadcK7drwjkSMP+qHyCe6OPd+9PWo9MfMweo9jzMFt3i4esF7QHylL7cJgBns=
X-Google-Smtp-Source: AGHT+IHVekg2SGD27MeBu8a61N2QblO1dxpPiH7hnQpFqY1dwa+oz13T7HNCePcM1CZMQrcn7ELDFg==
X-Received: by 2002:a17:903:2306:b0:1fd:69d6:856d with SMTP id
 d9443c01a7336-1fd74598718mr72102175ad.17.1721715995165; 
 Mon, 22 Jul 2024 23:26:35 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25ab47sm66351465ad.45.2024.07.22.23.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 23:26:34 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
Date: Tue, 23 Jul 2024 14:26:15 +0800
Message-Id: <20240723062615.14796-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Use public functions( drm_connector_helper_get_modes_fixed()) to
get porch parameters.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V4 and V3:
-  1.Modify the return value, return drm_connector_helper_get_modes_fixed(connector, desc_mode).
v3: https://lore.kernel.org/all/20240722092428.24499-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. Keep bpc settings and drm_connector_set_panel_orientation() function..
v2: https://lore.kernel.org/all/20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index d4e4abd103bb..0b87f1e6ecae 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 struct boe_th101mb31ig002;
 
@@ -313,31 +314,15 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 						      struct boe_th101mb31ig002,
 						      panel);
 	const struct drm_display_mode *desc_mode = ctx->desc->modes;
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
-	if (!mode) {
-		dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
-			desc_mode->hdisplay, desc_mode->vdisplay,
-			drm_mode_vrefresh(desc_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
 
 	connector->display_info.bpc = 8;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
 	/*
 	 * TODO: Remove once all drm drivers call
 	 * drm_connector_set_orientation_from_panel()
 	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, desc_mode);
 }
 
 static enum drm_panel_orientation
-- 
2.17.1

