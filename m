Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F26FB94D
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839910E17C;
	Mon,  8 May 2023 21:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F4010E17C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:20:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f13bfe257aso5705769e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683580817; x=1686172817;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IGmMY4cFYvub/clQpB9xxbh8ZPTyTBA5bKwsVjExFt8=;
 b=hnDIGupHnzHEc4dn/xiFRx2xgE0PKkJ2mto8ff+Kf8c6LDZ58V3IYyWjMNUwp2Hm+W
 DRKUFeRCHtdkcSruq4m7qJStKaSAlicxluxyTXJgvO9mLLCAkTlsnpgQZ4ftjzex5qJG
 cqCkuY7qP4Ifn+d6+p0uFdza2LUY5cHBUGFYC0gjgS6WUz1LlhbhFSkUfTSgZ/1aC27P
 +nJQrbzs0vXwF9HrYfTcolEb9FnMHclNWNauzeCYOSOa8+G9U8o5wXcWDxyxhIqcaBUP
 kl2g4S/o5B8f5w9oa/ijh2CbkxzP1JzPxwj7jAqkapA2qsqFFQt+8rczVzeguZILpoVY
 BjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683580817; x=1686172817;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IGmMY4cFYvub/clQpB9xxbh8ZPTyTBA5bKwsVjExFt8=;
 b=DWKQxU1KTDFGMkWnBpMPNj39pgB7G+NKelOilyNL2HPj+cwIwxPMbwmBVQycIGvPor
 rqSKtfOBjR49mfRqx1DIdFBs9gP72Ujluiv9ax+xMftXlR0ELNDe0p1KUc1POezt8vVD
 tJv2jbJ3Xj1FgrKNuedCL/TnkXhhAFotgZKsoJwKUrnV0u8zLelJt1ZZp7M9AIUlTia8
 vIjzCxC3w9HdHkaE16meScvCezz9VHkLZucw8VmdzZ9lWxI0l9Sfabu7RsmDAhUp/K/Q
 XQXh7/i/YVptPbGGcYGVHGLvkgwerjIldqgFectbh9kgtqpZqFL1AAVCGIvqMHtsglrz
 EDlQ==
X-Gm-Message-State: AC+VfDwxf3Q6pGRVJ2xfDKysJtaCZD0g5Q9UoeD9dt0+8MIj0E6vMJz6
 jP7qrL1IbN+dTnGYIvkezzZ1VA==
X-Google-Smtp-Source: ACHHUZ5hMWUD2Rfk872Q5ABdWR0891gFHqp5vXyAmMCR5GLf9FGIiM4VlXZjdQViiPMYCvUsZc100A==
X-Received: by 2002:ac2:442a:0:b0:4f1:4a22:b2c5 with SMTP id
 w10-20020ac2442a000000b004f14a22b2c5mr109178lfl.55.1683580816653; 
 Mon, 08 May 2023 14:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 4-20020ac24844000000b004edc3bd7fa1sm102164lfy.201.2023.05.08.14.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:20:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/4] Fix up Nokia 770 regression
Date: Mon, 08 May 2023 23:20:05 +0200
Message-Id: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVnWWQC/42NQQ7CIBBFr2JYi0GgtrjyHsbF0E5booIZGqJpe
 nehO2NiXP4/89+bWURyGNlxMzPC5KILPge93bB2BD8gd13OTAqphFaC+3B1UNeCEw6EsfxzaSs
 QtTY1toblpYWI3BL4dizbO8QJqRwehL17rrrzJefRxSnQa7WnfWl/i9KeC25yqVEdrDD6dHMeK
 OwCDawAk/wDIguk0dipFiqtvyHqD4jKEDh0AhrT99DYD8iyLG9wrP+4WgEAAA==
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Helge Deller <deller@gmx.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: linux-fbdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent change to use dynamic GPIO base allocation in the
OMAP GPIO driver caused a regression in some OMAP1 boards.
This series fixes up the Nokia 770 board from 2005:
https://en.wikipedia.org/wiki/Nokia_770_Internet_Tablet

I don't know how urgent the fix is, you decide. For me,
it is fair if fringe systems get fixed in due time, as
they are hardly anyones main development laptop.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v4:
- Fix up the polarity issues identified by Dmitry.
- Fix all erronous device trees as well.
- Link to v3: https://lore.kernel.org/r/20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org

Changes in v3:
- Fix a compile error in the ADS7846 driver by dropping some
  leftover OF ifdeffery.
- Link to v2: https://lore.kernel.org/r/20230430-nokia770-regression-v2-0-984ed3ca5444@linaro.org

Changes in v2:
- Thoroughly rewrote the approach taken for the ADS7846 touchscreen
  following Dmitry's ambition to go a step further and take a swnode
  approach to this conversion: I'm fine with that, the patch just
  get a bit bigger.
- Picked up Ulf's ACK on the MMC patch.
- Link to v1: https://lore.kernel.org/r/20230430-nokia770-regression-v1-0-97704e36b094@linaro.org

---
Linus Walleij (4):
      Input: ads7846 - Convert to use software nodes
      ARM/mmc: Convert old mmci-omap to GPIO descriptors
      ARM: omap1: Fix up the Nokia 770 board device IRQs
      ARM: dts: Fix erroneous ADS touchscreen polarities

 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          |   2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                |   2 +-
 arch/arm/boot/dts/imx7d-pico-hobbit.dts            |   2 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |   2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                |   2 +-
 arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi |   2 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            |   2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi    |   2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi    |   2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        |   2 +-
 arch/arm/boot/dts/omap5-cm-t54.dts                 |   2 +-
 arch/arm/mach-omap1/board-nokia770.c               | 198 +++++++++++++--------
 arch/arm/mach-omap1/board-sx1-mmc.c                |   1 -
 arch/arm/mach-omap2/board-n8x0.c                   |  85 +++------
 arch/arm/mach-pxa/spitz.c                          |  11 +-
 arch/mips/alchemy/devboards/db1000.c               |  11 +-
 drivers/input/touchscreen/ads7846.c                | 113 +++++-------
 drivers/mmc/host/omap.c                            |  46 ++++-
 drivers/video/fbdev/omap/lcd_mipid.c               |  10 ++
 include/linux/platform_data/lcd-mipid.h            |   2 -
 include/linux/platform_data/mmc-omap.h             |   2 -
 include/linux/spi/ads7846.h                        |   2 -
 22 files changed, 273 insertions(+), 230 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230430-nokia770-regression-2b5a07497ec9

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

