Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12534C00F74
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161F10E3E6;
	Thu, 23 Oct 2025 12:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vx4WN1ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5EB10E3E6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:05:13 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-378ddffb497so4318761fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221112; x=1761825912; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mPAe6rJSKdGLZTf//CNVsUeifZy5S1h66q+oaqtuUT4=;
 b=Vx4WN1ud1xD8bWhcpB2jV4MoOKsXte3H9CbLlylif4GpVuld62noRgZ4PH7EPD04l4
 MKwIWw2qoK4xntyg4BFO+4FXbgWmpBq9kWiAUUSLBmfkJyXHF2k3LXj84R6ZlxussBxC
 CWt8lZ1RH/p7gCPDbQdR8d4irCnZ9nNDN9x5zJhGH6kPkaKkKMThKbGlUEiL7NK4BM84
 8s0ohZYBRIM3Zwv/Uo+Cku5CENkZNH8bkZI9ILa+BU/cba+mSEDZZhn90PVl5gNjZIOe
 6FL7VQoVIm12rmbArrhzmTbJM63qZiR1J3x/J5n/YNEs0UytVAwoBcnujZifiQxG1QPu
 5Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221112; x=1761825912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPAe6rJSKdGLZTf//CNVsUeifZy5S1h66q+oaqtuUT4=;
 b=aIsJZCdWYVSGv/4GSnyTyzDyfDLdiLIxdHFCLw4QpqwHwbYcjBFeFID8Ob+jztG5o7
 cXDpDzXHUw79s+/37KCvRq+uwYyEqFJAH9RpJ/gc+IynzoUgzu9h52nx1NGP1MI30Qrz
 BvxKUicskss3r00Er7LCN8jbXttIAlNlBcEye70Th2tJ4RARJTlBN49MMChw7LllVZ+D
 +t94q4ZBFYR4Iia4WeR75POdiTkVa9Z7lOua9gJzsrsN9XpHkHojN9z5o2u2W3uQpclc
 8pQp1t1CakM++hIXhmV0HNHdZCpa2KTPcb7oP/SsaA2/dlCiSs+8zelxJjSN/WO21qvQ
 gSPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZGSULFDLLU/UZcygobVpF70vHu7kn98M1UpUfrtWeCq21TkwXCsK8dCh/mGAcxV5+iqhAXpLlk8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu4JAa4K1XeopO9YSqfw3HWAylfJb+SSDIhi9PM3mNjgm3vYmT
 pZnFSvtWjZldsSiOx8dLJH0aHw9QHG7rViNCYyWuoKXo4XvbRXyhp4C0C+kr1rln3H4=
X-Gm-Gg: ASbGncux6MLHIDBajlcmxStFNa+qT/BlrZ5e2WhkJghTvqm/W4r3HClqJVEj3JQVk11
 i9Ksg9cJZLM8d6V6VKeT4W6wmP9q2rkszfiThCVWg9yKf67Ra07YLFPlxcEBifI58T+7RT8l5hg
 2nuoQU3LiKv8eNkljbxGZgRYmFpg7YE+5H/iJb1RbF3wDFlIUF5ULIqWckT2GzuWh/Vi2LY0WWo
 9NeRmOh1+GiO/E9jRa6V/p60L70nPF8TktwQ9bgNFtHkUucqfZNHWvjFQgaut9MVxIVk70LiI4z
 cEibNSI8Vx4oQhfUNI3LO6MGurNS7haxWPQtceR/fysoDe7Sw0gMBBMkMzyZuqeF8e814j5RWkU
 PIDF4IzhFg0aF2xW0loEbn+9+c/GuoKThlAo07JfG/kH3gXpgm9wzDxCD9DVixz8UH9VUqkkS7J
 2HR1flFnPZakXp7OdkszDMZA0qvq9lcezcbsGN646AP20NwgSiJswvImU=
X-Google-Smtp-Source: AGHT+IFUTxn/igWyCFH+B2lyCUXMQTb27fqKt39Hf608m0w0Ao3XavukjGWpJEvaRdvNbfspIcWvEg==
X-Received: by 2002:a05:651c:1142:b0:36b:693d:1244 with SMTP id
 38308e7fff4ca-37797a0904dmr62642991fa.30.1761221112237; 
 Thu, 23 Oct 2025 05:05:12 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d680322dsm4070701fa.47.2025.10.23.05.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:05:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 14:05:09 +0200
Subject: [PATCH 1/4] drm: panel: nt355510: Move DSI commands to enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-mcde-drm-regression-v1-1-ed9a925db8c7@linaro.org>
References: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
In-Reply-To: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

Due to semantic changes in the bridge core, panels cannot send
any DSI commands in the prepare/unprepare callbacks: there is
no guarantee that the DSI transmitter is available at this
point.

Tested on the Samsung Skomer (GT-S7710).

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 3189d89c7ca0..ecd3fb09f9fc 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -971,6 +971,13 @@ static int nt35510_power_off(struct nt35510 *nt)
 }
 
 static int nt35510_unprepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+
+	return nt35510_power_off(nt);
+}
+
+static int nt35510_disable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
@@ -993,23 +1000,22 @@ static int nt35510_unprepare(struct drm_panel *panel)
 	/* Wait 4 frames, how much is that 5ms in the vendor driver */
 	usleep_range(5000, 10000);
 
-	ret = nt35510_power_off(nt);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
 static int nt35510_prepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+
+	return nt35510_power_on(nt);
+}
+
+static int nt35510_enable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
-	ret = nt35510_power_on(nt);
-	if (ret)
-		return ret;
-
 	/* Exit sleep mode */
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret) {
@@ -1078,6 +1084,8 @@ static int nt35510_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs nt35510_drm_funcs = {
 	.unprepare = nt35510_unprepare,
 	.prepare = nt35510_prepare,
+	.disable = nt35510_disable,
+	.enable = nt35510_enable,
 	.get_modes = nt35510_get_modes,
 };
 

-- 
2.51.0

