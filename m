Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A2388C49
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1E06ED13;
	Wed, 19 May 2021 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97E46ED13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:03:17 +0000 (UTC)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <juerg.haefliger@canonical.com>) id 1ljJyu-0001DW-2v
 for dri-devel@lists.freedesktop.org; Wed, 19 May 2021 11:03:16 +0000
Received: by mail-wr1-f70.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso6985761wrc.23
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwXLnF7rWDVcwlt7Q5T7XhtjUkElmGn6H/9Zlr+sBJo=;
 b=aO913g71y2BR/ir+b40gOwi9HPyEcM9kzsth2w/GdMoHjlycE/9Sq/oyaeQka0h1yK
 7nPzeVH1nvtWiq7RaSbKQvYb1jU/YhiJ47dlJ9SoJR3VxKQUViDC1Cm/tVScrdBBEkEZ
 F/zS400alOjCQkEqBW8W0dhL2xOxNQVckhnmtBTM0bz+d8dsYc140hxv0RBYjdswzRBo
 J1Qe5Lqm/OPxIWQmAm0eqqnJbdEJgjtEQV06SGKDxrX3o4QpXTFRzj9DfoWt1I82eZRb
 JI5UeMMYf3s0m7YCW0+daVnY9zeX378Y3SSni3sgGVr7IOUJHZqMLd0irY9W6yh6vkjp
 DpSw==
X-Gm-Message-State: AOAM531LO58s/xNyqT9cYKTvCihWfwmzYPa1aRlbepRaslo4MdHOHqsF
 SERE9GF9SDYN8m92mMuXs5Mxk7B/sB3kpdDEgtiO1fXG3YlewGQuWQcN25c4PnoRosXF56Qftf7
 /zqgefr3zUYhdNlFgCjpYTBmnPHurE7ha3yXRB7jKqJ6cYg==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr13878358wrx.82.1621422195792; 
 Wed, 19 May 2021 04:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6tC845fEuilnb4EmT7sQDtVzUIm15hK+X9ZytOkjmm3/ZcdO7CqysCBMbe2jUpyaFX/npoQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr13878336wrx.82.1621422195616; 
 Wed, 19 May 2021 04:03:15 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id r5sm23682357wmh.23.2021.05.19.04.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 04:03:15 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v2] backlight: Kconfig whitespace and indentation cleanups
Date: Wed, 19 May 2021 13:03:00 +0200
Message-Id: <20210519110300.17918-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210517095839.81833-1-juergh@canonical.com>
References: <20210517095839.81833-1-juergh@canonical.com>
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove leading whitespaces, replace multi spaces with tabs, and fix help
text indentation.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 drivers/video/backlight/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b902c1..c887338de386 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -128,12 +128,12 @@ config LCD_HX8357
 	  If you have a HX-8357 LCD panel, say Y to enable its LCD control
 	  driver.
 
-  config LCD_OTM3225A
-  	tristate "ORISE Technology OTM3225A support"
-  	depends on SPI
-  	help
-  	  If you have a panel based on the OTM3225A controller
-  	  chip then say y to include a driver for it.
+config LCD_OTM3225A
+	tristate "ORISE Technology OTM3225A support"
+	depends on SPI
+	help
+	  If you have a panel based on the OTM3225A controller
+	  chip then say y to include a driver for it.
 
 endif # LCD_CLASS_DEVICE
 
@@ -269,11 +269,11 @@ config BACKLIGHT_MAX8925
 	  WLED output, say Y here to enable this driver.
 
 config BACKLIGHT_APPLE
-       tristate "Apple Backlight Driver"
-       depends on X86 && ACPI
-       help
-	 If you have an Intel-based Apple say Y to enable a driver for its
-	 backlight.
+	tristate "Apple Backlight Driver"
+	depends on X86 && ACPI
+	help
+	  If you have an Intel-based Apple say Y to enable a driver for its
+	  backlight.
 
 config BACKLIGHT_TOSA
 	tristate "Sharp SL-6000 Backlight Driver"
-- 
2.27.0

