Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1B8C2EE2
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06AC10E2B6;
	Sat, 11 May 2024 02:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="h7RTBV0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1810E670
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f44881ad9eso2263150b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393634; x=1715998434; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldfU7QbZhVaK576Gxl8ORTm3YOiMDtw0DywKTU6/R7E=;
 b=h7RTBV0+GjbOFAKCXzs+m325004E08gMmz6/wkLHjBR6Ft+Lcf8T9oSDglX8sZY130
 xKb6BhNMMwpvefHnophtNMWP8piQlVXmuHycebxIXdERfOuQf+pzEvPplMAgyV3geDW5
 ZJmD9/Wf87LN7JpUXA8zDF72jqU6ln9dFZlqYJj9Mdmiau37I+6sECB75RR30CZaStOm
 aL+moMQT290g/BU23hKAiKhAYyPKApyihGEJVIU75iYKLUx/dGbgGWQQEPkFy9pKXYVL
 ooQG44NRzRBCvIa76zlyY1w5A1Na0soauOzTZ2CvhxS01oevTxqAv88IcM8S2Fmwx+KM
 s0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393634; x=1715998434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldfU7QbZhVaK576Gxl8ORTm3YOiMDtw0DywKTU6/R7E=;
 b=T/dE5aQJRBb1bWbQAXDxZHQiQYSNhn08oElNQWrTMWMNcaTe/Ysu+3nU+abkDGF2ep
 qKyv5HOxgkg8b3z8an4Ge/RfL0cqPk1vY+7/6g+VSShOIV1DNtaz7L7SZFQBEKkW+IHk
 2Xf3Lf8lUQXJ9GMvQu0h2sYYuXJcIwJt9IhX4su24z0+8hXkLSbPEZMvHdZ9/rXYQwj9
 d7+/BmSF6drhgEge8e3URgboYCJWwGHz9mVZdUv47JCrS0bS5tqj8bix81hE8wRTGOM5
 aFF3Szs+/+tK4Fyx1v9966L1NQ6jYIq/TUP606OlVu4mySzxeTRWbd/8/4I2k7H5Paks
 EGLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQZT/1EOG3Y6DuUC1/Cd44CMyATD+yyJwvq1VaMkBsmsR5YsycEV5VzYdklDw4amDr42foT/x5moots92OkYiikKSD1hcabCQdiYoOaUwD
X-Gm-Message-State: AOJu0Yzx/QkSWnWVAtHvLUJwBYNe2qfLI4zxWZv+ODVUMq8LTaKhVGi6
 oCwWflXEHEKjxEC8JSteE16Vrv0+OqJ1d50bzqw98NfI3919kAELcfsItxI11KA=
X-Google-Smtp-Source: AGHT+IFdAbY+Q1Dkq+GZscrcNzwz6UAYwDgzEgG8oAWquxRUr7E9Dae2lb5qa2mla39T//S6lFccBg==
X-Received: by 2002:aa7:88d1:0:b0:6f3:eee4:4426 with SMTP id
 d2e1a72fcca58-6f4e0355589mr4720553b3a.26.1715393633774; 
 Fri, 10 May 2024 19:13:53 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:53 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v6 5/7] drm/panel: himax-hx83102: Support for BOE nv110wum-l60
 MIPI-DSI panel
Date: Sat, 11 May 2024 10:13:24 +0800
Message-Id: <20240511021326.288728-6-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
Chage since V6:

- No change.

V5: https://lore.kernel.org/all/20240509015207.3271370-6-yangcong5@huaqin.corp-partner.google.com

Chage since V5:

- Adjust inital cmds indentation and check accum_err before calling mdelay in init()..

V4: https://lore.kernel.org/all/20240507135234.1356855-6-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- Depend Dous'series [1].
[1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromium.org

V3: https://lore.kernel.org/all/20240424023010.2099949-6-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- inital cmds use lowercasehex.

V2: https://lore.kernel.org/all/20240422090310.3311429-6-yangcong5@huaqin.corp-partner.google.com

---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 133 ++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 05e8b5fa8c29..0496e39ca5b8 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -44,6 +44,7 @@
 #define HX83102_SETGIP2		0xd6
 #define HX83102_SETGIP3		0xd8
 #define HX83102_SETGMA		0xe0
+#define HX83102_UNKNOWN_E1	0xe1
 #define HX83102_SETTP1		0xe7
 #define HX83102_SETSPCCMD	0xe9
 
@@ -185,6 +186,113 @@ static int starry_himax83102_j02_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 };
 
+static int boe_nv110wum_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(60);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xaf, 0xaf, 0x2b, 0xeb, 0x42,
+				     0xe1, 0x4d, 0x36, 0x36, 0x36, 0x36, 0x1a, 0x8b, 0x11, 0x65, 0x00,
+				     0x88, 0xfa, 0xff, 0xff, 0x8f, 0xff, 0x08, 0x9a, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x12,
+				     0x71, 0x3c, 0xa3, 0x11, 0x00, 0x00, 0x00, 0x88, 0xf5, 0x22, 0x8f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x49, 0x49, 0x32, 0x32, 0x14, 0x32,
+				     0x84, 0x6e, 0x84, 0x6e, 0x01, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x36, 0x36, 0x22, 0x00, 0x00, 0xa0,
+				     0x61, 0x08, 0xf5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x30, 0xd4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0c, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1f, 0x11, 0x1f, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x04,
+				     0x08, 0x04, 0x08, 0x37, 0x37, 0x64, 0x4b, 0x11, 0x11, 0x03, 0x03, 0x32,
+				     0x10, 0x0e, 0x00, 0x0e, 0x32, 0x10, 0x0a, 0x00, 0x0a, 0x32, 0x17, 0x98,
+				     0x07, 0x98, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x1e, 0x1e,
+				     0x1e, 0x1e, 0x1f, 0x1f, 0x1f, 0x1f, 0x24, 0x24, 0x24, 0x24, 0x07, 0x06,
+				     0x07, 0x06, 0x05, 0x04, 0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00,
+				     0x01, 0x00, 0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaf, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaf, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x05, 0x0d, 0x14, 0x1b, 0x2c,
+				     0x44, 0x49, 0x51, 0x4c, 0x67, 0x6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0,
+				     0xa0, 0x4f, 0x58, 0x64, 0x73, 0x00, 0x05, 0x0d, 0x14, 0x1b, 0x2c, 0x44,
+				     0x49, 0x51, 0x4c, 0x67, 0x6c, 0x71, 0x80, 0x7d, 0x84, 0x8d, 0xa0, 0xa0,
+				     0x4f, 0x58, 0x64, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1a, 0x26, 0x9e,
+				     0x00, 0x53, 0x9b, 0x14, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x11, 0x00, 0x00, 0x89, 0x30, 0x80,
+				     0x07, 0x80, 0x02, 0x58, 0x00, 0x14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00,
+				     0x02, 0x2c, 0x00, 0x20, 0x02, 0x02, 0x00, 0x08, 0x00, 0x0c, 0x05, 0x0e,
+				     0x04, 0x94, 0x18, 0x00, 0x10, 0xf0, 0x03, 0x0c, 0x20, 0x00, 0x06, 0x0b,
+				     0x0b, 0x33, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0,
+				     0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0xbf, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0xf6, 0x2b, 0x34, 0x2b, 0x74, 0x3b,
+				     0x74, 0x6b, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x2b, 0x01, 0x7e, 0x0f,
+				     0x7e, 0x10, 0xa0, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x02, 0x00, 0xbb, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xaf, 0xff, 0xff, 0xfa, 0xa0,
+				     0xff, 0xaf, 0xff, 0xff, 0xfa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
+				     0x00, 0x00, 0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x65,
+				     0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00,
+				     0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00, 0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00,
+				     0xaa, 0xaf, 0xaa, 0xaa, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
+
+	msleep(50);
+
+	return 0;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -207,6 +315,28 @@ static const struct hx83102_panel_desc starry_desc = {
 	.init = starry_himax83102_j02_init,
 };
 
+static const struct drm_display_mode boe_tv110wum_default_mode = {
+	.clock = 166400,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 65,
+	.hsync_end = 1200 + 65 + 20,
+	.htotal = 1200 + 60 + 20 + 65,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc boe_nv110wum_desc = {
+	.modes = &boe_tv110wum_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init = boe_nv110wum_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -451,6 +581,9 @@ static void hx83102_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id hx83102_of_match[] = {
+	{ .compatible = "boe,nv110wum-l60",
+	.data = &boe_nv110wum_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.25.1

