Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB33CAF3FB
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21210E493;
	Tue,  9 Dec 2025 08:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dh+OT/mH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0455510E096
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:16:18 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5942bac322dso4627309e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210576; x=1765815376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sP+wElHiWhPVX0s7Fm/0FfEMrf5VeQmAO5kbLUdT2KY=;
 b=dh+OT/mHSgH9IIJbUwBh6hnONHyd33J5TL3UHV1wjPYZmvp4J87PBOH5bttw4ZnNrO
 IhRrYWu9Am1mjRVotGyAPtMh6ouc/wFYeTjAAIwtjnAg7ZHaNKEHtmggP0q8JroDC6kx
 fZms3M054FbaX2oJMbxg8prp2GohcSN/n/gaE8w5nxVJwWCayeMgrxNyjbBbRchA5Nt6
 RH0YEm+s5Xoe1DcZqy2JAFvoxFc0lRjc9ZdtEnazS6NTAe8i8Aod7bHw/UcqPK9NLgZD
 IX8RpysKymFVYadahLbHOOxeuTU4MCktN90u/6+pOrsSvFPfvT5ptnu6etosocsowt2+
 UIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210576; x=1765815376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sP+wElHiWhPVX0s7Fm/0FfEMrf5VeQmAO5kbLUdT2KY=;
 b=lVOieCckWnh+NyX7IIyxJ/qwTicbnAGkPyKJ+nTNK9Ee+D3f1NSQoG8vNd4MALQxnQ
 B2Ntn7qMz+w3y9LP8DCI9dUsTQ3w25AN3U7pgSD1UrucGREPGa0jeMObFRRMUz5rZw/W
 ZNf7IqlFmuzCvsaNZU+hwOkzlJoVVghNzC6vk4JyoTlMRftEgr+RFqRJXJJOVSj5e1Lq
 SrCII/arz5Ks4pjoFCn5joGbL253Fv2Bj9Hfp+B8ZNZlNGz+SXo5ZN7aPA+caJGQO/II
 W+Zx6nyHT1jhsVflpL+ds0tyuW/mI8sq01Ixo8TouyL4R2jtlZpLIEmHJfqpZp8xd50o
 SZYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy4PkS0AATLzg5Cp7jyVDQk/TCiIO+7tM2MdM/mduskxOG48wcskoMZADCTHjznws4xt0jKuxY+sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDQoqoRDtqt+d5o6WFZxbWfYIBrxlhBqTYTlon+n7Earyankf5
 F8dTGvntT78mQvNjf7Sf76Xws9SAXGMmSfnp13NH4GaxjreBkbnKkJyO
X-Gm-Gg: ASbGncsRdbVNLGtNAVxeCAPFmdBUH3vdF69Gxdy7RznJvzrXMfs7kgUmgjYVvEA7JzE
 bX+NqEM6HGxgF1G96hctVhpZelYn5jjpLSKZ1gjqJNojInC0rgzOtd1b/uu8F+e7XD1XtrBXPVG
 xMdWhh77E4KKR6F7ZOe0/RD7XilKbWhZoJMEXUVf51kxeMcCZtuu1dipqF3xSRjaM4NdU3kF3tM
 0+z4aQjm9BTTkKQ34SaIrBzMo5KVwftc4PXkNswjZkC2xP2uDAeALvWiMLbpdp8wGXS9JfBKVg6
 HeE+Zyn2jAH7eeA92wfo/yCxzK0D547kGSTSRPeL6L7jPqycXh2e6ZlkJF29xX93CEDdg+hhYnM
 KI6MtMtjOCdJ8yjlwJa37mlNYroGHHesuMKzcTjrZsLEmPGDopd5VRRM+DGwrrkL8apg0OEIS+k
 Wrm2nP9PTIO1e8KHeepQfEyMdPpX0Xzg==
X-Google-Smtp-Source: AGHT+IH6K8WSCuuXxeZsJAmON17j1OOZdc1bDidvYwdi0X9+yi5QlVMR/yNdi9iMFd8Bkgz+Jy34+Q==
X-Received: by 2002:a05:6512:3e0a:b0:594:35b7:aa7 with SMTP id
 2adb3069b0e04-598853e4220mr2732276e87.48.1765210576183; 
 Mon, 08 Dec 2025 08:16:16 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-597d7c2eb84sm4183766e87.100.2025.12.08.08.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:16:15 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: himax-hx83102: change to gpiod_set_value_cansleep
Date: Mon,  8 Dec 2025 19:16:13 +0300
Message-Id: <20251208161613.3763049-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

It's better to use gpiod_set_value_cansleep because the panel can be
connected via i2c/spi expander or similar external devices

for reference see Documentation/driver-api/gpio/consumer.rst

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 602f1adfc8ee..f31e502f71a3 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -1049,7 +1049,7 @@ static int hx83102_unprepare(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
 
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(1000, 2000);
 	regulator_disable(ctx->avee);
 	regulator_disable(ctx->avdd);
@@ -1065,7 +1065,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
 	dsi_ctx.accum_err = regulator_enable(ctx->pp1800);
@@ -1089,11 +1089,11 @@ static int hx83102_prepare(struct drm_panel *panel)
 
 	usleep_range(1000, 2000);
 
-	gpiod_set_value(ctx->enable_gpio, 1);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
 	usleep_range(1000, 2000);
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(1000, 2000);
-	gpiod_set_value(ctx->enable_gpio, 1);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
 	dsi_ctx.accum_err = ctx->desc->init(ctx);
@@ -1107,7 +1107,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	regulator_disable(ctx->avee);
 poweroffavdd:
 	regulator_disable(ctx->avdd);
-- 
2.34.1

