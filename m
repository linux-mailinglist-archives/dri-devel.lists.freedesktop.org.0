Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33EA8938F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 07:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4410E0D9;
	Tue, 15 Apr 2025 05:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hRsrM6as";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDDF10E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:59:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54963160818so6312712e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744696763; x=1745301563; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HKAsQQ31HaeqnieY3QpbMjvyrHHsHhhxynf4LJdeVRE=;
 b=hRsrM6as02hg/FDlcS2JfNDXEO67zhZcNgtyCIr3e5y+Lm71c9pQxQbr7E0ifTTQpF
 C5uSPqrmVySnMokGXWxaRekXHvigPks9aZdEdj1DRD79bZetEZeR0CT8aF6t/gymjMZX
 VnW70xI/9eunUQuAVG4s7IRBcJp7Z27OnQvTYWUrOUq5xGWPi3Xj25MsWTB37cQd6+mj
 2UknOqozz4z5uUybImGCzGmtkoRpSkbZOaF4EFyA1o3LyYlmmBcsrSX/dQOtNJh3AwR0
 eGt3ueinR0vxVnv1gFvrgmZikI9PXW2QQDTqIl7k41bSIIRERrdaOnz1f6SsEMCANExh
 kpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744696763; x=1745301563;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKAsQQ31HaeqnieY3QpbMjvyrHHsHhhxynf4LJdeVRE=;
 b=K5+o4yMoARru1LfKpJmvLxPL0XOcQtoiwTt3s+saz4xnNTDEQYa8cPtwoHfS709WzI
 0KtI6Wlo1igRWjg0RKjeI0+Od5bT4j3JjbHX6ypSN1oyCx//VLCvkSQDL0sj2VFibWSl
 q+NQohZi1er2uXpqwaL9g9hh6weZHqfnkXhPV0/sV7iiBceeMcNHdHE0/C0jo+vdMH0J
 VwxVi/SDrcs45dHgdMFoxrtfO8N4CIop4qD3LeWVATjRddRXcHWCAFAlJ+A/oJ7TdfQ1
 ABZYwkQsqzskzcludLBpWHeKCjHBn0l8Mt0/xs7GP0K0VBvxN+lJnRapzAeNTdqYnBMh
 u3vg==
X-Gm-Message-State: AOJu0YwTbOO0JzbTlgJhEnFNwU4SMkC8J3xIqMt57LVQY8q6dEfo9xpi
 SEa1Vi0iWkSyoKTWWCSwLR0ORtoQbNpGznfdCLKCBet3MYMYz1VT
X-Gm-Gg: ASbGncuL6gkOhJvEMjzRFLZMHFryPv9yUt5RxpaWMgF5jKoi4+xBsWBCqEUfSkr7c3n
 Iik2uBm62flc6byc6oT8SGiQ74b0WQc3xTAecbb/O/77RO4ldee3JUA4agpc/iTK0ODJiumM1QS
 yrT77F06VVXTZsolbEydzvtem/alzTk7LLPgjFiL1EUAtNc4WuaJUU8mRYDJC0gN9UEtYbCl7V2
 X3hZaC4CcGLycZIVM+oAfEWFER1G9Rot42G8aBjQSVQINiVnKmneFiSryK4Ea9Z5pQZ1Pdw+pHa
 ii7LUBI+fRxp9zPSvU9DPoo9ItF9vRq5yIfHEHSmcPT6Ytr4gYpujotXpyHyuxU/Xs9oUk1RcQI
 WooM4DhJvA38a08jpI/M=
X-Google-Smtp-Source: AGHT+IF8+Ejb264AH5+djL4JLAXmUaTSHRl3I4zB5uwYZJaPJIfsyNBhhD1/+SfSFbJXq/PKfBiHww==
X-Received: by 2002:a05:6512:3b0b:b0:549:893a:1eff with SMTP id
 2adb3069b0e04-54d452947a0mr4474164e87.24.1744696762648; 
 Mon, 14 Apr 2025 22:59:22 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 22:59:21 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 0/3] Add support for Sitronix ST7571 LCD controller
Date: Tue, 15 Apr 2025 07:58:57 +0200
Message-Id: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKH1/WcC/2XO3wqDIBiH4VsJj+fwb+aOdh9jB2afJawaGrIR3
 fssKIId/j58XpxRhOAholsxowDJRz8OeYhLgWxnhhawb/JGjDBJBKE4TkoqijWvWK2ts4Q7lB+
 /Azj/2UKPZ96dj9MYvls30fW6J9ieSBQTzCVtyloD1MLc297419WOPVoTiZ2ZOBjLTFhVGZM/0
 Mg/xs+sOhjPjBFSag4OrFRntizLD+Fx/psKAQAA
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=0/iKWo+r1gsd20hjlsFUjIvxOQIo6ura3X6TyTbKPlI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWj4DdATMn7xfQ9ZrzuSjQFfm8ODmsQLUY8o
 Ddq39rD0F+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31owAKCRCIgE5vWV1S
 MsoiD/9nbU3ua17vEwFCYnM9/o3k0N1CdNygwBSP4HAskQfpqYdhJa9z/OX4cdNQAIeAN6NkCAn
 4hDc6NrNwB0/Z/RMPSfyrruV7LGXt7Jb1hHgzTBZbb7yNYPXw6XdeiHzyWzvSPJzRUxI3WhjLIt
 KI11y7uAi4138NVB/BvtgDVsOiw9LlJe0WrnkxY6g1NGk4fPGrC17Vb0GlaNFr6djHOB48pYA3T
 WzsD5rWhsVbb5qyP0nwBm42LdSKiPVoDfXHonpKhTetFtJF45ONOhj2WsnHNCpSheujgUU5fZMQ
 dQ+dTkfBpNyAnFyuHLGcCsVL6LpKmnZac8ibVpA3XkGRWcgnrxgXV0+nZX2qMntWK+hq+ybpl92
 lHcd4cYXTsWW0+8fqGloPYGZ236SRT6ZuFYBpvyEKjPATxZ57p21EUJBQcssv8X3fu9CqvoZjI9
 KUehoeBdfwJJtMO03uxyGCc0ifW/s/Jh/eL42MT6k78xdJRXEaLqFKZO6F6u7FXRzLIsMFSXZjE
 VIQRLscNdGEI2jINp4qfazuqaG//L4Y0cy0MmMrRLt3UzqNWb5SeIjivTAw6qhE/lSzSHTKwiIr
 QByG2vqtjwA7nmR4yJFSBVTllBJMp9IkAEL6EoIF76MLPLiUznfsY3praUmJaex1BZmZ1zL4hy9
 zjrq7F8VtGsw3gA==
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

 .../bindings/display/sitronix,st7571.yaml          |  73 ++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 994 +++++++++++++++++++++
 5 files changed, 1085 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

