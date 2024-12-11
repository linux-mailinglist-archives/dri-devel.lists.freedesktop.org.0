Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B89ECB5E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 12:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD410E1C3;
	Wed, 11 Dec 2024 11:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MCttHs3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84810E1C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:35:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21649a7bcdcso32754735ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733916945; x=1734521745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
 b=MCttHs3qqjzeNhv4xbRTeb/VZ4MRo4rAFXVJPHqJYktS76oAy5g70AD1Y9yoCm+gVk
 5Fdp2kBQ+WKybt/VSQs3zubaQzkoXJnmdhQDLewfh40XxvPuCCaIQ9SIlJLLOzSBKPPV
 6PRGWgQPPg5JWQ1sF7LhAY0tvF4rG3dtKwsyDE0biHbyDvaDTa+KS0Q9EUr/sMUAbaRq
 161tASQmJd9NHKTR39KtbWpDWNuNBSwv2LRhXC3QSxLPMaCFZD4GuV6CM89LOgWWuxYR
 bTryKaawRze9/ft87dA8HVTb4W5LHNL/aVTdJT/jPwEgGgVuVmSCq+w1mZ+wmUys4IS6
 +D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733916945; x=1734521745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
 b=Gf6vfKMIA6F3C9HWM4SpIjeGz7Ot+d1oRFSf0JK1yCZlwr89W2/GzFyKA4Oq+Avf1A
 0FtuIljWt9UFFN0g0RlNTtUMxAFJZbsP3RyD9ZUYUGGvM+Y/b065FBtqnCNbv0Rfxsij
 AqZpZ9kEb9za/bdVHYrtkML3Z5t0GYU2GbXDkrNnqXi6j7iVqquzK56fx2Y+nBv8l/1r
 xMuugZXT/NRanyEzRengDmYAuDx/uAlOdsgQ3cgeGTejwm6buViRhKFgpPy88kGe/wtb
 1AS5r3oOEypjoXH7aRe6o/j9j/3otxsOQzc4qeL/A1fYnA5d7WIvPrMBHIQ0xfyYD17a
 j/+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaav8zMkpC5Yrl+/p/TV147UlC4V2hqLK39/Lagf+packKl++h/Cfri7BDV4u2yKicSIzvu/1HwsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK05bTHP0HNa5zNoXVxrKugGm0KpHU0iAvDBDwFkfG7pnSAbM+
 UEOcsyDW2VN7gXDwW9UtdynjxHAyXsdQUbqWL1bJfZLJ/cdY68dq
X-Gm-Gg: ASbGncuRi8nBgKH+ZbrlUbOqNe+FxrogmOegvYeLk0igA2PeSMuTlebEUei1mFTkaKJ
 FSprpYzwUSp51KXO1So1kg5LtOSWGu/qP8kNGvLZ7a89/dJ/WImEFO16Our5+36YpQ5wBYI51yd
 gq7TWzZ0Me8bvICPqNyVw+w1QKSoeq9mwAIkJVWso+OfrnLG/YxFRGfWFrYX5twHkoNfaWn82hz
 0TJvQhLmaJKIcYEBhyLmD+yOVSnA/Jal5WT3uXMPq68iTZ286e/dcAmWYlOlWNmyyahOQ==
X-Google-Smtp-Source: AGHT+IHPAoO6sweD7dzjHfcotRsgZIyMZdFaVq66RcEqv2cWXKrGq8y5aDUwVllnUENLHzeU5YMTvg==
X-Received: by 2002:a17:902:d2c5:b0:216:2f91:92c7 with SMTP id
 d9443c01a7336-21778393b92mr49397375ad.12.1733916944690; 
 Wed, 11 Dec 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:35:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Wed, 11 Dec 2024 19:34:39 +0800
Message-ID: <20241211113512.19009-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
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
index 17daa9ee9384..3a7dec3f9a5a 100644
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

