Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55FB1A154
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 14:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1739110E44C;
	Mon,  4 Aug 2025 12:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UO8zKm5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5610E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 12:24:27 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2405c0c431cso43260385ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754310267; x=1754915067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cDKvifJZltIzJedU/1ZLJadeuH9/nZztGosgIc2AVTU=;
 b=UO8zKm5HfKVT3wl1PNF7EYe74nHwQK1gEOfbMahVDoslGnJ9lkpmeOzjJoaA+5YoWa
 YbFR8HRzHQ7RLgEQKdEzFHiz50hJ+663tv3hDwjndNuWkB13Wrd6YzRvcHDfu5SZgpoA
 y/NIdH5emO6OIqFREFuK+IMau5NhG2Y0scEGr+T9nVtrrQ/zNzm0IL5ua6sjTOksZSRC
 +7TmpEGl1cEgOgD8Gdg0qwv7MDJc+cblGDaPrjVyH4IJvTjPi+9iLXnVyM6aVVfWzmqj
 +KXOcXDhWaCLSi85b4Msfx85CmOOrfyaEUCDU1TVvSs2bYWTVXhDMfpYsiGvw+7csxDI
 Rlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754310267; x=1754915067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDKvifJZltIzJedU/1ZLJadeuH9/nZztGosgIc2AVTU=;
 b=AJ3frDd8uhT6B6hM00NraSbfbpXQEpDipUvjn0Kr7/bRgo44HneAN90xmBaPgKAsya
 teLE0VIDWMG+LoxXVFwtKM1M40z0IL/5o9zcRyzcC+G1AoArIY6i1nLBjAyj3UoxbiHi
 pexrUMkjYg4C1l/kUj86OiKW0Ris40ZaFr4SOyLwaVRv/nR1xO+ur7C2D5/hHFThnn4B
 pfVw2qGjFHNykxdgtrB9+sQIIOXdJkROM2jbYxU+ePZQxaLOx/fC6mWLYRUSxe2vYptq
 jCqjs9O30sGAUKSK0+uJb/GWbmoVn7iSgEhG5rPUtOPP758IQYKZLvQgLS8vV7yh/mhj
 GnvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbM5L/qHTkv16oj7PDqCTn3G3LBO3r9FRz0fI3v75/UyJk1aPG9xzl16z6Ob9dzQgHJc8Uz1dWgrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlk8m8TWGE0YWcKRUP9qn2Kt3wTI/J1hZFUsi16TX3Px07ux1v
 swrXNNcscC1ZfiysXMXLVbLdipiAUwQwpiFefdyrmOk8zzViwlchxKS7
X-Gm-Gg: ASbGnct8CcsaHfw1M08qn5OPyCQqfKL86yJKcw+o005YV/AaK58jvTLH7awQWjubxQc
 ZV8EhBrlO9jCNC/QtGGlVxNLKodrBJ0N6nbfVLD7sQG1Mw5v6rTPlWAPbfSRzE9Hu9FtI5h49Pt
 R7PB3dQSwuoVLdczMeSlR0AjTKbXTyWuoynzZsKhor0jn/pMM3r51ch9K9qhb3ZoUyTHq1rbg7m
 BlKAtT8H7ztfmYxCaw3FILkIq5xw8PUxoBlnheMwZJAV3ci3VsJAuhfScQr5pv0Y02iVcZLzvM6
 h1IKut9DR4MwLB8VZXdq4qwLTCtbRJTFadkZgHblY29HBrEvI0NX0+vXOlBisP01TciPchAACvf
 nRGUzHzeo71/+nzlrV+xsH/kFqCzWeMtSSEYcUGHX8YdcIlqcr1syO8QARihSgRvLsBiFjbxu1h
 QsMndeEumzP8h+
X-Google-Smtp-Source: AGHT+IFnCTK1oXgj2ujfGigzx4XT2C9KSw1IWXLB+pVsd6lKj052U+XAWh0fv5sgdiH2H59+2vCX1w==
X-Received: by 2002:a17:902:f684:b0:220:ea90:191e with SMTP id
 d9443c01a7336-24246f2cc2dmr151331365ad.4.1754310266936; 
 Mon, 04 Aug 2025 05:24:26 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.161])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-241e899b6a9sm108650335ad.134.2025.08.04.05.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 05:24:26 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] drm/bridge: samsung-dsim: Fix potential double-free in TE
 GPIO handling
Date: Mon,  4 Aug 2025 20:24:18 +0800
Message-Id: <20250804122418.104360-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
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

The devm_gpiod_get_optional() function uses device-managed resources that
are automatically cleaned up. The
gpiod_put() calls in both the error path of samsung_dsim_register_te_irq()
and in samsung_dsim_unregister_te_irq() are redundant and may lead to
double-free when the device is removed.

Fixes: e7447128ca4a ("drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bccc88d25948..6ffaee6b7738 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1691,7 +1691,6 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
-		gpiod_put(dsi->te_gpio);
 		return ret;
 	}
 
@@ -1790,10 +1789,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
 {
-	if (dsi->te_gpio) {
+	if (dsi->te_gpio)
 		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
-		gpiod_put(dsi->te_gpio);
-	}
 }
 
 static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
-- 
2.35.1

