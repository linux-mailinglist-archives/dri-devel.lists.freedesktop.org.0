Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030BC437E4
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 04:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6010E045;
	Sun,  9 Nov 2025 03:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FWiQP7gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3A10E045
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 03:22:49 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-295247a814bso25283535ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 19:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762658568; x=1763263368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=309e2xiNVgkaFiSxGZQDDrS3Pr+1mEXfBB2ZrdJ+pPY=;
 b=FWiQP7gf4A1aJpajYuCHF/z4vQEodAoWhQ1p/mBx9mldreK9TQa3gEBxvctk+6Zu8F
 JzQCdkIJi6jxLxabshxPejJJuVgCYch/sz5QQMXbMIRaKmUVk3Pflh++8rU1FR1GFPmo
 LlbrDogOrScBGylZAHgyt1njAb15bAMz3xW3pz2Vg3+iaOJnKa4ajgjKRSxp7yLANA0e
 O5apyZcPlOnwZactU4VpnPmX3KSVK8z0kHyXEWZfi2XBwgiwtH+QxVt1iToOGNUW161r
 bqmZX6TtM+spKkQiJ2yQKfvmylQfQrZoYY4ltqPPoNxJZ3DYuVgYu+NkB98cvBAWhMRh
 aI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762658568; x=1763263368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=309e2xiNVgkaFiSxGZQDDrS3Pr+1mEXfBB2ZrdJ+pPY=;
 b=v23Q5wGpjudjrKh5QotYncO0jP5i3qiU+XXNgn5BtCSunRbNbykK9+iTWo1XH+wDD3
 8BPOMDSq6lr5vEyXwX6+EmxB4r+fZ+rr/u1ec799ypQRUTNmMMz7EUnaPyYdZMeIjo/J
 P/D1thGueSeOli41grPOYMYHKsreFSf5sFUOYGWPRNgSiwix/wnSFLW2EQ80BXIkZqzY
 lNZ84IMxf/ckBze5Cw0p1m+OGE7X/o0kyxWeKdCW+YwWqux5tSMba6WoKUilWCvZrV0H
 sAYu/G5f+bcRtKSA8XtHmP2ZPFsAEyxkzeU0MN9/wZktHP8X/kKtpGDwUM4z5aABsIni
 0vAg==
X-Gm-Message-State: AOJu0YwomCgppfXfTKy3mryMQMVuVLw/5eHR9iJ9oC2nTmUfqGUkORF+
 Jjuu2/Xk3VoDxrTutn6UIWd0/JgPkGlSWbR3MuPc4/xORM/DyeMcdVaC
X-Gm-Gg: ASbGncuf+rpKKAPzzRdjcwDhz1edsJ3IuBpNpNbUU4JV+dpR4LdyunA4dl5TaC0TKTR
 LJ1mx3tfA00axpMnO5GPEmlsXpKOeR7/8MByL0mXwmGcNQ2wdLPZl4BeKhkU4/AZR9j0Zcz60Ko
 9sJre7UzMaR6t8TnrSlkYZd2y45W6i7FlObHSqQry1/YRf5Jqc0XHVkz5LD0SkrAGq1/BlPPEtV
 c9DBKZ4R8g2ooHFIjfZ1kzCjPsZZbgCK0CIuJdM3BY2INSxHQTquQecOl7v7s8mtuyr2qrrp9Hh
 s5EzHm6nUx/fih0vxrcfLCsgf0dr6pvE7mVfuadzIhdfRDJu/h/y6vTCJBnctJPgKyQMjZV0vuW
 ycAd+ThER3cNLFAH+dyTknUKefWZ51PvR3Pc3I0A4AIrL4dPeg1FF52dmoGz/E7fvvHde2Bip3W
 +rqs/k3T3EWvyuuOvk2g==
X-Google-Smtp-Source: AGHT+IG+NU2yi/NgsNSjZY0ObuL/1G3s3dBw0Ad9cUlsXl76c/IPuu1PQw3w7qQoYNY21AsMnNqtwQ==
X-Received: by 2002:a17:903:94e:b0:264:70da:7a3b with SMTP id
 d9443c01a7336-297e570dd4bmr52150255ad.49.1762658568492; 
 Sat, 08 Nov 2025 19:22:48 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296509682casm101941215ad.22.2025.11.08.19.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 19:22:48 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v3 0/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Date: Sun,  9 Nov 2025 11:22:38 +0800
Message-ID: <20251109032240.3422503-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add support for Awinic AW99706 backlight, which can be found in
tablet and notebook backlight, one case is the Lenovo Legion Y700
Gen4. This driver refers to the official datasheets and android
driver, they can be found in [1].

[1] https://www.awinic.com/en/productDetail/AW99706QNR

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
---
Changes in v3:
- remove the shift field (Daniel)
- use FIELD_PREP() to replace FIELD_MODIFY() (Daniel)
- include init table into aw99706_device (Daniel)
- breaking a long line (Krzysztof)
- rename backlight node (Krzysztof)
- make aw99706_regs static (Krzysztof)
- return -ENODEV if it is a unknown chip id (Krzysztof)
- use __ffs() to handle shift, since mask is not compiletime in for loop
- reorder functions and structs
- Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-1-caojunjie650@gmail.com

Changes in v2:
- add handler for max-brightness and default-brightness
- add properties(max-brightness, default-brightness) (Krzysztof)
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- include default values in the aw99706_dt_props table (Daniel)
- warn when a property value from DT is invalid (Daniel)
- drop warning when optional properties are missing (Daniel)
- add a function pointer into the aw99706_dt_props table to handle lookup (Daniel)
- use a lookup function instead of hardcoding the formula for the iLED max (Daniel)
- move BL enalbe handler into aw99706_update_brightness (Daniel)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-3-caojunjie650@gmail.com

Junjie Cao (2):
  dt-bindings: leds: backlight: Add Awinic AW99706 backlight
  backlight: aw99706: Add support for Awinic AW99706 backlight

 .../leds/backlight/awinic,aw99706.yaml        | 101 ++++
 MAINTAINERS                                   |   6 +
 drivers/video/backlight/Kconfig               |   8 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/aw99706.c             | 471 ++++++++++++++++++
 5 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 create mode 100644 drivers/video/backlight/aw99706.c

-- 
2.51.1.dirty

