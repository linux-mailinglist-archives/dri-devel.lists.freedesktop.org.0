Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8FB4782A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9762410E428;
	Sat,  6 Sep 2025 22:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="apeiheEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB8710E93A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 21:09:12 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55f6bdcc195so1277442e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756933751; x=1757538551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9dS6BCSDc4Ij3ElxhugOJZt1FZy+9YqKMXdSfgf8lCI=;
 b=apeiheEj/LTEfEkd9yg/yNhOYgIGRSbXmuZAbWynAC+0mbHLBnhfwjcJUPO8UXzops
 NFSvyYm8Z83ecWZN5hPSx1qkZbC/fTb07IiNxeSrUWB3uPn47kJD5IBYoDxvN2qgpLm2
 elizulKI5GOvQlsiZTvao++nbj/r1sd2LTJE6TLB6UtuhSF9X/RHRfDfoto6RXBVNdMK
 UXqxSawkBwMwldKoR9FmiBrCKuK31VWq5as6UiFri8QNSqMb4q/6T34q2edbIKLYJKT5
 tLRaSPAPJ6h1zclpcPD86rkFr3RVyC2ucZBygr3m2SMyDB0aB/+BZlMWxTN2dQII1B3f
 o95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756933751; x=1757538551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dS6BCSDc4Ij3ElxhugOJZt1FZy+9YqKMXdSfgf8lCI=;
 b=e4k82VYGTe5H/XzVU95yaK2HYkuJM4shjEZmp1weVEz0BpTFQeNqVlxtvUB9dTIfEI
 +D3IwTj5xGik+x85Ka0mRxapEHqv4GDUNW5RshneVOrXL1Lc30q6n88H2OZOx8vTWIXy
 I3sHf1RvFizxEHH/Lb3c8hPKArr9qRxrd3IFplQal6Gd9HGMOOmV22bG7KCdbplkZGSZ
 U9+rBMYiMkfFyCxSu2MZyejo2koLmCMsEZA0uz8Wd0KhTZoeXxjRjbXz2zTAwuzuBtpF
 0wAKbZUNCknN+fviIooYLgWYcDpdYq4Vya2S/j2kmEqdcSFXNIpVm3o4HrZvzWzEclJB
 KVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4taCaBk4D+1RPsDhpy0arVGyqMgQJqhXbiISTu5FhBgsS+FMC0lRaOKsDJgJvRtcN3MzTpReDMqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+aRpAAT/9+wqQGl8kxSGd0qkwCK408ToqifoY6bVETp0fLtFD
 VHSYNIek2BHrAXRC/iVSg0DjH/uiqgWKR2xn5q9qAi7HHkKkko0wFMmy
X-Gm-Gg: ASbGncsyaFhrkbXyUq6eUn65kOrHJWYFmJQDKLT/JR4kn25Or/TO8Hc90OQGXuIU8vS
 E4Jwyp+Ylw0SFmC9JD/dwZtuWHIWgsFXawFDTfajZXLJ8n6A84GrTgZI2HHh/p+0AarpW4TwduD
 B1qnb3MdLJpVAzfIgnv5ZAaJ480q38LSz/OtsDdFFjaZElupKMYWjvIJvYFvhxLfaIovUSBhL7R
 RoNNYrxyn/Hg4bI358gNamUAeAOqDLQ9rgBDQgdSGKA64ffywBzEG4ygHbW86KeHMbnh2eRbG62
 ZusLLQTXgVX31qujzruGgswFAuQehsEfElaolgtJ43F1Gxlzr4XXsDq9rNdVEPwnL4/avvQuLpa
 /RbM6lBImAQ9l3INKL4MAZefEDqyZd3dv
X-Google-Smtp-Source: AGHT+IEaWkvpbsHceTX1bATJyN4ozxPpzobv06l7Bv+6L6XYgG3xH3vM4xM3c+56Qk8vMFcG1sSl8Q==
X-Received: by 2002:a05:6512:3b9c:b0:55f:6cc3:45a6 with SMTP id
 2adb3069b0e04-55f6f72864amr4878076e87.13.1756933750589; 
 Wed, 03 Sep 2025 14:09:10 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608acfc242sm742652e87.97.2025.09.03.14.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 14:09:10 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: himax-hx83102: changing gpio state with
 gpiod_set_value_cansleep
Date: Thu,  4 Sep 2025 00:09:06 +0300
Message-Id: <20250903210906.238655-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

It is better to use gpiod_set_value_cansleep, because the panel
can be connected via i2c/spi expander or similar external devices,
and their callbacks can go to sleep.

for reference see Documentation/driver-api/gpio/consumer.rst

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 66abfc44e424..2aad315aec5a 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -859,7 +859,7 @@ static int hx83102_unprepare(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
 
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(1000, 2000);
 	regulator_disable(ctx->avee);
 	regulator_disable(ctx->avdd);
@@ -875,7 +875,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
 	dsi_ctx.accum_err = regulator_enable(ctx->pp1800);
@@ -899,11 +899,11 @@ static int hx83102_prepare(struct drm_panel *panel)
 
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
@@ -917,7 +917,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	regulator_disable(ctx->avee);
 poweroffavdd:
 	regulator_disable(ctx->avdd);
-- 
2.34.1

