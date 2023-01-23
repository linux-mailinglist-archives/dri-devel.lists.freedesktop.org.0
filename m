Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699F6781DC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81710E50B;
	Mon, 23 Jan 2023 16:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBBB10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:40:48 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id 5so6657347plo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NP/72edpr9IijwwpklchJjiHBL0HZ021dkT6hRMuvDI=;
 b=QdNJYyen4uXlpZY1xLKCPdH4m8sUOYnQ+/nq0xBm2L5jP0Uu9shteX9pl8+L/4lP32
 e67pKJv+lWpzRmFcMG2JcHxcij8TTih6VXIZ7MCzKqDEYOu7m1oEWEehDkBMKBLLm1AE
 /+F+DwdAzD4E4UpE3GCGu/Xgqlvn21w2xLLg3f5QBYjPfh5sWuODYJqnhDvlPW01FL/w
 tlRfVSkRpz+TInWdWDqx1CwgG5iKEsgTIHRg/Ph0w0uEbzNvN13DrNldChbuzik9T9Pv
 pAh0guCMuU/OKNwHwXTEe5FDm0n5I+mWky7ZpVTA3jW9aneTK7KAvOHMUTt/csdiL0Al
 2zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NP/72edpr9IijwwpklchJjiHBL0HZ021dkT6hRMuvDI=;
 b=axjFsIm7slnTP2tgF6DQZ08Xb6zSf52XmX8pIGbhN6OYwqzD83U/JhJe2JlyYRJ8Xv
 gnQmivdAgyHw31jRbRHLvaxw9/iBHwAuefAeY0yipAN8AxBPJazHtVLqhn96CKWSs7K1
 uf9sD2enaiiilX2/Kw7p5SvkJhN2nM23e5R0MEiVbqtEjA62YCnX+e2il1+z5BBIKb6k
 T/EeskhtKSkwCUbw/RF10jJAg34v8LyQKAKDAyF//+hWpzvbm1osabKOJiB3stkwRGoL
 TkwdgaqkfQJcQYT3gwyvBE2GNrnyQInOJ+8o7jgfJhqHAwm9NlIr00Pwpkm5uIiF3bCX
 X/3A==
X-Gm-Message-State: AFqh2kqpn4UhIXMOuFfnT7iEdcaEsKbfa4etKMUw7cfFEDtbrxWN5aff
 QGbZzJml7q4yPY1aGv37JCFVLw==
X-Google-Smtp-Source: AMrXdXvmo8wXeMJ7uO04iCq325GVfV27RglyThWuhpTKYsZi6X+Sne96HeOgmZuv0Ew1TZtRbPAJIg==
X-Received: by 2002:a17:902:e78f:b0:194:d5ec:9be6 with SMTP id
 cp15-20020a170902e78f00b00194d5ec9be6mr14978274plb.23.1674492047588; 
 Mon, 23 Jan 2023 08:40:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0019269969d14sm17679971pll.282.2023.01.23.08.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 08:40:47 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] drm: panel: jd9365da-h3: Add Radxa Display 8HD
Date: Mon, 23 Jan 2023 22:10:18 +0530
Message-Id: <20230123164018.403037-4-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123164018.403037-1-jagan@edgeble.ai>
References: <20230123164018.403037-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radxa Display 8HD is a family of DSI panels from Radxa that
uses jd9365da-h3 IC.

Add support for it.

Co-developed-by: Stephen Chen <stephen@radxa.com>
Signed-off-by: Stephen Chen <stephen@radxa.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 200 ++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index ea89cecad0cf..7be8e6ab2da9 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -167,6 +167,202 @@ static const struct drm_panel_funcs jadard_funcs = {
 	.get_modes = jadard_get_modes,
 };
 
+static const struct jadard_init_cmd radxa_display_8hd_ad002_init_cmds[] = {
+	{ .data = { 0xE0, 0x00 } },
+	{ .data = { 0xE1, 0x93 } },
+	{ .data = { 0xE2, 0x65 } },
+	{ .data = { 0xE3, 0xF8 } },
+	{ .data = { 0x80, 0x03 } },
+	{ .data = { 0xE0, 0x01 } },
+	{ .data = { 0x00, 0x00 } },
+	{ .data = { 0x01, 0x7E } },
+	{ .data = { 0x03, 0x00 } },
+	{ .data = { 0x04, 0x65 } },
+	{ .data = { 0x0C, 0x74 } },
+	{ .data = { 0x17, 0x00 } },
+	{ .data = { 0x18, 0xB7 } },
+	{ .data = { 0x19, 0x00 } },
+	{ .data = { 0x1A, 0x00 } },
+	{ .data = { 0x1B, 0xB7 } },
+	{ .data = { 0x1C, 0x00 } },
+	{ .data = { 0x24, 0xFE } },
+	{ .data = { 0x37, 0x19 } },
+	{ .data = { 0x38, 0x05 } },
+	{ .data = { 0x39, 0x00 } },
+	{ .data = { 0x3A, 0x01 } },
+	{ .data = { 0x3B, 0x01 } },
+	{ .data = { 0x3C, 0x70 } },
+	{ .data = { 0x3D, 0xFF } },
+	{ .data = { 0x3E, 0xFF } },
+	{ .data = { 0x3F, 0xFF } },
+	{ .data = { 0x40, 0x06 } },
+	{ .data = { 0x41, 0xA0 } },
+	{ .data = { 0x43, 0x1E } },
+	{ .data = { 0x44, 0x0F } },
+	{ .data = { 0x45, 0x28 } },
+	{ .data = { 0x4B, 0x04 } },
+	{ .data = { 0x55, 0x02 } },
+	{ .data = { 0x56, 0x01 } },
+	{ .data = { 0x57, 0xA9 } },
+	{ .data = { 0x58, 0x0A } },
+	{ .data = { 0x59, 0x0A } },
+	{ .data = { 0x5A, 0x37 } },
+	{ .data = { 0x5B, 0x19 } },
+	{ .data = { 0x5D, 0x78 } },
+	{ .data = { 0x5E, 0x63 } },
+	{ .data = { 0x5F, 0x54 } },
+	{ .data = { 0x60, 0x49 } },
+	{ .data = { 0x61, 0x45 } },
+	{ .data = { 0x62, 0x38 } },
+	{ .data = { 0x63, 0x3D } },
+	{ .data = { 0x64, 0x28 } },
+	{ .data = { 0x65, 0x43 } },
+	{ .data = { 0x66, 0x41 } },
+	{ .data = { 0x67, 0x43 } },
+	{ .data = { 0x68, 0x62 } },
+	{ .data = { 0x69, 0x50 } },
+	{ .data = { 0x6A, 0x57 } },
+	{ .data = { 0x6B, 0x49 } },
+	{ .data = { 0x6C, 0x44 } },
+	{ .data = { 0x6D, 0x37 } },
+	{ .data = { 0x6E, 0x23 } },
+	{ .data = { 0x6F, 0x10 } },
+	{ .data = { 0x70, 0x78 } },
+	{ .data = { 0x71, 0x63 } },
+	{ .data = { 0x72, 0x54 } },
+	{ .data = { 0x73, 0x49 } },
+	{ .data = { 0x74, 0x45 } },
+	{ .data = { 0x75, 0x38 } },
+	{ .data = { 0x76, 0x3D } },
+	{ .data = { 0x77, 0x28 } },
+	{ .data = { 0x78, 0x43 } },
+	{ .data = { 0x79, 0x41 } },
+	{ .data = { 0x7A, 0x43 } },
+	{ .data = { 0x7B, 0x62 } },
+	{ .data = { 0x7C, 0x50 } },
+	{ .data = { 0x7D, 0x57 } },
+	{ .data = { 0x7E, 0x49 } },
+	{ .data = { 0x7F, 0x44 } },
+	{ .data = { 0x80, 0x37 } },
+	{ .data = { 0x81, 0x23 } },
+	{ .data = { 0x82, 0x10 } },
+	{ .data = { 0xE0, 0x02 } },
+	{ .data = { 0x00, 0x47 } },
+	{ .data = { 0x01, 0x47 } },
+	{ .data = { 0x02, 0x45 } },
+	{ .data = { 0x03, 0x45 } },
+	{ .data = { 0x04, 0x4B } },
+	{ .data = { 0x05, 0x4B } },
+	{ .data = { 0x06, 0x49 } },
+	{ .data = { 0x07, 0x49 } },
+	{ .data = { 0x08, 0x41 } },
+	{ .data = { 0x09, 0x1F } },
+	{ .data = { 0x0A, 0x1F } },
+	{ .data = { 0x0B, 0x1F } },
+	{ .data = { 0x0C, 0x1F } },
+	{ .data = { 0x0D, 0x1F } },
+	{ .data = { 0x0E, 0x1F } },
+	{ .data = { 0x0F, 0x5F } },
+	{ .data = { 0x10, 0x5F } },
+	{ .data = { 0x11, 0x57 } },
+	{ .data = { 0x12, 0x77 } },
+	{ .data = { 0x13, 0x35 } },
+	{ .data = { 0x14, 0x1F } },
+	{ .data = { 0x15, 0x1F } },
+	{ .data = { 0x16, 0x46 } },
+	{ .data = { 0x17, 0x46 } },
+	{ .data = { 0x18, 0x44 } },
+	{ .data = { 0x19, 0x44 } },
+	{ .data = { 0x1A, 0x4A } },
+	{ .data = { 0x1B, 0x4A } },
+	{ .data = { 0x1C, 0x48 } },
+	{ .data = { 0x1D, 0x48 } },
+	{ .data = { 0x1E, 0x40 } },
+	{ .data = { 0x1F, 0x1F } },
+	{ .data = { 0x20, 0x1F } },
+	{ .data = { 0x21, 0x1F } },
+	{ .data = { 0x22, 0x1F } },
+	{ .data = { 0x23, 0x1F } },
+	{ .data = { 0x24, 0x1F } },
+	{ .data = { 0x25, 0x5F } },
+	{ .data = { 0x26, 0x5F } },
+	{ .data = { 0x27, 0x57 } },
+	{ .data = { 0x28, 0x77 } },
+	{ .data = { 0x29, 0x35 } },
+	{ .data = { 0x2A, 0x1F } },
+	{ .data = { 0x2B, 0x1F } },
+	{ .data = { 0x58, 0x40 } },
+	{ .data = { 0x59, 0x00 } },
+	{ .data = { 0x5A, 0x00 } },
+	{ .data = { 0x5B, 0x10 } },
+	{ .data = { 0x5C, 0x06 } },
+	{ .data = { 0x5D, 0x40 } },
+	{ .data = { 0x5E, 0x01 } },
+	{ .data = { 0x5F, 0x02 } },
+	{ .data = { 0x60, 0x30 } },
+	{ .data = { 0x61, 0x01 } },
+	{ .data = { 0x62, 0x02 } },
+	{ .data = { 0x63, 0x03 } },
+	{ .data = { 0x64, 0x6B } },
+	{ .data = { 0x65, 0x05 } },
+	{ .data = { 0x66, 0x0C } },
+	{ .data = { 0x67, 0x73 } },
+	{ .data = { 0x68, 0x09 } },
+	{ .data = { 0x69, 0x03 } },
+	{ .data = { 0x6A, 0x56 } },
+	{ .data = { 0x6B, 0x08 } },
+	{ .data = { 0x6C, 0x00 } },
+	{ .data = { 0x6D, 0x04 } },
+	{ .data = { 0x6E, 0x04 } },
+	{ .data = { 0x6F, 0x88 } },
+	{ .data = { 0x70, 0x00 } },
+	{ .data = { 0x71, 0x00 } },
+	{ .data = { 0x72, 0x06 } },
+	{ .data = { 0x73, 0x7B } },
+	{ .data = { 0x74, 0x00 } },
+	{ .data = { 0x75, 0xF8 } },
+	{ .data = { 0x76, 0x00 } },
+	{ .data = { 0x77, 0xD5 } },
+	{ .data = { 0x78, 0x2E } },
+	{ .data = { 0x79, 0x12 } },
+	{ .data = { 0x7A, 0x03 } },
+	{ .data = { 0x7B, 0x00 } },
+	{ .data = { 0x7C, 0x00 } },
+	{ .data = { 0x7D, 0x03 } },
+	{ .data = { 0x7E, 0x7B } },
+	{ .data = { 0xE0, 0x04 } },
+	{ .data = { 0x00, 0x0E } },
+	{ .data = { 0x02, 0xB3 } },
+	{ .data = { 0x09, 0x60 } },
+	{ .data = { 0x0E, 0x2A } },
+	{ .data = { 0x36, 0x59 } },
+	{ .data = { 0xE0, 0x00 } },
+};
+
+static const struct jadard_panel_desc radxa_display_8hd_ad002_desc = {
+	.mode = {
+		.clock		= 70000,
+
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 40,
+		.hsync_end	= 800 + 40 + 18,
+		.htotal		= 800 + 40 + 18 + 20,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 20,
+		.vsync_end	= 1280 + 20 + 4,
+		.vtotal		= 1280 + 20 + 4 + 20,
+
+		.width_mm	= 127,
+		.height_mm	= 199,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_cmds = radxa_display_8hd_ad002_init_cmds,
+	.num_init_cmds = ARRAY_SIZE(radxa_display_8hd_ad002_init_cmds),
+};
+
 static const struct jadard_init_cmd radxa_display_10hd_ad001_init_cmds[] = {
 	{ .data = { 0xE0, 0x00 } },
 	{ .data = { 0xE1, 0x93 } },
@@ -456,6 +652,10 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "radxa,display-10hd-ad001",
 		.data = &radxa_display_10hd_ad001_desc
 	},
+	{
+		.compatible = "radxa,display-8hd-ad002",
+		.data = &radxa_display_8hd_ad002_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);
-- 
2.25.1

