Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C7B1091B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8207110E92B;
	Thu, 24 Jul 2025 11:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kOwlanuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972810E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:24:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so444087f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753356271; x=1753961071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/chaQOtrwAc8iUspacpGx3XlnJkksuOlQUkOi3ydoks=;
 b=kOwlanuBesG9+AcC2aKt/diO429p+nvjALFHdtm6MUKCVrX2s4Q2tjMhkcJVLsaqrl
 K+oUyJ/2JHDEsl2loiiK2jPBdn5viXkfj57myUqZ5XH8VeWlL/EGQRjfyokokb7t/e5+
 K3yJhzVWJLT45DtFQUdznLqXpvYW0VlGp/tTlT8djny2P4xmkoPbRX7sW2CeRiVkhUb9
 Umg9TG/kx+/Zm2OKaBLuR13YSgcgvuPIKoXcC5+3v5UbcltZYgeMUQXuDxKlKUxk2d1K
 z7EUZnRUH6MlWbpVjERfwXQUxyDqpXF6LDFs6SAlFTyhUGOAeI3WJEWsZbbBsZM/jAMg
 RRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753356271; x=1753961071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/chaQOtrwAc8iUspacpGx3XlnJkksuOlQUkOi3ydoks=;
 b=DOTuAM3e3RT+XZ93EwMO0IGP6+XxQzTwTOTmBvxZHIhzpLSzm77IUpyKBw/VzLR/m4
 V8CiFgKB0i9/S+SMKPqy2sH26rkpziKUo3zguKFKWCjsGEpWDFpsqkXpsvChOVLnY1lf
 RCWHR4XaDX1IpjQrgVJhm0DGudEdfSK8fbTiM8TC4bV4ZhSVorvEgZOWhCuqLGTeWjm7
 Lz4Iw2Rk/ZKZjIasEg5FtrxGaKoCgS/t3SbhD+gi1sIvQHfk1Ac2hFH2ja6cm0Ad6Bgt
 1eT5HZL83/JPF6EXV9K2suHVji07xcX1mHBrPY0R7RrG07417kcFUtqT6vfXDOa3uTQq
 jiAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzjDU0TA4h2eG18bdTLVRiS87JPL0JyZnbZ6PpBRAHwdOV2ez66+tFgnaWneXjg707j+hS933DPIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJbGoosLb2zMusCr1gNF7fz6wdGnW5bdMxahkj77dXWjDCNOrP
 Md7Lsjcn9i3yDNenF9Nra8uAx0Cu0AMSuIhyf02qO+pahYr9chNsO7w8
X-Gm-Gg: ASbGncv0oSxPza31YeJuZyg3rZKobVm7UXDzsIZjc/i+uzvR1/YZ1SjI1Diu5oLfycp
 ANW3Qp0eqN7Z0DCleDaaVnBtlW/QQynGAcy80Fu0vNXkjqIYuihT10U6dV0dGC74xBbrA81qmiZ
 qDc04IcCJ6RbA60KINXzI0QdQZcxZ7LhcH6O9l5Wh97lRhwQXZG8cb3bJxPdW07HmbhOmAWlAx3
 7cVkN4FZZ9RZ/1YI6i9JIy5thMBJ6UFzg3ZTKNmbWE/gNjo+yInNuDiaSpwGDxKb54w/ChEaM97
 KDrEba5oXbtACAGBHSWV44APSXl63yJDIVh0vCs6FtpPvrQ09wT5aTI+7zDbACCFUTpKudDKdhe
 yqNfBvrfIRc4Nz6u4zXhd
X-Google-Smtp-Source: AGHT+IGx6vY4OBDv0GI0qirOCTTfwNlLAd70BQpOL4ASVZfSa5T1qQYZyS8mCneRMwPLhBgww6T32g==
X-Received: by 2002:a05:6000:240c:b0:3a5:2c18:b181 with SMTP id
 ffacd0b85a97d-3b768f12c24mr5451850f8f.53.1753356271195; 
 Thu, 24 Jul 2025 04:24:31 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcad22asm1904963f8f.53.2025.07.24.04.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:24:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/panel: Kconfig: Fix spelling mistake "pannel" ->
 "panel"
Date: Thu, 24 Jul 2025 12:23:58 +0100
Message-ID: <20250724112358.142351-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in the LEDS_BD2606MVV config. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 09b9f7ff9340..af90ca62e57d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -971,7 +971,7 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for STARTEK KD070FHFID015 DSI panel
-	  based on RENESAS-R69429 controller. The pannel is a 7-inch TFT LCD display
+	  based on RENESAS-R69429 controller. The panel is a 7-inch TFT LCD display
 	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.
 
-- 
2.50.0

