Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E771AA00D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6DB6E9C3;
	Wed, 15 Apr 2020 12:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15796E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:26:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h25so3413800lja.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkmmiF1XQ2RsXcgInA6IwLSuuiFHluAPXsS2Oe/IWDE=;
 b=u/1ndgfJrMrT+7oxzJUoB3LMRfaTpL/yt5Il3j37hI1RQMkiFRxref6uRk6DmeZ3MP
 hsX4Ml098bL/1oKRvw+OPWcZVFFThKTOOxqd+8+H+MO4HXW1eWvD9tysEYKAkqPG7GCD
 7A7J/Q7JcGi1C1MhUH5C54SgW4VGpafTg94MwUKWaFnkse+EF0geLlpCvvcyIN21Aymk
 xnYI1Yhwrke37XIZLyrDoimLZNMHXiDL0Rec+uxfppl15QfTZ1BAfksU8tTf4Mo4ISE3
 vBLxaN0rXIp6aXGXnlCEcK3+7gjXuK4+f9ifDVWSAr9rxdSL8sKc7Vekt+fZsa959zjz
 OiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkmmiF1XQ2RsXcgInA6IwLSuuiFHluAPXsS2Oe/IWDE=;
 b=rTBCkA/+ZXroGvLZczIibnRYHO+aDnv0TeeLXiNqd8zzOuv58hHAnZAaNExo33tCez
 lo0aOLHWFWV9x6T5ObaP1HwjZ9RFUqeiW41lOW7H2bfQOINhUoGtFl5Snx7R3ab9IrIL
 Jaoz/b/p/UMmG9Az1DpdN2j7cAlc2pMLbVN+o6yzyz7VQ9t3LM7Zouo2exNecbpJ6s2D
 rv+7jWnkrYBpvBhMG8hQDWUF521wdBd5rglfOPlaKpgJF8B9IYLG9GA7yQcnf71kfIxU
 s0VWpdJM+IBPVNcoxakPAoOI064dOkJLxUBqUvTTs3nkaspBq1k+2BTNRqW32v7tcYdy
 7qAw==
X-Gm-Message-State: AGi0PubJRoMKDDwOO4ufokaP8hA8bXvFonJoq86sErr30FG9qUOH4Zm8
 coxHVpfkLfYkaXevgRmGF83Ntg==
X-Google-Smtp-Source: APiQypJFe7/3fHo/ERXXbzUML0AuJEny/et3ctB8MUPLhBr9ZgLHW/E0Mkl1bDVqEghMR2GdKdietA==
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr3075775lja.2.1586953589348;
 Wed, 15 Apr 2020 05:26:29 -0700 (PDT)
Received: from localhost.localdomain
 (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
 by smtp.gmail.com with ESMTPSA id n9sm11248038ljo.89.2020.04.15.05.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 05:26:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Clean up GPIO includes
Date: Wed, 15 Apr 2020 14:24:27 +0200
Message-Id: <20200415122427.111769-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra DRM drivers includes the legacy GPIO headers
<linux/gpio.h> and <linux/of_gpio.h> but what it really
uses is <linux/gpio/consumer.h> since only gpio_desc
structs are ever referenced.

Include the right header on the top level tegra/drm.h
file and drop all the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 2 --
 drivers/gpu/drm/tegra/drm.h   | 2 +-
 drivers/gpu/drm/tegra/hdmi.c  | 1 -
 drivers/gpu/drm/tegra/sor.c   | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7dfb50f65067..105fb9cdbb3b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -5,12 +5,10 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..bf0512177e8f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -9,7 +9,7 @@
 
 #include <linux/host1x.h>
 #include <linux/iova.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 38252c0f068d..94fb0193fa3d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/hdmi.h>
 #include <linux/math64.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..b010826e86da 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
-#include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
