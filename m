Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7331AFA4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 08:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8685B6E8AB;
	Sun, 14 Feb 2021 07:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5716E8AA
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 07:50:17 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id nm1so1949977pjb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 23:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0UbPkYZ7yp2DMCfIWSsoi7S/urrZ/MUJeKFXCDzdIJU=;
 b=Iez2pJXi1deimL4W2WdwsphQzySz8l8mdJIp81XX3+LM/KI3kbYp03rnpDmUpUtUdZ
 a2zY1le3CdtEdvP/gNh4is213NjpJamkaYfxlTuywjGqxAsBNn4gRl0kL99vGiRwdxQm
 bdQohn//7VsWL0e7lHv3RUOPrf2OCzsbxkbPjoUfYXmLsnmkeodIxMt9CiIhObB7GHnw
 0d1lcw71CrLvXgKu8e8ajIoLk1JQDj96/4pBd8/ZQp6qXc3G0bTH/gMKOctMjNvQ1dUy
 mIgem1KU3kXs46uyXxNnES95fIbx+AcLbFbd0JhmfmoViOXcdtoZwQXPa1QHtpxScqjO
 EuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0UbPkYZ7yp2DMCfIWSsoi7S/urrZ/MUJeKFXCDzdIJU=;
 b=peDBgrqevBpdH1ZvNCUchTv/npTckfy4UyZ328iS6KJYJ6UWtY4tSa3CIIG0aeOXCi
 QMoQE79myhwthrfSaj7DLXnh6g8IG0prxJgHe7AHM9yd4sa/w+e2llXrAb3303pD1Le5
 mbEH4EfcWov+/SHkNe9c2gkOrdw3wCHF4d4yQKdWhL8OwSpTme+HvOcXUwhpM+h0AOPN
 vI6L8wcBViy59Je2iXVybhyrbH95vHjXbGnsyW2/puQ+Sy/i6+jrJDGMdoaoppWcxN2G
 WbpPJt9VRUWEnYLRYrtg/sfdcxzjSVokkwZpQgC5WKbg6x9TIcPPlXAS0lot7EfKd8Xl
 P7Ow==
X-Gm-Message-State: AOAM530uUvZizTllT94EK/17j2r3lXisCNyliDvFDUbLOdmh6iciWTIb
 w81xm+yP4sL2kDilp76oGrOQn+5Kzex+v4na4Qo6Yg==
X-Google-Smtp-Source: ABdhPJxD8INcXEVPfA6J5bofpq9vzYhniHSgrL+gr1zGw0cYLVd+fnLpsZ3N6tiZZYO8QwgkJqirRg==
X-Received: by 2002:a17:90a:aa07:: with SMTP id k7mr957789pjq.3.1613289017491; 
 Sat, 13 Feb 2021 23:50:17 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id h3sm13928394pgm.67.2021.02.13.23.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 23:50:17 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, drinkcat@chromium.org,
 jitao.shi@mediatek.corp-partner.google.com
Subject: [PATCH 2/2] drm/panel: tv101wum: Add STARRY 2081101QFH032011-53G
Date: Sun, 14 Feb 2021 15:49:28 +0800
Message-Id: <20210214074928.31901-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210214074928.31901-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20210214074928.31901-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel as a
part of tv101wum-n16.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db9d0b86d542..904cf1559dbe 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -426,6 +426,108 @@ static const struct panel_init_cmd auo_b101uan08_3_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd starry_qfh032011_53g_init_cmd[] = {
+	_INIT_DCS_CMD(0xB0, 0x05),
+	_INIT_DCS_CMD(0xC0, 0x04),
+	_INIT_DCS_CMD(0xC2, 0x03),
+	_INIT_DCS_CMD(0xD9, 0x04),
+	_INIT_DCS_CMD(0xDB, 0x03),
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xC3, 0x4F),
+	_INIT_DCS_CMD(0xC4, 0x40),
+	_INIT_DCS_CMD(0xC5, 0x40),
+	_INIT_DCS_CMD(0xC6, 0x40),
+	_INIT_DCS_CMD(0xC7, 0x40),
+	_INIT_DCS_CMD(0xC8, 0x4D),
+	_INIT_DCS_CMD(0xC9, 0x52),
+	_INIT_DCS_CMD(0xCA, 0x51),
+	_INIT_DCS_CMD(0xCD, 0x5D),
+	_INIT_DCS_CMD(0xCE, 0x5B),
+	_INIT_DCS_CMD(0xCF, 0x4B),
+	_INIT_DCS_CMD(0xD0, 0x49),
+	_INIT_DCS_CMD(0xD1, 0x47),
+	_INIT_DCS_CMD(0xD2, 0x45),
+	_INIT_DCS_CMD(0xD3, 0x41),
+	_INIT_DCS_CMD(0xD7, 0x50),
+	_INIT_DCS_CMD(0xD8, 0x40),
+	_INIT_DCS_CMD(0xD9, 0x40),
+	_INIT_DCS_CMD(0xDA, 0x40),
+	_INIT_DCS_CMD(0xDB, 0x40),
+	_INIT_DCS_CMD(0xDC, 0x4E),
+	_INIT_DCS_CMD(0xDD, 0x52),
+	_INIT_DCS_CMD(0xDE, 0x51),
+	_INIT_DCS_CMD(0xE1, 0x5E),
+	_INIT_DCS_CMD(0xE2, 0x5C),
+	_INIT_DCS_CMD(0xE3, 0x4C),
+	_INIT_DCS_CMD(0xE4, 0x4A),
+	_INIT_DCS_CMD(0xE5, 0x48),
+	_INIT_DCS_CMD(0xE6, 0x46),
+	_INIT_DCS_CMD(0xE7, 0x42),
+	_INIT_DCS_CMD(0xB0, 0x03),
+	_INIT_DCS_CMD(0xBE, 0x03),
+	_INIT_DCS_CMD(0xCC, 0x44),
+	_INIT_DCS_CMD(0xC8, 0x07),
+	_INIT_DCS_CMD(0xC9, 0x05),
+	_INIT_DCS_CMD(0xCA, 0x42),
+	_INIT_DCS_CMD(0xCD, 0x3E),
+	_INIT_DCS_CMD(0xCF, 0x60),
+	_INIT_DCS_CMD(0xD2, 0x04),
+	_INIT_DCS_CMD(0xD3, 0x04),
+	_INIT_DCS_CMD(0xD4, 0x01),
+	_INIT_DCS_CMD(0xD5, 0x00),
+	_INIT_DCS_CMD(0xD6, 0x03),
+	_INIT_DCS_CMD(0xD7, 0x04),
+	_INIT_DCS_CMD(0xD9, 0x01),
+	_INIT_DCS_CMD(0xDB, 0x01),
+	_INIT_DCS_CMD(0xE4, 0xF0),
+	_INIT_DCS_CMD(0xE5, 0x0A),
+	_INIT_DCS_CMD(0xB0, 0x00),
+	_INIT_DCS_CMD(0xCC, 0x08),
+	_INIT_DCS_CMD(0xC2, 0x08),
+	_INIT_DCS_CMD(0xC4, 0x10),
+	_INIT_DCS_CMD(0xB0, 0x02),
+	_INIT_DCS_CMD(0xC0, 0x00),
+	_INIT_DCS_CMD(0xC1, 0x0A),
+	_INIT_DCS_CMD(0xC2, 0x20),
+	_INIT_DCS_CMD(0xC3, 0x24),
+	_INIT_DCS_CMD(0xC4, 0x23),
+	_INIT_DCS_CMD(0xC5, 0x29),
+	_INIT_DCS_CMD(0xC6, 0x23),
+	_INIT_DCS_CMD(0xC7, 0x1C),
+	_INIT_DCS_CMD(0xC8, 0x19),
+	_INIT_DCS_CMD(0xC9, 0x17),
+	_INIT_DCS_CMD(0xCA, 0x17),
+	_INIT_DCS_CMD(0xCB, 0x18),
+	_INIT_DCS_CMD(0xCC, 0x1A),
+	_INIT_DCS_CMD(0xCD, 0x1E),
+	_INIT_DCS_CMD(0xCE, 0x20),
+	_INIT_DCS_CMD(0xCF, 0x23),
+	_INIT_DCS_CMD(0xD0, 0x07),
+	_INIT_DCS_CMD(0xD1, 0x00),
+	_INIT_DCS_CMD(0xD2, 0x00),
+	_INIT_DCS_CMD(0xD3, 0x0A),
+	_INIT_DCS_CMD(0xD4, 0x13),
+	_INIT_DCS_CMD(0xD5, 0x1C),
+	_INIT_DCS_CMD(0xD6, 0x1A),
+	_INIT_DCS_CMD(0xD7, 0x13),
+	_INIT_DCS_CMD(0xD8, 0x17),
+	_INIT_DCS_CMD(0xD9, 0x1C),
+	_INIT_DCS_CMD(0xDA, 0x19),
+	_INIT_DCS_CMD(0xDB, 0x17),
+	_INIT_DCS_CMD(0xDC, 0x17),
+	_INIT_DCS_CMD(0xDD, 0x18),
+	_INIT_DCS_CMD(0xDE, 0x1A),
+	_INIT_DCS_CMD(0xDF, 0x1E),
+	_INIT_DCS_CMD(0xE0, 0x20),
+	_INIT_DCS_CMD(0xE1, 0x23),
+	_INIT_DCS_CMD(0xE2, 0x07),
+	_INIT_DCS_CMD(0X11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0X29),
+	_INIT_DELAY_CMD(80),
+	{},
+};
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -613,6 +715,33 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
 	.discharge_on_disable = false,
 };
 
+static const struct drm_display_mode starry_qfh032011_53g_default_mode = {
+	.clock = 165731,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 100,
+	.hsync_end = 1200 + 100 + 10,
+	.htotal = 1200 + 100 + 10 + 100,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 14,
+	.vsync_end = 1920 + 14 + 10,
+	.vtotal = 1920 + 14 + 10 + 15,
+};
+
+static const struct panel_desc starry_qfh032011_53g_desc = {
+	.modes = &starry_qfh032011_53g_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = starry_qfh032011_53g_init_cmd,
+	.discharge_on_disable = false,
+};
+
 static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
 	.clock = 157000,
 	.hdisplay = 1200,
@@ -870,6 +999,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "boe,tv105wum-nw0",
 	  .data = &boe_tv105wum_nw0_desc
 	},
+	{ .compatible = "starry,qfh032011_53g",
+	  .data = &starry_qfh032011_53g_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
