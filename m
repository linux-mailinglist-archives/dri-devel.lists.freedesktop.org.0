Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402927E7B15
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC3410E95F;
	Fri, 10 Nov 2023 09:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A410E95F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:46:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso12690425e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699609565; x=1700214365; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uunydpml8PeMq2mbpEvu+pL7sXUAsxGmK6+cLSX0zCk=;
 b=DFVICazXlOcFLEkb+cjd6crllqRxZds3UEIFU/1qQHCJwBPhIcRlDWVYCMpRny5zii
 tQ6bkNl83NC0DVcGH/Q8IqekHDDoy6+0Dd/FwBTPjOv/wySsF9+7lIJtPQ1T9l0NONse
 Fs1HkUBakt7V70g1odkPTUoVd8+zgDkLGoWfnPWM2wWRVtXS7pSDb2dLe526EHClVeso
 l0YS8n65GcwKkulT2P7hWoBofo0GpyLl1X0u5+/PjB1KXOh2UJAA+pb6wqOsy9t/C34o
 9lg3wuPq/L3FyStydQTtrX2TtZd1o1xBTzgKEYd6oZ1zdHmlkMeNvcILsxnKiV8XpROm
 A8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699609565; x=1700214365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uunydpml8PeMq2mbpEvu+pL7sXUAsxGmK6+cLSX0zCk=;
 b=j0VxTquRBfULerrK4826orEjZ0wotfon44A5fMdEOcq54btn/+i6XwTEmdjWsq0t6Z
 Frtocp2CYcUOrb2keeP7k96kFWloCeNxo+Sp2VfDGr9GuFPg8biqVh9nnl2DegnNXRQb
 nN/Q6BAyR9L3AtilT7imDC0wsecp+ID7L3AtkgPHEu8g3DOtTZNljL3lrTW6BAzteS+I
 OHswJbKKWTNzyqVZVahlqDAaYEfIFBMZNnAtezfStr1ElhnoyrK4kldMFMRAFDYlqjJQ
 XNifFYCf+IruInOwNuFUOCfXe2bGEBQR4Md2dcwQVw3LNB9tqaOoddiqXMEfblFYhOw2
 Du8g==
X-Gm-Message-State: AOJu0Yz8osrymfGSsgq2aqY9v5Sfiy27sHDOMAn+SkAorKaL7PMqK0ge
 HFbvTvJCnkshArY+fqFoZ2y6aQ==
X-Google-Smtp-Source: AGHT+IHfHRJ3b1ZqzNfJbn8Ok3ybqmOizdXjDOhG2PIreQOl/XQjvcJ37E6cfIJlZWKWHxdITRbrQQ==
X-Received: by 2002:a05:600c:35d6:b0:3f6:9634:c8d6 with SMTP id
 r22-20020a05600c35d600b003f69634c8d6mr6975925wmq.18.1699609564798; 
 Fri, 10 Nov 2023 01:46:04 -0800 (PST)
Received: from yc.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b00405959469afsm4670527wmo.3.2023.11.10.01.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:46:04 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, airlied@gmail.com
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel
 HFP and HBP
Date: Fri, 10 Nov 2023 17:45:53 +0800
Message-Id: <20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, zhouruihai@huaqin.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The refresh reported by modotest is 60.46Hz, and the actual measurement
is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
pixel clock to fix it. After repair, modetest and actual measurement were
all 60.01Hz.

Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4f370bc6dca8..5f7e7dee8a82 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1768,11 +1768,11 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-	.clock = 161600,
+	.clock = 162850,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 40,
-	.hsync_end = 1200 + 40 + 20,
-	.htotal = 1200 + 40 + 20 + 40,
+	.hsync_start = 1200 + 50,
+	.hsync_end = 1200 + 50 + 20,
+	.htotal = 1200 + 50 + 20 + 50,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 116,
 	.vsync_end = 1920 + 116 + 8,
-- 
2.25.1

