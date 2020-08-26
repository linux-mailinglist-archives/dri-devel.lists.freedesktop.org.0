Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4794252834
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 09:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449E6EA21;
	Wed, 26 Aug 2020 07:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3C96EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 07:11:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u25so396594lfm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxV78lFGTfWxeF+mdcE+OLKjjMLL/kmFGycYhTRAwlg=;
 b=XdI4tzCpsMx25Qfaqz2PMj2weYP+h5NvN8YDoJ0jMcTsbtjFAd9yFq7lOzUco31mkj
 e/sG18T4rP5DTKnLc0+aHi5lIKrApJ8pH1Rs6pH/VpAlvs7Nakmp5jJOjzUCVqRh/rdo
 LJJ4Q49nOV4LN/TrJ4xCuGP5JwB475nymOiZdmAySkxnCrB5IBXBOFx8Jc8rwOInutEl
 h/GVcwK3da9Alt9umZWGHohHbM5cvayg22HSDGwdK7CNCoyUTh9h1qmSKAhHlzzHMYBY
 Hyydv9iY+KhZTniuuEDfxZ5dbSnuul9lIDfrarsQLPP29UQsBpgeIUpK18B1dehO8yV9
 rCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxV78lFGTfWxeF+mdcE+OLKjjMLL/kmFGycYhTRAwlg=;
 b=IgrdwKfQC0d+Baq80+rc//U8J0NqcFv2hnxiD8NWPdgVlKaFk737btrcO7ySDoR2QI
 x0vyJCeIFLRFcJjlYetqkOJ/+b8/Nij3/vU0rGw6iQOtdCfZTAGjmSuVgM54tHvudLfT
 Y2cWn7RN34TOOJwFrIFpwYVVlSxqs2CuAAfKRSgnRqWBhSnrSRncorQ5xrmYQoIDwJop
 zVGpYwrZocE2SRD82I/89Gs2tPiUX/BFJ6cHcBl5lVIJpU3hu11JoVeMw7r3erLd3JF0
 6nFNxLUqH2MYc5D74dyVFCgHwLAzOrAUcRroJTd68MAcZCS/V1hbZG+gCaPxeBkkpPCe
 Fzxw==
X-Gm-Message-State: AOAM531+rz45oWu1xDsxOMoOl5WC0jq/EvWzYcNON9MZA8j7PwEoSzKI
 9XIHmZjxoZ9JOXYk745unYblbwwPAOfZYA==
X-Google-Smtp-Source: ABdhPJxy2U0vY2uW++9hq2HJEMjVjHh/fVXx5wyCyQzpud6DeN7st5+YeNFV16+3sU1k2O8LzwsZgA==
X-Received: by 2002:ac2:5683:: with SMTP id 3mr6591275lfr.69.1598425879378;
 Wed, 26 Aug 2020 00:11:19 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id l133sm340210lfd.74.2020.08.26.00.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 00:11:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: tosa_lcd: Include the right header
Date: Wed, 26 Aug 2020 09:09:17 +0200
Message-Id: <20200826070917.100717-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tosa backlight LCDE driver was converted to use GPIO descriptors
in 0b0cb52bd80eda76c4b9921f5cf9c1b709d44e83
("video: backlight: tosa: Use GPIO lookup table") but
still includes <linux/gpio.h> rather than <linux/gpio/consumer.h>.
Fix it.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/tosa_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
index 113116d3585c..38765544345b 100644
--- a/drivers/video/backlight/tosa_lcd.c
+++ b/drivers/video/backlight/tosa_lcd.c
@@ -12,7 +12,7 @@
 #include <linux/spi/spi.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/lcd.h>
 #include <linux/fb.h>
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
