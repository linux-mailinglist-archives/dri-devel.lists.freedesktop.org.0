Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DBA7BE4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3FC10EBCF;
	Fri,  4 Apr 2025 13:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZTP0AKrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC17310EBCD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:51:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54ac9b3ddf6so1942110e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743774658; x=1744379458; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cCGlLG2iHtytohZhZKlz2DSZKkgEAMa/DMrE1qjBDGM=;
 b=ZTP0AKrXkf9QynUP0XgkvfxEglXlqJE+Eykv8irSM83dR7YjB7l88rUYaGv7KgJh+N
 4zUKRJ+Wzulyw0UDTUO4EdE8DYdm0Hf2am42RQ0WambdRSrugmAjdbC60OCtbDP3+MmK
 DsN0cD1EnnwJe2lT1biPLF1N6n5lj2LkieWbvHr7a1jz92YrrrRutGdwdu4OGA0u6DFi
 6BCJS5T0OE1VyAzUZoyceP306818UbvTOkHFYs0gloXkLmRwThHTdhXklg2Jw54Wlgde
 lUdjc09te21LlOfWnMDOcWnMr6Uj+MQfEExbQ6uni0e1WDNNU7TCuIaFqJt5VaXnAkUr
 vY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743774658; x=1744379458;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cCGlLG2iHtytohZhZKlz2DSZKkgEAMa/DMrE1qjBDGM=;
 b=Ez2iQNB8tbcaB9wfgjLMBzjCuOlWRmmLvFeaCRMpRB12t/cF2T04DIE0ljQG7IFCDO
 ZAVkZD9S+a8g+lq8VH26GC6iNu4isvqcCpvyPMtMf3Pl+1N/7LCIHQGxWNcVCa+A1A+0
 Du+9J2xnfB3/+ivULKgb/bn54so42xIRgwbCao3t48aUyYSzE6Hx7BZ0woLFQYXFaTvh
 izloucqekexCJrekHjyaz2yvNQ4QNRL/B6eF3lfUjR7xMFYysC7aLKNfqnzsSXV5Sz3f
 CHJFjpSmFr65GncpMUfZpRysoEYloSi/L8I6LbjlBumBFum8zATVC0n43xKHNPOPyJZL
 o2rw==
X-Gm-Message-State: AOJu0YzUO/3W2PH35RR2yUZ0o+Bhe1CrnDV4w62KKQT2UrphR72fmwa1
 +KlzvRMC9/3WnQVRQvvgExHwmZGLWcduCCasMdggtFYfhNsyPBWo
X-Gm-Gg: ASbGncsDIUJ6aNib3Jy8KuEmyzkrc2xEBgluEOlq/u2zdTp6t70oem9M2g4Im2Ytl8/
 fQGsdwcIsQRDvMifMGY0kZYrUyLb9pWUJZyESyHXz2RxeQElGnCVduRipqVMuvNvp/DCpo4/fUc
 /SOfp5BLPSRHHyuM8N0HX2coqcAqoYC6YBDy6BOerwCPwwQ+PCsWfOBCtpdhtitzMXakw+nDSEY
 NpGvg+g4TWgvwtRxnuPoD85QvGIyFVfibowaEcEUbbcTJRf/GMGXlNK2llrrr8VLTeYRMeibJe/
 itkE0cfkszWCw1gDcF1KStLe2eVEz1vmn/TVCJH6byN0cmFSNeQsdtkBVla9yGbsiCaY66AjI9e
 Y/3XxktZKqCP6JffMaTcMc2ZA
X-Google-Smtp-Source: AGHT+IFSrSttsSE4MU1Mk7zmK95JgwzJ/3t6TQITIO2ULof82nLa8JgXrAys8wyTLvDhwm1+3gcSuw==
X-Received: by 2002:a05:6512:3da0:b0:549:8f47:e67d with SMTP id
 2adb3069b0e04-54c2278b06cmr1001454e87.34.1743774657464; 
 Fri, 04 Apr 2025 06:50:57 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 06:50:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/3] Add support for Sitronix ST7571 LCD controller
Date: Fri, 04 Apr 2025 15:50:31 +0200
Message-Id: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfj72cC/zXMQQ6DIBCF4auYWZcGUGrpqvdoXAAOOkkVA4a0M
 d691MTl//LybZAwEiZ4VBtEzJQozCXkpQI3mnlARn1pkFwq3nDB0tqqVjBd36XVzjteeyjnJaK
 nzwG9utIjpTXE7+Fm8V9PQp5EFoyzWon+ZjWibcxzmAy9ry5M0O37/gMwabB8nAAAAA==
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=KM16sgTNvRvbJg0m55JE30pDne9XoFpHhIalYoOmghY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+Osqu96HCbtIQ2AggwXIp1BUNgmxz2AxKm+0
 C9BmuH2VQKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/jrAAKCRCIgE5vWV1S
 MoPlD/90YFLZy0IiD76aYxfa48IfgxJ3RjJQKXM3Z5mkJbiJ3G9K6H7F+qDjw6EzKWFMG+WO0eN
 u6ZM9MTHmX/RYhtSp9bCyBrXy3fTxbeio/LqVKYmrOXDlznltLaOJUbQXgee/9+t3tzRexQTSw6
 d1PDjF2Ewvk7dmVeAkP6h2c+XGY4gbfI4KRM4wopsWRrWo2jvn4utIJusMO1S2UKezsvMNGJ/So
 Av7i4/sC4Nn8JqzKbz7fI0gOsxQ0KmJG5wjhB1Mjs/Njdbdpq36TJnMSxIs19/zp8nlfQhn8Ry/
 /b13Q5s+PTULqEiwRoGkrrVPn3L26DF5bKq4KRgfK3KBZFWty3rWUIxyeBCza3q/1kWIaVeaeOk
 q1IkQjTjk0Vipl3us2VN6F55c/Ey2Ke0NW9LIPBZPmASJXRmLr0GPyHQAAG+Fd9c9BtZEJqMRob
 6PBPe6P3R3v+aPyi6FBl3x9ACs7QozJJsQKCFtrkUdc+LsjN4HkzzGUP3k0Xj6k+WCe3HCfwvly
 1WA/K37gzy0g3wAwj/EpZ31LyRlcsAN5Dfc1UndPRWuFGGpj8SAwA6Ljcbahpu7ISsEHX1G5fQp
 DaO1SHFXyQwtrTAGBlP+IAQULBxY6Vmo4/8wXc8gC3VPel09WsxhdsEF+zDLJOeNZwBCVcMeWTn
 0ux9tTEKSOBrkvA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 panel
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add antry for Sitronix ST7571 LCD controller

 .../bindings/display/sitronix,st7571.yaml          |  73 +++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 720 +++++++++++++++++++++
 5 files changed, 811 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

