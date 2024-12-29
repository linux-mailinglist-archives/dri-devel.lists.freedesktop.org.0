Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0C9FDEC5
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 12:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9633510E29D;
	Sun, 29 Dec 2024 11:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ba7eMo1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD0E10E29C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 11:15:05 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21661be2c2dso96513225ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 03:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735470845; x=1736075645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
 b=ba7eMo1z4bKw8h5Q+eLayhuDOl86jjZ3+D/7A93wyJOIWJoPfRGi26EnAihP3bvNim
 MgkTYxzxSy20rhiTmLu/5oTPVQRKGYib0RodKUEBsQIoWtW7pWirrVG+sZqFEiJWQ1/X
 fh8UHB/KWyazeZi82+hv3SBJu7VszyKwuEJxzVXmY4XHt5rFxhHUSvZwww0ctMH8jZsT
 QSO+0ccnnh1LGs4NgBTyIxjpUch32/3mmUaLq1EoJkK2bL6ZWbOUaFfbSUkyVHW6ta3c
 5xChLgsbq0mtQUGCg2KJkfvYL/Cd11y920aNyI5TGBHCngUo+63rJIRa8zKTJCrt0C4o
 nf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735470845; x=1736075645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
 b=Bp15KFZu11ITDxCkw/bqluJ1nLCiF82SqoUCSzjXw60WxB+HkGJ9yefDDyiZPat2Ux
 UjI0IKzf2xVDg6CQOC1cj9JArbWlRi0Z0IZ5h4dSbtGtt+Cggak+Z2S1WcVxvoQ2hHS8
 Hf2FsXxYFghW/9xr0x8c9+PJsCoZt4/1LFytS0QS4ijy3bbO3js3e0HFz/ubMqFk77KI
 0IV+ZEpO/4ofOc3wzDi1/HItnsMTtHjdJBJnOv7iEaPvGR0jWhMEK4KfPKKtbV3VhsF2
 u5uWEJV53S44DuQSlTYGV93zD1DCtyVDGp6DrujQ9EHN+Oou6AKmcy7rm+Sxg2i02aPC
 MEPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1zBKfHy/5+KU1MvZ0v9MkCUbJawM0OeVSmnXc/vMZRf4s8sdIR+lduEcxBJidPbPwuk0vkiLtsKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2GsDfrIAX6L2EBoh6rp6E9d5ZxVhksq8ieaSzvizJ5nBD3nau
 AhEm1PKZfqn3wyzjQbG/oqM42y/bbsVnVM8a5ZIcsYVmzyZW1QRe
X-Gm-Gg: ASbGnctjiRbUp1N+sFAbxZmzo0inUPc4kTc+/Ajgq1uqpz9HKcy3fFoP0ksju38hSNQ
 v+72j3P7a+oRpGeWqjipQCIbMMdr7pFhp7FYJPL7nAYCSoE8eDyzvBlc0BkFpqBSorbjjSH6YWu
 mjNz7ab0Xu4824/0qtYhvkUsGVGx1dyuZF9x33A5oI1b3hA5NAnpIaS7PDodGWaM78JEURqKi1G
 LugGUNqg68rLWmaza1IUx3A8LJ+9umRSODpL9tdTZ+kozUi9WU5n4BpcQ==
X-Google-Smtp-Source: AGHT+IFC1QZJfqXlyjwwxcIAnkfum3t6MQ+L3yuYAABJDnspWgtVfFsqagRUXkgAgDc1Jy7GWtwr8g==
X-Received: by 2002:a17:902:d48f:b0:212:4aec:f646 with SMTP id
 d9443c01a7336-219e6ec1340mr390222995ad.33.1735470845437; 
 Sun, 29 Dec 2024 03:14:05 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2024 03:14:05 -0800 (PST)
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
Subject: [PATCH v4 RESEND 0/3] Apple DWI backlight driver
Date: Sun, 29 Dec 2024 19:11:16 +0800
Message-ID: <20241229111322.4139-1-towinchenmi@gmail.com>
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


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1

