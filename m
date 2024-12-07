Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE89E82C8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11A410E660;
	Sat,  7 Dec 2024 23:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KRv3x5aD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB710E231
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 13:05:03 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-725abf74334so2613615b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733576703; x=1734181503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
 b=KRv3x5aD5e3LTR8VDFmTckoi7+wHZYJBQwWYbfaSCv/bUpy3jlIK9WAwfoiYfCB/Po
 vX30kMQ8ayArVSMxiHjircqbjr3HLrTup4klbN6kbI7cngROPSShUNuZrgiwqnK7w3HN
 41LgiXe1gnw8zDVErULKqioESWy1QD752h6/yrxRzDkUENqEZGpUH0E1obpuXTXJoP62
 Aohh7SBVeJpAm3sx4PhdCapxCVIb38uoml+dhqKqI+C7LCXpATdi3+bvkN0+33mD8xyv
 pRickfqJrKMgaR8C5XS/SNeKHodm1WVQtTkcPTfVElnw+sHh46QT1VzWK/ulPJ73Q+3p
 E13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733576703; x=1734181503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
 b=XxtEwQllnkWvb0zXVSDwXjndDOuEW7s4NszCkErrIe0y5feFogrOnmwfpxu4bYN7VU
 odZjG3Msz2z+U85cLHutI9FGeVARGV1GtlwiirIXx+HjVTSDqihgYdDuxVlLWUYfaai+
 0Ju3sBJRBwj/R/9WuMm844Oi0XxnU0CWIn6/N5iJjhOwrdKLl+JUqaLSEVJOH++Q2VEA
 No92egYoSQVuUchY1t6mZuu/mt1ECSZi7Ghl5c20IvaiorRn7+EUfkOftdZBgISPiIKt
 1pWlXC+mp0IoRCkyeZcobtSdkQHcIAlQDzdkc2TRVQoEMSzzu0Ubhr30ldZ3EeK1itvF
 KiJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfhNS8ah5v3sSQiQoN8OoTcYzi6KgUNkGsPwxA7Y+2JJLQXAVD8vYtwrIKDeequq3DB3ZSbpNQyvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpYTBYyB9wino3epgF5HsDpu78yogy0nlXLSdFEBtXaS1h9LSr
 ymM4RQdqtvVFSK1Tm3DNFxHALNROYOojE6GG49vQY2Imo9+VF7wV
X-Gm-Gg: ASbGnctTRMOExh+FAnyWTO8mJuYRp3RPHQ48m52kJ03Y+iJPROXOOHXG6tnWguaEDMJ
 ahqE+4gW4gQzIyR5knrafMro+WGUv9n65Zs4J3x1DfKLKglvsR3K+onQ4FQvM4udc5t+s9wMbCp
 Pz5wgNT8haPuo0VAQj5BlNcAt+1viuyIOrubHIrkx/x+D/4tFrIe+oC9nJCQW+6SGrt98hgj/9e
 FaxEp78uifejo1RdS63eMqw7ABwkr5qkKPwNB7aSPQAgUP/a7ShRMPypHoxV73jCQ==
X-Google-Smtp-Source: AGHT+IH0D/Yd8zXEABvPSshTZ5GdofWvmFimE7bz/L0Dg8+hzOe7KfKe6Ge/tMmMUKD8ETbyZzILpQ==
X-Received: by 2002:a17:902:e80b:b0:215:97c5:52b0 with SMTP id
 d9443c01a7336-21614dac17dmr93533435ad.38.1733576703350; 
 Sat, 07 Dec 2024 05:05:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 05:05:03 -0800 (PST)
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
Subject: [PATCH v2 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Sat,  7 Dec 2024 21:03:16 +0800
Message-ID: <20241207130433.30351-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

