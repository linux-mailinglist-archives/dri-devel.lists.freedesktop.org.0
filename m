Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E6938C01
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3613710E48B;
	Mon, 22 Jul 2024 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="HrobuRCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930FD10E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:24:52 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-7035d5eec5aso2109404a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721640292; x=1722245092; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LwMtkumDOAcsN4lhSlus+4X6amT7wl8ZjMu53GJ7yCY=;
 b=HrobuRCx+bF3Mgasos89Xt/9bd1M3eWF9gFyqXvMLKQctHAzgKG5oBtNRkUQYpBlUv
 lJuC9Pma0lcm0RYPAzL+FzTppn9PtUCRwAMnWR6qbRiHl7p6lK3uR44da9u5vMlcF39E
 ZpN5JaxbL8dDqMHWKMSuekSu8Q/z/j8X+RLFAvGJGlgV+jwgVeRpktEJpgqgZh2s8ndn
 idfd4XTFij7jggXaWZU8Glq5iP4iYFVyuFq1Xe4doWpUbsPFox/Csnz3fOZsqjqQz6lp
 irqa/biFM7Cyl6MxQEt6kkxhrgrYaIVu4BsEEOSzkGEjwVoivf6my835B2pbs8m+xc2T
 XV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721640292; x=1722245092;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LwMtkumDOAcsN4lhSlus+4X6amT7wl8ZjMu53GJ7yCY=;
 b=J0yJ/ffZupV5EKoBDxOZWNmQLtcCVKwxbB/0JsARhleIGq128kKQiDhCIro4dv8qsg
 beCBI8Y6uT0rSqmzTpjJAMgt+zuIb7/loUNDVVJ+ATHvQDrP7DywQTQ/BzQmDgOKX8CP
 XHzk2USjNrPjZy9pm0ra2+dKeHn6TRojYbFOujvbEWc7QG/k2l/1LeAcqNmQ1AQ1uf/7
 jkyyoASs0VDPqrXBeQ746szGK0Nig/geUYBL8odJmh3Rot9D8HNHUGWR5HwxeZdVxsKE
 cFwhcisYqXykcK7RhizfumRDZrNA5XG8HwQ/KLBOU0SorEmXhs2f4mz5/r2tQPOkPw5d
 q9mw==
X-Gm-Message-State: AOJu0YwHXu+creIwlKzf2m8U9Q7fAC7T7IgBPS65MMBDLot3Ny+VJKfD
 /i8C2amcAx+kN1FBuH1J9T4VX7QhHizLeC4EseKhfC3mtFZid4QxOypWrN6KTag=
X-Google-Smtp-Source: AGHT+IHkMmiH7CaJ/wWByiowS0sGdlHfkVI1a7RgoAb/wvbSEO4CaVFFvhQTZbT+KFwx627lM1ZaCA==
X-Received: by 2002:a05:6830:6881:b0:703:6988:dbed with SMTP id
 46e09a7af769-708fdbf0792mr10341664a34.34.1721640291747; 
 Mon, 22 Jul 2024 02:24:51 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d26efe61dsm1639901b3a.149.2024.07.22.02.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 02:24:51 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
Date: Mon, 22 Jul 2024 17:24:28 +0800
Message-Id: <20240722092428.24499-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Changes between V3 and V2:
-  1. Keep bpc settings and drm_connector_set_panel_orientation() function..
v2: https://lore.kernel.org/all/20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c    | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index d4e4abd103bb..8e5edda32731 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 struct boe_th101mb31ig002;
 
@@ -313,29 +314,15 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
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
+	drm_connector_helper_get_modes_fixed(connector, desc_mode);
 
 	return 1;
 }
-- 
2.17.1

