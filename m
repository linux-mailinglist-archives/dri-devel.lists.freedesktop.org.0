Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30B744CE6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 11:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94D610E02F;
	Sun,  2 Jul 2023 09:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD5E10E07E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 08:00:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fba5a8af2cso33491235e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688284804; x=1690876804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAUhZCQsdk87kgdWEBUppph6/yxmaqqjG5LD2yozjmE=;
 b=LBRWF0qTQR1vdSojoeWP1/KHAKjxNGrEGOta35tbFekBwztv59f6JpjhB+swxUm03M
 uHYwSjcfeVZtjnG6peUR4eiZyK7foW8X8L2CF2rXFWKMoVjI120mABOGo2+Mi+zAMOqh
 ibiYMjp6XuoG02OvryQ8zxR5J/2+vvCATS69eOt3IQ2bQuNn4Y0PsfHoOUXiD9t3Q8u3
 8CTAQuItiUyFQVWHmevHWJ3bnWdgig+MdazSHOc3Vriu24pE+6Wj2ZX82nkOR6anjNGX
 Ng/aO+61ZqZby1IcBbTTHSPHEcQR382kW760yL9mqRuieCpmpWebiymU9urthu4IHxQh
 eoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688284804; x=1690876804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAUhZCQsdk87kgdWEBUppph6/yxmaqqjG5LD2yozjmE=;
 b=detbEbtOtB2JnKF5DYrE7qoiGTD6oTz8UMjfQ0T3n1dXFNppgg2fGkt9IfcK5wy/Br
 aJGpSUGkN7HIzru7XH1+bzp6MmnrKFnE8KnjFI2twrBCUsIc4sRXvOWoO83//OgjH9ZB
 y5QSz1ADWu+E/bw1UPhcjhqS5P2ipI/dEnYAaSV890MgR/SXAVZ5YQjvLwL4gphvYNaf
 6qCYauk5PZ5/7PTLr6rXuDm/hxc3PK4Wgga5WElMxdvy/TTmHozdh8UWwBsx+O42cQTp
 PyBlT+ZlGJofiItETrS52iPoO4SedYgXukuuvs+PgOEaJfyX5Eaf+MLOKeyXcpG4fmLC
 eZmw==
X-Gm-Message-State: AC+VfDy4u/SKw3GSaMzvA2iLPFxrd4lFpNfgGD6CPPz8DLoQ8K0HZlNT
 tAKdmfNi9PWoin8F5aq4UDU=
X-Google-Smtp-Source: ACHHUZ51p/7W85vZ05OKRDLNDDfo8EshPrLib7+JwjGfEjbu9EJG3gx3IjKjhfuy4GzOOT5vGJX+lQ==
X-Received: by 2002:a1c:750a:0:b0:3f5:878:c0c2 with SMTP id
 o10-20020a1c750a000000b003f50878c0c2mr4895518wmc.3.1688284803762; 
 Sun, 02 Jul 2023 01:00:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm22710943wrb.84.2023.07.02.01.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 01:00:03 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Sun,  2 Jul 2023 10:03:24 +0200
Message-ID: <20230702080324.120137-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jul 2023 09:16:23 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes the module to an early exit at probe time.
In addition the MODULE_ALIASes can be dropped.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/staging/fbtft/fb_ili9341.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab..9528bf3cf711 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,12 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
-
-MODULE_ALIAS("spi:" DRVNAME);
-MODULE_ALIAS("platform:" DRVNAME);
-MODULE_ALIAS("spi:ili9341");
-MODULE_ALIAS("platform:ili9341");
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_DESCRIPTION("FB driver for the ILI9341 LCD display controller");
 MODULE_AUTHOR("Christian Vogelgsang");
-- 
2.41.0

