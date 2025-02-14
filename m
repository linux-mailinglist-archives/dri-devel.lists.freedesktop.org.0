Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D94A35580
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 05:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441BB10E46B;
	Fri, 14 Feb 2025 04:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Il8O7Bys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0FC10E46B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:04:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-220d601886fso20432995ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739505859; x=1740110659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
 b=Il8O7BysjeKT8fcnFXAqgVk2tHEBNK3rKOOPQxb37cnSZKqn/DUhE9WM+n5V91tcd1
 WTZxKCMFEPJXCg+21o6JdOWrEOBwT6ll0hCedEFScNwS+2BNdv0+wj2zn+lXjcixC/Ba
 9bH1eEdNS2pX5n+5f+TDlTG2RArVg1soOR5LEqweU1Xtpg5D4HHCon1Wjcnr/ISvlgJC
 wO0io8QY1ozJK8wf0jDHt4ARPNmXDWmC4LwXyY0JlQER0b2zObcnaXxtaG1OC/YmMREk
 uwbvrpobJiwLeHrOimsFpylOs/tPXuGKy3xI+/53OSvCjG/6KpZPyKxJmrHBazmZQL3M
 ipqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739505859; x=1740110659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
 b=QKiULV0DbGayA+14lXxPcs5UMRGNJZX03thdL6LyHsIH5+ZVk8Om23NL9bLeXQoUOd
 GS8BllTGZm7osKMOjrcJ9+Qkh/ZGEXMKHNqWSxvTLrI/MwYYJeqE70SUy8J6asPNOGAd
 UY/CokMdvFQRRNgsnkJxkCbNmc1A7xNKjg5ef89J0Cic0HSNYzwTemjaofxVQUnbgfgc
 DRX/qfo+NoHvIvUi4fYeffLTzTAJ/UE0ixGLzTUWVM28qavhDH7nMiPb9xX0viNb93oU
 GpNxVhRxXYOUiSGcIqUOWbuL064DVqJibLyuD0EUFA0YSFlaPSzJZQv8aMDphBOavt4L
 5gLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLrWBOFzK01mniZY+W0zXczx36qZUN7JZaM7dbp/QZXlr4hyPFoJ7y65I4sAbR+gKQ7Z29uvJ/GWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykOx8MEBsyk+5xsXm6OoOpt2eTdH1eueYSdaa7+NEWcuQSwgbw
 wlhUUICiNj1mCbL0E6P4Vxe7G4hqKQRUk7y/yrCCpFrc6rEstqSwV4uSeg==
X-Gm-Gg: ASbGncuqGfehEk/sCfrqd0xbSWCIAO0iFWXjqOzFbLq4Yhq3ZZPZ1L7sSXLTHsrkRX8
 6yfQbxFXWc3UDYcK+7kSGcyfpTwZ9AAjdKDi3GRD4iLf11I0SSGzn9DyBsarImkW4VuVJeQl6bX
 x0IqFAq2TBApPjNCYCk7Ji2UlcDXk89wJO0BQ50VYdbw7AFe5XSDPX71Dw4dNlaVaQugyF0fowe
 U3u2qG5C2m/bH+Rgswsn8bcsPQjnsRHtMoIEeUI6woZ7I/30rHXKNfzAI09zuQ3FubFtPW03lC6
 OF3DxULEYqTsuB4=
X-Google-Smtp-Source: AGHT+IHkN1crcRx1umsgU8oqxNqZWEWNVP7TrG7rSyx2t22hQspF82Y6IBy/bUusVKbjj5NHW6Qt4w==
X-Received: by 2002:a05:6300:614a:b0:1ee:1bc6:2341 with SMTP id
 adf61e73a8af0-1ee6b2fe438mr10767975637.15.1739505859444; 
 Thu, 13 Feb 2025 20:04:19 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 20:04:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Fri, 14 Feb 2025 12:02:14 +0800
Message-ID: <20250214040306.16312-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
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

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1

