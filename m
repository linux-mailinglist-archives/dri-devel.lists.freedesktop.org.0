Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC9A35577
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 05:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1929D10E459;
	Fri, 14 Feb 2025 04:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a0fCGx5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290610E459
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:04:00 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-220c665ef4cso22711075ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739505840; x=1740110640; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
 b=a0fCGx5II8MX8NltiWrIjopPMIRiZVGyomvJ5YSnALLku+cGKvphC+AQOx+8JBP1Jc
 r6i969sY4TF5Vc1p483YF2kTiXUSoosvlf9ULtWT8e3CKkv+T367pUWd/QrJzD8RIIPR
 BLaciTQgnbP6i24DrOJkUknDZxIgUhZp9jUJ4qTB2o4UENIvnvmk2FOILG3ANF9ulLrp
 AAbkRZtYFJEaBcQEUufnR4UpxRvhDiJTMnICSqsRKpv1m+ZNiJknew7OL4tJWsoNd40Q
 xlQ8eijJ12dpNJ/DgDPMO2DRIcjNfTwQThMMITzrZOSWnEgsS8CO+BtY4dTOhHZqvnh6
 AhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739505840; x=1740110640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
 b=hRheCYqi5FJzMLC1Pd222PgNZumQLRR2mxOVSRoiMLbifddmOg4OAqvXinrvegMz5n
 JMr34f/dqDlC86x9XKWgFra667PO9uL9p3Yli4MYTCBW6vCdSxPnLX1yggStH6GkzBAm
 duUTFPQiSkP2NaWLKmU+u29mT5D+Y6+hwpVGKrw6RYYEShXWDydHcyRzbnsz4EDgnR+y
 XDgCxquQEkVbcViAFB/KLbqMtVl2Dt514Dq1Yv8IQ2bT9+P+U3My4CAYZnMj3WLpFC5y
 uHTxsHSgT2D6/HiGF4Sat4pzF8+GbKTA6Ptx+bdsdZC6ac/oIOrVccMhxdfjqJ5C6OYj
 ahag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhzfaNC7zPHX4x62DkHpeQjWYaHPGetYx1VjfiwNSzS10xDDXOZj50Khu/OKMkOy5HDryBp0Dfipk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySS1U2zpWHHX+6sgsDw5oyxxX3Urc0Q36gA3lRU0gu5u0+zSZq
 RK2TgCmmNGA1JElkg+eZuqt3WxJMwssS8Q5IIxeXyTCzfYC7IZ4e
X-Gm-Gg: ASbGncszxmxpzVMTurJbQJo3q3uCiox7OBr96mjd7SIr3eJ5OvbXW+fJpmS3JbY54IF
 Bwjt87+a3VgbjHD1gm6OryHfR6rGh1OGW3n/6SqkaQbcnpQod1kMxqYrfJZ8aewwZ0UKIgvNevC
 IA904GSq9n/ObOeRQgStCr8Se1tnS0kCNHLUrHiyJeTHVe4TPXuAyRV+cTjX0Iq9PszeTiyWs87
 2Mqg6mLc1EUh4J88D4DAYPvJYl13X7cr05UDZsf69Mmv9fvqk5gk+HKQ0VrijsrvLPB+t+Lo+HS
 MEQgpFiDbiLJYV8=
X-Google-Smtp-Source: AGHT+IG/lvp3REMuEs1TqSkR5QKUuTnGFxemCOEmduTyXWx0aA8kwUQQ7GuOdHz5MXhdcM3OB4TycQ==
X-Received: by 2002:a05:6a20:c998:b0:1e1:b12e:edb8 with SMTP id
 adf61e73a8af0-1ee5e666792mr17049651637.30.1739505840029; 
 Thu, 13 Feb 2025 20:04:00 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 20:03:59 -0800 (PST)
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
Subject: [PATCH v6 0/3] Apple DWI backlight driver
Date: Fri, 14 Feb 2025 12:02:11 +0800
Message-ID: <20250214040306.16312-1-towinchenmi@gmail.com>
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

Changes since v5:
- Remove default y from drivers/video/backlight/Kconfig

v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmail.com/T

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
 drivers/video/backlight/Kconfig               |  11 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

