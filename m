Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B201A9FDEC8
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 12:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BFC10E2A8;
	Sun, 29 Dec 2024 11:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DdrNGdRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6C810E29F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 11:15:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso107668125ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735470857; x=1736075657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
 b=DdrNGdRGuO07vA03/gqq0MQxyZBfAY5irWjW99IwxctfhXnPfX+l7fYPtRCFBCnsam
 NZFHMngBBLOzpZPh1POHAV4szt9oyEy+Fdi/35W+htNljcum6VoKknTVZ2OWvjv1jqrb
 s8XYLvBz2BbP690tVlakvamigu3ijsHVN2vSltqykgI7fcdSA5bSDw2cUNI5pkjkU+kb
 ADA+KIKXxb9Abmtui6K2Ts2MHAZTleo2PqBdpHCtvqUxM/EFe5CHFXLjEBKscQVohzSJ
 5szlLSQN/Rs4PcroOfYwIZfvXDuoqkyrWug42D1Ve74gzJ2zJIzsWMmLqJCWPy1alDH8
 JVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735470857; x=1736075657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
 b=thMhWjfidVsYJ2WCMZeEYQ6WHc7QP3Vn3Xw+9jjuAuAwMfoN+xHhormB8cChQo3ibW
 d4+SZ9sPczHfdrYW4eUkivynPVMpZMXZBF+6+qsfnS6odLwmdp2mDCpHhz/YgKzPTCAH
 BPEb6Q3w+UQxSfC0NMLWI1oEsJ4qMpMZkbHLXk1Ed74jmRkBe8iVyzmDNxZwjHIfhM/b
 mqWkwjdWz5nRZa8cRgmo3DaHf9NAu6U/dO4W3ORWiZNgq9EBq9sSYh7omssMpcDH4Ubf
 8nx1RMLeJ8fl6VHoEfhYTaBdX6cpawOc69o7mXG/bM7qF7R8XzZ8bkeLzuwaY+5L8pkb
 XQWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMBaXsAyW10Xgw56YJ5935srtZpddwGXWtPV20KlJUNgDgh/D7ZiMkITXVBW9vl8TbmxM9vHA7doc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUh15gtOlV9tfVc0Q2Q0prlVoqXTpDd6UqQF+9USico94KRZlE
 cExMWRCjQSIcrbi5qfGMZ8pS83bWBGgCNp47QnSrT9nwttpMamEE
X-Gm-Gg: ASbGncurr5PfMlG5PNxq+tU6MOzQgo8fiPUd6nFB86nlBmexZfjdKI9Z3+12wXQxf4w
 nbw6sB0WxmqZJ0JtXcJBZFVYex1Rg9kR+lJTZOrD0HO9d2YW2r06TSlCnzx/Em6mJ2FMHlkgdSb
 TinS7W22vGhUeoW5PbEgpghYRj2jeYzlN5FYX14PWtfP2PpFxK1J69qnoLa50SAoyhFKHHDHDRF
 Defp5PAdk0ZIqbQkc1WJ6vOLO7eF/U8RiuopYXzvVMSK1i6dV5bMIvBWg==
X-Google-Smtp-Source: AGHT+IHj1y3F1X3HGHzS3Px3LuQKUEyT2NVI7IfSKzHwkiIrQ3sJyJpJf3UtrIia+cnNqjNTX6LRiw==
X-Received: by 2002:a17:902:c412:b0:216:4972:f8e0 with SMTP id
 d9443c01a7336-219e6f2ffb4mr459732985ad.44.1735470857377; 
 Sun, 29 Dec 2024 03:14:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2024 03:14:16 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v4 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI
 backlight controller
Date: Sun, 29 Dec 2024 19:11:19 +0800
Message-ID: <20241229111322.4139-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
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

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..54a6c8ca7017 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1

