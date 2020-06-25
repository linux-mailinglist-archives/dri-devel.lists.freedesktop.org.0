Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50B20A8C7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 01:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB56E83B;
	Thu, 25 Jun 2020 23:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324566E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 23:25:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so8412713lji.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/U8GH1m8DUd9q5olSVa/iz++Dm4yuuKo6vIOwSDnlo8=;
 b=ZoVJ9Y/kPYLW50hpjas18gzkOPaKyuYbE5zeE4/mCVZFNq7RkdfEE7dmTs4kvJN3W6
 9bJ408YmEsLws0RqL2qRp6CLDQLS9seV7q97b8ScStSTfYdd+lDHEI/NYRaArAVS2CiG
 8AVJzJ/eDEDBCZUfWxIp5jlE+rkRJTuFxUqVADhZU0fIPyct0/dxCujyebgteYQPROcH
 ILyw8Lq4dPK7et+MIxfE4p9Rtl7NJiM9S+qzfercqNvuk6IfTC085UKwdAWLPSe4GmZV
 IBI9LGuZekoSddZrWYZekNY5FQNUgQPTRGBEg5HY6Ap5CJwPdJ2CaJ4jXAlU538EWOVP
 +SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/U8GH1m8DUd9q5olSVa/iz++Dm4yuuKo6vIOwSDnlo8=;
 b=AuoWlusp4CxrLku5TpeQjGzTaxgEXLConNimJ5gdRAneuaq2MVC8UPfeTaCstGglwG
 WCPSpGpr4v1Wr56zdTe0hHZIMcVbyAvxBNse5WNAXUyZtEZ8FPwT6Mp8IloyRA4q5oN0
 GnuelhbxfhAFyqxWl3e5GK6q6hETDN4aCPOCDss2XNjmvilLCLRWW2ki+YtFeUHFsJIi
 HOihULEkHJr+8OirzuL0WvtWYP9jMayV0lBHP18r3JygfvC5VxmpVDx8Nff2PZS7TabK
 hT/NpF15teTuS7O/LPDzfRswxu2nwEeQwpyoiC0VbHpsVzUUZ5Lr5Mja1sxXJHh9MqPI
 xKCw==
X-Gm-Message-State: AOAM533mCJ6vNOhD+aXOiHXJAIPtISxZ6l9JfDFNbswZoqx7M5z+pBDq
 UO7XSJk2Hpy1fRNPZJvFxbWhng==
X-Google-Smtp-Source: ABdhPJzIeX5iKMvpD0A56QU/7dh0qOmDzGmOc/8uvwRSuZXkVAY56YdFOjxYoweVIIEZrCFZaVBASg==
X-Received: by 2002:a2e:2414:: with SMTP id k20mr44955ljk.24.1593127516475;
 Thu, 25 Jun 2020 16:25:16 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id z11sm1572282ljh.115.2020.06.25.16.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 16:25:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: lms501kf03: Drop unused include
Date: Fri, 26 Jun 2020 01:25:12 +0200
Message-Id: <20200625232512.282178-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver includes <linux/gpio.h> but does not use any
symbols from that file, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/lms501kf03.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index 8ae32e3573c1..52d3ee6c3f7f 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -9,7 +9,6 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/gpio.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
