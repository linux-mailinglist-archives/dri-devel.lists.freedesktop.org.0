Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BB75ABD4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5973C10E590;
	Thu, 20 Jul 2023 10:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134E10E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:28:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51de9c2bc77so9206263a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689762479; x=1692354479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/soqLhMpJky2zqln6dSDdmPSrvY11zerYkE0V67yek=;
 b=gSNKlFhffgUuPmBavvfpWRkCG2UCbjPYWY42YDdTLP15e6tBwZQVOEJuoVuAIeRHLZ
 2bx6A895x0JYCBekHLjKRSVn0HBAtxpZh33ZdJy/2ZY4DoK2DhNyywNa5mzbKxBztwAg
 q+qTd6gXnnzIyW4fotVLuMl0wU+6kuOocl3ZovByuNJuNnn+Omg8AtHDePOUp7X7RzrY
 bIRWiqJDmFmnAUlu9CwF61NdVPwcmy1XZqbpqRjDbKyhf9OWFiZZa2XAOBYHjTld+vYV
 DHY/CjGuKoKM0Zc34XLc4RR2Ffa60yFn61KGELNhzZ/2IDrq3Noz9ReCxW+4YYFWFH+R
 qBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762479; x=1692354479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/soqLhMpJky2zqln6dSDdmPSrvY11zerYkE0V67yek=;
 b=X65iOVqzdQs0XI0XqrZrH/oeP3ibiewvwzXNClyqr7ChW7dBNoSdLcj6AM1hPeKMwr
 +bIAaXXFVq3VpkqMi0WQoDYzMFUOwgUdrEXJXTEkj5nhYB6h86mBHrY2QpSp3QOouUJ5
 Uad8L4Jf9zGT3sjE1rZGVtAvMdzvtPOMiPBB9loXdTQr3BJJrCXooTeN5IY6HbGxMS4C
 mAx9fM8174PHsghBJ9MAcey5nfD/ZMzTDaxiWlsSD3WSnd1HTV0j86xrCU2RXFV7YE9P
 0Z945LpZUQmDaWb3wMW2FOEvfQpzm6pdtqEIWh6HmfbCVtufTsbH53qr8TU7fOTPfKk2
 S/Wg==
X-Gm-Message-State: ABy/qLYdb+tsseQom19oMr2u/u+0BUrvtIFB5bIz9t2c/3Pf8z2nb7mK
 so6Hg86fo2bm5NoLPQHKud3vQWXO39KaJA==
X-Google-Smtp-Source: APBJJlGJ+6/TQOwpsOvAJwCZUzSSs0M/xowjy33dQoku0NFMJKmrNmho9unlZcqPOJRn82Ys6L7Avg==
X-Received: by 2002:aa7:d941:0:b0:51e:1690:1b9a with SMTP id
 l1-20020aa7d941000000b0051e16901b9amr2197361eds.29.1689762479247; 
 Wed, 19 Jul 2023 03:27:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05640202d100b005217412e18dsm2520457edx.48.2023.07.19.03.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 03:27:59 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel
Date: Wed, 19 Jul 2023 12:26:15 +0200
Message-Id: <20230719102616.2259-3-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719102616.2259-1-matuszpd@gmail.com>
References: <20230719102616.2259-1-matuszpd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: Matus Gajdos <matuszpd@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for TDO TL050HDV35-H1311A LCD panel.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 1ec696adf9de..78ac57224689 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -455,6 +455,174 @@ static const struct ili9881c_instr k101_im2byl02_init[] = {
 	ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
 };
 
+static const struct ili9881c_instr tl050hdv35_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x00),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x07, 0x00),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x1d),
+	ILI9881C_COMMAND_INSTR(0x10, 0x1d),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x06),
+	ILI9881C_COMMAND_INSTR(0x21, 0x02),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3C),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x40),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x40),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x55, 0xab),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
+	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
+	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
+	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
+	ILI9881C_COMMAND_INSTR(0x5e, 0x11),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x01),
+	ILI9881C_COMMAND_INSTR(0x60, 0x00),
+	ILI9881C_COMMAND_INSTR(0x61, 0x15),
+	ILI9881C_COMMAND_INSTR(0x62, 0x14),
+	ILI9881C_COMMAND_INSTR(0x63, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x64, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x65, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x66, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x67, 0x06),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x07),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x02),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x01),
+	ILI9881C_COMMAND_INSTR(0x76, 0x00),
+	ILI9881C_COMMAND_INSTR(0x77, 0x14),
+	ILI9881C_COMMAND_INSTR(0x78, 0x15),
+	ILI9881C_COMMAND_INSTR(0x79, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x06),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x07),
+	ILI9881C_COMMAND_INSTR(0x88, 0x02),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x2b),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x33),
+	ILI9881C_COMMAND_INSTR(0x8d, 0x18),
+	ILI9881C_COMMAND_INSTR(0x87, 0xba),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
+	ILI9881C_COMMAND_INSTR(0xb5, 0x06),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
+	ILI9881C_COMMAND_INSTR(0x35, 0x1f),
+	ILI9881C_COMMAND_INSTR(0x33, 0x14),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x33),
+	ILI9881C_COMMAND_INSTR(0x53, 0xa2),
+	ILI9881C_COMMAND_INSTR(0x55, 0x92),
+	ILI9881C_COMMAND_INSTR(0x50, 0x96),
+	ILI9881C_COMMAND_INSTR(0x51, 0x96),
+	ILI9881C_COMMAND_INSTR(0x60, 0x22),
+	ILI9881C_COMMAND_INSTR(0x61, 0x00),
+	ILI9881C_COMMAND_INSTR(0x62, 0x19),
+	ILI9881C_COMMAND_INSTR(0x63, 0x00),
+	ILI9881C_COMMAND_INSTR(0xa0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xa1, 0x11),
+	ILI9881C_COMMAND_INSTR(0xa2, 0x19),
+	ILI9881C_COMMAND_INSTR(0xa3, 0x0d),
+	ILI9881C_COMMAND_INSTR(0xa4, 0x0d),
+	ILI9881C_COMMAND_INSTR(0xa5, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xa6, 0x14),
+	ILI9881C_COMMAND_INSTR(0xa7, 0x17),
+	ILI9881C_COMMAND_INSTR(0xa8, 0x4f),
+	ILI9881C_COMMAND_INSTR(0xa9, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xaa, 0x27),
+	ILI9881C_COMMAND_INSTR(0xab, 0x49),
+	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xad, 0x18),
+	ILI9881C_COMMAND_INSTR(0xae, 0x4c),
+	ILI9881C_COMMAND_INSTR(0xaf, 0x22),
+	ILI9881C_COMMAND_INSTR(0xb0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x60),
+	ILI9881C_COMMAND_INSTR(0xb3, 0x39),
+	ILI9881C_COMMAND_INSTR(0xc0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xc1, 0x11),
+	ILI9881C_COMMAND_INSTR(0xc2, 0x19),
+	ILI9881C_COMMAND_INSTR(0xc3, 0x0d),
+	ILI9881C_COMMAND_INSTR(0xc4, 0x0d),
+	ILI9881C_COMMAND_INSTR(0xc5, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xc6, 0x14),
+	ILI9881C_COMMAND_INSTR(0xc7, 0x17),
+	ILI9881C_COMMAND_INSTR(0xc8, 0x4f),
+	ILI9881C_COMMAND_INSTR(0xc9, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xca, 0x27),
+	ILI9881C_COMMAND_INSTR(0xcb, 0x49),
+	ILI9881C_COMMAND_INSTR(0xcc, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xcd, 0x18),
+	ILI9881C_COMMAND_INSTR(0xce, 0x4c),
+	ILI9881C_COMMAND_INSTR(0xcf, 0x33),
+	ILI9881C_COMMAND_INSTR(0xd0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xd1, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xd2, 0x60),
+	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x36, 0x03),
+};
+
 static const struct ili9881c_instr w552946ab_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(3),
 	ILI9881C_COMMAND_INSTR(0x01, 0x00),
@@ -812,6 +980,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
 	.height_mm	= 217,
 };
 
+static const struct drm_display_mode tl050hdv35_default_mode = {
+	.clock		= 59400,
+
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 18,
+	.hsync_end	= 720 + 18 + 3,
+	.htotal		= 720 + 18 + 3 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 26,
+	.vsync_end	= 1280 + 26 + 6,
+	.vtotal		= 1280 + 26 + 6 + 28,
+
+	.width_mm	= 62,
+	.height_mm	= 110,
+};
+
 static const struct drm_display_mode w552946aba_default_mode = {
 	.clock		= 64000,
 
@@ -944,6 +1129,14 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 };
 
+static const struct ili9881c_desc tl050hdv35_desc = {
+	.init = tl050hdv35_init,
+	.init_length = ARRAY_SIZE(tl050hdv35_init),
+	.mode = &tl050hdv35_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+};
+
 static const struct ili9881c_desc w552946aba_desc = {
 	.init = w552946ab_init,
 	.init_length = ARRAY_SIZE(w552946ab_init),
@@ -955,6 +1148,7 @@ static const struct ili9881c_desc w552946aba_desc = {
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
+	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ }
 };
-- 
2.25.1

