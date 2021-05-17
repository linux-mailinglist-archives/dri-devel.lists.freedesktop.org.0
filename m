Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9F382919
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5C26E937;
	Mon, 17 May 2021 09:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A0F6E921
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 09:58:43 +0000 (UTC)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <juerg.haefliger@canonical.com>) id 1lia1K-0002TL-6b
 for dri-devel@lists.freedesktop.org; Mon, 17 May 2021 09:58:42 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 cs18-20020a170906dc92b02903a8adf202d6so815773ejc.23
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 02:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2mpH5FVMrjvjH8WEdGmN2JnMyMXBzqsrskS5jwEFjyI=;
 b=BdLgIiM29wIzO5IrKpctCoAp07VCd936rxdxggxGDlfPdxWstEDoAfma2/GTxvAznB
 Gr9UWWVru8TQkhA6DgUBR5X/7CyFnn277LWcJI0EJzuGy0Zs3afqjctwPbYuVPjBDAsI
 OAvMihSAPXSXKukrsdOs3hN8q3SNY4eHHbWtIOFxyf3ED1vR8wRfuNodYU8vbAOeLiqM
 FyK9n65h0EcH9sJzH8BJn7FxNVtcF/8lWk/bDXfQ1yeAiIq3ylAPXPFY8F3gIBz/bGKr
 y/hkNIwlPEnp/MoGn5GqggDD/fLU08+RKZn/4QUUgKO8KtH2dYyG1NGh1xe0QHu/4xzz
 XtOw==
X-Gm-Message-State: AOAM533ED0v4te3lf4Knq6lfqEMwYdXlngW6Yk5vhItipVk5eKs1f372
 gId/ankUbpl+c6JQ/hkaq0iNXXum2c9uP0J1E2XF3e0ZtFqvcaeceHDdG685wcbfdM7TlzhGv4t
 q+Hhe/HGB7XVRcGVTsuIssEHRVe683dz9IG3xVglHnWoPxA==
X-Received: by 2002:a17:906:8478:: with SMTP id
 hx24mr4112959ejc.490.1621245521964; 
 Mon, 17 May 2021 02:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFRG/l/G2rg1zX50CxuoToOo+lAsM6sV5pKwmdKQGRrZLr8YNgrn4AfOtYJKORD+xj1Qs8MA==
X-Received: by 2002:a17:906:8478:: with SMTP id
 hx24mr4112949ejc.490.1621245521826; 
 Mon, 17 May 2021 02:58:41 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id i20sm4883813edr.94.2021.05.17.02.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 02:58:41 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] backlight: Remove leading spaces in Kconfig
Date: Mon, 17 May 2021 11:58:39 +0200
Message-Id: <20210517095839.81833-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
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
Cc: juergh@canonical.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove leading spaces before tabs in Kconfig file(s) by running the
following command:

  $ find drivers/video/backlight -name 'Kconfig*' | \
    xargs sed -r -i 's/^[ ]+\t/\t/'

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 drivers/video/backlight/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b902c1..a967974f6cd6 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -129,11 +129,11 @@ config LCD_HX8357
 	  driver.
 
   config LCD_OTM3225A
-  	tristate "ORISE Technology OTM3225A support"
-  	depends on SPI
-  	help
-  	  If you have a panel based on the OTM3225A controller
-  	  chip then say y to include a driver for it.
+	tristate "ORISE Technology OTM3225A support"
+	depends on SPI
+	help
+	  If you have a panel based on the OTM3225A controller
+	  chip then say y to include a driver for it.
 
 endif # LCD_CLASS_DEVICE
 
-- 
2.27.0

