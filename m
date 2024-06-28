Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CC91BEF5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E54B10EC35;
	Fri, 28 Jun 2024 12:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="t6g2mT0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F5510EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:45:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f480624d10so3606555ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719578757; x=1720183557; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NYdcAWuXYTWQAAXUNDXbS02yL9oAgEK+cNVTslAtCcU=;
 b=t6g2mT0hA0nuTiL3uZF9v2J1d8O58huz70fJ2lbQZS+qY3TQxDUf7s//qbPasWxSQj
 3ntpWNi3ymfDP6vfQ47kSQeB7ARYb4STCMgBnqN4kq0irlnADmDMxH74qtvMGczigJH8
 yL7Wusjzpp2OWB2NWg8iQhduMNSg2ENWPxF7wSp2j4wCLvsaG1iOwF9CKDK/YRofJTzN
 zkD6b7EWucDilIp7CyKlyuN9atejRhX3fZ6umTToA5bWltMcBUjW9AEdlVHqFq5b+9Gj
 PKAE7ZcOp9Q+67ia8Lp8TJFaKnD1ErYp7miQoic24WXSUUo6kyjrPVr5gYMgmOQtaqmr
 ybdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719578757; x=1720183557;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYdcAWuXYTWQAAXUNDXbS02yL9oAgEK+cNVTslAtCcU=;
 b=YQuWjgxTNyfbCIinmKF46kgd/urfm2UNgZ0u1f2Al9pDuSHLhBKZ7l4CZIU0djlBHB
 NR4JAVNW3V01DSRWbN0yrszTrm+sn/bV+Dwyj18Ii4JfA/d9Z2LEUb+LAsU3pLTUN0OH
 1uEeCI4pnsod5nM5AtvSIMkAN+KGlAJKtadF3wl8xZYQw/a7CzBJIcUUJGZ/pHA3H+vH
 rWxXRjDVHokh5q3i05ser5e06FK3WIPznMYYvFsL1QmxQzgt0j+LXuoBr1Z7QvWSmKLs
 UJVqRq8jzMWCbOcU4mMbV54U909YRKbZ+Ny//y+s/TTpJ4N6hWoIisDTXm9D2+Gm8NbT
 +e6w==
X-Gm-Message-State: AOJu0YwaUnBNy1j3/T7pyTxZmUopB9MFPo/XCEZZx4UUtpo2uxaWXImX
 Vj9ErLOyZQ5lOBg2z/mH4D+twOZyXNmWpwWdxBRm5Ln+yxLBg6vO6NAyqW0RIvI=
X-Google-Smtp-Source: AGHT+IG+25MIgZJbSQk/taFj6VG+AknyVI+V2GARb6Z9W0SrNi26/KVVGwlFQTZ6sulU8JHp9mZozQ==
X-Received: by 2002:a17:902:ea11:b0:1f9:b697:b246 with SMTP id
 d9443c01a7336-1fa1d3de553mr202286995ad.5.1719578757393; 
 Fri, 28 Jun 2024 05:45:57 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15695b4sm14346255ad.225.2024.06.28.05.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:45:56 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 5/5] drm/panel: jd9365da: Add the function of adjusting
 orientation
Date: Fri, 28 Jun 2024 20:44:44 +0800
Message-Id: <20240628124444.28152-6-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This driver does not have the function to adjust the orientation,
so this function is added.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes between V6 and V5:
- 1. No changes.

V5: https://lore.kernel.org/all/20240624141926.5250-6-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
- 1. Change dev_err() to dev_err_probe().

V4: https://lore.kernel.org/all/20240620080509.18504-5-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- No changes.
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index b5265d95be4e..f002a80527b1 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -42,7 +42,7 @@ struct jadard {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	const struct jadard_panel_desc *desc;
-
+	enum drm_panel_orientation orientation;
 	struct regulator *vdd;
 	struct regulator *vccio;
 	struct gpio_desc *reset;
@@ -178,12 +178,20 @@ static int jadard_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
+{
+	struct jadard *jadard = panel_to_jadard(panel);
+
+	return jadard->orientation;
+}
+
 static const struct drm_panel_funcs jadard_funcs = {
 	.disable = jadard_disable,
 	.unprepare = jadard_unprepare,
 	.prepare = jadard_prepare,
 	.enable = jadard_enable,
 	.get_modes = jadard_get_modes,
+	.get_orientation = jadard_panel_get_orientation,
 };
 
 static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
@@ -880,6 +888,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get orientation\n");
+
 	ret = drm_panel_of_backlight(&jadard->panel);
 	if (ret)
 		return ret;
-- 
2.17.1

