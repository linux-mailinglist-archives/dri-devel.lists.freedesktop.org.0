Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978C9E8CC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0CD10E499;
	Mon,  9 Dec 2024 07:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lP0WzCD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457E010E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:59:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21145812538so34152735ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733731182; x=1734335982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
 b=lP0WzCD5h7Ub2mI58+IpW+wQLvbatIMiRfvqrMR2DvJs97vbmwNaMMmQ04/zDUjG3O
 kM8nTv38PTcx989XQ44bHYlo8JVf+EoJzLRo1QokiyNJv3CWiKS19N5RVXCc4nstj1fx
 7kda7w3SHHZTD+MIP4Z72KakTmmnJR0JuBGuxogn4bM/JWWIzs/IH0DrE3BFX/GvGH/o
 gTfHcR1rbDsMbjhZD0qVSVxUjsEGJXhmHdBheDMz8S/6oReuSHfzzOAFXN/39GslR7Y/
 hc/wuCXrJ8NrVbUfS2RlIFwDViXE1AvUyn14UhSHnxfO6bG7xVaXV07pddEeLObRt50a
 B/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733731182; x=1734335982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
 b=SwTwmP59gZp/r5lcWTRDSv2pRiiX8jh1NHmNnIiAR1G0YRHCJQPyDZ4FbA/G5AXVLk
 ygPSOgB10JRvow2g/wuLHrQmB3B5BrRZ30LvWaS4gt6oR61msEyVpkSqGksiA52lH4Fc
 T/3Zjg9IRKR11W94HNtunRYOH6YKhXGU5OjhQBXESkXy5el3fWXf/3LsKLzMztOyO5x6
 JiSLDPYytlfQZLMsPhMs22qZsFqsq6HcyVxn284XnL5yJCfn6GKG/iZZwtYtLY18MsQH
 daTk7AkWOR2KqQqOUMUQ8B9U9+f5SETArNIQPYI/M+VK93Y4kdsRQkkG47jvB5SzGDh5
 HPeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPU9MJasb+uxxJojUXKB2q8SZ5/K+vJJGO58vwWiM3CXN0tXpKS55ApityeLYV98khkLb3+dEcQ8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUuGUyDIwg/AtLwIEq5r7jT/0fzq9YW5s4RHdKJcmxkBTkprpc
 ZBWOYBb24SZdy4O0tAZH33YIgt/jeZvUJFklHpZbf+y0crvKz9rENR5+lQ==
X-Gm-Gg: ASbGncssRHLSMyJxAlRiBczFuQLX468lzNPnDN+z83TMk7ZCWesBcaScoD/0AM0C/sR
 xn0Zk+OKf1TT086imj8i0zFY5AJcFg+Wiwbasa4rst60F0tcmCGFVCMQkWtojVD9Yrbzrey1uZ4
 MzDHySirADZCZNjSWG0bd2ProxhHTUObVz3+PoCfMcj8omYDRosFIswKvnV2pwVSvbtizpRI+OE
 61J2crwTdB+UjqVVICXSasMDSXHJjU3LG6eyKG4WCJK48kFXciPrJW3FLy1Gt+0Ww==
X-Google-Smtp-Source: AGHT+IFLVJdXcJEMtQbEGzS9QEogjBccTI97+be9Pi/cjDczopusFs1mLg5QF1GGPSTJZ9o91Yk57Q==
X-Received: by 2002:a17:902:d4ca:b0:215:3fb9:5201 with SMTP id
 d9443c01a7336-21614dd1b11mr167697985ad.44.1733731181698; 
 Sun, 08 Dec 2024 23:59:41 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 23:59:41 -0800 (PST)
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
Subject: [PATCH v3 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Mon,  9 Dec 2024 15:58:35 +0800
Message-ID: <20241209075908.140014-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
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

