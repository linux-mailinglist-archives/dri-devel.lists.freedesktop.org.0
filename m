Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C16F7EB2
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 10:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237F10E214;
	Fri,  5 May 2023 08:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17010E214
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:23:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4efeea05936so1646833e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683274984; x=1685866984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wnd/xQ9KZ246IQDxJ2NOt5q5tpp1CWxMQbhMQ4P/5po=;
 b=iTkAyCNQZIDmc7TsUIJSK2Z751T4I7mzLgK0CQ4gMufVO4DZ3YIUcqyRAYY6pvbTWj
 zhv08bKk2h3HMZMhokO2mX3ooVPioEum5wcb7WZmIVj6Fjn5rwgHknTUbSXIsUWrn6SF
 c0QoKwwnVoNoSjl7FeewCQLx3tEwn+CozU09keA8foFgOx/WruDRUZyC7Dsr0w4NaFeG
 sFAS/r4ItUvq8jJgN0H5Y3tsHHds4dq1945O4WyF7GPHu0Y6S4R4lqM+6IbI62WI68aa
 BiePUnvCYwvxJ40PA8E4RGNVc8WGFZIky57bNprYuBJVw1XB2sOKGCHdxGIWOH0Hgceh
 +zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274984; x=1685866984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wnd/xQ9KZ246IQDxJ2NOt5q5tpp1CWxMQbhMQ4P/5po=;
 b=EO0mtmJh0mNDz4GFEexNSU2xIjEARPbV1j3W3NhnatFJVZL2ki+Mmq1HejV68Hu7Et
 Sc+9uJrKnEygc3HA977lNKrEAXuJG/KMskbxVPrfBOFCmQ74pAVrLorNcr6va9YiwgrN
 hJfNToi8h4/Dy2QU1TqyxrMgsO+OVF9ut1hi1cmCRfcpGcdPpnpHmOp0eiYZ54hGfh0f
 nVZ9Cvm1nkriwWecjWC7xGAy+1Z2d4dk99wneWYsVeQShqcbcgrF8L3Tbr/tu1xggUuB
 mlH3LT7LvOjW/K748QWQUIMtfuFvm/4Vqk8C7DxmFpuZAqsN7Fca+u9bvt4BQbH2swdU
 pcOQ==
X-Gm-Message-State: AC+VfDxqpS7/s/eaIAtwjUNbqJUCRSSbmXb+ox+2jqNPT9kSmylisJeN
 Y9fhpHltFu7Q1PMacIZ9WzMltg==
X-Google-Smtp-Source: ACHHUZ72VNoJxBvksLAw/aSFYz4OGaMDpRtLO5cqt4SyXRbTqQwJbV+BjsXJPzKO1UcDj5nh4IOjIg==
X-Received: by 2002:ac2:5990:0:b0:4ed:d5b0:7fd9 with SMTP id
 w16-20020ac25990000000b004edd5b07fd9mr281906lfn.19.1683274984113; 
 Fri, 05 May 2023 01:23:04 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 h8-20020ac250c8000000b004d023090504sm200647lfm.84.2023.05.05.01.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 01:23:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] Fix up Nokia 770 regression
Date: Fri, 05 May 2023 10:22:59 +0200
Message-Id: <20230430-nokia770-regression-v2-0-984ed3ca5444@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOO8VGQC/32NTQ7CIBBGr9KwdgylKMGV9zBdDHVsJyqYoWk0T
 e8ueACX7/vJW1UmYcrq1KxKaOHMKRYwu0YNE8aRgK+FldGm07bTENOd0TkNQqNQrnsw4YDaWe9
 o8Ko8A2aCIBiHqX6fmGeSWryEbvz+6S594YnznOTzsy9tTf+LlhY0+BJa6o5Be3t+cERJ+ySj6
 rdt+wI3YvGW0AAAAA==
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
Changes in v2:
- Thoroughly rewrote the approach taken for the ADS7846 touchscreen
  following Dmitry's ambition to go a step further and take a swnode
  approach to this conversion: I'm fine with that, the patch just
  get a bit bigger.
- Picked up Ulf's ACK on the MMC patch.
- Link to v1: https://lore.kernel.org/r/20230430-nokia770-regression-v1-0-97704e36b094@linaro.org

---
Linus Walleij (3):
      Input: ads7846 - Convert to use software nodes
      ARM/mmc: Convert old mmci-omap to GPIO descriptors
      ARM: omap1: Fix up the Nokia 770 board device IRQs

 arch/arm/mach-omap1/board-nokia770.c    | 198 +++++++++++++++++++-------------
 arch/arm/mach-omap1/board-sx1-mmc.c     |   1 -
 arch/arm/mach-omap2/board-n8x0.c        |  85 +++++---------
 arch/arm/mach-pxa/spitz.c               |  11 +-
 arch/mips/alchemy/devboards/db1000.c    |  11 +-
 drivers/input/touchscreen/ads7846.c     | 101 +++++++---------
 drivers/mmc/host/omap.c                 |  46 +++++++-
 drivers/video/fbdev/omap/lcd_mipid.c    |  10 ++
 include/linux/platform_data/lcd-mipid.h |   2 -
 include/linux/platform_data/mmc-omap.h  |   2 -
 include/linux/spi/ads7846.h             |   2 -
 11 files changed, 260 insertions(+), 209 deletions(-)
---
base-commit: 348551ddaf311c76b01cdcbaf61b6fef06a49144
change-id: 20230430-nokia770-regression-2b5a07497ec9

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

