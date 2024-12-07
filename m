Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6749E82BE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622AC10E30E;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CG2ex0ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1EE10E231
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 13:04:52 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-215909152c5so34014615ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733576692; x=1734181492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
 b=CG2ex0ug11vOCqRQSVhDN4sahYkDeZiHuJ94mDqVuK5iih3opGqEMkYHAAGTRZQS2J
 o7ePylSLhiL7uC8mkbCgEYvWwcsoVWEhp6U1Pks/isFkOk+Yj2LCe1g0bxHrYA/FIXJL
 9lEl7aFFxFogbnoiprVS3XoS7vaOjt9UzOJDqi+xeOk4akkAqtKz61SsKYqcxtxKtrb5
 2e4g5wjXbWPy4TLyraXcePzSuayNow4rTj6kYfpRbkQQtR0xBV1tBx5ZEcHbRhNHsUyl
 sCu4YxjkqAYjf5HdY5FKS3lQet/XxJgL+3axm0AxwnHd9Q8e1MpN3eCpN3BJaYKFAHLX
 3wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733576692; x=1734181492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
 b=MbiTmDNuh0R38cYWtOw1s3X88JT07/0Lq0xh/zBcNp7r/0cwq8/0fthUKab2oNxa7i
 UP5nhSAwmyrkJf+qb/O7MFgh8zVyq4vVSQCwfUE58t30USDIluXEYfpH+pA91PtZl8rO
 tgXdmpLwPN8T+AYiHUUjSbxisQnTG185hIFuT3fzTfJEpGGnrHKcM8yMKLQ4+DUDD8Vh
 Lavs2tf0ScLc8wgSrgOxwsUpD0hGx6Jc2QdjLyo4WUAr3isWmTBfJcHvBAYxnyLq8znI
 TOkvsx0Uh2mWiH0Uz4DM+fxGYAf2PmVBYM5KheDLUMpLotwup8RKZPsmFBJgHfta6R9u
 TdgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrPYhOtzC2/sUddxED3pFwOGi1L0xGHGRlUMs3SfhuX2UKEdB8/0mEcU7mGaOJxBed0fUCeTu16/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMqeYfhx5MzYas8LNW7a8W/Ee39vqulsdVkvpOoVtbAq2HkS9Y
 g0f2SAd61Wp/Rlsfz+jm2md17fyeIijBvX6kIi4cyVjZNIHlh3Xa
X-Gm-Gg: ASbGncun0/GsExqPYeDrOQQsa2oPITSBdTwITmjGyKIbR+rcQMCKmXxpEDNfJj01A1z
 rMfG1cOVlJsnvDuXAfEZ5XRpk5SEY2jrpc4AEAEokSUJr1mTiwXz4wesCZ5Ewizhe41ae03G9l7
 Ie7hwMMCtfY+6YHTiurJvysmM4O3xbNuT72WcW7tsVFtEhF/b5L+KpmhkVASOIUHU0kN4HY25yj
 +YEmO7nwqzinwekeSvshz3bYVFjAYj1/jnbpJqXOwG4tMkCyqnYQa0SLoM7upXLpQ==
X-Google-Smtp-Source: AGHT+IEXK6h1lriVkUgeA8NkzsgEpDjD4uXCqmEP1oor2nMQ4lKCeHQ2ggi4Xw9LEbdrlC3ZH0E/BA==
X-Received: by 2002:a17:903:124a:b0:215:5ea2:654b with SMTP id
 d9443c01a7336-21614d5435fmr111914685ad.1.1733576692163; 
 Sat, 07 Dec 2024 05:04:52 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 05:04:51 -0800 (PST)
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
Subject: [PATCH v2 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 21:03:13 +0800
Message-ID: <20241207130433.30351-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 124 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1

