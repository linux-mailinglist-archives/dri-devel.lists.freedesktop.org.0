Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D0AD3663
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60910E0F8;
	Tue, 10 Jun 2025 12:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G39n8UNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FC410E536
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:34:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so2742860f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558889; x=1750163689;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5K5VoQ4rT1KjfvQ3yVVHAxkopbf0b6YZVw/HgaVIZ/c=;
 b=G39n8UNljUMrMJ01g5dwwNvQfzfE8vAu0pQwRKbGGqbZ081Z9L50cgmp1tOpGO7UJK
 R0xW7M5i8XXJBmJqESvmTgCN3HG4B/tWfqfD/XkgQzqARRZXzWIv9SzsIhjZHXpKNa4q
 d7V8PO8X5q7edntoLockGM/Ou9QfGdS43WtvUSikrV0qcrVYrnfS2xyIdLxINWjv9jd9
 DhDmEKoAHp3VCzabbESlwzD8nHIOuVeQiiUNQRvCBMYnWp+11WltdIIaX0zKVhhLXeBR
 WlYieFlByYl/hoJkjnd7RVRocM8G9XTtPPGzXGaaK/19+hUv/goiOmGVYEPphBUpuVH6
 ig2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749558889; x=1750163689;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5K5VoQ4rT1KjfvQ3yVVHAxkopbf0b6YZVw/HgaVIZ/c=;
 b=pEzYoWIB5c8MkACeGMlkU0OZPKm1LqZ4HeXVq49USn/ZNYM0VjmX67Ei+aLMTovx8/
 3fUCbFaGIwx7CvH3xK0uiU9NeovD5fNGeaJ5mX1G9Fk6gqqxlO9Z2qzTOhpyrjpcgyMw
 /Zk0jSKHv5hxIDUWnJH5ulan0X68r3YZ2svzW7vXNg43yMSopJ9S3P4u7aO/MnzfHoo/
 ZLO+B71AzFSviN4BRelqhg5Yjm+TbuA9JUsuybx3YFZyQQ/YMF3dm+5YPMuMQF68vXSv
 g7CjmNzmvsvVFyIVpr3JPCV8CfXicFe4KfQQAIpxQkxlRdBvKkmPwvLlAaxHN4PoU4OR
 68+Q==
X-Gm-Message-State: AOJu0Yymke+OIRRJlv+4TlA8jpTVReN0yMfNELfe1y4sUCWdctxZt1Xp
 PSV6xYfIbAYgC2+k+ffeUQ64QB4i7hJ2DHKgSml/e9ePGDWxead4sadXfOABGO7zJgA=
X-Gm-Gg: ASbGncuvrER2mYQ1cDsAqrsUNA7oE5kSLOSG0Ndm80AP/yib0t9cOcaQRCLXxaTnF/4
 K6NPjsi5w+B/cc6yxy7sc2EBym16GoVA1r5UG4C2+EFjofwB32tMNJ0uCS7uQOo/HPke9lX1CWx
 +jdAyWIOJroJoikK4Ax908gOSGyB1I396OwQPqVxp14+I1fUn2llbOSg1UliJOSfCEH80qP3eZ9
 9kgmcZzBw9DG3B5Jf8nvg9N1qOR+3GfdV9VnBPYgjpxvAyP02kDATd5NEwRUqfWyqKj+0DnAvkn
 g1FsEwyTnAl3XWKJ+yvbaGbLSAIoTDJZkc12YlUfvfseBk3ab47CeIYYOa+9Xmwr
X-Google-Smtp-Source: AGHT+IHj5nTgxjR6r4POgz89vPuHOzYTX2eFQrmUxlCH9Py1gxug17nEhIRugT0Pklk/NzpmDFUMZQ==
X-Received: by 2002:a05:6000:2410:b0:3a4:eeb6:3b6b with SMTP id
 ffacd0b85a97d-3a531cadaabmr14290302f8f.43.1749558888662; 
 Tue, 10 Jun 2025 05:34:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f0cbsm12070564f8f.81.2025.06.10.05.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:34:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:34:46 +0200
Subject: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGUmSGgC/x3MQQqAIBBA0avErBuwKQm6SrQQnXQ2KloRRHdPW
 r7F/w9ULsIVlu6BwpdUSbFh6DuwwUTPKK4ZSJFWmgh9lmSDZKx8YLmaTzSanJ5Ga2YiaGUuvMv
 9X9ftfT9l3fFPZQAAAA==
X-Change-ID: 20250522-gpiochip-set-rv-gpu-a52d543ca722
To: Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FH3MtQcLLAHOq/C1/tH77XX/4cwaEP8Ca7M9Ub+35z8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCZnFm7Nx6SgfA68TKm7MTHyVJwoF1f8QagOc
 v4yBF0aF4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmZwAKCRARpy6gFHHX
 ciwLD/9dvLIfLE83Ab+HXpJ7hTs+SAfUmi5ERohBreEDtPXTeoKyO4BVs0JT9EECOcUs+pwwfCd
 iLcAb4271rbljwRcFE2MU7++EcqYRgdcKWgwdQFfib723SU/2zmHB0TXTXgryVV0SB2YmOkfuo2
 14nd8npBReXPqJhdYXqGE+xV3xhANc8OP3LQEKBrv5KmwbEI4l5w0J16mgApoN2LepXJgI92AH7
 1NWMqPhiYRfNHh1GZKE5RNR6IXvG5DSkk4Mi91ArTlJVj2I8tr12Ll+XaZG6Hfqpqpcz4LOazZM
 FyflXBOZTHeMSAKPVvLfpDyyIYL4dwX9qvERcM95IH69Za5WAN+BcrH5ExNi3Au02HZEh35FgSQ
 gLEwJF9u1zg0wa0UC/3K1tvlo6VZsbIhIs7gPt1wrFYm32O9GosM4OXq1XfJZnm0MgCZjF75hhl
 x7UxdLe6G/+yFQYXhjkaZvXova6P5PmzTMsEisO70Y2F2tgSeg6/iuBxJpgLs/Zyh7PtS8DNAfe
 G2SIR/gD0K6xA//M1c2rWTB8tCbUlQMtRvqXhWAkQO8TTeK7JQwJvJk/LTFwwXCj7eqgL5sCTBH
 GhkjwgTfCKqyjv529CcKIaT7jHEM0mvUG+5ZFWoMuHqPcgDg6xklCwychNy5vz0TsVB5cKMHCz6
 BuRansLmDk0Uv0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d048c693ab36a0a79b6897c6101a8..3814253f36755ca749426993fcc964fa253cb5f2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1707,24 +1707,20 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));
 }
 
-static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				  int val)
+static int ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int val)
 {
 	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
-	int ret;
 
 	if (!test_bit(offset, pdata->gchip_output)) {
 		dev_err(pdata->dev, "Ignoring GPIO set while input\n");
-		return;
+		return -EPERM;
 	}
 
 	val &= 1;
-	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
-				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
-				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
-	if (ret)
-		dev_warn(pdata->dev,
-			 "Failed to set bridge GPIO %u: %d\n", offset, ret);
+	return regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
+				  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
+				  val << (SN_GPIO_OUTPUT_SHIFT + offset));
 }
 
 static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
@@ -1828,7 +1824,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
 	pdata->gchip.direction_output = ti_sn_bridge_gpio_direction_output;
 	pdata->gchip.get = ti_sn_bridge_gpio_get;
-	pdata->gchip.set = ti_sn_bridge_gpio_set;
+	pdata->gchip.set_rv = ti_sn_bridge_gpio_set;
 	pdata->gchip.can_sleep = true;
 	pdata->gchip.names = ti_sn_bridge_gpio_names;
 	pdata->gchip.ngpio = SN_NUM_GPIOS;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-gpiochip-set-rv-gpu-a52d543ca722

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

