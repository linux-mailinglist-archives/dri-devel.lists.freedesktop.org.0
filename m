Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACADA9983D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 21:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668B10E13E;
	Wed, 23 Apr 2025 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVHb0E0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3B010E13E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 19:03:46 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54b10594812so158891e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745435024; x=1746039824; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=en/iBfwqsTMhKUTpB6sf23cFVGEzkH0eP0mb15QhBmM=;
 b=mVHb0E0nJ9J6qGyEJ6kO9FkOJFYHYeX1Ser7xtv2kN53DH0UscTTAHnNp/+L/Zzmk2
 UmDumoa5E0L194u/gQeWwOU3245CTexbRws1KgWdhS/hsP0XADr3A1wSBfBwkgrjj0S1
 P7+/ZumAiM/1g30kBdGVmKwRu7fenP8grLUMGK/jBlXuZeXtb9hflIdnecRD4sLMJW14
 TeJNOTY8nz5+fGvUVW65vixUzEXMXVVdZgxDFiNNQYxsVMi84UWFv2zIpgS+B5FPclfy
 H23aVVcDl4QYVqlSbrac3Y5cj+3kGyN0X8HwdlVNYYco6EhjAoTtH5GfrBxH8icGy/72
 zAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745435024; x=1746039824;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=en/iBfwqsTMhKUTpB6sf23cFVGEzkH0eP0mb15QhBmM=;
 b=gL9HmGA+LvE7zvftYb3LSoB7F1j49IxmmzaYqJ1iUq/3W3dKT3zTIkTLpJoY0xJi/V
 dbf8G4nCykrNrQU74/tXma6FGxVP5HlnnN2EE435WxoerGGcZrEKMG+3qnEAYrpEUPjh
 Oi8O3UvYx+uUaY36zCBGPXTfMZG0UmRUFFVkuiUnnkKq6fbS5OIMMkxrywnQfAN5H7Bv
 +vTz2dBfIf5WzBDUOSVN6uDl8o0dgeOuPxCMWs/9AbL/tLN79FIXgF34LNrQNb0tT7eh
 tpQV1T8sbx6092nzSyJd2BX5bxLTldxBlXNfdPAbB36DMJYDVs7EOwrxlYGT6KlF4JQE
 7YMg==
X-Gm-Message-State: AOJu0YzeS1A7NjWvYemYe0LW5ml6LxBD12UX8C97M0MWypHhzJvYL9Nq
 jMmSpv0grwqtT5GaRIqpcTDRAXY7RPnih7LHNpXHpvpPogFWHbGS
X-Gm-Gg: ASbGncuorX+rNjjNRB1pYbYSHj6CFFcRPr26pxJN/NZdqjcCL0Nc9Q9mdWh3U38tX4m
 8wr+oSQCVgqjdZnL+7t1eDsy2hDMK0qzLP6W3nIOfZzs6GnyJV2iVHaaWOQ37YheVADGUMVpz1d
 MDgFByj/CyJvVeTpZC7nhhKcYzYhMlxtJPEkk8Uml2dwRphcySCGgVy0iJBUcHhIk+44a/PRxkn
 g1rOIqzeF2xiBDrz5E8OWKvBEr5i7+FXUbtTv7kIfO1Ng2+8b3bb+ylxZULc9JeeVBwJu9/kUvw
 Ds6qTWlUumxNKxWV7iw4UxuAV9Q5kCimW/2uRGMySpL3hf0870kunWbV7kf90ML8qgFgts3l+n+
 aYoJ+mpyT
X-Google-Smtp-Source: AGHT+IHGsy4ep0gTADiRvsgTHa/MWPL+04X0Wk7QfSrqXoiPZZeHYrCbDgj3uF2zm3zBGOeFS2X74Q==
X-Received: by 2002:a05:6512:3b85:b0:545:c33:40a7 with SMTP id
 2adb3069b0e04-54e7c429f0emr12937e87.26.1745435023893; 
 Wed, 23 Apr 2025 12:03:43 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 12:03:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 0/3] Add support for Sitronix ST7571 LCD controller
Date: Wed, 23 Apr 2025 21:03:19 +0200
Message-Id: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHc5CWgC/2XOwY7CIBDG8VcxnGUDA1NgT76H2QPQqZKo3RTTa
 EzffUcTG7Ievwm/f3iISlOhKr43DzHRXGoZLzy67UbkY7wcSJaetwAFqKzSsl4dOi2D8ZBCHrI
 yg+DHvxMN5fYK7X94H0u9jtP91Z318/pOwDsxa6mkQd13KRAlG3eHcyynrzyexTMxQ8vsyoCZz
 c7HyB/o8YOZlvmVGWagVBcMDZTR/We2YRpXZpn5hDkk8inSB8OGgVkZMovgTXIIsTehZcuy/AF
 uVDjSeAEAAA==
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=wDlRwR+Zr8jVD3tfOS2Otjt+TATgoKLMCXzeY/ZwPw8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTl6+QXOcdrUB35k2619Mf1h1GPsTrmhrSqxq
 671/I5Nmw6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5egAKCRCIgE5vWV1S
 MgZ7D/4lvE1b1Ds+IWa+uRuXqlqGEHuAyml5i6axE9ie+xEIZgRHpIwZHTpWKy4ZNteUqrpJvYc
 RzptWInvlrDCH9jcX2XOQtZRJbFCpoBZyMWVNCHNpjOrrXqyyaP70FwTzbV3OZVzU1Ftso9NWgr
 RFFPRFbBA86wgVSn76en7ws7osPby480Qahc5pjFS+enl96w/YIGY9MNHkLg7qcMjMYy06L7OKS
 +ffhqPYJd+AX4u/XXSoSlI84AhnTgCdD6/Mr7RSoWLuOcyTz5tFNaxQCf0aY0YSwDle2eSAqWBu
 BXZj4Xu27Vqi/XIYkOcNvR0c+/9lXWM/+mrTUAnnLTvjPf36AIPL5jpI94BbI2FrpeGyLsZ8Og0
 F69Wn4PI+Cu6Q3I165EEod8y1Gsqrp9E3rGdOuCowq5Wn4JDCcK5oC16cEeq/CyKTFt7iKouLSt
 tXTEKOXUKsyaynphpbjXZvf61sG0it4uQ7A+kvTyECRcNQJ/o7/g/Dd8XP5Kj6sOddAyJupG8VE
 ss5XlHcASR0pEpXoekZRqKpK1wx9fMEUcZypjSs6DxqcO/b+FV0Y+8dJFaBoRxAIre+MeQASZ/H
 OjV5WIxamuGVwGnoVss0K2NoIJaXdNur34gzZgYW3YQMN7mip0h3S6tHa6YRaZp0wbuoxwBbvIB
 uaKJrqHLwHjNBGA==
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
The controlelr supports both monochrome and grayscale displays.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v6:
- Rebase on drm-misc/drm-next
- Silent checkpatch --strict warnings
- Link to v5: https://lore.kernel.org/r/20250423-st7571-v5-0-a283b752ad39@gmail.com

Changes in v5:
- Use bitfield macros where appropriate
- Add comments where needed
- Link to v4: https://lore.kernel.org/r/20250415-st7571-v4-0-8b5c9be8bae7@gmail.com

Changes in v4:
- (dt-binding) Add sitronix,grayscale property
- Describe why ignore_nack may be needed
- Make drm_to_st7571 an inline function
- Add support to clear screen
- Change from C2 to R2
- Add support for XRGB8888
- Use dev_err_probe() where appropriate
- Make Kconfig config depend on MMU
- Introduce device data to prepare for support for other chips
- Add support for drm_encoder_helper_funcs.atomic_en(dis)able
- Link to v3: https://lore.kernel.org/r/20250408-st7571-v3-0-200693efec57@gmail.com

Changes in v3:
- (dt-binding) Use 'Controller' rather than 'Panel' in texts
- (dt-binding) Constrain the reg property
- (dt-binding) Remove panel-timing description
- (dt-binding) Change description
- Mostly cosmetic changes in the driver code
- Don't call drm_atomic_helper_shutdown() in remove()
- Link to v2: https://lore.kernel.org/r/20250404-st7571-v2-0-4c78aab9cd5a@gmail.com

Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

 .../bindings/display/sitronix,st7571.yaml          |   73 ++
 MAINTAINERS                                        |    6 +
 drivers/gpu/drm/tiny/Kconfig                       |   11 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 1002 ++++++++++++++++++++
 5 files changed, 1093 insertions(+)
---
base-commit: e270b3665f8321c45ad3e9ba4e3d0fbaf8c9c720
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

