Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B81AE153A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 09:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D4E10E211;
	Fri, 20 Jun 2025 07:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IQv3hx65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBCC10E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:50:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so1422052f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750405804; x=1751010604;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hgs/aXUaS0FHvreTt0i+GqI5HPA2Yq2mywly9pWL0cQ=;
 b=IQv3hx65S/RGJlZOs6vlmBlRWyA1F7jaDG8ufodq7/mog+G4ajeWgA3N4HuupvSciH
 UwPjTktI+lI2ah4SUWmN2BsgIi3w+n8f+Dvfytpxd2UPXN+Qf42HEcNnaK14SFL4+hE3
 I4uatka+zmU1EVHt+0U6UiTkZzl0i+KxpK5fFhYCAmn0+uvdydCXKStoAuXW7/in4+VZ
 i5liMo8FdGc5DYWeqx90oObZBTeVjxKeHqnnwpWGmTmO1m0BB/MRhAK1yrjkSdsxsPOP
 12R8ivrkZ3Yu1a+ZccXs8938SgfqQjxXsofoz6wbwuQsXBzvtuTYjRUyEjnl+kEsCUhB
 Zg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750405804; x=1751010604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hgs/aXUaS0FHvreTt0i+GqI5HPA2Yq2mywly9pWL0cQ=;
 b=WoIo+1LHetDqSrHdZ1v6xZprf5hXj/mAJSjL5quIUMExvo/5F4nYTk646mSzSjs1m6
 5ucn4X/ue+gf41IjD8U3Wx4jw+C8MYTttYBM1f6RrxwvgahaH+m/xHc7iR7o+ouTHiTI
 6Vfw/WIZtoyHDOZwOvt+2eUrbvr4Fnj5KNcw6jz8kReOdiTGdVSA/PHbWT5G0jOE3MLV
 6Ez5rV9EDfcT6eJoEGbojtz7SOTTCUTEuGAz57+w4Ze6U3P4qbDIuB11qLiH4wcF+07y
 4retNcVO7Rp3IhIjbp2X4IP8uXlm40YSzDd8h3ykMCrUc7JOZx+yJXbSN9GUfkN2D/Se
 ZchQ==
X-Gm-Message-State: AOJu0YzoFBuYZbwG3vXXL40hP7d+E0X8eNPPyD0tcPK6s71631iPR/3J
 0UDF0ZHTZrkmQxMp4OOTXGCZdZXbj46IiIroQ+vnTCFS+0SNrm+eNrfwFIQb23d7Z90=
X-Gm-Gg: ASbGncstFKZRfytNMkYy9FVf9HUQDRLjS1V1XBYWMyHmd44CyChUvl8ME14XmbOYeSY
 QjYam08n/h3ZP28VkwPhCY5yHqAmwPS83u2tuYwyzE9M5IUr9iyZ0MyIIvkppDI284UfOIt7kFD
 0Zs3teL4A6IUF5QnDXFXsgDfsJzHTdu7DLaqqgoSi1tCfhQHS9fM0oAyT5V7yvk4kD0k+nGjs4f
 3f+wBNYTax/6wsRIiceuzKuxDI1WZ7sMEj0TUfGvy54TLqWOYZEM0tg7pCBUJv8DR/OEqaKqpE5
 dmJ+VRdT97FxJPzkI4dZh0faufO9CKG7gmmUAFIxJ6ZJyuzvLhI3UeFbPdJ2GBM=
X-Google-Smtp-Source: AGHT+IFs8zGZQM01COG50yX2bVTZqY67pJjZf0ROPMbZcGOX6kAoBqID9nQ+RnfeZgYlSiBCPOybvA==
X-Received: by 2002:a05:6000:2b11:b0:3a4:f6ed:767a with SMTP id
 ffacd0b85a97d-3a6d1308facmr914488f8f.38.1750405803871; 
 Fri, 20 Jun 2025 00:50:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8e0asm50143715e9.23.2025.06.20.00.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 00:50:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line
 direction check
Date: Fri, 20 Jun 2025 09:49:51 +0200
Message-ID: <20250620074951.32758-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 78a50b947a08..3d0b4bc5129d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1677,11 +1677,6 @@ static int ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 
-	if (!test_bit(offset, pdata->gchip_output)) {
-		dev_err(pdata->dev, "Ignoring GPIO set while input\n");
-		return -EPERM;
-	}
-
 	val &= 1;
 	return regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
 				  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
-- 
2.48.1

