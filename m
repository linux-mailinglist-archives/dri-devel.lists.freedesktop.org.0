Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBB7F0A6D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 03:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8510E184;
	Mon, 20 Nov 2023 02:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFE710E184
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 02:01:17 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6bee11456baso3225406b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1700445677; x=1701050477; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6DWxPNLGzDiMiFHdECjXOeY7zOyEbN3TxAomc/czVnc=;
 b=aRELAhyd8Z80DQrl3hp8kMXmk5tgeYn1EeFJWtcWZJ6/SZXCHMtCL0bBLnLc4oY35m
 QE0X9niqMF+IJi98fPqFUHEhdAplkOeeTGSQ/ls086qgopzpU/9fvxtmUnhKa6EDv82e
 Ol4R23dHFIP+GKza0mnvNZHo/tGAJFS9I5t56lgFXxaRw2esDKY4C9z7w02oSc6fp9fi
 H40FTrefL3AF0571ahsXB5ugPjuLuA1RmNF0N1h1RJ7CuJCqhe6uyNZtVpMJDjzHiqwr
 hO8h8+Ytfjq6TPEZ1+HbYX5e3JR5o1eLyhwGmZNSrd4MKql5rWAO3m+uAzKaT/qeM8iJ
 d1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700445677; x=1701050477;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DWxPNLGzDiMiFHdECjXOeY7zOyEbN3TxAomc/czVnc=;
 b=Xp8u7ynMJYS4BM3mxpXKjZ8ArJfhB/9rwtEDw/CHtQyq4C7kfPC11sj70B6W4HIyME
 nTKMjvWPg5SaViZIIn2WAWp5sKOSs4yH4hOMoaJR8JJNz7M+V+zvhM5IQbh7acOxTw11
 6z5XGl8DPVIzbrU8grBlfoef4v0Gcn3mpcJM61gNHooGmQGcdsvtuLj9m/UDtr2fywWH
 NM4h2Nz1NBqUr4EpQH9bCEV4nacFq4UnbU/kt69kp5gKkMMiRsOjNIz4scb3U+Iaf+4u
 BzCM6yw3XbLR/7NvQfY6LJaVnka1Wrh9D9DhhGsYJZLXBLjHaWLF+Su8qhyRg+g07F9Z
 EVNQ==
X-Gm-Message-State: AOJu0YxA9MuPgIJ4n5COYPhgLov8zsChSJQbp+ORwTtGwFiPOnPsXPsz
 818+13GUTT4mlA/H/VGk5vEdBw==
X-Google-Smtp-Source: AGHT+IFDHn+5iBC+AZU8yYyMrcC4SGiXkRkzBh9sXLWwGRjdfgomdA3Ckd2YZhuIaD7fEgmjNiHg4w==
X-Received: by 2002:a05:6a00:3984:b0:6bd:f224:c79e with SMTP id
 fi4-20020a056a00398400b006bdf224c79emr4583800pfb.11.1700445677104; 
 Sun, 19 Nov 2023 18:01:17 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.210])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056a00080700b006cbb18865a7sm28167pfk.154.2023.11.19.18.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 18:01:16 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, zhouruihai@huaqin.com,
 airlied@gmail.com
Subject: [PATCH V3] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
Date: Mon, 20 Nov 2023 10:01:09 +0800
Message-Id: <20231120020109.3216343-1-yangcong5@huaqin.corp-partner.google.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The refresh reported by modetest is 60.46Hz, and the actual measurement
is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
pixel clock to fix it. After repair, modetest and actual measurement were
all 60.01Hz.

Modetest refresh = Pixel CLK/ htotal* vtotal, but measurement frame rate
is HS->LP cycle time(Vblanking). Measured frame rate is not only affecte
by Htotal/Vtotal/pixel clock, also affected by Lane-num/PixelBit/LineTime
/DSI CLK. Assume that the DSI controller could not make the mode that we
requested(presumably it's PLL couldn't generate the exact pixel clock?).
If you use a different DSI controller, you may need to readjust these
parameters. Now this panel looks like it's only used by me on the MTK
platform, so let's change this set of parameters.

Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Chage since V2:

- Update commit message.

V2: https://lore.kernel.org/all/20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com

Chage since V1:

- Update commit message.

V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com
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

