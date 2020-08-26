Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914E252830
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 09:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC216E02B;
	Wed, 26 Aug 2020 07:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723B6E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 07:07:44 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k10so399216lfm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qXL8gygdnMg5VKmmqN6MtSkkkB5ZO4hraaNLgbL94m4=;
 b=QXUjf93Kfw2QimpyyrnLF8Hd2fbVTuBrdYxYJ16VI1OVxukeuBv+AiGCij6xw5FxVa
 CLFCePukqYqGgJJQAFnirWAbXs/N6I4+fJx2hq5rI7gik5Pm8knvCN8A09GX8Ynhntp0
 pf2mvKOdBAxbVmvS9lH4wT4lq2bYmzxpplZ4oie2uXiAed2J64YOR98pCqT8MNiM5I6w
 +uN4KX6AtNxJNP3I2L0RUJRSdGv7e86qisjhv9HIJTl/hNZ2MDV8lJ4AgjU833BBbySC
 4qNwxSXdLqEpEIXYS00retWdZQhYrNya6KUPnyti8qlRUoszxE/qSBUSXfFqjT8sPWjJ
 AuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qXL8gygdnMg5VKmmqN6MtSkkkB5ZO4hraaNLgbL94m4=;
 b=ZlRnLMVnaXwWvf1qWEPcKzHls8o8DC+LYkIP0UmsNHibRT/X53xhlqOK3qFajV01ne
 VXL9fVdlyjWamWZbb4yjfyQNQxI7Ctplk6OUqzNTnIA5EJxnIywIzj8j3+raPfmSrSwG
 YWlXSW9qCYndfaYXomVdCcED9FP01fw+quT7te190klEFzPMOCgNXu+GSec10c0DDC+Q
 /w8HQHNsQMtftkLZEp0euw9k1PwpxP9+lYb/mS3G/ZqUokvNZDv9K0XJWxJVinyvUcl8
 4b9+h4HyXakBztIFL40goJsw+Gl8TCvOsTniMpVvv+DalJiLUyPzda0dl+yx3HsFaYvZ
 l2XQ==
X-Gm-Message-State: AOAM532aFcVjIoWCCGifTuwd9LvBhP4yNT70fel2p7GnTVi4fUFU927Q
 gQ1dCcmzGFjn/LLmyoqE21sZ7Q==
X-Google-Smtp-Source: ABdhPJw+9HkIAWcODFRI8zbw0EmFs0uuY/SRrffh9oYIUgh/oQ2AwiZBge4i29tA9muIA+E8cJf6dg==
X-Received: by 2002:ac2:55b4:: with SMTP id y20mr4689293lfg.103.1598425662953; 
 Wed, 26 Aug 2020 00:07:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id b1sm303317ljo.15.2020.08.26.00.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 00:07:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: tosa_bl: Include the right header
Date: Wed, 26 Aug 2020 09:05:40 +0200
Message-Id: <20200826070540.100158-1-linus.walleij@linaro.org>
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

The Tosa backlight driver was converted to use GPIO descriptors
in 0b0cb52bd80eda76c4b9921f5cf9c1b709d44e83
("video: backlight: tosa: Use GPIO lookup table") but
still includes <linux/gpio.h> rather than <linux/gpio/consumer.h>.
Fix it.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/tosa_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/tosa_bl.c
index cff5e96fd988..6df6fcd132e3 100644
--- a/drivers/video/backlight/tosa_bl.c
+++ b/drivers/video/backlight/tosa_bl.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/spi/spi.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
