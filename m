Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD401A2588A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78B110E4AB;
	Mon,  3 Feb 2025 11:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TF6Gmhyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87B710E284
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 11:52:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso75497975ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738583545; x=1739188345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
 b=TF6GmhyqHM8NlLhfdnC4NKEfiJzYYHHhDLK100SkE9z3MjFhitMqpuiP5+SdT772Wx
 FJFlj8/JxDHZHX6VNjbr5rFf30p+jQ9F5XqPNXxwQzvKmTFElfLt0nB1he/ErietRA6/
 Z2YUgZfbZKdlzo1DfUvAtFXhMkLjYF/n4xNIIDl5aVBIYKJzdR+iW0ShKK+il1RSFLcm
 +PgRrhTPCdszlXTpRiH6uuhMsdq6qFL6mcPnDKp2XkS1GxK4uDwOTOnMzrqqeb0HnjwM
 1WrS+6ZHkg39JGtms5y1HLuyJbWxMx0DCSG27p5e77rTRAlNCzI5gOOTNv3/Qra1/iPk
 cC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738583545; x=1739188345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
 b=SzASNVRqq51BtbFcZ8F2uX2dNJMa4/o0IL/adRZaANr1dfSWv5Dq6gdL0w775me13E
 3/JEUMJ7etUtvRDPG/QHlVMRMm/5XvWY6POW+6R7qOeo5RNFvWrEB91MJ7vzP1nm2HLO
 g2oSh7moUQy8i9C5ehHm7KuOiy6N1cC+q5yfY77RRLblNy0jNvjFnXMM40RRAAUT68Qp
 tNKNsKl04nLNtlAwYA8KFqwNo6LdPE2pzWbqlAs+MH/jfC5T4PSFGwIPtqWCJy4PmE/r
 PAAzXO5MSZrmgz927sA0AM47T5gm+D2EzTOo0Xk3oOc0D7pMnUe+cDExl3HxvPD/K4ru
 Zo3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfJVf/chnnZ6XmcuVm9GjYArmpny6FycyWUhuDQi444rSJz7c7wywAFW/zI29mur3YSc0EWK4VO0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOuMZwLvrCkZs0fFjmMbSdCT5FUWmMl9E+UzDxnXr1c3AGlA+X
 2NQzrK/7VjgDHnn9wgTvBPOqNzvglTsQh7tgMo3h4aLIuX5tO8t5
X-Gm-Gg: ASbGncsJSret2AdsNktfcd6btRitaNksQg9Gtc//4dkB0kNBymihus2iXk+UHiRA5zy
 rki2xpXt95oZdpKuO191b/icT/kslN+K8LABEBj2x8iRa49j8RH+rPQWvAVH9xFdTElC/uRTzk8
 aI+Nqzw+8z9ynEKgLoq9lQC9Av+QeXE5a18hA4/NoexW86+PE+5rbWrH3DYRXPCU2inQ4pJigu7
 Md23BIKOrdYOpycpp2yXFtJr1vM0zTsGqw/h33Qb1/6CEq2ZmzYM4uJqa2SFlUbfJLzziMIFPwP
 ZvhJSRGyd4wQehGy
X-Google-Smtp-Source: AGHT+IEdhLM08AT2wmM/NO7irAEic85WuehISVFGzdIXsWFirVgVJJVcaDE2suDIVnMIJ/r8VGZqsw==
X-Received: by 2002:a05:6a21:998a:b0:1d9:3957:8a14 with SMTP id
 adf61e73a8af0-1ed7a5c22a1mr33704475637.1.1738583545121; 
 Mon, 03 Feb 2025 03:52:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 03:52:24 -0800 (PST)
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
Subject: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:31 +0800
Message-ID: <20250203115156.28174-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
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
- Indicate that the backlight scales linearly

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


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

