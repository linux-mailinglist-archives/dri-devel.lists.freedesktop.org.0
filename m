Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB959ECB55
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 12:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAA110E116;
	Wed, 11 Dec 2024 11:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hBfaPjz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F367510E116
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:35:31 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-216426b0865so31166135ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733916931; x=1734521731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
 b=hBfaPjz1Hrul9jyG+1061hggnYzAF11UX9C4VG0PYsoYNvAGIE/tQ8eSJAFEjqgbgs
 R4Pfj0+EsNPPXxDptd5nM7kJjDK1+jKwhKLsud6HbaAsb6Z/fFETfJ0+xlZUHnK9+Qgo
 kZ/oRwZsZpCSXImt5c1u1Ow7fNyTMEQ6H23hS1hzuNXpcsSIPOnA3F3i+bhrc8+rYNli
 SStOQOgLkIgOt9PKNxO506gXqA22mJy7eBtJcJ6x2vgxfA1xtDBHFtYfclENwRNVtNYM
 U7LOICKAEslM76CggBrmr+1F4uQbGbSQedDuRRgSW++ZE+OSflbfsaDSrIjV6o4goj3Y
 qgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733916931; x=1734521731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
 b=IxlqzDxlrca+XmTg/475kURQROvv9tV811tQPKtgkOpangBP66U/6kbmgmyjbEJefp
 GWqNzX8/BEYhqcQXnLPWn4LoaMCjBKrnkr4RpMrvcOiexTpA85cQkQ38Y/atm4gQ0QKt
 SXPvBDJe3n+V8joigKHlGRMnhbIIJ83gO2ZgjzlnHA/0xRsQlw121lhc0qtE1LYeagXr
 +DaUcZxWgir0tBfMv//I/+cUhGxaO+kff9/StZqp3D7T1Zf6YPbj4llgTdJlnLaJRbpA
 WHzjgrwrRfh2dsZ6JjpjQ+rmeIZyjcBN8oU94NsTOkHygLNP8h0heJYPz97BbTM6CwTS
 LEIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/CKHrZaaX+wYc6ECI4Mn0NRQxXsDBGDFJIhqzaiZe8ZD0D44DD+MhD3X0cKa5+YrudfY1MD0ibW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq0Hb5IsQQsWiUeIirOXvRllOd1zMoGKkK74oCiMQrJ9r2cYqk
 7aMywnzjEdPRKjJ+v617/URm7y/YOu33qSENOhyHJb+VbwtM4Ism
X-Gm-Gg: ASbGncvn0q7RIZLPE+X9BWtfHBI73dGh4ddSYhVqHE++bFoIfa9KHCnhRVB3aJMS/xF
 0ai9k7kb2+99KD//tK2AJDmbSosKfNM6W3YmCUhjpBL1fTFnvZH5zL8EtVKsXqSYiLh/ABSx9DB
 cayW4iwvOmf33dzneei0rcdUSCuIqVlZUkvbEy0XumQ+P1ou1UBR8qCM9/FeFfbZOMhJ33JH0B5
 dFtQTEMWP23UKKGfEC256GZ9jzL0c9utPI1UmN2fAs22pHH2/KCuidomi8z3qU6XUoqGA==
X-Google-Smtp-Source: AGHT+IFh+SOIc2pSK+oc73lJ9XAuJ74bWyxa1vkuaFSPTypJbOqSoOBkbcihWmoq5jPUmTdegrgTaA==
X-Received: by 2002:a17:902:dacc:b0:215:b75f:a18d with SMTP id
 d9443c01a7336-2177839599cmr40156315ad.11.1733916931480; 
 Wed, 11 Dec 2024 03:35:31 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:35:30 -0800 (PST)
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
Subject: [PATCH v4 0/3] Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:36 +0800
Message-ID: <20241211113512.19009-1-towinchenmi@gmail.com>
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
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 122 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

