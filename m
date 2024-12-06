Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7869B9E7936
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9C610E621;
	Fri,  6 Dec 2024 19:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LATobqYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4762910F143
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:28:20 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-21577f65bdeso19798045ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733506100; x=1734110900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
 b=LATobqYUaeXb9xl6Bpyon9vBSPH6do/9npFiTwm7k2pkVyhMwcgew0UtVIOqaqnNJS
 C29nxvoaCqbnofLzJKvz5BFyg2+1OX4owUqrztyhCWWhqCnosP+EV1Oeyf2HoXCWQxCp
 bP3c/FfG/ezfVpLf8AuZ2aetPVblBppRBlYj3Ta+xQB1XdIZ47SiivEoDieh2esoBPGo
 kXj010OQDSnuaKcfnKOKIBjFpEkeqTmfDo0fxYs6k9T+RzE04IvpMWLJqxalse3LYc3D
 5GiZBL74F1NEEA/1MWZg/YnaD7Lkqf50aYosj+EPH0NMSqfnEVO15s82W8V5j/jMB5yl
 F/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733506100; x=1734110900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
 b=JvJBq6yqVQyfV/S0Tyu3pgloMI5VBC+j6AOqE+Bs6A3SDi4Zw95IBDkWQCmQRoq16o
 /nB8Z3SKT7QR0JmH+wxrg3ez32FcSchEXgZcj6PAKZvftD03JyltxpEdk07fC3KNAmUa
 YPJM9sWyekSKQJMECbGvntmQVYfTdlmB1HAGvb+M1d2SGCgCcYlxMhnBw9+vYUOweRTy
 cQNnsWxyoc9EQ9gTcah7Wvpyy6QlcY+AWXmFvaqdp9oBr10mNTOTANFAS25wWO+o0DcU
 CJIvhslTb3iNZE9oxCtuONRFhTjObnbYiTpjkim+huYYRd9Vzrud+WTklAIk9tZWgoaM
 xkXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ0d5IRLa6JBpTY+0HrUk0cdKCENEkryfdprZ1p527lWPYAyKnDQXUqP28TUgMFxawdahup5GiWMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFR4q4NLIB5kD890zf3gF2DsLfa7iQrxUuxQz+M+7WPrXjjuyW
 6+8/09L8sY5kGHf3/RBDe3QqHVwpXkskFCPObdRA2ScDgGjaJ0xH4zcO5A==
X-Gm-Gg: ASbGncsXA1bEeW2x+0dJYM3y9iI5YJfFgMeNfADckGM+BbTUL0XyGQSfJ5XgND7rbxX
 SnPGGjkK358/r+kDqsEekQvR8BOn1z1J6lfBaL+N8Pgj+EGWzYirH+qiec6Wg5O4TJqG7P6zsCf
 +7oRB2sgg+D8gFhj4oAsLUhkxFk+oo2z3qOMIGYcuPej0QCJ6d0YQj1D/sC3+9M/PnYMJC39RBf
 wGlEGC8XnYG9GRmM2uVv/xr7ICF5SgdQ8ZlkJ25J3DK8eYG+v4XUJZu3H3yArkh
X-Google-Smtp-Source: AGHT+IEVb+55XJwsVSf3sPuxfD1Q4oPqF1cheGO9d/Bp3KK/wuSlgII2poZhwuZv0OaHB03V7/rOhA==
X-Received: by 2002:a17:902:e3cd:b0:216:11cf:7b1 with SMTP id
 d9443c01a7336-21611cf2958mr46087885ad.15.1733506099695; 
 Fri, 06 Dec 2024 09:28:19 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 09:28:19 -0800 (PST)
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
Subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Sat,  7 Dec 2024 01:24:35 +0800
Message-ID: <20241206172735.4310-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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
index 1e930c7a58b1..36de76bc6fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2204,6 +2204,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
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

