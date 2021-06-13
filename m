Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007473A5DB3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795A89AC0;
	Mon, 14 Jun 2021 07:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352A89CE1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 23:31:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id g204so11022870wmf.5
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iK+fdotc8MDTLXOWsCA+bd9ELHLX8yC6MN1FxLYw3Rc=;
 b=ZBhL+xgB8mqWh3eLJJg3Z/iYwp+jlCYPiX8tmO8GhAowJpOg07QRw/MEPdckTj/kp+
 ICniI5hVwGsS2PIQIlWz7735puYXK6TjX8gWwBgKxk0KY9JxzNDK4HNgatOrSXbe0Lc2
 RF0bXch20IlR9KFs1iQsEc71ZlALOhvwrD83oO0VUwuxRnCiT+evKwNP8clkkhJYsdLG
 2v3+5cf4d/Y1NCYCiml07nL8BeVVxec9FZ3KQ80Bn22GIvZNAaaBk93WERvanqg9kWA0
 ZPH0exFbl36gqe7DWFdUYcjT3IueXbJU+jsky+TmkOdUHxBzQ1/+qlZBtvQrxT8vDCzz
 AoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iK+fdotc8MDTLXOWsCA+bd9ELHLX8yC6MN1FxLYw3Rc=;
 b=NVFZsqPBxpobQgcFW0LO3e3zxhCEgMfJ1VeZOSysvBiNrbk34gUcikhp5PCTnizphF
 EexpyDoTdUraMyaPu4OJB0eMdM1v6a0/Y0SA03vtgIEhTVm25sGI0ab/0YiOjtVOlRtI
 8OVcc0meQIrNZ2lvai8AG9A5sy/SpZZtQ7fTw0SHZdxxrjtm75jKOo6OCZ7ekSy/bkou
 hG/4Ecpyq4D+LNDsOd+RsCuXfrGi36ZCkvnJstRXUnNDokF+FVkd8T7vPW3hFeO0mTky
 7VaCQ9j6uQ7+0TQCQZv2kv7F/VbMxA7fIdFZO75BLqxc3hE7oc4/NbPjqQwBNVMK4jHy
 5M2w==
X-Gm-Message-State: AOAM531lWfkNO6Obp1bOBlWNkuEli+9VWErW3n7ItdXLqh/gCi8o/hcY
 +UgP1XzwDA5HiExJfI2DOIw=
X-Google-Smtp-Source: ABdhPJxxWZyZQBZ1JBZMI/iWKh4B0GGXrb7nldKK0n8tdDlT0f6lu/3UG+BAm2A+FtPRs1yAgbiy6w==
X-Received: by 2002:a7b:c304:: with SMTP id k4mr29800169wmj.68.1623627079836; 
 Sun, 13 Jun 2021 16:31:19 -0700 (PDT)
Received: from localhost.localdomain ([195.245.23.224])
 by smtp.gmail.com with ESMTPSA id i9sm17882511wrn.54.2021.06.13.16.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 16:31:18 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Subject: [PATCH 0/7] Prepare EP93xx drivers for Common Clock Framework
Date: Mon, 14 Jun 2021 01:30:34 +0200
Message-Id: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Jun 2021 07:29:40 +0000
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
Cc: linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 dmaengine@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-spi@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nikita posted a patch converting EP93xx to use Common Clock Framework. It
turns out some cleanup is necessary in the EP93xx drivers to avoid
"Enabling unprepared" clock warnings.

Patches with stack traces in the commit messages are tested on EP9302.

Link: https://lore.kernel.org/patchwork/patch/1435884/

Alexander Sverdlin (7):
  iio: ep93xx: Prepare clock before using it
  spi: spi-ep93xx: Prepare clock before using it
  Input: ep93xx_keypad: Prepare clock before using it
  video: ep93xx: Prepare clock before using it
  dmaengine: ep93xx: Prepare clock before using it
  ASoC: cirrus: i2s: Prepare clock before using it
  pwm: ep93xx: Prepare clock before using it

 drivers/dma/ep93xx_dma.c               |  6 +++---
 drivers/iio/adc/ep93xx_adc.c           |  6 +++---
 drivers/input/keyboard/ep93xx_keypad.c |  4 ++--
 drivers/pwm/pwm-ep93xx.c               | 12 ++++++------
 drivers/spi/spi-ep93xx.c               |  4 ++--
 drivers/video/fbdev/ep93xx-fb.c        |  4 ++--
 sound/soc/cirrus/ep93xx-i2s.c          | 12 ++++++------
 7 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.32.0

