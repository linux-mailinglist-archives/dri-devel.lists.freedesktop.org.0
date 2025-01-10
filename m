Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30972A08E9C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F810F06B;
	Fri, 10 Jan 2025 10:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sxl1XtvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F16E10F06B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:54:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-219f8263ae0so31371115ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736506408; x=1737111208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
 b=Sxl1XtvRvWkcv0ri8DEMFqZgAier7TdNZiI7o6Raw5SzsoA2ZvKrK8AZfHBtnha8A/
 6crIl0rHl93aZGZGN/fX1fPp3IsibeMCJy6425eIopwsYRHDojRvdUu5tH6z58N/zuyi
 rQQQIXXe4hPigjV7sLAVx2vsFwnjaPOpWNocesDUbp/+2F6HB4Y031u2owsy0WmBflMI
 hawv2SGQEmLYVzSPr/m91IWMTTqhWzmVNuiZlyCcZe0dowAH4kaFH1xeBWSNEOkreGMc
 YChCmd4EWKrbHU8QXLa7Hw7uOqmcZrk5DFl23u5PUWCg7iNjpcvUD9OTiDExFYuPbKgb
 tNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736506408; x=1737111208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
 b=EhPKHZgngC/GrMU/2sZActtau25IGU6cblOoD+E2LdEc18P8pCF/rOXSv6MecF83NM
 R3hAMOpHpmnbBH2b2C9/JWxP/QQRHlurYwTytZbBqbQ6TBGd2uiD64WJQ5ktcCtDEq5n
 xq5EGNAGuYYXxoDSXEBN8FZ6iRJKfksUJSlFzmQoLooiqKkqCfGla9/1QdTxtvHGxBSB
 3AxQWSgew3q9ZVZsnyvRM+rOJhW2SAbvwSCu7TE6jJJX4N0PMMz5l7Vt+9ISo3EOc2gP
 3QuCGDMl/4D47yoxCxWUfgJtwKTTVcSCFFrPH7hYuuKXsmr7MBYmklZrCR1tZQ829BhL
 6JMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa+K/KHYIuX0ZstV9MHpJPnkDUnmlVzq9avOJ6HR5ahpXzNUeYdZl/+0ZkqV3/6+qJeV3f9wjYFHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze4o4eovsKb5Aje1m0bUWQGjWKcReeLczDs7Ms3KepRkmmnU5k
 kXHt2AWzZRXNiK+bsuSfjnYZLGD9djmG6IguMm8eIAP0SxGOrV7L
X-Gm-Gg: ASbGnct4zBumzKP4WkJ4X77rmM2/wW1VkYFxx8b6YugwIZrMHBYiLt4DSybMpZsI7wl
 79ntCJgqYZa93XyY7oeK1dW+XTjSF/mb5t7ilMLVuS9AQg7QgXO5ozOR9+LHgO77SmZ92VDzZWV
 RFwx3YC37hpkZHLyLfacfL/Kqdjj64ZZrXZ7s4q64H1ZUO99A2H3cnFB8y5z18J0gTUDbaWHEzF
 gzwphXscTohfP4lk7QyWZHi1SiuVD4j1mg5ZaOEE5HBB9zcOzlPFgRlQw==
X-Google-Smtp-Source: AGHT+IEbb2zrjQUcRpFceG3h0m+QmzccmW9rBwdvM+e9BHDcwkzyX5aRGRbjkKUMhgcXHh+nuBGACw==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id
 d2e1a72fcca58-72d21f4b05emr16485016b3a.8.1736506408063; 
 Fri, 10 Jan 2025 02:53:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 02:53:27 -0800 (PST)
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
Subject: [PATCH v5 0/3] Apple DWI backlight driver
Date: Fri, 10 Jan 2025 18:52:03 +0800
Message-ID: <20250110105304.71142-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T
nick@nick-mbp:~/Documents/m1n1$ cat e.txt
Apple DWI backlight driver

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: apple_dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1

